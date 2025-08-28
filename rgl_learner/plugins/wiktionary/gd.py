iso3 = "Gla"

vars = {}

def preprocess(record):
    if record.get("pos") == "noun":
        categories = record.get("categories",[])

        found = False

        def extract_gender(categories):
            nonlocal found
            if 'Irish masculine nouns' in categories:
                found = True
                return ["masculine"]
            elif 'Irish feminine nouns' in categories:
                found = True
                return ["feminine"]
            elif 'Irish neuter nouns' in categories:
                found = True
                return ["neuter"]
            return []

        record["tags"] = extract_gender(categories)
        for sense in record["senses"]:
            sense["tags"] = extract_gender(sense.get("categories",[]))

        if not found:
            record["tags"] = ["masculine"]

    return True

def filter_lemma(lemma, pos, table):
    if pos == "noun" and lemma == "Leòmhann":
        return True
    if pos != "noun":
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
            tbl[case] = {"indefinite": forms, "definite": "-"}
        else:
            o = forms.pop("noSpecies",{})
            if type(o) == str:
                tbl["nominative"]["indefinite"]["singular"] = o
                tbl["nominative"]["indefinite"]["plural"] = "-"
            else:
                for tag,form in o.items():
                    if form == "no-table-tags":
                        continue
                    tbl[case].setdefault("indefinite",{}).setdefault(tag,form)
    noCase = tbl.pop("noCase",{})
    if noCase:
        if type(noCase) == str:
            noCase = {"indefinite": {"singular": noCase, "plural": "-"}, "definite": {"singular": "-", "plural": "-"}}
        tbl["nominative"] = noCase
    tbl["nominative"]["indefinite"]["singular"] = lemma
    tbl.setdefault("nominative",{}).setdefault("indefinite",{}).setdefault("plural","-")
    
    table["s"] = tbl
    table["voc"] = tbl.pop("vocative",{}).pop("definite",{"singular": "-", "plural": "-"})
