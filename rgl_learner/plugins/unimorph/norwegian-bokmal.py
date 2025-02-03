def merge_tags(pos, forms, w, tags):
    if "SG+PL" in tags:
        new_forms = []
        tags_1 = list(map(lambda x: x.replace("SG+PL", "SG"), tags))
        tags_2 = list(map(lambda x: x.replace("SG+PL", "PL"), tags))
        #new_forms.remove((w, tags))
        new_forms.append((w, tags_1))
        new_forms.append((w, tags_2))
        return new_forms
    return [(w, tags)]