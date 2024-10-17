iso3 = "Gre"

params = {
   "comparative": None,
   "superlative": None,
  'masculine': ('Masc', 'Gender'),
  'feminine': ('Fem', 'Gender'),
  'neuter': ('Neuter', 'Gender'),
  'singular': ('Sg', 'Number'),
  'plural': ('Pl', 'Number'),
  'nominative': ('Nom','Case'),
  'accusative': ('Acc','Case'),
  'genitive': ('Gen','Case'),
  'vocative': ('Voc','Case')
}

params_order = dict(zip(params.keys(), range(len(params))))

ignore_tags = ["common","literally","formal","colloquial","alternative","usually","informal","regional","abbreviation","transcription","active","rare","Medieval","mainly","uncountable",
               "Cretan","literary","dated","also","class","dual","dative"]

def preprocess(record):
    if record.get("pos") == "noun":
        categories = record.get("categories",[])

        if 'Greek non-lemma forms' in categories:
            return False

        found = False

        def extract_gender(categories):
            nonlocal found
            if 'Greek masculine nouns' in categories:
                found = True
                return ["masculine"]
            elif 'Greek feminine nouns' in categories:
                found = True
                return ["feminine"]
            elif 'Greek neuter nouns' in categories:
                found = True
                return ["neuter"]
            return []

        record["tags"] = extract_gender(categories)
        for sense in record["senses"]:
            sense["tags"] = extract_gender(sense.get("categories",[]))

        if not found:
            record["tags"] = ["masculine"]

    return True

def patchPOS(lemma,tag,table):
    if tag == "noun" and lemma in ["αμμωνιακός","οδοντοφατνιακός"]:
        return "adj"
    if tag == "noun" and lemma in ["ηρωοποιώ"]:
        return "verb"
    return tag

def filter_lemma(lemma, pos, table):
    if pos == 'noun' and lemma in ["απαυτός","αυνανιστικός","μελοδραματικός","μεγαλειώδης","βομβαρδίζομαι"]:
        return True
    return False
    

lincats = {
  "noun": {"s": ["Number", "Case", str]},
  "adj":  {"s": ["Gender", "Number", "Case", str]},
  "verb": {"s": ["Tense", str]}
}


def patchN(lemma,table):
    table.setdefault("singular", {}).setdefault("nominative", lemma)
    if type(table.get("plural")) == str:
        table["plural"] = {"nominative": table.pop("plural")}
    elif type(table.get("plural")) == dict:
        table["plural"].setdefault("nominative", table["plural"].pop(None,"-"))
    for number in ["singular","plural"]:
        for case in ["nominative","genitive","accusative","vocative"]:
            table.setdefault(number, {}).setdefault(case, "-")
    table["plural"].pop("second-person",None)
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("neuter",None)

def patchA(lemma,table):
    for number in ["singular","plural"]:
        t = table.pop(number,None)
        if t:
            table.setdefault("masculine",{}).setdefault(number,{})
    for g in ["masculine","feminine","neuter"]:
        t = table.setdefault(g,{})
        if type(t) == str:
            t = {"singular": {"nominative": t}}
            table[g] = t
        else:
            t.setdefault("singular", {}).setdefault("nominative", t.pop(None,"-"))
        n = t.pop("nominative",None)
        if n:
            t.setdefault("singular",n)
        for number in ["singular","plural"]:
            for case in ["nominative","genitive","accusative","vocative"]:
                t.setdefault(number, {}).setdefault(case, "-")
    table.pop("comparative",None)
    table.pop("superlative",None)
