import codecs
import json
import sys
import copy
import os
import itertools
import re
from functools import reduce
from dataclasses import dataclass
import pickle
from collections import defaultdict, Counter
import math
import rgl_learner.plugins as plugins
from rgl_learner.utils import escape, reverse_dict, read_json_paradigms
from pprint import  pprint
# Wordgraph class to extract LCS

class wordgraph(object):

    """Convert word w to directed graph that contains all subsequences of w."""
    @classmethod
    def wordtograph(cls, word):
        trans = {}
        for i in range(len(word)):
            for j in range(i,len(word)):
                if (i,word[j]) not in trans:
                    trans[(i,word[j])] = j+1
        grph = cls(trans)
        return grph

    """Simple directed graph class where graphs are special types of automata
       where each state is a final state.
       This is used to quickly find the LCS of a large number of words by
       first converting each word w to an automaton that accepts all substrings
       of w.  Then the automata can be intersected with __and__, and the
       longest path(s) extracted from the result with _maxpath().
    """

    def __init__(self, transitions):
        self.alphabet = {symbol for (state,symbol) in transitions}
        self.states = {state for (state,symbol) in transitions} | set(transitions.values())
        self.transitions = transitions
        self.revtrans = {}
        for (state,sym) in self.transitions:
            if self.transitions[(state,sym)] in self.revtrans:
                self.revtrans[self.transitions[(state,sym)]] |= {(state,sym)}
            else:
                self.revtrans[self.transitions[(state,sym)]] = {(state,sym)}

    def __getattr__(self, attr):
        if attr == 'longestwords':
            self._maxpath()
            return self.longestwords
        raise AttributeError("%r object has no attribute %r" % (self.__class__, attr))

    def __and__(self, other):
        return self.intersect(other)

    def intersect(self, other):
        """Calculate intersection of two directed graphs."""
        alphabet = self.alphabet & other.alphabet
        stack = [(0,0)]
        statemap = {(0,0):0}
        nextstate = 1
        trans = {}
        while len(stack) > 0:
            (asource,bsource) = stack.pop()
            for sym in alphabet:
                if (asource, sym) in self.transitions and (bsource, sym) in other.transitions:
                    atarget = self.transitions[(asource, sym)]
                    btarget = other.transitions[(bsource, sym)]
                    if (atarget,btarget) not in statemap:
                        statemap[(atarget,btarget)] = nextstate
                        nextstate += 1
                        stack.append((atarget,btarget))
                    trans[(statemap[(asource,bsource)], sym)] = statemap[(atarget,btarget)]

        return wordgraph(trans)

    def _backtrace(self, maxsources, maxlen, state, tempstring):
        if state not in self.revtrans:
            tempstring.reverse()
            self.longestwords.append("".join(tempstring))
            return
        for (backstate, symbol) in self.revtrans[state]:
            if maxlen[backstate] == maxlen[state] - 1:
                self._backtrace(maxsources, maxlen, backstate, tempstring + [symbol])

    def _maxpath(self):
        """Returns a list of strings that represent the set of longest words
           accepted by the automaton."""
        tr = {}
        # Create tr which simply has graph structure without symbols
        for (state,sym) in self.transitions:
            if state not in tr:
                tr[state] = set()
            tr[state].update({self.transitions[(state,sym)]})

        S = {0}
        maxlen = {}
        maxsources = {}
        for i in self.states:
            maxlen[i] = 0
            maxsources[i] = {}

        step = 1
        while len(S) > 0:
            Snew = set()
            for state in S:
                if state in tr:
                    for target in tr[state]:
                        if maxlen[target] < step:
                            maxsources[target] = {state}
                            maxlen[target] = step
                            Snew.update({target})
                        elif maxlen[target] == step:
                            maxsources[target] |= {state}
            S = Snew
            step += 1

        endstates = [key for key,val in list(maxlen.items()) if val == max(maxlen.values())]
        self.longestwords = []
        for w in endstates:
            self._backtrace(maxsources, maxlen, w, [])

###############################################################################



