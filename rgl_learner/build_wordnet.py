import pickle

cat2cat = {
    "N2": "N", "N3": "N", 
    "A2": "A",
    "V2": "V", "V3": "V", "VV": "V", "VA": "V", "VS": "V", "VQ": "V", 
    "V2V": "V", "V2A": "V", "V2S": "V", "V2Q": "V"
}

def build(lang):
    print("Reading data ...")
    morpho = {}
    with open(f"data/{lang}/paradigms.pickle", "rb") as f:
        source, langcode, tables = pickle.load(f)
        for cat, table in tables.items():
            for real_tag, paradigm in enumerate(table):
                for j,(ident,table) in enumerate(paradigm.tables):
                    morpho[ident] = real_tag+1
    with open(f"data/{lang}/rules.pickle", "rb") as f:
        how, all_rules = pickle.load(f)

    with open('../gf-wordnet/data/predictions.tsv','r') as f:
        predictions = {}
        parse = "Parse"+langcode
        for line in f:
            fields = line.split("\t")
            if fields[1] == parse:
                predictions[fields[0]] = (fields[2],eval(fields[3]))

    print(f"Generate ../gf-wordnet/WordNet{langcode}.gf")
    with open("../gf-wordnet/WordNet.gf", "r") as f, open(f"../gf-wordnet/WordNet{langcode}.gf", "w") as out:
        out.write(f"concrete WordNet{langcode} of WordNet = Cat{langcode} ** open Paradigms{langcode} in {{\n\n")
        for line in f:
            fields = line.split()
            if len(fields) > 3 and fields[0] == "fun":
                ident = fields[1]
                cat   = ident[ident.rfind("_")+1:]
                if cat == "DConj":
                    cat = "Conj"
                cat2  = cat2cat.get(cat,cat)
                info = predictions.get(ident)

                if info:
                    lemma,(o,s,w,l,c,d) = info
                    rules = all_rules.get(cat2)

                    if cat2 == "N":
                        lemma = lemma.lower()
                    tag = morpho.get(lemma+"_"+cat2)
                    if tag:
                        df = f'mk{cat2}{tag:03d} "{lemma}"'
                    else:
                        df = f'mk{cat2} "{lemma}"'
                        if rules:
                            for rule, (pred_tag, entropy, dist) in rules.items():
                                if len(rule) == 1 and lemma.endswith(rule[0][1]) and (cat2, pred_tag+1) not in [("V",41),("V",28),("V",49)]:
                                    break
                            else:
                                df = None
                    if df:
                        if s == 1 and l > 1:
                            status = ""
                        elif w == 0 and l > 1:
                            status = ""
                        elif w == 0 and s == 1:
                            status = ""
                        elif s == 1:
                            status = " --unchecked"
                        else:
                            status = " --guessed"

                        if cat != cat2:
                            df = f'mk{cat} ({df})'
                        out.write(f'lin {ident} = {df} ;{status}\n')
                    else:
                        out.write(f'lin {ident} = variants {{}} ;\n')
                else:
                    out.write(f'lin {ident} = variants {{}} ;\n')
        out.write("\n}")
