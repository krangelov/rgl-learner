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

params_order = dict(zip(params.keys(), range(len(params))))

nested_key_exists = nested_key_exists

param_order = []
parameters = defaultdict(set)
for tag, (_, param) in params.items():
    parameters[param].add(tag)
    if param not in param_order:
        param_order.append(param)

required_forms = {"V": ["root", ]}
separate_values = {"V": "Voice"}


def filter_lemma(lemma, pos, table):
    if pos == "pron" or pos == "prep" or pos == "name":
        return True
    return False


def filter_paradigm(tag, forms):
    if tag == "verb" and forms[0] == "-":
        return True
    return False


def merge_tags(pos, forms, w, tags):
    if pos == "noun":
        if "feminine" in tags:
            tags.remove("feminine")
        elif "masculine" in tags:
            tags.remove("masculine")

    if "comparative" in tags:
        if "inferior" or "equal" in tags:
            tags.remove("comparative")
        if "inferior" in tags:
            tags.remove("inferior")
            tags.append("comparative_inferior")
        if "equal" in tags:
            tags.remove("equal")
            tags.append("comparative_equal")

    if "superlative" in tags:
        if "inferior" or "equal" in tags:
            tags.remove("superlative")
        if "inferior" in tags:
            tags.remove("inferior")
            tags.append("superlative_inferior")
        if "equal" in tags:
            tags.remove("equal")
            tags.append("superlative_equal")

    if "positive" in tags and "root" in tags:
        tags.remove("positive")

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

    return forms, tags


def patchA(lemma, table):

    if table.keys() == {"plural"}:
        table.setdefault("positive", {})
        table["positive"]["singular"] = lemma
        table["positive"]["plural"] = table["plural"]

    if table.keys() == {"feminine"}:
        table["masculine"] = lemma
    elif table.keys() == {"masculine"}:
        table["feminine"] = lemma

    for comparison in parameters["Comparison"]:
        for number in parameters["Number"]:
            table.setdefault(comparison, {}).setdefault(number, "-")

    if "plural" in table:  # already in the table
        table.pop("plural")

    table["sp"] = {}
    table["t"] = {}
    table["t"]["feminine"] = table.get("feminine", "-")
    table["t"]["masculine"] = table.get("masculine", "-")
    if "feminine" in table:
        table.pop("feminine")
    if "masculine" in table:
        table.pop("masculine")
    if "root" in table:
        table.pop("root")

    for compar in parameters["Comparison"]:
        table["sp"][compar] = table.get(compar, "-")
        if compar in table:
            table.pop(compar)



def patchV(lemma, table):
    table.setdefault("root", {})

    table.setdefault("indicative", {})
    table.setdefault("imperative", {})

    for voice in parameters["Voice"]:
        for aspect in parameters["Aspect"]:
            table.setdefault(voice, {}).setdefault(aspect, {})

    for aspect in parameters["Aspect"]:
        if aspect == "past-recent":
            table.setdefault(aspect, {}).setdefault("formal", "-")
            table.setdefault(aspect, {}).setdefault("informal", "-")
        else:
            table.setdefault(aspect, {})

    fixed_names = {"Mood": "indicative"}
    new_table = fill_empty(
        fix_table(
            table, param_order, parameters, fixed_names, exclude_list=["Aspect", "Root", "Comparison", "Case", "Gender",
                                                                       "Number", "Person", "Tense"]
        )
    )

    if "imperative" not in new_table:
        new_table["imperative"] = {
            "noVoice": {"formal": "-", "informal": "-"},
            "base": "-",
        }
    elif isinstance(new_table["imperative"], str):
        new_table["imperative"] = {
            "noVoice": {"formal": "-", "informal": "-"},
            "base": new_table["imperative"],
        }
    else:
        new_table["imperative"]["base"] = "-"

    #  new_table["indicative"]["noVoice"] = dict(
    #      sorted(new_table["indicative"]["noVoice"].items())
    #  )

    return new_table
