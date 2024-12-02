import sys
import pickle
from collections import defaultdict, Counter
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
import numpy as np
from rgl_learner.utils import *
from scipy.stats import entropy
import re
from random import shuffle, choice
from Levenshtein import ratio, distance
from pprint import pprint
import rgl_learner.plugins as plugins

normalize = lambda x: x # re.sub(r"^s;", "",x).lower()


def form_token(stem, pattern, labels):
    """Form tokens based on predicted forms by
    matching patterns"""
    token_dict = {}
    if pattern:
        base_dict = parse_pattern(stem, pattern)
    else:
        base_dict = {"base_1": stem}


    for label, (form, _) in labels.items():
        label = normalize(label)
        if form != "nonExist":
            for base, morpheme in base_dict.items():
                morpheme = morpheme[0] if type(morpheme) == tuple else morpheme
                form = form.replace(base, morpheme)
            form = re.sub(r"base_\d", r"", form)
            token_dict[label] = form.replace("+", "").replace('"', "")
        else:
            token_dict[label] = "-"
    #print(base_dict, stem, token_dict, pattern)
    return token_dict


def format_unimorph(tokens):
    """Format output to unimorph format"""
    unimorph = []
    for pos, lemma, forms, true_forms, y_pred, y_true in tokens:
        for (tag, form), true_form in zip(forms.items(), true_forms):
            um_tag = ";".join(
                [
                    pos,
                ]
                + [gf2unimorph[t] for t in tag.split(";") if t in gf2unimorph]
            )
            unimorph.append("\t".join([lemma, form, true_form, um_tag, str(y_pred), str(y_true)]))
    return "\n".join(unimorph)


