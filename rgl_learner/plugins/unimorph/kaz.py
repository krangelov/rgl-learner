iso3 = "Kaz"

def patchN(lemma,table):
    table["s"] = {case:table.pop(case,"-") for case in ["NOM","ACC","DAT","LOC","GEN","INST","ABL"]}
    table["poss"] = {num:table.pop(num,"-") for num in ["SG","PL"]}
