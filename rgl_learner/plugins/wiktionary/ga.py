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
    "infinitive": ("Infinitive", "Infinitive"),
    "past_participle": ("PastParticiple", "Participle"),
    "positive": ("Pos", "Comparison"),
    "comparative": ("Comp", "Comparison"),
    "superlative": ("Superlat", "Comparison"),
    "indefinite": ("Indef", "Species"),
    "definite": ("Def", "Species"),
    "nominative": ("Nom", "Case"),
    "dative": ("Dat", "Case"),
    "genitive": ("Gen", "Case"),
    "vocative": ("Voc", "Case"),
    "possessive": ("Poss", "Case"),
    "indicative": ("Indicative", "Mood"),
    "subjunctive": ("Subjunctive", "Mood"),
    "conditional": ("Conditional", "Mood"),
    "imperative": ("Imperative", "Mood"),
    "present": ("Pres", "Tense"),
    "past": ("Past", "Tense"),
    "future": ("Fut", "Tense"),
    "past_habitual": ("PastHabit", "Tense"),
    "first-person": ("P1", "Person"),
    "second-person": ("P2", "Person"),
    "third-person": ("P3", "Person"),
    "singular": ("Sg", "Number"),
    "plural": ("Pl", "Number"),
    "masculine": ("Masc", "Gender"),
    "feminine": ("Fem", "Gender"),
    "relative": ("Relative", "Relative_Form"),
    "autonomous": ("Autonomous", "Person"),
    "negative": ("Neg", "Polarity"),
    "mutation": ("Mutation", "MutationType"),
    "mutation-radical": ("Mutation_radical", "MutationType"),
    "prothesis-t": ("Prothesis_t", "MutationType"),
    "prothesis-h": ("Prothesis_h", "MutationType"),
    "eclipsis": ("Eclipsis", "MutationType"),
    "lenition": ("Lenition", "MutationType"),
    "strong": ("Strong", "MutationType"),
    "weak": ("Weak", "MutationType"),
    "mutation-nasal": ("Mutation_nasal", "MutationType"),
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
    "class",
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
    "not comparable",
    "mutation",
]

form2cat = {v[0]: (k, v[1]) for k, v in params.items() if v}
params_order = dict(zip(params.keys(), range(len(params))))

param_order = []
parameters = defaultdict(set)
for tag, (_, param) in params.items():
    parameters[param].add(tag)
    if param not in param_order:
        param_order.append(param)


def preprocess(record):
    if 'Irish non-lemma forms' in record.get('categories',[]):
        return False

    for sense in record.get('senses',[]):
        if 'Irish non-lemma forms' in sense.get('categories',[]):
            return False

    tags = record.setdefault("tags",[])
    if "masculine" not in tags and "feminine" not in tags:
        tags.append("masculine")

    return True

def filter_lemma(lemma, pos, table):
    if pos == "name" or pos == "det" or pos == "pron":
        return True

    if " " in lemma:
        return True

    if lemma == "d'ainneoin":
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
    fixed_names = {}

    table.setdefault("indefinite", {}).setdefault("nominative", {}).setdefault("singular", lemma)
    for defin in parameters["Species"]:
        for case in parameters["Case"]:
            for number in parameters["Number"]:
                table.setdefault(defin, {}).setdefault(case, {}).setdefault(number, "-")

    for mutation in parameters["MutationType"]:
        table.setdefault(mutation, "-")

    new_table = fill_empty(fix_table(table, param_order, parameters, fixed_names, exclude_list=["Gender", "Participle", "Tense",
                                                                             "Infinitive", "Mood",
                                                                             "Person", "Relative_Form",
                                                                                 "Polarity",               "Comparison", ]))

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
        for typename in parameters["MutationType"]:
            new_table["MutationType"][typename] = "-"

    return new_table


def patchV(lemma, table):

    table.setdefault("infinitive", lemma)
    table.setdefault("past_participle", "-")

    per_num_table = {}
    per_num_table.setdefault("first-person", {}).setdefault("singular", "-")
    per_num_table.setdefault("first-person", {}).setdefault("plural", "-")
    per_num_table.setdefault("second-person", {}).setdefault("singular", "-")
    per_num_table.setdefault("second-person", {}).setdefault("plural", "-")
    per_num_table.setdefault("third-person", {}).setdefault("singular", "-")
    per_num_table.setdefault("third-person", {}).setdefault("plural", "-")
    per_num_table.setdefault("autonomous", "-")
    per_num_table.setdefault("relative", "-")

    # table.setdefault("indicative", {})
    table.setdefault("conditional", per_num_table)
    #  table.setdefault("subjunctive", {})
    table.setdefault("imperative", per_num_table)

    for tense in parameters["Tense"]:
        table.setdefault("subjunctive", {}).setdefault(tense, {}).setdefault(
            "relative", "-"
        )
        table.setdefault("indicative", {}).setdefault(tense, {})
        for person in parameters["Person"]:
            if person == "autonomous":
                table.setdefault("subjunctive", {}).setdefault(tense, {}).setdefault(
                    person, "-"
                )
            else:
                for number in parameters["Number"]:
                    #         table.setdefault(tense, {}).setdefault(person, {}).setdefault(number, "-")
                    table.setdefault("subjunctive", {}).setdefault(
                        tense, {}
                    ).setdefault(person, {})
        #         table.setdefault("indicative", {}).setdefault(tense, {}).setdefault(person, {}).setdefault(number, "-")

    fixed_names = {"Mood": "indicative"}
    new_table = fill_empty(
        fix_table(
            table,
            param_order,
            parameters,
            fixed_names,
            exclude_list=[
                "Infinitive",
                "Relative_Form",
                "Species",
                "Case",
                "Comparison"
            ],
        )
    )

    new_table.update(new_table["noParticiple"])
    new_table.pop("noParticiple")
    if "imperative" in new_table and new_table["imperative"] != "-":
        new_table["imperative"] = new_table["imperative"]["noTense"]
    if "conditional" in new_table and new_table["conditional"] != "-":
        new_table["conditional"] = new_table["conditional"]["noTense"]

    if nested_key_exists(
        new_table, ["indicative", "noTense", "noPerson", "noNumber", "mutation_radical"]
    ):
        new_table["MutationType"] = new_table["indicative"]["noTense"]["noPerson"][
            "noNumber"
        ]
    else:
        new_table["MutationType"] = {
            mutation: "-" for mutation in parameters["MutationType"]
        }

    if "noTense" in new_table["indicative"]:
        new_table["indicative"].pop("noTense")

    # if len(new_table) == 1 and "Mutation" in new_table:
    #     new_table.pop("Mutation")
    return new_table