class LemmaTree:
    def __init__(
        self,
        pos: str,
        lemmas: list,
        forms: list,
        test_lemmas: list = None,
        iters: int = 1,
        max_depth: int = 3,
        min_sample_leaf: int = 3,
        min_examples: int = 1,
        t: int = 200,
        how: str = None,
        stopping: str = None,
        split: bool = False,
        sampling: str = "oracle"
    ):

        self.pos = pos
        self.forms = forms
        self.sampling = sampling
        self.iters = iters
        self.other_forms = []

        self.form_distribution = [dict(zip(reverse_dict(p.typ.linearize()), p.forms)) for p in forms]

        lemma_form = [form for table in lemmas for form, word in table[1].items() if word == table[0][0]]
        mc_lemma_form = Counter(lemma_form).most_common(1)[0][0]
        self.other_forms.append(mc_lemma_form)

        if split:  # different ways to split data to train and test
            if test_lemmas:
                train = lemmas
                test = test_lemmas
            elif t and t < len(lemmas):
                shuffle(lemmas)
                train = lemmas[:t]
                test = lemmas[t:]
            else:
                train, test = train_test_split(lemmas, shuffle=True)
            labels, self.train_tokens = list(zip(*train))
            count_labels = Counter(list(zip(*labels))[1])
            self.train = [x for x in labels if count_labels[x[1]] >= min_examples]

        else:
            train = lemmas
            test = train
            self.train, self.train_tokens = list(zip(*train))

        self.test, self.tokens = list(zip(*test))

       # print(len(self.train))
       # print(len(self.test))

        if stopping == "max_length":
            self.max_depth = max([len(x[0]) for x in self.train]) + 1
        else:
            self.max_depth = max_depth

        self.min_sample_leaf = min_sample_leaf
        self.rules = defaultdict()
        self.regex = defaultdict()
        if how:
            self.how = how
        else:
            self.how = self.define_affixation()

    def define_affixation(self):
        prefix_count = 0
        suffix_count = 0
        for p in self.forms:
            for token, _ in p.forms:
                if isinstance(token, str):
                    if not token.startswith("base_"):
                        prefix_count += 1
                    if not token.endswith("base_", -6, -1):
                        suffix_count += 1
        if prefix_count > suffix_count:
            return "prefix"
        return "suffix"


    def calculate_error_rate(self, form, true_value, pred_value, dist):
        pred_value = pred_value if pred_value else "-"
        if self.sampling == "oracle":
            return form
        elif self.sampling == "edit-distance":
            edit_distance = distance(true_value, pred_value)
            return form, edit_distance
        elif self.sampling == "entropy":
            possible_forms = []
            for d in dist:
                if form in self.form_distribution[d]:
                    possible_forms.append(self.form_distribution[d][form])
            form_prob = [possible_forms.count(f)/len(possible_forms) for f in set(possible_forms)]
            return form, entropy(form_prob)

        return ""

    def coverage_score(self, token, forms, dist=None, input=[]):
        errors = []
        coverage = []

        for form, value in token.items():
            if value != "-" and form not in input:
                if forms.get(form) == value:
                    coverage.append(1)
                else:
                    coverage.append(0)
                    #print(forms.get(form), value)
                    errors_by_token = self.calculate_error_rate(form, value, forms.get(form), dist)
                    errors.append(errors_by_token)
        return coverage, errors


    def update_rules(self, label, value, prefix, cur_form, entropy,
                     class_dist):
        """Update rules if there is no repeating information"""
        def check_one_form(form, label, value, prefix=[]):
            found = False
            for i in range(len(label)):
                if self.how == "suffix":
                    prev = label[i:]
                else:
                    prev = label[:-i]
                prev_prefix = tuple(prefix + [(form, prev)])
                if (((form, prev) in self.rules and self.rules[(form, prev)][0] == value) or
                    (prev_prefix in self.rules and self.rules[prev_prefix][0] == value)):
                     found = True
                     break
            return found

        if prefix:
            if self.rules.get(tuple(prefix)) and self.rules[tuple(prefix)][0] != value and not check_one_form(cur_form, label, value, prefix):
                rule = prefix + [(cur_form, label),]
                self.rules[tuple(rule)] = (value, entropy, class_dist)
        else:
            if not check_one_form(cur_form, label, value):
                self.rules[((cur_form, label),)] = (value, entropy, class_dist)

    def calculate_entropy(self, labels):
        """Calculate entropy of given label"""
        label2entropy = defaultdict(list)
        for label, tags in labels.items():
            lemmas, classes = list(zip(*tags))
            classes = Counter(classes)
            class_dist = {
                class_name: one_class / sum(classes.values())
                for class_name, one_class in classes.items()
            }
            label2entropy[label] = (entropy(list(class_dist.values())),
                                    dict(sorted(class_dist.items(), key=lambda x: -x[1])))
        return label2entropy

    def build_node(self, lemmas, position):
        "Building one node and split"
        label2classes = defaultdict(list)
        for lemma, tag in lemmas:
            if len(lemma) > position and lemma != "-":
                if self.how == "suffix":
                    label2classes[lemma[-position:]].append((lemma, tag))
                else:
                    label2classes[lemma[:position]].append((lemma, tag))
        return self.calculate_entropy(label2classes), label2classes

    def build_tree(self, lemmas=None, position=1, prefix=[], cur_form=None,
                   add_all=True, entropy=10000):
        "Building a tree for a given form"
        entropy_scores, label2classes = self.build_node(lemmas, position)
        position += 1
        for label, (entropy_score, class_dist) in entropy_scores.items():
            if entropy_score == 0:
                self.update_rules(label, label2classes[label][0][1],
                                  class_dist=list(class_dist.keys()),
                                  prefix=prefix, cur_form=cur_form,
                                  entropy=entropy_score)
            else:
                if add_all and entropy_score <= entropy:
                    maxval = next(iter(class_dist.values()))
                    res = list(filter(lambda x: class_dist[x] == maxval, class_dist))
                    if len(res) == 1:
                        self.update_rules(label, res[0], prefix=prefix,
                                          class_dist=list(class_dist.keys()),
                                          cur_form=cur_form, entropy=entropy_score)
                    else:
                        classes = Counter([x[1] for x in lemmas if x[1] in res])
                        maxval = max(classes.values())

                        for i in res:
                            if classes[i] == maxval:
                                self.update_rules(label, i, prefix=prefix,
                                                  class_dist=list(class_dist.keys()),
                                                  cur_form=cur_form, entropy=entropy_score)
                                break
                if (
                    position <= self.max_depth
                    and len(label2classes[label]) >= self.min_sample_leaf
                ):
                    self.build_tree(label2classes[label], position, prefix=prefix,
                                    cur_form=cur_form, add_all=True, entropy=entropy)

    def fit(self, forms=None, start=0, prefix=[], new_form=None,
            required_forms=[]):
        """Fitting a tree with several forms"""
        score = []
        cov = []
        code = ""
        for i in range(self.iters):
            if i == 0:
                prefix = []
                self.build_tree(self.train, prefix=prefix, cur_form = self.other_forms[0])
                preds, scores, avg, length, errors, forms = self.evaluate(i, test=False)
                print(scores["coverage"])
            else:
                all_forms = {}
                for (affix, entropy), form in forms.items():
                    lemma2class = [
                        ((tokens[new_form], tag), tokens)
                        for tokens, tag in form]
                    self.train, self.train_tokens = list(zip(*lemma2class))
                    if self.train:
                        self.build_tree(self.train, start + 1, list(affix),
                                        cur_form=new_form, entropy=entropy)

                        preds, scores, avg, length, errors, new_forms = self.evaluate(i, test=False)
                        cov.extend(avg)
                        all_forms.update(new_forms)

                print(sum(cov)/len(cov))
                forms = all_forms

            preds, scores, avg, length, _ = self.evaluate(i)
            code += write_gf_code(self.pos, self.sort_rules(self.rules, i), self.other_forms, self.how)
            print(scores)
            score.append(scores["coverage"])
            if errors and i < self.iters-1 and forms:
                if i+1 < len(required_forms):
                    new_form = required_forms[i+1]
                    self.other_forms.append(new_form)
                elif self.sampling == "random":
                    new_form = choice(errors)[0]
                    while new_form in self.other_forms:
                        new_form = choice(errors)[0]
                    self.other_forms.append(new_form)
                elif self.sampling in ["oracle", "edit-distance", "entropy"]:
                    for error in errors:  # sample a new form
                        if error[0] not in self.other_forms:
                            new_form = error[0]
                            self.other_forms.append(new_form)
                            break
            else:
                break
        return score, preds, code

    def build_regex(self, rule):
        regex = defaultdict(list)
        regex_str = ""

        for x in rule:
            for num, c in enumerate(x[::-1]):
                regex[num].append(c)

        for c in list(regex.values())[::-1]:
            if len(c) == len(rule):
                regex_str += f"({'|'.join(set(c))})" if len(set(c)) > 1 else c[0]
            else:
                regex_str += f"({'|'.join(set(c))})?" if len(set(c)) > 1 else f"{c[0]}?"
        return regex_str

    def linearize_tree(self):
        class2labels = defaultdict(list)
        for label, tag in self.rules.items():
            class2labels[tag].append(label)

        for tag, rule in class2labels.items():
            self.regex[tag] = self.build_regex(rule)

    def sort_rules(self, rules, iteration):
        def gen_list(x, i):
            return [len(x[0][num][1]) if num < len(x[0]) else 0 for num in range(0, i)]

        filtered_rules = sorted(rules.items(), key=lambda x: gen_list(x, iteration+1), reverse=True)
        return filtered_rules

    def evaluate(self, i, test=True, data=None):
        """Evaluation on train/test data"""
        y_true = []
        y_pred = []
        distribution = []
        cur_rules = self.sort_rules(self.rules, i)

        forms_by_tag = defaultdict(list)

        if data:
            lemmas, tokens = list(zip(*data))
        elif test:
            lemmas = self.test
            tokens = self.tokens
        else:
            lemmas = self.train
            tokens = self.train_tokens


        most_common = Counter([x for _, x in self.train]).most_common(1)[0][0] if self.train else -1
        common_dist = [x for _, x in self.train]
        for (lemma, tag), token in zip(lemmas, tokens):
            y_true.append(tag)
            pred = most_common
            pred_dist = common_dist
            for rule, (pred_tag, entropy, dist) in cur_rules:
                passes = []
                for form, subrule in rule:
                    val = False
                    if (
                        self.how == "suffix" and token[form].endswith(subrule)
                    ) or (
                        self.how == "prefix" and token[form].startswith(subrule)
                    ):
                        val = True
                    passes.append(val)
                if all(passes):
                    pred = pred_tag
                    pred_dist = dist
                    if not test and entropy > 0:
                        forms_by_tag[(rule, entropy)].append((token, tag))
                    break

            y_pred.append(pred)
            distribution.append(pred_dist)

        coverage = []
        preds = []
        errors = []


        for (lemma, tag), token, pred, pred_dist in zip(lemmas, tokens, y_pred, distribution):
            table = self.forms[pred]
            pred_labels = self.form_distribution[pred]

            base = token[self.other_forms[0]]

           # print(token, self.other_forms)

            pred_forms = form_token(base, table.pattern, pred_labels)

            preds.append((self.pos, lemma, pred_forms, list(token.values()), pred, tag))

            cscore, token_errors = self.coverage_score(token, pred_forms, pred_dist)

            coverage.extend(cscore)
            errors.extend(token_errors)

        if self.sampling == "oracle":
            error_list = list(sorted(Counter(errors).items(), key=lambda x: -x[1]))
        elif self.sampling == "edit-distance":
            error_dict = defaultdict(int)
            for error, distance in errors:
                error_dict[error] += distance
            error_list = list(sorted(error_dict.items(), key=lambda x: -x[1]))
        elif self.sampling == "entropy":
            error_dict = defaultdict(list)
            for error, entropy in errors:
                error_dict[error].append(entropy)
            error_list = list(sorted(error_dict.items(), key=lambda x: sum(x[1])/len(x[1]), reverse=True))
        else:
            error_list = []

        scores = {
                "accuracy": accuracy_score(y_true, y_pred),
                "f1": f1_score(y_true, y_pred, average="micro"),
                "precision": precision_score(y_true, y_pred, average="micro"),
                "recall": recall_score(y_true, y_pred, average="micro"),
                "coverage": sum(coverage) / len(coverage),
            }

        if test:
            return preds, scores, coverage, len(coverage), error_list
        else:
            return preds, scores, coverage, len(coverage), error_list, forms_by_tag

