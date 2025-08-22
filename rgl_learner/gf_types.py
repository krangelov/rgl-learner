from dataclasses import dataclass
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