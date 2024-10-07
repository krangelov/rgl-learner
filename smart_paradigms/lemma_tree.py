import sys
import pickle
from collections import defaultdict, Counter
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
import numpy as np
from smart_paradigms.utils import *
from scipy.stats import entropy
import re
from random import shuffle, choice
from Levenshtein import distance


def form_token(stem, assignments, labels, forms):
    token_dict = {}
    if assignments:
        base_dict = {}
        for assignment in assignments:
            base, ass = assignment.split(" = ")
            base_dict[base] = parse_ass(stem, ass)
    else:
        base_dict = {"base_1": stem}

    for label, form in zip(labels, forms):
        if form != "nonExist":
            for base, morpheme in base_dict.items():
                form = form.replace(base, morpheme)
            form = re.sub(r"base_\d", r"", form)
            token_dict[label] = form.replace("+", "").replace('"', "")
        else:
            token_dict[label] = "-"
    return token_dict


def format_unimorph(tokens):
    unimorph = []
    for pos, lemma, forms in tokens:
        for tag, form in forms.items():
            um_tag = ";".join(
                [
                    pos,
                ]
                + [gf2unimorph[t] for t in tag.split(";") if t in gf2unimorph]
            )
            unimorph.append("\t".join([lemma, form, um_tag]))
    return "\n".join(unimorph)


