import gzip
import json
import pickle
from pathlib import Path

tag2cat = {
  'noun': 'N',
  'verb': 'V',
  'adj': 'A',
  'name': 'PN',
  'pron': 'Pron',
  'adv': 'Adv',
  'det': 'Det'
  }

params = {
  'definite': ('Def','Species'),
  'indefinite': ('Indef','Species'),
  'singular': ('Sg','Number'),
  'plural': ('Pl','Number'),
  'nominative': ('Nom','Case'),
  'accusative': ('Acc','Case'),
  'dative': ('Dat','Case'),
  'genitive': ('Gen','Case'),
  'vocative': ('Voc','Case'),
  'partitive': ('Part','Case'),
  'inessive': ('Iness','Case'),
  'elative': ('Elat','Case'),
  'illative': ('Illat','Case'),
  'adessive': ('Adess','Case'),
  'ablative': ('Ablat','Case'),
  'allative': ('Allat','Case'),
  'essive': ('Ess','Case'),
  'translative': ('Transl','Case'),
  'instructive': ('Instr','Case'),
  'abessive': ('Abess','Case'),
  'comitative': ('Comit','Case'),
  'possessive': ('Poss','Case'),
  'locative': ('Loc','Case'),
  'copulative': ('Cop','Case'),
  'unspecified': ('Unspecified','Distance'),
  'proximal': ('Proximal','Distance'),
  'distal': ('Distal','Distance'),
  'first-person': ('P1','Person'),
  'second-person': ('P2','Person'),
  'third-person': ('P3','Person'),
  'imperfective': ('Imperf','Tense'),
  'imperfect': ('Imperfect','Tense'),
  'aorist': ('Aorist','Tense'),
  'perfect': ('Perf','Tense'),
  'present': ('Pres','Tense'),
  'masculine': ('Masc','Gender'),
  'feminine': ('Fem','Gender'),
  'neuter': ('Neuter','Gender'),
}

ignore_tags = ['adjective', 'canonical', 'diminutive', 'romanization', 'table-tags', 'inflection-template']

def extract(lang):
    lexicon = []
    with gzip.open('raw-wiktextract-data.json.gz','r') as f:
        for line in f:
            record = json.loads(line)
            if record.get("lang_code")==lang:
                lexicon.append(record)
                
    dir = "data/"+lang
    Path(dir).mkdir(parents=True, exist_ok=True)
    with open(dir+"/lexicon.pickle", "wb") as f:
        pickle.dump(lexicon,f)
