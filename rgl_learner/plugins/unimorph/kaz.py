from rgl_learner.utils import *
import rgl_learner.plugins as plugins


iso3 = "Kaz"
source_plugin = plugins["unimorph"]


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
    param2val = {
        "Infinitive": {"INF"},
        "Mood": {"SBJV", "IMP"},
        "Polarity": {"NEG"},
        "Politeness": {"FORM", "INFM"},
        "Person": {"2", "1", "3"},
        "Number": {"PL", "SG"},
        "Tense": {"PRS", "PST"},
        "Aspect": {"PRF", "PROG"},
    }
    param_order = [
        "Infinitive",
        "Mood",
        "Tense",
        "Aspect",
        "Polarity",
        "Person",
        "Politeness",
        "Number",
    ]

    table.setdefault("INF", lemma)
    new_table = fill_empty(
        fix_table(
            table,
            param_order,
            param2val,
            fixed_names={"Polarity": "POS", "Mood": "IND"},
            exclude_list=["Tense", "Person", "Politeness", "Infinitive"],
        )
    )

    new_table["SBJV"] = new_table["SBJV"]["noAspect"]["POS"]
    new_table["IMP"] = new_table["IMP"]["noAspect"]
    return new_table


def patchN(lemma, table):
    case_types = ["NOM", "ACC", "DAT", "LOC", "GEN", "INST", "ABL"]
    pos_types = ["PSS1S", "PSS2S", "PSS3S", "PSS2P", "PSS3P", "PSS1P"]

    table.setdefault("PSS2S", {}).setdefault("FORM", {}).setdefault("SG", "-")
    table.setdefault("PSS2S", {}).setdefault("INFM", {}).setdefault("SG", "-")
    table.setdefault("PSS2S", {}).setdefault("FORM", {}).setdefault("PL", "-")
    table.setdefault("PSS2S", {}).setdefault("INFM", {}).setdefault("PL", "-")
    table.setdefault("PSS2P", {}).setdefault("FORM", {}).setdefault("PL", "-")
    table.setdefault("PSS2P", {}).setdefault("INFM", {}).setdefault("PL", "-")
    table.setdefault("PSS2P", {}).setdefault("FORM", {}).setdefault("SG", "-")
    table.setdefault("PSS2P", {}).setdefault("INFM", {}).setdefault("SG", "-")

    table["s"] = {}
    for case in case_types:
        table.setdefault(case, {}).setdefault("SG", "-")
        table.setdefault(case, {}).setdefault("PL", "-")
        table["s"].update({case: table.get(case, {})})
        table.pop(case, {})

    table["poss"] = {}
    for pos_type in pos_types:
        if pos_type not in ["PSS2S", "PSS2P"]:
            table.setdefault(pos_type, {}).setdefault("SG", "-")
            table.setdefault(pos_type, {}).setdefault("PL", "-")
        table["poss"].update({pos_type: table.get(pos_type, {})})
        table.pop(pos_type, {})
