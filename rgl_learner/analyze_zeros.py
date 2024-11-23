import pickle

lang = "tl"
def reverse_dict(d, keys=[]):
    result = []
    for k, v in d.items():
        if isinstance(v, dict):
            result.extend(reverse_dict(v, keys + [str(k)]))
        else:
            result.append((";".join((keys + [str(k)]))))
    return result

with open(f"../data/{lang}/lexicon.pickle", "rb") as f:
    source, langcode, lexicon = pickle.load(f)

analysis = ""
for pos_tag, (cat_name, table) in lexicon.items():
    analysis += cat_name + "\n"
    for typ, lexemes in table.items():
        grams = reverse_dict(typ.linearize())
        forms = list(zip(*list(zip(*lexemes))[1]))
        for gram, form in zip(grams, forms):
            analysis += gram + "\t" + str(form.count("-")/len(form)) + "\n"

with open(f"../data/{lang}/analysis.txt", "w") as f:
        f.write(analysis)
