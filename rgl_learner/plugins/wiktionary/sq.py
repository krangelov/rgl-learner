iso3 = "Alb"

param_order = [
  'Species',
  'Case',
  'indicative',
  'subjunctive',
  'conditional',
  'optative',
  'admirative',
  'imperative'
  'present',
  'past',
  'aorist-ii',
  'future-i',
  'future-ii',
  'perfect',
  'pluperfect',
  'imperfect',
  'jussive',
  "progressive",
  'imperative',
  'Tense',
  'Number',
  'Person'
]

def patchPOS(lemma,tag,table):
    if tag == 'noun' and table.get("participle"):
        return "verb"
    if tag == 'noun' and (lemma == 'fatkeq' or lemma == 'shëndetshëm'):
        return 'adj'
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
    def set_perfekt(mood,tense):
        nonlocal table
        d = table.get(mood,{})
        perfekt = d.pop(tense,{}).pop("perfect",{})
        if perfekt:
            d[tense+"-perfect"] = perfekt
    set_perfekt("admirative","past")
    set_perfekt("conditional","past")
    set_perfekt("indicative","past")
    set_perfekt("indicative","future")
    set_perfekt("subjunctive","past")
    table.get("conditional",{}).pop("present",{})
    table.get("conditional",{}).pop("perfect",{})
    imp = table.get("imperative",{}).pop("present",{})
    if imp:
        singular = imp.get("singular",{}).get("second-person","-")
        if type(singular) is dict:
            singular = singular.pop(None)
        plural = imp.get("plural",{}).get("second-person","-")
        if type(plural) is dict:
            plural = plural.pop(None)
        table["imperative"] = {"singular": singular, "plural": plural}

    indicative = table.setdefault("indicative",{})

    aorist_ii = indicative.pop("aorist-ii",{})
    aorist = aorist_ii.get("aorist")
    if aorist_ii and aorist:
        indicative["aorist-ii"] = aorist
    elif aorist_ii:
        indicative["aorist-ii"] = aorist_ii

    aorist = indicative.setdefault("aorist",table.pop("past",{}))

    indicative.pop("future-ii",{})
    indicative.pop("progressive",{})

    optative = table.get("conditional",{}).pop("optative",{})
    if optative:
        table["optative"] = optative

    table.pop("jussive",{})
    table.pop("privative",{})
    table.pop("perfect",{})
    table.pop("present",{})

    table.setdefault("infinitive","-")
    table.setdefault("gerund","-")
