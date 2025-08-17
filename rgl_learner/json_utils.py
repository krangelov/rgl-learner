from rgl_learner.gf_types import GFParamType, GFParamValue
from rgl_learner.learn_paradigms import Paradigm
import json 
from collections import defaultdict
from rgl_learner.utils import *

def reverse_fun(fun):
    forms = []
    funname = None
    if isinstance(fun["arg"], list):
        forms.append(" ".join(fun["arg"]).lower())
    elif isinstance(fun["arg"], dict):
        if "qc" in fun["arg"]:
            forms.append(GFParamValue(value=fun["arg"]["qc"], typ=paramTypes["Gender"]))
        if "q" in fun["arg"] and fun["arg"]["q"] == "nonExist":
            forms.append("-")
    else:
        forms.append(fun["arg"].lower())
    if "q" in fun["fun"]:
        funname = fun["fun"]["q"]
    else:
        forms_, funname = reverse_fun(fun["fun"])
        forms.extend(forms_)
    return forms, funname
    

def read_json_data(lang, langcode, dir="data"):
    with open(f"data/{lang}/Morpho{langcode}.json") as f:
        morpho = json.load(f)
    with open(f"data/{lang}/Dict{langcode}Abs.json") as f:
        d = json.load(f)
    with open(f"data/{lang}/Lexicon{langcode}.json") as f:
        lexicon = json.load(f)

    params = defaultdict(list)
    for k,v in morpho[f"Res{langcode}"]["jments"].items():
        if "paramtype" in v:
            if "res" in v["paramtype"]:
                paramname = v["paramtype"]["res"]["qc"]
            else:
                paramname = v["paramtype"]["qc"]
            
            params[paramname].append(k)

    paramTypes = defaultdict()
    for k, v in params.items():
        paramTypes[k] = GFParamType(k, constructors=v)

    tables = {}
    for pos in morpho[f"Cat{langcode}"]["jments"]:
        i = 1 
        funname = f"mk{pos}{i:03}"
        pars = []
        while funname in morpho[f"Morpho{langcode}"]["jments"]:
            
            p2 = morpho[f"Morpho{langcode}"]["jments"][funname]["operdef"]
        
            while "body" in p2:
                p2 = p2["body"]


            pattern2 = find_pattern(p2)

            while "body" in p2:
                p2 = p2["body"]

            if pattern2:
                forms = get_forms(p2["select"])
            else:
                forms = get_forms(p2)

            typ2 = reverse_dict(forms)
            
            

            forms_2 = [("+".join(x), False) for x in get_values(forms)]
            
            #print(forms_2)

            words = get_words(d, funname, get_values(forms), langcode)
            
            t2 = dict(words)
            tables2 = []
            for word in t2:
                words = reverse_fun(lexicon[f"Lexicon{langcode}"]["jments"][word]["lin"])[0][::-1]
                tables2.append((word, words))
    

            i += 1 
            funname = f"mk{pos}{i:03}"
            p = Paradigm(pattern=pattern2, tables=tables2, 
                         typ_dict=typ2, forms=forms_2,
                         typ=None, var_insts=words)
            pars.append(p)


            if pars and funname not in morpho[f"Morpho{langcode}"]["jments"]:
                tables[pos] = pars

    return tables
    
def find_pattern(par):
    if "select" in par:
        p = par["select"]["tblcases"][0][0]
        if "record" in p:
            pattern = []
            for k, v in p.items():
                if isinstance(v, dict) or isinstance(v, str):
                    pattern.extend(parse_pattern(v))
        else:
            pattern = parse_json_pattern(p)
        return pattern

def parse_json_pattern(pat):
    def parse_alt(patt):
        alts = []
        for k, v in patt.items():
            if k.startswith("alt"):
               if isinstance(v, str):
                   alts.append(f'"{v}"')
               elif isinstance(v, dict) and "alt1" in v:
                   alts.extend(parse_alt(v))
               elif "char" in v:
                   alts.append(1)
               elif "chars" in v:
                   alts.extend(['"'+x+'"' for x in list(v["chars"])])
               else:
                   p1 = len(parse_json_pattern(v)[0])
                   alts.append(p1)
        return alts


        
    def parse_branch(patt, num):
        p = []
        if isinstance(patt, dict):
            if "pv" in patt:
                p.append(patt["pv"])
            elif "as" in patt:
                if "alt1" in patt["patt"]:
                    qmarks = parse_alt(patt["patt"])
                else:
                    qmarks = num["Just"]
                base = [patt["as"], qmarks]
                p = base
            elif "char" in patt:
                p.append(["?",]*num["Just"])
            else:
                res = parse_json_pattern(patt)
                if res:
                    p.extend(res)
        else:
            p.append(f'"{patt}"',)
        return p
    
    if isinstance(pat, dict):
        p = []
        if "patt1" in pat:
            patt1 = pat.get("patt1")
            max1 = pat.get("max1", {})
            patt2 = pat.get("patt2")
            max2 = pat.get("max2", {})
    
            p1 = parse_branch(patt1, max1)
      
            p2 = parse_branch(patt2, max2)
    
            
            if isinstance(p1[0], str) and (p1[0].startswith("base") or p1[0].startswith("pat")):
                p1 = [p1,]
            elif isinstance(p1[0], list) and len(p1[0]) > 1:
                p1 = p1[0]
            if isinstance(p2[0], str) and (p2[0].startswith("base") or p2[0].startswith("pat")):
                p2 = [p2,]
            p = p1 + p2
        elif "pv" in pat:
            p = [[pat["pv"],],]

    else:
        p = ['"'+pat+'"',]
    return [p, ]

