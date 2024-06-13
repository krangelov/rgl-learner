iso3 = "Kmr"

def filter_lemma(lemma, pos, table):
    if pos in ["V.MSDR", "V.PTCP", "PRO", "DET", "PART", "NUM", "ADP"]:
        return True
    return False

def patchN(lemma, table):
    nom = table.pop("NOM",{})
    nom.update(nom.pop("ACC",{}))
    nom.setdefault("DEF",{}).update(table.pop("IND",{}).get("PFV",{}).get("NOM",{}).get("DEF",{}).get("POS",{}).get("PST",{}).get("1",{}).get("2",{}).get("3",{}))
    nom_def = nom.get("DEF",{})
    nom_def = nom_def.pop("FEM",{}).pop("MASC",nom_def)
    sg_pl = nom_def.get("SG",{}).get("PL")
    if sg_pl:
        nom_def["SG"] = sg_pl
        nom_def["PL"] = sg_pl
    voc = table.get("ACC",{}).pop("VOC",None)
    if voc:
        voc_sg = voc.pop("DEF",{}).pop("SG","-")
    else:
        voc_sg = "-"

    nom.setdefault("INDF",{}).setdefault("SG",lemma)
    nom.setdefault("INDF",{}).setdefault("PL","-")
    nom.setdefault("DEF",{}).setdefault("SG","-")
    nom.setdefault("DEF",{}).setdefault("PL","-")

    acc = table.pop("ACC",{})
    acc.setdefault("INDF",{}).setdefault("SG","-")
    acc.setdefault("INDF",{}).setdefault("PL","-")
    acc.setdefault("DEF",{}).setdefault("SG",voc_sg)
    acc.setdefault("DEF",{}).setdefault("PL","-")

    table["s"] = {"NOM": nom, "ACC": acc}
    voc = table.pop("VOC",{})
    if voc:
        voc = voc.pop("DEF",{})
    voc.setdefault("SG", voc_sg) 
    voc.setdefault("PL", "-")
    table["voc"] = voc

    table.pop("DEF",None)
    table.pop("INDF",None)

def patchA(lemma, table):
    table.clear()
    table["s"] = lemma

def patchAdv(lemma, table):
    table.clear()
    table["s"] = lemma

