iso3 = "Poma"

def patchA(lemma,table):
    table.update(table.pop("INDF",{}))
    for case in ["NOM","ACC","GEN","VOC"]:
        t = table.setdefault(case,{})
        g = t.pop("MASC",{})
        t["s"] = {"MASC": g}
        g.setdefault("SG","-")
        pl = g.get("PL",{})
        if type(pl) == dict:
            g["PL"]  = pl.pop("HUM","-")
            t["hum"] = pl.pop("NHUM","-")
        else:
            t["hum"] = "-"

        for gender in ["FEM","NEUT"]:
            g = t.pop(gender,{})
            t["s"][gender] = g
            for number in ["SG","PL"]:
                g.setdefault(number,"-")

def patchN(lemma,table):
    table.update(table.pop("INDF",{}))
