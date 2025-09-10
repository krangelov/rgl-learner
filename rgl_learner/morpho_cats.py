import pickle

from resource import *
from collections import defaultdict
from dataclasses import dataclass
import rgl_learner.plugins as plugins
from rgl_learner.utils import nested_key_exists, escape
import itertools

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
            return [ty.linearize() for ty in self.arg_types]
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
                for l in lbl.linearize()[0]:
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

    def renderValues(self,d):
        for values in itertools.product(*(lbl_type.renderValues(1) for lbl,lbl_type in self.fields)):
            if len(values) == 0:
                yield "{}"
            else:
                ass = []
                for (lbl,lbl_type),value in zip(self.fields,values):
                    ass.append(lbl+"="+value)
                yield "{"+"; ".join(ass)+"}"

def getTypeOf(source_plugin, lang_plugin, o):
    if type(o) is str:
        return GFStr(),[o]
    elif type(o) is GFParamValue:
        return o.typ, [o]
    else:
        params = lang_plugin.params or source_plugin.params
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
            record.sort(key=lambda p: get_order(source_plugin,lang_plugin,p[0]))
            forms = sum((forms for _, _, forms in record), [])
            fields = tuple(((source_plugin.convert2gf(tag, params), val_type) for tag, val_type, _  in record))
            return GFRecord(fields), forms

def get_order(source_plugin, lang_plugin, tag):
    if lang_plugin.params_order:
        return lang_plugin.params_order.get(tag,10000000)
    else:
        return source_plugin.params_order.get(tag,10000000)

def get_gtag(source_plugin, lang_plugin, tag):
    if lang_plugin.params:
        return lang_plugin.params.get(tag)
    else:
        return source_plugin.params.get(tag)

def collect_derivations(pos,word,table,derivations):
    if pos == "noun":
        masc = table.get("masculine")
        if masc and type(masc) == str:
            gender_pairs = derivations.setdefault("gender-pairs",set())
            gender_pairs.add((masc,word))
        fem = table.get("feminine")
        if fem and type(fem) == str:
            gender_pairs = derivations.setdefault("gender-pairs",set())
            gender_pairs.add((word,fem))
    elif pos == "verb":
        imperfective = table.get("imperfective")
        if imperfective and type(imperfective) == str:
            aspect_pairs = derivations.setdefault("aspect-pairs",set())
            aspect_pairs.add((word,imperfective))
        perfective = table.get("perfective")
        if perfective and type(perfective) == str:
            aspect_pairs = derivations.setdefault("aspect-pairs",set())
            aspect_pairs.add((perfective,word))
    elif pos == "adj":
        noun = table.get("abstract-noun")
        if noun and type(noun) == str:
            adj_noun_pairs = derivations.setdefault("adj-noun-pairs",set())
            adj_noun_pairs.add((noun,word))

