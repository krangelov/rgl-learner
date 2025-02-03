def merge_tags(pos, forms, w, tags):
    new_forms = []
    if "MASC/FEM" in tags:
        tags_1 = list(map(lambda x: x.replace("MASC/FEM", "MASC"), tags))
        tags_2 = list(map(lambda x: x.replace("MASC/FEM", "FEM"), tags))
        new_forms.append((w, tags_1))
        new_forms.append((w, tags_2))
        return new_forms
    return [(w, tags)]