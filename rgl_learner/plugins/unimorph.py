import sys
import re
import glob
import rgl_learner.plugins as plugins

ignore_tags = ["LGSPEC1", "LGSPEC2"]

tag2cat = {
    "ADJ": "A",
    "V": "V",
    "PROPN": "PN",
    "PRO": "Pron",
    "ADV": "Adv",
    "N": "N",
    "DET": "Det",
    # 'ART': 'Article',
    # 'AUX': 'Auxiliary',
    # 'CLF': 'Classifier',
    # 'COMP': 'Complementizer',
    "CONJ": "Conj",
    "INTJ": "Interj",
    "ADP": "Prep",
    "NUM": "Digit",
    #"PART": "Particle",
}

params = {
    "INF": ("Infinitive", "Verbform"),
    "CONV": ("Converb", "Verbform"),
    "CVB": ("Converb", "Verbform"),
    "COP": ("Copula", "Copula"),
    "PCTP": ("Participle", "Verbform"),
    "MSDR": ("Masdar", "Verbform"),
    "PTCP": ("Particle", "Verbform"),
    "IND": ("Indicative", "Mood"),
    "ADM": ("Admirative", "Mood"),
    "AUNPRP": ("Non_Purposive", "Mood"),
    "AUPRP": ("Purposive", "Mood"),
    "COND": ("Conditional", "Mood"),
    "DEB": ("Debitive", "Mood"),
    "DED": ("Deductive", "Mood"),
    "IMP": ("Imperative_Jussive", "Mood"),
    "INTEN": ("Intentive", "Mood"),
    "IRR": ("Irrealis", "Mood"),
    "LKLY": ("Likely", "Mood"),
    "OBLIG": ("Obligative", "Mood"),
    "OPT": ("Optative_Desiderative", "Mood"),
    "PERM": ("Permissive", "Mood"),
    "POT": ("Potential", "Mood"),
    "PURP": ("General Purposive", "Mood"),
    "REAL": ("Realis", "Mood"),
    "SBJV": ("Subjunctive", "Mood"),
    "SIM": ("Simulative", "Mood"),
    "1DAY": ("1day", "Tense"),  # within 1 day
    "FUT": ("Fut", "Tense"),
    "FUT1": ("Fut1", "Tense"),
    "FUT2": ("Fut2", "Tense"),
    "HOD": ("Hodiernal", "Tense"),
    "IMMED": ("Immediate", "Tense"),
    "PRS": ("Pres", "Tense"),
    "PST": ("Past", "Tense"),
    "RCT": ("Recent", "Tense"),
    "RMT": ("Remote", "Tense"),
    "ALN": ("Alien", "Possession"),  # Alienable possession
    "NALN": ("Inalien", "Possession"),  # Inalienable possession
    "PSS1D": ("Poss1Du", "Possession"),
    "PSS1DE": ("Poss1DuExcl", "Possession"),
    "PSS1DI": ("Poss1DucIncl", "Possession"),
    "PSS1P": ("Poss1Pl", "Possession"),
    "PSS1PE": ("Poss1PlExcl", "Possession"),
    "PSS1PI": ("Poss1PlIncl", "Possession"),
    "PSS1S": ("Poss1Sg", "Possession"),
    "PSS2D": ("Poss2Du", "Possession"),
    "PSS2DF": ("Poss2DuFem", "Possession"),
    "PSS2DM": ("Poss2DuMasc", "Possession"),
    "PSS2P": ("Poss2PL", "Possession"),
    "PSS2PF": ("Poss2PlFem", "Possession"),
    "PSS2PM": ("Poss2PlMasc", "Possession"),
    "PSS2S": ("Poss2Sg", "Possession"),
    "PSS2SF": ("Poss2SgFem", "Possession"),
    "PSS2SFORM": ("Poss2SgForm", "Possession"),
    "PSS2SINFM": ("Poss2SgInfm", "Possession"),
    "PSS2SM": ("Poss2SgMasc", "Possession"),
    "PSS3D": ("Poss3Du", "Possession"),
    "PSS3DF": ("Poss3DuFem", "Possession"),
    "PSS3DM": ("Poss3DuMasc", "Possession"),
    "PSS3P": ("Poss3Pl", "Possession"),
    "PSS3PF": ("Poss3PlFem", "Possession"),
    "PSS3PM": ("Poss3PlMasc", "Possession"),
    "PSS3S": ("Poss3Sg", "Possession"),
    "PSS3SG": ("Poss3Ssg", "Possession"),
    "PSS3SF": ("Poss3SgFem", "Possession"),
    "PSS3SM": ("Poss2SgMasc", "Possession"),
    "PSSD": ("Possessed", "Possession"),
    "ACCMP": ("Accomplishment", "Aktionsart"),
    "ACH": ("Achievement", "Aktionsart"),
    "ACTY": ("Activity", "Aktionsart"),
    "ATEL": ("Atelic", "Aktionsart"),
    "DUR": ("Durative", "Aktionsart"),
    "DYN": ("Dynamic", "Aktionsart"),
    "PCT": ("Punctual", "Aktionsart"),
    "SEMEL": ("Semelfactive", "Aktionsart"),
    "STAT": ("Stative", "Aktionsart"),
    "TEL": ("Telic", "Aktionsart"),
    "ARGAC3S": ("3Sg-Obj", "Argument_Marking"),
    "HAB": ("Habitual", "Aspect"),
    "IPFV": ("Imperfective", "Aspect"),
    "ITER": ("Iterative", "Aspect"),
    "PFV": ("Perfective", "Aspect"),
    "PRF": ("Perfect", "Aspect"),
    "PROG": ("Progressive", "Aspect"),
    "PROSP": ("Prospective", "Aspect"),
    "RES": ("Resultative", "Aspect"),
    "CONN": ("Connegative", "Aspect"),
    "INDF": ("Indef", "Species"),
    "NDEF": ("Indef", "Species"),
    "DEF": ("Def", "Species"),
    "NSPEC": ("Non_Spec", "Species"),
    "SPEC": ("Spec", "Species"),
    "NOM": ("Nom", "Case"),
    "ACC": ("Acc", "Case"),
    "DAT": ("Dat", "Case"),
    "GEN": ("Gen", "Case"),
    "VOC": ("Voc", "Case"),
    "PRT": ("Part", "Case"),  # Partitive
    "IN": ("Iness", "Case"),  # IN
    "ABL": ("Ablat", "Case"),
    "ESS": ("Ess", "Case"),
    "TRANS": ("Transl", "Case"),
    "INS": ("Instr", "Case"),
    "INST": ("Instr", "Case"),
    "COM": ("Comit", "Case"),
    "LOC": ("Loc", "Case"),
    "NOMS": ("SNom", "Case"),  # Nominative, S-only
    "ON": ("On", "Case"),  # On
    "ONHR": ("Onhr", "Case"),  # On (horizontal)
    "ONVR": ("Onvr", "Case"),  # On (vertical)
    "POST": ("Post", "Case"),  # Behind
    "PRIV": ("Privative", "Case"),
    "PROL": ("Transl", "Case"),
    "PROPR": ("Proprietive", "Case"),
    "ABS": ("Abs", "Case"),  # Absolutive case
    "ALL": ("Allat", "Case"),
    "ANTE": ("Ante", "Case"),  # Anterior case, near / in front
    "APPRX": ("Apprx", "Case"),  # Approximative
    "APUD": ("Apud", "Case"),  # next to
    "AT": ("At", "Case"),  # at
    "AVR": ("Aver", "Case"),  # aversive case
    "BEN": ("Benef", "Case"),  # benefactive
    "BYWAY": ("Essmod", "Case"),  # essive-modal
    "CIRC": ("Circ", "Case"),  # near
    "COMPV": ("Compar", "Case"),
    "EQTV": ("Equative", "Case"),
    "ERG": ("Erg", "Case"),  # ergative
    "FRML": ("Formal", "Case"),
    "INTER": ("Inter", "Case"),  # Among
    "PRP": ("Purp", "Case"),  # Purposive
    "REL": ("Rel", "Case"),  # Relative
    "REM": ("Rem", "Case"),  # Distal
    "SUB": ("Sub", "Case"),  # Under
    "TERM": ("Term", "Case"),  # Terminative
    "VERS": ("Vers", "Case"),  # Versative
    "AB": ("Absolute", "Comparison"),
    "CMPR": ("Comparative", "Comparison"),
    "EQT": ("Equative", "Comparison"),
    "RL": ("Relative", "Comparison"),
    "SPRL": ("Superlative", "Comparison"),
    "PROX": ("Proximal", "Deixis"),  # Proximate
    "ABV": ("Above", "Deixis"),
    "BEL": ("Below", "Deixis"),
    "EVEN": ("Even", "Deixis"),
    "MED": ("Medial", "Deixis"),
    "NOREF": ("No Reference Point, Distal", "Deixis"),
    "NVIS": ("Invisible", "Deixis"),
    "PHOR": ("Phoric, situated in discourse", "Deixis"),
    "REF1": ("First Person Reference Point", "Deixis"),
    "REF2": ("Second Person Reference Point", "Deixis"),
    "REMT": ("Remote", "Deixis"),
    "VIS": ("Visible", "Deixis"),
    "ASSUM": ("Assumed", "Evidentiality"),
    "AUD": ("Auditory", "Evidentiality"),
    "DRCT": ("Direct", "Evidentiality"),
    "FH": ("Firsthand", "Evidentiality"),
    "HRSY": ("Hearsay", "Evidentiality"),
    "INFER": ("Inferred", "Evidentiality"),
    "NFH": ("Non_firsthand", "Evidentiality"),
    "NVSEN": ("Non_visual sensory", "Evidentiality"),
    "QUOT": ("Quotative", "Evidentiality"),
    "RPRT": ("Reported", "Evidentiality"),
    "SEN": ("Sensory", "Evidentiality"),
    "FIN": ("Finite", "Finiteness"),
    "NFIN": ("Nonfinite", "Finiteness"),
    "BANTU1_23": ("NClass", "Gender"),
    "MASC": ("Masc", "Gender"),
    "FEM": ("Fem", "Gender"),
    "NEUT": ("Neutr", "Gender"),
    "NAKH1-8": ("NClasses", "Gender"),
    "FOC": ("Focus", "Information_Structure"),
    "TOP": ("Topic", "Information_Structure"),
    "DECL": ("Declarative", "Interrogativity"),
    "INT": ("Interrogative", "Interrogativity"),
    #'LGSPEC1': ('Features varies by language', 'Language_Specific'),
    #'LGSPEC2': ('Features varies by language', 'Language_Specific'),
    "EXCL": ("Excl", "Exclusivity"),
    "INCL": ("Incl", "Exclusivity"),
    "OBV": ("Obviative", "Person"),
    "PRX": ("Proximate", "Person"),
    "POS": ("Affirm", "Polarity"),
    "NEG": ("Neg", "Polarity"),

    "CN_R_MN": ("CN_R_MN", "Switch_Reference"),  # SR among NPs in any argument position
    "DS": ("DS", "Switch_Reference"),
    "DSADV": ("DSAdv", "Switch_Reference"),
    "LOG": ("Logophoric", "Switch_Reference"),
    "OR": ("Open_Reference", "Switch_Reference"),
    "SEQMA": ("SeqMA", "Switch_Reference"),  # Sequential Multiclausal Aspect
    "SIMMA": ("SimMA", "Switch_Reference"),  # Simultaneous Multiclausal Aspect
    "SS": ("SS", "Switch_Reference"),
    "SSADV": ("SS Adverbial", "Switch_Reference"),
    "APPL": ("Applicative", "Valency"),
    "CAUS": ("Causative", "Valency"),
    "CAUSE": ("Causative", "Valency"),
    "IMPRS": ("Imprs", "Valency"),
    "INTR": ("Intransitive", "Valency"),
    "RECP": ("Reciprocal", "Valency"),
    "REFL": ("Reflexive", "Valency"),
    "TR": ("Transitive", "Valency"),
    "ACFOC": ("AcFoc", "Voice"),  # Accompanier Focus
    "ACT": ("Active", "Voice"),
    "AGFOC": ("AgFoc", "Voice"),  # Agent Focus
    "ANTIP": ("Antipassive", "Voice"),
    "BFOC": ("BFocus", "Voice"),  # Beneficiary Focus
    "CFOC": ("CFocus", "Voice"),  # Conveyed Focus
    "DIR": ("Direct", "Voice"),
    "IFOC": ("IFocus", "Voice"),  # Instrument Focus
    "INV": ("Inverse", "Voice"),
    "LFOC": ("LFocus", "Voice"),  # Location Focus
    "MID": ("Middle", "Voice"),
    "PASS": ("Passive", "Voice"),
    "PFOC": ("PFocus", "Voice"),
    "0": ("P0", "Person"),
    "1": ("P1", "Person"),
    "2": ("P2", "Person"),
    "2I": ("P2_Informal", "Person"),
    "2F": ("P2_Formal", "Person"),
    "3": ("P3", "Person"),
    "4": ("P4", "Person"),
    "STELEV": ("High status, elevated", "Politeness"),
    "STSUPR": ("High status, supreme", "Politeness"),
    "AVOID": ("Avoid", "Politeness"),  # avoidance style
    "COL": ("Colloquial", "Politeness"),
    "ELEV": ("Elev", "Politeness"),  # Formal, Referent Elevating
    "FOREG": ("Forreg", "Politeness"),  # Formal register
    "FORM": ("Formal", "Politeness"),
    "HIGH": ("High_status", "Politeness"),
    "HUMB": ("Humbl", "Politeness"),  # Formal, Speaker Humbling
    "INFM": ("Informal", "Politeness"),
    "LIT": ("Literary", "Politeness"),
    "LOW": ("Low status", "Politeness"),
    "POL": ("Polite", "Politeness"),
    "ANIM": ("Animate", "Animacy"),
    "HUM": ("Human", "Animacy"),
    "INAN": ("Inanimate", "Animacy"),
    "NHUM": ("NonHuman", "Animacy"),
    "GPAUC": ("GrPaucal", "Number"),
    "GRPL": ("GrPlural", "Number"),
    "INVN": ("Inverse", "Number"),
    "PAUC": ("Paucal", "Number"),
    "SG": ("Sg", "Number"),
    "DU": ("Dl", "Number"),
    "TRI": ("Tr", "Number"),
    "PL": ("Pl", "Number"),
}  # Patient Focus

