import sys

from .learn_paradigms import learnparadigms
from .parse_gf import parse_gf_files

def find_n_morphemes(form):
    _, base = form.split("=>")
    morphemes = [s for s in base.split("+") if "base" in s]
    return morphemes


def write_paradigm(i, table, pos_tag):
    morphemes = find_n_morphemes(table.split("\n")[0])
    code = f"""mk{pos_tag}{i} : {len(morphemes) * "Str -> "}{pos_tag} ;\nmk{pos_tag}{i} {" ".join(morphemes)} = {{s = table {{\n"""
    code += table
    code += f"{19 * " "} }} ;\n\n }} ;"
    return code


def write_lexicon(i, words, pos_tag):
    code = ""
    for wordform in words.split("#"):
        code += f"""lin '{wordform}_{pos_tag}' = mk{pos_tag}{i} "{wordform}" ;\n"""
    return code


def parse(lang):
    langcode = lang.title()
    print("Parsing input files..")
    paradigms = parse_gf_files(".", langcode)

    print("Learning paradigms..")
    tables = {}
    for pos, table in paradigms.items():
        tables[pos] = list(map(str, learnparadigms(table)))

    print("Writing output files..")
    grammar_code = ""
    lexicon_code = ""
    for pos_tag, table in tables.items():
        for i, par in enumerate(table):
            formtable, words = par.split("\t")
            lexicon_code += write_lexicon(i, words, pos_tag)
            grammar_code += "\n\n" + write_paradigm(i, formtable, pos_tag)

    with open(f"Dict{langcode}_tmp.gf", "w") as f:
        f.write(
            f"""concrete Dict{langcode} of Dict{langcode}Abs = Cat{langcode} ** open Res{langcode}, Prelude in {{\n""")
        f.write(lexicon_code)
        f.write("}")

    with open(f"Paradigms{langcode}_tmp.gf", "w") as f:
        f.write(f"""concrete Paradigms{langcode} = {{\n""")
        f.write(grammar_code)
        f.write("}")
