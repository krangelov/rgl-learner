from rgl_learner.utils import *
from itertools import chain
import rgl_learner.plugins as plugins


def nested_key_exists(d, keys):
    if keys and d:
        if isinstance(d.get(keys[0]), str):
            return True
        else:
            return nested_key_exists(d.get(keys[0]), keys[1:])
    return False


iso3 = "Gle"
source_plugin = plugins["wiktionary"]

params = {
    "relative": ("Relative", "Relative_Form"),
    "positive_adj": ("Positive", "Comparison"),
    "negative": ("Neg", "Polarity"),
    "positive": ("Pos", "Polarity"),
    "transitive": ("Transitive", "Transitivity"),
    "mutation": ("Mutation", "MutationType"),
    "mutation-radical": ("Mutation_radical", "MutationType"),
    "prothesis-t": ("Prothesis_t", "MutationType"),
    "prothesis-h": ("Prothesis_h", "MutationType"),
    "eclipsis": ("Eclipsis", "MutationType"),
    "lenition": ("Lenition", "MutationType"),
    "strong": ("Strong", "MutationType"),
    "weak": ("Weak", "MutationType"),
    "mutation-nasal": ("Mutation_nasal", "MutationType"),
    "third_person": ("P3", "Person"),
    "autonomous": ("Autonomous", "Person"),
    "participle": ("Part", "Participle"),
    "independent": ("Independent", "Dependency"),
    "dependent": ("Dependent", "Dependency"),
}

ignore_tags = [
    "adjective",
    "canonical",
    "diminutive",
    "romanization",
    "table-tags",
    "inflection-template",
    "multiword-construction",
    "error-unknown-tag",
    "analytic",
    "emphatic",
    "archaic",
    "dialectal",
    "triggers-lenition",
    "triggers-eclipsis",
    "triggers-no-mutation",
    "usually",
    "triggers-h-prothesis",
    "obsolete",
    "abbreviation",
    "determiner",
    "with-genitive",
    "in-certain-phrases",
    "noun-from-verb",
    "error-unrecognized-form",
    "dependent",
    "uncommon",
    "slang",
    "Chinese",
    "Western",
    "substantive",
    "transitive",
    "not comparable"
]

source_plugin.params.update(params)

params_order = dict(zip(source_plugin.params.keys(), range(len(source_plugin.params))))


def filter_lemma(lemma, pos, table):
    if pos == "name" or pos == "det":
        return True
   # if pos == "noun":
   #     values = set(
   #         chain.from_iterable(i.keys() for i in table.values() if type(i) == dict)
   #     )
   #     values = values | table.keys()
   #     if ("masculine" in values) or ("feminine" in values):
   #         return True

    if " " in lemma:
        return True

    if lemma == "Ó":
        return True

    return False


def filter_form(w):
    if "as verbal noun" in w or "as substantive" in w:
        return True
    if w == "not comparable":
        return True
    return False


def patchPOS(lemma, pos, table):
    if pos == "noun" and table.get("comparative"):
        return "adj"

    if pos == "verb" and (table.get("indefinite") or table.get("genitive")):
        return "noun"

    if pos == "adj" and table.get("indefinite"):
        return "noun"
    return pos


def merge_tags(pos, forms, w, tags):
    if (
        "mutation-radical" in tags
        or "mutation-nasal" in tags
        or "prothesis-t" in tags
        or "prothesis-h" in tags
        or "lenition" in tags
        or "eclipsis" in tags
    ) and "mutation" in tags:
        tags.remove("mutation")
    if "indefinite" in tags and "feminine" in tags:
        tags.remove("feminine")
    if ("indefinite" in tags and "masculine" in tags) or (
        tags == ["genitive", "masculine", "singular"]
    ):
        tags.remove("masculine")
    if "past" in tags:
        if "habitual" in tags:
            tags.append("past_habitual")
            tags.remove("past")
            tags.remove("habitual")
        if "participle" in tags:
            tags.append("past_participle")
            tags.remove("past")
            tags.remove("participle")
    if pos == "noun":
        if "feminine" in tags:
            tags.remove("feminine")
        elif "masculine" in tags:
            tags.remove("masculine")

    return forms, tags


def fix_tags(tag):
    if tag == None:
        return "normal_form"
    if tag == "third_person":
        return "third-person"
    return tag


