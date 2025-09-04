iso3 = "Ukr"

vars = {}

ignore_tags = ['rare', 'colloquial', 'humorous']

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

params_order = dict(zip(params.keys(), range(len(params))))

def preprocess(record):
    categories = record.get("categories",[])

    if 'Ukrainian non-lemma forms' in categories:
        return False
    if 'Ukrainian participles' in categories:
        return False
    for sense in record["senses"]:
        if 'Ukrainian non-lemma forms' in sense.get("categories",[]):
            return False
        if 'Ukrainian participles' in sense.get("categories",[]):
            return False

    record["word"] = record["word"].replace("́","")
    for form in record.get("forms",[]):
        form["form"] = form["form"].replace("́","")

    if record["word"] in ["барабанщик","антропоморфізм","понюшка","порожнина","ротова порожнина","ядерка",
                          "ассирійка","урядовець","носова порожнина","некерований","демографія","західняцький",
                          "дивовижа","брунатний","мажоритарка","лазівка","ассирієць"] and record["pos"] == "adj":
        record["pos"] = "noun"

    if record["word"] in ["катер", "зєть", "донат"] and record["pos"] == "verb":
        record["pos"] = "noun"

    if record.get("pos") == "noun":

        found = False

        def extract_gender(categories):
            nonlocal found
            if 'Ukrainian masculine nouns' in categories:
                found = True
                return ["masculine"]
            elif 'Ukrainian feminine nouns' in categories:
                found = True
                return ["feminine"]
            elif 'Ukrainian female equivalent nouns' in categories:
                found = True
                return ["feminine"]
            elif 'Ukrainian neuter nouns' in categories:
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
    if lemma in ["чайні","чайок"] and pos == "noun":
        return True
    if lemma in ["все-таки","-няти","-сте","-тіяти","-хлинути"] and pos == "verb":
        return True
    if pos == "pron" or pos == "name" or pos == "det" or pos == "adv":
        return True
    return False

def patchPOS(lemma,tag,table):
    if lemma in ["тривожний","кринджовий", "етноґрафічний","ґендерний","косовський","косоварський",
                 "ебонітовий","гарбузовий","гумовий","кавунячий","кавуновий","гомофобний","базальтовий",
                 "педіатричний","каналізаційний","леопардовий","троянський","рубіжний","акацієвий","сиромудрий",
                 "дефлімпійський","олімпійський","кармазиновий","вантажний","фольклорний","дженджуристий"] and tag == "noun":
        return "adjective"

    if lemma in ["анкетувати","харити","скрипіти","базарити","підождати","асфальтувати","виказати"] and tag == "noun":
        return "verb"

    return tag

required_forms = {
    'N': ['s;Nom;Sg'],
    'V': ['infinitive'],
    'A': ["s;Nom;('GSg', Masc)"]
}

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

def patchV(lemma,table):
    table["infinitive"] = lemma
    table.update(table.pop("noGender"))
    table.update(table.pop("active"))
    #table.update(table.pop("indicative"))
    table["participle"] = {
        "masculine": table.pop("masculine")["past"],
        "feminine": table.pop("feminine")["past"],
        "neuter": table.pop("neuter")["past"]
    }
    imperative = table.pop("imperative")
    table["imperative1"] = imperative["first-person"]["plural"]
    table["imperative2"] = imperative["second-person"]

def patchA(lemma,table):
    table.pop("comparative",None)
    table.pop("superlative",None)
    table["s"] = table.pop("positive")
    table["s"].pop("vocative")
    table["s"].pop("possessive")
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
