iso3 = "Bel"

params = {
  'infinitive': None,
  'nominative': ('Nom','Case'),
  'accusative': ('Acc','Case'),
  'dative': ('Dat','Case'),
  'genitive': ('Gen','Case'),
  'instrumental': ('Instr','Case'),
  'locative': ('Loc','Case'),
  'vocative': ('Voc','Case'),
  'masculine': ('Masc', 'Gender'),
  'feminine': ('Fem', 'Gender'),
  'neuter': ('Neuter', 'Gender'),
  'singular': ('Sg', 'Number'),
  'plural': ('Pl', 'Number'),
  'first-person': ('P1','Person'),
  'second-person': ('P2','Person'),
  'third-person': ('P3','Person'),
  'gender-singular': ('GSg',['Gender'],'GenNum'),
  'gender-plural': ('GPl','GenNum'),
  'perfective': ('Perf', 'Aspect'),
  'imperfective': ('Imperf', 'Aspect')
}

def preprocess(record):
    categories = record.get("categories",[])

    if 'Belarusian non-lemma forms' in categories:
        return False
    if 'Belarusian participles' in categories:
        return False
    for sense in record["senses"]:
        if 'Belarusian non-lemma forms' in sense.get("categories",[]):
            return False
        if 'Belarusian participles' in sense.get("categories",[]):
            return False

    record["word"] = record["word"].replace("́","")
    for form in record.get("forms",[]):
        form["form"] = form["form"].replace("́","")

    if record.get("pos") == "noun":

        found = False

        def extract_gender(categories):
            nonlocal found
            if 'Belarusian masculine nouns' in categories:
                found = True
                return ["masculine"]
            elif 'Belarusian feminine nouns' in categories:
                found = True
                return ["feminine"]
            elif 'Belarusian female equivalent nouns' in categories:
                found = True
                return ["feminine"]
            elif 'Belarusian neuter nouns' in categories:
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
    if pos == "pron" or pos == "name" or pos == "det" or pos == "adv":
        return True
    return False

def patchPOS(lemma,tag,table):
    if lemma in ["цокальны"] and tag == "noun":
        return "adj"
    return tag

def patchN(lemma,table):
    noCase = table.pop("noCase",{})
    sg = noCase.get("singular")
    if sg != "-":
        table["nominative"]["singular"] = sg
    pl = noCase.get("plural")
    if pl != "-":
        table["nominative"]["plural"] = pl
    table["s"] = {}
    for case in ["nominative","accusative","dative","genitive","instrumental","locative"]:
        table["s"][case] = table.pop(case)

def patchA(lemma,table):
    table.pop("comparative",None)
    table.pop("superlative",None)
    table["s"] = table.pop("positive")
    for case in ["nominative","accusative","dative","genitive","instrumental","locative"]:
        tbl = table["s"][case]
        masc = tbl.pop("masculine","-")
        fem  = tbl.pop("feminine","-")
        neut = tbl.pop("neuter","-")
        tbl["gender-singular"] = {"masculine": masc, "feminine": fem, "neuter": neut}
        noGender = table["s"][case].pop("noGender",{})
        tbl["gender-plural"] = noGender.pop("plural","-")
    table["s"].pop("noCase")
    table["s"]["nominative"]["gender-singular"]["masculine"] = lemma

def patchV(lemma,table):
    table["infinitive"] = lemma
    ind = table.pop("indicative")
    table["participle"] = {
        "masculine": ind.pop("masculine")["past"],
        "feminine": ind.pop("feminine")["past"],
        "neuter": ind.pop("neuter")["past"]
    }
    ind = ind.pop("noGender")
    table["active"] = ind.pop("active")
    table["active"]["imperfective"].pop("future")
    table["active"]["perfective"].pop("future")
    table["passive"] = ind.pop("passive")
    table["imperative"] = table["imperative"]["second-person"]