def get_forms(p):
    def parse_one(g):
        fs = []
        if isinstance(g, str):
            fs.append(f'"{g}"')
        elif isinstance(g, list):
            fs.append(f'"{' '.join(g)}"')
        elif "vr" in g:
            fs.append(g["vr"])
        else:
            fs.extend(parse_form(g))
        
        return fs
            
    def parse_form(gl):

        if isinstance(gl, str):
            return [gl,]
        elif isinstance(gl, list):
            return " ".join(gl)
        else:
            glue1 = gl.get("glue1")
            glue2 = gl.get("glue2")
            g1 = []
            g2 = []
            
            if glue1:
                g1 = parse_one(glue1)
    
            if glue2:
                g2 = parse_one(glue2)
            
            return g1 + g2 


 
    patterns = {}
    #print(p, "\n")
    for k, v in p.items():
        if k == "record":
            ps_forms = []
            patterns.update(get_forms(v))
        elif k == "tblcases":
            for (form, tbls) in v:
                if "tblcases" in tbls:
                    if "pc" in form:
                        patterns[form["pc"]] = get_forms(tbls)
                    else:
                        patterns[form["pv"]] = get_forms(tbls)
                elif isinstance(tbls, dict) and "vr" in tbls:
                    if "pc" in form:
                        patterns[form["pc"]] = [tbls["vr"],]
                    elif "pv" in form:
                        patterns[form["pv"]] = [tbls["vr"],]
                elif "patt1" in form:
                    patterns.update(get_forms(tbls))
                elif "pc" in form:
                    if form["args"]: 
                        f = f"('{form['pc']}', {form['args'][0]['pc']})"
                    else: 
                        f = form["pc"]
                    if "record" in tbls:
                        patterns[f] = get_forms(tbls)
                    else:
                        patterns[f] = parse_form(tbls)
         
                #elif "pv" in form:
                #    patterns[form["pv"]] = parse_form(tbls)
                elif "fun" not in tbls:
                    patterns.update(get_forms(tbls))
                #else:
                #    print(form, tbls, "\n")
                
        elif k == "implicit":
            pass
        elif "glue1" in v:
            patterns[k] = parse_form(v)
        elif isinstance(v, dict):
            if "vr" in v:
                patterns[k] = [v["vr"],]
            elif "qc" in v:
                patterns[k] = v["qc"]
            elif "q" in v:
                patterns[k] = v["q"]
            elif "body" in v:
                patterns[k] = get_forms(v["body"])
            else:
                patterns[k] = get_forms(v)
        else:
            patterns[k] = v
           # pass
    
    #return dict(sorted(patterns.items(), key=lambda x: x[0]))
    return patterns

def get_values(d):
    forms = []
    for k, v in d.items():
  
        if isinstance(v, dict):
            forms.extend(get_values(v))
        else:
            forms.append(v)
    return forms

def get_words(d, par, forms, langcode):
    ws = []
    for word, args in d[f"Dict{langcode}"]["jments"].items():
        if "_" in word:
            lemma, pos = word.split("_", maxsplit=1)
            if "_" in pos:
                pos = pos.split("_")[-1]
            base = []
            lin = args["lin"]
            fun = None
            while "fun" in lin:
                base.append(lin["arg"])
                lin = lin["fun"]
                if "q" in lin:
                    fun = lin["q"]
            if fun == par:
                ws.append((word, base))

    dictionary = []
    for (lemma, word) in ws:
        all_forms = []
        if isinstance(word, list):
            bases = {f"base_{i+1}": w for i, w in enumerate(word)}
        elif "base_1" in forms[0]: 
            bases = {"base_1" : word}
        else:
            bases = {"base" : word}
        dictionary.append((lemma, bases))
    return dictionary