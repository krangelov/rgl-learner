def fix_tags(tags):
    if "1P" in tags:
        tags.remove("1P")
        tags.append("1")
        tags.append("PL")
    elif "2P" in tags:
        tags.remove("2P")
        tags.append("2")
        tags.append("PL")
    elif "3P" in tags:
        tags.remove("3P")
        tags.append("3")
        tags.append("PL")

    elif "1S" in tags:
        tags.remove("1S")
        tags.append("1")
        tags.append("SG")

    elif "2S" in tags:
        tags.remove("2S")
        tags.append("2")
        tags.append("SG")

    elif "3S" in tags:
        tags.remove("3S")
        tags.append("3")
        tags.append("SG")
    return tags
