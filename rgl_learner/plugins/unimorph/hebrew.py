params = {"PLDEF": ("PlDef", "Species"),
        "SGDEF": ("SgDef", "Species")}



def fix_tags(tags):
    if "N" in tags:
        tags.remove("N")
    return tags


