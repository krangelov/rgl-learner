import gzip
import json
import pickle
from pathlib import Path

def extract(lang):
    lexicon = []
    # the file should come from https://kaikki.org/dictionary/rawdata.html
    with gzip.open('raw-wiktextract-data.json.gz','r') as f:
        for line in f:
            record = json.loads(line)
            if record.get("lang_code")==lang:
                lexicon.append(record)

    dir = "data/"+lang
    Path(dir).mkdir(parents=True, exist_ok=True)
    with open(dir+"/lexicon.pickle", "wb") as f:
        pickle.dump(lexicon,f)
