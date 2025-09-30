iso3 = "Kmr"

ignore_tags = ["LGSPEC2"]

params = {"VOC": ("voc", "Voc"),
          "CONST": ("Const", "Case")}

order = {"N": ["Species", "Case", "Number"],
         "A": ["Species", "Person", "Case", "Number", "Mood", "Aspect", "Polarity", "Tense", "Verbform"],
         "V":  ["Polarity", "Verbform", "Mood",  "Tense", "Aspect", "Person", "Number", "Species", "Copula", "Case",  ],
         "Prep": ["Species", "Case", "Number"],
         "Adv": ["Species", "Case", "Number"],
         "Det": ["Species", "Case", "Number"],
         "Pron": ["Species", "Case", "Number"]}

default_params = {"Polarity": "POS", "Case": "CONST"}

required_forms = {"N": ["s;Def;Nom;Pl"], "V": ["Affirm;Indicative;Pres;Imperfective;P1;Sg;noCopula",
                                               "Affirm;Indicative;Past;Imperfective;P1;Sg;noCopula"]}

def filter_lemma(lemma, pos, table):
    if pos in ["V.MSDR", "V.PTCP", "PRO", "DET", "PART", "NUM", "ADP", "Num", "Adp", "Digit", "Det", "Pron", "ADJ", "ADV"]:
        return True
    if lemma.startswith("pereng"):
        return True
    if "(" in lemma or ")" in lemma:
        return True
    return False

def merge_tags(pos, forms, w, tags):
    new_forms = []
    if "PL" in tags and "SG" in tags:
        tags_1 = list(map(lambda x: x.replace("PL", ""), tags))
        tags_2 = list(map(lambda x: x.replace("SG", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "ACC" in tags and "VOC" in tags:
        tags_1 = list(map(lambda x: x.replace("ACC", ""), tags))
        tags_2 = list(map(lambda x: x.replace("VOC", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "ACC" in tags and "NOM" in tags:
        tags_1 = list(map(lambda x: x.replace("ACC", ""), tags))
        tags_2 = list(map(lambda x: x.replace("NOM", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "PRS" in tags and "PST" in tags:
        tags_1 = list(map(lambda x: x.replace("PST", ""), tags))
        tags_2 = list(map(lambda x: x.replace("PRS", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "2" in tags and "3" in tags:
        tags_1 = list(map(lambda x: x.replace("2", ""), tags))
        tags_2 = list(map(lambda x: x.replace("3", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "1" in tags and "3" in tags:
        tags_1 = list(map(lambda x: x.replace("1", ""), tags))
        tags_2 = list(map(lambda x: x.replace("3", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "1" in tags and "2" in tags:
        tags_1 = list(map(lambda x: x.replace("1", ""), tags))
        tags_2 = list(map(lambda x: x.replace("2", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "IMP" in tags and "SBJV" in tags:
        tags_1 = list(map(lambda x: x.replace("IMP", ""), tags))
        tags_2 = list(map(lambda x: x.replace("SBJV", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "IND" in tags and "SBJV" in tags:
        tags_1 = list(map(lambda x: x.replace("IND", ""), tags))
        tags_2 = list(map(lambda x: x.replace("SBJV", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    elif "IPFV" in tags and "PROG" in tags:
        tags_1 = list(map(lambda x: x.replace("IPFV", ""), tags))
        tags_2 = list(map(lambda x: x.replace("PROG", ""), tags))
        new_forms.extend(merge_tags(pos, forms, w, tags_1))
        new_forms.extend(merge_tags(pos, forms, w, tags_2))
    if new_forms:
        return new_forms
    return [(w, tags)]

def patchN(lemma, table):
    df = table.pop("DEF",{})
    nom_def = df.get("noPerson", {}).get("NOM",{})
    nom_def.update(nom_def.pop("ACC",{}))
    nom_def.update(table.pop("IND",{}).get("PST",{}).get("PFV",{}).get("DEF",{}).get("NOM",{}).get("POS",{}).get("1",{}).get("2",{}).get("3",{}))
    nom_def = nom_def.pop("MASC",{}).pop("FEM",nom_def)
    sg_pl = nom_def.get("SG",{}).get("PL")
    if sg_pl:
        nom_def["SG"] = sg_pl
        nom_def["PL"] = sg_pl
    voc = df.get("ACC",{}).pop("VOC",None)
    if voc:
        voc_sg = voc.pop("SG","-")
    else:
        voc_sg = "-"

    df.setdefault("NOM",{}).setdefault("SG",df.pop("SG","-"))
    df.setdefault("NOM",{}).setdefault("PL","-")
    df.setdefault("ACC",{}).setdefault("SG","-")
    df.setdefault("ACC",{}).setdefault("PL","-")

    indf = table.pop("INDF",{})
    indf.setdefault("NOM",{}).setdefault("SG",lemma)
    indf.setdefault("NOM",{}).setdefault("PL",indf.pop("PL","-"))
    indf.setdefault("ACC",{}).setdefault("SG",voc_sg)
    indf.setdefault("ACC",{}).setdefault("PL","-")

    table["s"] = {"INDF": indf, "DEF": df}
    voc = df.pop("VOC",{})
    voc.setdefault("SG", voc_sg) 
    voc.setdefault("PL", "-")
    table["voc"] = voc

    table.pop("noSpecies")

    
    

def patchA(lemma, table):
    table.clear()
    table["s"] = lemma

def patchAdv(lemma, table):
    table.clear()
    table["s"] = lemma


def patchV(lemma, table):
    for i in table:
        table[i].update(table[i].pop("noVerbform"))
        table[i].pop("MSDR")
        table[i]["COND"] = {"PRS":table[i]["COND"]["PST"].pop("noAspect"),
                     "PRF": table[i]["COND"]["PST"].pop("PRF")}
                     

        table[i]["IMP"] = table[i]["IMP"].pop("PRS")
        table[i].pop("PTCP")
    table["lemma"] = lemma
    return table




def patchVerb(lemma, table):
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
    #for person in ["1","2","3"]:
    #    for number in ["SG","PL"]:
    #        x = t.get(person,{}).get(number,{})
    #        if type(x) == dict:
    #            t[person][number] = x.get(None,"-")

    #t = {
    #    "pres":      table["IND"]["PRS"]["IPFV"],
    #    "pres_perf": table["IND"]["PRS"]["PRF"],
    #    "past":      table["IND"]["PST"]["PFV"],
    #    "past_perf": table["IND"]["PST"]["PRF"],
    #    "past_prog": table["IND"]["PST"]["PROG"],
    #    "cond_past": table["COND"]["PST"],
    #    "cond_perf": table["COND"]["PRF"],
    #    "imp":       table["IMP"],
    #    "subj":      table["SBJV"]
    #   }
    #table.clear()
   # table.update(t)
