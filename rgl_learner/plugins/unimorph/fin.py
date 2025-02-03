iso3 = "Fin"
params = \
    {'IN+ABL': ("Ell", "Case"), # ellative
     'IN+ALL': ("Ill", "Case"), # allative
     'AT+ALL': ("All", "Case"), # allative
     'AT+ESS': ("Add", "Case"), # addesive
     'AT+ABL': ("Abl", "Case"), # ablative
    'IN+ESS': ("In", "Case"), # inessive
     "GEADJ": ("Gen", "Case"),
     "PSS3": ("Poss3", "Possession"),
     "4": ("4", "Person"),
     "5": ("5", "Person"),
     "AG": ("Agent", "Argument_Marking")}

required_forms = {"V": ["noFiniteness;noVerbform;Active;Pres;noAspect;Affirm;Indicative;Nom;P3;Sg"], "N": ["Nom;Sg"], "A": ["Nom;Sg"]}


def merge_tags(pos, forms, w, tags):
    new_forms = []
    new_tags = ["ACT+PASS"]
    for new_tag in new_tags:
        if new_tag in tags:
            tag1, tag2 = new_tag.split("+")
            tags_1 = list(map(lambda x: x.replace(new_tag, tag1), tags))
            tags_2 = list(map(lambda x: x.replace(new_tag, tag2), tags))
            new_forms.append((w, tags_1))
            new_forms.append((w, tags_2))
    if new_forms:
        return new_forms
    return forms