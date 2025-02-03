from rgl_learner.paradigm_builder import LemmaTree, filter_tokens, format_unimorph
from rgl_learner.utils import *
from tqdm.auto import tqdm
import random
import sys
import json
from pprint import pprint

def extract(lang, level, min_examples=1, iters=5):
    _, langcode, train = read_data(lang, dir=f"data/{level}/train/")
    _, langcode, dev = read_data(lang, dir=f"data/{level}/dev/")
    _, langcode, test = read_data(lang, dir=f"data/{level}/test/")



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
    with open(f"{lang}_forms_{level}.json") as f:
        req_forms = json.load(f)


    for pos, forms in train.items():
        new_forms_ids = []
        ids_to_remove = []
        for i, form in enumerate(forms):
            upd_form = [x[0] for x in form.forms]
            for j, other_form in enumerate(forms[i+1:]):
                upd_other_form = [x[0] for x in other_form.forms]
                if upd_form == upd_other_form and form.pattern == other_form.pattern:
                    new_forms_ids.append((i, i+j+1))
                    ids_to_remove.append(i)
                    ids_to_remove.append(i+j+1)

       # pprint(forms)

       # for (i, j) in new_forms_ids:
       #     form = forms[i]
       #     form.tables.extend(forms[j].tables)
       #     form.var_insts.extend(forms[j].var_insts)
       #     forms.append(form)

       # for i in sorted(list(set(ids_to_remove)), key=lambda x:-x):
        #    forms.pop(i)

        #print("\n")


        train_data = list(filter(lambda x: x, [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), paradigm, required="lemma", train=True)
            for tag, paradigm in enumerate(forms)
            for table in paradigm.tables

        ]))



        dev_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), paradigm, required="lemma")
            for tag, paradigm in enumerate(dev[pos])
            for table in paradigm.tables
        ]



        test_data = [
            filter_tokens(tag, table, reverse_dict(paradigm.typ.linearize()), paradigm, required="lemma")
            for tag, paradigm in enumerate(test[pos])
            for table in paradigm.tables
        ]

        if test_data:
            datadict[pos] = [train_data, dev_data, test_data]

    best_hyp = defaultdict(list)

    for pos, ddict in datadict.items():
        results = []
        train_data, dev_data, _ = ddict
        for hyperparameter in hyperparameters:
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
                        sampling=hyperparameter["sampling"],
                        mc_lemma_form="lemma"
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
    pos_scores = {}
    code = ""
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
            sampling=best_hyp[pos]["sampling"],
            mc_lemma_form=req_forms[pos][0]
        )

        scores, preds, pos_code = tree.fit()
        num_pp = scores.index(max(scores))
        preds, scores, coverage, cov, error_list = tree.evaluate(num_pp, test=True, data=test_data,
                                                                 form_pattern=False)
        test_scores.extend(coverage)
        pos_scores[pos] = scores["coverage"]
        tokens.extend(preds)
        code += pos_code

        print("Test set: ", len(test_data))

    print("Coverage score: ", sum(test_scores) / len(test_scores))

    unimorph_code = format_unimorph(tokens)
    with open(f"unimorph_{langcode}_{level}.tsv", "w") as f:
        f.write(unimorph_code)

    with open(f"Paradigms{langcode}_{level}.gf", "w") as f:
        f.write(
            f"resource Paradigms{langcode} = Morpho{langcode}  ** open Predef, Prelude, Cat{langcode}, Res{langcode} in {{\noper\n"
        )
        f.write(code)
        f.write("}")
    #print(test_scores)
    return len(datadict),sum(test_scores) / len(test_scores), pos_scores, best_hyp

