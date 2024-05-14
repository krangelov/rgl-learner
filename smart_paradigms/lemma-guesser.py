import sys

import numpy as np

from utils import *
from kaz import transform

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


def write_gf_code(df, rules):
    for rule in rules:
        df = get_gf_paradigm(df, rule["class_tag"])


def guess_by_lemma(lang, lemma_form, pos_tag):
    print("Reading data..")
    data, tokens = read_data(lang, pos_tag)
    class2paradigm = {x["class_tag"]: x for x in data}
    df = transform(tokens, lemma_form)
    X = df.drop(["class_tag", "pred_class", "lemma"], axis=1)
    y = df["class_tag"]

    print("Building a tree..")
    annotations = build_tree(X, y)
    annotations = set([annotation.get_text().split(" <= ")[0].strip() for annotation in annotations if
             annotation.get_text().split(" <= ")[0].strip() in df.columns])

    feat_subsets = get_subset(annotations, len(annotations)+1)
    print("Cross validating..")
    scores = cross_validate(feat_subsets, df, class2paradigm, tokens, lemma_form)
    scores = sorted(scores, key=lambda x: -x[1])
    rules = get_rules(df, scores[0][0])
    return rules

if __name__ == "__main__":
    guess_by_lemma(sys.argv[1], sys.argv[2], sys.argv[3])