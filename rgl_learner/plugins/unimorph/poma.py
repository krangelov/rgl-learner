iso3 = "Poma"

def patchA(lemma,table):
    def set_case(d, case):
        acc = d.get(case,{})
        pl  = acc.get("PL",{})
        masc = pl.get("MASC",{})
        if type(masc) is dict:
            acc["HUM"] = masc.pop('HUM',"-")
            pl["MASC"] = masc.pop('NHUM',"-")
    indef = table.get("INDF",{})
    set_case(indef, "ACC")
    set_case(indef, "GEN")
    set_case(indef, "NOM")
    set_case(indef, "VOC")
