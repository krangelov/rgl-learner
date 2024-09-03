import pickle

from resource import *
from collections import defaultdict
from dataclasses import dataclass
import rgl_learner.plugins as plugins
from rgl_learner.utils import nested_key_exists

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
        #pdef = "param "+self.name+" = "+" | ".join(str(constructor) for constructor in self.constructors)+" ;\n"
        for constructor in self.constructors:
            constructor.printParamDefs(f,pdefs)
        #if pdef not in pdefs:
        #    f.write(pdef)
        #    pdefs.add(pdef)

@dataclass(frozen=True)
class GFParamConstr:
    name: str
    arg_types: tuple[GFType]

    def __repr__(self):
        if self.arg_types:
            return self.name+' '.join(str(ty) for ty in self.arg_types)
        else:
            return self.name

    def printParamDefs(self,f,pdefs):
        for ty in self.arg_types:
            ty.printParamDefs(f,pdefs)

@dataclass(frozen=True)
class GFTable(GFType):
    arg_type: GFType
    res_type: GFType

    def __repr__(self):
        return self.arg_type.__repr__() + " => " + self.res_type.__repr__()

    def linearize(self):
        labels = {}
        for lbl in self.arg_type.constructors:
            labels[lbl] = self.res_type.linearize()
        return labels

    def renderOper(self,indent,vars):
        s = 'table {\n'
        first = True
        for pcon in self.arg_type.constructors:
            if not first:
                s += ' ;\n'
            s += ' '*(indent+2)+pcon.name+' => '+self.res_type.renderOper(indent+len(pcon.name)+6,vars)
            first = False
        s += '\n' + ' '*indent + '}'
        return s

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
        for lbl,ty in self.fields:
            lbl = "".join([(c if c != '-' else '_') for c in str(lbl)])
            if ind > 0:
                s += ' ;\n'
            s += ' '*ind + lbl + ' = ' + ty.renderOper(indent+len(lbl)+5,vars)
            ind = (indent+2)
        s += '\n' + ' '*indent + '}'
        return s

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
    else:
        table  = defaultdict(dict)
        record = []
        pcons  = []
        params = source_plugin.params | lang_plugin.params
        params_keys = list(params.keys())
        for tag,val in o.items():
            val_type, forms = getTypeOf(source_plugin, lang_plugin, val)
            param = params.get(tag)
            if param == None:
                table = None
            else:
                param_con, arg_type = param
              #  print(param_con, arg_type)
                pcons.append((param_con,params_keys.index(tag) or 10000,forms))
              #  print(pcons)

            if table != None:
                old_type = table.get(arg_type)
                if old_type and old_type != val_type:
                    table = None
                else:
                    table[arg_type] = val_type
            record.append((tag,val_type,forms))


        if table and len(table) == 1:
            arg_type,val_type = table.popitem()
            pcons.sort(key=lambda p: p[1])
            forms = sum((forms for _, _, forms in pcons), [])
            pcons = tuple((GFParamConstr(pcon,()) for pcon, _, _  in pcons))
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

def learn(source,lang):
    source_plugin = plugins[source]
    lang_plugin   = plugins[source,lang]

    lexicon=source_plugin.extract(lang)

    lin_types = {}
    ignore_tags = source_plugin.ignore_tags + lang_plugin.ignore_tags
    for word, pos, forms in lexicon:
        table = {}
        for w,tags in forms:
            if 'multiword-construction' not in tags:
                if lang_plugin.filter_form(w):
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
            res = lang_plugin.patch_inflection(cat_name,word,table)
            if res:
                table = res

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

    def escape(s):
        s2 = ""
        for c in s:
            if c == "'":
                s2 += "\\'"
            elif c == "\\":
                s2 += "\\\\"
            else:
                s2 += c
        return "'"+s2+"'"

    lang_code = lang_plugin.iso3
    with open('Res'+lang_code+'.gf','w') as fr, \
         open('Cat'+lang_code+'.gf','w') as fc, \
         open('Dict'+lang_code+'.gf','w') as fd, \
         open('Dict'+lang_code+'Abs.gf','w') as fa, \
         open('lexicon.tsv','w') as tsv:
        fr.write('resource Res'+lang_code+' = {\n')
        fr.write('\n')
        fc.write('concrete Cat'+lang_code+' of Cat = open Res'+lang_code+' in {\n')
        fc.write('\n')
        fd.write('concrete Dict'+lang_code+' of Dict'+lang_code+'Abs = Cat'+lang_code+' ** open Res'+lang_code+', Prelude in {\n')
        fd.write('\n')
        fa.write('abstract Dict'+lang_code+'Abs = Cat ** {\n')
        fa.write('\n')
        for tag, (cat_name, types) in lin_types.items():
            pdefs = defaultdict(set)
            fc.write('lincat '+cat_name+' = '+tag.title()+' ;\n')

            for i,(typ,lexemes) in enumerate(sorted(types.items(),key=lambda x: -len(x[1]))):
                type_name = tag.title()+(str(i) if i else "")
                n_forms = len(lexemes[0][1])


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
                fr.write(' -> '+type_name+' =\n')
                vars = ['f'+str(i) for i in range(1,n_forms+1)]
                fr.write('       \\'+','.join(vars)+' ->\n')
                fr.write('          '+typ.renderOper(10,vars)+" ;\n")
                fr.write('\n')
                for ident,forms in lexemes:
                    fa.write('fun '+escape(ident)+' : '+cat_name+' ;\n')
                    fd.write('lin '+escape(ident)+' = mk'+type_name+' '+' '.join(('"'+form+'"' if form != '-' else 'nonExist') for form in forms)+' ;\n')
                    tsv.write(ident+'\t'+'\t'.join(forms)+'\n')

            fr.write('\n')
        fa.write('\n')
        fa.write('}\n')
        fd.write('\n')
        fd.write('}\n')
        fc.write('\n')
        fc.write('}\n')
        fr.write('\n')
        fr.write('}\n')

    with open(f"data/{lang}/lexicon.pickle", "wb") as f:
        pickle.dump((lang_code,lin_types),f)

    print(getrusage(RUSAGE_SELF))
