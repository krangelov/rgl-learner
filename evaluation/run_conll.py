from rgl_learner.paradigm_builder import LemmaTree, filter_tokens, format_unimorph
from rgl_learner.utils import *
from tqdm.auto import tqdm
import random
import sys
import json

def extract(lang, level, min_examples=1, iters=10):
    langcode, source, train = read_data(lang, dir=f"data/train/{level}")
    langcode, source, dev = read_data(lang, dir=f"data/dev")
    langcode, source, test = read_data(lang, dir=f"data/test")


    cov_scores = []
    tokens = []
    hyperparameters = [{"max_depth": 3, "min_sample_leaf": 1, "sampling": "oracle"},
                       {"max_depth": 1, "min_sample_leaf": 1, "sampling": "oracle"},
                       {"max_depth": 3, "min_sample_leaf": 2, "sampling": "oracle"},
                       {"max_depth": 5, "min_sample_leaf": 1, "sampling": "oracle"},
                       {"max_depth": 5, "min_sample_leaf": 2, "sampling": "oracle"},
                       {"max_depth": 3, "min_sample_leaf": 1, "sampling": "entropy"},
                       {"max_depth": 3, "min_sample_leaf": 2, "sampling": "entropy"},
                       {"max_depth": 5, "min_sample_leaf": 1, "sampling": "entropy"},
                       {"max_depth": 5, "min_sample_leaf": 2, "sampling": "entropy"},
                       {"max_depth": 1, "min_sample_leaf": 1, "sampling": "entropy"},
                       {"max_depth": 1, "min_sample_leaf": 1, "sampling": "edit-distance"},
                       {"max_depth": 3, "min_sample_leaf": 1, "sampling": "edit-distance"},
                       {"max_depth": 3, "min_sample_leaf": 2, "sampling": "edit-distance"},
                       {"max_depth": 5, "min_sample_leaf": 1, "sampling": "edit-distance"},
                       {"max_depth": 5, "min_sample_leaf": 2, "sampling": "edit-distance"},
                       #{"max_depth": 3, "min_sample_leaf": 1, "sampling": "random"}
                       ]
    datadict = {}
    with open(f"{lang}_forms.json") as f:
        req_forms = json.load(f)

    for pos, forms in train.items():
        train_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), paradigm, required=req_forms[pos][0])
            for tag, paradigm in enumerate(forms)
            for table in paradigm.tables
            if len(paradigm.tables) >= min_examples
        ]

        dev_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), paradigm, required=req_forms[pos][0])
            for tag, paradigm in enumerate(dev[pos])
            for table in paradigm.tables
            if len(paradigm.tables) >= min_examples
        ]

        test_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), paradigm, required=req_forms[pos][0])
            for tag, paradigm in enumerate(test[pos])
            for table in paradigm.tables
            if len(paradigm.tables) >= min_examples
        ]
        if test_data:
            datadict[pos] = [train_data, dev_data, test_data]

    best_hyp = defaultdict(list)

    for pos, ddict in datadict.items():
        results = []
        for hyperparameter in hyperparameters:
            train_data, dev_data, test_data = ddict
            tree = LemmaTree(
                                    pos,
                                    train_data,
                                    train[pos],
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

            results.append(sum(cov_scores) / len(cov_scores))

        best_hyp[pos] = hyperparameters[results.index(max(results))]
   # print(max(results), best_hyp)

    test_scores = []
    for pos, data in datadict.items():
        print(f"=={pos}==")

        train_data, dev_data, test_data = data
        tree = LemmaTree(
            pos,
            train_data,
            train[pos],
            test_lemmas=dev_data,
            min_examples=min_examples,
            split=True,
            max_depth=best_hyp[pos]["max_depth"],
            min_sample_leaf=best_hyp[pos]["min_sample_leaf"],
            iters=5,
            sampling=best_hyp[pos]["sampling"]
        )
        test_data = datadict[pos][2]
        scores, preds, _ = tree.fit()
        num_pp = scores.index(max(scores))
        preds, scores, coverage, cov, error_list = tree.evaluate(num_pp, test=True, data=test_data,
                                                                 form_pattern=False)
        test_scores.extend(coverage)
        print("Test set: ", scores["coverage"], "\n")
        print(best_hyp[pos])
        tokens.extend(preds)

    print("Test set: ", len(test_data))
    print("Coverage score: ", sum(test_scores) / len(test_scores))
    print(best_hyp)
    results.append(sum(test_scores) / len(test_scores))

    unimorph_code = format_unimorph(tokens)
    with open(f"unimorph_{langcode}_{level}.tsv", "w") as f:
        f.write(unimorph_code)
    return sum(test_scores) / len(test_scores)