def longest_variable(string):
    if type(string) != str:
        return 0
    thislen = 0
    maxlen = 0
    inside = 0
    for s in string:
        if inside and s != u']':
            thislen += 1
        elif s == u']':
            inside = 0
            maxlen = max(thislen, maxlen)
        elif s == u'[':
            inside = 1
            thislen = 0
    return maxlen

def count_infix_segments(string):
    """Counts total number of infix segments, ignores @-strings."""
    if type(string) != str:
        return 0
    if u'[' not in string:
        return 0
    if u'@' in string:
        return 0
    nosuffix = re.sub(r'\][^\]]*$',']',string)
    noprefix = re.sub(r'^[^\[]*\[','[',nosuffix)
    nobrackets = re.sub(r'\[[^\]]*\]','',noprefix)
    return len(nobrackets)

def count_infixes(string):
    """Counts total number of separate infix occurrences."""
    totalinfixes = 0
    infix = 0
    runninginfixcount = 0
    totalinfixes = 0
    for idx, val in enumerate(string):
        if val == u'[':
            infix = 0
            totalinfixes += runninginfixcount
            runninginfixcount = 0
        elif val != u']' and infix:
            runninginfixcount += 1
        elif val == u']':
            infix = 1
    return totalinfixes


def string_to_varstring(string, vars):
    if type(string) != str:
        return str(string)
    if string == "-":
        return "nonExist"
    varpos = 0
    s = []
    idx = 0
    while idx < len(string):
        if string[idx] == '[':
            if idx != 0:
                s.append('"+')
            idx += 1
            while string[idx] != ']':
                idx += len(vars[varpos])
                s.append(f"base_{varpos+1}")
                if idx < len(string) - 1:
                    s.append('+')
                varpos += 1
            if idx < len(string) - 1:
                s.append('"')
            idx += 1
        else:
            if idx == 0:
                s.append('"')
            s.append(string[idx])
            idx += 1
            if idx >= len(string):
                s.append('"')

    return ''.join(s)


def lcp(lst):
    """Returns the longest common prefix from a list."""
    if not lst: return ''
    cleanlst = [x.replace(u'[','').replace(u']','') for x in lst]
    s1 = min(cleanlst)
    s2 = max(cleanlst)
    for i, c in enumerate(s1):
        if c != s2[i]:
            return s1[:i]
    return s1

def firstvarmatch(string, prefix):
    """See if first var is exactly prefix."""
    if string[1:1+len(prefix)] == prefix:
        return True
    else:
        return False


def evalfact(lcs, c):
    """Input: a list of variable-bracketed strings, the known LCS
       Output: number of variables needed and the variables themselves in a list."""
    allbreaks = []
    for w in c:
        if type(w) != str:
            continue
        breaks = [0] * len(lcs)
        p = 0
        inside = 0
        for pos in w:
            if pos == u'[':
                inside = 1
            elif pos == u']':
                inside = 0
                breaks[p-1] = 1
            else:
                if inside:
                    p += 1

        allbreaks.append(breaks)
    finalbreaks = [0] * len(lcs)
    for br in allbreaks:
        for idx, val in enumerate(br):
            if val == 1:
                finalbreaks[idx] = 1

    # Extract vars
    vars = []
    currvar = u''
    for idx, val in enumerate(lcs):
        currvar += lcs[idx]
        if finalbreaks[idx] == 1:
            vars.append(currvar)
            currvar = u''

    numvars = sum(finalbreaks)
    return (numvars, vars)

