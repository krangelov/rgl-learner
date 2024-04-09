import sys
import os.path
import importlib.util

class PluginWrapper:
    def __init__(self,module):
        self.module = module
        self.iso3 = module.__dict__.get("iso3",module.__name__)
        
    def patch_inflection(self,cat,*args):
        fn = self.module.__dict__.get("patch"+cat)
        if fn:
            return fn(*args)

    def __getattr__(self,name):
        return self.module.__dict__[name]

class PluginManager:
    def __getitem__(self,key):
        if type(key) is str:
            path = os.path.dirname(__file__) + '/' + key + '.py'
            mod  = "rgl_learner.plugins."+key
        elif type(key) is tuple and len(key) == 2:
            path = os.path.dirname(__file__) + '/' + key[0] + '/' + key[1] + '.py'
            mod  = "rgl_learner.plugins."+key[0]+"."+key[1]
        else:
            raise TypeError("The key to a plugin must be either a string or a pair of strings")

        if os.path.isfile(path):
            spec = importlib.util.spec_from_file_location(mod, path)
            plugin = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(plugin)
        else:
            plugin = {}
        return PluginWrapper(plugin)

sys.modules[__name__] = PluginManager()
