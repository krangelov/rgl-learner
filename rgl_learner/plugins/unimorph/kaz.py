from rgl_learner.utils import *
import rgl_learner.plugins as plugins


iso3 = "Kaz"
source_plugin = plugins["unimorph"]

params = {
    "INF": ("Infinitive", "Infinitive"),
    "IND": ("Indicative", "Mood"),
    "IMP": ("Imperative_Jussive", "Mood"),
    "SBJV": ("Subjunctive", "Mood"),
    "FUT": ("Fut", "Tense"),
    "PRS": ("Pres", "Tense"),
    "PST": ("Past", "Tense"),
    "PSS1P": ("Poss1Pl", "Possession"),
    "PSS1S": ("Poss1Sg", "Possession"),
    "PSS2S": ("Poss2Sg", ["Formality"], "Possession"),
    "PSS2P": ("Poss2Pl", ["Formality"], "Possession"),
    "PSS3S": ("Poss3Sg", "Possession"),
    "PSS3P": ("Poss3Pl", "Possession"),
    "PRF": ("Perfect", "Aspect"),
    "PROG": ("Progressive", "Aspect"),
    "NOM": ("Nom", "Case"),
    "ACC": ("Acc", "Case"),
    "DAT": ("Dat", "Case"),
    "GEN": ("Gen", "Case"),
    "ABL": ("Ablat", "Case"),
    "INST": ("Instr", "Case"),
    "LOC": ("Loc", "Case"),
    "FRML": ("Formal", "Case"),
    "POS": ("Pos", "Polarity"),
    "NEG": ("Neg", "Polarity"),
    "1": ("P1", "Person"),
    "2": ("P2", ["Formality"], "Person"),
    "3": ("P3", "Person"),
    "INFM": ("Informal", "Formality"),
    "FORM": ("Formal", "Formality"),
    "SG": ("Sg", "Number"),
    "PL": ("Pl", "Number"),
}

param_order = []
parameters = defaultdict(set)

default_params = {"Polarity": "Pos", "Mood": "Indicative"}

required_forms = {
  "N": ['s;Nom;Sg'],
   "V": ["infinitive"],
}

for tag, param in params.items():
    parameters[param[-1]].add(tag)
    if param[-1] not in param_order:
        param_order.append(param[-1])

def preprocess(record):
    # fixing latin to cyrilic letters
    def fix(s):
        return s.replace("a","а").replace("o","о").replace("p","р").replace("e","е").replace("x","х")
    record[0] = fix(record[0])
    record[1] = fix(record[1])
    return record

def merge_tags(pos, forms, w, tags):
    if "SBJV" in tags:
        tags.remove("FUT")
    if "IMP" in tags:
        tags.remove("2")
    if "FRML" in tags:
        tags.remove("FRML")
        tags.append("FORM")
    if "LSSPEC1" in tags:
        tags.remove("LSSPEC1")
        tags.append("FORM")
    if "LSSPEC2" in tags:
        tags.remove("LSSPEC2")
        tags.append("INFM")
    return [(w, tags)]


def patchN(lemma, table):
    case_types = ["NOM", "ACC", "DAT", "LOC", "GEN", "INST", "ABL"]

    table["s"] = {}
    for case in case_types:
        table.setdefault(case, {}).setdefault("SG", "-")
        table.setdefault(case, {}).setdefault("PL", "-")
        table["s"].update({case: table.get(case, {})})
        table.pop(case, {})


    table["poss"] = table.pop("noCase", {})
    return table

def patchV(lemma, table):
    table["infinitive"] = lemma