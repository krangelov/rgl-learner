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
    return forms, tags


def patchV(lemma, table):
    table.setdefault("INF", lemma)
    new_table = fill_empty(
        fix_table(
            table,
            param_order,
            parameters,
            fixed_names={"Polarity": "POS", "Mood": "IND"},
            exclude_list=["Tense", "Person", "Politeness", "Infinitive", "Possession", "Case"],
        )
    )

    new_table["SBJV"] = new_table["SBJV"]["noAspect"]["POS"]
    new_table["IMP"] = new_table["IMP"]["noAspect"]

    for asp in ["PROG","noAspect"]:
        for pol in ["POS","NEG"]:
            new_table["IND"]["PRS"][asp][pol]["1"] = new_table["IND"]["PRS"][asp][pol]["1"]["noFormality"]
            new_table["IND"]["PRS"][asp][pol]["3"] = new_table["IND"]["PRS"][asp][pol]["3"]["noFormality"]
    for asp in ["PRF","PROG","noAspect"]:
        for pol in ["POS","NEG"]:
            new_table["IND"]["PST"][asp][pol]["1"] = new_table["IND"]["PST"][asp][pol]["1"]["noFormality"]
            new_table["IND"]["PST"][asp][pol]["3"] = new_table["IND"]["PST"][asp][pol]["3"]["noFormality"]
    new_table["SBJV"]["1"] = new_table["SBJV"]["1"]["noFormality"]
    new_table["SBJV"]["3"] = new_table["SBJV"]["3"]["noFormality"]
    return new_table


def patchN(lemma, table):
    case_types = ["NOM", "ACC", "DAT", "LOC", "GEN", "INST", "ABL"]
    pos_types = ["PSS1S", "PSS2S", "PSS3S", "PSS2P", "PSS3P", "PSS1P"]

    table["s"] = {}
    for case in case_types:
        table.setdefault(case, {}).setdefault("SG", "-")
        table.setdefault(case, {}).setdefault("PL", "-")
        table["s"].update({case: table.get(case, {})})
        table.pop(case, {})

    table.setdefault("PSS2S", {}).setdefault("FORM", {}).setdefault("SG", "-")
    table.setdefault("PSS2S", {}).setdefault("INFM", {}).setdefault("SG", "-")
    table.setdefault("PSS2S", {}).setdefault("FORM", {}).setdefault("PL", "-")
    table.setdefault("PSS2S", {}).setdefault("INFM", {}).setdefault("PL", "-")
    table.setdefault("PSS2P", {}).setdefault("FORM", {}).setdefault("PL", "-")
    table.setdefault("PSS2P", {}).setdefault("INFM", {}).setdefault("PL", "-")
    table.setdefault("PSS2P", {}).setdefault("FORM", {}).setdefault("SG", "-")
    table.setdefault("PSS2P", {}).setdefault("INFM", {}).setdefault("SG", "-")
    for pos_type in pos_types:
        if pos_type not in ["PSS2S", "PSS2P"]:
            table.setdefault(pos_type, {}).setdefault("SG", "-")
            table.setdefault(pos_type, {}).setdefault("PL", "-")

    table["poss"] = {
        "SG": {"1": table.pop("PSS1S", {}),
               "2": table.pop("PSS2S", {}),
               "3": table.pop("PSS3S", {})
              },
        "PL": {"1": table.pop("PSS1P", {}),
               "2": table.pop("PSS2P", {}),
               "3": table.pop("PSS3P", {})
              }
    }
