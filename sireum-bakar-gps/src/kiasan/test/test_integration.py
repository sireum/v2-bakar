import fake_modules
import sys
sys.modules["GPS"] = fake_modules.GPS
import sireum

import kiasan.logic
import urllib
import unittest
import subprocess
import os

class TestIntegration1(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj1"
        self.output_path = self.project_path + "/.sireum/kiasan"
        self.sireum_path = sireum.get_sireum_path()     
        fake_modules.GPS.preferences['sireum-kiasan-array-indices-bound'] = fake_modules.Preference(5)
        fake_modules.GPS.preferences['sireum-kiasan-loop-bound'] = fake_modules.Preference(10)
        fake_modules.GPS.preferences['sireum-kiasan-call-chain-bound'] = fake_modules.Preference(10)
        fake_modules.GPS.preferences['sireum-kiasan-timeout'] = fake_modules.Preference(10)
        fake_modules.GPS.preferences['sireum-kiasan-constrain-scalar-values'] = fake_modules.Preference(True)
        fake_modules.GPS.preferences['sireum-kiasan-theorem-prover'] = fake_modules.Preference("Z3")
        fake_modules.GPS.preferences['sireum-kiasan-theorem-prover-bin-directory'] = fake_modules.Preference(self.sireum_path + "/apps/z3/bin")
        fake_modules.GPS.preferences['sireum-kiasan-generate-claim-report'] = fake_modules.Preference(False)
        fake_modules.GPS.preferences['sireum-kiasan-generate-json-output'] = fake_modules.Preference(True)
        fake_modules.GPS.preferences['sireum-kiasan-generate-aunit'] = fake_modules.Preference(False)
        fake_modules.GPS.preferences['sireum-kiasan-generate-html-report'] = fake_modules.Preference(False)
        fake_modules.GPS.preferences['sireum-kiasan-html-output-directory'] = fake_modules.Preference(self.sireum_path + "/apps/graphviz/bin/dot")
        
    
    # performed before each test
    def setUp(self):        
        subprocess.call(["rm", "-rf", self.output_path])
        subprocess.call(["mkdir", self.project_path+"/.sireum"])
        subprocess.call(["mkdir", self.output_path])     
          
    
    # proj1 - all methods
    def test_proj1_methods_add_and_foo(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "example", self.project_path, self.output_path, False)
        subprocess.call(kiasan_run_cmd + ["add"])
        kiasan_run_cmd_with_report = sireum.get_run_kiasan_command(self.sireum_path, "example", self.project_path, self.output_path, True)
        subprocess.call(kiasan_run_cmd_with_report + ["foo"])
                
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
        
    
        
    
    