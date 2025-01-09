# rgl-learner
A Semi-automatic Learning of RGL grammars.

The entry point is the script rgl-learner which starts different phases of the grammar extraction as described bellow.

## Data extraction

```Bash
./rgl-learner morpho-cats <wiktionary|unimorph> <lang-code>
```

This phase reads the data for the specified language from either Wiktionary or Unimorph and produces:

  - CatXXX.gf - a prototype for the Cat module which only contains the lincats
  - ResXXX.gf - a prototype for the Res module which contains the lincats defined as operations. It also defines one operation per part of speech which creates
                an entry of that type
  - DictXXX.gf - a dictionary for the language

Because the paradigms in the input data may be incomplete the generated code will not compile out of the box. To improve it you can write a plugin for each
combination of data source and language. For example the plugin `rgl_learner/plugins/wiktionary/mk.py` contains the code specific to Macedonian when extracted from Wiktionary.
In the plugin you can define the following variables and functions:
  - the variable `iso3` contains the code which you want to use for the generated code, i.e. XXX in the above
  - one patch function per part of speech, e.g. `patchN` for instance, which can manipulate inflection tables as extracted from the data source. The inflection table is a trie
    where the keys are tags and the values are the actual forms. The role of the patch function is to remove forms that you don't want to have or to add more forms.
    You can add "-" for forms that must exist but you don't know them. After the patching all inflection tables must be uniform, i.e. all of them must have the same set of forms.
  - the variable `params` contains additional parameters that are different from the source parameters;
  - the variable `order` is a list of parameters that defines the order in which the parameters will be encoded later; by default the order will be the same as in the data source;
  - the variable `ignore_tags` is a list of tags that would be excluded from processing;
  - the variable `default_params` is a dictionary with parameters as keys and tags as values. If a parameter is missing, the default value from this dictionary will be inserted; by default the placeholder, such as 'noNumber', will be inserted;
  - the variable `required_forms` is a dictionary with parts-of-speech (POS) as keys and a list of forms as values. The first form in each list should be the default form for this POS. The later forms would define other forms in smart paradigms;
  - the function `filter_lemma` defines lemmas that need to be filtered out or their POS is incorrect in the annotation data;
  - the function `filter_form` filters out specific forms that should be included into paradigms;
  - the function `fix_tags` can be used to fix misspelling in data source or other problems with tags;
  - the function `merge_tags` is used if tags for several forms are merged into one entry in data source (for example, MASC+FEM in UniMorph if masculine and feminine forms are the same wordform). In this function, one can define how to separate them.

The extraction from Wikitionary expects that the current folder contains the file `raw-wiktextract-data.json.gz` which can be downloaded from:

https://kaikki.org/dictionary/rawdata.html

Similarly the extraction from Unimorph requires a clone of the
`unimorph/{lang}` repository in subfolder `data` of the current folder.
    
## Paradigm extraction
```Bash
./rgl-learner learn-paradigms <lang-code>
```

This phase reads the data produced during the previous phase. It then tries to predict the inflection tables from existing forms and morphological annotation. The code is based on [the paradigm extractor by Marcus Forsberg and Mans Hulden](https://github.com/marfors/paradigmextract/tree/8ceb702ee20dfde452fea2f7db6810a0ebf961cb).


## Smart paradigms
```Bash
./rgl-learner build-paradigms <lang-code>
```

This stage creates smart paradigms based on tree algorithm. You can also use following arguments in the command line:
- `--how`: defines if forms should be treated as with prefix or suffix
- `--min_examples` (default=2): defines how many examples should be in the inflection table to be included as a class in the tree.
- `--iter` (default=3): in each iteration, the next form is sampled, therefore, the argument defines the maximum of taken forms in the paradigm;
- `--sampling` (default="oracle"): defines the sampling procedure:
  - `oracle`: takes the form with the biggest number of incorrect predictions;
  - `edit-distance`: takes the form that on average has the biggest edit distance among all forms;
  - `entropy`: takes the form with highest entropy taken from the tree;
  - `random`: randomly picks a new form; used as a baseline
- `--min_sample_leaf` (default=2): defines the early stopping criteria with the minimum of examples in the leaf;
- `--max_depth` (default=3): defines the maximum depth of the tree;
- `--threshold` (default=100): defines how many examples are included in the training data
- `--split`: used to split data into training and testing samples


## Documentation 
```Bash
./rgl-learner documentation <lang-code>
```