def findfactors(word, lcs):
    """Recursively finds the different ways to place an LCS in a string."""

    if type(word) != str:
        return []

    word = list(word)
    lcs = list(lcs)
    factors = []

    def rec(word, lcs, posw, posl, inmatch, tempstring):
        if posw == len(word) and posl != len(lcs):
            return
        if posw != len(word) and posl == len(lcs):
            if inmatch:
                rec(word, lcs, posw + 1, posl, 0, tempstring + [u']'] + [word[posw]])
            else:
                rec(word, lcs, posw + 1, posl, 0, tempstring + [word[posw]])
            return

        if posw == len(word) and posl == len(lcs):
            if inmatch:
                factors.append("".join(tempstring + [u']']))
            else:
                factors.append("".join(tempstring))
            return

        if word[posw] ==  lcs[posl]:
            if inmatch:
                rec(word, lcs, posw + 1, posl + 1, 1, tempstring + [word[posw]])
            else:
                rec(word, lcs, posw + 1, posl + 1, 1, tempstring + [u'['] + [word[posw]])

        if inmatch:
            rec(word, lcs, posw + 1, posl, 0, tempstring + [u']'] + [word[posw]])
        else:
            rec(word, lcs, posw + 1, posl, 0, tempstring + [word[posw]])

    rec(word, lcs, 0, 0, 0, [])
    return factors[:]

def vars_to_string(varlist):
    vstr = [(f"base_{idx+1}", v) for idx, v in enumerate(varlist)]
    return vstr

@dataclass
class Paradigm:
    forms : list[str]
    typ : object
    var_insts : list[list[tuple[str,str]]]
    pattern : list[tuple]
    tables : list[tuple[str,list[str]]]
    typ_dict : dict[str, dict[str]] = None

    def compatible(self, other):
        if len(self.forms) != len(other.forms):
            return 0

        count = 0
        for i, form in enumerate(self.forms):
            other_form = other.forms[i][0] if isinstance(other.forms[i], tuple) else other.forms[i]
            if form not in ["nonExist","Masc","Fem","Neuter"] and other_form not in ["nonExist","Masc","Fem","Neuter"]:
                if form != other_form:
                    return 0
                count += 1

        return count

    def equivalent(self, other):
        if self.pattern != other.pattern:
            return False
        if len(self.forms) != len(other.forms):
            return False

        for i, form in enumerate(self.forms):
            if form[0] != other.forms[i][0]:
                return False

        return True

def collapse_tables(typ,tables):
    """Input: list of tables
       Output: Collapsed paradigms."""
    paradigms_set = {}
    paradigms     = []
    for ident,table,t in tables:
        key = tuple(t[1])
        p = paradigms_set.get(key)
        if not p:
            p = Paradigm(t[1], typ, [], [], [])
            paradigms_set[key] = p
            paradigms.append(p)
        p.var_insts.append(vars_to_string(t[2]))
        p.tables.append((ident,table))
    return paradigms


def merge_paradigms(paradigmlist):
    for i,p1 in enumerate(paradigmlist):
        possible_paradigms = []
        for j,p2 in enumerate(paradigmlist):
            if i != j:
                overlap = p1.compatible(p2)
                if overlap:
                    possible_paradigms.append((overlap,p2))
        possible_paradigms.sort(key=lambda x: x[0], reverse=True)

        forms = []
        for k, form in enumerate(p1.forms):
            if form == "nonExist":
                for overlap, p2 in possible_paradigms:
                    other_form = p2.forms[k][0] if isinstance(p2.forms[k], tuple) else p2.forms[k]
                    if other_form != "nonExist":
                        forms.append((other_form,True))
                        break
                else:
                    forms.append((form,False))
            else:
                forms.append((form,False))

        p1.forms = forms

 
    i = 0
    while i < len(paradigmlist):
        j = i+1
        while j < len(paradigmlist):
            if paradigmlist[i].equivalent(paradigmlist[j]):
                paradigmlist[i].var_insts += paradigmlist[j].var_insts
                paradigmlist[i].tables    += paradigmlist[j].tables

                for k in range(len(paradigmlist[i].forms)):
                    paradigmlist[i].forms[k] = (paradigmlist[i].forms[k][0]
                                               ,paradigmlist[i].forms[k][1] and paradigmlist[j].forms[k][1]
                                               )
                del paradigmlist[j]
            else:
                j += 1
        i += 1
    return paradigmlist

def ffilter_lcp(factorlist):
    flatten = lambda x: [y for l in x for y in flatten(l) if type(y)==str and y != "-"] if type(x) is list else [x]
    lcprefix = lcp(flatten(factorlist))
    factorlist = [[x for x in w if x == "-" or type(x) != str or firstvarmatch(x, lcprefix)] for w in factorlist]
    return factorlist

