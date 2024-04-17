import json
import re


def reverse_dict(d, keys=[]):
    result = []
    for k, v in d.items():
        if isinstance(v, dict):
            result.extend(reverse_dict(v, keys + [k]))
        else:
            result.append((v, ";".join((keys + [k]))))
    return result


def parse_table(table):
    """
    :param table: GF table to parse into a dictionary with placeholders
    :return: a dictionary with forms to grammatical features
    """
    table = table.replace("=>", ":").replace("=", ":").replace("table", "")
    table = re.sub(r";[^$]", ",", table)
    table = re.sub(r"\s+|;", " ", table)
    table = re.sub(r"([-\w]+)", r'"\g<1>"', table)
    table = ("["+table+"]")
    form_table = json.loads(table)
    all_forms = dict()
    for form in form_table:
        all_forms.update(dict(reverse_dict(form)))
    return all_forms


def parse_resource_grammar(grammar):
    """
    :param grammar: an unextracted RGL grammar to parse paradigms
    :return: a dictionary with paradigms by part-of-speech
    """
    paradigms = grammar.split("\n\n")[1:]
    pos2p = {}
    for paradigm in paradigms:
        if "->" in paradigm:
            splited_paradigm = paradigm.strip().split("->")
            form = splited_paradigm[-2]
            table = splited_paradigm[-1]
            pos_tag = form.split("=")[0].strip()
            form_table = parse_table(table)
            pos2p[pos_tag] = form_table
    return pos2p


def parse_lexicon(lexicon, form_table):
    """
    :param lexicon: a RGL lexicon file
    :param form_table: a dictionary with paradigms by part-of-speech
    :return: paradigms with wordforms
    """
    lexicon = lexicon.split("\n")[2:]
    paradigms = {}
    for lexeme in lexicon:
        if "=" in lexeme:
            lemma, forms = lexeme.split("=", maxsplit=1)
            lemma = lemma.replace ("lin '", "").split("_",maxsplit=1)[0]
            pos, forms = forms.split(maxsplit=1)
            pos = pos.replace("mk", "")
            all_forms = form_table[pos]
            word2form = {form.strip('"'): all_forms[f"f{i+1}"] for i, form in enumerate(forms.strip(" ;").split(' ')) if f"f{i+1}" in all_forms and form != "nonExist"}
            if pos in paradigms:
                paradigms[pos].append((lemma, list(word2form.keys()), list(word2form.values())))
            else:
                paradigms[pos] = [(lemma, list(word2form.keys()), list(word2form.values())),]
    return paradigms


def parse_gf_files(filepath, lang):
    with open(f"{filepath}/Res{lang}.gf") as f:
        grammar = f.read()

    with open(f"{filepath}/Dict{lang}.gf") as f:
        lexicon = f.read()

    form_table = parse_resource_grammar(grammar)
    paradigms = parse_lexicon(lexicon, form_table)
    return paradigms