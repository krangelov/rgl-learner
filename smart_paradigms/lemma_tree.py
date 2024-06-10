import sys
import pickle
from collections import defaultdict, Counter
from sklearn.metrics import accuracy_score, f1_score, precision_score, recall_score
import numpy as np
from smart_paradigms.utils import *
from scipy.stats import entropy

class LemmaTree:
    def __init__(self,
                 lemmas,
                 max_depth=3,
                 min_samples_leaf=3,
                 stopping=None):
        self.lemmas = lemmas
        if stopping == "max_length":
            self.max_depth = max([len(x[0]) for x in self.lemmas]) + 1
        else:
            self.max_depth = max_depth

        self.min_samples_leaf = min_samples_leaf
        self.rules = defaultdict()
        self.regex = defaultdict()

    def calculate_entropy(self, labels):
        label2entropy = defaultdict(list)
        for label, tags in labels.items():
            lemmas, classes = list(zip(*tags))
            classes = Counter(classes)
            classes = [one_class/sum(classes.values()) for one_class in classes.values()]
            label2entropy[label] = entropy(classes)
        return label2entropy

    def check_sister_nodes(self, label, entropy, labels):
        non_zeros = np.count_nonzero(np.asarray(list(entropy.values())))
        if non_zeros == 1:
            other_label = set([l[1] for other_label, values in labels.items() for l in values if other_label != label])
            cur_labels = [l[1] for l in labels[label]]
            if len(other_label) == 1 and next(iter(other_label)) in cur_labels:
                return next(iter(other_label))

    def build_node(self, lemmas, position):
        label2classes = defaultdict(list)
        for lemma, tag in lemmas:
            if len(lemma) > position:
                label2classes[lemma[-position:]].append((lemma, tag))
        return self.calculate_entropy(label2classes), label2classes

    def build_tree(self, lemmas, position=1):
        entropy_scores, label2classes = self.build_node(lemmas, position)
        position += 1
        for label, entropy_score in entropy_scores.items():
            if entropy_score == 0:
                self.rules[label] = label2classes[label][0][1]
            else:
                class_tag = self.check_sister_nodes(label, entropy_scores, label2classes)
                if class_tag:
                    self.rules[label] = class_tag
                elif position <= self.max_depth and len(label2classes[label]) >= self.min_samples_leaf:
                    self.build_tree(label2classes[label], position)
                else:
                    self.rules[label] = next(iter(Counter([l[1] for l in label2classes[label]])))

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

    def compute_metrics(self):
        accuracy = 0
        y_true = []
        y_pred = []
        for lemma, tag in self.lemmas:
            y_true.append(tag)
            pred = -1
            for rule, pred_tag in self.rules.items():
                if lemma.endswith(rule):
                    pred = pred_tag
                    break
            y_pred.append(pred)
        return {"accuracy": accuracy_score(y_true, y_pred),
                "f1": f1_score(y_true, y_pred, average="micro"),
                "precision": precision_score(y_true, y_pred, average="micro"),
                "recall": recall_score(y_true, y_pred, average="micro")}

def write_gf_code(rules, pos_tag):
    gf_code = f"""formBasedSelection{pos_tag} : Str => {pos_tag}Class\n= \\lemma -> case lemma of {{\n"""
    for rule, class_tag in rules.items():
        gf_code += f"""\t\t<x + "{rule}"> -> mk{pos_tag}{class_tag} x;\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace("; }", "}")
    return gf_code

def guess_by_lemma(lang):
    print("Reading data..")
    tables = read_data(lang)
    for pos, forms in tables.items():
        if len(forms) > 1:
            print(f"=={pos}==")
            lemma2class = [(lemma[0].split("_")[0], tag) for tag, paradigm in enumerate(forms) for lemma in paradigm.tables]
            lemma_tree = LemmaTree(lemma2class)
            lemma_tree.build_tree(lemma2class)
            lemma_tree.linearize_tree()
            #print(lemma_tree.regex)
            scores = lemma_tree.compute_metrics()
            print(scores)

            code = write_gf_code(lemma_tree.rules, pos)
            with open(f"Inflection{lang}.gf", "w") as f:
                f.write(code)

