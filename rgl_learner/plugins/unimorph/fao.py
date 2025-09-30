from rgl_learner.utils import *
import rgl_learner.plugins as plugins


iso3 = "Fao"
source_plugin = plugins["unimorph"]

#required_forms = {"N": ["s;Indef;Sg;Nom"],  "A": ["s;Masc;Sg;Nom"],  "V": ["Nonfinite"]}

required_forms = {"N": ["s;Indef;Sg;Nom", "s;Indef;Pl;Nom"], "A": ["s;Masc;Sg;Nom"],  "V": ["Indicative;Pres;Sg;P2"]}


rules = {"N": {(("s;Indef;Sg;Nom", ("ur",)), ("s;Indef;Pl;Nom", ("ar",)),): 3,
         (("s;Indef;Sg;Nom", ("ur",)), ("s;Indef;Pl;Nom", ("ir",)),): 9,
         (("s;Indef;Sg;Nom", ("i",)), ("s;Indef;Pl;Nom", ("ar",)),): 1,
         (("s;Indef;Sg;Nom", ("a",)), ("s;Indef;Pl;Nom", ("ur",)),): 5,
         (("s;Indef;Sg;Nom", ("i",)), ("s;Indef;Pl;Nom", ("ir",)),): 14,
         (("s;Indef;Sg;Nom", ("",)), ("s;Indef;Pl;Nom", ("ar",))): 6,
         (("s;Indef;Sg;Nom", ("",)), ("s;Indef;Pl;Nom", ("ir",))): 15,},
         #(("s;Indef;Pl;Nom", ("ur"))): 3,
         "A": {(("s;Masc;Sg;Nom", ("in",)),): 9,
               (("s;Masc;Sg;Nom", ("gvin",)),): 12},
         "V": {(("Indicative;Pres;Sg;P2", ("ar",)),): 1,
               (("Indicative;Pres;Sg;P2", ("ir",)),): 23,
               (("Indicative;Pres;Sg;P2", ("ur",)),): 3,
               }
         }
default_params = {"Number": "PL"}
order = {"N": ["Species", "Number", "Case"], "A": ["Gender", "Number", "Case"], "V": ["Mood", "Verbform", "Finiteness", "Tense", "Number", "Person", ]}

def merge_tags(pos, forms, w, tags):
    new_forms = []
    if "NOM/ACC" in tags:
        tags_1 = list(map(lambda x: x.replace("NOM/ACC", "NOM"), tags))
        tags_2 = list(map(lambda x: x.replace("NOM/ACC", "ACC"), tags))
        new_forms.append((w, tags_1))
        new_forms.append((w, tags_2))
        return new_forms
    return [(w, tags)]


def patchV(lemma,table):
    # person information only for singular verbs
    table.update(table.pop("noMood"))
    for v in table["IMP"]:
        table["IMP"][v] = table["IMP"][v].pop("2") # only exists for 2nd person so eliminate person info
    for tense in table["IND"]:
        table["IND"][tense]["PL"] = table["IND"][tense]["PL"].pop("3")
    table.update(table.pop("noVerbform"))
    return table


def patchA(lemma, table):
    fem_form = table["FEM"].pop("PL")
    neut_form = table["NEUT"].pop("PL")
    table["FEM"].update({
        "PL": {
            "NOM" : fem_form,
            "ACC": fem_form,
            "DAT": table["MASC"]["PL"]["DAT"],
            "GEN": table["MASC"]["PL"]["GEN"]
        }})

    table["NEUT"].update({
        "PL": {
            "NOM" : neut_form,
            "ACC": neut_form,
            "DAT": table["MASC"]["PL"]["DAT"],
            "GEN": table["MASC"]["PL"]["GEN"]
        }})


    return table