def write_gf_code(pos_tag, rules, other_forms, how):
    strings = " -> ".join(["Str",] * len(other_forms))
    if len(other_forms) == 1:
        args = ["form"]
        tupl = "form"
    else:
        args = [f"form{num+1}" for num in range(len(other_forms))]
        tupl = "<"+", ".join(args)+">"
    gf_code = f"""  reg{len(other_forms) if len(other_forms) > 1 else ""}{pos_tag} : {strings} -> {pos_tag}   -- {"  ".join(other_forms)}\n    = \\{", ".join(args)} -> case {tupl} of {{\n"""
    for rule, (class_tag, entropy, _) in rules:
        rule_string = []
        if len(rule) == len(other_forms):
            for form, subrule in rule:
                if how == "suffix":
                    rule_string.append(f"_ + \"{subrule}\"")
                else:
                    rule_string.append(f"\"{subrule}\" + _")

            tag = str(class_tag + 1).zfill(3)
            if len(other_forms) > 1:
                gf_code += f"""\t\t<{", ".join(rule_string)}> => mk{pos_tag}{tag} form1;\n"""
            else:
                gf_code += f"""\t\t{" ".join(rule_string)} => mk{pos_tag}{tag} form;\n"""
    if len(other_forms) > 1:
        gf_code += f"""\t\t_ => reg{len(other_forms)-1 if len(other_forms) > 2 else ""}{pos_tag} {" ".join(args[:-1])}\n"""
    else:
        gf_code += f"""\t\t_ => error \"Cannot find an inflection rule\"\n"""
    gf_code += "  } ;\n\n"
    gf_code = gf_code.replace(";\n}", "\t\n}")
    gf_code = gf_code.replace(";\n} ;", "\n} ;")
    return gf_code


