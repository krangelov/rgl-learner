import pickle
from rgl_learner.utils import escape, reverse_dict

def rewrite(lang):
    with open(f"data/{lang}/paradigms.pickle", "rb") as f:
        source, langcode, tables = pickle.load(f)
    with open(f"data/{lang}/rules.pickle", "rb") as f:
        how, all_rules = pickle.load(f)

    with open(f"Dict{langcode}.gf", "w") as dct:
        dct.write(
            f"""concrete Dict{langcode} of Dict{langcode}Abs = Cat{langcode} ** open Paradigms{langcode}, Prelude in {{\n\n""")

        for cat, table in tables.items():
            print(f"=={cat}==")

            rules = all_rules.get(cat,{})

            matched = 0
            forms   = 0
            total   = 0
            for real_tag, paradigm in enumerate(table):
                s = "" if len(table) == 1 else f"{(real_tag+1):03d}"
                form_names = reverse_dict(paradigm.typ.linearize())

                for j,(ident,table) in enumerate(paradigm.tables):
                    token = {p: form for p, form in zip(form_names, table)}

                    for rule, (pred_tag, entropy, dist) in rules.items():
                        match = True
                        for form, subrule in rule:
                            if not token[form].endswith(subrule):
                                match = False
                                break

                        if match and pred_tag == real_tag:
                            code = f"lin {escape(ident)} = mk{cat}"
                            for form, subrule in rule:
                                code += ' \"'+token[form]+'\"'
                            code += " ;\n"
                            dct.write(code)
                            matched += 1
                            forms   += len(rule)
                            break
                    else:
                        code = f"""lin {escape(ident)} = mk{cat}{s} {" ".join(('"'+val+'"' for name, val in paradigm.var_insts[j]))} ;\n"""
                        dct.write(code)

                    total += 1

            print("coverage:     ", matched/total)
            if matched > 0:
                print("average-forms:", forms/matched)

        dct.write("\n}")
