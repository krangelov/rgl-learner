import re


tag2cat = {
    'ADJ': 'A',
    'V': 'V',
    'PROPN': 'PN',
    'PRO': 'Pron',
    'ADV': 'Adv',
    'N': 'N',
    'DET': 'Det',
# 'ART': 'Article',
# 'AUX': 'Auxiliary',
# 'CLF': 'Classifier',
# 'COMP': 'Complementizer',
# 'CONJ': 'Conjunction',
# 'INTJ': 'Interjection',
# 'ADP': 'Adposition',
# 'NUM': 'Numeral',
# 'PART': 'Particle',
# 'V.CVB': 'Converb',
# 'V.MSDR': 'Masdar',
# 'V.PTCP': 'Participle'
}

params = {
    'ACCMP': ('Accomplishment', 'Aktionsart'),
    'ACH': ('Achievement', 'Aktionsart'),
    'ACTY': ('Activity', 'Aktionsart'),
    'ATEL': ('Atelic', 'Aktionsart'),
    'DUR': ('Durative', 'Aktionsart'),
    'DYN': ('Dynamic', 'Aktionsart'),
    'PCT': ('Punctual', 'Aktionsart'),
    'SEMEL': ('Semelfactive', 'Aktionsart'),
    'STAT': ('Stative', 'Aktionsart'),
    'TEL': ('Telic', 'Aktionsart'),
    'ANIM': ('Animate', 'Animacy'),
    'HUM': ('Human', 'Animacy'),
    'INAN': ('Inanimate', 'Animacy'),
    'NHUM': ('Non-human', 'Animacy'),
    'ARGAC3S': ('3.sg Object (from feature template)', 'Argument_Marking'),
    'HAB': ('Habitual', 'Aspect'),
    'IPFV': ('Imperfective', 'Aspect'),
    'ITER': ('Iterative', 'Aspect'),
    'PFV': ('Perfective', 'Aspect'),
    'PRF': ('Perfect', 'Aspect'),
    'PROG': ('Progressive', 'Aspect'),
    'PROSP': ('Prospective', 'Aspect'),
    'ABL': ('Ablat', 'Case'),
    'ABS': ('Abs', 'Case'), # Absolutive case
    'ACC': ('Acc', 'Case'),
    'ALL': ('Allat', 'Case'),
    'ANTE': ('Ante', 'Case'), # Anterior case, near / in front
    'APPRX': ('Apprx', 'Case'), # Approximative
    'APUD': ('Apud', 'Case'), # next to
    'AT': ('At', 'Case'), # at
    'AVR': ('Aver', 'Case'), # aversive case
    'BEN': ('Benef', 'Case'), # benefactive
    'BYWAY': ('Essmod', 'Case'), # essive-modal
    'CIRC': ('Circ', 'Case'), # near
    'COM': ('Comit', 'Case'),
    'COMPV': ('Compar', 'Case'),
    'DAT': ('Dat', 'Case'),
    'EQTV': ('Equative', 'Case'),
    'ERG': ('Erg', 'Case'), # ergative
    'ESS': ('Ess', 'Case'),
    'FRML': ('Formal', 'Case'),
    'GEN': ('Gen', 'Case'),
    'IN': ('In', 'Case'), # IN
    'INS': ('Instr', 'Case'),
    'INTER': ('Inter', 'Case'), # Among
    'NOM': ('Nom', 'Case'),
    'NOMS': ('SNom', 'Case'),  # Nominative, S-only
    'ON': ('On', 'Case'), # On
    'ONHR': ('Onhr', 'Case'), # On (horizontal)
    'ONVR': ('Onvr', 'Case'), # On (vertical)
    'POST': ('Post', 'Case'), # Behind
    'PRIV': ('Privative', 'Case'),
    'PROL': ('Transl', 'Case'),
    'PROPR': ('Proprietive', 'Case'),
    'PROX': ('Proximal', 'Deixis'), # Proximate
    'PRP': ('Purp', 'Case'), # Purposive
    'PRT': ('Part', 'Case'), # Partitive
    'REL': ('Rel', 'Case'), # Relative
    'REM': ('Rem', 'Case'), # Distal
    'SUB': ('Sub', 'Case'), # Under
     'TERM': ('Term', 'Case'), # Terminative
    'TRANS': ('Transl', 'Case'),
    'VERS': ('Vers', 'Case'), # Versative
    'VOC': ('Voc', 'Case'),
    'AB': ('Absolute', 'Comparison'),
    'CMPR': ('Comparative', 'Comparison'),
    'EQT': ('Equative', 'Comparison'),
    'RL': ('Relative', 'Comparison'),
    'SPRL': ('Superlative', 'Comparison'),
    'DEF': ('Def', 'Species'),
    'INDF': ('Indef', 'Species'),
    'NSPEC': ('Non-Spec', 'Species'),
    'SPEC': ('Spec', 'Species'),
    'ABV': ('Above', 'Deixis'),
    'BEL': ('Below', 'Deixis'),
    'EVEN': ('Even', 'Deixis'),
    'MED': ('Medial', 'Deixis'),
    'NOREF': ('No Reference Point, Distal', 'Deixis'),
    'NVIS': ('Invisible', 'Deixis'),
    'PHOR': ('Phoric, situated in discourse', 'Deixis'),
    'REF1': ('First Person Reference Point', 'Deixis'),
     'REF2': ('Second Person Reference Point', 'Deixis'),
    'REMT': ('Remote', 'Deixis'),
    'VIS': ('Visible', 'Deixis'),
    'ASSUM': ('Assumed', 'Evidentiality'),
    'AUD': ('Auditory', 'Evidentiality'),
    'DRCT': ('Direct', 'Evidentiality'),
    'FH': ('Firsthand', 'Evidentiality'),
    'HRSY': ('Hearsay', 'Evidentiality'),
    'INFER': ('Inferred', 'Evidentiality'),
    'NFH': ('Non-firsthand', 'Evidentiality'),
    'NVSEN': ('Non-visual sensory', 'Evidentiality'),
    'QUOT': ('Quotative', 'Evidentiality'),
    'RPRT': ('Reported', 'Evidentiality'),
    'SEN': ('Sensory', 'Evidentiality'),
    'FIN': ('Finite', 'Finiteness'),
    'NFIN': ('Nonfinite', 'Finiteness'),
    'BANTU1-23': ('NClass', 'Gender'),
    'FEM': ('Fem', 'Gender'),
    'MASC': ('Masc', 'Gender'),
    'NAKH1-8': ('NClasses', 'Gender'),
    'NEUT': ('Neutr', 'Gender'),
     'FOC': ('Focus', 'Information_Structure'),
     'TOP': ('Topic', 'Information_Structure'),
     'DECL': ('Declarative', 'Interrogativity'),
     'INT': ('Interrogative', 'Interrogativity'),
     'LGSPEC1': ('Features varies by language', 'Language_Specific'),
     'LGSPEC2': ('Features varies by language', 'Language_Specific'),
     'ADM': ('Admirative', 'Mood'),
     'AUNPRP': ('Australian Non-Purposive', 'Mood'),
     'AUPRP': ('Australian Purposive', 'Mood'),
     'COND': ('Conditional', 'Mood'),
     'DEB': ('Debitive', 'Mood'),
     'DED': ('Deductive', 'Mood'),
     'IMP': ('Imperative-Jussive', 'Mood'),
     'IND': ('Indicative', 'Mood'),
     'INTEN': ('Intentive', 'Mood'),
     'IRR': ('Irrealis', 'Mood'),
     'LKLY': ('Likely', 'Mood'),
     'OBLIG': ('Obligative', 'Mood'),
     'OPT': ('Optative-Desiderative', 'Mood'),
     'PERM': ('Permissive', 'Mood'),
     'POT': ('Potential', 'Mood'),
     'PURP': ('General Purposive', 'Mood'),
     'REAL': ('Realis', 'Mood'),
     'SBJV': ('Subjunctive', 'Mood'),
     'SIM': ('Simulative', 'Mood'),
     'DU': ('Dual', 'Number'),
     'GPAUC': ('GrPaucal', 'Number'),
     'GRPL': ('GrPlural', 'Number'),
     'INVN': ('Inverse', 'Number'),
     'PAUC': ('Paucal', 'Number'),
     'PL': ('Pl', 'Number'),
     'SG': ('Sing', 'Number'),
     'TRI': ('Trial', 'Number'),
     '0': ('P0', 'Person'),
     '1': ('P1', 'Person'),
     '2': ('P2', 'Person'),
     '3': ('P3', 'Person'),
     '4': ('P4', 'Person'),
     'EXCL': ('Excl', 'Exclusivity'),
     'INCL': ('Incl', 'Exclusivity'),
     'OBV': ('Obviative', 'Person'),
     'PRX': ('Proximate', 'Person'),
     'POS': ('Positive', 'Polarity'),
     'NEG': ('Negative', 'Polarity'),
    'AVOID': ('Avoid', 'Politeness'), # avoidance style
    'COL': ('Colloquial', 'Politeness'),
    'ELEV': ('Elev', 'Politeness'), # Formal, Referent Elevating
    'FOREG': ('Forreg', 'Politeness'), # Formal register
    'FORM': ('Formal', 'Politeness'),
    'HIGH': ('High status', 'Politeness'),
    'HUMB': ('Humbl', 'Politeness'), # Formal, Speaker Humbling
    'INFM': ('Informal', 'Politeness'),
    'LIT': ('Literary', 'Politeness'),
    'LOW': ('Low status', 'Politeness'),
    'POL': ('Polite', 'Politeness'),
    'STELEV': ('High status, elevated', 'Politeness'),
    'STSUPR': ('High status, supreme', 'Politeness'),
    'ALN': ('Alien', 'Possession'), # Alienable possession
    'NALN': ('Inalien', 'Possession'), # Inalienable possession
    'PSS1D': ('Poss1Du', 'Possession'),
    'PSS1DE': ('Poss1DuExcl', 'Possession'),
    'PSS1DI': ('Poss1DucIncl', 'Possession'),
    'PSS1P': ('Poss1Pl', 'Possession'),
    'PSS1PE': ('Poss1PlExcl', 'Possession'),
    'PSS1PI': ('Poss1PlIncl', 'Possession'),
    'PSS1S': ('Poss1Sg', 'Possession'),
    'PSS2D': ('Poss2Du', 'Possession'),
    'PSS2DF': ('Poss2DuFem', 'Possession'),
    'PSS2DM': ('Poss2DuMasc', 'Possession'),
    'PSS2P': ('Poss2PL', 'Possession'),
    'PSS2PF': ('Poss2PlFem', 'Possession'),
    'PSS2PM': ('Poss2PlMasc', 'Possession'),
    'PSS2S': ('Poss2Sg', 'Possession'),
    'PSS2SF': ('Poss2SgFem', 'Possession'),
    'PSS2SFORM': ('Poss2SgForm', 'Possession'),
    'PSS2SINFM': ('Poss2SgInfm', 'Possession'),
    'PSS2SM': ('Poss2SgMasc', 'Possession'),
    'PSS3D': ('Poss3Du', 'Possession'),
    'PSS3DF': ('Poss3DuFem', 'Possession'),
    'PSS3DM': ('Poss3DuMasc', 'Possession'),
    'PSS3P': ('Poss3Pl', 'Possession'),
    'PSS3PF': ('Poss3PlFem', 'Possession'),
    'PSS3PM': ('Poss3PlMasc', 'Possession'),
    'PSS3S': ('Poss3Sg', 'Possession'),
    'PSS3SG': ('Poss3Ssg', 'Possession'),
    'PSS3SF': ('Poss3SgFem', 'Possession'),
    'PSS3SM': ('Poss2SgMasc', 'Possession'),
    'PSSD': ('Possessed', 'Possession'),
    'CN_R_MN': ('SR among NPs in any argument position', 'Switch_Reference'),
    'DS': ('DS', 'Switch_Reference'),
    'DSADV': ('DS Adverbial', 'Switch_Reference'),
    'LOG': ('Logophoric', 'Switch_Reference'),
    'OR': ('Open Reference', 'Switch_Reference'),
    'SEQMA': ('SeqMA', 'Switch_Reference'), #Sequential Multiclausal Aspect
    'SIMMA': ('SimMA', 'Switch_Reference'), # Simultaneous Multiclausal Aspect
    'SS': ('SS', 'Switch_Reference'),
    'SSADV': ('SS Adverbial', 'Switch_Reference'),
    '1DAY': ('1day', 'Tense'), # within 1 day
    'FUT': ('Fut', 'Tense'),
    'HOD': ('Hodiernal', 'Tense'),
    'IMMED': ('Immediate', 'Tense'),
    'PRS': ('Pres', 'Tense'),
    'PST': ('Past', 'Tense'),
    'RCT': ('Recent', 'Tense'),
    'RMT': ('Remote', 'Tense'),
    'APPL': ('Applicative', 'Valency'),
    'CAUS': ('Causative', 'Valency'),
    'IMPRS': ('Ditransitive ditrValency Impersonal', 'Valency'),
    'INTR': ('Intransitive', 'Valency'),
    'RECP': ('Reciprocal', 'Valency'),
    'REFL': ('Reflexive', 'Valency'),
    'TR': ('Transitive', 'Valency'),
    'ACFOC': ('Accompanier Focus', 'Voice'),
    'ACT': ('Active', 'Voice'),
    'AGFOC': ('Agent Focus', 'Voice'),
    'ANTIP': ('Antipassive', 'Voice'),
    'BFOC': ('Beneficiary Focus', 'Voice'),
    'CFOC': ('Conveyed Focus', 'Voice'),
    'DIR': ('Direct', 'Voice'),
    'IFOC': ('Instrument Focus', 'Voice'),
    'INV': ('Inverse', 'Voice'),
    'LFOC': ('Location Focus', 'Voice'),
    'MID': ('Middle', 'Voice'),
    'PASS': ('Passive', 'Voice'),
    'PFOC': ('Patient Focus', 'Voice')}


def filter_tags(tags):
    new_tags = []
    for tag in re.split(r",|;", tags.strip()):
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