def filter_tokens(tag, table, paradigm, required=None):
    forms = {normalize(p): form for p, form in zip(paradigm, table[1]) if type(form)==str}
    if required:
        return (forms[normalize(required)], tag), forms
    else:
        return (forms[normalize(paradigm[0])], tag), forms


boilerplate = {
  "N": "mkN2 = overload {\n" +
       "  mkN2 : N -> N2 = \\n -> lin N2 n ** {c2=noPrep};\n"+
       "  mkN2 : N -> Prep -> N2 = \\n,p -> lin N2 n ** {c2=p};\n"+
       "} ;\n"+
       "\n"+
       "mkPN : Str -> PN = \\s -> lin PN {s=s} ;\n"+
       "mkLN : Str -> LN = \\s -> lin LN {s=s} ;\n"+
       "mkGN : Str -> GN = \\s -> lin GN {s=s} ;\n"+
       "mkSN : Str -> SN = \\s -> lin SN {s=s} ;\n\n",
  "V": "mkV2 = overload {\n"+
       "  mkV2 : V -> V2 = \\v -> lin V2 v ** {c2=noPrep} ;\n"+
       "  mkV2 : V -> Prep -> V2 = \\v,p -> lin V2 v ** {c2=p} ;\n"+
       "} ;\n"+
       "\n"+
       "mkVV : V -> VV = \\v -> lin VV v ;\n"+
       "mkVS : V -> VS = \\v -> lin VS v ;\n"+
       "mkVQ : V -> VQ = \\v -> lin VQ v ;\n"+
       "mkVA : V -> VA = \\v -> lin VA v ;\n"+
       "\n"+
       "mkV2V = overload {\n"+
       "  mkV2V : V -> V2V = \\v -> lin V2V v ** {c2,c3=noPrep} ;\n"+
       "  mkV2V : V -> Prep -> Prep -> V2V = \\v,p2,p3 -> lin V2V v ** {c2=p2; c3=p3} ;\n"+
       "} ;\n"+
       "\n"+
       "mkV2S = overload {\n"+
       "  mkV2S : V -> V2S = \\v -> lin V2S v ** {c2,c3=noPrep} ;\n"+
       "  mkV2S : V -> Prep -> Prep -> V2S = \\v,p2,p3 -> lin V2S v ** {c2=p2; c3=p3} ;\n"+
       "} ;\n"+
       "\n"+
       "mkV2Q = overload {\n"+
       "  mkV2Q : V -> V2Q = \\v -> lin V2Q v ** {c2,c3=noPrep} ;\n"+
       "  mkV2Q : V -> Prep -> Prep -> V2Q = \\v,p2,p3 -> lin V2Q v ** {c2=p2; c3=p3} ;\n"+
       "} ;\n"+
       "\n"+
       "mkV2A = overload {\n"+
       "  mkV2A : V -> V2A = \\v -> lin V2A v ** {c2,c3=noPrep} ;\n"+
       "  mkV2A : V -> Prep -> Prep -> V2A = \\v,p2,p3 -> lin V2A v ** {c2=p2; c3=p3} ;\n"+
       "} ;\n"+
       "\n"+
       "mkV3 = overload {\n"+
       "  mkV3 : V -> V3 = \\v -> lin V3 v ** {c2,c3=noPrep} ;\n"+
       "  mkV3 : V -> Prep -> Prep -> V3 = \\v,p2,p3 -> lin V3 v ** {c2=p2; c3=p3} ;\n"+
       "} ;\n\n",
  "A": "mkA2 = overload {\n"+
       "  mkA2 : A -> A2 = \\a -> lin A2 a ** {c2=noPrep} ;\n"+
       "  mkA2 : A -> Prep -> A2 = \\a,p -> lin A2 a ** {c2=p} ;\n"+
       "} ;\n\n",
  "Adv": (
       "mkAdv : Str -> Adv = \\s -> lin Adv {s=s} ;\n"+
       "mkAdV : Str -> AdV = \\s -> lin AdV {s=s} ;\n"+
       "mkAdA : Str -> AdA = \\s -> lin AdA {s=s} ;\n"+
       "mkAdN : Str -> AdN = \\s -> lin AdN {s=s} ;\n\n"),
  "Interj":
       "mkInterj : Str -> Interj = \\s -> lin Interj {s=s} ;\n\n",
  "Voc":
       "mkVoc : Str -> Voc = \\s -> lin Voc {s=s} ;\n\n",
  "Prep":
       "mkPrep : Str -> Prep = \\s -> lin Prep {s=s} ;\n"+
       "noPrep : Prep = lin Prep {s=\"\"} ;\n\n"
  }

