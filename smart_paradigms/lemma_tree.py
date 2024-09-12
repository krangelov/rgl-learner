import sys
import pickle
from collections import defaultdict, Counter
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
import numpy as np
from smart_paradigms.utils import *
from scipy.stats import entropy
import re

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
    for (pos, lemma, forms) in tokens:
        for tag, form in forms.items():
            um_tag = ";".join([pos,] + [gf2unimorph[t] for t in tag.split(";") if t in gf2unimorph])
            unimorph.append("\t".join([lemma, form, um_tag]))
    return "\n".join(unimorph)

class LemmaTree:
    def __init__(self,
                 pos: str,
                 forms: list,
                 max_depth: int = 3,
                 min_samples_leaf: int = 3,
                 min_examples: int = 1,
                 how: str = "suffix",
                 stopping: str = None,
                 split: bool = False):

        self.pos = pos
        self.forms = forms
        if split:
            lemmas = [((lemma[0].split("_")[0], tag), lemma[1]) for tag, paradigm in enumerate(forms) for lemma in
                      paradigm.tables]
            train, test = train_test_split(lemmas, shuffle=True)
            labels, _ = list(zip(*train))
            count_labels = Counter(list(zip(*labels))[1])
            self.train = [x for x in labels if count_labels[x[1]] >= min_examples]

        else:
            train = [((lemma[0].split("_")[0], tag), lemma[1]) for tag, paradigm in enumerate(forms) for lemma in
                       paradigm.tables if len(paradigm.tables) >= min_examples]
            test = train
            self.train, _ = list(zip(*train))

        self.test, self.tokens = list(zip(*test))

        if stopping == "max_length":
            self.max_depth = max([len(x[0]) for x in self.train]) + 1
        else:
            self.max_depth = max_depth

        self.min_samples_leaf = min_samples_leaf
        self.rules = defaultdict()
        self.regex = defaultdict()
        self.how = how

    def update_rules(self, label, value):
        found = False
        for i in range(len(label)):
            if self.how == "suffix":
                prev = label[i:]
            else:
                prev = label[:-i]
            if prev in self.rules and self.rules[prev] == value:
                found = True
                break
        if not found:
            self.rules[label] = value

    def calculate_entropy(self, labels):
        label2entropy = defaultdict(list)
        for label, tags in labels.items():
            lemmas, classes = list(zip(*tags))
            classes = Counter(classes)
            class_dist = {class_name: one_class/sum(classes.values()) for class_name, one_class in classes.items()}
            label2entropy[label] = (entropy(list(class_dist.values())), class_dist)
        return label2entropy

    def build_node(self, lemmas, position):
        label2classes = defaultdict(list)
        for lemma, tag in lemmas:
            if len(lemma) > position:
                if self.how == "suffix":
                    label2classes[lemma[-position:]].append((lemma, tag))
                else:
                    label2classes[lemma[:position]].append((lemma, tag))

        return self.calculate_entropy(label2classes), label2classes



    def build_tree(self, lemmas, position=1):
        entropy_scores, label2classes = self.build_node(lemmas, position)
        position += 1
        for label, (entropy_score, class_dist) in entropy_scores.items():
            if entropy_score == 0:
                self.update_rules(label, label2classes[label][0][1])
            else:
                maxval = max(class_dist.values())
                res = list(filter(lambda x: class_dist[x] == maxval, class_dist))
                if len(res) == 1:
                    self.update_rules(label, res[0])
                else:
                    classes = Counter([x[1] for x in lemmas if x[1] in res])
                    maxval = max(classes.values())

                    for i in res:
                        if classes[i] == maxval:
                            self.update_rules(label, i)
                            break
                if position <= self.max_depth and len(label2classes[label]) >= self.min_samples_leaf:
                    self.build_tree(label2classes[label], position)




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
        self.rules = dict(sorted(self.rules.items(), key=lambda x: len(x[0]), reverse=True))

        for lemma, tag in self.test:
            y_true.append(tag)
            pred = -1
            for l in range(self.max_depth, 0, -1):
                for rule, pred_tag in self.rules.items():
                    if len(rule) == l and ((self.how == "suffix" and lemma.endswith(rule)) or (self.how == "prefix" and lemma.startswith(rule))):
                        pred = pred_tag
                        break
                else:
                    continue
                break
          #  print(lemma, pred)
            y_pred.append(pred)

        coverage = []
        preds = []

        for (lemma, tag), tokens, pred in zip(self.test, self.tokens, y_pred):
            table = self.forms[pred]

            true_labels = reverse_dict(self.forms[tag].typ.linearize())
            pred_labels = reverse_dict(table.typ.linearize())

            true_forms = dict(zip(true_labels, tokens))

            tokens = [c for c in tokens if c != "-"]
            if tokens:
                base = tokens[0]
            else:
                base = lemma
            pred_forms = form_token(base, table.assignments, pred_labels, table.forms)

            preds.append((self.pos, lemma, pred_forms))

            coverage.extend(coverage_score(true_forms, pred_forms))

        return preds, {"accuracy": accuracy_score(y_true, y_pred),
                "f1": f1_score(y_true, y_pred, average="micro"),
                "precision": precision_score(y_true, y_pred, average="micro"),
                "recall": recall_score(y_true, y_pred, average="micro"),
                "coverage": sum(coverage) / len(coverage)}

def write_gf_code(lang, rules, pos_tag):
    gf_code = f"""formBasedSelection{pos_tag} : Str -> {pos_tag}\n= \\lemma -> case lemma of {{\n"""
    rules = sorted(rules.items(), key=lambda x: len(x[0]), reverse=True)
    for rule, class_tag in rules:
        tag = str(class_tag+1).zfill(3)
        gf_code += f"""\t\t_ + "{rule}" => mk{pos_tag}{tag} lemma;\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace(";\n}", "\t\n}")
    return gf_code

def guess_by_lemma(lang, multiple_forms=False):
        print("Reading data..")
        langcode, tables = read_data(lang)
        tokens = []
        code = ""
        for pos, forms in tables.items():
            if len(forms) > 1:
                print(f"=={pos}==")
                if multiple_forms:
                    continue
                else:
                    tree = LemmaTree(pos, forms, how="suffix", max_depth=3, min_examples=2, min_samples_leaf=2)
                    tree.build_tree(tree.train)
                    tree.linearize_tree()

                    preds, scores = tree.evaluate()

                tokens.extend(preds)
                print(scores)

                code += write_gf_code(langcode, tree.rules, pos)

        with open(f"Inflection{langcode}.gf", "w") as f:
            f.write(f"resource Inflection{langcode} = open Prelude, Res{langcode}, Paradigms{langcode} in {{\noper\n")
            f.write(code)
            f.write("}")

        unimorph_code = format_unimorph(tokens)
        with open(f"unimorph_{langcode}.tsv", "w") as f:
            f.write(unimorph_code)