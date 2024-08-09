from rgl_learner.utils import *

iso3 = "Gle"
def patchN(lemma, table):
	params = {'MutationType': {'mutation', 'lenition', 'eclipsis', 'weak', 'mutation-radical', 'mutation-nasal', 'prothesis-h', 'prothesis-t', 'strong'}, 'Species': {'definite', 'indefinite'}, 'Case': {'dative', 'nominative', 'genitive', 'vocative'}, 'Number': {'singular', 'plural'}} 
	param_order = ['Species', 'Case', 'Number', 'MutationType'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchV(lemma, table):
	params = {'MutationType': {'mutation', 'lenition', 'eclipsis', 'weak', 'mutation-radical', 'mutation-nasal', 'prothesis-h', 'prothesis-t', 'strong'}, 'Mood': {'subjunctive', 'imperative', 'indicative', 'conditional'}, 'Tense': {'present', 'past', 'past_habitual', 'future'}, 'Person': {'second-person', 'first-person', 'third_person', 'autonomous'}, 'Number': {'singular', 'plural'}, 'Relative_Form': {'relative'}} 
	param_order = ['Mood', 'Tense', 'Person', 'Number', 'Relative_Form', 'MutationType'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPrep(lemma, table):
	params = {'MutationType': {'mutation', 'lenition', 'eclipsis', 'weak', 'mutation-radical', 'mutation-nasal', 'prothesis-h', 'prothesis-t', 'strong'}, 'Person': {'second-person', 'first-person', 'third_person'}, 'Number': {'singular', 'plural'}, 'Gender': {'feminine', 'masculine'}} 
	param_order = ['Person', 'Number', 'Gender', 'MutationType'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchA(lemma, table):
	params = {'MutationType': {'mutation', 'lenition', 'eclipsis', 'weak', 'mutation-radical', 'mutation-nasal', 'prothesis-h', 'prothesis-t', 'strong'}, 'Case': {'dative', 'nominative', 'genitive', 'vocative'}, 'Number': {'singular', 'plural'}, 'Gender': {'feminine', 'masculine'}, 'Comparison': {'superlative', 'comparative'}} 
	param_order = ['Comparison', 'Case', 'Number', 'Gender', 'MutationType'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchAdv(lemma, table):
	params = {'MutationType': {'mutation', 'lenition', 'eclipsis', 'weak', 'mutation-radical', 'mutation-nasal', 'prothesis-h', 'prothesis-t', 'strong'}} 
	param_order = ['MutationType'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPron(lemma, table):
	params = {'MutationType': {'mutation', 'lenition', 'eclipsis', 'weak', 'mutation-radical', 'mutation-nasal', 'prothesis-h', 'prothesis-t', 'strong'}} 
	param_order = ['MutationType'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

