from collections import defaultdict, abc
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.metrics import accuracy_score
from collections import defaultdict
import itertools
import pandas as pd
import pickle
import re

cat2tag = {
  'N': 'Noun',
  'V':'Verb',
  'A': 'Adj',
  'PN': 'Name',
  'Pron': 'Pron',
  'Adv': 'Adv',
  'Det': 'Det',
  'Prep': 'Prep',
}


gf2unimorph = {'Indicative': 'IND',
 'Admirative': 'ADM',
 'Non_Purposive': 'AUNPRP',
 'Purposive': 'AUPRP',
 'Conditional': 'COND',
 'Debitive': 'DEB',
 'Deductive': 'DED',
 'Imperative_Jussive': 'IMP',
 'Intentive': 'INTEN',
 'Irrealis': 'IRR',
 'Likely': 'LKLY',
 'Obligative': 'OBLIG',
 'Optative_Desiderative': 'OPT',
 'Permissive': 'PERM',
 'Potential': 'POT',
 'General Purposive': 'PURP',
 'Realis': 'REAL',
 'Subjunctive': 'SBJV',
 'Simulative': 'SIM',
 '1day': '1DAY',
 'Fut': 'FUT',
 'Hodiernal': 'HOD',
 'Immediate': 'IMMED',
 'Pres': 'PRS',
 'Past': 'PST',
 'Recent': 'RCT',
 'Remote': 'REMT',
 'Alien': 'ALN',
 'Inalien': 'NALN',
 'Poss1Du': 'PSS1D',
 'Poss1DuExcl': 'PSS1DE',
 'Poss1DucIncl': 'PSS1DI',
 'Poss1Pl': 'PSS1P',
 'Poss1PlExcl': 'PSS1PE',
 'Poss1PlIncl': 'PSS1PI',
 'Poss1Sg': 'PSS1S',
 'Poss2Du': 'PSS2D',
 'Poss2DuFem': 'PSS2DF',
 'Poss2DuMasc': 'PSS2DM',
 'Poss2PL': 'PSS2P',
 'Poss2PlFem': 'PSS2PF',
 'Poss2PlMasc': 'PSS2PM',
 'Poss2Sg': 'PSS2S',
 'Poss2SgFem': 'PSS2SF',
 'Poss2SgForm': 'PSS2SFORM',
 'Poss2SgInfm': 'PSS2SINFM',
 'Poss2SgMasc': 'PSS3SM',
 'Poss3Du': 'PSS3D',
 'Poss3DuFem': 'PSS3DF',
 'Poss3DuMasc': 'PSS3DM',
 'Poss3Pl': 'PSS3P',
 'Poss3PlFem': 'PSS3PF',
 'Poss3PlMasc': 'PSS3PM',
 'Poss3Sg': 'PSS3S',
 'Poss3Ssg': 'PSS3SG',
 'Poss3SgFem': 'PSS3SF',
 'Possessed': 'PSSD',
 'Accomplishment': 'ACCMP',
 'Achievement': 'ACH',
 'Activity': 'ACTY',
 'Atelic': 'ATEL',
 'Durative': 'DUR',
 'Dynamic': 'DYN',
 'Punctual': 'PCT',
 'Semelfactive': 'SEMEL',
 'Stative': 'STAT',
 'Telic': 'TEL',
 '3.sg Object (from feature template)': 'ARGAC3S',
 'Habitual': 'HAB',
 'Imperfective': 'IPFV',
 'Iterative': 'ITER',
 'Perfective': 'PFV',
 'Perfect': 'PRF',
 'Progressive': 'PROG',
 'Prospective': 'PROSP',
 'Indef': 'INDF',
 'Def': 'DEF',
 'Non_Spec': 'NSPEC',
 'Spec': 'SPEC',
 'Nom': 'NOM',
 'Acc': 'ACC',
 'Dat': 'DAT',
 'Gen': 'GEN',
 'Voc': 'VOC',
 'Part': 'PRT',
 'Iness': 'IN',
 'Ablat': 'ABL',
 'Ess': 'ESS',
 'Transl': 'PROL',
 'Instr': 'INST',
 'Comit': 'COM',
 'Loc': 'LOC',
 'SNom': 'NOMS',
 'On': 'ON',
 'Onhr': 'ONHR',
 'Onvr': 'ONVR',
 'Post': 'POST',
 'Privative': 'PRIV',
 'Proprietive': 'PROPR',
 'Abs': 'ABS',
 'Allat': 'ALL',
 'Ante': 'ANTE',
 'Apprx': 'APPRX',
 'Apud': 'APUD',
 'At': 'AT',
 'Aver': 'AVR',
 'Benef': 'BEN',
 'Essmod': 'BYWAY',
 'Circ': 'CIRC',
 'Compar': 'COMPV',
 'Equative': 'EQT',
 'Erg': 'ERG',
 'Formal': 'FORM',
 'Inter': 'INTER',
 'Purp': 'PRP',
 'Rel': 'REL',
 'Rem': 'REM',
 'Sub': 'SUB',
 'Term': 'TERM',
 'Vers': 'VERS',
 'Absolute': 'AB',
 'Comparative': 'CMPR',
 'Relative': 'RL',
 'Superlative': 'SPRL',
 'Proximal': 'PROX',
 'Above': 'ABV',
 'Below': 'BEL',
 'Even': 'EVEN',
 'Medial': 'MED',
 'No Reference Point, Distal': 'NOREF',
 'Invisible': 'NVIS',
 'Phoric, situated in discourse': 'PHOR',
 'First Person Reference Point': 'REF1',
 'Second Person Reference Point': 'REF2',
 'Visible': 'VIS',
 'Assumed': 'ASSUM',
 'Auditory': 'AUD',
 'Direct': 'DIR',
 'Firsthand': 'FH',
 'Hearsay': 'HRSY',
 'Inferred': 'INFER',
 'Non_firsthand': 'NFH',
 'Non_visual sensory': 'NVSEN',
 'Quotative': 'QUOT',
 'Reported': 'RPRT',
 'Sensory': 'SEN',
 'Finite': 'FIN',
 'Nonfinite': 'NFIN',
 'NClass': 'BANTU1_23',
 'Masc': 'MASC',
 'Fem': 'FEM',
 'Neutr': 'NEUT',
 'NClasses': 'NAKH1-8',
 'Focus': 'FOC',
 'Topic': 'TOP',
 'Declarative': 'DECL',
 'Interrogative': 'INT',
 'Excl': 'EXCL',
 'Incl': 'INCL',
 'Obviative': 'OBV',
 'Proximate': 'PRX',
 'Affirm': 'POS',
 'Neg': 'NEG',
 'CN_R_MN': 'CN_R_MN',
 'DS': 'DS',
 'DSAdv': 'DSADV',
 'Logophoric': 'LOG',
 'Open_Reference': 'OR',
 'SeqMA': 'SEQMA',
 'SimMA': 'SIMMA',
 'SS': 'SS',
 'SS Adverbial': 'SSADV',
 'Applicative': 'APPL',
 'Causative': 'CAUS',
 'Imprs': 'IMPRS',
 'Intransitive': 'INTR',
 'Reciprocal': 'RECP',
 'Reflexive': 'REFL',
 'Transitive': 'TR',
 'AcFoc': 'ACFOC',
 'Active': 'ACT',
 'AgFoc': 'AGFOC',

 'Antipassive': 'ANTIP',
 'BFocus': 'BFOC',
 'CFocus': 'CFOC',
 'IFocus': 'IFOC',
 'Inverse': 'INVN',
 'LFocus': 'LFOC',
 'Middle': 'MID',
 'Passive': 'PASS',
 'PFocus': 'PFOC',
 'P0': '0',
 'P1': '1',
 'P2': '2',
 'P2_Informal': '2I',
 'P2_Formal': '2F',
 'P3': '3',
 'P4': '4',
 'High status, elevated': 'STELEV',
 'High status, supreme': 'STSUPR',
 'Avoid': 'AVOID',
 'Colloquial': 'COL',
 'Elev': 'ELEV',
 'Forreg': 'FOREG',
 'High_status': 'HIGH',
 'Humbl': 'HUMB',
 'Informal': 'INFM',
 'Literary': 'LIT',
 'Low status': 'LOW',
 'Polite': 'POL',
 'Animate': 'ANIM',
 'Human': 'HUM',
 'Inanimate': 'INAN',
 'NonHuman': 'NHUM',
 'GrPaucal': 'GPAUC',
 'GrPlural': 'GRPL',
 'Paucal': 'PAUC',
 'Sg': 'SG',
 'Dl': 'DU',
 'Tr': 'TRI',
 'Pl': 'PL'}

