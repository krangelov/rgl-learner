import sys
import pickle
from collections import defaultdict, Counter
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
import numpy as np
from rgl_learner.utils import *
from rgl_learner.json_utils import *
from scipy.stats import entropy
import re
from random import shuffle, choice, seed
import random
from pprint import pprint
import rgl_learner.plugins as plugins

evaluate = False
normalize = lambda x: re.sub(r"^s;", "",x).lower() if evaluate else x

get_typ = lambda x: x.typ_dict if x.typ_dict else reverse_dict(x.typ.linearize())

def format_unimorph(tokens):
    """Format output to unimorph format"""
    unimorph = []
    for pos, lemma, forms, true_forms, y_pred, y_true in tokens:
        for (tag, form), true_form in zip(forms.items(), true_forms):
            um_tag = ";".join(
                [pos,]
                + [gf2unimorph[t] for t in tag.split(";") if t in gf2unimorph]
            )
            unimorph.append("\t".join([lemma, true_form, form, um_tag, tag]))
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
        limit_test: int = None,
        how: str = None,
        stopping: str = None,
        split: bool = False,
        sampling: str = "oracle",
        mc_lemma_form: str = None,
        shuffle_data: str = True,
        rules: dict = None,
        vars: dict = None,
        required_forms: list = None,
    ):

        self.pos = pos
        self.forms = forms
        self.sampling = sampling
        self.iters = iters
        self.other_forms = []

        self.dev = True if test_lemmas else False

        

        self.form_distribution = [dict(zip([normalize(x) for x in get_typ(p)], [x[0] for x in p.forms])) for p in forms]

        lemmas = list(filter(lambda x: x, lemmas))


        self.forms = forms
        #self.forms = list(filter(lambda x: x[1], forms))

        lemma_form = [form for table in lemmas for form, word in table[1].items() if word == table[0][0]]
        if not mc_lemma_form:
            mc_lemma_form = Counter(lemma_form).most_common(1)[0][0]
        else:
            mc_lemma_form = normalize(mc_lemma_form)
        self.other_forms.append(mc_lemma_form)

        if test_lemmas:
            train = lemmas
            test = test_lemmas
            labels, self.train_tokens = list(zip(*train))
            count_labels = Counter(list(zip(*labels))[1])
            self.train = [x for x in labels if count_labels[x[1]] >= min_examples]
        elif split:  # different ways to split data to train and test
            if t and t < len(lemmas):
                if shuffle_data:
                    shuffle(lemmas)
                train = lemmas[:t]
                test = lemmas[t:t+limit_test] if limit_test else lemmas[t:]
            else:
                train, test = train_test_split(lemmas, shuffle=shuffle_data,
                                               random_state=42)
            labels, self.train_tokens = list(zip(*train))
            count_labels = Counter(list(zip(*labels))[1])
            self.train = [x for x in labels if count_labels[x[1]] >= min_examples]
        else:
            train = lemmas
            test = train
            self.train, self.train_tokens = list(zip(*train))

        self.test, self.tokens = list(zip(*test))



        if stopping == "max_length":
            self.max_depth = max([len(x[0]) for x in self.train]) + 1
        else:
            self.max_depth = max_depth

        self.min_sample_leaf = min_sample_leaf
        self.rules = defaultdict()
    
        if rules:
            for rule, tag in rules.items():
                new_rule = []
                for form, subrule in rule:
                    regexp = ""
                    for elem in subrule:
                        if elem.startswith("#"):
                            if elem in vars:
                                regexp += "(" + "|".join(vars[elem].strip('"')) + ")"
                            else:
                                raise AttributeError (f"{elem} is not in variables list")
                        else:
                            regexp += elem
                    new_rule.append((form, regexp))
                self.rules[tuple(new_rule)] = (tag-1, 1, {})

       
            
        self.regex = defaultdict()
        if how:
            self.how = how
        else:
            self.how = self.define_affixation()

        self.required_forms = required_forms



    def form_token(self, stem, pattern, labels, iter, test=True):
        """Form tokens based on predicted forms by
        matching patterns"""
        token_dict = {}
        
        if pattern and None not in pattern:
            full_match, base_dict, new_pattern, stem_name = parse_pattern(stem, pattern)
            if not test or full_match[0]:
                base_dict = {} # overwrite base_dict
                for match in full_match:
                    if match and "base_1" in match and isinstance(match["base_1"], tuple):
                        base_dict = base_dict | {f"base_{i+1}": base for i, base in enumerate(match["base_1"])}
                    elif match and "pat_1" in match and isinstance(match["pat_1"], tuple):
                        new_dict = {"pat_1": match["pat_1"][0]}
                        base_dict = base_dict | {f"base_{i+1}": base for i, base in enumerate(match["pat_1"][1:])}
                    else:
                        base_dict = base_dict | match

            else:
                
                new_labels = {}
                for label, word in labels.items():
                    if isinstance(word, str):
                        word_split = word.split('+')
                    else:
                        word_split = word
                        word = "+".join(word)
                    if stem_name in word_split and word_split.index(stem_name) + 1 < len(word_split) and new_pattern:
                        replace_word_idx = word_split.index(stem_name) + 1
                        new_word = [w.replace(new_pattern, "").replace('+""', "")
                                        if num == replace_word_idx else w for num, w in enumerate(word_split)]
                        new_labels[label] = "+".join(new_word).replace('+""', "").replace('""+', '')
                    else:
                        new_labels[label] = word
                    
                    labels = new_labels
                if new_pattern:
                    upd_pattern = ("+".join([x.replace(new_pattern, "") if "base" not in x else x
                                            for x in pattern.split("+")]).replace('+""', "")
                                   .replace('""+', ''))
                else:
                    upd_pattern = pattern
        else:
            base_dict = {"base_1": stem[0]}
        
        if not base_dict:
            if isinstance(pattern[-1], str):
                base_dict = {"base_1": stem[0][:-len(pattern)]}
            else:
                base_dict = {"base_1": stem[0]}
        if None not in pattern:
            for num, p in enumerate(pattern):
                pat = f"pat_{num+2}"
                if [pat] in pattern[-1] and pat not in base_dict:
                    if "pat_1" in base_dict:
                        base_dict[pat] = base_dict["pat_1"]
                    else:
                        base_dict[pat] = base_dict["base_1"]
                        base_dict["pat_1"]  = base_dict["base_1"]

        for label, form in labels.items():
            label = normalize(label)
            if form != "nonExist" and isinstance(form, str):
                for base, morpheme in base_dict.items():
                    morpheme = morpheme[0] if type(morpheme) == tuple else morpheme
                    form = form.replace(base, morpheme)
                form = re.sub(r"base_\d", r"", form) 
                token_dict[label] = form.replace("+", "").replace('"', "")
            else:
                token_dict[label] = "-"

        return token_dict

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
            from Levenshtein import ratio, distance
            edit_distance = distance(true_value, pred_value)
            return form, edit_distance
        elif self.sampling == "entropy":
            possible_forms = []
            for d in dist:
                if form in self.form_distribution[d]:
                    possible_forms.append(self.form_distribution[d][form].replace("s;", ""))
            form_prob = [possible_forms.count(f)/len(possible_forms) for f in set(possible_forms)]
            return form, entropy(form_prob)

        return ""

    def coverage_score(self, token, forms, dist=None):
        errors = []
        coverage = []

        for form, value in token.items():
          #  print(forms.get(form), value)
            if value != "-" and form != "lemma":
                if forms.get(form) == value:
                    coverage.append(1)
                else:
                    coverage.append(0)
                    if forms.get(form) != "-":
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
            label2entropy[label] = (
                entropy(list(class_dist.values())),
                dict(sorted(class_dist.items(), key=lambda x: -x[1]))
            )

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
            if entropy_score < 0.05:
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
                                        cur_form=cur_form, add_all=True, entropy=entropy_score)

                    
    def rewrite_rules(self):
        def get_ending(pattern, ending):
            if isinstance(pattern, str):
                if "base" not in pattern or "pat" not in pattern:
                    if len(pattern) > len(ending):
                        ending = pattern
                        
            elif isinstance(pattern[-1], list):
                for elem in pattern[-1]:
                    if isinstance(elem, str) and "pat" not in elem and "base" not in elem and ending in elem and len(elem.strip('"')) > len(ending):
                        ending = elem.replace('"', "")
                        
            
            return ending 
        

        rules = {}
        for rule, (tag, entropy, dist) in self.rules.items():
            (form, ending) = rule[0]


            if self.how == "suffix":
                pattern = self.forms[tag].pattern[-1]
                if isinstance(pattern, str):
                    pattern = pattern.strip('"')
                    diff = len(ending) - len(pattern)
                    rest = self.forms[tag].pattern[:-1]
                else:
                    diff = len(ending)
                    rest = self.forms[tag].pattern
                
                if_var = any([isinstance(x, str) for x in rest])
                ending = get_ending(pattern, ending)
                
                beginning = []
                if if_var:
                    for i in rest[::-1]:
                        if isinstance(i, str):
                            if  diff > 0:
                                beginning.append(i.strip('"')[:-diff])
                                diff -= len(i)
                            else:
                                beginning.append(i.strip('"'))
                            
                        elif len(i) > 1:
                            regexp = []
                            if isinstance(i[1], int):
                                if diff > 0:
                                    if i[1]-diff > 0:
                                        regexp.append(f".{i[1]-diff}")
                                        diff -= i[1]
                                else:
                                    regexp.append(f".{i[1]}")
                            else:
                                for x in i[1]:
                                    if isinstance(x, int):
                                        if diff > 0:
                                            if x-diff > 0:
                                                regexp.append(f".{x-diff}")
                                                diff -= x
                                        else:
                                            regexp.append(f".{x}")
                                    elif  diff > 0:
                                        if len(x) > diff and (x in ending or ending in x):
                                            regexp.append(x.strip('"')[:-diff])
                                            diff -= len(x.strip('"'))
                                    else:
                                        regexp.append(x.strip('"'))
                            regexp = [x.strip('"') for x in regexp if x != ""]
                            if regexp:
                                beginning.append("(" + "|".join(regexp) +  ")")
                                
                        else:
                            beginning.append(".*")


                ending = "".join(beginning[::-1]) + ending
                
            else:
                pattern = self.forms[tag].pattern[0]
                if isinstance(pattern, str):
                    pattern = pattern.strip('"')
                    diff = len(ending) - len(pattern)
                    rest = self.forms[tag].pattern[1:]
                else:
                    diff = len(ending)
                    rest = self.forms[tag].pattern
                if_var = any([isinstance(x, str) for x in rest])
                ending = get_ending(pattern, ending)
                beginning = []
                if if_var:
                    for i in rest:
                        if isinstance(i, str):
                            if  diff > 0:
                                beginning.append(i.strip('"')[diff:])
                                diff -= len(i)
                            else:
                                beginning.append(i.strip('"'))
                            
                        elif len(i) > 1:
                            regexp = []
                            if isinstance(i[1], int):
                                if diff > 0:
                                    if i[1]-diff > 0:
                                        regexp.append(f".{i[1]+diff}")
                                        diff -= i[1]
                                else:
                                    regexp.append(f".{i[1]}")
                            else:
                                for x in i[1]:
                                    if isinstance(x, int):
                                        if diff > 0:
                                            if x-diff > 0:
                                                regexp.append(f".{x+diff}")
                                                diff -= x
                                        else:
                                            regexp.append(f".{x}")
                                    elif  diff > 0:
                                        if len(x) > diff and (x in ending or ending in x):
                                            regexp.append(x.strip('"')[diff:])
                                            diff -= len(x.strip('"'))
                                    else:
                                        regexp.append(x.strip('"'))
                            regexp = [x for x in regexp if x != ""]
                            if regexp:
                                beginning.append("(" + "|".join(regexp) +  ")")
                        else:
                            beginning.append(".*")
                ending = "".join(beginning[::-1]) + ending
            
            rules[((form, ending),)] = (tag, entropy, dist)
        
    
        self.rules = rules



    def fit(self, forms=None, start=0, prefix=[], new_form=None,
            required_forms=[]):
        """Fitting a tree with several forms"""
        score = []
        cov = []
        code = ""
        train_cov = 0
        possible_forms = list(self.train_tokens[0].keys())
        self.required_forms = required_forms
        for i in range(self.iters):
            if i == 0:
                prefix = []
                self.build_tree(lemmas=self.train, prefix=prefix, cur_form=self.other_forms[0])
                self.rewrite_rules()
                #print(self.rules)
                preds, train_scores, avg, length, errors, forms = self.evaluate(i, test=False)
            else:
                all_forms = {}
                for (affix, entropy), form in forms.items():
                    if len(form) > 1:
                        lemma2class = [
                            ((tokens[normalize(new_form)], tag), tokens)
                            for tokens, tag in form]
                        self.train, self.train_tokens = list(zip(*lemma2class))
                        if self.train:
                            self.build_tree(self.train, prefix=list(affix),
                                                cur_form=new_form, entropy=entropy)

                            preds, train_scores, avg, length, errors, new_forms = self.evaluate(i, test=False)
                            cov.extend(avg)
                            all_forms.update(new_forms)
                forms = all_forms
            

            if train_scores["coverage"] < train_cov:
                break
            else:
                train_cov = train_scores["coverage"]


            preds, scores, avg, length, errors_test = self.evaluate(i)
            if self.dev:
                errors = errors_test
            code += write_gf_code(self.pos, self.sort_rules(self.rules, i), self.other_forms, self.how)
            score.append(scores["coverage"])
            if errors: # and i < self.iters-1 and forms:
                if i+1 < len(required_forms):
                    new_form = required_forms[i+1]
                    self.other_forms.append(new_form)
                elif self.sampling == "random":
                    new_form = choice(errors)[0]
                    while new_form in self.other_forms or new_form not in possible_forms:
                        new_form = choice(errors)[0]
                    self.other_forms.append(new_form)
                elif self.sampling in ["oracle", "edit-distance", "entropy"]:
                    for error in errors:  # sample a new form
                        if error[0] not in self.other_forms and error[0] in possible_forms:
                            new_form = error[0]
                            self.other_forms.append(new_form)
                            break
            else:
                break
            if not new_form:
                return score, preds, code

        return score, preds, code

    def sort_rules(self, rules, iteration):
        def gen_list(x, i):
            return [len(x[0][num][1]) if num < len(x[0]) else 0 for num in range(0, i)]

        filtered_rules = sorted(rules.items(), key=lambda x: gen_list(x, iteration+1), reverse=True)
        return filtered_rules

    def evaluate(self, i, test=True, data=None, form_pattern=True):
        """Evaluation on train/test data"""
        def match_token(token, rule):
            if rule.startswith("^"):
                res = re.match(rf"{rule}$", token)
            elif self.how == "suffix":
                res = re.match(rf".*{rule}$", token)
            else:
                res = re.match(rf"^{rule}.*", token)
            if res:
                return True
            return False
        
        y_true = []
        y_pred = []
        distribution = []


        cur_rules = self.sort_rules(self.rules, i)


        #print(cur_rules)

        forms_by_tag = defaultdict(list)

        if data:
            lemmas, tokens = list(zip(*data))
        elif test:
            lemmas = self.test
            tokens = self.tokens
        else:
            lemmas = self.train
            tokens = self.train_tokens


        # find a suitable paradigm
        #most_common = Counter([x for _, x in self.train]).most_common(1)[0][0] if self.train else 0
        most_common = 0
        common_dist = [x for _, x in self.train]
        for (lemma, tag), token in zip(lemmas, tokens):
            #print(token.keys())
            y_true.append(tag)
            pred = most_common
            pred_dist = common_dist
            for rule, (pred_tag, entropy, dist) in cur_rules:
                passes = []
                
                for form, subrule in rule:
                    
                    val = False
                    word = token.get(form, "-")
                    #print(form)
                    #print(token["noVerbform;Nonfinite"])
                 
                    val = match_token(word, subrule)
                    passes.append(val)
                if all(passes):
                    
                    pred = pred_tag
                    pred_dist = dist
                    if not test: # and entropy > 0:
                        forms_by_tag[(rule, entropy)].append((token, tag))
                    break

            y_pred.append(pred)
            distribution.append(pred_dist)

        coverage = []
        preds = []
        errors = []

        # compare and calculate coverage score
        for (lemma, tag), token, pred, pred_dist in zip(lemmas, tokens, y_pred, distribution):
            table = self.forms[pred]
            pred_labels = self.form_distribution[pred]
            
            base = [token[normalize(x)] if normalize(x) in token else "-" for x in self.required_forms]
            pred_forms = self.form_token(base, table.pattern, pred_labels, test=form_pattern, iter=i)
            true_values = [token.get(v, "-") for v in pred_forms]

            preds.append((self.pos, lemma, pred_forms, true_values, pred, tag))


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
            error_list = list(sorted(error_dict.items(), key=lambda x: -sum(x[1])/len(x[1])))
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


