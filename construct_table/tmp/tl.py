from rgl_learner.utils import *

iso3 = "Tgl"
def patchA(lemma, table):
	params = {'Gender': {'feminine', 'masculine'}, 'Comparison': {'positive', 'superlative_equal', 'comparative_equal', 'superlative_inferior', 'comparative_inferior'}, 'Number': {'plural', 'singular'}} 
	param_order = ['Comparison', 'Number', 'Gender'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchV(lemma, table):
	params = {'Aspect': {'progressive', 'completive', 'infinitive', 'past-recent', 'contemplative'}, 'Mood': {'imperative'}, 'Formality': {'formal', 'informal'}, 'Voice': {'actor-secondary', 'locative_focus', 'trigger-referential', 'reciprocal', 'trigger-object', 'directional', 'trigger-actor', 'trigger-measurement', 'trigger-instrument', 'indirect', 'direct', 'trigger-locative', 'benefactive', 'trigger-causative'}} 
	param_order = ['Mood', 'Aspect', 'Formality', 'Voice'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

