iso3 = "Kmr"

def patchPOS(lemma,tag,table):
    if tag == 'noun' and table.get("comparative"):
        return "adj"
    return tag

def filter_lemma(lemma, pos, table):
    if pos == "pron" or pos == "verb" or pos == "name":
        return True

    if ' ' in lemma:
        return True

    return False

def patchN(lemma, table):
    table.pop("Arabic",None)
    singular = lemma
    plural   = table.pop("plural","-")
    for spec in ["indefinite","definite"]:
        d1 = table.setdefault(spec,{})
        for case in ["nominative","oblique","construct"]:
            case2 = table.pop(case,{})

            d2 = d1.get(case,{})
            d3 = d2.pop("masculine",None)
            if d3:
                d2 = d3
            d3 = d2.pop("feminine",None)
            if d3:
                d2 = d3
            d2.setdefault("singular",d2.pop(None,case2.get("singular",singular)))
            d2.setdefault("plural",case2.get("plural",plural))
            singular = "-"
            plural   = "-"
            d1[case] = d2
    obl = table["definite"]["oblique"]
    for number in ["singular","plural"]:
        d1 = obl.get(number)
        if type(d1) == dict:
            obl[number] = d1[None]
    obl.pop("demonstrative",None)
    d2 = table["definite"].pop("vocative",{})
    voc2 = table.pop("vocative",{})
    d3 = d2.pop("masculine",None)
    if d3:
        d2 = d3
    d3 = d2.pop("feminine",None)
    if d3:
        d2 = d3
    d2.setdefault("singular",d2.pop(None,voc2.get("singular","-")))
    d2.setdefault("plural",voc2.get("plural","-"))
    table["s"] = {"indefinite": table.pop("indefinite"), "definite": table.pop("definite")}
    table["voc"] = d2
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("alternative",None)

def patchA(lemma, table):
    table["s"] = lemma
    table["superl"] = table.pop("superlative","-")
    table["compar"] = table.pop("comparative","-")
    table.pop("Arabic",None)
    table.pop("indefinite",None)
    table.pop("definite",None)

def patchAdv(lemma, table):
    table["s"] = lemma
    table.pop("superlative","-")
    table.pop("comparative","-")

def patchV(lemma, table):
    table.pop("subjunctive",{})
    pperf = table.get("present",{}).pop("perfect",None)
    if pperf:
        table["present-perfect"] = pperf
