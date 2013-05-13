import sys
from mock import MagicMock
sys.modules["GPS"] = MagicMock()    #mock GPS module
import sireum
import kiasan.logic
import urllib
import unittest
import subprocess
import os
import mock_helper

class TestIntegration4(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj4"
        self.output_path = self.project_path + "/.sireum/kiasan"
        self.sireum_path = sireum.get_sireum_path()     
        
        #mock GPS module
        mock_helper.sireum_path = self.sireum_path
        sys.modules["GPS"].Preference = MagicMock(side_effect = mock_helper.preference_mock)
        project_files = mock_helper.get_project_files(self.project_path)
        sys.modules["GPS"].current_context.return_value = mock_helper.get_current_context_mock(project_files)
        
    
    # performed before each test
    def setUp(self):        
        subprocess.call(["rm", "-rf", self.output_path])
        if not os.path.exists(self.project_path+"/.sireum"):
            os.makedirs(self.project_path+"/.sireum")
        subprocess.call(["mkdir", self.output_path])  
          
    
    # proj4 - all methods
    def test_proj4_all_methods(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "multicall", self.project_path, self.output_path, False)
        methods = ["main", "logic", "service", "service_logic", "repository"]
        for method in methods[:-1]:
            subprocess.call(kiasan_run_cmd + [method])
        kiasan_run_cmd_with_report = sireum.get_run_kiasan_command(self.sireum_path, "multicall", self.project_path, self.output_path, True)
        subprocess.call(kiasan_run_cmd_with_report + [methods[-1]])
                
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        
        self.assertTrue(os.path.isfile(report_file_path))
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        self.assertEqual("multicall", report[0]._name)
        self.assertEqual(len(methods), len(report[0]._methods))
        self.assertEqual(set(methods), set(m._name for m in report[0]._methods))
        
    # proj4 - main method
    def test_proj4_main(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "multicall", self.project_path, self.output_path, True)
        methods = ["main"]
        for method in methods:
            subprocess.call(kiasan_run_cmd + [method])
                
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        
        self.assertTrue(os.path.isfile(report_file_path))
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        self.assertEqual("multicall", report[0]._name)
        self.assertEqual(len(methods), len(report[0]._methods))
        self.assertEqual(set(methods), set(m._name for m in report[0]._methods))
        
    
        
    
    