iso3 = "Kmr"

def patchN(lemma, table):
    nom = table.pop("NOM",{})
    nom_def = nom.get("DEF",{})
    sg_pl = nom_def.get("SG",{}).get("PL")
    if sg_pl:
        nom_def["SG"] = sg_pl
        nom_def["PL"] = sg_pl
    voc = table.get("ACC",{}).pop("VOC",None)
    if voc:
        voc_sg = voc.pop("DEF",{}).pop("SG","-")
    else:
        voc_sg = "-"

    acc = table.pop("ACC",{})
    acc.setdefault("DEF",{}).setdefault("SG",voc_sg)

    table["s"] = {"NOM": nom, "ACC": acc}
    voc = table.pop("VOC",{})
    if voc:
        voc = voc.pop("DEF",{})
    voc.setdefault("SG", voc_sg) 
    table["voc"] = voc
    
    table.pop("DEF",None)
    table.pop("INDF",None)