def read_data(lang, dir="data"):
    with open(f"{dir}/{lang}/paradigms.pickle", "rb") as f:
        return pickle.load(f)

def parse_pattern(word, pattern):
    """Returns the dictionary of bases"""
    after = False
    start = 0
    end = 0
    stem_name = None
    bases = []
    word = word.replace(".", "\.")

    pattern = pattern.replace('"', "").replace("(", "").replace(")", "").replace("*", "").replace("+?", "?")
    regexp = pattern.replace('+', "")
    for base in pattern.split("+"):
        base = base.strip('"')
        num_symbols = base.count("?")
        if "base" in base:
            if num_symbols > 0:
                char = num_symbols
                regexp = regexp.replace(base, f"(.{{{num_symbols}}})")
                bases.append(re.sub(r'[\(|\)|\@|\?|\+]+', '', base))
            else:
                after = True
                char = 0
                stem_name = base
        else:
            char = len(base)
        if after:
            end += char
        else:
            start += char
    temp_regexp = "^" + regexp.replace("base_1", "(.+)") + "$"
    groups = re.findall(temp_regexp, word)
    full_match_dict = dict(zip(["base_1", ] + bases, groups))
    #print(temp_regexp, full_match_dict)

    replace_word = None
    if not stem_name:
        stem_form = word
        stem_name = "base_1"
        regexp = stem_form
    else:
        end = len(word) - end
        pattern_split = pattern.split("+")
        if stem_name in pattern_split and pattern_split.index(stem_name) + 1 < len(pattern_split):
          #  print(pattern)
           # prev_word = pattern.split("+")[pattern.split("+").index(stem_name) - 1]
            next_word = pattern_split[pattern_split.index(stem_name) + 1]
            next_word_idx = 0
           # prev_word_idx = 0
            if not next_word.startswith("base"):
                for num, char in enumerate(word):
                    if num >= end:
                        if next_word_idx < len(next_word) and char != next_word[next_word_idx]:
                            end += 1
                            next_word_idx += 1
                        else:
                            break

            new_next_word = next_word[next_word_idx:]
            stem_form = word[start:end]

            regexp = regexp.replace(stem_name, stem_form).replace(next_word, new_next_word)
            replace_word = next_word[:next_word_idx]
        else:
            stem_form = word[start:end]
           #s print(word, stem_form, start, end)
            regexp = regexp.replace(stem_name, stem_form)




    base_dict = {stem_name: stem_form}


    groups = re.findall(regexp, word) if regexp else []
    groups = groups[0] if groups and isinstance(groups[0], tuple) else groups

    base_dict.update(dict(zip(bases, map(lambda x: x.replace('\.', "."), groups))))


    #print(full_match_dict, base_dict, word, pattern)
    return full_match_dict, base_dict, replace_word, stem_name