params_order = dict(zip(params.keys(), range(len(params))))


def filter_tags(tags):
    new_tags = []
    for tag in re.split(r",|;", tags.strip()):
        if not tag:
            continue
        if "(" in tag:
            if tag.startswith("PSS"):
                tag = tag.replace("(", "").replace(")", "").replace(",", "")
                new_tags.append(tag.strip())
            else:
                tag = tag.replace(")", "").strip().split("(")
                new_tags.extend(tag)
        else:
            new_tags.append(tag.replace(")", "").strip())
    return new_tags


def extract(lang, filename=None):
    def open_file(dataset):
        d = {}
        with open(dataset) as f:
            for line in f:
                line = line.strip()
                if line == "":
                    continue
                lemma, form, tags = line.split("\t")
                tags = tags.replace(":", ";").replace(".", ";")
                tags = tags.replace("V;V", "V")
                tags = filter_tags(tags)
                for tag in tag2cat:
                    if tag in tags:
                        tags.remove(tag)
                        d.setdefault((lemma, tag), []).append((form, tags))
        return d

    if filename:
        d = open_file(filename)
    else:
        d = {}
        datasets = glob.glob(f"data/{lang}/{lang}*")
        for dataset in datasets:
            if "derivations" not in dataset and "segmentations" not in dataset:
                d.update(open_file(dataset))

    res = []
    for (lemma, pos), forms in d.items():
        tags = []
        if pos == "N":
            gender_set = set()
            for form,tags in forms:
                for gender in ["MASC","FEM","NEUT"]:
                    if gender in tags:
                        tags.remove(gender)
                        gender_set.add(gender)
            tags = list(gender_set)
        res.append((lemma, pos, forms, tags))
    return res


def convert2gf(tag, params):
    return params[tag][0] if tag in params else tag
