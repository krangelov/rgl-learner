import pickle
import math
from rgl_learner.learn_paradigms import write_paradigm

def learn(lang):
    with open(f"data/{lang}/paradigms.pickle", "rb") as f:
        langcode, tables = pickle.load(f)

    max_depth = 3
    min_count = 2

    with open(f"Paradigms{langcode}.gf", "w") as para:
        para.write(f"""resource Paradigms{langcode} = open Cat{langcode}, Res{langcode}, Predef in {{\n\noper""")

        for cat,paradigms in tables.items():
            classes = []
            for i,paradigm in enumerate(paradigms):
                para.write("\n\n" + write_paradigm(i+1, len(paradigms), paradigm, cat))

                for ident,forms in paradigm.tables:
                    classes.append((ident.split("_")[0],i+1))

            if len(paradigms) == 1:
                continue

            table       = []
            max_classes = []
            prev_dists  = []

            def trie(suffix,classes,i):
                nonlocal table, max_classes, prev_dists

                # c is the non-normalized probability distribution over classes
                c = {}
                for form,cls in classes:
                    c[cls] = c.get(cls,0)+1

                # find the most probable class. If there are several
                # classes with the same probability, prefer
                # the most probable one on the previous level.
                max_class = None
                max_value = (0,0)
                for cls,count in c.items():
                    idx = len(max_classes)-1
                    while idx >= 0:
                        if max_classes[idx] == cls:
                            break
                        idx -= 1
                    else:
                        idx = -1
                    val = (count,idx)
                    if val > max_value:
                        max_class = cls
                        max_value = val

                if len(c) > 1 and i < max_depth:
                    # group the classes by the current letter in the suffix
                    suffixes = {}
                    for form,cls in classes:
                        if i < len(form):
                            suffixes.setdefault(form[-(i+1)],[]).append((form,cls))

                    max_classes.append(max_class)
                    prev_dists.append(c)
                    for key,classes in suffixes.items():
                        trie(key+suffix,classes,i+1)
                    prev_dists.pop()
                    max_classes.pop()

                if max_value[0] > min_count and max_value[1] == -1:
                    table.append((suffix,max_class,c))
                    for cls,count in c.items():
                        for dist in prev_dists:
                            prev_count = dist[cls] - count
                            if prev_count == 0:
                                del dist[cls]
                            else:
                                dist[cls] = prev_count

            trie("",classes,0)

            if len(table) == 1 and table[0][0] == "":
                c1 = table[0][2][table[0][1]]
                c2 = sum(count for cls,count in table[0][2].items())
                code = f"mk{cat} : Str -> {cat} = mk{cat}{table[0][1]:03d} ;\n"
            else:
                c1 = 0
                c2 = 0
                cases = []
                for suffix,max_class,c in table:
                    entropy = 0
                    total = sum(count for cls,count in c.items())
                    for cls,count in c.items():
                        prob = count/total
                        entropy -= prob * math.log(prob)
                    c1 += c[max_class]
                    c2 += total

                    if entropy > 0:
                        comment = f" {{- {entropy} {c} -}}"
                    else:
                        comment = ""
                    cases.append(f'  _ + "{suffix}" => mk{cat}{max_class:03d} base{comment}')
                code = " ;\n".join(cases)
                code = f"\n\nmk{cat} : Str -> {cat} ;  -- {c1/c2 if c1 != c2 else 1.0}\nmk{cat} base = case base of {{\n{code}\n}} ;\n"
            para.write(code)

        para.write("\n}")
