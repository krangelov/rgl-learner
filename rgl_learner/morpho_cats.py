import pickle
from dataclasses import dataclass
import rgl_learner.plugins as plugins

param_order = [
  'comparative',
  'superlative',
  'Species',
  'Distance',
  'Case',
  'count-form',
  'pluperfect',
  'Tense',
  'imperative',
  'Number',
  'Person',
  'mutation'
]

class GFType:
    def printParamDefs(self,f,pdefs):
        pass

@dataclass(frozen=True)
class GFStr(GFType):
    def __repr__(self):
        return "Str"

    def renderOper(self,indent,vars):
        return vars.pop(0)

@dataclass(frozen=True)
class GFParamType(GFType):
    name: str
    constructors: tuple # [GFParamConstr]

    def __repr__(self):
        return self.name

    def printParamDefs(self,f,pdefs):
        pdef = "param "+self.name+" = "+" | ".join(str(constructor) for constructor in self.constructors)+" ;\n"
        for constructor in self.constructors:
            constructor.printParamDefs(f,pdefs)
        if pdef not in pdefs:
            f.write(pdef)
            pdefs.add(pdef)

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

    def printParamDefs(self,f,pdefs):
        for lbl,ty in self.fields:
           ty.printParamDefs(f,pdefs)


def getTypeOf(source_plugin,o):
    if type(o) is str:
        return GFStr(),[o]
    else:
        table  = {}
        record = []
        pcons  = []
        params = source_plugin.params
        params_keys = list(params.keys())
        for tag,val in o.items():
            val_type, forms = getTypeOf(source_plugin,val)

            param = source_plugin.params.get(tag)
            if param == None:
                table = None
            else:
                param_con, arg_type = param
                pcons.append((param_con,params_keys.index(tag) or 10000,forms))

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
            record.sort(key=lambda p: p[0] or "Z")
            forms = sum((forms for _, _, forms in record), [])
            fields = tuple(((tag, val_type) for tag, val_type, _  in record))
            return GFRecord(fields), forms

def get_order(source_plugin,tag):
    try:
        return param_order.index(source_plugin.params.get(tag,(None,tag))[1])
    except:
        return 10000000

def learn(source,lang):
    source_plugin = plugins[source]
    lang_plugin   = plugins[source,lang]

    lexicon=source_plugin.extract(lang)

    lin_types = {}
    for word, pos, forms in lexicon:
        if lang_plugin.filter_lemma(word,pos):
            continue

        table = {}
        for w,tags in forms:
            tags = [tag for tag in tags if tag not in source_plugin.ignore_tags]
            tags = sorted(tags,key=lambda tag: get_order(source_plugin,tag))

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

        if table:
            pos = lang_plugin.patchPOS(pos,table)
            cat_name = source_plugin.tag2cat.get(pos)
            if not cat_name:
                continue
            lang_plugin.patch_inflection(cat_name,table)

            if table:
                typ, forms = getTypeOf(source_plugin,table)
                lin_types.setdefault(pos,{}).setdefault(typ,[]).append((word,forms))

    pdefs = set()
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
        for tag, types in lin_types.items():
            cat_name = source_plugin.tag2cat.get(tag)
            if not cat_name:
                continue

            fc.write('lincat '+cat_name+' = '+tag.title()+' ;\n')

            for i,(typ,lexemes) in enumerate(sorted(types.items(),key=lambda x: -len(x[1]))):
                type_name = tag.title()+(str(i) if i else "")
                n_forms = len(lexemes[0][1])

                typ.printParamDefs(fr,pdefs)

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

                # make them unique
                d = {}
                for lexeme,forms in lexemes:
                    d.setdefault(lexeme,[]).append(forms)

                for lexeme,forms_list in d.items():
                    for i,forms in enumerate(forms_list):
                        if not table:
                            continue

                        if len(forms_list) == 1:
                            ident = lexeme+'_'+cat_name
                        else:
                            ident = lexeme+'_'+str(i+1)+'_'+cat_name

                        fa.write('fun \''+ident+'\' : '+cat_name+' ;\n')
                        fd.write('lin \''+ident+'\' = mk'+type_name+' '+' '.join(('"'+form+'"' if form != '-' else 'nonExist') for form in forms)+' ;\n')
                        tsv.write(lexeme+'_'+cat_name+'\t'+'\t'.join(forms)+'\n')

            fr.write('\n')
        fa.write('\n')
        fa.write('}\n')
        fd.write('\n')
        fd.write('}\n')
        fc.write('\n')
        fc.write('}\n')
        fr.write('\n')
        fr.write('}\n')
