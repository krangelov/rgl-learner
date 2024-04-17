# rgl-learner
Automatic Learning of RGL grammars.

The entry point is the script rgl-learner which starts different phases of the grammar extraction as described bellow.

## Data extraction

```Bash
./rgl-learner <wiktionary|unimorph> <lang-code>
```

This phase reads the data for the specified language from either Wiktionary or Unimorph and stores the extracted data in the file `data/<lang-code>/lexicon.pickle`.
The data extraction is a plugin and is implemented in either `rgl_learner/plugins/wiktionary.py` or `rgl_learner/plugins/unimorph.py`.

In particular the extract from Wikitionary expects that the current folder contains the file `raw-wiktextract-data.json.gz` which can be downloaded from:

https://kaikki.org/dictionary/rawdata.html


## Morphological Categories

```Bash
./rgl-learner morpho-cats <wiktionary|unimorph> <lang-code>
```

This phase reads the already extracted data in `data/<lang-code>/lexicon.pickle` and finds out the linearization categories for the lexicon.
The phase is still source dependent since the annotations are different for Wiktionary and Unimorph. The output of the phase are the files:
  - CatXXX.gf - a prototype for the Cat module which only contains the lincats
  - ResXXX.gf - a prototype for the Res module which contains the lincats defined as operations. It also defines one operation per part of speech which creates
                an entry of that type
  - DictXXX.gf - a dictionary for the language

Because the paradigms in the input data may be incomplete the generated code will not compile out of the box. To improve it you can write a plugin for each
combination of data source and language. For example the plugin `rgl_learner/plugins/wiktionary/mk.py` contains the code specific to Macedonian when extracted from Wiktionary.
In the plugin you can define the following:
  - the variable iso3 contains the code which you want to use for the generated code, i.e. XXX in the above
  - one patch function per part of speech, e.g. `patchN` for instance, which can manipulate inflection tables as extracted from the data source. The inflection table is a trie
    where the keys are tags and the values are the actual forms. The role of the patch function is to remove forms that you don't want to have or to add more forms.
    You can add "-" for forms that must exist but you don't know them. After the patching all inflection tables must be uniform, i.e. all of them must have the same set of forms.
    
## Paradigm extraction
```Bash
./rgl-learner parse-paradigm <lang-code>
```

This phase reads files produced during previous phase, i.e. ResXXX.gf and DictXXX.gf. It then tries to predict the inflection tables from existing forms and morphological annotation. The code is based on [the paradigm extractor by Marcus Forsberg and Mark Hulden](https://github.com/marfors/paradigmextract/tree/8ceb702ee20dfde452fea2f7db6810a0ebf961cb).