def patchN(lemma, table):
    params = {
        "Case": {"genitive", "nominative", "dative", "vocative"},
        "Number": {"plural", "singular"},
        "MutationType": {
            "mutation",
            "mutation-nasal",
            "prothesis-t",
            "mutation-radical",
            "prothesis-h",
            "eclipsis",
            "lenition",
            "weak",
            "strong",
        },
        "Species": {"indefinite", "definite"},
    }
    param_order = ["Species", "Case", "Number", "MutationType"]
    fixed_names = {}

    for defin in params["Species"]:
        for case in params["Case"]:
            for number in params["Number"]:
                table.setdefault(defin, {}).setdefault(case, {}).setdefault(number, "-")

    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))

    if "indefinite" in new_table and "vocative" in new_table["indefinite"]:
        new_table["vocative"] = new_table["indefinite"]["vocative"]
        new_table["indefinite"].pop("vocative")
        if new_table.get("definite") and new_table["definite"] != "-":
            new_table["definite"].pop("vocative")

    if "noSpecies" in new_table:
        if (
            "noCase" in new_table["noSpecies"]
            and "noNumber" in new_table["noSpecies"]["noCase"]
        ):
            new_table["MutationType"] = new_table["noSpecies"]["noCase"]["noNumber"]
        elif "indefinite" not in new_table:
            new_table["indefinite"] = new_table["noSpecies"]
        new_table.pop("noSpecies")

    if "MutationType" not in new_table:
        new_table["MutationType"] = {}
        for typename in params["MutationType"]:
            new_table["MutationType"].setdefault(typename, "-")

    return dict(sorted(new_table.items()))


def patchV(lemma, table):
    params = {
        "Mood": {"conditional", "subjunctive", "imperative", "indicative"},
        "MutationType": {
            "prothesis-t",
            "weak",
            "eclipsis",
            "lenition",
            "strong",
            "prothesis-h",
            "mutation-nasal",
            "mutation",
            "mutation-radical",
        },
        "Tense": {
            "past_habitual",
            "present",
            "past",
            "future",
        },
        "Number": {"singular", "plural"},
        "Person": {"third-person", "first-person", "second-person", "autonomous"},
        "Relative_Form": {"relative"},
        "Participle": {"past_participle"},
    }
    param_order = [
        "Participle",
        "Mood",
        "Tense",
        "Relative_Form",
        "Person",
        "Number",
        "MutationType",
    ]

    per_num_table = {}
    per_num_table.setdefault("first-person", {}).setdefault("singular", "-")
    per_num_table.setdefault("first-person", {}).setdefault("plural", "-")
    per_num_table.setdefault("second-person", {}).setdefault("singular", "-")
    per_num_table.setdefault("second-person", {}).setdefault("plural", "-")
    per_num_table.setdefault("third-person", {}).setdefault("singular", "-")
    per_num_table.setdefault("third-person", {}).setdefault("plural", "-")
    per_num_table.setdefault("autonomous", "-")
    per_num_table.setdefault("relative", "-")

    table.setdefault("past_participle", "-")
   # table.setdefault("indicative", {})
    table.setdefault("conditional", per_num_table)
  #  table.setdefault("subjunctive", {})
    table.setdefault("imperative", per_num_table)

    for tense in params["Tense"]:
        table.setdefault("subjunctive", {}).setdefault(tense, {}).setdefault("relative", "-")
        table.setdefault("indicative", {}).setdefault(tense, {})
        for person in params["Person"]:
            if person == "autonomous":
                #table.setdefault(tense, {}).setdefault(person, "-")
                table.setdefault("subjunctive",{}).setdefault(tense, {}).setdefault(person, "-")
               # table.setdefault("indicative", {}).setdefault(tense, {})
            else:
                 for number in params["Number"]:
           #         table.setdefault(tense, {}).setdefault(person, {}).setdefault(number, "-")
                    table.setdefault("subjunctive", {}).setdefault(tense, {}).setdefault(person, {})
           #         table.setdefault("indicative", {}).setdefault(tense, {}).setdefault(person, {}).setdefault(number, "-")

    fixed_names = {"Mood": "indicative"}
    new_table = fill_empty(
        fix_table(
            table,
            param_order,
            params,
            fixed_names,
            exclude_list=["Participle", "Relative_Form"],
        )
    )

    if "imperative" in new_table and new_table["imperative"] != "-":
        new_table["imperative"] = new_table["imperative"]["noTense"]
    if "conditional" in new_table and new_table["conditional"] != "-":
        new_table["conditional"] = new_table["conditional"]["noTense"]

    if nested_key_exists(
        new_table, ["indicative", "noTense", "noPerson", "noNumber", "mutation"]
    ):
        new_table["MutationType"] = new_table["indicative"]["noTense"]["noPerson"][
            "noNumber"
        ]
    else:
        new_table["MutationType"] = {
            mutation: "-" for mutation in params["MutationType"]
        }

    if "noTense" in new_table["indicative"]:
        new_table["indicative"].pop("noTense")

    # if len(new_table) == 1 and "Mutation" in new_table:
    #     new_table.pop("Mutation")
    return dict(sorted(new_table.items()))


