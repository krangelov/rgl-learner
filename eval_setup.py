import sys
from evaluation import prepare_lang, run_conll, run_all, eval_exp_1

# repo link :


if len(sys.argv) == 3 and sys.argv[1] == "prepare-lang":
    prepare_lang.prepare_lang(sys.argv[2])
elif len(sys.argv) == 4 and sys.argv[1] == "run-conll":
    run_conll.extract(sys.argv[2], sys.argv[3])
elif len(sys.argv) == 2 and sys.argv[1] == "run-all":
    run_all.run()
elif len(sys.argv) == 2 and sys.argv[1] == "calc-data-amount":
    eval_exp_1.run()
else:
    print(f"Synopsis: {sys.argv[0]} prepare-lang  <lang-code>")
    print(f"          {sys.argv[0]} run-conll <lang-code> <level>")

