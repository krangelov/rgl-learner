import pickle
from dataclasses import dataclass

tag2cat = {
  'noun': 'N',
  'verb': 'V',
  'adj': 'A',
  'name': 'PN',
  'pron': 'Pron',
  'adv': 'Adv',
  'det': 'Det'
  }

params = {
  'definite': ('Def','Species'),
  'indefinite': ('Indef','Species'),
  'singular': ('Sg','Number'),
  'plural': ('Pl','Number'),
  'nominative': ('Nom','Case'),
  'accusative': ('Acc','Case'),
  'dative': ('Dat','Case'),
  'genitive': ('Gen','Case'),
  'vocative': ('Voc','Case'),
  'partitive': ('Part','Case'),
  'inessive': ('Iness','Case'),
  'elative': ('Elat','Case'),
  'illative': ('Illat','Case'),
  'adessive': ('Adess','Case'),
  'ablative': ('Ablat','Case'),
  'allative': ('Allat','Case'),
  'essive': ('Ess','Case'),
  'translative': ('Transl','Case'),
  'instructive': ('Instr','Case'),
  'abessive': ('Abess','Case'),
  'comitative': ('Comit','Case'),
  'possessive': ('Poss','Case'),
  'locative': ('Loc','Case'),
  'copulative': ('Cop','Case'),
  'unspecified': ('Unspecified','Distance'),
  'proximal': ('Proximal','Distance'),
  'distal': ('Distal','Distance'),
  'first-person': ('P1','Person'),
  'second-person': ('P2','Person'),
  'third-person': ('P3','Person'),
  'imperfective': ('Imperf','Tense'),
  'imperfect': ('Imperfect','Tense'),
  'aorist': ('Aorist','Tense'),
  'perfect': ('Perf','Tense'),
  'present': ('Pres','Tense'),
  'masculine': ('Masc','Gender'),
  'feminine': ('Fem','Gender'),
  'neuter': ('Neuter','Gender'),
}

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


ignore_tags = ['adjective', 'canonical', 'diminutive', 'romanization', 'table-tags', 'inflection-template']

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

    def __or__(self, other):
        if type(other) is not GFParam:
            raise "Parameter types can only be unified with other parameter types"
        if self.name != other.name:
            raise "Parameter types can only be unified if their names match"

        constructors = list(self.constructors)
        for c in other.constructors:
            if c not in constructors:
                constructors.append(c)

        return GFParam(self.name,constructors)

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

    def __or__(self, other):
        if type(other) is not GFTable:
            raise "Tables can only be unified with other tables"

        index1 = param_order.index(self.arg_type.name)
        index2 = param_order.index(other.arg_type.name)
        
        if index1 == index2:
            return GFTable(self.arg_type | other.arg_type,
                           self.res_type | other.res_type)
        elif index1 < index2:
            return GFTable(self.arg_type,
                           self.res_type | other)   
        else:
            return GFTable(other.arg_type,
                           self | other.res_type)


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

    def __or__(self, other):
        if type(other) is not GFRecord:
            raise "Records can only be unified with other records"

        fields = {}
        for lbl,ty in self.fields:
            other_ty = other.fields.get(lbl)
            if other_ty:
                ty |= other_ty
            fields[lbl] = ty
        for lbl,ty in other.fields.items():
            if lbl not in self.fields:
                fields[lbl] = ty

        return GFRecord(fields)

def getTypeOf(o):
    if type(o) is str:
        return GFStr()
    else:
        table  = {}
        record = []
        pcons  = []
        for tag,val in o.items():
            param = params.get(tag)
            if param == None:
                table = None
            else:
                param_con, arg_type = param
                pcons.append(param_con)
            val_type = getTypeOf(val)
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

def get_order(tag):
    try:
        return param_order.index(params.get(tag,(None,tag))[1])
    except:
        return 10000000

lin_types = {}
# the file should come from https://kaikki.org/dictionary/rawdata.html

iso3 = {
    "mk": "Mkd",
    "sq": "Alb",
    "id": "Ind"
}

def learn(lang):
    with open(f"data/{lang}/lexicon.pickle", "rb") as f:
        lexicon=pickle.load(f)

    for record in lexicon:
        table = {}
        word  = record["word"]
        forms = []
        for form in record.get("forms",[]):
            w    = form["form"]
            tags = form.get("tags",[])
            tags = [tag for tag in tags if tag not in ignore_tags]
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
            typ = getTypeOf(table)
            lin_types.setdefault(record.get("pos"),{}).setdefault(typ,[]).append((word,forms))

    pdefs = set()
    lang_code = iso3.get(lang,lang)
    with open('Res'+lang_code+'.gf','w') as fr, \
         open('Cat'+lang_code+'.gf','w') as fc, \
         open('Dict'+lang_code+'.gf','w') as fd, \
         open('Dict'+lang_code+'Abs.gf','w') as fa:
        fr.write('resource Res'+lang_code+' = {\n')
        fr.write('\n')
        fc.write('concrete Cat'+lang_code+' of Cat = open Res'+lang_code+' in {\n')
        fc.write('\n')
        fd.write('concrete Dict'+lang_code+' of Dict'+lang_code+'Abs = Cat'+lang_code+' ** open Res'+lang_code+' {\n')
        fd.write('\n')
        fa.write('abstract Dict'+lang_code+'Abs = Cat ** {\n')
        fa.write('\n')
        for tag, types in lin_types.items():
            cat_name = tag2cat.get(tag)
            if not cat_name:
                continue

            fc.write('lincat '+cat_name+' = '+tag.title()+' ;\n')

            unified_type = None
            for typ in types:
                if unified_type:
                    unified_type |= typ
                else:
                    unified_type = typ

            unified_type.printParamDefs(fr,pdefs)
            fr.write('oper '+tag.title()+' = '+str(unified_type)+' ; -- \n')

            for i,(typ,lexemes) in enumerate(sorted(types.items(),key=lambda x: -len(x[1]))):
                type_name = tag.title()+str(i+1)
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
