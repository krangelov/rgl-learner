from smart_paradigms.lemma_tree import LemmaTree, filter_tokens
from smart_paradigms.utils import *
from tqdm.auto import tqdm
import random


def extract(lang, min_examples=2, split=True,
            t=[10, 50, 200], max_depth=3, min_sample_leaf=3, how="suffix", iters=4, rep=5):
    langcode, tables = read_data(lang)
    tokens = []
    avg_score = 0
    avg_len = 0
    total_scores = []
    for pos, forms in tables.items():
        if len(forms) > 1:
            print(f"=={pos}==")
            for r in tqdm(range(rep)):
                random.seed(r)
                for size in t:
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
                            how="prefix",
                            min_examples=min_examples,
                            split=split,
                            t=size,
                            max_depth=max_depth,
                            min_sample_leaf=min_sample_leaf,
                            iters=iters,
                            sampling="oracle"
                        )

                    scores, preds, _ = tree.fit()

                    for num, score in enumerate(scores):
                        total_scores.append((langcode, pos, str(num+1), str(size), str(round(score, 2)), str(r)))


    with open("updated_scores.tsv", "a") as f:
        for score in total_scores:
            f.write("\t".join(score))
            f.write("\n")