def filter_tokens(tag, table, morphoforms, paradigm, required=None, train=False):
    
    forms = {normalize(p): form for p, form in zip(morphoforms, table[1]) if isinstance(form, str)}

    if not train or not paradigm.pattern[0] or any(["base_1" in x or "pat_1" in x for x in paradigm.pattern[0]]):
        if required and isinstance(required, int):
            return (forms[normalize(morphoforms[required])], tag), forms
        elif required:
            return (forms[normalize(required)], tag), forms
        else:
            lemma_form = [(num, form[0]) for lemma, table in paradigm.tables for num, (form, word) in
                          enumerate(zip(paradigm.forms, table)) if lemma.split("_")[0] == word]
            mc_lemma_form = Counter(lemma_form).most_common(1)[0][0][0] if lemma_form else 0
            return (forms[normalize(morphoforms[mc_lemma_form])], tag), forms




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
#  "Adv": (
#       "mkAdv : Str -> Adv = \\s -> lin Adv {s=s} ;\n"+
#       "mkAdV : Str -> AdV = \\s -> lin AdV {s=s} ;\n"+
 #      "mkAdA : Str -> AdA = \\s -> lin AdA {s=s} ;\n"+
 #      "mkAdN : Str -> AdN = \\s -> lin AdN {s=s} ;\n\n"),
 # "Interj":
 #      "mkInterj : Str -> Interj = \\s -> lin Interj {s=s} ;\n\n",
 #"Voc":