def clean_forms(labels, forms):
    forms = {label: form.replace('"', "") for label, form in zip(labels, forms) if form != "nonExist"}
    return forms


def reverse_dict(d, keys=[]):
    result = []
    for k, v in d.items():
        if isinstance(v, dict):
            result.extend(reverse_dict(v, keys + [str(k)]))
        else:
            result.append((";".join((keys + [str(k)]))))
    return result

def make_feat_list(df, columns):
    feature_list = {}
    for col in columns:
        if col != "class_tag":
            feature_list[col] = {morpheme.rsplit("+")[-1]: f'{col} ends with {morpheme.rsplit("+")[-1]}' for morpheme in df[col].unique() if pd.notna(morpheme)}
    return feature_list


def prepare_data(df, feature_list, class_tags, how="suffix"):
    featlist = defaultdict(list)
    labels = list()
    for i, row in df.iterrows():
        if row.class_tag in class_tags.values:
            for col, val in feature_list.items():
                for feat, name in val.items():
                    if how == "suffix":
                        if pd.notna(row[col]) and row[col].endswith(feat):
                            featlist[name].append(True)
                        else:
                            featlist[name].append(False)
                    elif how == "prefix":
                        if pd.notna(row[col]) and row[col].startswith(feat):
                            featlist[name].append(True)
                        else:
                            featlist[name].append(False)
            labels.append(row.class_tag)
    feats = pd.DataFrame(featlist)

    return feats, labels





