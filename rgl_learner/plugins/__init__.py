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

class PluginManager:
    def __getitem__(self,lang):
        path = os.path.dirname(__file__) + '/' + lang + '.py'
        if os.path.isfile(path):
            spec = importlib.util.spec_from_file_location("rgl_learner.plugins."+lang, path)
            plugin = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(plugin)
        else:
            plugin = {}
        return PluginWrapper(plugin)

sys.modules[__name__] = PluginManager()