def ffilter_shortest_string(factorlist):
    return [[x for x in w if type(x) != str or len(x) == len(min(w, key=len))] for w in factorlist]

def ffilter_shortest_infix(factorlist):
    return [[x for x in w if count_infix_segments(x) == count_infix_segments(min(w, key=lambda x: count_infix_segments(x)))] for w in factorlist]

def ffilter_longest_single_var(factorlist):
    return [[x for x in w if longest_variable(x) == longest_variable(max(w, key=lambda x: longest_variable(x)))] for w in factorlist]

def ffilter_leftmost_sum(factorlist):
    return [[x for x in w if type(x)!=str or sum(i for i in range(len(x)) if x.startswith('[', i)) == min([sum(i for i in range(len(x)) if x.startswith('[', i)) for x in w])] for w in factorlist]


def filterbracketings(factorlist, functionlist, tablecap):
    numcombinations = lambda f: reduce(lambda x, y: x*len(y), f, 1)
    if numcombinations(factorlist) > tablecap:
        for filterfunc in functionlist:
            factorlist = filterfunc(factorlist)
            if numcombinations(factorlist) <= tablecap:
                break
    return factorlist

def learnparadigms(typ,inflectiontables):
    vartables = []
    TABLELIMIT = 16
    for ident, table in inflectiontables:
        table = [w.lower() if type(w) == str else w for w in table]
        wg = [wordgraph.wordtograph(w) for w in table if type(w)==str and w != "-"]
        if not wg:
            variabletable = ['nonExist' for form in table]
            vartables.append((ident, table, [(table,variabletable,[],0,0)]))
            continue
        result = reduce(lambda x, y: x & y, wg)
        lcss = result.longestwords
        if not lcss: # Table has no LCS - no variables
            variabletable = [string_to_varstring(form,[]) for form in table]
            vartables.append((ident, table, [(table,variabletable,[],0,0)]))
            continue

        combos = []
        for lcs in lcss:
            factorlist = [findfactors(w, lcs) or [w] for w in table]
            factorlist = filterbracketings(factorlist, (ffilter_lcp, ffilter_shortest_string, ffilter_shortest_infix, ffilter_longest_single_var, ffilter_leftmost_sum), TABLELIMIT)
            combinations = itertools.product(*factorlist)
            for c in combinations:
                (numvars, variablelist) = evalfact(lcs, c)
                infixcount = reduce(lambda x,y: x + count_infix_segments(y), c, 0)
                variabletable = [string_to_varstring(s, variablelist) for s in c]
                combos.append((c,variabletable,variablelist,numvars,infixcount))
        vartables.append((ident, table, combos))

    filteredtables = []
    for ident, values, t in vartables:
        besttable = min(t, key = lambda s: (s[3],s[4]))
        filteredtables.append((ident, values, besttable))


    paradigmlist = collapse_tables(typ,filteredtables)
    paradigmlist = merge_paradigms(paradigmlist)


    return paradigmlist


