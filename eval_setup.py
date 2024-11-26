import sys
from evaluation import prepare_lang, run_conll


if len(sys.argv) == 3 and sys.argv[1] == "prepare_lang":
    prepare_lang.prepare_lang(sys.argv[2])
elif len(sys.argv) == 4 and sys.argv[1] == "run_conll":
    run_conll.extract(sys.argv[2], sys.argv[3])
else:
    print(f"Synopsis: {sys.argv[0]} morpho-cats <wiktionary|unimorph> <lang-code>")
    print(f"          {sys.argv[0]} construct-table <wiktionary|unimorph> <lang-code>")
    print(f"          {sys.argv[0]} learn-paradigms <lang-code>")
    print(f"          {sys.argv[0]} smart-paradigms <lang-code>")
    print(f"          {sys.argv[0]} build-lemma-tree <lang-code>")
    print(f"          {sys.argv[0]} smart-dictionary <lang-code>")
