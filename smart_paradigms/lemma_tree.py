import sys
import pickle
from collections import defaultdict, Counter
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
import numpy as np
from smart_paradigms.utils import *
from scipy.stats import entropy
import re
from random import shuffle


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
    ):

        self.pos = pos
        self.forms = forms

        if split:
            shuffle(lemmas)
            if t and t < len(lemmas):
                # lemmas = sort(lemmas, key=lambda x: x[1].count("-")/len(x[1]), reverse=True)
                full_lemmas = [
                    lemma
                    for lemma in lemmas
                    if lemma[1].count("-") / len(lemma[1]) <= 0.5
                ]
                partial_lemmas = [
                    lemma
                    for lemma in lemmas
                    if lemma[1].count("-") / len(lemma[1]) > 0.5
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
        self.other_forms = []

    def update_rules(self, label, value, prefix):
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
        if prefix and self.rules[tuple(prefix)] != value:  # previous forms
            rule = prefix + [
                label,
            ]
            self.rules[tuple(rule)] = value
        elif not prefix:
            self.rules[(label,)] = value

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

    def build_tree(self, lemmas=None, position=1, prefix=[]):
        entropy_scores, label2classes = self.build_node(lemmas, position)
        position += 1
        for label, (entropy_score, class_dist) in entropy_scores.items():
            if entropy_score == 0:
                self.update_rules(label, label2classes[label][0][1], prefix=prefix)
            else:
                maxval = max(class_dist.values())
                res = list(filter(lambda x: class_dist[x] == maxval, class_dist))
                if len(res) == 1:
                    self.update_rules(label, res[0], prefix=prefix)
                else:
                    classes = Counter([x[1] for x in lemmas if x[1] in res])
                    maxval = max(classes.values())

                    for i in res:
                        if classes[i] == maxval:
                            self.update_rules(label, i, prefix=prefix)
                            break
                if (
                    position <= self.max_depth
                    and len(label2classes[label]) >= self.min_sample_leaf
                ):
                    self.build_tree(label2classes[label], position, prefix=prefix)

    def fit(self, forms=None, start=0, prefix=[], iters=4, new_form=None):
        # TODO: 4) entropy instead of errors
        for i in range(iters):
            if not forms:
                forms = self.train
                prefix = []
                self.build_tree(forms, prefix=prefix)
            else:
                for affix, form in forms.items():
                    lemma2class = [
                        ((tokens[new_form], tag), list(tokens.values()))
                        for tokens, tag in form
                    ]
                    self.train, self.train_tokens = list(zip(*lemma2class))
                    placeholder_prefix = list(affix)
                    self.build_tree(self.train, start + 1, placeholder_prefix)
            preds, scores, avg, length, errors, forms = (
                self.evaluate()
            )
            preds, scores, avg, length, errors = self.compute_metrics()
            #print(scores)

            if errors:
                for error in errors:  # sample a new form
                    if error[0] not in self.other_forms:
                        new_form = error[0]
                        self.other_forms.append(new_form)
                        break
            else:
                break

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
        self.rules = dict(
            sorted(
                self.rules.items(),
                key=lambda x: len(x[0][0]) if x[0] else len(x[0]),
                reverse=True,
            )
        )

        forms_by_tag = defaultdict(list)

        for (lemma, tag), token in zip(self.train, self.train_tokens):
            y_true.append(tag)
            pred = -1
            for rule, pred_tag in self.rules.items():
                if (self.how == "suffix" and lemma.endswith(rule)) or (
                    self.how == "prefix" and lemma.startswith(rule)
                ):
                    pred = pred_tag
                    true_labels = reverse_dict(self.forms[tag].typ.linearize())
                    true_forms = dict(zip(true_labels, token))
                    forms_by_tag[rule].append((true_forms, tag))
                    break

            y_pred.append(pred)

        coverage = []
        preds = []
        errors = []

        for (lemma, tag), tokens, pred in zip(self.test, self.tokens, y_pred):
            table = self.forms[pred]

            true_labels = reverse_dict(self.forms[tag].typ.linearize())
            pred_labels = reverse_dict(table.typ.linearize())

            true_forms = dict(zip(true_labels, tokens))

            tokens = [c for c in tokens if c != "-"]
            if tokens:
                base = tokens[0]
            else:
                base = lemma[0]

            pred_forms = form_token(base, table.assignments, pred_labels, table.forms)

            preds.append((self.pos, lemma, pred_forms))

            cscore, token_errors = coverage_score(true_forms, pred_forms)

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
            forms_by_tag,
        )

    def compute_metrics(self):
        y_true = []
        y_pred = []
        self.rules = dict(
            sorted(
                self.rules.items(),
                key=lambda x: (len(x[0]), len(x[0][0])) if x[0] else len(x[0]),
                reverse=True,
            )
        )

        for (lemma, tag), token in zip(self.test, self.tokens):
            true_labels = reverse_dict(self.forms[tag].typ.linearize())
            true_forms = dict(zip(true_labels, token))

            y_true.append(tag)
            pred = -1
            for rule, pred_tag in self.rules.items():
                passes = []
                for num, subrule in enumerate(rule):
                    val = False
                    if num == 0:
                        if (self.how == "suffix" and lemma.endswith(rule)) or (
                            self.how == "prefix" and lemma.startswith(rule)
                        ):
                            val = True
                    elif self.other_forms:
                        form = self.other_forms[num - 1]
                        if (
                            self.how == "suffix" and true_forms[form].endswith(rule)
                        ) or (
                            self.how == "prefix" and true_forms[form].startswith(rule)
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

            true_labels = reverse_dict(self.forms[tag].typ.linearize())
            pred_labels = reverse_dict(table.typ.linearize())

            true_forms = dict(zip(true_labels, tokens))

            tokens = [c for c in tokens if c != "-"]
            if tokens:
                base = tokens[0]
            else:
                base = lemma[0]

            pred_forms = form_token(base, table.assignments, pred_labels, table.forms)

            preds.append((self.pos, lemma, pred_forms))

            cscore, token_errors = coverage_score(true_forms, pred_forms)

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


def write_gf_code(lang, rules, pos_tag):
    gf_code = f"""formBasedSelection{pos_tag} : Str -> {pos_tag}\n= \\lemma -> case lemma of {{\n"""
    rules = sorted(rules.items(), key=lambda x: len(x[0]), reverse=True)
    for rule, class_tag in rules:
        tag = str(class_tag + 1).zfill(3)
        gf_code += f"""\t\t_ + "{rule}" => mk{pos_tag}{tag} lemma;\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace(";\n}", "\t\n}")
    return gf_code


def guess_by_lemma(
    lang,
    how="suffix",
    min_examples=2,
    split=True,
    t=100,
    max_depth=3,
    min_sample_leaf=2,
    required_forms=None,
):
    print("Reading data..")
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
            # code += write_gf_code(langcode, tree.rules, pos)
            lemma2class = [
                ((table[0].split("_")[0].lower(), tag), table[1])
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
            )
            tree.fit()

    # print("Average score:", round(avg_score/avg_len, 3))

    # with open(f"Inflection{langcode}.gf", "w") as f:
    #    f.write(
    #        f"resource Inflection{langcode} = open Prelude, Res{langcode}, Paradigms{langcode} in {{\noper\n"
    #    )
    #    f.write(code)
    #    f.write("}")

    # unimorph_code = format_unimorph(tokens)
    # with open(f"unimorph_{langcode}.tsv", "w") as f:
    #    f.write(unimorph_code)