def correct_paradigms(lang, lang_plugin,cat,paradigms, level=None, 
                      allow_second_forms=True, n=1):
    def get_index(reverse_forms, required_forms):
        if reverse_forms[0].startswith("s;") and not required_forms[0].startswith("s;"):
            return reverse_forms.index("s;" + required_forms[0])
        elif not any(map(lambda x: x.startswith("s;"), reverse_forms)):
            new_form = re.sub("^s;", "", required_forms[0])
            return reverse_forms.index(new_form)
        else:
            return reverse_forms.index(required_forms[0])
        
    def get_pattern(form, lens, mult_base_words):
        pattern = []
        for elem in form.split('+'):
            l = lens.get(elem)
            elemRep = [] # representation of elements
            elemRep.append(elem)
            if elem[0] == '"' and elem[-1] == '"':   # this is a string
                pattern.append(elem)
            elif id(l) == id(maximum[1]):    # this is the variable segment
                pattern.append(elemRep)
            elif l and len(l) == 1:  # this is a base of a fixed length
                l = next(iter(l))
                elemRep.append(l)
                pattern.append(elemRep)
            elif l:                              # low-entropy variable
                max_count = max(count for count,forms in l.values())
                #pattern += "@("
                first = True
                max_count_l = None
                fs = []
                for l,[count,forms] in l.items():
                    if count == max_count and not max_count_l:
                        max_count_l = l
                    else:
                        fs.extend(['"'+form+'"' for form in forms])
                fs.append(max_count_l)
                
                elemRep.append(fs)
                pattern.append(elemRep)
            elif elem.startswith("pat"):
                pattern.append([elem])
            else:
                pattern = None
                if len(lens) > 1:
                    mult_base_words += 1
                break              # nonExist or a variable length base

       # if not pattern or pattern == ["base_1"]:
       #     pattern = None
        return pattern

    def rewrite_forms(forms, guessed, pats):
        new_forms = []
        found = None
        for form, _ in forms:
            if form != "-":
                f = copy.copy(form)
                for num, pat in pats:
                    if pat:
                        n = f"pat_{num}"
                        
                        f = f.replace(pat, n)
                        if (not found or found < num) and n in f:
                            found = num
            if "base" in f:
                return forms, None
            new_forms.append(f)
        return list(zip(new_forms, guessed)), found-1
    

    mult_base_words = 0
    
    if allow_second_forms: 
        second_forms = []
        for par in paradigms:
            required_forms = lang_plugin.required_forms.get(cat)
            reverse_forms = reverse_dict(par.typ.linearize())
            if required_forms:
                index = get_index(reverse_forms, required_forms)
            elif os.path.exists(f"{lang}_forms_{level}.json"): # temporary file
                with open(f"{lang}_forms_{level}.json") as f:
                    required_forms = json.load(f)
                index = get_index(reverse_forms, required_forms[cat])
            else:
                index = 0
            forms, _ = zip(*par.forms)
            if "base_2" in forms[index]:
                last_base = re.findall(r"base_\d", forms[index])[-1]
                p = re.compile(f"base_1.*{last_base}")
                pat1 = re.findall(p, forms[index])
                if pat1:
                    patterns = []
                    i = 0
                    for num, form in enumerate(forms):
                        pat2 = re.findall(rf"base_1.*{last_base}", form)
                        #if pat2:
                        #  print(pat2.group(0))
                        if pat2 and pat1[0] != pat2[0]:
                            pat2 = pat2[0]
                            if pat2 not in patterns:
                                patterns.append(pat2)
                                if len(second_forms) > i:
                                    second_forms[i].append(num)
                                else:
                                    second_forms.append([num,])
                                i += 1 
                            else: 
                                idx = patterns.index(pat2)
                                second_forms[idx].append(num)
                        

        if second_forms:
            second_index = []
            second_form = []
            for f in second_forms[:n]:
                i = 0
                counts = Counter(f).most_common(10)
                idx = counts[0][0]
                while idx in second_index and i < len(counts):
                    idx = counts[i][0]
                    i += 1
                if i < len(counts):
                    second_index.append(idx)
                    second_form.append(reverse_forms[idx])
        else:
            second_index = None
    else:
        second_index = None
    


    for i, paradigm in enumerate(paradigms):
        # calculate the possible lengths of all bases
        lens = defaultdict(lambda: defaultdict(lambda: [0,set()]))
        for xs in zip(*paradigm.var_insts):
            for base, form in xs:
                stats = lens[base][len(form)]
                stats[0] += 1
                stats[1].add(form)


        maximum = (-1,{})
        for base,l in lens.items():
            total = sum((stats[0] for stats in l.values()))
            entropy = 0
            for stats in l.values():
                p = stats[0]/total
                entropy -= p*math.log(p)
            if entropy > maximum[0]:
                maximum = (entropy,l)

        pattern = []

        forms, guessed = zip(*paradigm.forms)

        required_forms = lang_plugin.required_forms
        reverse_forms = reverse_dict(paradigm.typ.linearize())
        if required_forms:
            index = get_index(reverse_forms, required_forms[cat])
        elif level and os.path.exists(f"{lang}_forms_{level}.json"): # temporary file
            with open(f"{lang}_forms_{level}.json") as f:
                required_forms = json.load(f)
            index = get_index(reverse_forms, required_forms[cat])
        elif os.path.exists(f"{lang}_forms.json"): # temporary file
            with open(f"{lang}_forms.json") as f:
                required_forms = json.load(f)
            index = get_index(reverse_forms, required_forms[cat])
        else:
            index = 0
        
      #  required_forms = {cat: [required_forms[cat][0],],}

        patterns, pats = [], []
        latest = None
        
        if second_index != None and "base_2" in forms[index]:
            last_base = re.findall(r"base_\d", forms[index])[-1]
            r1 = re.findall(fr"base_1.*{last_base}", forms[index])
            if r1:
                pat1 = r1[0]
                form_0 = forms[index].replace(pat1, "pat_1")
                patterns.append(get_pattern(form_0, lens, mult_base_words=mult_base_words))
                pats.append((1, pat1))
                for num, i in enumerate(second_index):
                    r2 = re.findall(fr"base_1.*{last_base}", forms[i])
                    if r2 and r2[0] not in pats:
                        pat2 = r2[0]
                        form_1 = forms[i].replace(pat2, f"pat_{num+2}")
                        patterns.append(get_pattern(form_1, lens, mult_base_words=mult_base_words))
                        pats.append((num+2,pat2))
                    else:
                        patterns.append(["_"])
                        pats.append((num+2, None))
                
            new_forms, latest = rewrite_forms(paradigm.forms, guessed, pats)
            if not latest: 
                patterns = paradigm.pattern
            else:
                patterns = patterns[:latest+1]
            paradigm.forms = new_forms
        if not patterns:
            patterns = [get_pattern(forms[index], lens, mult_base_words=mult_base_words), ]

  

        if patterns:
            if second_index and latest:
                insts = []
                for ident, table in paradigm.tables:
                    inst = [("base", table[index]), ]
                    for num, i in enumerate(second_index[:latest]):
                        inst.append((f"form_{num+1}", table[i]))
                    insts.append(inst)
                paradigm.var_insts = insts
            else:
                paradigm.var_insts = [[("base",table[index])] for ident,table in paradigm.tables]
        paradigm.pattern = patterns


    if second_index:
        for i in second_form:
            if i not in required_forms[cat]:
                required_forms[cat].append(i)

    if mult_base_words > 0:
        print(f"Number of {cat} paradigms with more than 1 base: {mult_base_words}")
    
    
    if allow_second_forms:
        new_paradigms = []
        exclude = []
        for i,p1 in enumerate(paradigms):
            if i not in exclude:
                tables = p1.tables
                ints = p1.var_insts
                for j,p2 in enumerate(paradigms):
                    if i != j and j not in exclude:
                        if p1.pattern == p2.pattern and p1.forms == p2.forms: 
                          #  print(p1.pattern, p2.pattern)
                            p1.var_insts.extend(p2.var_insts)
                            p1.tables.extend(p2.tables)
                            exclude.append(j)
                exclude.append(i)
                new_paradigms.append(p1)
        return required_forms[cat], new_paradigms

    return lang_plugin.required_forms[cat], paradigms

