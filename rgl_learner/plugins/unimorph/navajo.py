from collections import defaultdict
import rgl_learner.plugins as plugins

iso3 = "Nav"

source_plugin = plugins["unimorph"]
params = {'DU/PL': ("DuoPl", "Number"),
          'PSS3': ("Possesive_3", "Possesion"),
          'PSS4': ("Possesive_4", "Possesion"),
          'IPFV/PROG': ("Imperfective", "Aspect"),
          'PSS0': ("Possesive_0", "Possesion"),
          'PFV/PRF': ("Perfective", "Aspect")}

#default_params = {"Number": "SG"}

params = params | source_plugin.params

params_order = dict(zip(params.keys(), range(len(params))))

def merge_tags(pos, forms, w, tags):
    new_forms = []
    if "SG/DU/PL" in tags:
        tags_1 = list(map(lambda x: x.replace("SG/DU/PL", "SG"), tags))
        tags_2 = list(map(lambda x: x.replace("SG/DU/PL", "DU/PL"), tags))
        new_forms.append((w, tags_1))
        new_forms.append((w, tags_2))
        return new_forms
    return forms