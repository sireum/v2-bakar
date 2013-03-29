import fake_modules
import sys
sys.modules["GPS"] = fake_modules.GPS
import sireum

import kiasan.logic
import urllib
import unittest
import subprocess
import os

class TestIntegration2(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj2"
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
        
    
    # proj2 - all methods
    def test_proj2_methods_add_sub_mul(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "calc", self.project_path, self.output_path, False)
        methods = ["add", "sub", "mul"]
        for method in methods[:-1]:
            subprocess.call(kiasan_run_cmd + [method])
        kiasan_run_cmd_with_report = sireum.get_run_kiasan_command(self.sireum_path, "calc", self.project_path, self.output_path, True)
        subprocess.call(kiasan_run_cmd_with_report + [methods[-1]])
            
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        self.assertEqual("calc", report[0]._name)
        self.assertEqual(len(methods), len(report[0]._methods))
        self.assertEqual(set(methods), set(m._name for m in report[0]._methods))
        
    def test_proj2_method_add(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "calc", self.project_path, self.output_path, True)
        methods = ["add"]
        for method in methods:
            subprocess.call(kiasan_run_cmd + [method])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        self.assertEqual("calc", report[0]._name)
        self.assertEqual(len(methods), len(report[0]._methods))
        self.assertEqual(set(methods), set(m._name for m in report[0]._methods))
        
        
    def test_proj2_method_sub(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "calc", self.project_path, self.output_path, True)
        methods = ["sub"]
        for method in methods:
            subprocess.call(kiasan_run_cmd + [method])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        self.assertEqual("calc", report[0]._name)
        self.assertEqual(len(methods), len(report[0]._methods))
        self.assertEqual(set(methods), set(m._name for m in report[0]._methods))
        
        
    def test_proj2_method_mul(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "calc", self.project_path, self.output_path, True)
        methods = ["mul"]
        for method in methods:
            subprocess.call(kiasan_run_cmd + [method])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        self.assertEqual("calc", report[0]._name)
        self.assertEqual(len(methods), len(report[0]._methods))
        self.assertEqual(set(methods), set(m._name for m in report[0]._methods))
        