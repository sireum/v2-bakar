import warnings

class GPS(object):
    """Fake GPS module"""
    preferences = {}
    
    @staticmethod
    def parse_xml(xml):
        pass
    
    @staticmethod
    def Preference(key):
        return GPS.preferences[key]


class Preference(object):
    def __init__(self, value):
        self.value = value
        
    def get(self):
        return self.value           


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
        GPS.preferences['sireum-kiasan-array-indices-bound'] = Preference(5)
        GPS.preferences['sireum-kiasan-loop-bound'] = Preference(10)
        GPS.preferences['sireum-kiasan-call-chain-bound'] = Preference(10)
        GPS.preferences['sireum-kiasan-timeout'] = Preference(10)
        GPS.preferences['sireum-kiasan-constrain-scalar-values'] = Preference(True)
        GPS.preferences['sireum-kiasan-theorem-prover'] = Preference("Z3")
        GPS.preferences['sireum-kiasan-theorem-prover-bin-directory'] = Preference(self.sireum_path + "/apps/z3/bin")
        GPS.preferences['sireum-kiasan-generate-claim-report'] = Preference(False)
        GPS.preferences['sireum-kiasan-generate-json-output'] = Preference(True)
        GPS.preferences['sireum-kiasan-generate-aunit'] = Preference(False)
        GPS.preferences['sireum-kiasan-generate-html-report'] = Preference(False)
        GPS.preferences['sireum-kiasan-html-output-directory'] = Preference(self.sireum_path + "/apps/graphviz/bin/dot")
        
    
    # performed before each test
    def setUp(self):        
        subprocess.call(["rm", "-rf", self.output_path])
        subprocess.call(["mkdir", self.output_path])     
          
    
    # proj1 - all methods
    def test_proj1_methods_add_and_foo(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "example", self.project_path, self.output_path)
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
    