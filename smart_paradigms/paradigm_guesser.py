import argparse
import sys
import re
from itertools import chain

import numpy as np
import pandas as pd
from rgl_learner.learn_paradigms import write_lexicon
from smart_paradigms.utils import *

def get_morphemes(features, tag):
    morpheme, feat = features
    position = -1 if morpheme == "suffix" else 0
    val = tag[feat].split("+")[position]
    return morpheme, feat, val

def get_forms(token, val_1, morpheme, paradigm):
    if morpheme == "prefix":
        base = token.split(val_1, maxsplit=1)[-1]
    elif morpheme == "suffix":
        base = token.rsplit(val_1, maxsplit=1)[0]
    else:
        base = ""

    forms = {k: re.sub(r"base_\d", "", x.replace("base_1", base).replace("+", "").strip()) for k, x in paradigm.items()}
    return forms

def parse_annotations(annotations):
    features = []
    for annotation in annotations:
        text = annotation.get_text()
        if "ends" in text:
            features.append(("suffix", text.split("ends with")[0].strip()))
        elif "starts" in text:
            features.append(("prefix", text.split("starts with")[0].strip()))
    return features

def cross_validation(tokens, features, class2paradigm, classes):
    par_coverage = list()
    for num, token in enumerate(tokens):
        forms = {}
        for tag in classes:
            if len(features) == 1:
                morpheme_1, feat_1, val_1 = get_morphemes(features[0], tag)
                if token.get(feat_1) and (token.get(feat_1).endswith(val_1) or token.get(feat_1).startswith(val_1)):
                    forms = get_forms(token.get(feat_1), val_1, morpheme_1, class2paradigm[tag["class_tag"]])
                    break

            elif len(features) == 2:
                morpheme_1, feat_1, val_1 = get_morphemes(features[0], tag)
                morpheme_2, feat_2, val_2 = get_morphemes(features[1], tag)
                if (not token.get(feat_1) or token.get(feat_1).endswith(val_1) or token.get(feat_1).startswith(val_1)) and (not token.get(feat_2) or token.get(feat_2).endswith(val_2) or token.get(feat_2).startswith(val_2)) \
                and (token.get(feat_1) or token.get(feat_2)):
                    if token.get(feat_1):
                        forms = get_forms(token.get(feat_1), val_1, morpheme_1, class2paradigm[tag["class_tag"]])
                        break
                    elif token.get(feat_2):
                        forms = get_forms(token.get(feat_2), val_2, morpheme_2, class2paradigm[tag["class_tag"]])
                        break

            elif len(features) == 3:
                morpheme_1, feat_1, val_1 = get_morphemes(features[0], tag)
                morpheme_2, feat_2, val_2 = get_morphemes(features[1], tag)
                morpheme_3, feat_3, val_3 = get_morphemes(features[2], tag)
                if (not token.get(feat_1) or token.get(feat_1).endswith(val_1) or token.get(feat_1.startswith(val_1))) and (not token.get(feat_2) or token.get(feat_2).endswith(val_2) or token.get(feat_2).startswith(val_2)) \
                and (not token.get(feat_3) or token.get(feat_3).endswith(val_3) or token.get(feat_3).startswith(val_3)) and (token.get(feat_1) or token.get(feat_2) or token.get(feat_3)):
                    if token.get(feat_1):
                        forms = get_forms(token.get(feat_1), val_1, morpheme_1, class2paradigm[tag["class_tag"]])
                        break
                    elif token.get(feat_2):
                        forms = get_forms(token.get(feat_2), val_2, morpheme_2, class2paradigm[tag["class_tag"]])
                        break
                    elif token.get(feat_3):
                        forms = get_forms(token.get(feat_3), val_3, morpheme_3, class2paradigm[tag["class_tag"]])
                        break
            else:
                raise NotImplementedError("Does not support choice of paradigm based on more than 3 forms")
        if forms:
            par_coverage.append(coverage_score(token, forms))
        else:
            par_coverage.append([0, 0, 0])
    return np.mean(par_coverage, axis=0)


def write_gf_code(rules, pos_tag):
    first_line = " -> ".join(["Str",]*(len(rules[0])-1))
    second_line = ", ".join([f"f{i+1}" for i in range(len(rules[0])-1)])

    gf_code = f"""formBasedSelection{pos_tag} : {first_line} => {pos_tag}Class\n= \\{second_line} -> case <{second_line}> of {{\n"""
    for num, rule in enumerate(rules):
        values = list(rule.values())
        endings = [x.replace("base_1", "x").replace("+", ' + "')+'"' if x!="base_1" else "x" for x in values[:-1]]
        gf_code += f"""\t\t<{", ".join(endings)}> -> mk{pos_tag}{rule["class_tag"]} x;\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace("; }", "}")
    return gf_code

def guess_paradigm(lang):
    print("Reading data..")
    tables = read_data(lang)
    gf_code = ""
    for pos_tag, data in tables.items():
        print(f"=={pos_tag}==")
        labels = reverse_dict(data[0].typ.linearize())
        classes, tokens, forms, = list(
                zip(*[(num, form_tokens(table.var_insts, table.forms, labels), clean_forms(labels, table.forms)) for num, table in enumerate(data)]))

        tokens = list(chain.from_iterable(tokens))
        df = pd.DataFrame(forms)
        df = df.replace("nonExist", None)
        df["class_tag"] = classes
        class2paradigm = dict(zip(classes, forms))

        feature_list = make_feat_list(df, df.columns)
        feats, labels = prepare_data(df, feature_list, class_tags=df.class_tag)
        if len(feats) > 5:
            print("Building a tree..")
            annotations = build_tree(feats, labels)
            annotations = parse_annotations(annotations)
            feat_subsets = get_subset(annotations, 4)
            df["pred_class"] = df["class_tag"]

            print("Cross validating..")
            cross_valid_scores = list()
            for subset in feat_subsets:
                _, features = list(zip(*subset))
                classes = get_freq_class(df, list(features))
                scores = cross_validation(tokens, subset, class2paradigm, classes)
                cross_valid_scores.append(["+".join([s[1] for s in subset]), ] + list(scores))
            cross_valid_scores = sorted(cross_valid_scores, key=lambda x: -x[1])
            print("Best features: ", cross_valid_scores[0][0], "\t", cross_valid_scores[0][1],)
            print("Writing rules..")
            if cross_valid_scores:
                rules = get_rules(df, cross_valid_scores[0][0])
                gf_code += write_gf_code(rules, pos_tag)
        else:
            print(f"Not enough data for {pos_tag}")
    with open(f"Inflection{lang}.gf", "w") as f:
        f.write(gf_code)

