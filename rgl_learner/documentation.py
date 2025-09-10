import json
import pickle
from rgl_learner.gf_types import GFRecord, GFTable, GFParamType, GFParamConstr, GFStr

def sizeOf(ty):
    size = 0
    match ty:
        case GFRecord(fields):
            for lbl,ty in fields:
                size += sizeOf(ty)
        case GFTable(arg_type,res_type):
            size = len(list(arg_type.renderValues(0))) * sizeOf(res_type)
        case GFStr():
            size = 1
    return size

def parens(d1,d2,expr):
    if d1 < d2:
        return '('+expr+')'
    else:
        return expr

def render(top,ty,d,expr):
    s = ""
    match ty:
        case GFRecord(fields):
            first = True
            for lbl,ty in fields:
                size = sizeOf(ty)
                if size > 0:
                    if not first:
                        s += " ++\n"
                    if size == 1:
                        th = "th"
                    else:
                        th = f'intagAttr "th" "rowspan=\\"{size}\\""'
                    if top:
                        s += '           tr ('+th+' \"'+str(lbl)+'"'+render(False,ty,2,parens(d,2,expr)+'.'+lbl)
                    else:
                        s += ' ++ '+th+' \"'+str(lbl)+'"'+render(False,ty,2,parens(d,2,expr)+'.'+lbl)
                    top   = True
                    first = False
        case GFTable(arg_type,res_type):
            size = sizeOf(res_type)
            if size == 1:
                th = "th"
            else:
                th = f'intagAttr "th" "rowspan=\\"{size}\\""'

            first = True
            for value in arg_type.renderValues(0):
                if not first:
                    s += " ++\n"
                if top:
                    s += '           tr ('+th+' "'+str(value)+'"'+render(False,res_type,1,parens(d,1,expr)+" ! "+str(value))
                else:
                    s += ' ++ '+th+' "'+str(value)+'"'+render(False,res_type,1,parens(d,1,expr)+" ! "+str(value))
                top   = True
                first = False
        case GFStr():
            s = " ++ td ("+expr+"))"
    return s

def json2context(gr,cnc,json):
    return tuple(json2typ(gr,cnc,hypo["type"]) for hypo in json)

def json2typ(gr,cnc,json):
    if (rectype := json.get("rectype")) != None:
        return GFRecord(tuple((key,json2typ(gr,cnc,value)) for key, value in rectype.items()))
    elif (tblhypo := json.get("tblhypo")) and (tblres := json.get("tblres")):
        return GFTable(json2typ(gr,cnc,tblhypo),json2typ(gr,cnc,tblres))
    elif (mod := json.get("mod")) and (paramtype := json.get("qc")):
        constrs = tuple(GFParamConstr(param["id"],json2context(gr,cnc,param["context"])) for param in gr[mod]["jments"][paramtype]["params"])
        return GFParamType(paramtype,constrs)
    elif (sort := json.get("sort")) and sort == "Str":
        return GFStr()
    else:
        raise RuntimeError("Unsupported type "+str(json))

def learn(lang, from_source=False):
    if from_source:
        source, langcode, lexicon = "json", lang, {}
        with open("Lang.json") as f:
            gr  = json.load(f)
            cnc = gr[f"Lang{lang}"]["jments"]
            for name,jment in cnc.items():
                if lintype := jment.get("lintype"):
                    typ = json2typ(gr,cnc,lintype)
                    lexicon[name] = (name, {typ: []})
    else:
        with open(f"data/{lang}/lexicon.pickle", "rb") as f:
            langcode, source, lexicon = pickle.load(f)
    print(source, langcode)
    with open(f"data/{lang}/Documentation{langcode}.gf", "w") as d:
        d.write(f"concrete Documentation{langcode} of Documentation = Cat{langcode} ** open\n")
        d.write(f"  Res{langcode}, Prelude, HTML in {{\n")
        d.write("\n")
        d.write("lincat\n")
        d.write("  Inflection = {t : Str; s1,s2,s3 : Str} ;\n")
        d.write("  Definition = {s : Str} ;\n")
        d.write("  Document   = {s : Str} ;\n")
        d.write("  Tag        = {s : Str} ;\n")
        d.write("\n")

        for pos_tag, (cat_name, table) in lexicon.items():
            if len(table) > 1:
                print("Warning: the inflection tables are not unified yet, using the first one")
            typ,lexemes = next(iter(table.items()))
            d.write(f"lin Inflection{cat_name} = \\x -> {{\n      t=\"{pos_tag.lower()}\" ;\n      s1=\"\" ;\n      s2=frameTable (\n{render(True,typ,3,'x')}) ;\n      s3=[]\n    }} ;\n")
            
        d.write('lin\n')
        d.write('NoDefinition   t     = {s=t.s};\n')
        d.write('MkDefinition   t d   = {s="<p><b>Definition:</b>"++t.s++d.s++"</p>"};\n')
        d.write('MkDefinitionEx t d e = {s="<p><b>Definition:</b>"++t.s++d.s++"</p><p><b>Example:</b>"++e.s++"</p>"};')
        d.write('')
        d.write('lin')
        d.write('  MkDocument d i e = {s = i.s1 ++ d.s ++ i.s2 ++ i.s3 ++ e.s} ;')
        d.write('  MkTag i = {s = i.t} ;')

        d.write("}\n")

    with open(f"Lang{langcode}.gf", "w") as f:
        f.write("--# -path=.:../abstract\n")
        f.write(f"concrete Lang{langcode} of Lang =\n")
        f.write(f"  Lexicon{langcode}\n")
        f.write(f"  ,Documentation{langcode} --# notpresent\n")
        f.write("  ** {\n")
        f.write("\n")
        f.write("flags startcat = Phr ;\n")
        f.write("\n")
        f.write("}")
