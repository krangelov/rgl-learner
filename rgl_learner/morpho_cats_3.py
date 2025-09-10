import pickle

from resource import *
from collections import defaultdict, Counter
from dataclasses import dataclass
import rgl_learner.plugins as plugins
from rgl_learner.utils import nested_key_exists, escape, reverse_dict
from tqdm.auto import tqdm
import os
import json

from rgl_learner.gf_types import *

def getTypeOf(source_plugin, lang_plugin, o):
    if type(o) is str:
        return GFStr(),[o]
    elif type(o) is GFParamValue:
        return o.typ, [o]
    else:
        params = source_plugin.params | lang_plugin.params
        params_keys = list(params.keys())

        def decodePolishSequence(o,types):
            if not types:
                val_type, forms = getTypeOf(source_plugin, lang_plugin, o)
                return (), val_type, forms

            pcons = []
            old_val_type = None
            #print(o)
            for tag,val in o.items():
                match params.get(tag):
                    case param_con, res_type:
                        ps, val_type, forms = decodePolishSequence(val,types[1:])
                        pcons.append((GFParamConstr(param_con,()),ps,params_keys.index(tag) or 10000,forms))
                    case param_con, arg_types, res_type:
                        n_args = len(arg_types)
                        ps, val_type, forms = decodePolishSequence(val,arg_types+types[1:])
                        pcons.append((GFParamConstr(param_con,tuple(ps[:n_args])),ps[n_args:],params_keys.index(tag) or 10000,forms))

            pcons.sort(key=lambda p: p[2])
            forms = sum((forms for _, _, _, forms in pcons), [])
            return (GFParamType(types[0],tuple((pcon for pcon, _, _, _  in pcons))),)+ps, val_type, forms

        table  = defaultdict(dict)
        record = []
        pcons  = []
        for tag,val in o.items():
            match params.get(tag):
                case None:
                    table = None
                   # print(val)
                    val_type, forms = getTypeOf(source_plugin, lang_plugin, val)
                   # print(forms)
                case param_con, res_type:
                    val_type, forms = getTypeOf(source_plugin, lang_plugin, val)
                    pcons.append((GFParamConstr(param_con,()),params_keys.index(tag) or 10000,forms))
                case param_con, arg_types, res_type:
                    args, val_type, forms = decodePolishSequence(val,arg_types)
                    pcons.append((GFParamConstr(param_con,tuple(args)),params_keys.index(tag) or 10000,forms))

            if table != None:
                old_type = table.get(res_type)
                if old_type and old_type != val_type:
                    table = None
                else:
                    table[res_type] = val_type
            record.append((tag,val_type,forms))

        if table and len(table) == 1:
            arg_type,val_type = table.popitem()
            pcons.sort(key=lambda p: p[1])
            forms = sum((forms for _, _, forms in pcons), [])
            pcons = tuple((pcon for pcon, _, _  in pcons))
            return GFTable(GFParamType(arg_type,pcons),val_type), forms
        else:
            forms = sum((forms for _, _, forms in record), [])
           
            fields = tuple(((source_plugin.convert2gf(tag, params), val_type) for tag, val_type, _ in record))
            return GFRecord(fields), forms

def get_gtag(source_plugin, lang_plugin, tag):
    if lang_plugin.params:
        return lang_plugin.params.get(tag)
    else:
        return source_plugin.params.get(tag)

def collect_derivations(pos,lemma,form,tags,derivations):
    if pos == "N" and len(tags) == 1:
        if tags[0] == "masculine":
            gender_pairs = derivations.setdefault("gender-pairs",set())
            gender_pairs.add((form,lemma))
            return True
        if tags[0] == "feminine":
            gender_pairs = derivations.setdefault("gender-pairs",set())
            gender_pairs.add((lemma,form))
            return True
    elif pos == "V" and len(tags) == 1:
        if tags[0] == "imperfective":
            aspect_pairs = derivations.setdefault("aspect-pairs",set())
            aspect_pairs.add((lemma,form))
            return True
        if tags[0] == "perfective":
            aspect_pairs = derivations.setdefault("aspect-pairs",set())
            aspect_pairs.add((form,lemma))
            return True
    elif pos == "A" and len(tags) == 1:
        if tags[0] == "abstract-noun":
            adj_noun_pairs = derivations.setdefault("adj-noun-pairs",set())
            adj_noun_pairs.add((form,lemma))
            return True

    return False

