import gzip
import json
import pickle
import os.path
from pathlib import Path

tag2cat = {
  'noun': 'N',
  'verb': 'V',
  'adj': 'A',
  'name': 'PN',
  'pron': 'Pron',
  'adv': 'Adv',
  'det': 'Det',
  'prep': 'Prep',
  }

params = {
 # 'comparative': None,
 # 'superlative': None,
  'comparative': ('Comp', 'Comparison'),
  'superlative': ('Superlat', 'Comparison'),
  'indefinite': ('Indef','Species'),
  'definite': ('Def','Species'),
  'unspecified': ('Unspecified','Distance'),
  'proximal': ('Proximal','Distance'),
  'distal': ('Distal','Distance'),
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
  'instrumental': ('Instr','Case'),
  'indicative': ('Indicative', 'Mood'),
  'subjunctive': ('Subjunctive', 'Mood'),
  'conditional': ('Conditional', 'Mood'),
  'optative': ('Optative', 'Mood'),
  'admirative': ('Admirative', 'Mood'),
  'imperative': ('Imperative', 'Mood'),
  'jussive': ('Jussive', 'Mood'),
  "progressive": ('Progressive', 'Mood'),
  'present': ('Pres','Tense'),
  'past': ('Past','Tense'),
  'aorist': ('Aorist','Tense'),
  'aorist-ii': ('Aorist2','Tense'),
  'future': ('Fut','Tense'),
  'future-i': ('Fut1','Tense'),
  'future-ii': ('Fut2','Tense'),
  'imperfective': ('Imperf','Tense'),
  'imperfect': ('Imperfect','Tense'),
  'perfect': ('Perf','Tense'),
  'pluperfect': ('Pluperf','Tense'),
  'past-perfect': ('PastPerfect','Tense'),
  'future-perfect': ('PastPerfect','Tense'),
  'masculine': ('Masc','Gender'),
  'feminine': ('Fem','Gender'),
  'neuter': ('Neuter','Gender'),
  'singular': ('Sg','Number'),
  'plural': ('Pl','Number'),
  'first-person': ('P1','Person'),
  'second-person': ('P2','Person'),
  'third-person': ('P3','Person'),
}


params_order = dict(zip(params.keys(), range(len(params))))

ignore_tags = ['adjective', 'canonical', 'diminutive', 'romanization', 'table-tags', 'inflection-template', 'multiword-construction', "error-unknown-tag",
               "analytic", "emphatic", "archaic", "dialectal"]

def extract(lang):
    dir = "data/"+lang
    Path(dir).mkdir(parents=True, exist_ok=True)
    fpath = dir+"/wiktionary.pickle"

    if not os.path.exists(fpath):
        print(f"Extracting data from raw-wiktextract-data.json.gz for {lang}.")
        lexicon = []
        with gzip.open('raw-wiktextract-data.json.gz','r') as f:
            for line in f:
                record = json.loads(line)
                if record.get("lang_code")==lang:
                    word  = record["word"]
                    pos   = record.get("pos")
                    forms = []
                    for form in record.get("forms",[]):
                        w    = form["form"]
                        tags = form.get("tags",[])
                        forms.append((w,tags))
                    lexicon.append((word,pos,forms))

        with open(fpath, "wb") as f:
            pickle.dump(lexicon,f)
    else:
        with open(fpath, "rb") as f:
            lexicon = pickle.load(f)

    return lexicon
