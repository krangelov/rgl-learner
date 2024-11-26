import sys
from tqdm.auto import tqdm
import os
import rgl_learner.morpho_cats
import rgl_learner.morpho_cats_2
import rgl_learner.morpho_cats_3
import rgl_learner.learn_paradigms

def prepare_lang(lang):

    for root, dirs, files in tqdm(os.walk("conll2017/all/task2")):
        for f in files:
            if lang in f:
                print("Processing {}".format(os.path.join(root, f)))
                pathname = None
                if "train" in f:
                    lang, split, level = f.rsplit("-", maxsplit=2)
                    pathname = f"data/{split}/{level}/"
                elif "uncovered-dev" in f:
                    lang, _, split = f.rsplit("-", maxsplit=2)
                    pathname = f"data/{split}/"
                if pathname:
                    if not os.path.isdir(pathname + lang):
                        os.mkdir(pathname + lang)

                    print(f"Running morpho_cats on {lang}")
                    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, os.path.join(root, f),
                                                                       dirname=pathname)

                    print(f"Running learn_paradigms on {lang}")
                    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)

                    for root, dirs, files in os.walk("../conll2017/all/task2"):
                        for f in files:
                            if lang in f:
                                print("Processing {}".format(os.path.join(root, f)))
                                pathname = None
                                if "train" in f:
                                    lang, split, level = f.rsplit("-", maxsplit=2)
                                    pathname = f"data/{split}/{level}/"
                                elif "uncovered-dev" in f:
                                    lang, _, split = f.rsplit("-", maxsplit=2)
                                    pathname = f"data/{split}/"
                                if pathname:
                                    if not os.path.isdir(pathname + lang):
                                        os.mkdir(pathname + lang)

                                    # try:
                                    print(f"Running morpho_cats on {lang}")
                                    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, os.path.join(root, f),
                                                                                   dirname=pathname)

                                    print(f"Running learn_paradigms on {lang}")
                                    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)



    for root, dirs, files in os.walk("conll2017/answers/task2"):
        for f in files:
                            if lang in f:
                                print("Processing {}".format(os.path.join(root, f)))
                                pathname = None
                                if "train" in f:
                                    lang, split, level = f.rsplit("-", maxsplit=2)
                                    pathname = f"data/{split}/{level}/"
                                elif "uncovered-test" in f:
                                    lang, _, split = f.rsplit("-", maxsplit=2)
                                    pathname = f"data/{split}/"
                                if pathname:
                                    if not os.path.isdir(pathname + lang):
                                        os.mkdir(pathname + lang)

                                    print(f"Running morpho_cats on {lang}")
                                    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, os.path.join(root, f),
                                                                                       dirname=pathname)

                                    print(f"Running learn_paradigms on {lang}")
                                    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)