def build_tree(X, y):
    tree = DecisionTreeClassifier()
    tree.fit(X, y)
    y_pred = tree.predict(X)
    print(f"Accuracy score: {accuracy_score(y, y_pred)}")
    annotations = plot_tree(tree, feature_names=X.columns, max_depth=5)
    return annotations


def get_freq_class(df, features):
    features = list(set(features))
    new_df = df[features+["class_tag", "pred_class"]].groupby(features+["class_tag"]).count()
    new_df = new_df.reset_index().sort_values('pred_class', ascending=False).drop_duplicates(features)
    new_df["pred_class_tag"] = new_df.class_tag.values
    classes = new_df[features+["class_tag"]].to_dict(orient="records")
    return classes


def get_subset(annotations, num_var):
    feat_subsets = list()
    for L in range(1, num_var):
        for subset in itertools.combinations(annotations, L):
            feat_subsets.append(subset)
    return feat_subsets


def get_rules(df, score):
    columns = score.split("+")
    rules = get_freq_class(df, columns)
    return rules


def get_gf_paradigm(class_tag, rule, par, cat):
    names = [name for name, val in par.var_insts[0]]
    code = f"""mk{cat}{class_tag:03d} : {len(names) * "Str -> "}{cat} ;\nmk{cat}{class_tag:03d} {" ".join(names)} =\n  """
    code += f"lin {cat} " + par.typ.renderOper(2, par.forms)
    code += ' ;'
    return code

def get_param_order(pos, params):
    param_order = []
    for tag, (_, param, pos_tags) in params.items():
        if param not in param_order and pos in pos_tags:
            param_order.append(param)
    return param_order

def nested_key_exists(d, keys):
    if keys and d:
        if isinstance(d.get(keys[0]), str):
            return True
        else:
            return nested_key_exists(d.get(keys[0]), keys[1:])
    return False


def update(table, new_table):
    if isinstance(table, dict):
        for k, v in new_table.items():
            if isinstance(v, abc.Mapping):
                table[k] = update(table.get(k, {}), v)
            else:
                table[k] = v
    return table


def fill_empty(table):
    new_table = {}
    for k, v in table.items():
        if v == {}:
            new_table[k] = "-"
        elif isinstance(v, dict):
            new_table[k] = fill_empty(v)
        else:
            new_table[k] = v
    return new_table



def fix_table(table, param_order, params, fixed_names, num=0, exclude_list=[]):
    new_table = defaultdict(dict)
    if num >= len(param_order):
        raise ValueError(f"This tag is not supported: {next(iter(table))}")
    param = param_order[num]
    values = params[param]
    num += 1


    for t, v in table.items():
        if not t or t in values:
            if isinstance(v, dict):
                update(
                    new_table[t],
                    fix_table(v, param_order, params, fixed_names, num, exclude_list),
                )
            else:
                new_table[t] = v
        elif param in exclude_list:
            while (
                param_order[num] in exclude_list and t not in params[param_order[num]]
            ):
                num += 1
            if t in params[param_order[num]]:
                if isinstance(v, dict):
                    update(
                            new_table[t],
                            fix_table(
                                v,
                                param_order,
                                params,
                                fixed_names,
                                num+1,
                                exclude_list,
                            ),
                        )
                else:
                    new_table[t] = v
            else:
                param_name = (
                        fixed_names[param_order[num]]
                        if param_order[num] in fixed_names
                        else f"no{param_order[num]}"
                    )
                update(
                        new_table[param_name],
                        fix_table(
                            {t: v},
                            param_order,
                            params,
                            fixed_names,
                            num+1,
                            exclude_list,
                        ),
                    )
        else:
            param_name = fixed_names[param] if param in fixed_names else f"no{param}"
            update(
                new_table[param_name],
                fix_table({t: v}, param_order, params, fixed_names, num, exclude_list),
            )

    diff = params[param].difference(new_table.keys())

    if (
        diff
        and diff != params[param]
        and (
            len(new_table.keys()) != 1
            or not (
                next(iter(new_table)).startswith("no")
                or next(iter(new_table)) in fixed_names.values()
            )
        )
    ):
        for extra_value in diff:
            new_table[extra_value] = {}
    return new_table

def escape(s):
    s2 = ""
    for c in s:
        if c == "'":
            s2 += "\\'"
        elif c == "\\":
            s2 += "\\\\"
        else:
            s2 += c
    return "'"+s2+"'"
