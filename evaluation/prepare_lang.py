import sys
from tqdm.auto import tqdm
import os
import rgl_learner.morpho_cats
import rgl_learner.morpho_cats_2
import rgl_learner.morpho_cats_3
import rgl_learner.learn_paradigms

def prepare_lang(lang):
    compress = False
    train_high = f"conll2017/all/task2/{lang}-train-high"
    train_medium = f"conll2017/all/task2/{lang}-train-medium"
    train_low = f"conll2017/all/task2/{lang}-train-low"
    dev = f"conll2017/all/task2/{lang}-uncovered-dev"
    test = f"conll2017/answers/task2/{lang}-uncovered-test"

    pathname = f"data/medium/train/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, train_medium,
                                                   dirname=pathname, level="medium",
                                                   compress_table=compress)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="medium")

    pathname = f"data/medium/dev/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, dev,
                                                   dirname=pathname, level="medium",
                                                   compress_table=compress)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="medium")


    pathname = f"data/medium/test/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, test,
                                                   dirname=pathname, level="medium",
                                                   compress_table=compress)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="medium")

    pathname = f"data/low/train/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, train_low,
                                                   dirname=pathname, level="low",
                                                   compress_table=compress)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="low")

    pathname = f"data/low/dev/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, dev,
                                                   dirname=pathname, level="low",
                                                   compress_table=compress)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="low")

    pathname = f"data/low/test/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, test,
                                                   dirname=pathname, level="low",
                                                   compress_table=compress)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="low")

    if os.path.exists(train_high):
        pathname = f"data/high/train/"
        if not os.path.exists(os.path.join(pathname, lang)):
            os.makedirs(os.path.join(pathname, lang))
        unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, train_high,
                                                    dirname=pathname, level="high",
                                                   compress_table=compress)
        rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="high")


        pathname = f"data/high/dev/"
        if not os.path.exists(os.path.join(pathname, lang)):
            os.makedirs(os.path.join(pathname, lang))
        unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, dev,
                                                       dirname=pathname, level="high",
                                                       compress_table=compress)
        rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="high")

        pathname = f"data/high/test/"
        if not os.path.exists(os.path.join(pathname, lang)):
            os.makedirs(os.path.join(pathname, lang))
        unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, test,
                                                       dirname=pathname, level="high",
                                                        compress_table=compress)
        rgl_learner.learn_paradigms.learn(lang, dirname=pathname, level="high")




