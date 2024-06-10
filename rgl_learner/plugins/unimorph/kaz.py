from rgl_learner.utils import *

iso3 = "Kaz"

params =  {'LSSPEC1': ('Frml', 'Formality'),
		   'LSSPEC2': ('Infrml', 'Formality')}

def fix_tags(tag):
	if tag == "FRML":
		return "FORM"
	return tag

def patchV(lemma, table):
	param_order = ['Mood', 'Aspect', 'Polarity', 'Politeness', 'Tense', 'Person', 'Number']
	params = {'Mood': {'SBJV', 'IMP'}, 'Tense': {'FUT', 'PST', 'PRS'}, 'Person': {'1', '3', '2'},
			  'Number': {'SG', 'PL'}, 'Politeness': {'INFM', 'FORM'}, 'Polarity': {'NEG'}, 'Aspect': {'PROG', 'PRF'}}
	fixed_names = {"Mood": "IND", "Polarity": "POS"}
	new_table = fill_empty(fix_table(table, param_order, params, fixed_names))
	return new_table

def patchN(lemma, table):
	case_types = ["NOM", "ACC", "DAT", "LOC", "GEN", "INST", "ABL"]
	pos_types = ["PSS1S", "PSS2S", "PSS3S", "PSS2P", "PSS3P", "PSS1P"]

	table.setdefault("PSS2S", {}).setdefault("SG", {}).setdefault("LSSPEC1", "-")
	table.setdefault("PSS2S", {}).setdefault("SG", {}).setdefault("LSSPEC2", "-")
	table.setdefault("PSS2S", {}).setdefault("PL", {}).setdefault("LSSPEC1", "-")
	table.setdefault("PSS2S", {}).setdefault("PL", {}).setdefault("LSSPEC2", "-")
	table.setdefault("PSS2P", {}).setdefault("PL", {}).setdefault("LSSPEC1", "-")
	table.setdefault("PSS2P", {}).setdefault("PL", {}).setdefault("LSSPEC2", "-")
	table.setdefault("PSS2P", {}).setdefault("SG", {}).setdefault("LSSPEC1", "-")
	table.setdefault("PSS2P", {}).setdefault("SG", {}).setdefault("LSSPEC2", "-")

	table["poss"] = {}
	for pos_type in pos_types:
		if pos_type not in ["PSS2S", "PSS2P"]:
			table.setdefault(pos_type, {}).setdefault("SG", "-")
			table.setdefault(pos_type, {}).setdefault("PL", "-")
		table["poss"].update({pos_type: table.get(pos_type, {})})
		table.pop(pos_type, {})


	table["s"] = {}
	for case in case_types:
		table.setdefault(case, {}).setdefault("SG", "-")
		table.setdefault(case, {}).setdefault("PL", "-")
		table["s"].update({case: table.get(case, {})})
		table.pop(case, {})

