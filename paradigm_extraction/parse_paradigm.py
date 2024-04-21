import pickle
from collections import defaultdict

from .learn_paradigms import learnparadigms


def write_paradigm(i, par, cat):
    names = [name for name, val in par.var_insts[0]]
    code = f"""mk{cat}{i:03d} : {len(names) * "Str -> "}{cat} ;\nmk{cat}{i:03d} {" ".join(names)} =\n  """
    code += f"lin {cat} " + par.typ.renderOper(2,par.forms)
    code += ' ;'
    return code


def write_lexicon(i, par, cat):
    code = ""
    for j,lemma in enumerate(par.lemmas):
        code += f"""lin '{lemma}' = mk{cat}{i:03d} {" ".join(('"'+val+'"' for name, val in par.var_insts[j]))} ;\n"""
    return code


def parse(lang):
    with open(f"data/{lang}/lexicon.pickle", "rb") as f:
        langcode, lexicon = pickle.load(f)

    print("Learning paradigms..")
    tables = defaultdict(list)
    for pos_tag, (cat_name, table) in lexicon.items():
        if len(table) > 1:
            print("Warning: the inflection tables are not unified yet, using the first one")
        typ,lexemes = next(iter(table.items()))
        paradigms = learnparadigms(typ,lexemes)
        tables[cat_name].extend(paradigms)

    print("Writing output files..")
    grammar_code = ""
    lexicon_code = ""
    freq_table = []
    for cat, table in tables.items():
        for i, par in enumerate(table):
            lexicon_code += write_lexicon(i+1, par, cat)
            grammar_code += "\n\n" + write_paradigm(i+1, par, cat)
            freq_table.append(f"{pos_tag}{i}\t{len(par.lemmas)}")

    with open(f"Dict{langcode}.gf", "w") as f:
        f.write(
            f"""concrete Dict{langcode} of Dict{langcode}Abs = Cat{langcode} ** open Paradigms{langcode}, Prelude in {{\n""")
        f.write(lexicon_code)
        f.write("}")

    with open(f"Paradigms{langcode}.gf", "w") as f:
        f.write(f"""resource Paradigms{langcode} = open Cat{langcode}, Res{langcode}, Predef in {{\n""")
        f.write("oper")
        f.write(grammar_code)
        f.write("}")

    with open(f"freq_table_{langcode}.txt", "w") as f:
        f.write("\n".join(freq_table))

