from rgl_learner.paradigm_builder import LemmaTree, filter_tokens, format_unimorph
from rgl_learner.utils import *
from tqdm.auto import tqdm
import random
import sys

def extract(lang, level, min_examples=1, iters=4):
    langcode, source, train = read_data(lang, dir=f"data/train/{level}")
    langcode, source, dev = read_data(lang, dir=f"data/dev")
    langcode, source, test = read_data(lang, dir=f"data/test")

    tokens = []

    cov_scores = []
    results = []
    tokens = []
    hyperparameters = [{"max_depth": 3, "min_sample_leaf": 1, "sampling": "oracle"},
                       {"max_depth": 3, "min_sample_leaf": 2, "sampling": "oracle"},
                       {"max_depth": 5, "min_sample_leaf": 1, "sampling": "oracle"},
                       {"max_depth": 5, "min_sample_leaf": 2, "sampling": "oracle"},
                       {"max_depth": 3, "min_sample_leaf": 1, "sampling": "entropy"},
                       {"max_depth": 3, "min_sample_leaf": 2, "sampling": "entropy"},
                       {"max_depth": 5, "min_sample_leaf": 1, "sampling": "entropy"},
                       {"max_depth": 5, "min_sample_leaf": 2, "sampling": "entropy"},
                       {"max_depth": 3, "min_sample_leaf": 1, "sampling": "edit-distance"},
                       {"max_depth": 3, "min_sample_leaf": 2, "sampling": "edit-distance"},
                       {"max_depth": 5, "min_sample_leaf": 1, "sampling": "edit-distance"},
                       {"max_depth": 5, "min_sample_leaf": 2, "sampling": "edit-distance"},
                       {"max_depth": 3, "min_sample_leaf": 1, "sampling": "random"}
                       ]
    datadict = {}
    pos_tags = []
    for pos, forms in train.items():
        pos_tags.append(pos)
        train_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()))
            for tag, paradigm in enumerate(forms)
            for table in paradigm.tables
            if len(paradigm.tables) >= min_examples
        ]

        dev_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()))
            for tag, paradigm in enumerate(dev[pos])
            for table in paradigm.tables
            if len(paradigm.tables) >= min_examples
        ]

        test_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()))
            for tag, paradigm in enumerate(test[pos])
            for table in paradigm.tables
            if len(paradigm.tables) >= min_examples
        ]
        datadict[pos] = [train_data, dev_data, test_data]
    for hyperparameter in hyperparameters:
        print("hyperparameter: ", hyperparameter)
        for pos in pos_tags:

            train_date, dev_data, test_data = datadict[pos]

            tree = LemmaTree(
                                pos,
                                train_data,
                                forms,
                                test_lemmas=dev_data,
                                min_examples=min_examples,
                                split=True,
                                max_depth=hyperparameter["max_depth"],
                                min_sample_leaf=hyperparameter["min_sample_leaf"],
                                iters=iters,
                                sampling=hyperparameter["sampling"]
                )


            scores, preds, _ = tree.fit()
            num_pp = scores.index(max(scores))

            preds, scores, coverage, cov, error_list = tree.evaluate(num_pp, test=True, data=dev_data)
            cov_scores.extend(coverage)
            hyperparameter["num_pp"] = num_pp
            print("Dev set: ", scores["coverage"])

        print("Evaluation on dev set")
        print("Dev set: ", len(dev_data))
        print("Coverage score: ", sum(cov_scores) / len(cov_scores))
        results.append(sum(cov_scores) / len(cov_scores))

    best_hyp = hyperparameters[results.index(max(results))]
    print(max(results), best_hyp)

    test_scores = []
    for pos in pos_tags:
        tree = LemmaTree(
            pos,
            train_data,
            forms,
            min_examples=min_examples,
            split=False,
            max_depth=best_hyp["max_depth"],
            min_sample_leaf=best_hyp["min_sample_leaf"],
            iters=4,
            sampling=best_hyp["sampling"]
        )
        test_data = datadict[pos][2]
        scores, preds, _ = tree.fit()
        num_pp = scores.index(max(scores))
        preds, scores, coverage, cov, error_list = tree.evaluate(num_pp, test=True, data=test_data)
        test_scores.extend(coverage)
        print("Test set: ", scores["coverage"])
        tokens.extend(preds)

    print("Evaluation on test set")
    print("Test set: ", len(test_data))
    print("Coverage score: ", sum(test_scores) / len(test_scores))
    results.append(sum(test_scores) / len(test_scores))

    unimorph_code = format_unimorph(tokens)
    with open(f"unimorph_{langcode}_{level}.tsv", "w") as f:
        f.write(unimorph_code)