def learn(source, lang, filename=None,
          dirname="data", level=None,
          compress_table=True):
    source_plugin = plugins[source]
    lang_plugin = plugins[source, lang]

    lexicon = source_plugin.extract(lang, filename)


    noun_genders = set()
    lin_types = {}
    ignore_tags = source_plugin.ignore_tags + lang_plugin.ignore_tags
    params = source_plugin.params | lang_plugin.params
    default_params = source_plugin.default_params | lang_plugin.default_params


    known_tags = []
    unknown_tags = []
    temp_order = defaultdict(list)
    param2val = defaultdict(list)

    # Step 1: extract parameter order and fix annotation issues

    pos_order = defaultdict(dict)
    corrected_lexicon = []
    derivations = {}

    for word, pos, forms, gtags in lexicon:
        
        if lang_plugin.filter_lemma(word, pos, forms):
            continue

        pos = lang_plugin.patchPOS(word,pos,forms)
        pos = source_plugin.tag2cat.get(pos)
        if not pos:
            continue


        corrected_forms = []
        for w, tags in forms:
            if lang_plugin.filter_form(w,tags):
                continue

            tags = list(dict.fromkeys(tags)) # remove duplicates
            tags = [tag for tag in tags if tag not in ignore_tags]
            tags = lang_plugin.fix_tags(tags)

            if collect_derivations(pos,word,w,tags,derivations):
                continue

            new_forms = lang_plugin.merge_tags(pos, forms, w, tags)
            new_tags = [tag for t in new_forms for tag in t[1]]
            for num, tag in enumerate(new_tags):
                if tag in params and params[tag]:
                    known_tags.append(tag)
                    if params[tag][-1] in pos_order[pos]:
                        pos_order[pos][params[tag][-1]].append(num)
                    else:
                        pos_order[pos][params[tag][-1]] = [num,]
                    if tag not in param2val[params[tag][-1]]:
                        param2val[params[tag][-1]].append(tag)
                elif tag not in ignore_tags:
                    unknown_tags.append(tag)

            corrected_forms.extend(new_forms)
        corrected_lexicon.append((word, pos, corrected_forms, gtags))


    for pos, val in pos_order.items():
        temp_order[pos], _ = list(zip(*sorted(val.items(), key=lambda x: sum(x[1])/len(x[1]))))


    if lang_plugin.order:
        order = lang_plugin.order
    elif level and os.path.exists(f"{lang}_order_{level}.json"): # temporary solution to store order
         with open(f"{lang}_order_{level}.json") as f:
             order = json.load(f)
    else:
        order = {}

    for pos, linorder in temp_order.items():
        if pos not in order:
            order[pos] = linorder

    filename = f"{lang}_order_{level}.json" if level else f"{lang}_order.json"
    with open(filename, "w") as f: # temporary solution for evaluation
        json.dump(order, f)


    print("Unknown tags:", set(unknown_tags))



    # Step 2: create tables for lexemes and a template for an inflectional class

    default_table = defaultdict(list)
    tables = defaultdict(list)


    for word, pos, forms, gtags in corrected_lexicon:

        pos_order = order.get(pos, [])
        table = {}

        for w, tags in forms:
            form_table = []
            i = 0
            tags = [t for t in tags if t in params and params[t] and params[t][-1] in pos_order]
            tags = sorted(tags, key=lambda x: pos_order.index(params[x][-1]))

            for param in pos_order:
                if i < len(tags) and tags[i] in param2val[param]:
                    form_table.append(tags[i])
                    i += 1
                elif param in default_params:
                    form_table.append(default_params[param])
                else:
                    form_table.append(f"no{param}")

            if form_table not in default_table[pos]:
                default_table[pos].append(form_table)

            if form_table:
                t = table
                for value in form_table[:-1]:
                    t1 = t.setdefault(value, {})
                    if type(t1) is str:
                        t1 = {None: t1}
                        if value not in t:
                            t[value] = t1
                    t = t1
                if form_table[-1] not in t:
                    t[form_table[-1]] = w
        if table:
            tables[pos].append((word,table,gtags))

    # Step 3: normalize tables and convert to GF types

    def add_form(ddict, tables):
        params = defaultdict(list)
        for table in tables:
            params[table[0]].append(table[1:])

        params = sorted(params.items(), key=lambda x: x[0])

        for form1, ts in params:
            if not ts[0]:
                ddict.setdefault(form1, "-")
            else:
                ddict.setdefault(form1, {})
                ddict.setdefault(form1, add_form(ddict[form1], ts))

    def sort_table(table):
        new_table = {}
        for k, v in sorted(table.items(), key = lambda x: x[0]):
            if isinstance(v, dict):
                new_table[k] = sort_table(v)
            else:
                new_table[k] = v
        return new_table

    def compress(ddict):
        default = default_params.values()
        while len(ddict) == 1 and (next(iter(ddict)).startswith("no") or next(iter(ddict)) in default):
            val = next(iter(ddict.values()))
            if isinstance(val, dict):
                ddict = next(iter(ddict.values()))
            else:
                return next(iter(ddict.values()))
        for param, values in ddict.items():
            if isinstance(values, dict):
                if len(values) == 1 and (next(iter(values)).startswith("no") or next(iter(values)) in default):
                    val = next(iter(values))
                    ddict[param] = compress(values[val]) if isinstance(values[val], dict) else values[val]
                else:
                    ddict[param] = compress(values)
        return ddict
    
    def complete_table(table, param2val):
        new_table = table.copy()
        for k, v in table.items():
            if isinstance(v, dict):
                new_table[k] = complete_table(v, param2val)
        vals = [v for v in list(table.keys()) if not v.startswith("no")]
        pars = [params[val][-1] for val in vals if val in params]
        expected = [param2val[x] for x in pars]
        flat = set([x for y in expected for x in y])
        if set(vals) != flat:
            for i in flat.difference(set(vals)):
                if i not in new_table:
                    new_table[i] = "-"
        return new_table

    for pos, ts in tables.items():
        for (word, table, gtags) in ts:

            add_form(table, default_table[pos])
            if compress_table:
                table = compress(table)

            res = lang_plugin.patch_inflection(pos, word, table)
            if res:
                table = res
            
            table = sort_table(table)

    
            #table = complete_table(table, param2val)
           

            

            
            #table["lemma"] = word
            
            if pos in ["N","PN"]:
                for tag in gtags:
                    res = get_gtag(source_plugin, lang_plugin, tag)
                    if res and res[1] == "Gender":
                        table["g"] = GFParamValue(res[0],GFParamType(res[1],()))
                        noun_genders.add(res[0])
                        break
            
            
            #print(table)
            typ, forms = getTypeOf(source_plugin, lang_plugin, table)

            if type(typ) != GFRecord:
                typ = GFRecord((("s", typ),))
            
    
            lin_types.setdefault(pos, (pos, {}))[1].setdefault(typ, []).append((word, forms))

    cat2idx = {}
    for tag, (cat_name, types) in lin_types.items():
        counts = {}
        for typ, lexemes in types.items():
            for lemma, forms in lexemes:
                counts[lemma] = counts.get(lemma, 0) + 1
        counts = {lemma: 1 for lemma, count in counts.items() if count > 1}
        for typ, lexemes in types.items():
            for i, (lemma, forms) in enumerate(lexemes):
                index = counts.get(lemma)
                if not index:
                    ident = lemma + "_" + cat_name
                else:
                    ident = lemma + "_" + str(index) + "_" + cat_name
                    counts[lemma] = index + 1
                lexemes[i] = (ident, forms)

    def to_value(form):
        if type(form) == GFParamValue:
            return form.value
        elif form == "-":
            return "nonExist"
        else:
            return '"' + form + '"'


    if lin_types.get("noun") or lin_types.get("N"):
        noun_cat, noun_types = lin_types.get("noun") or lin_types.get("N")
        new_gender_typ = GFParamType("Gender", tuple(GFParamConstr(gender, ()) for gender in noun_genders))
        items = list(noun_types.items())
        noun_types.clear()
        for noun_type, lexemes in items:
            noun_type = GFRecord(tuple(((name, typ if name != "g" else new_gender_typ) for name, typ in noun_type.fields)))
            noun_types[noun_type] = lexemes

    lang_code = lang_plugin.iso3
    path = f"{dirname}/{lang}/"
    with open(path +'Res' + lang_code + '.gf', 'w') as fr, \
            open(path + 'Cat' + lang_code + '.gf', 'w') as fc, \
            open(path + 'Dict' + lang_code + '.gf', 'w') as fd, \
            open(path + 'Dict' + lang_code + 'Abs.gf', 'w') as fa:
        fr.write('resource Res' + lang_code + ' = {\n')
        fr.write('\n')
        fc.write('concrete Cat' + lang_code + ' of Cat = open Res' + lang_code + ' in {\n')
        fc.write('\n')
        fd.write('concrete Dict' + lang_code + ' of Dict' + lang_code + 'Abs = Cat' + lang_code + ' ** open Res' + lang_code + ', Prelude in {\n')
        fd.write('\n')
        fa.write('abstract Dict' + lang_code + 'Abs = Cat ** {\n')
        fa.write('\n')

        cat2idx = defaultdict(list)
        for tag, (cat_name, types) in lin_types.items():
            pdefs = defaultdict(set)
            fc.write('lincat ' + cat_name + ' = ' + tag.title() + ' ;\n')


            typ, tables = next(iter(types.items()))
            forms = reverse_dict(typ.linearize())

            lemma_form = [(num, form) for table in tables for num, (form, word) in
                          enumerate(zip(forms, table[1])) if table[0].split("_")[0] == word]
            #print(Counter(lemma_form))

            #mc_lemma_form = Counter(lemma_form).most_common(1)[0][0][0] if lemma_form else 0
            idx = 0
            if lemma_form:
                counter = Counter(lemma_form).most_common(1)[0]
                idx = counter[0][0]
            cat2idx[cat_name].append(forms[idx])
            #cat2idx[cat_name].append(forms[mc_lemma_form])

            for i, (typ, lexemes) in enumerate(sorted(types.items(), key=lambda x: -len(x[1]))):
                
                type_name = tag.title() + (str(i) if i else "")
                n_forms = len(lexemes[0][1])
                n_params = 0
                while type(lexemes[0][1][n_forms - 1]) == GFParamValue:
                    n_forms -= 1
                    n_params += 1



                typ.printParamDefs(fr, pdefs)

                fr.write("\n".join(
                    ["param " + name + " = " + " | ".join(str(constructor) for constructor in constructors) + " ;" for
                     name, constructors in pdefs.items()]) + "\n")
                fr.write('oper ' + type_name + ' = ' + str(typ) + ' ; -- ' + str(len(lexemes)) + '\n')
                fr.write('oper mk' + type_name + ' : ')
                if n_forms == 1:
                    fr.write('Str')
                elif n_forms == 2:
                    fr.write('Str -> Str')
                elif n_forms == 3:
                    fr.write('Str -> Str -> Str')
                else:
                    fr.write('(' + (',_' * n_forms)[1:] + ' : Str)')
                for i in range(n_forms, n_forms + n_params):
                    fr.write(' -> ' + str(lexemes[0][1][i].typ))
                fr.write(' -> ' + type_name + ' =\n')
                vars = ['f' + str(i) for i in range(1, n_forms + 1)] + ['g' + (str(i) if i else "") for i in
                                                                        range(0, n_params)]
                fr.write('       \\' + ','.join(vars) + ' ->\n')
                fr.write('          ' + typ.renderOper(10, vars) + " ;\n")
                fr.write('\n')
                for ident, forms in lexemes:
                    fa.write('fun ' + escape(ident) + ' : ' + cat_name + ' ;\n')
                    fd.write('lin ' + escape(ident) + ' = mk' + type_name + ' ' + ' '.join(
                        to_value(form) for form in forms) + ' ;\n')

            fr.write('\n')
        fa.write('\n')
        fa.write('}\n')
        fd.write('\n')
        fd.write('}\n')
        fc.write('\n')
        fc.write('}\n')
        fr.write('\n')
        fr.write('}\n')

    with open(f"{dirname}/{lang}/lexicon.pickle", "wb") as f:
        pickle.dump((lang_code, source, lin_types), f)

    with open(f"{dirname}/{lang}/derivations.pickle", "wb") as f:
        pickle.dump(derivations,f)

    if derivations:
        print("found:", ", ".join(derivations.keys()))

    filename = f"{lang}_forms_{level}.json" if level else f"{lang}_forms.json"
    prev_cat2idx = {}
    if os.path.exists(filename):
        with open(filename, "r") as f:
            prev_cat2idx = json.load(f)


    for k, v in cat2idx.items():
        if k not in prev_cat2idx:
            prev_cat2idx[k] = v

    with open(filename, "w") as f:
        json.dump(prev_cat2idx, f)

    return unknown_tags





