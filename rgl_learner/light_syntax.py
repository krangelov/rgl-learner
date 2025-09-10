from rgl_learner.utils import *

def write(lang):
    source, langcode, tables = read_data(lang)

    with open(f"data/{lang}/Phrase{langcode}.gf", "w") as f:
        f.write(f"concrete Phrase{langcode} of Phrase = Cat{langcode} ** {{\n")
        f.write("lin\n");
        f.write("  PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;\n")
        f.write("\n")
        f.write("  UttS s = s ;\n")
        f.write("  UttInterj i = i ;\n")
        f.write("\n")
        f.write("  NoPConj = {s = []} ;\n")
        f.write("\n")
        f.write("  NoVoc = {s = []} ;\n")
        f.write("}\n")

    with open(f"data/{lang}/Noun{langcode}.gf", "w") as f:
        f.write(f"concrete Noun{langcode} of Noun = Cat{langcode} ** {{\n")
        f.write("lin\n");
        f.write("  UseN n = n ;\n")
        f.write("}\n")

    with open(f"data/{lang}/Adjective{langcode}.gf", "w") as f:
        f.write(f"concrete Adjective{langcode} of Adjective = Cat{langcode} ** {{\n")
        f.write("lin\n");
        f.write("  PositA a = a ;\n")
        f.write("}\n")

    with open(f"data/{lang}/Grammar{langcode}.gf", "w") as f:
        f.write(f"concrete Grammar{langcode} of Grammar =\n")
        f.write(f"  TenseX,\n")
        f.write(f"  Phrase{langcode},\n")
        f.write(f"  Noun{langcode},\n")
        f.write(f"  Adjective{langcode} ** {{\n")
        f.write("}")
