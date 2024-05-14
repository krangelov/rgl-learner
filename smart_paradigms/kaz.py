import pandas as pd
from sklearn.preprocessing import LabelEncoder

vowels = ["і", "ү", "ұ", "е", "и", "у", "э", "ы", "о", "ә", "ө", "а"]
consonants = ['м', 'н', 'ң', 'п', 'т', 'к', 'қ', 'б', 'д', 'г', 'с', 'ш', 'х', 'з', 'ж', 'ғ', 'л', 'й', 'у', 'р']
vowel_dict = {x: num+1 for num, x in enumerate(vowels)}
consonant_dict = {x: num+1 for num, x in enumerate(consonants)}

voiced = ['м', 'н', 'ң', 'б', 'д', 'г',  'з', 'ж', 'ғ', 'л', 'й', 'у', 'р']
nasal = ["м", "н", "ң"]
stop = ["п", "т", "к", "қ", "б", "д", "г"]
fricative = ["с", "ш",  "х", "з", "ж", "ғ"]
approx = ['л', 'й', 'у']
tap = ["р"]
closed = ["і", "ү", "ы", "ұ"]
back = ["а", "ү", "о", "ұ"]
rounded = ["ә", "ү", "о", "ұ"]

def encode(x):
    label_encoder = LabelEncoder()
    x = label_encoder.fit_transform(x)
    return x


def get_feats(lemma):
    lemma_len = len(lemma)
    vowels_in_lemma = [x for x in lemma if x in vowels]
    cons_in_lemma = [x for x in lemma if x in consonants]
    if_vowel = 1 if lemma[-1] in vowels else 0
    if_voiced = 1 if cons_in_lemma and cons_in_lemma[-1] in voiced else 0
    if_nasal = 1 if cons_in_lemma and cons_in_lemma[-1] in nasal else 0
    if_stop = 1 if cons_in_lemma and cons_in_lemma[-1] in stop else 0
    if_fricative = 1 if cons_in_lemma and cons_in_lemma[-1] in fricative else 0
    if_approx = 1 if cons_in_lemma and cons_in_lemma[-1] in approx else 0
    if_tap = 1 if cons_in_lemma and cons_in_lemma[-1] in tap else 0
    if_rounded = 1 if vowels_in_lemma and vowels_in_lemma[-1] in rounded else 0
    if_back = 1 if vowels_in_lemma and vowels_in_lemma[-1] in back else 0
    if_closed = 1 if vowels_in_lemma and vowels_in_lemma[-1] in closed else 0
    num_syllables = len(vowels_in_lemma)
    ending = lemma[-1]
    bigram_ending = lemma[-2:]
    trigram_ending = lemma[-3:]
    cluster = "".join(["c" if x in consonants else "v" for x in trigram_ending])
    return lemma_len, if_vowel, if_voiced, if_nasal, if_stop, if_fricative,\
    if_approx, if_tap, if_rounded, if_back, if_closed, num_syllables,\
    ending, bigram_ending, trigram_ending, cluster


def transform(tokens, lemma_form):
    lemmas, classes = list(zip(*[(x[lemma_form], x["class_tag"]) for x in tokens if lemma_form in x]))
    feats = [get_feats(lemma) for lemma in lemmas]
    feat_names = ["Length", "If_vowel", "If_voiced", "If_nasal", "If_stop",
                  "If_fricative", "If_approx", "If_tap", "If_rounded",
                  "If_back", "If_closed", "Num syllables", "Ending", "2gram_ending",
                  "3gram_ending", "Cluster"]
    df = pd.DataFrame(feats)
    df.columns = feat_names
    df["class_tag"] = classes
    df["Ending"] = encode(df["Ending"])
    df["2gram_ending"] = encode(df["2gram_ending"])
    df["3gram_ending"] = encode(df["3gram_ending"])
    df["Cluster"] = encode(df["Cluster"])
    df["pred_class"] = df["class_tag"]
    df["lemma"] = lemmas
    return df