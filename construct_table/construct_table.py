import pickle
import warnings

from collections import defaultdict
from rgl_learner import plugins

def reverse_dict(d, keys=[]):
    result = []
    for k, v in d.items():
        if isinstance(v, dict):
            result.extend(reverse_dict(v, keys + [str(k)]))
        else:
            result.append((keys + [str(k)]))
    return result


def get_known_forms(typ, known_forms, params, form2cat):
    forms = reverse_dict(typ.linearize())
    unknown_tags = []
    for form in forms:
        for morpheme in form:
            if morpheme in form2cat:
                known_forms[form2cat[morpheme][1]].add(form2cat[morpheme][0])
            elif morpheme in params:
                known_forms[params[morpheme][1]].add(morpheme)
            else:
                unknown_tags.append(morpheme)
   # warnings.warn(f"Unknown tags: {set(unknown_tags)}")
    return known_forms, set(unknown_tags)


def write_code(pos, known_forms, params_order):
    code = f"def patch{pos}(lemma, table):\n"
    code += f"\tparams = {dict(known_forms)} \n"
    code += f"\tparam_order = {params_order} \n"
    code += f"\tfixed_names = {{}} \n"
    code += "\tnew_table = fill_empty(fix_table(table, param_order, params, fixed_names))\n"
    code += "\treturn new_table"
    return code


def get_inflection_table(pos, data, params, form2cat):
    print(f"=={pos}==")
    _, lexeme = data
    known_forms = defaultdict(set)
    unknown_tags = set()
    for typ in lexeme:
        known_forms, unknown = get_known_forms(typ, known_forms, params, form2cat)
        unknown_tags.update(unknown)
    warnings.warn(f"Unknown forms: {set(unknown_tags)}")


    params_order = []
    for param in params.values():
        if param[1] in known_forms and not param[1] in params_order:
            params_order.append(param[1])
    code = write_code(pos, known_forms, params_order)
    return code

def construct(source, lang):
    source_plugin = plugins[source]
    lang_plugin = plugins[source, lang]

    with open(f"data/{lang}/lexicon.pickle", "rb") as f:
        langcode, lexicon = pickle.load(f)

    params = source_plugin.params | lang_plugin.params
    #print(params)
    form2cat = {v[0]:(k, v[1]) for k,v in params.items() if v}
    code = ""
    for pos, data in lexicon.items():
        pos = source_plugin.tag2cat[pos]
        code += get_inflection_table(pos, data, params, form2cat) + "\n\n"

    with open(f"construct_table/tmp/{lang}.py", "w") as f:
        f.write("from rgl_learner.utils import *\n\n")
        f.write(f"""iso3 = "{langcode}"\n""")
        f.write(code)


