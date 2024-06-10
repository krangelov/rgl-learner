iso3 = "Alb"

def filter_lemma(lemma,tag,table):
    if tag == "name" or tag == "pron" or tag == "det":
        return True
    if tag == "adj" and lemma == "yt":
        return True
    if tag == 'verb' and lemma == "qis":
        return True
    if tag == 'verb' and lemma == "preh":
        return True
    if tag == 'verb' and lemma == "buças":
        return True
    if tag == 'verb' and lemma == "hallakat":
        return True
    if tag == 'verb' and ("masculine" in table or "feminine" in table):
        return True
    return False

def patchPOS(lemma,tag,table):
    if tag == 'noun' and table.get("participle"):
        return "verb"
    if tag == 'noun' and (lemma == 'fatkeq' or lemma == 'shëndetshëm'):
        return 'adj'
    if tag == 'adj' and lemma == "dygjuhësi":
        return "noun"
    if tag == 'verb' and lemma == "shpjegim":
        return "noun"
    if tag == 'verb' and lemma == "hjedhë":
        return "noun"
    if tag == 'adv' and lemma == "ngaldaltë":
        return "noun"
    return tag

def patchN(lemma,table):
    def set_case(d, case):
        c = d.setdefault(case,{})
        if type(c) is str:
            table.pop(case,None)
            d[case] = {"singular": c, "plural": "-"}
        elif type(c) is dict:
            c.setdefault("singular",table.pop(case,"-"))
            c.setdefault("plural","-")

    indef = table.setdefault("indefinite",{})
    if type(indef) is dict:
        nom = indef.setdefault("nominative",{})
        if type(nom) is str:
            indef["nominative"] = {"singular": nom, "plural": "-"}
        if nom:
            indef.pop("singular",None)
            indef.pop("plural",None)
        else:
            nom["singular"] = indef.pop("singular",lemma)
            nom["plural"]   = indef.pop("plural",table.pop("plural","-"))
    elif type(indef) is str:
        indef = {"nominative": {"singular": indef, "plural": "-"}}
        table["indefinite"] = indef
    set_case(indef,"accusative")
    set_case(indef,"dative")
    set_case(indef,"genitive")
    set_case(indef,"ablative")
    indef.pop(None,None)
    def_ = table.setdefault("definite",{})
    if type(def_) is dict:
        nom = def_.setdefault("nominative",{})
        if type(nom) is str:
            def_["nominative"] = {"singular": nom, "plural": "-"}
        if nom:
            def_.pop("singular",None)
            def_.pop("plural",None)
        else:
            nom["singular"] = def_.pop("singular","-")
            nom["plural"]   = def_.pop("plural","-")
    elif type(def_) is str:
        def_ = {"nominative": {"singular": def_, "plural": "-"}}
        table["definite"] = def_
    set_case(def_,"accusative")
    set_case(def_,"dative")
    set_case(def_,"genitive")
    set_case(def_,"ablative")
    def_.pop(None,None)
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("neuter",None)
    table.pop("alternative",None)
    table.pop("Cyrillic",None)

def patchV(lemma,table):
    def set_all(t,lemma):
        t.setdefault("singular",{}).setdefault("first-person",lemma)
        t.setdefault("singular",{}).setdefault("second-person","-")
        t.setdefault("singular",{}).setdefault("third-person","-")
        t.setdefault("plural",{}).setdefault("first-person","-")
        t.setdefault("plural",{}).setdefault("second-person","-")
        t.setdefault("plural",{}).setdefault("third-person","-")
        return t

    ind = table.setdefault("indicative",{})
    set_all(ind.setdefault("present",{}), lemma)
    if past := table.pop("past",None):
        set_all(ind.setdefault("past",{}), "-")
        ind.setdefault("past",past)
    ind.pop("future",None)
    ind.pop("perfect",None)
    ind.pop("progressive",None)
    ind.get("past",{}).pop("perfect",None)
    set_all(ind.setdefault("past",{}), "-")
    set_all(ind.setdefault("aorist",{}), "-")
    set_all(ind.setdefault("imperfect",{}), "-")
    ind.get("aorist",{}).pop("aorist-ii",None)

    table.pop("subjunctive",None)
    table.pop("conditional",None)
    table.pop("jussive",None)
    table.pop("privative",None)
    table.pop("present",None)
    table.pop("perfect",None)
    table.pop("active",None)

    imp = table.get("imperative",{}).pop("present",{})
    if imp:
        singular = imp.get("singular",{}).get("second-person","-")
        if type(singular) is dict:
            singular = singular.pop(None)
        plural = imp.get("plural",{}).get("second-person","-")
        if type(plural) is dict:
            plural = plural.pop(None)
        table["imperative"] = {"singular": singular, "plural": plural}
    else:
        table["imperative"] = {"singular": "-", "plural": "-"}

    table.pop("gerund",None)
    table.pop("alternative",None)
    table.pop("Gheg",None)
    table.pop("error-unrecognized-form",None)
    table.setdefault("participle","-")
    table.setdefault("infinitive","-")

    adm = table.pop("admirative",{})
    table["pres_admirative"] = set_all(adm.get("present",{}), "-")
    table["imperf_admirative"] = set_all(adm.setdefault("imperfect",{}), "-")


def patchA(lemma,table):
    nom = table.setdefault("nominative",{})
    masc = table.pop("masculine",None)
    if masc:
        if type(masc) == str:
            masc = {"singular": masc}
        else:
            masc.pop(None,None)
            masc.setdefault("singular",lemma)
        nom.setdefault("masculine",masc)
    else:
        masc = nom.get("masculine")
        if type(masc) == str:
            nom["masculine"] = {"singular": masc}
        nom.setdefault("masculine",{}).setdefault("singular",lemma)
    fem = table.pop("feminine",None)
    if fem:
        if type(fem) == str:
            fem = {"singular": fem}
        fem.setdefault("singular",fem.pop(None,"-"))
        nom.setdefault("feminine",fem)
    else:
        fem = nom.get("feminine")
        if type(fem) == str:
            nom["feminine"] = {"singular": fem}
    gen = table.get("dative",{}).pop("genitive",None)
    if gen:
        abl = gen.pop("ablative",None)
        if abl:
            table["dative"]   = abl
            table["genitive"] = abl
            table["ablative"] = abl
        else:
            table["dative"]   = gen
            table["genitive"] = gen

    for case in ["nominative", "accusative", "dative", "genitive", "ablative"]:
        t1 = table.setdefault(case, {})
        for gender in ["masculine", "feminine"]:
            t2 = t1.setdefault(gender, {})
            t2.setdefault("singular","-")
            t2.setdefault("plural","-")

def patchAdv(lemma,table):
    table.clear()
    table["s"] = lemma
