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


class TestIntegration1(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj1"
        self.output_path = self.project_path + "/.sireum/kiasan"
        self.sireum_path = sireum.get_sireum_path()
        self.report_file_name = "kiasan_sireum_report.json"
        
        #mock GPS module
        mock_helper.sireum_path = self.sireum_path
        sys.modules["GPS"].Preference = MagicMock(side_effect = mock_helper.preference_mock)
        sys.modules["GPS"].current_context.return_value = mock_helper.get_current_context_mock(self.project_path)


    # performed before each test
    def setUp(self):        
        subprocess.call(["rm", "-rf", self.output_path])
        if not os.path.exists(self.project_path+"/.sireum"):
            os.makedirs(self.project_path+"/.sireum")
        subprocess.call(["mkdir", self.output_path])

        
    # proj1 - all methods
    def test_proj1_methods_add_and_foo(self):
        kiasan_run_cmd = sireum.get_run_kiasan_command(self.sireum_path, "example", self.project_path, self.output_path, False)
        subprocess.call(kiasan_run_cmd + ["add"])
        kiasan_run_cmd_with_report = sireum.get_run_kiasan_command(self.sireum_path, "example", self.project_path, self.output_path, True)
        subprocess.call(kiasan_run_cmd_with_report + ["foo"])
                
        report_file_path = self.output_path + "/" + self.report_file_name
        
        self.assertTrue(os.path.isfile(report_file_path), "Report file not generated")
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path + "/" + self.report_file_name
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertEqual("example", report[0]._name)
        self.assertEqual(2, len(report[0]._methods))
        self.assertEqual(set(["add","foo"]), set(m._name for m in report[0]._methods))
    