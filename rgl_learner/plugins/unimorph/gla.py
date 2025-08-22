iso3 = "Gla"

order = {"V": ["Verbform", "Voice", "Mood",  "Tense"], "A": ["Number", "Gender", "Case"]}

required_forms = {"V": ["lemma"], "A": ["Sg;Masc;Nom"]}

def patchV(lemma, table):
    table["lemma"] = lemma
    table.update(table.pop("noVerbform"))
    table["ACT"].update(table["ACT"].pop("noMood"))
    table["PASS"].update(table["PASS"].pop("noMood"))
    table["PTCP"] = table["PTCP"].pop("PRS")
    return table