def guess_by_lemma(
    lang,
    how=None,
    min_examples=2,
    split=False,
    t=None,
    max_depth=3,
    min_sample_leaf=3,
    sampling="entropy",
    iters=4
):
    print("Reading data..")
    source, langcode, tables = read_data(lang)

    lang_plugin = plugins[source,lang]
    required_forms = lang_plugin.required_forms

    tokens = []
    code = ""
    overload_code = ""

    all_rules = {}

    for pos, forms in tables.items():
        if len(forms) > 1:
            print(f"=={pos}==")
            lemma2class = [
                filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), required_forms.get(pos,[None])[0])
                for tag, paradigm in enumerate(forms)
                if len(paradigm.tables) >= min_examples
                for table in paradigm.tables
            ]
            tree = LemmaTree(
                pos,
                lemma2class,
                forms,
                min_examples=min_examples,
                split=split,
                t=t,
                max_depth=max_depth,
                min_sample_leaf=min_sample_leaf,
                sampling=sampling,
                iters=iters
            )
            score, preds, pos_code = tree.fit(required_forms=required_forms.get(pos,[]))
            code += pos_code
           # print(tree.other_forms)
            tokens.extend(preds)

            all_rules[pos] = tree.rules

            overload_code += f"mk{pos} = overload {{\n"
            for num in range(1, len(tree.other_forms)+1):
                overload_code += f"  mk{pos} : {(' -> '.join(['Str',]*num))} -> {pos} = reg{num if num > 1 else ''}{pos}"
                overload_code += f'{";" if num < len(tree.other_forms) else ""}   -- {"  ".join(tree.other_forms[:num])}\n'
            overload_code += "} ;\n\n"
            overload_code += boilerplate.get(pos,"")

    overload_code+=boilerplate.get("Adv","")
    overload_code+=boilerplate.get("Interj","")
    overload_code+=boilerplate.get("Voc","")
    overload_code+=boilerplate.get("Prep","")

    with open(f"Paradigms{langcode}.gf", "w") as f:
        f.write(
            f"resource Paradigms{langcode} = Morpho{langcode}  ** open Prelude, Cat{langcode}, Res{langcode} in {{\noper\n"
        )
        f.write(code)
        f.write(overload_code)
        f.write("}")


    unimorph_code = format_unimorph(tokens)
    with open(f"unimorph_{langcode}.tsv", "w") as f:
        f.write(unimorph_code)


    with open(f"data/{lang}/rules.pickle", "wb") as f:
        pickle.dump((how,all_rules),f)
