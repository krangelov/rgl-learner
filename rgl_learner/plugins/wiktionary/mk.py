iso3 = "Mkd"

def patchPOS(lemma,tag,table):
    if tag == 'num':
        return tag
    o = table.get("indefinite")
    if type(o) is dict and o.get("masculine"):
        return "adj"
    return tag

def filter_lemma(lemma, pos):
    if pos == "verb" and (lemma == "биде" or lemma == "сум" or lemma == "в."):
        return True

    if pos == "adj" and (lemma == "два" or lemma == "т.н."):
        return True

    if pos == "adv" and (lemma == "т.е." or lemma == "многумина"):
        return True

    if pos == "pron" and (lemma == "моја"):
        return True

    if pos == "name":
        return True

    if ' ' in lemma:
        return True

    return False


def patchN(lemma,table):
    table.setdefault("indefinite",{}).setdefault("singular",lemma)
    table.setdefault("indefinite",{}).setdefault("plural","-")
    table.setdefault("definite",{}).setdefault("unspecified",{}).setdefault("singular","-")
    table.setdefault("definite",{}).setdefault("unspecified",{}).setdefault("plural","-")
    table.setdefault("definite",{}).setdefault("proximal",{}).setdefault("singular","-")
    table.setdefault("definite",{}).setdefault("proximal",{}).setdefault("plural","-")
    table.setdefault("definite",{}).setdefault("distal",{}).setdefault("singular","-")
    table.setdefault("definite",{}).setdefault("distal",{}).setdefault("plural","-")
    table.setdefault("vocative",{}).setdefault("singular","-")
    table.setdefault("vocative",{}).setdefault("plural","-")
    table["count-form"] = table.get("count-form",{}).get("plural",table.get("indefinite",{"plural": "-"}).get("plural","-"))
    table.pop("singular",None)
    table.pop("plural",None)
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("augmentative",None)
    table.pop("collective",None)
    table.pop("alternative",None)
    table.pop("general",None)

def patchV(lemma,table):
    if not table.get("present"):
        table.clear()
        return

    table.pop("imperfective",None)
    table.pop("perfective",None)

    imp = table.get("imperfect",{})
    sg  = imp.pop("singular",{})
    pl  = imp.pop("plural",{})
    table["imperfect"] = {"singular": sg, "plural": pl}
    o = imp.get("pluperfect",{}).get("present",{})
    if type(o) is dict:
        o.pop(None,None)
    imp.pop("present",None)
    aorist = table.get("aorist",{})
    aorist.pop("perfect",None)
    aorist.pop("pluperfect",None)
    aorist.pop("future",None)
    aorist.pop("past-future",None)
    aorist.pop("conditional",None)
    aorist.setdefault("adjectival",{}).setdefault("participle","-")
    aorist.setdefault("adverbial",{}).setdefault("participle","-")
    aorist.setdefault("noun-from-verb","-")
    o = imp.pop("perfect",{}).get("present",{})
    table["participle"] = {"imperfect": {"masculine": imp.pop("masculine","-"),
                                         "feminine": imp.pop("feminine","-"),
                                         "neuter": imp.pop("neuter","-"),
                                         "plural": pl.pop(None,"-")},
                           "aorist": {"masculine": aorist.pop("masculine","-"), "feminine": aorist.pop("feminine","-"), "neuter": aorist.pop("neuter","-"), "plural": aorist.get("plural",{}).pop(None,"-")},
                           "adjectival": aorist.pop("adjectival",{}).get("participle","-"),
                           "adverbial":  aorist.pop("adverbial",{}).get("participle","-"),
                           "perfect": o.get("reported",{}).get("има","-").split()[-1]}
    table["noun-from-verb"] = aorist.pop("noun-from-verb","-")
    table["aorist"]={"singular": aorist.pop("singular",{}), "plural": aorist.pop("plural",{})}
    imper=aorist.pop("imperative",{})
    table.get("imperative",{}).pop("future",None)
    table.get("imperative",{}).pop("past-future",None)
    table.setdefault("imperative",{})["singular"] = imper.get("singular",{}).get("second-person","-")
    table.setdefault("imperative",{})["plural"]   = imper.get("plural",{}).get("second-person","-")
    table.pop("future",None)
    table.pop("conditional",None)
    table.pop("perfect",None)
    table.pop("pluperfect",None)


def patchA(lemma,table):
    indef = table.setdefault("indefinite",{})
    if indef.get("masculine","-") == "-":
        indef["masculine"] = lemma
    indef.setdefault("feminine", table.pop("feminine","-"))
    indef.setdefault("neuter", table.pop("neuter","-"))
    indef.setdefault("plural", "-")
    defn = table.setdefault("definite",{})
    for tag in ["unspecified","proximal","distal"]:
        d = defn.setdefault(tag,{})
        d.setdefault("masculine", "-")
        d.setdefault("feminine", "-")
        d.setdefault("neuter", "-")
        d.setdefault("plural", "-")

    table.pop("abstract-noun",None)
    table.pop("comparative",None)
    table.pop("superlative",None)
    table.pop("masculine",None)
    table.setdefault("adverb",indef.get("neuter","-"))


def patchAdv(lemma,table):
    table.clear()
    table["s"] = lemma


def patchPron(lemma,table):
    table.get("plural",{}).pop("error-unrecognized-form",None)