def convert_pattern(elements):
    patterns = []
    if elements[0]:
        for elems in elements:
            pattern = []
            for elem in elems:
                if isinstance(elem, str):
                    pattern.append(elem)
                elif isinstance(elem[-1], list):
                    vars = []
                    for el in elem[-1]:
                        if isinstance(el, str):
                            vars.append(el)
                        else:
                            if el == 1:
                                vars.append("?")
                            else:
                                vars.append("(" + "+".join(["?"]*el) + ")")
                    pattern.append(elem[0] + "@(" + "|".join(vars) + ")")
                elif isinstance(elem[-1], int):
                    if elem[-1] == 1:
                        pattern.append(elem[0] + "@?")
                    else:
                        pattern.append(elem[0] + "@("+"+".join(["?"]*elem[-1])+")")

                else:
                    pattern.append(elem[-1])
            patterns.append("+".join(pattern))
        return patterns
    else:
        return None

def write_paradigm(i, max_i, par, cat, allow_second_forms=False):
    if par.pattern:
        names = [name for name, val in par.var_insts[0]]
    else:
        names = ["base"]
    s = "" if max_i == 1 else f"{i:03d}"
    code = f"""mk{cat}{s} : {len(names) * "Str -> "}{cat} ;\nmk{cat}{s} {" ".join(names)} =\n  """
 
    if par.pattern[0]:
        pattern = convert_pattern(par.pattern)

        if pattern:
            if len(pattern) == 1:
                code += "case base of {\n    "+pattern[0]+f" => lin {cat}\n      "
                form_code = par.typ.renderOper(6,par.forms)
                code += form_code
                code += ";\n    _ => error \"Can't apply paradigm mk"+cat+s+"\"\n  } ;"
            else:
                code += "case <base, " + ", ".join([f"form_{n+1}" for n in range(len(names)-1)]) +  "> of {\n    <"+", ".join(pattern[:len(names)]) +f"> => lin {cat}\n      "
                
                form_code = par.typ.renderOper(6,par.forms)
                code += form_code
                code += ";\n    _ => error \"Can't apply paradigm mk"+cat+s+"\"\n  } ;"
    else:
        
        code += f"lin {cat}\n  "
        form_code = par.typ.renderOper(2,par.forms)
        code += form_code + " ;"
    return code

