from rgl_learner.utils import *

iso3 = "Kaz"
def patchV(lemma, table):
	params = {'Mood': {'SBJV', 'IND', 'IMP'}, 'Polarity': {'POS', 'NEG'}, 'Tense': {'FUT', 'PST', 'PRS'}, 'Person': {'2', '3', '1'}, 'Number': {'SG', 'PL'}, 'Politeness': {'INFM', 'FORM'}, 'Aspect': {'PROG', 'PRF'}} 
	param_order = ['Mood', 'Aspect', 'Person', 'Polarity', 'Politeness', 'Tense', 'Number'] 
	new_table = fill_empty(fix_table(table, param_order, params))
	return new_table

def patchN(lemma, table):
	params = {'Possession': {'PSS3P', 'PSS2S', 'PSS1S', 'PSS1P', 'PSS3S', 'PSS2P'}, 'Number': {'SG', 'PL'}, 'Formality': {'LSSPEC1', 'LSSPEC2'}, 'Case': {'LOC', 'INST', 'ACC', 'GEN', 'DAT', 'ABL', 'NOM'}} 
	param_order = ['Possession', 'Case', 'Number', 'Formality'] 
	new_table = fill_empty(fix_table(table, param_order, params))
	return new_table

