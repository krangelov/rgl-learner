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

order = {"N": ["Vocative", "Species", "Case", "Number"], 
         "A": ["Comparison",  "Number", "Gender", "Case",], 
         "V": ["Participle", "Mood", "Tense", "Dependency","Relative_Form", "Person", "Number"], 
         "Prep": ["Number", "Gender", "Person"]}

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
    "vocative": ("voc", "Vocative"),
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

default_params = {"Comparison": "Pos", "Dependency": "dependant"}

required_forms = {"N": ["s;Indef;Nom;Sg"], "A": ["Pos;Sg;Masc;Nom"],  "V": ["inf"], "Prep": ["Pl;P1", "Sg;Masc;P3"], "Adv": ["Mutation_radical"]}

required_forms = {"N": ["s;Indef;Nom;Sg", "s;Indef;Gen;Sg"], "A": ["Pos;Sg;Masc;Nom", "Pos;Pl;Nom"],  "V": ["inf"], "Prep": ["Pl;P1", "Sg;Masc;P3"], "Adv": ["Mutation_radical"]}

rules = {"N": {#(("s;Indef;Nom;Sg", ("each",)),("s;Indef;Gen;Sg", ("igh",))): 270, 
               (("s;Indef;Nom;Sg", ("",)), ("s;Indef;Gen;Sg", ("e",))) : 11,
               (("s;Indef;Nom;Sg", ("ach")), ("s;Indef;Gen;Sg", ("í")),) : 31,
               (("s;Indef;Nom;Sg", ("")), ("s;Indef;Gen;Sg", ("a")),): 1,
              # (("s;Indef;Nom;Sg", ("")), ("s;Indef;Gen;Sg", ("an")),): 1066,
             #  (("s;Indef;Nom;Sg", ("")), ("s;Indef;Gen;Sg", ("ach")),) : 420
},
 "A": {(("Pos;Sg;Masc;Nom", ("")), ("Pos;Pl;Nom", ("é|e|i|í|ó|o|u|ú"))): 27,
      (("Pos;Sg;Masc;Nom", ("")), ("Pos;Pl;Nom", ("e"))): 4,
},
"V": {(("inf", ("igh")),): 45, (("inf", ("áil")),): 98,}
}


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


def filter_form(w,tags):
    if "as verbal noun" in w or "as substantive" in w:
        return True
    if w == "not comparable":
        return True
    if w == "no-table-tags":
        return True
    return False



def patchPOS(lemma,tag,forms):

    o = any(["comparative" in form[1] or "superlative" in form[1] for form in forms])
    if tag == "noun" and o:
        return "adj"
    
    o = any(["indefinite" in form[1] or "genitive" in form[1] for form in forms])
    if tag == "verb" and o:
        return "noun"
    
    o = any(["indefinite" in form[1] for form in forms])
    if tag == "adj" and o:
        return "noun"
    
    return tag


def mergdfdfe_tags(pos, forms, w, tags):
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
    table["voc"] = table["vocative"].pop("indefinite")
    table.pop("vocative")
    table.update(table.pop("noVocative"))
    table.pop("noSpecies")
    table["s"] = {"indefinite": table.pop("indefinite"),
                  "definite": table.pop("definite")}
    if "nominative" in table["s"]["indefinite"]:
        table["s"]["indefinite"]["nominative"]["singular"] = lemma
    else: 
        table["s"]["indefinite"]["nominative"] = {"singular": lemma,
                                                  "plural": "-"}

def patchV(lemma, table):
    table["inf"] = lemma
    table.update(table.pop("noParticiple"))
    for i, v in table["indicative"].items():
        for x in v:
            table["indicative"][i][x].update(table["indicative"][i][x].pop("noRelative_Form"))
    for i in table["conditional"]:
        table["conditional"][i].update(table["conditional"][i].pop("noRelative_Form"))
    for i in table["subjunctive"]:
        if isinstance(table["subjunctive"][i], dict):
            table["subjunctive"][i].update(table["subjunctive"][i].pop("noRelative_Form"))
        

def patchA(lemma, table):
    table["Pos"]["singular"].pop("noGender")
    table["Pos"]["plural"]["Voc"] = table["Pos"]["plural"].pop("noCase")

    for x in table["Pos"]["singular"]:
        table["Pos"]["singular"][x]["Voc"] = table["Pos"]["singular"][x].pop("noCase")
    
    table["Pos"]["singular"]["masculine"]["nominative"] = lemma

def patchPrep(lemma, table):
    table["singular"].pop("noGender")
