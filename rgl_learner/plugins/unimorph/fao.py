from rgl_learner.utils import *
import rgl_learner.plugins as plugins


iso3 = "Fao"
source_plugin = plugins["unimorph"]
vars = {}

params = source_plugin.params | {
    'person-singular': ('PSg',['Person'],'PersNum'),
    'person-plural': ('PPl','PersNum'),
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
        table["IND"][tense]["person-singular"] = table["IND"][tense].pop("SG")
        table["IND"][tense]["person-plural"] = table["IND"][tense].pop("PL").pop("3")
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

