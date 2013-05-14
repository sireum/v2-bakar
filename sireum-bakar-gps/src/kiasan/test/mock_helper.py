from mock import MagicMock
import os

sireum_path = ""


def get_project_files(project_path):
    return [each for each in os.listdir(project_path) if each.endswith('.adb') or each.endswith('.ads')]


def preference_mock(*args, **kwargs):
    preference_name = args[0]
    pref = MagicMock()
    pref.get.return_value = 5
#    pref.get.return_value = {
#        'sireum-kiasan-array-indices-bound': 5,
#        'sireum-kiasan-loop-bound': 10,
#        'sireum-kiasan-call-chain-bound': 10,
#        'sireum-kiasan-timeout': 10,
#        'sireum-kiasan-constrain-scalar-values': True,
#        'sireum-kiasan-theorem-prover': 'Z3',
#        'sireum-kiasan-theorem-prover-bin-directory': sireum_path + "/apps/z3/bin",
#        'sireum-kiasan-generate-claim-report': False,
#        'sireum-kiasan-generate-json-output': True,
#        'sireum-kiasan-generate-aunit': False,
#        'sireum-kiasan-generate-html-report': False,
#        'sireum-kiasan-html-output-directory': sireum_path + "/apps/graphviz/bin/dot"
#    }[preference_name]
    return pref


def get_current_context_mock(project_path):
    project_files = get_project_files(project_path)
    sources = []
    for proj_file in project_files:
        mock = MagicMock()
        mock.name.return_value = proj_file
        sources.append(mock)        
    
    project = MagicMock()
    project.sources.return_value = sources
    
    context = MagicMock()
    context.project.return_value = project
    
    return context