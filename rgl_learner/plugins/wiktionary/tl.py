from rgl_learner.utils import *
import rgl_learner.plugins as plugins

iso3 = "Tgl"
source_plugin = plugins["wiktionary"]

params = {
    "root": ("Root_Word", "Root"),
    "positive": ("Pos", "Comparison"),
    "comparative_inferior": ("ComparativeInferior", "Comparison"),
    "comparative_equal": ("ComparativeEqual", "Comparison"),
    "superlative_inferior": ("SuperlativeInferior", "Comparison"),
    "superlative_equal": ("SuperlativeEqual", "Comparison"),
    "imperative": ("Imperative", "Mood"),
    "indicative": ("Indicative", "Mood"),
    "actor-i": ("AdFocus", "Voice"),
    "trigger-actor": ("AcFocus", "Voice"),
    "trigger-object": ("PatientFocus", "Voice"),
    "trigger-locative": ("LocFocus", "Voice"),
    "trigger-causative": ("CausFocus", "Voice"),
    "trigger-measurement": ("MeusureFocus", "Voice"),
    "reciprocal": ("ReciprocalFocus", "Voice"),
    "trigger-referential": ("ReferentialFocus", "Voice"),
    "trigger-instrument": ("InstrumentFocus", "Voice"),
    "actor-secondary": ("SecondaryFocus", "Voice"),
    "benefactive": ("BenefFocus", "Voice"),
    "directional": ("DirectionFocus", "Voice"),
    "direct": ("SocialDirect", "Voice"),
    "indirect": ("SocialCaus", "Voice"),
    "infinitive": ("Infinitive", "Aspect"),
    "contemplative": ("Contemplative", "Aspect"),
    "completive": ("Completive", "Aspect"),
    "progressive": ("Progressive", "Aspect"),
    "past-recent": ("PastRecent", "Aspect"),
    "locative": ("Loc", "Case"),
    "past": ("Past", "Tense"),
    "masculine": ("Masc", "Gender"),
    "feminine": ("Fem", "Gender"),
    "singular": ("Sg", "Number"),
    "plural": ("Pl", "Number"),
    "first-person": ("P1", "Person"),
    "second-person": ("P2", "Person"),
    "formal": ("Formal", "Formality"),
    "informal": ("Informal", "Formality"),
    "equal": ("Eq", "AdjType"),
    "inferior": ("Inf", "AdjType"),

}

ignore_tags = [
    "literary",
    "Batangas",
    "Southern",
    "Northern",
    "physical",
    "Philippine",
    "Central",
    "Eastern",
    "sometimes",
    "absolute",
    "relative",
    "rare",
    "objective",
    "affix",
    "focus",
    "past",
    "Roman",
    "second-person",
    "first-person",
    "reciprocal",
    "Baybayin",
    "noun-from-verb",
    "slang",
    "Western",
    "Chinese",
    "uncommon",
    "error-unrecognized-form"
]

order = {"A": ["Gender", "Root", "Degree", "AdjType", "Number", "Formality"], 
         "V": ["Root", "Mood","Voice",  "Case", "Formality", "Aspect"], 
         "Adv": ["Formality"]}


separate_values = {"V": "Voice"}

required_forms = {"A": ["lemma"], "Adv": ["s;Informal"], "V": ["Imperative;Informal"]}

default_params = {"Formality": "informal", "Degree": "positive", "Number": "singular"}

def preprocess(record):
    categories = record.get("categories",[])
    if 'Tagalog terms in Baybayin script' in categories or "Tagalog lemmas" in categories:
        return False
    return True


def filter_lemma(lemma, pos, table):
    if pos == "pron" or pos == "prep" or pos == "name" or pos == "noun":
        return True
    return False

def patchPOS(lemma, tag, table):
    if lemma == "magparinig":
        return "verb"
    return tag

def filter_paradigm(tag, forms):
    if tag == "verb" and forms[0] == "-":
        return True
    return False


def merge_tags(pos, forms, w, tags):
    if "root" in tags and len(tags) > 1:
        tags.remove("root")
    if "singular" in tags and "plural" in tags:
        new_tags = tags.copy()
        new_tags.remove("singular")
        tags.remove("plural")
        forms.append((w, new_tags))

    if "past-recent" in tags:
        tags.remove("completive")

    if "locative" in tags:
        tags.remove("locative")
        tags.append("locative_focus")

    if "imperative" in tags:
        if "benefactive" in tags:
            tags.remove("benefactive")
        if "locative_focus" in tags:
            tags.remove("locative_focus")
        if "directional" in tags:
            tags.remove("directional")

    if "directional" in tags and w == "trigger":
        tags.remove("directional")

    if w == "⁠—" or w == "-" or w == "invalid affix":
        tags = [] 

    return [(w, tags)]


def patchA(lemma, table):

   # table.update(table.pop("noGender"))
    table["t"] = table.pop("noGender")

    table["t"] = {
        "comparative_inferior" : table["t"]["comparative"]["inferior"],
        "comparative_equal": table["t"]["comparative"]["equal"],
        "superlative_inferior": table["t"]["superlative"]["inferior"],
        "superlative_equal": table["t"]["superlative"]["equal"],
    }
   

            


    if table.keys() == {"plural"}:
        table.setdefault("positive", {})
        table["positive"]["singular"] = lemma
        table["positive"]["plural"] = table["plural"]

    if "plural" in table:  # already in the table
        table.pop("plural")

    table["sp"] = {}
    table["sp"]["feminine"] = table.get("feminine", "-")
    table["sp"]["masculine"] = table.get("masculine", "-")
    if "feminine" in table:
        table.pop("feminine")
    if "masculine" in table:
        table.pop("masculine")
    if "root" in table:
        table.pop("root")

    if table["sp"]["masculine"] != "-":
        table["lemma"] = table["sp"]["masculine"]
    elif table["t"]["comparative_inferior"] != "-": 
        table["lemma"] = lemma
    return table


#def patchV(lemma, table):


def patchV(lemma, table):
    table.update(table.pop("noRoot"))
    table.update(table.pop("noMood"))
    table.setdefault("imperative", {})

