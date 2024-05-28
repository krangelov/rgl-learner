import pickle
from collections import defaultdict

from .learn_paradigms import learnparadigms

def correct_paradigms(cat,paradigms):
    mult_base_words = 0
    for paradigm in paradigms:
        # calculate the possible lengths of all bases
        lens = {}
        for xs in zip(*paradigm.var_insts):
            for base, form in xs:
                lens.setdefault(base,set()).add(len(form))

        # parse the lemma into bases
        ass   = []
        elems = paradigm.forms[0].split('+')

        i = 0
        start = 0
        first = None
        while i < len(elems)-1:
            elem = elems[i]
            l = lens.get(elem)
            if elem[0] == '"' and elem[-1] == '"':   # this is a string
                start += len(elem)-2
            elif l and len(l) == 1:  # this is a base of a fixed length
                l = next(iter(l))
                if start > 0:
                    expr = f"take {l} (drop {start} base)"
                else:
                    expr = f"take {l} base"
                if not first:
                    first = (i,start)
                start += l
                ass.append(f"{elem} = {expr}")
            else:
                break              # nonExist or a variable length base
            i += 1

        if first and i == len(elems)-1:
            # This means that all bases are constant length. We treat
            # the first base as variable and the rest as constant.
            i,start = first
            ass.clear()

        j = len(elems)-1
        end = 0
        while j > i:
            elem = elems[j]
            l = lens.get(elem)
            if elem[0] == '"' and elem[-1] == '"':   # this is a string
                end += len(elem)-2
            elif l and len(l) == 1:  # this is a base of a fixed length
                l = next(iter(l))
                if end > 0:
                    expr = f"dp {l} (tk {end} base)"
                else:
                    expr = f"dp {l} base"
                end += l
                ass.append(f"{elem} = {expr}")
            else:
                break              # nonExist or a variable length base
            j -= 1

        if i == j:
            elem = elems[i]
            if lens.get(elem):
                expr = "base"
                if end > 0:
                    expr = f"tk {end} {expr}"
                if start > 0:
                    expr = f"drop {start} ({expr})"
                ass.insert(i,f"{elem} = {expr}")

            if len(ass) == len(lens):
                paradigm.var_insts = [[("base",table[0])] for ident,table in paradigm.tables]
                paradigm.assignments = ass
        else:
            mult_base_words += 1

    if mult_base_words > 0:
        print(f"Number of {cat} paradigms with more than 1 base: {mult_base_words}")

def write_paradigm(i, par, cat):
    names = [name for name, val in par.var_insts[0]]
    code = f"""mk{cat}{i:03d} : {len(names) * "Str -> "}{cat} ;\nmk{cat}{i:03d} {" ".join(names)} =\n  """
    if par.assignments:
        code += "let "+" ;\n      ".join(par.assignments)+f"\n  in lin {cat}\n  "
    else:
        code += f"lin {cat}\n  "
    code += par.typ.renderOper(2,par.forms) + " ;"
    return code

def write_lexicon(i, par, cat):
    code = ""
    for j,(ident,table) in enumerate(par.tables):
        code += f"""lin '{ident}' = mk{cat}{i:03d} {" ".join(('"'+val+'"' for name, val in par.var_insts[j]))} ;\n"""
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
        correct_paradigms(cat_name, paradigms)
        tables[cat_name].extend(paradigms)

    print("Writing output files..")

    with open(f"data/{lang}/paradigms.pickle", "wb") as f:
        pickle.dump((langcode, tables), f)

    with open(f"Dict{langcode}.gf", "w") as dct, open(f"Paradigms{langcode}.gf", "w") as para:
        dct.write(
            f"""concrete Dict{langcode} of Dict{langcode}Abs = Cat{langcode} ** open Paradigms{langcode}, Prelude in {{\n\n""")
        para.write(f"""resource Paradigms{langcode} = open Cat{langcode}, Res{langcode}, Predef in {{\n\noper""")

        for cat, table in tables.items():
            for i, par in enumerate(table):
                dct.write(write_lexicon(i+1, par, cat))
                para.write("\n\n" + write_paradigm(i+1, par, cat))

        dct.write("\n}")
        para.write("\n}")
