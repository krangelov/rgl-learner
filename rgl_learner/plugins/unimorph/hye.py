iso3 = "Hye"

params = {
        "LGSPEC01": ("Resultative", "PartType"),
        "LGSPEC02": ("FutCon1", "Converb"),
        "LGSPEC03" : ("FutCon2", "Converb"),
        "LGSPEC04" : ("NegPart", "VerbForm"),
        "SBJ": ("Subject", "PartType"),
        "SIM": ("Simultaneous", "Converb"),
        "FUT-PERF": ("Fut_Perf", "Tense"),
        "PST-IMPF": ("Past_Imperf", "Tense"),
        "PST-PERF": ("Past_Perf", "Tense"),
        "PRS-PERF": ("Pres_Perf", "Tense"),
        "NPRS": ("Non_Past", "Aspect"),
        #"DAT": ("Dat", "Case"),
        #"NOM": ("Nom", "Case"),
        }

default_params = {"Species": "INDF", "Polarity": "POS", 
                  "PartType": "SBJ", "Voice": "ACT"}

order = {"V": ["Polarity", "Verbform", "Converb", "PartType", "Finiteness", "Voice", "Mood", "Valency", "Tense", "Aspect",  "Person",  "Case", "Number" ], 
         "N": ["Possession", "Case", "Species", "Number"], 
         "A": ["Possession", "Case", "Species", "Number"]}

required_forms = {"V": ["s"],
                  "N": ["s;Nom;Sg", "s;Dat;Sg"], 
                  "A": ["s;Nom;Sg"]}

rules = {"N": {
    (("s;Nom;Indef;Sg", ("ի",)), ("s;Dat;Indef;Sg", ("ու",))) : 3,
    (("s;Nom;Indef;Sg", ("ի",)), ("s;Dat;Indef;Sg", ("ու",))) : 3,
    (("s;Nom;Indef;Sg", ("ստ",)),) : 1,
    (("s;Nom;Indef;Sg", ("նդ",)),) : 1,
    (("s;Nom;Indef;Sg", ("ր",)),) : 1,
    (("s;Nom;Indef;Sg", ("ում",)),) : 4,
    (("s;Nom;Indef;Sg", ("ություն",)),) : 10,
    (("s;Nom;Indef;Sg", ("յուն",)),) : 10,
    (("s;Nom;Indef;Sg", ("^.{1}ուն",)),) : 7,
    (("s;Nom;Indef;Sg", ""),("s;Abl;Indef;Sg", ("վանից"))): 16,
    (("s;Nom;Indef;Sg", ""),) : 1,
},
"A": {(("s;Nom;Indef;Sg", ""),) : 1,},
"V": {(("Affirm;Nonfinite", ("անալ",)),): 4,
      (("Affirm;Nonfinite", ("ենալ",)),): 4,
      (("Affirm;Nonfinite", ("նել",)),): 8,
    (("Affirm;Nonfinite", ("ալ",)),) : 2,
    #(("Affirm;Nonfinite", ("չել",)),): 1,
      (("Affirm;Nonfinite", ("ել",)),) : 1,

}
         }

def filter_lemma(lemma,tag,table):
    if lemma == "անզգայանալ":
        return True
    return False

def patchV(lemma, table):

    table.pop("NEG")
    table.update(table.pop("POS"))

    table.update(table.pop("noVerbform"))
    table.update(table.pop("noFiniteness"))

    table["PTCP"]["SBJ"] = table["PTCP"]["SBJ"].pop("SUB")

    table["CVB"]["LGSPEC02"] = table["CVB"]["LGSPEC02"].pop("FUT")
    table["CVB"]["LGSPEC03"] = table["CVB"]["LGSPEC03"].pop("FUT")

    table["CVB"].update(table["CVB"].pop("noConverb"))
    table["CVB"].pop("PRF")
    table["s"] = table.pop("NFIN")
    if table["s"] == "-":
        table["s"] = lemma

    table["CVB"]["Negative"] = table["CVB"].pop("noAspect")

    table.update(table.pop("ACT"))
    table.update(table.pop("noMood"))
    
    table["IMP"] = table["IMP"].pop("2") # only exists for 2nd person so eliminate person info
   
    # Tense
    
    table["COND"] = table["COND"].pop("FUT") 
    table["SBJV"] = table["SBJV"].pop("FUT") 

    table["COND"]["NPRS"] = table["COND"].pop("noAspect")
    table["SBJV"]["NPRS"] = table["SBJV"].pop("noAspect")
    
    table["COND"].pop("IPFV")
    table["COND"].pop("PFV")
    table["SBJV"].pop("IPFV")
    table["SBJV"].pop("PFV")

    table["PST"] = table["IND"]["PST"].pop("noAspect")
    table.pop("IND")


def patchN(lemma, table):
    table["s"] = table.pop("noPossession")
    table["def_nom"] = table["s"]["NOM"].pop("DEF")
    table["def_dat"] = table["s"]["DAT"].pop("DEF")
    table["s"]["NOM"] = table["s"]["NOM"].pop("INDF")
    table["s"]["DAT"] = table["s"]["DAT"].pop("INDF")
    table["s"].pop("SUB")
    table["poss1"] = table.pop("PSS1S")
    table["poss2"] = table.pop("PSS2S")
    table["poss1"].pop("SUB")
    table["poss2"].pop("SUB")

def patchA(lemma, table):
    table["s"] = table.pop("noPossession")
    table["def_nom"] = table["s"]["NOM"].pop("DEF")
    table["def_dat"] = table["s"]["DAT"].pop("DEF")
    table["s"]["NOM"] = table["s"]["NOM"].pop("INDF")
    table["s"]["DAT"] = table["s"]["DAT"].pop("INDF")
    table["s"].pop("SUB")
    table["poss1"] = table.pop("PSS1S")
    table["poss2"] = table.pop("PSS2S")
    table["poss1"].pop("SUB")
    table["poss2"].pop("SUB")
