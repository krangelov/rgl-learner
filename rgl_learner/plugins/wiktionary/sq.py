iso3 = "Sqi"


ignore_tags = ['adjective', 'canonical', 'diminutive', 'romanization', 'table-tags', 'inflection-template',
               'multiword-construction', "error-unknown-tag", "analytic", "emphatic", "archaic", "dialectal",
               "active"]

def preprocess(record):
    if record.get("pos") == "noun":
        found = False

        def check_gender(tags):
            nonlocal found
            try:
                tags.remove("neuter")
            except:
                pass
            for g in ["masculine","feminine"]:
                if g in tags:
                    found = True
                    break

        check_gender(record.get("tags",[]))
        for sense in record["senses"]:
            check_gender(sense.get("tags",[]))

        if not found:
            record.setdefault("tags",[]).append("masculine")

    record["word"] = record["word"].replace("ó","o").replace("í","i").replace("ú","u").replace("á","a")
    for form in record.get("forms",[]):
        if form["form"] == "arnautë／arnautllárë":
            form["form"] = "arnautë"
        elif record["word"] == "teze":
            if form["form"] == "{{{1}}}e":
                form["form"] = "tezje"
            if form["form"] == "{{{1}}}a":
                form["form"] = "tezja"
        else:
            form["form"] = form["form"].replace("ó","o").replace("í","i").replace("ú","u").replace("á","a")

    return True

def filter_lemma(lemma,tag,table):
    def is_multi(table):
        if type(table) == dict:
            for value in table.values():
                if is_multi(value):
                    return True
        elif type(table) == str and len(table.split()) > 1:
            return True
        return False
    if len(lemma.split()) > 1 or is_multi(table):
        return True
    if tag == "name" or tag == "pron" or tag == "det":
        return True
    if tag == "adj" and lemma == "yt":
        return True
    if tag == "adj" and lemma == "gjuetar":
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
    if tag == 'prep' and lemma == "pi":
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

    indef = table.pop("indefinite",{})
    if type(indef) is dict:
        nom = indef.setdefault("nominative",{})
        if type(nom) is str:
            indef["nominative"] = {"singular": nom, "plural": table.pop("plural","-")}
        if nom:
            nom.setdefault("singular", indef.pop("singular","-"))
            nom.setdefault("plural", indef.pop("plural",table.pop("plural","-")))
        else:
            nom["singular"] = indef.pop("singular",lemma)
            nom["plural"]   = indef.pop("plural",table.pop("plural","-"))
        acc = indef.setdefault("accusative",{})
        acc.setdefault("singular", nom["singular"])
        acc.setdefault("plural", nom["plural"])
    elif type(indef) is str:
        pl = table.pop("plural","-")
        indef = {"nominative": {"singular": indef, "plural": pl},
                 "accusative": {"singular": indef, "plural": pl}}
    set_case(indef,"dative")
    set_case(indef,"ablative")

    indef.pop(None,None)
    def_ = table.pop("definite",{})
    if type(def_) is dict:
        nom = def_.setdefault("nominative",{})
        if type(nom) is str:
            def_["nominative"] = {"singular": nom, "plural": "-"}
        if nom:
            nom.setdefault("singular", def_.pop("singular",def_.pop(None,"-")))
            nom.setdefault("plural", def_.pop("plural","-"))
            acc = nom.pop("accusative",None)
            if acc:
                def_.setdefault("accusative", {}).setdefault("singular", acc)
        else:
            nom["singular"] = def_.pop("singular",def_.pop(None,"-"))
            nom["plural"]   = def_.pop("plural","-")
    elif type(def_) is str:
        def_ = {"nominative": {"singular": def_, "plural": "-"}}
    set_case(def_,"accusative")
    set_case(def_,"dative")
    set_case(def_,"ablative")

    table["s"] = {"indefinite": indef, "definite": def_}
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("neuter",None)
    table.pop("alternative",None)
    table.pop("Cyrillic",None)
    table.pop("Gheg",None)
    table.pop("Northern",None)
    table.pop("Southern",None)
    table.pop("especially",None)
    table.pop("Arvanitika",None)
    table.pop("rare",None)

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
    set_all(ind.setdefault("aorist",{}), table.pop("aorist","-"))
    set_all(ind.setdefault("imperfect",{}), "-")
    ind.get("aorist",{}).pop("aorist-ii",None)
    ind.pop("singular",None)
    ind.pop("plural",None)

    table.pop("subjunctive",None)
    table.pop("conditional",None)
    table.pop("jussive",None)
    table.pop("privative",None)
    table.pop("present",None)
    table.pop("perfect",None)
    table.pop("active",None)
    table.pop("third-person",None)
    table.pop("passive",None)

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
    table.pop("infinitive","-")

    table.setdefault("participle","-")

    opt = table.pop("optative",{})
    table["pres_optative"] = set_all(opt.get("present",{}), "-")
    table["perf_optative"] = set_all(opt.get("perfect",{}), "-")

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
            table["ablative"] = abl
        else:
            table["dative"]   = gen

    pl = table.pop("plural",None)
    if pl:
        nom.setdefault("masculine",{}).setdefault("plural",pl)

    for case in ["nominative", "accusative", "dative", "ablative"]:
        t1 = table.setdefault(case, {})
        for gender in ["masculine", "feminine"]:
            t2 = t1.setdefault(gender, {})
            t2.setdefault("singular","-")
            t2.setdefault("plural","-")

    table.pop("often",None)

def patchAdv(lemma,table):
    table.clear()
    table["s"] = lemma