def learn(source,lang):
    source_plugin = plugins[source]
    lang_plugin   = plugins[source,lang]

    lexicon=source_plugin.extract(lang)

    noun_genders = set()
    derivations = {}
    lin_types = {}
    ignore_tags = source_plugin.ignore_tags + lang_plugin.ignore_tags
    for word, pos, forms, gtags in lexicon:
        table = {}
        for w,tags in forms:
            if 'multiword-construction' not in tags:
                if lang_plugin.filter_form(w,tags):
                    continue


                tags = [lang_plugin.fix_tags(tag) for tag in tags if tag not in ignore_tags]
                forms, tags = lang_plugin.merge_tags(pos, forms, w, tags)

                tags = sorted(tags,key=lambda tag: get_order(source_plugin, lang_plugin, tag))


                if not tags or lang_plugin.nested_key_exists(table, tags):
                    continue


                t = table
                for tag in tags[:-1]:
                    t1 = t.setdefault(tag,{})
                    if type(t1) is str:
                        t1 = {None: t1}
                        t[tag] = t1
                    t = t1

                t[tags[-1]] = w

        if table:
            if lang_plugin.filter_lemma(word,pos,table):
                continue

            pos = lang_plugin.patchPOS(word,pos,table)
            cat_name = source_plugin.tag2cat.get(pos)
            if not cat_name:
                continue

            collect_derivations(pos,word,table,derivations)

            res = lang_plugin.patch_inflection(cat_name,word,table)
            if res:
                table = res

            if pos == "noun":
                for tag in gtags:
                    res = get_gtag(source_plugin, lang_plugin, tag)
                    if res and res[1] == "Gender":
                        table["g"] = GFParamValue(res[0],GFParamType(res[1],()))
                        noun_genders.add(res[0])
                        break

            if table:
                typ, forms = getTypeOf(source_plugin, lang_plugin, table)
                if type(typ) != GFRecord:
                    typ = GFRecord((("s",typ),))
                lin_types.setdefault(pos,(cat_name,{}))[1].setdefault(typ,[]).append((word,forms))

    # Make unique abstract identifiers
    for tag, (cat_name, types) in lin_types.items():
        counts = {}
        for typ,lexemes in types.items():
            for lemma,forms in lexemes:
                counts[lemma] = counts.get(lemma,0)+1
        counts = {lemma: 1 for lemma, count in counts.items() if count > 1}
        for typ,lexemes in types.items():
            for i,(lemma,forms) in enumerate(lexemes):
                index = counts.get(lemma)
                if not index:
                    ident = lemma+"_"+cat_name
                else:
                    ident = lemma+"_"+str(index)+"_"+cat_name
                    counts[lemma] = index+1
                lexemes[i] = (ident, forms)

    def to_value(form):
        if type(form) == GFParamValue:
            return form.value
        elif form == "-":
            return "nonExist"
        else:
            return '"'+form+'"'

    noun_cat,noun_types = lin_types.get("noun") or lin_types.get("N")
    new_gender_typ = GFParamType("Gender",tuple(GFParamConstr(gender,()) for gender in noun_genders))
    items = list(noun_types.items())
    noun_types.clear()
    for noun_type,lexemes in items:
        noun_type = GFRecord(tuple(((name,typ if name != "g" else new_gender_typ) for name,typ in noun_type.fields)))
        noun_types[noun_type] = lexemes

    lang_code = lang_plugin.iso3
    with open('Res'+lang_code+'.gf','w') as fr, \
         open('Cat'+lang_code+'.gf','w') as fc, \
         open('Dict'+lang_code+'.gf','w') as fd, \
         open('Dict'+lang_code+'Abs.gf','w') as fa:
        fr.write('resource Res'+lang_code+' = {\n')
        fr.write('\n')
        fr.write('oper Compl = {s : Str} ;\n\n')
        fc.write('concrete Cat'+lang_code+' of Cat = open Res'+lang_code+' in {\n')
        fc.write('\n')
        fd.write('concrete Dict'+lang_code+' of Dict'+lang_code+'Abs = Cat'+lang_code+' ** open Res'+lang_code+', Prelude in {\n')
        fd.write('\n')
        fa.write('abstract Dict'+lang_code+'Abs = Cat ** {\n')
        fa.write('\n')
        for tag, (cat_name, types) in lin_types.items():
            pdefs = defaultdict(set)

            if cat_name == "N":
                fc.write('lincat N = '+tag.title()+' ;\n')
                fc.write('lincat N2 = '+tag.title()+' ** {c2 : Compl} ;\n')
                fc.write('lincat N3 = '+tag.title()+' ** {c2,c3 : Compl} ;\n')
            elif cat_name == "V":
                fc.write('lincat V, VA, VV, VS, VQ = '+tag.title()+' ;\n')
                fc.write('lincat V2, V2S, V2Q = '+tag.title()+' ** {c2 : Compl} ;\n')
                fc.write('lincat V3, V2A, V2V = '+tag.title()+' ** {c2,c3 : Compl} ;\n')
            elif cat_name == "A":
                fc.write('lincat A = '+tag.title()+' ;\n')
                fc.write('lincat A2 = '+tag.title()+' ** {c2 : Compl} ;\n')
            elif cat_name == "Adv":
                fc.write('lincat Adv, AdV, AdA, AdN = '+tag.title()+' ;\n')
            else:
                fc.write('lincat '+cat_name+' = '+tag.title()+' ;\n')

            for i,(typ,lexemes) in enumerate(sorted(types.items(),key=lambda x: -len(x[1]))):
                type_name = tag.title()+(str(i) if i else "")
                n_forms  = len(lexemes[0][1])
                n_params = 0
                while type(lexemes[0][1][n_forms-1]) == GFParamValue:
                    n_forms  -= 1
                    n_params += 1

                typ.printParamDefs(fr,pdefs)
                fr.write("\n".join(["param "+name+" = "+" | ".join(str(constructor) for constructor in constructors)+" ;" for name, constructors in pdefs.items()]) + "\n")
                fr.write('oper '+type_name+' = '+str(typ)+' ; -- '+str(len(lexemes))+'\n')
                fr.write('oper mk'+type_name+' : ')
                if n_forms == 1:
                    fr.write('Str')
                elif n_forms == 2:
                    fr.write('Str -> Str')
                elif n_forms == 3:
                    fr.write('Str -> Str -> Str')
                else:
                    fr.write('('+(',_'*n_forms)[1:]+' : Str)')
                for i in range(n_forms,n_forms+n_params):
                    fr.write(' -> '+str(lexemes[0][1][i].typ))
                fr.write(' -> '+type_name+' =\n')
                vars = ['f'+str(i) for i in range(1,n_forms+1)]+['g'+(str(i) if i else "") for i in range(0,n_params)]
                fr.write('       \\'+','.join(vars)+' ->\n')
                fr.write('          '+typ.renderOper(10,vars)+" ;\n")
                fr.write('\n')
                for ident,forms in lexemes:
                    fa.write('fun '+escape(ident)+' : '+cat_name+' ;\n')
                    fd.write('lin '+escape(ident)+' = mk'+type_name+' '+' '.join(to_value(form) for form in forms)+' ;\n')

            fr.write('\n')

        fc.write('lincat Prep = Compl ;\n')
        fc.write('lincat Interj = {s : Str} ;\n')
        fc.write('lincat Voc = {s : Str} ;\n')

        fa.write('\n')
        fa.write('}\n')
        fd.write('\n')
        fd.write('}\n')
        fc.write('\n')
        fc.write('}\n')
        fr.write('\n')
        fr.write('}\n')

    with open(f"data/{lang}/lexicon.pickle", "wb") as f:
        pickle.dump((lang_code,source,lin_types),f)

    with open(f"data/{lang}/derivations.pickle", "wb") as f:
        pickle.dump(derivations,f)

    if derivations:
        print("found:", ", ".join(derivations.keys()))

    print(getrusage(RUSAGE_SELF))