def patchV(lemma, table):
    table.pop("ACC",None)

    ind = table.get("IND",{})
    x = ind.get("PRS",{}).get("PST",{}).get("IPFV",{}).get("PROG",{}).get("POS",{}).get("2",{}).get("3",{}).get("SG")
    if x:
        ind["PRS"].pop("PST",{})
        ind.setdefault("PRS",{}).setdefault("IPFV",{}).setdefault("POS",{}).setdefault("2",{}).setdefault("SG",x)
        ind.setdefault("PRS",{}).setdefault("IPFV",{}).setdefault("POS",{}).setdefault("3",{}).setdefault("SG",x)
        ind.setdefault("PST",{}).setdefault("PROG",{}).setdefault("POS",{}).setdefault("2",{}).setdefault("SG",x)
        ind.setdefault("PST",{}).setdefault("PROG",{}).setdefault("POS",{}).setdefault("3",{}).setdefault("SG",x)

    sbjv = table.pop('SBJV',{}).get('PRS',{})
    table["SBJV"] = sbjv

    x = ind.get("SBJV",{}).get("PRS",{}).get("PST",{}).get("PFV",{}).get("NEG",{}).get("2",{}).get("3",{}).get("SG")
    if x:
        ind.pop("SBJV")
        ind.setdefault("PST",{}).setdefault("PFV",{}).setdefault("NEG",{}).setdefault("2",{}).setdefault("SG",x)
        ind.setdefault("PST",{}).setdefault("PFV",{}).setdefault("NEG",{}).setdefault("3",{}).setdefault("SG",x)
        sbjv.setdefault("NEG",{}).setdefault("2",{}).setdefault("SG",x)
        sbjv.setdefault("NEG",{}).setdefault("3",{}).setdefault("SG",x)

    x = ind.get("PST",{}).get("PFV",{}).pop("DEF",{}).get("NOM",{}).get("POS",{}).get("1",{}).get("2",{}).get("3",{}).get("SG",{}).get("PL")
    if x:
        ind.get("PST",{}).get("PFV",{}).setdefault("POS",{}).setdefault("1",{}).setdefault("SG",x)
        ind.get("PST",{}).get("PFV",{}).setdefault("POS",{}).setdefault("1",{}).setdefault("PL",x)
        ind.get("PST",{}).get("PFV",{}).setdefault("POS",{}).setdefault("2",{}).setdefault("SG",x)
        ind.get("PST",{}).get("PFV",{}).setdefault("POS",{}).setdefault("2",{}).setdefault("PL",x)
        ind.get("PST",{}).get("PFV",{}).setdefault("POS",{}).setdefault("3",{}).setdefault("SG",x)
        ind.get("PST",{}).get("PFV",{}).setdefault("POS",{}).setdefault("3",{}).setdefault("PL",x)

    table.pop("DEF",None)
    table.pop("NEG",None)

    for pol in ["POS","NEG"]:
        for person in ["1","2","3"]:
            for number in ["SG","PL"]:
                sbjv.setdefault(pol,{}).setdefault(person,{}).setdefault(number,"-")

    def fix(table):
        for pol in ["POS","NEG"]:
            t = table.setdefault(pol,{})
            pl = t.get("1",{}).pop("2",{}).get("3",{}).get("PL")
            if pl:
                t.setdefault("1",{}).setdefault("SG","-")
                t.setdefault("1",{}).setdefault("PL",pl)
                t.setdefault("2",{}).setdefault("SG","-")
                t.setdefault("2",{}).setdefault("PL",pl)
                t.setdefault("3",{}).setdefault("SG","-")
                t.setdefault("3",{}).setdefault("PL",pl)
            pl = t.get("2",{}).pop("3",{}).get("PL")
            if pl:
                t.setdefault("2",{}).setdefault("SG","-")
                t.setdefault("2",{}).setdefault("PL",pl)
                t.setdefault("3",{}).setdefault("SG","-")
                t.setdefault("3",{}).setdefault("PL",pl)
        return table

    table["IMP"]  = fix(table.pop('IMP',{}).get('SBJV',{}).get('PRS',{}))

    t = table.get("COND",{}).get("PST",{})
    table.get("COND",{})["PRF"] = t.pop("PRF",{})

    for tense in ["PST","PRF"]:
        t = table.get("COND",{}).get(tense,{})
        if t:
            fix(t)

    for tense in ["PRS","PST","PRF"]:
        t = ind.get(tense,{})
        if not t:
            continue
        for aspect in ["PFV","PROG","PRF","IPFV"]:
            asp = t.get(aspect)
            if asp:
                fix(asp)
                for pol in ["POS","NEG"]:
                    for person in ["1","2","3"]:
                        for number in ["SG","PL"]:
                            asp.setdefault(pol,{}).setdefault(person,{}).setdefault(number,"-")

    t = ind.get("PRS",{}).get("IPFV",{}).get("POS",{})
    for person in ["1","2","3"]:
        for number in ["SG","PL"]:
            x = t.get(person,{}).get(number,{})
            if type(x) == dict:
                t[person][number] = x.get(None,"-")

    t = {
        "pres":      table["IND"]["PRS"]["IPFV"],
        "pres_perf": table["IND"]["PRS"]["PRF"],
        "past":      table["IND"]["PST"]["PFV"],
        "past_perf": table["IND"]["PST"]["PRF"],
        "past_prog": table["IND"]["PST"]["PROG"],
        "cond_past": table["COND"]["PST"],
        "cond_perf": table["COND"]["PRF"],
        "imp":       table["IMP"],
        "subj":      table["SBJV"]
       }
    table.clear()
    table.update(t)
