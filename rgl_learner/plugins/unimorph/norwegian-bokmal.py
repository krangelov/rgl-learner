def merge_tags(pos, forms, w, tags):
    new_forms = []
    if "SG+PL" in tags:
        tags_1 = list(map(lambda x: x.replace("SG+PL", "SG"), tags))
        tags_2 = list(map(lambda x: x.replace("SG+PL", "PL"), tags))
        new_forms.append((w, tags_1))
        new_forms.append((w, tags_2))
        return new_forms
    return forms