class LemmaTree:
    def __init__(
        self,
        pos: str,
        lemmas: list,
        forms: list,
        max_depth: int = 3,
        min_sample_leaf: int = 3,
        min_examples: int = 1,
        t: int = 100,
        how: str = "suffix",
        stopping: str = None,
        split: bool = False,
        sampling: str = "oracle"
    ):

        self.pos = pos
        self.forms = forms
        self.sampling = sampling
       # self.other_forms = defaultdict(None)  # change to dict with stats
        self.other_forms = []

        lemma_form = [form for table in lemmas for form, word in table[1].items() if word == table[0][0]]
        mc_lemma_form = Counter(lemma_form).most_common(1)[0][0]
        self.other_forms.append(mc_lemma_form)

        if split:
            shuffle(lemmas)
            if t and t < len(lemmas):
                # lemmas = sort(lemmas, key=lambda x: x[1].count("-")/len(x[1]), reverse=True)
                full_lemmas = [
                    lemma
                    for lemma in lemmas
                    if list(lemma[1].values()).count("-") / len(lemma[1]) <= 0.3
                ]
                partial_lemmas = [
                    lemma
                    for lemma in lemmas
                    if list(lemma[1].values()).count("-") / len(lemma[1]) > 0.3
                ]
                train = full_lemmas[:t]
                test = full_lemmas[t:] + partial_lemmas
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
        self.how = how


    def update_rules(self, label, value, prefix, cur_form, entropy):
        # found = True
        # for i in range(len(label)):
        #     if self.how == "suffix":
        #         prev = label[i:]
        #     else:
        #         prev = label[:-i]
        #     if prev in self.rules and self.rules[prev] == value:
        #         found = True
        #         break
        # if not found:
        if prefix:
            if self.rules.get(tuple(prefix)) != value:  # previous forms
                rule = prefix + [(cur_form, label),]
                self.rules[tuple(rule)] = (value, entropy)
        else:
            self.rules[((cur_form, label),)] = (value, entropy)

    def calculate_entropy(self, labels):
        label2entropy = defaultdict(list)
        for label, tags in labels.items():
            lemmas, classes = list(zip(*tags))
            classes = Counter(classes)
            class_dist = {
                class_name: one_class / sum(classes.values())
                for class_name, one_class in classes.items()
            }
            label2entropy[label] = (entropy(list(class_dist.values())), class_dist)
        return label2entropy

    def build_node(self, lemmas, position):
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
        entropy_scores, label2classes = self.build_node(lemmas, position)
        position += 1
        for label, (entropy_score, class_dist) in entropy_scores.items():
            if entropy_score == 0:
                self.update_rules(label, label2classes[label][0][1], prefix=prefix, cur_form=cur_form, entropy=entropy_score)
            else:
                if add_all and entropy_score <= entropy:
                    maxval = max(class_dist.values())
                    res = list(filter(lambda x: class_dist[x] == maxval, class_dist))
                    if len(res) == 1:
                        self.update_rules(label, res[0], prefix=prefix, cur_form=cur_form, entropy=entropy_score)
                    else:
                        classes = Counter([x[1] for x in lemmas if x[1] in res])
                        maxval = max(classes.values())

                        for i in res:
                            if classes[i] == maxval:
                                self.update_rules(label, i, prefix=prefix,  cur_form=cur_form, entropy=entropy_score)
                                break
                if (
                    position <= self.max_depth
                    and len(label2classes[label]) >= self.min_sample_leaf
                ):
                    self.build_tree(label2classes[label], position, prefix=prefix,
                                    cur_form=cur_form, add_all=True, entropy=entropy_score)

    def fit(self, forms=None, start=0, prefix=[],
            iters=4, new_form=None,
            required_forms=[]):
        # TODO: 4) entropy instead of errors 5) edit distance
        score = []
        cov = []
        for i in range(iters):
            if not forms:
                prefix = []
                self.build_tree(self.train, prefix=prefix, cur_form = self.other_forms[0])
                preds, scores, avg, length, errors, forms = self.evaluate()
                print(scores["coverage"])
            else:
                all_forms = {}
               #forms = sorted(forms.items(), key=lambda x: len(x[0][-1][1]))
                for affix, form in forms.items():
                    lemma2class = [
                        ((tokens[new_form], tag), tokens)
                        for tokens, tag in form]
                    self.train, self.train_tokens = list(zip(*lemma2class))
                    self.build_tree(self.train, start + 1, list(affix),
                                    cur_form=new_form)

                    preds, scores, avg, length, errors, new_forms = self.evaluate()
                    cov.extend(avg)
                    #print(scores["coverage"])
                   # print(new_forms.keys())
                   # print(len(new_forms))
                    all_forms.update(new_forms)

                print(sum(cov)/len(cov))
                forms = all_forms

            preds, scores, avg, length, errors = self.compute_metrics()
            print(scores)
            score.append(scores["coverage"])
            if errors and i < iters-1:
                if self.sampling == "random":
                    new_form = choice(errors)[0]
                    while new_form in self.other_forms:
                        new_form = choice(errors)[0]
                    self.other_forms.append(new_form)
                elif self.sampling == "oracle":
                    for error in errors:  # sample a new form
                        if error[0] not in self.other_forms:
                            new_form = error[0]
                            self.other_forms.append(new_form)
                            break
                elif self.sampling == "given" and i+1 < len(required_forms):
                    new_form = required_forms[i+1]
                elif self.sampling == "entropy":
                    raise NotImplementedError
                elif self.sampling == "edit-distance":
                    raise NotImplementedError
            else:
                break
        return score

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

    def evaluate(self):
        y_true = []
        y_pred = []
       # self.rules = dict(
       #     sorted(
       #         self.rules.items(),
       #         key=len,
       #         reverse=True,
       #     ))
        cur_rules = list(reversed(list(self.rules.items())))
       # cur_rules = sorted(self.rules.items(), key=lambda x: len(x[0]), reverse=True)
       # print(cur_rules.keys())

        forms_by_tag = defaultdict(list)

        most_common = Counter([x for _, x in self.train])[0]

        for (lemma, tag), token in zip(self.train, self.train_tokens):
            y_true.append(tag)
            pred = -1

            for rule, (pred_tag, entropy) in cur_rules:
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
                    if entropy > 0:
                        forms_by_tag[rule].append((token, tag))
                        break

            #if tag != pred:
            #    print(token)
            #    print(cur_rules)
            #    print(pred, tag)


            y_pred.append(pred)
       # print(forms_by_tag)



        coverage = []
        preds = []
        errors = []


        for (lemma, tag), token, pred in zip(self.train, self.train_tokens, y_pred):
            table = self.forms[pred]
            pred_labels = reverse_dict(table.typ.linearize())

            if next(iter(token.values())) == "-":
                base = lemma
            else:
                base = next(iter(token.values()))


            pred_forms = form_token(base, table.assignments, pred_labels, table.forms)

            preds.append((self.pos, lemma, pred_forms))

            cscore, token_errors = coverage_score(token, pred_forms)

            coverage.extend(cscore)
            errors.extend(token_errors)

        return (
            preds,
            {
                "accuracy": accuracy_score(y_true, y_pred),
                "f1": f1_score(y_true, y_pred, average="micro"),
                "precision": precision_score(y_true, y_pred, average="micro"),
                "recall": recall_score(y_true, y_pred, average="micro"),
                "coverage": sum(coverage) / len(coverage),
            },
            coverage,
            len(coverage),
            list(sorted(Counter(errors).items(), key=lambda x: -x[1])),
            forms_by_tag,
        )

    def compute_metrics(self):
        y_true = []
        y_pred = []
       # self.rules = dict(
       #     sorted(
       #         self.rules.items(),
       #         key=lambda x: (len(x[0][0]), len(x[0]), len(x[0][-1])),
       #         reverse=True,
       #     )
       # )

        #print(self.rules)
        cur_rules = list(reversed(list(self.rules.items()))) #, key=lambda x: len(x[0]), reverse=True))


       # print(cur_rules)

        for (lemma, tag), token in zip(self.test, self.tokens):
            y_true.append(tag)
            pred = -1
            for rule, (pred_tag, entropy) in cur_rules:
                passes = []
                for num, (form, subrule) in enumerate(rule):
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
                    break

            y_pred.append(pred)

        coverage = []
        preds = []
        errors = []

        for (lemma, tag), tokens, pred in zip(self.test, self.tokens, y_pred):
            table = self.forms[pred]
            pred_labels = reverse_dict(table.typ.linearize())

            if next(iter(tokens.values())) == "-":
                base = lemma
            else:
                base = next(iter(tokens.values()))


            pred_forms = form_token(base, table.assignments, pred_labels, table.forms)

            preds.append((self.pos, lemma, pred_forms))

            cscore, token_errors = coverage_score(tokens, pred_forms)

            coverage.extend(cscore)
            errors.extend(token_errors)

        return (
            preds,
            {
                "accuracy": accuracy_score(y_true, y_pred),
                "f1": f1_score(y_true, y_pred, average="micro"),
                "precision": precision_score(y_true, y_pred, average="micro"),
                "recall": recall_score(y_true, y_pred, average="micro"),
                "coverage": sum(coverage) / len(coverage),
            },
            sum(coverage),
            len(coverage),
            list(sorted(Counter(errors).items(), key=lambda x: -x[1])),
        )

