from evaluation.prepare_lang import prepare_lang
from evaluation.run_conll import extract
import pandas as pd
from collections import defaultdict
from tqdm.auto import tqdm

def run():
    langs = ["albanian", "hebrew", "polish", "arabic", "hindi",
             "portuguese", "armenian", "hungarian", "quechua",
             "basque", "icelandic", "romanian", "bengali", "irish",
             "russian", "bulgarian", "italian", "scottish-gaelic",
             "catalan", "khaling", "serbo-croatian", "czech", "kurmanji",
             "slovak", "danish", "latin", "slovene", "dutch", "latvian",
             "sorani", "english", "lithuanian", "spanish", "estonian",
             "lower-sorbian", "swedish", "faroese", "macedonian",
             "turkish", "finnish", "navajo", "ukrainian", "french", "northern-sami",
             "urdu", "georgian", "norwegian-bokmal", "welsh", "german", "norwegian-nynorsk",
             "haida", "persian"]

    results = defaultdict(list)
    detailed_results = []
    for lang in tqdm(langs):
        print(lang)
        try:
            prepare_lang(lang)
            for level in ["low", "medium", "high"]:
                pos_num, result_by_lang, test_scores, best_hyp = extract(lang, level)
                results[lang].append(result_by_lang)
                for pos, hyp in best_hyp.items():
                    detailed_results.append([lang,
                                            pos,
                                            level,
                                            hyp["max_depth"],
                                            hyp["min_sample_leaf"],
                                            hyp["sampling"],
                                            test_scores[pos]]
                                            )
            results[lang].append(pos_num)
        except Exception as e:
            print(e)
            for i in range(3-len(results[lang])):
                results[lang].append("-")
            results[lang].append(0)


    df = pd.DataFrame(results)
    df.to_csv("results.tsv", sep="\t")

    detailed = pd.DataFrame(detailed_results)
    detailed.to_csv("detailed_results.tsv", sep="\t")

