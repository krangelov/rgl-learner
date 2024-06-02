from rgl_learner.utils import *

iso3 = "Tgl"
def patchV(lemma, table):
	params = {'Aspect': {'IPFV', 'PFV'}, 'Voice': {'AGFOC', 'PFOC'}, 'Finiteness': {'NFIN'}, 'Language_Specific': {'LGSPEC1'}} 
	param_order = ['Aspect', 'Finiteness', 'Voice', 'Language_Specific'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

