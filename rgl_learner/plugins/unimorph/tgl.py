ignore_tags = []

from rgl_learner.utils import *

iso3 = "Tga"

def patchV(lemma, table):
	params = {'Aspect': {'PFV', 'IPFV'}, 'Voice': {'AGFOC', 'PFOC'}, 'Finiteness': {'NFIN'}}
	param_order = ['Aspect', 'Finiteness', 'Voice']
	fixed_names = {}
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table