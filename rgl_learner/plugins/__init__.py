import sys
import os.path
import importlib.util

class PluginWrapper:
    def __init__(self,module):
        self.module = module
        self.iso3 = module.get("iso3",module["__name__"])
        self.params = module.get("params", {})
        self.params_order = module.get("params_order", {})
        self.ignore_tags = module.get("ignore_tags", [])
        self.params_order = module.get("params_order", {})

    def preprocess(self,*args):
        fn = self.module.get("preprocess")
        if fn:
            return fn(*args)
        return True

    def patch_inflection(self,cat,*args):
        fn = self.module.get("patch"+cat)
        if fn:
            return fn(*args)

    def patchPOS(self,lemma,cat,*args):
        fn = self.module.get("patchPOS")
        if fn:
            return fn(lemma,cat,*args)
        return cat

    def filter_lemma(self,*args):
        fn = self.module.get("filter_lemma")
        return fn and fn(*args)

    def filter_form(self,*args):
        fn = self.module.get("filter_form")
        return fn and fn(*args)

    def nested_key_exists(self,*args):
        fn = self.module.get("nested_key_exists")
        return fn and fn(*args)

    def __getattr__(self,name):
        return self.module[name]

    def convert2gf(self, tag, params):
        fn = self.module.get("convert2gf")
        if fn:
            return fn(tag, params)
        return tag

    def fix_tags(self, tag):
        fn = self.module.get("fix_tags")
        if fn:
            return fn(tag)
        return tag

    def merge_tags(self, pos, forms, w, tags):
        fn = self.module.get("merge_tags")
        if fn:
            return fn(pos, forms, w, tags)
        return forms, tags

class PluginManager:
    def __getitem__(self,key):
        if type(key) is str:
            lang = key
            path = os.path.dirname(__file__) + '/' + key + '.py'
            mod  = "rgl_learner.plugins."+key
        elif type(key) is tuple and len(key) == 2:
            lang = key[1]
            path = os.path.dirname(__file__) + '/' + key[0] + '/' + key[1] + '.py'
            mod  = "rgl_learner.plugins."+key[0]+"."+key[1]
        else:
            raise TypeError("The key to a plugin must be either a string or a pair of strings")

        if os.path.isfile(path):
            spec = importlib.util.spec_from_file_location(mod, path)
            plugin = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(plugin)
            plugin = plugin.__dict__
        else:
            plugin = {"__name__": lang}
        return PluginWrapper(plugin)

sys.modules[__name__] = PluginManager()
