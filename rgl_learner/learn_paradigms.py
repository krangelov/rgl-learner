import codecs
import json
import sys
import os
import itertools
import re
from functools import reduce
from dataclasses import dataclass
import pickle
from collections import defaultdict, Counter
import math
import rgl_learner.plugins as plugins
from rgl_learner.utils import escape, reverse_dict
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
    pattern : str
    tables : list[tuple[str,list[str]]]

    def compatible(self, other):
        if len(self.forms) != len(other.forms):
            return False

        for i, form in enumerate(self.forms):
            other_form = other.forms[i][0] if isinstance(other.forms[i], tuple) else other.forms[i]
            if form != "nonExist" and other_form != "nonExist":
                if form != other_form:
                    return False

        return True

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


def correct_paradigms(lang, lang_plugin,cat,paradigms, level=None):
    def get_index(reverse_forms, required_forms):
        if reverse_forms[0].startswith("s;") and not required_forms[0].startswith("s;"):
            return reverse_forms.index("s;" + required_forms[0])
        elif not any(map(lambda x: x.startswith("s;"), reverse_forms)):
            #print(reverse_forms)
            new_form = re.sub("^s;", "", required_forms[0])
            return reverse_forms.index(new_form)
        else:
            return reverse_forms.index(required_forms[0])

    mult_base_words = 0
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

        pattern = ""

        forms, guessed = zip(*paradigm.forms)

        required_forms = lang_plugin.required_forms.get(cat)
        reverse_forms = reverse_dict(paradigm.typ.linearize())
        if required_forms:
            index = get_index(reverse_forms, required_forms)
        elif os.path.exists(f"{lang}_forms_{level}.json"): # temporary file
            with open(f"{lang}_forms_{level}.json") as f:
                required_forms = json.load(f)
            index = get_index(reverse_forms, required_forms[cat])
        else:
            index = 0


        for elem in forms[index].split('+'):
            l = lens.get(elem)
            if len(pattern) == 0:
                pattern = elem
            else:
                pattern += "+"+elem
            if elem[0] == '"' and elem[-1] == '"':   # this is a string
                pass
            elif id(l) == id(maximum[1]):    # this is the variable segment
                pass
            elif l and len(l) == 1:  # this is a base of a fixed length
                l = next(iter(l))
                if l == 1:
                    pattern += "@?"
                else:
                    pattern += "@("+"+".join(["?"]*l)+")"
            elif l:                              # low-entropy variable
                max_count = max(count for count,forms in l.values())
                pattern += "@("
                first = True
                max_count_l = None
                for l,[count,forms] in l.items():
                    if count == max_count and not max_count_l:
                        max_count_l = l
                    else:
                        if first:
                            first = False
                        else:
                            pattern += "|"
                        pattern += "|".join('"'+form+'"' for form in forms)
                if max_count_l == 1:
                    pattern += "|?)"
                else:
                    pattern += "|("+"+".join(["?"]*max_count_l)+"))"
            else:
                pattern = None
                if len(lens) > 1:
                    mult_base_words += 1
                break              # nonExist or a variable length base

        if pattern == "base_1":
            pattern = None

        if pattern:
            paradigm.var_insts = [[("base",table[index])] for ident,table in paradigm.tables]
        paradigm.pattern = pattern


    if mult_base_words > 0:
        print(f"Number of {cat} paradigms with more than 1 base: {mult_base_words}")

def write_paradigm(i, max_i, par, cat):
    if par.pattern == None:
        names = [name for name, val in par.var_insts[0]]
    else:
        names = ["base"]
    s = "" if max_i == 1 else f"{i:03d}"
    code = f"""mk{cat}{s} : {len(names) * "Str -> "}{cat} ;\nmk{cat}{s} {" ".join(names)} =\n  """
    if par.pattern:
        code += "case base of {\n    "+par.pattern+f" => lin {cat}\n      "
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


def learn(lang, dirname="data", level=None):
    with open(f"{dirname}/{lang}/lexicon.pickle", "rb") as f:
        langcode, source, lexicon = pickle.load(f)

    lang_plugin = plugins[source,lang]


    print("Learning paradigms..")
    tables = defaultdict(list)
    for pos_tag, (cat_name, table) in lexicon.items():
        if len(table) > 1:
            print("Warning: the inflection tables are not unified yet, using the first one")
        typ,lexemes = next(iter(table.items()))
        paradigms = learnparadigms(typ,lexemes)
        correct_paradigms(lang, lang_plugin, cat_name, paradigms, level=level)
        tables[cat_name].extend(paradigms)

    print("Writing output files..")


    with open(f"{dirname}/{lang}/paradigms.pickle", "wb") as f:
        pickle.dump((source, langcode, tables), f)

    with open(f"{dirname}/{lang}/Dict{langcode}.gf", "w") as dct, open(f"{dirname}/{lang}/Morpho{langcode}.gf", "w") as para:
        dct.write(
            f"""concrete Dict{langcode} of Dict{langcode}Abs = Cat{langcode} ** open Morpho{langcode}, Prelude in {{\n\n""")
        para.write(f"""resource Morpho{langcode} = open Cat{langcode}, Res{langcode}, Predef in {{\n\noper""")

        for cat, table in tables.items():
            for i, par in enumerate(table):
                dct.write(write_lexicon(i+1, len(table), par, cat))
                para.write("\n\n" + write_paradigm(i+1, len(table), par, cat))

        dct.write("\n}")
        para.write("\n}")
