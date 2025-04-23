iso3 = "Gre"

order = {
  "N": ["Gender", "Number", "Case", "Person"],
  "PN": ["Gender", "Number", "Case", "Person"],
  "A": ["Degree", "Gender", "Number", "Case"],
  "V": ["NonFinite","Participle", "Mood", "Tense", "Number", "Person", "Voice", "Aspect"]
}

ignore_tags = ["common","literally","formal","colloquial","alternative","usually","informal","regional","abbreviation","transcription","active","rare","Medieval","mainly","uncountable",
               "Cretan","literary","dated","also","class","dual","dative"]

def preprocess(record):
    deponent = False
    categories = record.get("categories",[])
    if 'Greek non-lemma forms' in categories:
        return False
    if 'Greek passive verbs' in categories:
        return False
    if 'Greek deponent verbs' in categories:
        deponent = True

    found = False

    def extract_gender(categories):
        nonlocal found
        if 'Greek masculine nouns' in categories:
            found = True
            return ["masculine"]
        elif 'Greek feminine nouns' in categories:
            found = True
            return ["feminine"]
        elif 'Greek neuter nouns' in categories:
            found = True
            return ["neuter"]
        return []

    pos = record.get("pos")
    if pos in ["noun","name"]:
        record["tags"] = extract_gender(categories)

    for sense in record["senses"]:
        categories = sense.get("categories",[])
        if 'Greek non-lemma forms' in categories:
            return False
        if 'Greek passive verbs' in categories:
            return False
        if 'Greek deponent verbs' in categories:
            deponent = True
        if pos in ["noun","name"]:
            sense["tags"] = extract_gender(categories)

    if pos in ["noun","name"] and not found:
        record["tags"] = ["masculine"]

    for k,form in enumerate(record.get("forms",[])):
        w    = form.get("form","-")
        tags = form.get("tags",[])
        if pos == "verb":
            if (index := w.find(" - ")) > 0:
                w = w[:index]
            if w.startswith("{"):
                w = w[1:]
            if w.endswith("}"):
                w = w[:-1]
            if w.endswith("} ➤"):
                w = w[:-3]
            if w.endswith("¹"):
                w = w[:-1]
            record["forms"][k]["form"] = w
                
        for i in range(len(tags)):
            if tags[i] == "imperfect":
                tags[i] = "past"
            if deponent and tags[i] == "passive":
                tags[i] = "active"

    return True

def patchPOS(lemma,tag):
    if tag == "noun" and lemma in ["αμμωνιακός","οδοντοφατνιακός"]:
        return "adj"
    if tag == "noun" and lemma in ["ηρωοποιώ"]:
        return "verb"
    return tag

def filter_lemma(lemma, pos):
    if pos == 'noun' and lemma in ["απαυτός","αυνανιστικός","μελοδραματικός","μεγαλειώδης","βομβαρδίζομαι"]:
        return True
    if pos == "det":
        return True
    if pos == "pron":
        return True
    if lemma == "στριμμένος":
        return True
    if " " in lemma:
        return True
    return False

def filter_form(form,tags):
    if form.startswith("el-conjug-"):
        return True
    if form.startswith("‑") or form.startswith("-"):
        return True
    if form.lower().startswith("relative superlative"):
        return True
    if form.lower().startswith("πιο + "):
        return True
    if form == "deponent":
        return True
    if form == "deponent irregular":
        return True
    if form == "no-table-tags":
        return True
    if form == "in 3rd persons singular":
        return True
    if form == "in 3rd person singular":
        return True
    if form == "in 3rd persons":
        return True
    if form == "in the present tense":
        return True
    if form == "σκέφθηκα as from σκέπτομαι":
        return True
    if form == "σπάζω →":
        return True
    if form == "Also":
        return True
    if form.startswith("colloquial past tense"):
        return True
    if '[' in form or '(' in form:
        return True
    if tags==['past']:
        return True
    if "romanization" in tags:
        return True
    return False

def patchN(lemma,table):
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("neuter",None)
    t = table.pop("noGender",{})
    t2 = t["singular"].pop("noCase",None)
    t2 = t["plural"].pop("noCase",None)
    table.update(t)
    if table["singular"]["nominative"] == "-":
        table["singular"]["nominative"] = lemma
    if table["plural"]["nominative"] == "-":
        table["plural"]["nominative"] = t2.get('first-person','-')
    return {"s": table}

def patchPN(lemma,table):
    table.pop("masculine",None)
    table.pop("feminine",None)
    table.pop("neuter",None)
    t = table.pop("noGender",{})
    t["singular"].pop("noCase",None)
    t["plural"].pop("noCase",None)
    table.update(t)
    return {"s": table}

def patchA(lemma,table):
    p = table["positive"]

    c = {"masculine": {"singular": {"nominative": table.get("comparative","-")}}}
    table["comparative"] = c
    table.pop("comparative")
    table.pop("superlative")

    for gender in ["masculine","feminine","neuter"]:
        for number in ["singular","plural"]:
            p[gender][number].pop("noCase",None)
            for case in ["nominative","accusative","genitive","vocative"]:
                c.setdefault(gender,{}).setdefault(number,{}).setdefault(case,"-")
    p.pop("noGender",None)

def patchAdv(lemma,table):
    p = table.pop("positive")
    if p == "-":
        table["s"] = lemma
    else:
        table["s"] = p
    table.pop("comparative",None)
    table.pop("superlative",None)

def patchV(lemma,table):
    table.update(table.pop("noNonFinite"))
    table.update(table.pop("noParticiple"))
    t = table.pop("imperative")
    t2= {}
    for number in ["singular","plural"]:
        for voice in ["active","passive"]:
            for aspect in ["perfective","imperfective"]:
                t2.setdefault(aspect,{}).setdefault(number,{}).setdefault(voice,t[number]["second-person"][voice][aspect])
    table["vimperative"] = t2
    table["indicative"].pop("future")

    t = table["indicative"]["past"]
    for number in ["singular","plural"]:
        for person in ["first-person", "second-person", "third-person"]:
            for voice in ["active", "passive"]:
                t[number][person][voice].setdefault("imperfective", "-")

    t = table.pop("indicative")
    if t["present"]["singular"]["first-person"]["active"]["imperfective"] == "-":
        t["present"]["singular"]["first-person"]["active"]["imperfective"] = lemma
    table["vpres"]=t["present"]
    table["vpast"]=t["past"]
    table["vnonfinite"]=table.pop("infinitive-aorist")

    table.pop("subjunctive")

    p = table.pop("participle")
    table["vgerund"] = p.get("present").get("active")
    table["vparticiple"] = p.get("past").get("passive")
