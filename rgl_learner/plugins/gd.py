iso3 = "Gla"

vars = {}

params = {#"positive": ("Pos", "Polarity"),
          "independent": ("Ind", "Verbform"),
          "dependent": ("Dep", "Verbform"),
          #"affirmative": ("Affirm", "Polarity"),
          "negative": ("Neg", "Polarity"),
          "interrogative": ("Int", "Verbform"),
          "impersonal": ("Imp", "Person"),
          "int-affirm": ("Int-Affirm", "Verbform"),
          "int-neg": ("Int-Neg", "Verbform"),
          "active": ("Active", "Voice"),
          "impersonal": ("Impersonal", "Person")
          }

default_params = {"Number": "singular", "Species": "indefinite", 
                  "Case": "nominative",
                  "Voice": "active",
                  "Mood": "indicative", 
                  "Person": "impersonal",
                  "Degree": "positive"}

required_forms = {"N": ["s;Nom;Indef;Sg"], "V": ["lemma"], "Prep": ["s;Sg;P1"], "A": ["Posit;Nom;Sg;masciline"]}

order = {"N": ["Gender", "Case", "Species",   "Number"], 
         "Prep": ["Gender", "Number", "Person"], 
         "V": ["Participle", "Voice", "Mood", "Tense", "Polarity", "Verbform", "Person", "Degree", "Number"], 
         "A": ["Degree","Case", "Number", "Gender"]}

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

        for form in record.get("forms",[]):
            word = form["form"]
            if word.startswith("a' ") or word.startswith("an ") or word.startswith("na "):
                form["form"] = word[3:]
            if word.startswith("(a') ") or word.startswith("(an) ") or word.startswith("(na) "):
                form["form"] = word[5:]

    return True



def filter_form(w,tags):
    if w == "--":
        return True
    if w == "no-table-tags":
        return True
    if w.startswith("gd-"):
        return True
    return False

def filter_lemma(lemma, pos, table):
    if pos == "noun" and lemma == "Leòmhann":
        return True
    if pos == "adv" or pos == "name" or pos == "pron":
        return True
    return False

def patchPOS(lemma,tag,table):
    if lemma == "mearanach" and tag == "noun":
        return "adjective"
    o = any(["genitive" in form[1] for form in table])
    if tag == "verb" and o:
        return "noun"
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




#def preprocess(record):
#    for form in record.get("forms",[]):
#        form["form"] = form["form"].split("¹")[0]
#    return True


def patchV(lemma, table):
    #table["positive"].update(table["positive"].pop("noParticiple"))
    table.update(table.pop("noParticiple"))


    table["conditional"] = table["conditional"]["noPolarity"].pop("independent")

    table["conditional"].pop("impersonal") # wikiextract mistake
    if "[" in table["imperative"]["impersonal"]:
        table["imperative"]["impersonal"] = table["imperative"]["impersonal"].split("[")[0]

    for i in table["indicative"]:
        table["indicative"][i] =  table["indicative"][i]["noPolarity"].pop("independent")
    
    if "[" in table["indicative"]["future"]["impersonal"]:
        table["indicative"]["future"]["impersonal"] = table["indicative"]["future"]["impersonal"].split("[")[0]

    table["indicative"].pop("noTense")
   # table["passive"] = {"conditional": table["passive"].pop("conditional"),
  #                      "future": table["passive"]["indicative"].pop("future", "-"),
  ##                      "present": table["passive"]["indicative"].pop("present", "-"),
  #                      "past": table["passive"]["indicative"].pop("past", "-")}
    table["participle"] = table["participle"].pop("past")
    table["lemma"] = lemma
    return table

def patchPrep(lemma, table):
    table = table.pop("noGender")
    table["singular"].pop("impersonal")
    table["plural"].pop("impersonal")
    return table

def patchA(lemma, table):
    if table["positive"]["nominative"]["singular"]["masculine"] == "-":
        table["positive"]["nominative"]["singular"]["masciline"] = table["positive"]["nominative"]["singular"]["noGender"]

    if table["positive"]["genitive"]["singular"]["masculine"] == "-":
        table["positive"]["genitive"]["singular"]["masculine"] = table["positive"]["genitive"]["singular"]["noGender"]

    table["positive"]["genitive"]["singular"].pop("noGender")
    table["positive"]["nominative"]["singular"].pop("noGender")
    return table
