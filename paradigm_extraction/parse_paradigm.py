import pickle
from collections import defaultdict

from .learn_paradigms import learnparadigms


def check_base(bases, rules, changed):
    new_rules = []
    num, form = list(zip(*bases))
    if len(set(form)) == 1:
        for rule in rules:
            new_rule = rule.replace(f"{num[0]}", f'"{form[0]}"')

            new_rules.append("".join([c for num, c in enumerate(new_rule) if (c != "+" and c !='"') or \
                                      (c == "+" and (new_rule[num-1].isdigit() or new_rule[num+1]=="b")) \
                                     or (c == '"' and (num==(len(new_rule)-1) or num==0 or new_rule[num-2].isdigit())) \
                                      ]))
    elif changed != 0:
        for rule in rules:
            base, new_num = num[0].split("_")
            new_form = base + "_" + str(int(new_num)-changed)
            new_rules.append(rule.replace(f"{num[0]}", new_form))
    else:
        new_rules = rules.copy()
    return new_rules


def correct_paradigms(paradigms):
    mult_base_words = 0
    new_paradigms = list()
    for paradigm in paradigms:
        bases = list(zip(*paradigm.var_insts))
        new_bases = []
        if len(bases) > 1:
            changed = 0
            rules = paradigm.forms
            updated_bases = [bases[0], ]
            for base in bases[1:]:
                new_rules = check_base(base, rules, changed)
                if new_rules != rules:
                    changed += 1
                else:
                    updated_bases.append(base)
                rules = new_rules.copy()
            new_bases.extend(list(zip(*updated_bases)))
            if changed:
                mult_base_words += 1
            paradigm.forms = rules
            paradigm.var_insts = new_bases
        new_paradigms.append(paradigm)
    print(f"Number of forms with more than 1 base: {mult_base_words}")
    return new_paradigms


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
        new_paradigms = correct_paradigms(paradigms)
        tables[cat_name].extend(new_paradigms)

    print("Writing output files..")

    with open(f"data/{lang}/paradigms.pickle", "wb") as f:
        pickle.dump((langcode, tables), f)

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



