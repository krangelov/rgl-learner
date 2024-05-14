import sys
from itertools import chain

import numpy as np

from smart_paradigms.utils import *
from smart_paradigms.kaz import transform

def get_scores_for_lemmas(lemma2tag, class2paradigm, tokens, lemma_form):
    scores_per_lemma = list()
    for lemma, tag in lemma2tag:
        paradigm = class2paradigm[tag]
        ending = paradigm.get(lemma_form).strip("}").strip().rsplit("+")[-1]
        base = lemma.rsplit(ending, maxsplit=1)[0]
        forms = {k: x.replace("base_1", base).replace("+", "").strip("}").strip() for k, x in paradigm.items()}
        scores_per_lemma.append(coverage_score(tokens.get(lemma), forms))
    return np.mean(scores_per_lemma, axis=0)


def cross_validate(feat_subsets, df, class2paradigm, tokens, lemma_form):
    cross_valid_scores = list()
    tokens_dict = {x.get(lemma_form): x for x in tokens if lemma_form in x}

    for subset in feat_subsets:
        classes = get_freq_class(df, list(subset))
        new_df = pd.DataFrame(classes)
        merged = pd.merge(df, new_df, on=list(subset), how="left")
        lemma2tag = merged[['lemma', 'class_tag_y']].values
        scores = get_scores_for_lemmas(lemma2tag, class2paradigm, tokens_dict, lemma_form)
        cross_valid_scores.append(["+".join(subset), ] + list(scores))
    return cross_valid_scores

def write_gf_code(rules, pos_tag, encoded_feats):
    first_line = " -> ".join(["Str",]*(len(rules[0])-1))
    second_line = ", ".join([f"f{i+1}" for i in range(len(rules[0])-1)])

    paradigm_code = ""
    gf_code = f"""formBasedSelection{pos_tag} : {first_line} => {pos_tag}Class\n= \\{second_line} -> case <{second_line}> of {{\n"""
    for rule in rules:
        endings = encoded_feats["3gram_ending"][rule["3gram_ending"]]
        gf_code += f"""\t\t<x + "{endings}"> -> mk{pos_tag}{rule["class_tag"]} x;\n"""
    gf_code += "} ;\n"
    gf_code = gf_code.replace("; }", "}")
    return paradigm_code, gf_code



def guess_by_lemma(lang, pos_tag, lemma_form):
    print("Reading data..")
    tables = read_data(lang)
    data = tables[pos_tag]
    labels = reverse_dict(data[0].typ.linearize())
    classes, lemmas, tokens, forms, = list(
        zip(*[(num, table.lemmas, form_tokens(table.var_insts, table.forms, labels), clean_forms(labels, table.forms)) for num, table
              in enumerate(data)]))
    class2paradigm = dict(zip(classes, forms))

    if lemma_form:
        df, encoded_feat = transform(tokens, classes, lemma_form)
    else:
        df, encoded_feat = transform(lemmas, classes)

    X = df.drop(["class_tag", "pred_class", "lemma"], axis=1)
    y = df["class_tag"]

    print("Building a tree..")
    annotations = build_tree(X, y)
    annotations = set([annotation.get_text().split(" <= ")[0].strip() for annotation in annotations if
             annotation.get_text().split(" <= ")[0].strip() in df.columns])

    feat_subsets = get_subset(annotations, len(annotations)+1)
    print("Cross validating..")
    tokens = list(chain.from_iterable(tokens))
    scores = cross_validate(feat_subsets, df, class2paradigm, tokens, lemma_form)
    scores = sorted(scores, key=lambda x: -x[1])
    print("Best features: ", scores[0][0], "\t", scores[0][1], )
    print("Writing rules..")
    rules = get_rules(df, scores[0][0])
    paradigm_code, gf_code = write_gf_code(rules, pos_tag, encoded_feat)
    print(gf_code)
   # paradigm_code, gf_code = write_gf_code(class2code, rules, pos_tag)
   # infl_code += paradigm_code
   # par_code += gf_code
    return rules