def write_gf_code(lang, pos_tag, rules, other_forms, how):
    strings = " -> ".join(["Str",] * len(other_forms))
    forms = ", ".join([f"form{num+1}" for num in range(len(other_forms))])
    gf_code = f"""formBasedSelection{pos_tag} : {strings} -> {cat2tag[pos_tag]}\n= \\{forms} -> case <{forms}> of {{\n"""
    rules = reversed(list(rules.items()))
    for rule, (class_tag, entropy) in rules:
        rule_string = []
        for num, (form, subrule) in enumerate(rule):
            if other_forms[num] == form:
                if how == "suffix":
                    rule_string.append(f"_ + \"{subrule}\"")
                else:
                    rule_string.append(f"\"{subrule}\" + _")
            else:
                rule_string.append("_")
        if len(rule_string) < len(other_forms):
            blanks = ["_",] * (len(other_forms) - len(rule_string))
            rule_string.extend(blanks)

        tag = str(class_tag + 1).zfill(3)
        if len(other_forms) > 1:
            gf_code += f"""\t\t<{", ".join(rule_string)}> => mk{pos_tag}{tag} form1; --{entropy}\n """
        else:
            gf_code += f"""\t\t{" ".join(rule_string)} => mk{pos_tag}{tag} form1; --{entropy}\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace(";\n}", "\t\n}")
    return gf_code


def filter_tokens(tag, table, paradigm, required=None):
    forms = dict(zip(paradigm, table[1]))
    if required:
        return (forms[required], tag), forms
    else:
        return (table[0].split("_")[0].lower(), tag), forms


def guess_by_lemma(
    lang,
    how="suffix",
    min_examples=2,
    split=True,
    t=50,
    max_depth=3,
    min_sample_leaf=3,
    required_forms=None,
    sampling="oracle"
):
    print("Reading data..")
    if required_forms: # might point at the form to start or list all forms to go through
        #  use sampling = "oracle" to use it only for a starting point
        #  use sampling = "given" if there are all forms
        with open(required_forms) as f:
            read_forms = f.read().splitlines()
        required_forms = defaultdict(list)
        for form in read_forms:
            pos, form = form.split(";", maxsplit=1)
            required_forms[pos].append(form)
    langcode, tables = read_data(lang)
    tokens = []
    code = ""
    avg_score = 0
    avg_len = 0
    for pos, forms in tables.items():
        if len(forms) > 1:
            print(f"=={pos}==")
            # avg_score += avg
            # avg_len += length
            # tokens.extend(preds)

            if required_forms:
                lemma2class = [
                    filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), required_forms[pos][0])
                    for tag, paradigm in enumerate(forms)
                    for table in paradigm.tables
                    if len(paradigm.tables) >= min_examples
                ]
                required_forms = required_forms[pos]
            else:
                lemma2class = [
                    filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()))
                    for tag, paradigm in enumerate(forms)
                    for table in paradigm.tables
                    if len(paradigm.tables) >= min_examples
                ]
            tree = LemmaTree(
                pos,
                lemma2class,
                forms,
                how=how,
                min_examples=min_examples,
                split=split,
                t=t,
                max_depth=max_depth,
                min_sample_leaf=min_sample_leaf,
                sampling=sampling
            )
            score = tree.fit(required_forms=required_forms)

            code += write_gf_code(langcode, pos, tree.rules, tree.other_forms, how)


    # print("Average score:", round(avg_score/avg_len, 3))
    with open(f"Inflection{langcode}.gf", "w") as f:
        f.write(
            f"resource Inflection{langcode} = open Prelude, Res{langcode}, Paradigms{langcode} in {{\noper\n"
        )
        f.write(code)
        f.write("}")

    # unimorph_code = format_unimorph(tokens)
    # with open(f"unimorph_{langcode}.tsv", "w") as f:
    #    f.write(unimorph_code)
