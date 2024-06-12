# rgl-learner
A Semi-automatic Learning of RGL grammars.

The entry point is the script rgl-learner which starts different phases of the grammar extraction as described bellow.

## Data extraction

```Bash
./rgl-learner <wiktionary|unimorph> <lang-code>
```

This phase reads the data for the specified language from either Wiktionary or Unimorph and produces:

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

The extraction from Wikitionary expects that the current folder contains the file `raw-wiktextract-data.json.gz` which can be downloaded from:

https://kaikki.org/dictionary/rawdata.html

Similarly the extraction from Unimorph requires a clone of the
`unimorph/{lang}` repository in subfolder `data` of the current folder.
    
## Paradigm extraction
```Bash
./rgl-learner learn-paradigms <lang-code>
```

This phase reads the data produced during the previous phase. It then tries to predict the inflection tables from existing forms and morphological annotation. The code is based on [the paradigm extractor by Marcus Forsberg and Mark Hulden](https://github.com/marfors/paradigmextract/tree/8ceb702ee20dfde452fea2f7db6810a0ebf961cb).
