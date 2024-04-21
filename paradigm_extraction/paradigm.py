from __future__ import print_function
import re
import sys
import codecs
from collections import defaultdict
from paradigm_extraction import regexmatcher
from paradigm_extraction import genregex


def overlap(ss):
    count = 0
    for (c1, c2) in zip(prefix[::-1], suffix):
        if c1 == c2:
            count += 1
        else:
            return count
    return count


class Paradigm(object):
    """A class representing a paradigm.

    Args:
       form_msd:list(tuple)
            Ex: [('1+en',[('tense','pres')]), ...,
       var_insts:list(tuple)
            Ex: [[('1','dimm')],[('1','dank')], ...]
    """

    def __init__(self, forms, typ, var_insts, lemmas, prefix=None):
        self.p_info = {}
        self.forms = forms
        self.typ = typ
        self.var_insts = var_insts
        self.lemmas = lemmas
        if prefix == None:
            self.prefix = ''
        else:
            self.prefix = prefix

    def __getattr__(self, attr):
        if len(self.p_info) > 0:  # Compute only once.
            return self.p_info[attr]
        else:
            if len(self.var_insts) != 0:
                self.p_info['name'] = self.prefix + self.__call__(*[s for (_, s) in self.var_insts[0]])[0][0]
                self.p_info['count'] = len(self.var_insts)
            else:  # no variables
                self.p_info['name'] = self.prefix + self.__call__()[0][0]
                self.p_info['count'] = 1
            self.p_info['slots'] = self.__slots()
        return self.p_info[attr]

    def __slots(self):
        slts = []
        """Compute the content
         of the slots.
        """
        # string slots
        fs = [f.strs() for f in self.forms]
        str_slots = list(zip(*fs))
        # var slots
        vt = defaultdict(list)
        for vs in self.var_insts:
            for (v, s) in vs:
                vt[v].append(s)
        var_slots = list(vt.items())
        var_slots.sort(key=lambda x: x[0])
        (s_index, v_index) = (0, 0)
        for i in range(len(str_slots) + len(var_slots)):  # interleave strings and variables
            if i % 2 == 0:
                slts.append((False, str_slots[s_index]))
                s_index += 1
            else:
                slts.append((True, var_slots[v_index][1]))
                v_index += 1
        return slts

    def fits_paradigm(self, w, constrained=True):
        for f in self.forms:
            if f.match(w, constrained):
                return True
        return False

    def match(self, w, selection=None, constrained=True):
        result = []
        if selection == None:
            forms = self.forms
        else:
            forms = [self.forms[i] for i in selection]
        for f in forms:
            xs = f.match_vars(w, constrained)
            result.append(xs)
        return result

    def paradigm_forms(self):
        if len(self.var_insts) > 0:
            ss = [s for (_, s) in self.var_insts[0]]
        else:
            ss = []
        return [f.shapes(ss) for f in self.forms]

    def __call__(self, *insts):
        table = []
        for f in self.forms:
            (w, msd) = f(*insts)
            table.append((''.join(w), msd))
        return table

    def __str__(self):
        p = [str(f) for f in self.forms]
        v = "#".join(self.lemmas)
        return '%s\t%s' % ("\n".join(p), v)

def load_file(file):
    paradigms = []
    with codecs.open(file, encoding='utf-8') as f:
        for l in f:
            try:
                (p, ex) = l.strip().split('\t')
            except:
                p = l.strip()
                ex = ''
            p_members = []
            wfs = []
            for s in p.split('#'):
                (w, m) = s.split(':')
                msd = [tuple(x.split('=')) for x in m.split(',')]
                wfs.append((w, msd))
            if len(ex) > 0:
                for s in ex.split('#'):
                    mem = []
                    for vbind in s.split(','):
                        mem.append(tuple(vbind.split('=')))
                    p_members.append(mem)
            else:  # no variables
                p_members = []
            paradigms.append((len(p_members), wfs, p_members))
    paradigms.sort(reverse=True)
    return [Paradigm(wfs, p_members, 'p%d_' % i) for (i, (_, wfs, p_members)) in enumerate(paradigms, 1)]


def pr(i, b):
    if b:
        return '[v] %d' % (i)
    else:
        return '[s] %d' % (i)
