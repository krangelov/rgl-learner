def merge_tags(pos, forms, w, tags):
    new_forms = []
    new_tags = ["GEN/DAT", "NOM/ACC", "DAT/GEN"]
    for new_tag in new_tags:
        if new_tag in tags:
            tag1, tag2 = new_tag.split("/")
            tags_1 = list(map(lambda x: x.replace(new_tag, tag1), tags))
            tags_2 = list(map(lambda x: x.replace(new_tag, tag2), tags))
            new_forms.extend(merge_tags(pos, forms, w, tags_1))
            new_forms.extend(merge_tags(pos, forms, w, tags_2))
            return new_forms
    return [(w, tags)]
