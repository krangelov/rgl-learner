import sys
import pandas as pd
import glob

from dataclasses import dataclass
from .unimorph2gf import tag2cat, params, filter_tags
from .morpho_cats import (GFType, GFStr, GFRecord,
                        GFParam, GFTable,
                        get_order, param_order, getFormsOf)

def getTypeOf(o):
    if type(o) is str:
        return GFStr()
    else:
        table = {}
        record = []
        pcons = []
        for tag, val in o.items():
            param = params.get(tag)
            if param == None:
                table = None
            else:
                param_con, param_type = param
                pcons.append(param_con)
            val_type = getTypeOf(val)
            if table != None:
                old_type = table.get(param_type)
                if old_type and old_type != val_type:
                    table = None
                else:
                    table[param_type] = val_type
            label = params[tag][0] if tag in params else None
            record.append((label, val_type))

        if table and len(table) == 1:
            param_type, val_type = table.popitem()
            return GFTable(GFParam(param_type, tuple(pcons)), val_type)
        else:
            return GFRecord(tuple(record))

def learn(lang):
    # git clone unimorph/{lang}
    datasets = glob.glob(f"data/{lang}/{lang}*")
    dfs = []
    for dataset in datasets:
        if not dataset.endswith(".derivations"): # ignore derivation morphology
            df = pd.read_csv(dataset, sep="\t", header=None)
            df.columns=["lemma", "form", "tags"]
            dfs.append(df)
    df = pd.concat(dfs)
    df[['POS', 'tags']] = df['tags'].str.split(';', n=1, expand=True)
    data = df.groupby(["lemma", "POS"]).agg(list).reset_index().values.tolist()
    lin_types = {}
    for line in data:
        table = {}
        word  = line[0]
        forms = []
        for w, tags in zip(line[2], line[3]):
            tags = filter_tags(tags)
            tags = sorted(tags,key=get_order)

            if not tags:
                continue

            t = table
            for tag in tags[:-1]:
                t1 = t.setdefault(tag,{})
                if type(t1) is str:
                    t1 = {None: t1}
                    t[tag] = t1
                t = t1

                t[tags[-1]] = w
                forms.append(w)
        if table:
            if table:
                cat_name = tag2cat.get(line[1])
                if not cat_name:
                    continue
            typ = getTypeOf(table)
            forms = getFormsOf(table)
            lin_types.setdefault(line[1],{}).setdefault(typ,[]).append((word,forms))

    pdefs = set()
    lang_code = lang.title()
    with open('Res' + lang_code + '.gf', 'w') as fr, \
            open('Cat' + lang_code + '.gf', 'w') as fc, \
            open('Dict' + lang_code + '.gf', 'w') as fd, \
            open('Dict' + lang_code + 'Abs.gf', 'w') as fa:
        fr.write('resource Res' + lang_code + ' = {\n')
        fr.write('\n')
        fc.write('concrete Cat' + lang_code + ' of Cat = open Res' + lang_code + ' in {\n')
        fc.write('\n')
        fd.write(
            'concrete Dict' + lang_code + ' of Dict' + lang_code + 'Abs = Cat' + lang_code + ' ** open Res' + lang_code + ' {\n')
        fd.write('\n')
        fa.write('abstract Dict' + lang_code + 'Abs = Cat ** {\n')
        fa.write('\n')
        for tag, types in lin_types.items():
            cat_name = tag2cat.get(tag)
            if not cat_name:
                continue

            fc.write('lin ' + tag2cat[tag] + ' = ' + tag.title() + ' ;\n')

            for i, (typ, lexemes) in enumerate(sorted(types.items(), key=lambda x: -len(x[1]))):
                type_name = tag.title() + str(i + 1)
                n_forms = len(lexemes[0][1])
                # typ.printParamDefs(fr,pdefs)
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
                fr.write(' -> ' + type_name + ' =\n')
                vars = ['f' + str(i) for i in range(1, n_forms + 1)]
                fr.write('       \\' + ','.join(vars) + ' ->\n')
                fr.write('          ' + typ.renderOper(10, vars) + " ;\n")
                fr.write('\n')

                for lexeme, forms in lexemes:
                    fa.write('fun \'' + lexeme + '_' + cat_name + '\' : ' + cat_name + ' ;\n')
                    fd.write('lin \'' + lexeme + '_' + cat_name + '\' = mk' + type_name + ' ' + ' '.join(
                        ('"' + form + '"' if form != '-' else 'nonExist') for form in forms) + ' ;\n')

            fr.write('\n')
        fa.write('\n')
        fa.write('}\n')
        fd.write('\n')
        fd.write('}\n')
        fc.write('\n')
        fc.write('}\n')
        fr.write('\n')
        fr.write('}\n')