def patchPrep(lemma, table):
    # table.setdefault(param_order, []).append(lemma)

    for number in parameters["Number"]:
        table.setdefault("first-person", {}).setdefault(number, "-")
        table.setdefault("second-person", {}).setdefault(number, "-")

    table.setdefault("third-person", {}).setdefault("plural", "-")
    table.setdefault("third-person", {}).setdefault("singular", {}).setdefault(
        "feminine", "-"
    )
    table.setdefault("third-person", {}).setdefault("singular", {}).setdefault(
        "masculine", "-"
    )

    for mutation in parameters["MutationType"]:
        table.setdefault(mutation, "-")

    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, parameters, fixed_names, exclude_list=["Participle", "Tense",
                                                                             "Infinitive", "Mood", "Case", "Species",
                                                                              "Relative_Form",
                                                                                 "Polarity",               "Comparison", ]))

    if nested_key_exists(new_table, ["noPerson", "noNumber", "noGender", "lenition"]):
        new_table["MutationType"] = new_table["noPerson"]["noNumber"]["noGender"]
        new_table.pop("noPerson")
    else:
        new_table["MutationType"] = {
            mutation: "-" for mutation in parameters["MutationType"]
        }
    return new_table


def patchA(lemma, table):
    for case in parameters["Case"]:
        sg = table.setdefault("positive", {}).setdefault(case, {}).setdefault("singular", {})
        pl = table.setdefault("positive", {}).setdefault(case, {}).setdefault("plural", {})
        if case == "nominative":
            sg.setdefault("masculine", lemma)
        if case == "genitive":
            table.setdefault("positive", {}).setdefault(case, {}).setdefault("plural", {}).setdefault("strong", "-")
            table.setdefault("positive", {}).setdefault(case, {}).setdefault("plural", {}).setdefault("weak", "-")

    table.setdefault("comparative", "-")
    table.setdefault("superlative", "-")

    fixed_names = {"Comparison": "positive"}
    new_table = fill_empty(
        fix_table(table, param_order, parameters, fixed_names, exclude_list=["Gender", "Participle", "Tense",
                                                                             "Infinitive", "Species", "Mood",
                                                                             "Person", "Relative_Form"])
    )


    if "positive" in new_table and "noCase" in new_table["positive"]:
        if (
            "noNumber" in new_table["positive"]["noCase"]
            and "noPolarity" in new_table["positive"]["noCase"]["noNumber"]
        ):
            new_table["MutationType"] = new_table["positive"]["noCase"]["noNumber"]["noPolarity"]
        if len(new_table["positive"]) == 1:
            new_table.pop("positive")
        else:
            new_table["positive"].pop("noCase")
    if "MutationType" not in new_table:
        new_table["MutationType"] = {
            mutation: "-" for mutation in parameters["MutationType"]
        }

    for case in parameters["Case"]:
        if isinstance(new_table["positive"][case]["singular"], str):
            word = new_table["positive"][case]["singular"]
            new_table["positive"][case]["singular"] = {}
            new_table["positive"][case]["singular"]["feminine"] = word
            new_table["positive"][case]["singular"]["masculine"] = word

    if "positive" in new_table and "vocative" in new_table["positive"]:
        new_table["vocative"] = new_table["positive"]["vocative"]
        new_table["positive"].pop("vocative")

    if isinstance(new_table["positive"]["genitive"]["plural"], str):
        word = new_table["positive"]["genitive"]["plural"]
        new_table["positive"]["genitive"]["plural"] = {"strong": "-", "weak": "-"}
        new_table["positive"]["genitive"]["plural"]["base"] = word
    else:
        new_table["positive"]["genitive"]["plural"]["base"] = "-"

    return new_table


def patchPN(lemma, table):
    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, parameters, fixed_names))
    return new_table


def patchAdv(lemma, table):
    fixed_names = {}
    new_table = fill_empty(fix_table(table, param_order, parameters, fixed_names))
    # new_table.pop("mutation")
    return new_table