def patchPrep(lemma, table):
    params = {
        "MutationType": {
            "prothesis-t",
            "weak",
            "eclipsis",
            "lenition",
            "strong",
            "prothesis-h",
            "mutation-nasal",
            "mutation",
            "mutation-radical",
        },
        "Number": {"singular", "plural"},
        "Person": {"third-person", "first-person", "second-person"},
        "Gender": {"masculine", "feminine"},
    }
    param_order = ["Person", "Number", "Gender", "MutationType"]

    table["first-person"] = {number: "-" for number in params["Number"]}
    table["second-person"] = {number: "-" for number in params["Number"]}
    table["third-person"] = {
        "singular": {"feminine": "-", "masculine": "-"},
        "plural": "-",
    }

    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))

    if nested_key_exists(new_table, ["noPerson", "noNumber", "noGender", "mutation"]):
        new_table["MutationType"] = new_table["noPerson"]["noNumber"]["noGender"]
        new_table.pop("noPerson")
    else:
        new_table["MutationType"] = {
            mutation: "-" for mutation in params["MutationType"]
        }
    return new_table


def patchA(lemma, table):
    params = {
        "MutationType": {
            "mutation",
            "mutation-nasal",
            "prothesis-t",
            "mutation-radical",
            "prothesis-h",
            "eclipsis",
            "lenition",
            "weak",
            "strong",
        },
        "Comparison": {"superlative", "comparative"},
        "Case": {"vocative", "nominative", "dative", "genitive"},
        "Number": {"plural", "singular"},
        "Gender": {"masculine", "feminine"},
    }
    param_order = ["Comparison", "Case", "Number", "Gender", "MutationType"]

    for case in params["Case"]:
        table[case] = {"singular": {"feminine": "-", "masculine": "-"}, "plural": "-"}

    table.setdefault("comparative", "-")
    table.setdefault("superlative", "-")

    fixed_names = {"Comparison": "positive"}
    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))

    if "positive" in new_table and "noCase" in new_table["positive"]:
        if "plural" in new_table["positive"]["noCase"]:
            new_table["positive"]["noCase"].pop("plural")
            new_table["positive"]["noCase"].pop("singular")
        if (
            "noNumber" in new_table["positive"]["noCase"]
            and "noGender" in new_table["positive"]["noCase"]["noNumber"]
        ):
            new_table["MutationType"] = new_table["positive"]["noCase"]["noNumber"][
                "noGender"
            ]
        if len(new_table["positive"]) == 1:
            new_table.pop("positive")
        else:
            new_table["positive"].pop("noCase")
    if "MutationType" not in new_table:
        new_table["MutationType"] = {
            mutation: "-" for mutation in params["MutationType"]
        }

    if "positive" in new_table and "vocative" in new_table["positive"]:
        new_table["vocative"] = new_table["positive"]["vocative"]
        new_table["positive"].pop("vocative")

    return dict(sorted(new_table.items()))


def patchPN(lemma, table):
    params = {
        "Case": {"genitive", "dative", "nominative", "vocative"},
        "MutationType": {
            "mutation",
            "mutation-nasal",
            "prothesis-t",
            "mutation-radical",
            "prothesis-h",
            "eclipsis",
            "lenition",
            "weak",
            "strong",
        },
        "Species": {"indefinite", "definite"},
        "Number": {"plural", "singular"},
    }
    param_order = ["Species", "Case", "Number", "MutationType"]
    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
    return new_table


def patchAdv(lemma, table):
    params = {
        "MutationType": {
            "mutation",
            "mutation-nasal",
            "prothesis-t",
            "mutation-radical",
            "prothesis-h",
            "eclipsis",
            "lenition",
            "weak",
            "strong",
        }
    }
    param_order = ["MutationType"]
    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
    return new_table


def patchPron(lemma, table):
    params = {
        "MutationType": {
            "mutation",
            "mutation-nasal",
            "prothesis-t",
            "mutation-radical",
            "prothesis-h",
            "eclipsis",
            "lenition",
            "weak",
            "strong",
        }
    }
    param_order = ["MutationType"]
    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
    return new_table


def patchDet(lemma, table):
    params = {
        "MutationType": {
            "mutation",
            "mutation-nasal",
            "prothesis-t",
            "mutation-radical",
            "prothesis-h",
            "eclipsis",
            "lenition",
            "weak",
            "strong",
        },
        "Number": {"plural", "singular"},
    }
    param_order = ["Number", "MutationType"]
    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
    return new_table
