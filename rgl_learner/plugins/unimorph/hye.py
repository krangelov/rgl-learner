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

#required_forms = {"V": ["Affirm;Nonfinite"], "N": ["s;Nom;Indef;Sg"], "A": ["s;Nom;Indef;Sg"]}

required_forms = {"V": ["Affirm;Nonfinite"], "N": ["s;Nom;Indef;Sg", "s;Dat;Indef;Sg"], 
                  "A": ["s;Nom;Indef;Sg"]}

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
    
    table["POS"].update(table["POS"].pop("noVerbform"))
    table["NEG"].update(table["NEG"].pop("noVerbform"))
    table["POS"].update(table["POS"].pop("noFiniteness"))
    table["NEG"].update(table["NEG"].pop("noFiniteness"))

    table["POS"]["PTCP"]["SBJ"] = table["POS"]["PTCP"]["SBJ"].pop("SUB")
    table["NEG"]["PTCP"]["SBJ"] = table["NEG"]["PTCP"]["SBJ"].pop("SUB")

    table["POS"]["CVB"]["LGSPEC02"] = table["POS"]["CVB"]["LGSPEC02"].pop("FUT")
    table["POS"]["CVB"]["LGSPEC03"] = table["POS"]["CVB"]["LGSPEC03"].pop("FUT")

    table["POS"]["CVB"].update(table["POS"]["CVB"].pop("noConverb"))
   # table["POS"]["CVB"].update(table["POS"]["CVB"].pop("noMood"))
   # table["NEG"]["CVB"]["LGSPEC02"] = table["NEG"]["CVB"]["LGSPEC02"].pop("FUT")

    table["POS"].update(table["POS"].pop("ACT"))
    table["POS"].update(table["POS"].pop("noMood"))
    
    table["POS"]["IMP"] = table["POS"]["IMP"].pop("2") # only exists for 2nd person so eliminate person info
    table["NEG"]["IMP"] = table["NEG"]["IMP"].pop("2") 
   
    # Tense
    
    for i in ["POS", "NEG"]:
        table[i]["COND"] = table[i]["COND"].pop("FUT") 
        table[i]["SBJV"] = table[i]["SBJV"].pop("FUT") 

        table[i]["COND"]["NPRS"] = table[i]["COND"].pop("noAspect")
        table[i]["SBJV"]["NPRS"] = table[i]["SBJV"].pop("noAspect")

        table[i]["IND"]["PST-IMPF"] = table[i]["IND"]["noTense"].pop("IPFV")
        table[i]["IND"].pop("noTense")
        
        table[i]["IND"]["FUT-PERF"] = table[i]["IND"]["FUT"].pop("PRF")
        table[i]["IND"]["FUT"] = table[i]["IND"]["FUT"].pop("noAspect")

        table[i]["IND"]["PRS-PERF"] = table[i]["IND"]["PRS"].pop("PRF")
        table[i]["IND"]["PRS"] = table[i]["IND"]["PRS"].pop("noAspect")

        table[i]["IND"]["PST-PERF"] = table[i]["IND"]["PST"].pop("PRF")
        table[i]["IND"]["PST"] = table[i]["IND"]["PST"].pop("noAspect")






def patchN(lemma, table):
    table["s"] = table.pop("noPossession")
    table["poss"] = {"PSS1S": table.pop("PSS1S"),
                     "PSS2S": table.pop("PSS2S")}
    
def patchA(lemma, table):
    table["s"] = table.pop("noPossession")
    table["poss"] = {"PSS1S": table.pop("PSS1S"),
                     "PSS2S": table.pop("PSS2S")}
    