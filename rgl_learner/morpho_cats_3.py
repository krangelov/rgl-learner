import pickle

from resource import *
from collections import defaultdict, Counter
from dataclasses import dataclass
import rgl_learner.plugins as plugins
from rgl_learner.utils import nested_key_exists, escape, reverse_dict
import itertools
from tqdm.auto import tqdm
import os
import json

class GFType:
    def printParamDefs(self,f,pdefs):
        pass


@dataclass(frozen=True)
class GFStr(GFType):
    def __repr__(self):
        return "Str"

    def linearize(self):
        return ""

    def renderOper(self,indent,vars):
        return vars.pop(0)

    def fillTagTable(self,tags,lst):
        lst.append(tuple(tags))

@dataclass(frozen=True)
class GFParamType(GFType):
    name: str
    constructors: tuple # [GFParamConstr]

    def __repr__(self):
        return self.name


    def printParamDefs(self,f,pdefs):
        pdefs[self.name].update(self.constructors)
        for constructor in self.constructors:
            constructor.printParamDefs(f,pdefs)

    def renderValues(self,d):
        for con in self.constructors:
            for value in con.renderValues(d):
                yield value

    def renderOper(self,indent,vars):
        if type(vars[0]) == tuple:
            return str(vars.pop(0)[0])
        return str(vars.pop(0))

    def linearize(self):
        return self.constructors

@dataclass(frozen=True)
class GFParamConstr:
    name: str
    arg_types: tuple[GFParamType]

    def __repr__(self):
        if self.arg_types:
            return self.name+' '+' '.join(str(ty) for ty in self.arg_types)
        else:
            return self.name

    def linearize(self):
        if self.arg_types:
            return list((self.name,)+args for args in itertools.product(*[ty.linearize() for ty in self.arg_types]))
        else:
            return self.name

    def printParamDefs(self,f,pdefs):
        for ty in self.arg_types:
            ty.printParamDefs(f,pdefs)

    def renderValues(self,d):
        for values in itertools.product(*(arg_type.renderValues(1) for arg_type in self.arg_types)):
            if len(values) == 0:
                yield self.name
            else:
                value = self.name+' '+' '.join(values)
                if d > 0:
                    value = "(" + value + ")"
                yield value

@dataclass(frozen=True)
class GFParamValue:
    value: str
    typ: GFParamType

    def __str__(self):
        return self.value

    def linearize(self):
        return self.typ.linearize()

@dataclass(frozen=True)
class GFTable(GFType):
    arg_type: GFType
    res_type: GFType

    def __repr__(self):
        return self.arg_type.__repr__() + " => " + self.res_type.__repr__()

    def linearize(self):
        labels = {}
        for lbl in self.arg_type.constructors:
            if type(lbl.linearize()) == list:
                for l in lbl.linearize():
                    labels[l] = self.res_type.linearize()
            else:
                labels[lbl] = self.res_type.linearize()
        return labels

    def renderOper(self,indent,vars):
        s = 'table {\n'
        first = True
        for num, value in enumerate(self.arg_type.renderValues(0)):
            if not first:
                s += ' ;\n'
            form = self.res_type.renderOper(indent+len(value)+6,vars)
            if type(form) == tuple:
                if form[1]:
                    form = form[0] + " --guessed"
                else:
                    form = form[0]
            s += ' '*(indent+2)+value+' => '+ form
            first = False
        s += '\n' + ' '*indent + '}'
        return s.replace ("--guessed ;", "; --guessed")

    def fillTagTable(self,tags,lst):
        for pcon in self.arg_type.constructors:
            tags.append(pcon)
            self.res_type.fillTagTable(tags,lst)
            tags.pop()

    def printParamDefs(self,f,pdefs):
        self.arg_type.printParamDefs(f,pdefs)
        self.res_type.printParamDefs(f,pdefs)


@dataclass(frozen=True)
class GFRecord(GFType):
    fields: tuple[tuple[str,GFType]]

    def __repr__(self):
        s = ""
        for lbl,ty in self.fields:
            lbl = "".join([(c if c != '-' else '_') for c in str(lbl)])
            if s:
                s = s + "; "
            s = s + lbl+": "+ty.__repr__()
        return "{"+s+"}"

    def renderOper(self,indent,vars):
        s  = '{ '
        ind = 0
        for num, (lbl,ty) in enumerate(self.fields):
            lbl = "".join([(c if c != '-' else '_') for c in str(lbl)])
            if ind > 0:
                s += ' ;\n'
            form = ty.renderOper(indent+len(lbl)+5,vars)
            if type(form) == tuple:
                if form[1]:
                    form = form[0] + " --guessed"
                else:
                    form = form[0]
            s += ' '*ind + lbl + ' = ' + form
            ind = (indent+2)
        s += '\n' + ' '*indent + '}'
        return s.replace ("--guessed ;", "; --guessed")

    def fillTagTable(self,tags,lst):
        for lbl,ty in self.fields:
            tags.append(lbl)
            ty.fillTagTable(tags,lst)
            tags.pop()

    def printParamDefs(self,f,pdefs):
        for lbl,ty in self.fields:
           ty.printParamDefs(f,pdefs)

    def linearize(self):
        labels = {}
        for lbl, ty in self.fields:
            lbl = "".join([(c if c != '-' else '_') for c in str(lbl)])
            labels[lbl] = ty.linearize()
        return labels

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
                    val_type, forms = getTypeOf(source_plugin, lang_plugin, val)
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
    for word, pos, forms, gtags in lexicon:
        if lang_plugin.filter_lemma(word, pos):
            continue

        pos = lang_plugin.patchPOS(word,pos)
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
            new_forms = lang_plugin.merge_tags(pos, forms, w, tags)
            new_tags = [tag for t in new_forms for tag in t[1]]
            for num, tag in enumerate(new_tags):
                if tag in params:
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
            tags = [t for t in tags if t in params and params[t][-1] in pos_order]
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
                        t[value] = t1
                    t = t1

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

    for pos, ts in tables.items():
        for (word, table, gtags) in ts:

            add_form(table, default_table[pos])
            if compress_table:
                table = compress(table)

            res = lang_plugin.patch_inflection(pos, word, table)
            if res:
                table = res

            if pos in ["N","PN"]:
                for tag in gtags:
                    res = get_gtag(source_plugin, lang_plugin, tag)
                    if res and res[1] == "Gender":
                        table["g"] = GFParamValue(res[0],GFParamType(res[1],()))
                        noun_genders.add(res[0])
                        break

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
        fd.write(
            'concrete Dict' + lang_code + ' of Dict' + lang_code + 'Abs = Cat' + lang_code + ' ** open Res' + lang_code + ', Prelude in {\n')
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