#       "mkVoc : Str -> Voc = \\s -> lin Voc {s=s} ;\n\n",
 "Prep":
       "mkPrep : Str -> Prep = \\s -> lin Prep {s=s} ;\n"+
       "noPrep : Prep = lin Prep {s=\"\"} ;\n\n"
  }

def guess_by_lemma(
    lang,
    how=None,
    min_examples=3,
    split=True,
    t=None,
    max_depth=3,
    min_sample_leaf=3,
    sampling="oracle",
    iters=4,
    shuffle=True,
    input_json=False
):
    print("Reading data..")
    print(f"Parameters\nNumber of examples: {t}\nSplit: {split}\nIterations: {iters}\nShuffle: {shuffle}")
    source, langcode, tables = read_data(lang)

    lang_plugin = plugins[source,lang]
    required_forms = lang_plugin.required_forms
    if not required_forms: 
        with open(f"{lang}_forms.json") as f:
            required_forms = json.load(f)
    vars = lang_plugin.vars

    if input_json:
        tables = read_json_data(lang, langcode)


    tokens = []
    code = ""
    overload_code = ""

    all_rules = {}

    get_t = lambda x: reverse_dict(x.typ.linearize()) if x.typ else x.typ_dict


    for pos, forms in tables.items():
        if len(forms) > 1:
            print(f"=={pos}==")
            lemma2class = [
                filter_tokens(tag, table, get_t(paradigm), paradigm,
                              required=required_forms.get(pos,[None])[0])
                for tag, paradigm in enumerate(forms)
                if len(paradigm.tables) >= min_examples
                for table in paradigm.tables
            ]


            tree = LemmaTree(
                pos,
                lemmas=lemma2class,
                forms=forms,
                min_examples=min_examples,
                split=split,
                how=how,
                t=t,
                max_depth=max_depth,
                min_sample_leaf=min_sample_leaf,
                sampling=sampling,
                iters=iters,
                shuffle_data=shuffle,
                vars = vars
            )
            score, preds, pos_code = tree.fit(required_forms=required_forms.get(pos,[]))
            code += pos_code
            tokens.extend(preds)
            print("\n".join([f"N={i+1}: {s}" for i, s in enumerate(score)]))

            all_rules[pos] = tree.rules

            overload_code += f"  mk{pos} = overload {{\n"
            for num in range(1, len(tree.other_forms)+1):
                overload_code += f"    mk{pos} : {(' -> '.join(['Str',]*num))} -> {pos} = reg{num if num > 1 else ''}{pos}"
                overload_code += f'{";" if num < len(tree.other_forms) else ""}   -- {"  ".join(tree.other_forms[:num])}\n'
            overload_code += "  } ;\n\n"

            if pos == "N":
                overload_code +=\
                    "  mkN2 = overload {\n"+\
                    "     mkN2 : N -> N2 = \\n -> n ** {c2 = noPrep} ;\n"+\
                    "     mkN2 : N -> Prep -> N2 = \\n,p -> n ** {c2 = p} ;\n"+\
                    "  } ;\n\n"
                overload_code +=\
                    "  mkN3 = overload {\n"+\
                    "     mkN3 : N -> N3 = \\n -> n ** {c2 = noPrep; c3 = noPrep} ;\n"+\
                    "     mkN3 : N -> Prep -> Prep -> N3 = \\n,p1,p2 -> n ** {c2 = p1; c3 = p2} ;\n"+\
                    "  } ;\n\n"
            elif pos == "A":
                overload_code +=\
                    "  mkA2 = overload {\n"+\
                    "     mkA2 : A -> A2 = \\a -> a ** {c2 = noPrep} ;\n"+\
                    "     mkA2 : A -> Prep -> A2 = \\a,p -> a ** {c2 = p} ;\n"+\
                    "  } ;\n\n"
            elif pos == "V":
                overload_code +=\
                    "  mkVV,mkVS,mkVQ,mkVA = \\v -> v ;\n\n"
                overload_code +=\
                    "  mkV2 = overload {\n"+\
                    "     mkV2 : V -> V2 = \\v -> v ** {c2 = noPrep} ;\n"+\
                    "     mkV2 : V -> Prep -> V2 = \\v,p -> v ** {c2 = p} ;\n"+\
                    "  } ;\n\n"
                overload_code +=\
                    "  mkV3 = overload {\n"+\
                    "     mkV3 : V -> V3 = \\v -> v ** {c2 = noPrep; c3 = noPrep} ;\n"+\
                    "     mkV3 : V -> Prep -> Prep -> V3 = \\v,p1,p2 -> v ** {c2 = p1; c3 = p2} ;\n"+\
                    "  } ;\n\n"+\
                    "  mkV2A = overload {\n"+\
                    "     mkV2A : V -> V2A = \\v -> v ** {c2 = noPrep; c3 = noPrep} ;\n"+\
                    "     mkV2A : V -> Prep -> Prep -> V2A = \\v,p1,p2 -> v ** {c2 = p1; c3 = p2} ;\n"+\
                    "  } ;\n\n"+\
                    "  mkV2S = overload {\n"+\
                    "     mkV2S : V -> V2S = \\v -> v ** {c2 = noPrep; c3 = noPrep} ;\n"+\
                    "     mkV2S : V -> Prep -> Prep -> V2S = \\v,p1,p2 -> v ** {c2 = p1; c3 = p2} ;\n"+\
                    "  } ;\n\n"+\
                    "  mkV2Q = overload {\n"+\
                    "     mkV2Q : V -> V2Q = \\v -> v ** {c2 = noPrep; c3 = noPrep} ;\n"+\
                    "     mkV2Q : V -> Prep -> Prep -> V2Q = \\v,p1,p2 -> v ** {c2 = p1; c3 = p2} ;\n"+\
                    "  } ;\n\n"+\
                    "  mkV2V = overload {\n"+\
                    "     mkV2V : V -> V2V = \\v -> v ** {c2 = noPrep; c3 = noPrep} ;\n"+\
                    "     mkV2V : V -> Prep -> Prep -> V2V = \\v,p1,p2 -> v ** {c2 = p1; c3 = p2} ;\n"+\
                    "  } ;\n\n"

           # overload_code += boilerplate.get(pos,"")

   # overload_code+=boilerplate.get("Adv","")
   # overload_code+=boilerplate.get("Interj","")
   # overload_code+=boilerplate.get("Voc","")
   # overload_code+=boilerplate.get("Prep","")

    with open(f"data/{lang}/Paradigms{langcode}.gf", "w") as f:
        f.write(
            f"resource Paradigms{langcode} = Morpho{langcode}  ** open Predef, Prelude, Cat{langcode}, Res{langcode} in {{\noper\n"
        )
        f.write(code)
        f.write(overload_code)
        f.write("}")

    with open(f"data/{lang}/Lexicon{langcode}.gf", "w") as f:
        f.write(f"concrete Lexicon{langcode} of Lexicon = Cat{langcode} ** open Paradigms{langcode} in {{\n")
        f.write("}")

    with open(f"data/{lang}/Grammar{langcode}.gf", "w") as f:
        f.write(f"concrete Grammar{langcode} of Grammar = TenseX ** {{\n")
        f.write("}")

    with open(f"data/{lang}/Lang{langcode}.gf", "w") as f:
        f.write("--# -path=.:../abstract\n")
        f.write(f"concrete Lang{langcode} of Lang =\n")
        f.write(f"  Grammar{langcode},\n")
        f.write(f"  Lexicon{langcode}\n")
        f.write("  ** {\n")
        f.write("\n")
        f.write("flags startcat = Phr ;\n")
        f.write("\n")
        f.write("}")

    with open(f"data/{lang}/All{langcode}Abs.gf", "w") as f:
        f.write(f"abstract All{langcode}Abs =\n")
        f.write(f"  Lang\n")
        f.write("  ** {}")

    with open(f"data/{lang}/All{langcode}.gf", "w") as f:
        f.write(f"concrete All{langcode} of All{langcode}Abs =\n")
        f.write(f"  Lang{langcode}\n")
        f.write("  **\n")
        f.write("    {} ;\n")

    unimorph_code = format_unimorph(tokens)
    with open(f"data/{lang}/unimorph_{langcode}.tsv", "w") as f:
        f.write(unimorph_code)


    with open(f"data/{lang}/rules.pickle", "wb") as f:
        pickle.dump((how,all_rules),f)

    return score

