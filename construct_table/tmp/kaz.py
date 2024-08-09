from rgl_learner.utils import *

iso3 = "Kaz"
def patchN(lemma, table):
	params = {'Possession': {'PSS3S', 'PSS1P', 'PSS1S', 'PSS2P', 'PSS3P', 'PSS2S'}, 'Number': {'PL', 'SG'}, 'Formality': {'LSSPEC1', 'LSSPEC2'}, 'Case': {'NOM', 'ACC', 'GEN', 'LOC', 'DAT', 'INST', 'ABL'}} 
	param_order = ['Possession', 'Case', 'Number', 'Formality'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchV(lemma, table):
	params = {'Mood': {'SBJV', 'IMP'}, 'Polarity': {'NEG'}, 'Politeness': {'FORM', 'INFM'}, 'Person': {'2', '1', '3'}, 'Number': {'PL', 'SG'}, 'Tense': {'PRS', 'PST'}, 'Aspect': {'PRF', 'PROG'}} 
	param_order = ['Mood', 'Tense', 'Aspect', 'Person', 'Polarity', 'Politeness', 'Number'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

