from rgl_learner.utils import *

iso3 = "Gle"

params = {"negative": ("Neg", "Polarity"),
          "third_person": ("P3", "Person"),
          "transitive": ("Transitive", "Transitivity"),
		  "mutation-radical": ("Mutation_radical", "Mutation"),
		  "prothesis-t": ("Prothesis_t", "Mutation"),
		  "prothesis-h": ("Prothesis_h", "Mutation"),
          "eclipsis": ("Eclipsis", "Mutation"),
          "lenition": ("Lenition", "Mutation"),
		  "triggers-lenition": ("Triggers_lenition", "Mutation"),
		  "strong": ("Strong", "Mutation"),
          }

def fix_tags(tag):
	if tag == None:
		return "normal_form"
	return tag
