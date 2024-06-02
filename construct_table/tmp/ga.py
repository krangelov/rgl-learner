from rgl_learner.utils import *

iso3 = "Gle"
def patchN(lemma, table):
	params = {'Case': {'genitive', 'dative', 'vocative', 'nominative'}, 'Number': {'plural', 'singular'}, 'Species': {'definite', 'indefinite'}, 'Gender': {'masculine', 'feminine'}, 'Comparison': {'superlative', 'comparative'}} 
	param_order = ['Comparison', 'Species', 'Case', 'Gender', 'Number'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchV(lemma, table):
	params = {'Mood': {'conditional', 'imperative', 'indicative', 'subjunctive'}, 'Tense': {'present', 'past', 'future'}, 'Number': {'plural', 'singular'}, 'Person': {'third_person', 'second-person', 'first-person'}, 'Species': {'definite', 'indefinite'}, 'Case': {'genitive', 'dative', 'vocative', 'nominative'}, 'Polarity': {'negative'}, 'Transitivity': {'transitive'}} 
	param_order = ['Species', 'Case', 'Mood', 'Tense', 'Number', 'Person', 'Polarity', 'Transitivity'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPrep(lemma, table):
	params = {'Gender': {'masculine', 'feminine'}, 'Number': {'plural', 'singular'}, 'Person': {'third_person', 'second-person', 'first-person'}, 'Case': {'possessive'}} 
	param_order = ['Case', 'Gender', 'Number', 'Person'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchA(lemma, table):
	params = {'Comparison': {'superlative', 'comparative'}, 'Case': {'genitive', 'dative', 'vocative', 'nominative'}, 'Gender': {'masculine', 'feminine'}, 'Number': {'plural', 'singular'}, 'Species': {'definite', 'indefinite'}} 
	param_order = ['Comparison', 'Species', 'Case', 'Gender', 'Number'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPN(lemma, table):
	params = {'Case': {'genitive', 'dative', 'vocative', 'nominative'}, 'Species': {'definite', 'indefinite'}, 'Number': {'plural', 'singular'}, 'Gender': {'masculine', 'feminine'}} 
	param_order = ['Species', 'Case', 'Gender', 'Number'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchPron(lemma, table):
	params = {} 
	param_order = [] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchAdv(lemma, table):
	params = {} 
	param_order = [] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchDet(lemma, table):
	params = {'Number': {'plural', 'singular'}} 
	param_order = ['Number'] 
	fixed_names = {} 
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

