import pickle
from dataclasses import dataclass
import rgl_learner.plugins as plugins

param_order = [
  'Species',
  'Distance',
  'Case',
  'count-form',
  'multiword-construction',
  'Tense',
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
class GFParam(GFType):
    name: str
    constructors: tuple[str]

    def __repr__(self):
        return self.name

    def printParamDefs(self,f,pdefs):
        pdef = "param "+self.name+" = "+" | ".join(self.constructors)+" ;\n"
        if pdef not in pdefs:
            f.write(pdef)
            pdefs.add(pdef)

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
            s += ' '*(indent+2)+pcon+' => '+self.res_type.renderOper(indent+len(pcon)+6,vars)
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
        return GFStr()
    else:
        table  = {}
        record = []
        pcons  = []
        for tag,val in o.items():
            param = source_plugin.params.get(tag)
            if param == None:
                table = None
            else:
                param_con, arg_type = param
                pcons.append(param_con)
            val_type = getTypeOf(source_plugin,val)
            if table != None:
                old_type = table.get(arg_type)
                if old_type and old_type != val_type:
                    table = None
                else:
                    table[arg_type] = val_type
            record.append((tag,val_type))

        if table and len(table) == 1:
            arg_type,val_type = table.popitem()
            return GFTable(GFParam(arg_type,tuple(pcons)),val_type)
        else:
            return GFRecord(tuple(record))

def getFormsOf(o):
    forms = []
    def append_forms(o):
        nonlocal forms
        if type(o) is str:
            forms.append(o)
        else:
            for tag,val in o.items():
                append_forms(val)
    append_forms(o)
    return forms

def get_order(source_plugin,tag):
    try:
        return param_order.index(source_plugin.params.get(tag,(None,tag))[1])
    except:
        return 10000000

def learn(source,lang):
    with open(f"data/{lang}/lexicon.pickle", "rb") as f:
        lexicon=pickle.load(f)

    source_plugin = plugins[source]
    lang_plugin   = plugins[source,lang]

    lin_types = {}
    for record in lexicon:
        table = {}
        word  = record["word"]
        for form in record.get("forms",[]):
            w    = form["form"]
            tags = form.get("tags",[])
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
            cat_name = source_plugin.tag2cat.get(record.get("pos"))
            if not cat_name:
                continue
            lang_plugin.patch_inflection(cat_name,table)

            typ   = getTypeOf(source_plugin,table)
            forms = getFormsOf(table)
            lin_types.setdefault(record.get("pos"),{}).setdefault(typ,[]).append((word,forms))

    pdefs = set()
    lang_code = lang_plugin.iso3
    with open('Res'+lang_code+'.gf','w') as fr, \
         open('Cat'+lang_code+'.gf','w') as fc, \
         open('Dict'+lang_code+'.gf','w') as fd, \
         open('Dict'+lang_code+'Abs.gf','w') as fa:
        fr.write('resource Res'+lang_code+' = {\n')
        fr.write('\n')
        fc.write('concrete Cat'+lang_code+' of Cat = open Res'+lang_code+' in {\n')
        fc.write('\n')
        fd.write('concrete Dict'+lang_code+' of Dict'+lang_code+'Abs = Cat'+lang_code+' ** open Res'+lang_code+' in {\n')
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

                for lexeme,forms in lexemes:
                    fa.write('fun \''+lexeme+'_'+cat_name+'\' : '+cat_name+' ;\n')
                    fd.write('lin \''+lexeme+'_'+cat_name+'\' = mk'+type_name+' '+' '.join(('"'+form+'"' if form != '-' else 'nonExist') for form in forms)+' ;\n')

            fr.write('\n')
        fa.write('\n')
        fa.write('}\n')
        fd.write('\n')
        fd.write('}\n')
        fc.write('\n')
        fc.write('}\n')
        fr.write('\n')
        fr.write('}\n')
