import warnings
# fake GPS module
preferences = {}


class GPS(object):
    """Fake GPS module"""
    @staticmethod
    def parse_xml(xml):
        pass
    
    @staticmethod
    def Preference(key):
        global preferences 
        preferences[key]


class Preference(object):
    def __init__(self, value):
        self.value = value
        
    def get(self):
        return self.value           


warnings.warn('temp method...fake GPS.Preference doesn\'t works from sireum package')
def get_run_kiasan_command(SIREUM_PATH, package_name, output_dir):
    """ Create command for run Kiasan. """
    kiasan_lib_dir = SIREUM_PATH + "/apps/bakarv1/eclipse/plugins/org.sireum.spark.eclipse_0.0.4.201302271712/lib/"    
    
    run_kiasan_command = []
    run_kiasan_command.append(SIREUM_PATH + "/apps/platform/java/bin/java")
    run_kiasan_command.append("-jar")
    run_kiasan_command.append(kiasan_lib_dir + "BakarKiasan.jar")
    run_kiasan_command.append("--topi-lib-dir")
    run_kiasan_command.append(kiasan_lib_dir)
    run_kiasan_command.append("--outdir")
    run_kiasan_command.append(output_dir)
    run_kiasan_command.append("--array-bound")
    run_kiasan_command.append(str(5))
    run_kiasan_command.append("--loop-bound")
    run_kiasan_command.append(str(10))
    run_kiasan_command.append("--invoke-bound")
    run_kiasan_command.append(str(10))
    run_kiasan_command.append("--timeout")
    run_kiasan_command.append(str(10))
    run_kiasan_command.append("--constrain-values")
    run_kiasan_command.append("--smt")
    run_kiasan_command.append("Z3")
    run_kiasan_command.append("--constraint-solver")
    run_kiasan_command.append("Z3")
    run_kiasan_command.append("--topi-bin-dir")
    run_kiasan_command.append(SIREUM_PATH + "/apps/z3/bin")
    run_kiasan_command.append("--generate-claim-coverage-report")
    run_kiasan_command.append("--modular-analysis") 
    run_kiasan_command.append("--source-paths=" + output_dir+"/../..")
    run_kiasan_command.append("--source-files=" + package_name + ".adb" + "," + package_name + ".ads")
    run_kiasan_command.append("--print-trace-bound-exhausted")
    run_kiasan_command.append("--generate-sireum-report") 
    run_kiasan_command.append("--generate-xml-report")
    run_kiasan_command.append("--generate-json-report")
    run_kiasan_command.append(package_name)
    
    return run_kiasan_command

import sys
sys.modules["GPS"] = GPS
import sireum

import kiasan.logic
import urllib

import unittest
import subprocess
import os

class Test(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj1"
        self.output_path = self.project_path + "/.sireum/kiasan"
        self.sireum_path = sireum.get_sireum_path()        
        preferences['sireum-kiasan-array-indices-bound'] = Preference(5)
        preferences['sireum-kiasan-loop-bound'] = Preference(10)
        preferences['sireum-kiasan-call-chain-bound'] = Preference(10)
        preferences['sireum-kiasan-timeout'] = Preference(10)
        preferences['sireum-kiasan-constrain-scalar-values'] = Preference(True)
        preferences['sireum-kiasan-theorem-prover'] = Preference("Z3")
        preferences['sireum-kiasan-theorem-prover-bin-directory'] = Preference(self.sireum_path + "/apps/z3/bin")
        preferences['sireum-kiasan-generate-claim-report'] = Preference(False)
        preferences['sireum-kiasan-generate-json-output'] = Preference(True)
        preferences['sireum-kiasan-generate-aunit'] = Preference(False)
        preferences['sireum-kiasan-generate-html-report'] = Preference(False)
        preferences['sireum-kiasan-html-output-directory'] = Preference(self.sireum_path + "/apps/graphviz/bin/dot")
        
    
    # performed before each test
    def setUp(self):        
        subprocess.call(["rm", "-rf", self.output_path])
        subprocess.call(["mkdir", self.output_path])     
          
    
    # proj1 - all methods
    def test_proj1_methods_add_and_foo(self):
        kiasan_run_cmd = get_run_kiasan_command(self.sireum_path, "example", self.output_path)
        subprocess.call(kiasan_run_cmd + ["add"])
        subprocess.call(kiasan_run_cmd + ["foo"])
                
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        
        self.assertTrue(os.path.isfile(report_file_path))
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertEqual("example", report[0]._name)
        self.assertEqual(2, len(report[0]._methods))
        self.assertEqual(set(["add","foo"]), set(m._name for m in report[0]._methods))
        
        
    
    def test_pass(self):
        assert(True)