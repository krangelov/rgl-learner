def merge_tags(pos, forms, w, tags):
    new_forms = []
    if "NOM/ACC" in tags:
        tags_1 = list(map(lambda x: x.replace("NOM/ACC", "NOM"), tags))
        tags_2 = list(map(lambda x: x.replace("NOM/ACC", "ACC"), tags))
        new_forms.append((w, tags_1))
        new_forms.append((w, tags_2))
        return new_forms
    return [(w, tags)]