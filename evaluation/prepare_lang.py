import sys
from tqdm.auto import tqdm
import os
import rgl_learner.morpho_cats
import rgl_learner.morpho_cats_2
import rgl_learner.morpho_cats_3
import rgl_learner.learn_paradigms

def prepare_lang(lang):
    train_high = f"conll2017/all/task2/{lang}-train-high"
    train_medium = f"conll2017/all/task2/{lang}-train-medium"
    train_low = f"conll2017/all/task2/{lang}-train-low"
    dev = f"conll2017/all/task2/{lang}-uncovered-dev"
    test = f"conll2017/answers/task2/{lang}-uncovered-test"

    pathname = f"data/train/medium/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, train_medium,
                                                   dirname=pathname)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)


    pathname = f"data/train/low/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, train_low,
                                                   dirname=pathname)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)

    if os.path.exists(train_high):
        pathname = f"data/train/high/"
        if not os.path.exists(os.path.join(pathname, lang)):
            os.makedirs(os.path.join(pathname, lang))
        unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, train_high,
                                                                           dirname=pathname)
        rgl_learner.learn_paradigms.learn(lang, dirname=pathname)


    pathname = f"data/dev/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, dev,
                                                   dirname=pathname)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)


    pathname = f"data/test/"
    if not os.path.exists(os.path.join(pathname, lang)):
        os.makedirs(os.path.join(pathname, lang))
    unknown_tags = rgl_learner.morpho_cats_3.learn("unimorph", lang, test,
                                                   dirname=pathname)
    rgl_learner.learn_paradigms.learn(lang, dirname=pathname)


