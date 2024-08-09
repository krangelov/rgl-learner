from rgl_learner.utils import *
import rgl_learner.plugins as plugins

iso3 = "Tgl"
source_plugin = plugins["wiktionary"]

params = {
    "positive": ("Positive", "Comparison"),
    "comparative_equal": ("CompEqual", "Comparison"),
    "comparative_inferior": ("CompInferior", "Comparison"),
    "superlative_equal": ("SuperEqual", "Comparison"),
    "superlative_inferior": ("SuperInferior", "Comparison"),
    "equal": ("Equal", "Comparison"),
    "absolute": ("Absolute", "Comparison"),
    "inferior": ("Inferior", "Comparison"),
    "imperative": ("Imperative", "Mood"),
    "trigger-locative": ("LocFocus", "Voice"),
    "trigger-causative": ("CausFocus", "Voice"),
    "trigger-measurement": ("MeusureFocus", "Voice"),
    "reciprocal": ("ReciprocalFocus", "Voice"),
    "trigger-referential": ("ReferentialFocus", "Voice"),
    "trigger-object": ("PatientFocus", "Voice"),
    "trigger-actor": ("AcFocus", "Voice"),
    "trigger-instrument": ("InstrumentFocus", "Voice"),
    "actor-secondary": ("SecondaryFocus", "Voice"),
    "locative_focus": ("LocativeFocus", "Voice"),
    "benefactive": ("BenefFocus", "Voice"),
    "directional": ("DirectionFocus", "Voice"),
    "direct": ("SocialDirect", "Voice"),
    "indirect": ("SocialCaus", "Voice"),
    "infinitive": ("Infinititve", "Aspect"),
    "contemplative": ("Contemplative", "Aspect"),
    "completive": ("Completive", "Aspect"),
    "progressive": ("Progressive", "Aspect"),
    "past-recent": ("PastRecent", "Aspect"),
}

ignore_tags = [
    "literary",
    "Batangas",
    "Southern",
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
]

params.update(source_plugin.params)

params_order = dict(zip(params.keys(), range(len(params))))


def filter_lemma(lemma, pos, table):
    if pos == "pron" or pos == "prep" or pos == "name":
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
        tags.remove("root")
    elif "root" in tags:
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

    return forms, tags


def patchA(lemma, table):
    params = {
        "Comparison": {
            "positive",
            "comparative_inferior",
            "comparative_equal",
            "superlative_inferior",
            "superlative_equal",
        },
        "Number": {"singular", "plural"},
    }

    if table.keys() == {"plural"}:
        table.setdefault("positive", {})
        table["positive"]["singular"] = lemma
        table["positive"]["plural"] = table["plural"]

    if table.keys() == {"feminine"}:
        table["masculine"] = lemma
    elif table.keys() == {"masculine"}:
        table["feminine"] = lemma
    else:
        for comparison in params["Comparison"]:
            for number in params["Number"]:
                table.setdefault(comparison, {}).setdefault(number, "-")

    if "plural" in table:
        table.pop("plural")


def patchV(lemma, table):
    params = {
        "Aspect": {
            "completive",
            "contemplative",
            "infinitive",
            "past-recent",
            "progressive",
        },
        "Mood": {"imperative"},
        "Formality": {"formal", "informal"},
        "Voice": {
            "benefactive",
            "trigger-actor",
            "trigger-referential",
            "actor-secondary",
            "trigger-object",
            "direct",
            "trigger-instrument",
            "trigger-locative",
            "directional",
            "trigger-causative",
            "trigger-measurement",
            "indirect",
            "locative_focus",
        },
    }
    param_order = [
        "Mood",
        "Voice",
        "Aspect",
        "Formality",
    ]

    if "root" in table:
        table.pop("root")

    # table.setdefault("imperative", "-")

    for voice in params["Voice"]:
        # if voice in ['trigger-object']:
        # 	table.setdefault(voice, "-")
        # else:
        for aspect in params["Aspect"]:
            table.setdefault(voice, {}).setdefault(aspect, "-")

    for aspect in params["Aspect"]:
        if aspect == "past-recent":
            table.setdefault(aspect, {}).setdefault("formal", "-")
            table.setdefault(aspect, {}).setdefault("informal", "-")
        else:
            table.setdefault(aspect, "-")

    fixed_names = {"Mood": "indicative"}
    new_table = fill_empty(
        fix_table(table, param_order, params, fixed_names, exclude_list=["Aspect"])
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

    new_table["indicative"]["noVoice"] = dict(
        sorted(new_table["indicative"]["noVoice"].items())
    )
    new_table["indicative"] = dict(sorted(new_table["indicative"].items()))

    return dict(sorted(new_table.items()))
