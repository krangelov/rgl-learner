import pickle
import rgl_learner.plugins as plugins

def learn(source,lang):
    source_plugin = plugins[source]
    lang_plugin   = plugins[source,lang]

    lexicon=source_plugin.extract(lang)

    def traverse(o):
        nonlocal l,tags,max_ls,max_match
        match o:
            case type():
                match = tuple(tag for tag in l if tag in tags)
                if len(match) > max_match:
                    max_match = len(match)
                    max_ls = {match: list(l)}
                elif len(match) == max_match:
                    max_ls.setdefault(match, list(l))
            case dict():
                for k,v in o.items():
                    l.append(k)
                    traverse(v)
                    l.pop(-1)
            case list():            
                found = False
                for tag, info in source_plugin.params.items():
                    if type(info) == tuple and o[0] == info[1]:
                        found = True
                        l.append(tag)
                        traverse(o[1] if len(o)==2 else o[1:])
                        l.pop(-1)
                if not found:
                    raise TypeError("Unknown parameter type "+o[0])

    def dump(table,i):
        match table:
            case dict():
                for key,value in table.items():
                    print(" "*i+key+":")
                    dump(value,i+2)
            case set():
                for w in table:
                    print(" "*i+"- "+w)

    def dump_stats(stats,i):
        for key,value in stats.items():
            match value:
                case dict():
                    print(" "*i+key+":")
                    dump_stats(value,i+2)
                case tuple():
                    added,removed,sample = value
                    print(" "*i+key+" +"+str(added)+" -"+str(removed)+" "+str(sample))

    stats = {}
    for word, pos, forms, gtags in lexicon:
        templ = lang_plugin.lincats.get(pos, {"s": str})
        table = {}
        for w,tags in forms:
            max_match = 0
            max_ls    = {}
            l         = []
            traverse(templ)
            for match,max_l in max_ls.items():
                t = table
                for i in range(len(max_l)-1):
                    t = t.setdefault(max_l[i],{})
                t.setdefault(max_l[-1],set()).add(w)
                t = stats.setdefault(pos,{})
                for tag in max_l:
                    t = t.setdefault(tag,{})
                for tag in max_l:
                    if tag != "s" and tag not in match:
                        added,removed,sample = t.get(tag,(0,0,[]))
                        t[tag] = (added+1,removed,sample)
                        if len(sample) < 3:
                            sample.append(w)
                for tag in tags:
                    if tag not in match:
                        added,removed,sample = t.get(tag,(0,0,[]))
                        t[tag] = (added,removed+1,sample)
                        if len(sample) < 3:
                            sample.append(w)
    for pos,t in stats.items():
        print(pos+":")
        dump_stats(t,2)
