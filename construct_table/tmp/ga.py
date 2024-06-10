from rgl_learner.utils import *

iso3 = "Gle"
def patchN(lemma, table):
	params = {'Case': {'vocative', 'genitive', 'dative', 'nominative'}, 'Number': {'singular', 'plural'}, 'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}, 'Species': {'definite', 'indefinite'}, 'Gender': {'masculine', 'feminine'}, 'Comparison': {'comparative', 'superlative'}} 
	param_order = ['Comparison', 'Species', 'Case', 'Gender', 'Number', 'Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchV(lemma, table):
	params = {'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}, 'Mood': {'indicative', 'subjunctive', 'imperative', 'conditional'}, 'Tense': {'past', 'future', 'present'}, 'Number': {'singular', 'plural'}, 'Person': {'first-person', 'third_person', 'second-person'}, 'Species': {'definite', 'indefinite'}, 'Case': {'vocative', 'genitive', 'dative', 'nominative'}, 'Polarity': {'negative'}, 'Transitivity': {'transitive'}} 
	param_order = ['Species', 'Case', 'Mood', 'Tense', 'Number', 'Person', 'Polarity', 'Transitivity', 'Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPrep(lemma, table):
	params = {'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}, 'Gender': {'masculine', 'feminine'}, 'Number': {'singular', 'plural'}, 'Person': {'second-person', 'first-person', 'third_person'}, 'Case': {'possessive'}} 
	param_order = ['Case', 'Gender', 'Number', 'Person', 'Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchA(lemma, table):
	params = {'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}, 'Comparison': {'comparative', 'superlative'}, 'Case': {'vocative', 'genitive', 'dative', 'nominative'}, 'Gender': {'masculine', 'feminine'}, 'Number': {'singular', 'plural'}, 'Species': {'definite', 'indefinite'}} 
	param_order = ['Comparison', 'Species', 'Case', 'Gender', 'Number', 'Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPN(lemma, table):
	params = {'Case': {'vocative', 'genitive', 'dative', 'nominative'}, 'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}, 'Species': {'definite', 'indefinite'}, 'Number': {'singular', 'plural'}, 'Gender': {'masculine', 'feminine'}} 
	param_order = ['Species', 'Case', 'Gender', 'Number', 'Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPron(lemma, table):
	params = {'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}} 
	param_order = ['Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchAdv(lemma, table):
	params = {'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}} 
	param_order = ['Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchDet(lemma, table):
	params = {'Mutation': {'eclipsis', 'prothesis-t', 'prothesis-h', 'mutation-radical', 'lenition'}, 'Number': {'singular', 'plural'}} 
	param_order = ['Number', 'Mutation'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