def write_lexicon(i, max_i, par, cat):
    code = ""
    s = "" if max_i == 1 else f"{i:03d}"

    for j,(ident,table) in enumerate(par.tables):
        code += f"""lin {escape(ident)} = mk{cat}{s} {" ".join(('"'+val+'"' for name, val in par.var_insts[j]))} ;\n"""
    return code


def learn(lang, dirname="data", level=None, allow_second_forms=False, n=1, input_json=False):
    with open(f"{dirname}/{lang}/lexicon.pickle", "rb") as f:
        langcode, source, lexicon = pickle.load(f)

    if input_json: 
        lexicon = read_json_paradigms(lang, langcode, source)

    lang_plugin = plugins[source,lang]
 


    print("Learning paradigms..")
    tables = defaultdict(list)
    required_forms = defaultdict()
    for pos_tag, (cat_name, table) in lexicon.items():
            if len(table) > 1:
                print(f"Warning: the inflection tables for {pos_tag} are not unified yet, using the first one")
            typ,lexemes = next(iter(table.items()))
            paradigms = learnparadigms(typ,lexemes)
            req_forms = correct_paradigms(lang, lang_plugin, cat_name, paradigms, 
                                          level=level, allow_second_forms=allow_second_forms, n=n)
            
            required_forms[cat_name], paradigms = req_forms
            tables[cat_name].extend(paradigms)

            


    print("Writing output files..")

  

    with open(f"{dirname}/{lang}/paradigms.pickle", "wb") as f:
        pickle.dump((source, langcode, tables), f)
    if level:
        with open(f"{lang}_forms_{level}.json", "w") as f: # temporary file
            json.dump(required_forms, f)
    else:
        with open(f"{lang}_forms.json", "w") as f: # temporary file
            json.dump(required_forms, f)
    
    with open(f"{dirname}/{lang}/Dict{langcode}.gf", "w") as dct, open(f"{dirname}/{lang}/Morpho{langcode}.gf", "w") as para:
        dct.write(
            f"""concrete Dict{langcode} of Dict{langcode}Abs = Cat{langcode} ** open Morpho{langcode}, Prelude in {{\n\n""")
        para.write(f"""resource Morpho{langcode} = open Cat{langcode}, Res{langcode}, Predef in {{\n\noper""")

        for cat, table in tables.items():
            for i, par in enumerate(table):
                dct.write(write_lexicon(i+1, len(table), par, cat))
                para.write("\n\n" + write_paradigm(i+1, len(table), par, cat, allow_second_forms))
    
        dct.write("\n}")
        para.write("\n}")
