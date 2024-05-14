import argparse
import sys
from itertools import chain

import numpy as np
import pandas as pd
from paradigm_extraction.parse_paradigm import write_lexicon
from smart_paradigms.utils import *

def cross_validation(tokens, features, class2paradigm, classes):
    par_coverage = list()
    for num, token in enumerate(tokens):
        forms = {}
        for tag in classes:
            if len(features) == 1:
                feat_1 = features[0]
                val_1 = tag[feat_1].split("+")[-1].replace('"', "")
                if token.get(features[0]) and token.get(features[0]).endswith(val_1):
                    paradigm = class2paradigm[tag["class_tag"]]
                    if token.get(feat_1):
                        base = token.get(feat_1).rsplit(val_1, maxsplit=1)[0]
                        forms = {k: x.replace("base_1", base).replace("+", "").strip("}").strip() for k, x in paradigm.items()}
                      #  print(token, forms)
                        break

            elif len(features) == 2:
                feat_1 = features[0]
                val_1 = tag[feat_1].split("+")[-1]
                feat_2 = features[1]
                val_2 = tag[feat_2].split("+")[-1]
                if (not token.get(feat_1) or token.get(features[0]).endswith(val_1)) and (not token.get(feat_2) or token.get(feat_2).endswith(val_2)) \
                and (token.get(feat_1) or token.get(feat_2)):
                    paradigm = class2paradigm[tag["class_tag"]]
                    if token.get(feat_1):
                        base = token.get(feat_1).rsplit(val_1, maxsplit=1)[0]
                        forms = {k: x.replace("base_1", base).replace("+", "").strip("}").strip() for k, x in paradigm.items()}
                        break
            elif len(features) == 3:
                feat_1 = features[0]
                val_1 = tag[feat_1].split("+")[-1]
                feat_2 = features[1]
                val_2 = tag[feat_2].split("+")[-1]
                feat_3 = features[2]
                val_3 = tag[feat_3].split("+")[-1]
                if (not token.get(feat_1) or token.get(features[0]).endswith(val_1)) and (not token.get(feat_2) or token.get(feat_2).endswith(val_2)) \
                and (not token.get(feat_3) or token.get(feat_3).endswith(val_3)) and (token.get(feat_1) or token.get(feat_2) or token.get(feat_3)):
                    paradigm = class2paradigm[tag["class_tag"]]
                    if token.get(feat_1):
                        base = token.get(feat_1).rsplit(val_1, maxsplit=1)[0]
                        forms = {k: x.replace("base_1", base).replace("+", "").strip() for k, x in paradigm.items()}
                        break
            else:
                raise NotImplementedError("Does not support choice of paradigm based on more than 3 forms")
        if forms:
            par_coverage.append(coverage_score(token, forms))
    return np.mean(par_coverage, axis=0)


def write_gf_code(rules, pos_tag):
    first_line = " -> ".join(["Str",]*(len(rules[0])-1))
    second_line = ", ".join([f"f{i+1}" for i in range(len(rules[0])-1)])

    paradigm_code = ""
    gf_code = f"""formBasedSelection{pos_tag} : {first_line} => {pos_tag}Class\n= \\{second_line} -> case <{second_line}> of {{\n"""
    for num, rule in enumerate(rules):
        values = list(rule.values())
        endings = [x.replace("base_1", "x").replace("+", ' + "')+'"' if x!="base_1" else "x" for x in values[:-1]]
        gf_code += f"""\t\t<{", ".join(endings)}> -> mk{pos_tag}{rule["class_tag"]} x;\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace("; }", "}")
    return paradigm_code, gf_code

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
            annotations = set([annotation.get_text().split("ends with")[0].strip() for annotation in annotations if
                         "ends with" in annotation.get_text()])
            feat_subsets = get_subset(annotations, 4)
            df["pred_class"] = df["class_tag"]

            print("Cross validating..")
            cross_valid_scores = list()
            for subset in feat_subsets:
                classes = get_freq_class(df, list(subset))
                scores = cross_validation(tokens, subset, class2paradigm, classes)
                cross_valid_scores.append(["+".join(subset), ] + list(scores))
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

