from rgl_learner.utils import *

params = {'IMP': ('Imperative_Jussive', 'Mood'), 'SBJV': ('Subjunctive', 'Mood'), 'FUT': ('Fut', 'Tense'), 'PRS': ('Pres', 'Tense'), 'PST': ('Past', 'Tense'), 'IPFV': ('Imperfective', 'Aspect'), 'PFV': ('Perfective', 'Aspect'), 'PRF': ('Perfect', 'Aspect'), 'PROG': ('Progressive', 'Aspect'), 'NFIN': ('Nonfinite', 'Finiteness'), '1': ('P1', 'Person'), '2': ('P2', 'Person'), '3': ('P3', 'Person'), 'COL': ('Colloquial', 'Politeness'), 'SG': ('Sg', 'Number'), 'PL': ('Pl', 'Number')}


params_order = dict(zip(params.keys(), range(len(params))))

param_order = []
parameters = defaultdict(set)
for tag, (_, param) in params.items():
    parameters[param].add(tag)
    if param not in param_order:
        param_order.append(param)


def patchN(lemma, table):
    new_table = fill_empty(
        fix_table(
            table,
            param_order,
            parameters,
            fixed_names={},
            exclude_list=[],
        )
    )

    return new_table

def patchA(lemma, table):
    new_table = fill_empty(
        fix_table(
            table,
            param_order,
            parameters,
            fixed_names={},
            exclude_list=[],
        )
    )

    return new_table
