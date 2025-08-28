iso3 = "Gla"

def filter_lemma(lemma, pos, table):
    if pos == "noun" and lemma == "Leòmhann":
        return True

    return False

def patchPOS(lemma,tag,table):
    if lemma == "mearanach" and tag == "noun":
        return "adjective"
    return tag

def patchN(lemma,table):
    tbl = table.pop("noGender")
    masculine = table.pop("masculine","-")
    if masculine != "-":
        tbl["nominative"]["indefinite"]["singular"] = masculine
    for number, feminine in table.pop("feminine").items():
        if feminine != "-":
            tbl["nominative"]["indefinite"][number] = feminine
    for case, forms in tbl.items():
        if type(forms) == str:
            print(case,forms)
            tbl[case] = {"indefinite": forms, "definite": "-"}
        else:
            o = forms.pop("noSpecies",{})
            if type(o) == str:
                tbl["nominative"]["indefinite"] = o
            else:
                for tag,form in forms.pop("noSpecies",{}).items():
                    if form != "-":
                        tbl[case]["indefinite"] = form
    noCase = tbl.pop("noCase",{})
    if noCase:
        tbl["nominative"]["indefinite"] = noCase
    table["s"] = tbl
