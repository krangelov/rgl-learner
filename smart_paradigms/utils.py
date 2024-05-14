from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.metrics import accuracy_score
from collections import defaultdict
import itertools
import pandas as pd
import pickle


def read_data(lang):
    with open(f"data/{lang}/paradigms.pickle", "rb") as f:
        langcode, tables = pickle.load(f)
    return tables


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
            feature_list[col] = {morpheme.rsplit("+")[-1]: f"{col} ends with {morpheme.rsplit("+")[-1]}" for morpheme in df[col].unique() if pd.notna(morpheme)}
    return feature_list


def prepare_data(df, feature_list, class_tags):
    featlist = defaultdict(list)
    labels = list()
    for i, row in df.iterrows():
        if row.class_tag in class_tags.values:
            for col, val in feature_list.items():
                for feat, name in val.items():
                    if pd.notna(row[col]) and row[col].endswith(feat):
                        featlist[name].append(True)
                    else:
                        featlist[name].append(False)
            labels.append(row.class_tag)
    feats = pd.DataFrame(featlist)

    return feats, labels


def coverage_score(token, forms):
    coverage = 0
    for form, value in token.items():
        if forms.get(form) == value:
            coverage += 1

    overlap = len(forms.keys() & token.keys())
    return (coverage/(len(token)),
           coverage/(len(forms)),
            coverage/overlap)

def build_tree(X, y):
    tree = DecisionTreeClassifier()
    tree.fit(X, y)
    y_pred = tree.predict(X)
    print(f"Accuracy score: {accuracy_score(y, y_pred)}")
    annotations = plot_tree(tree, feature_names=X.columns, max_depth=5)
    return annotations


def get_freq_class(df, features):
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