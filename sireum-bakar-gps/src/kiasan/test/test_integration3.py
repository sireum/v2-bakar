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


class TestIntegration3(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj3"
        self.output_path = self.project_path + "/.sireum/kiasan"
        self.sireum_path = sireum.get_sireum_path()  
        self.report_file_name = "kiasan_sireum_report.json"   
        
        #mock GPS module       
        sys.modules["GPS"].get_system_dir = MagicMock()
        sys.modules["GPS"].get_system_dir.return_value = "$SIREUM_HOME/apps/gnat/bin/2014" 
        mock_helper.sireum_path = self.sireum_path
        sys.modules["GPS"].Preference = MagicMock(side_effect = mock_helper.preference_mock)
        sys.modules["GPS"].current_context.return_value = mock_helper.get_current_context_mock(self.project_path)
        
    
    # performed before each test
    def setUp(self):        
        subprocess.call(["rm", "-rf", self.output_path])
        if not os.path.exists(self.project_path+"/.sireum"):
            os.makedirs(self.project_path+"/.sireum")
        subprocess.call(["mkdir", self.output_path])

           
    def test_proj3_odometer(self):
        kiasan_run_cmd_odometer = sireum.get_run_kiasan_command(self.sireum_path, "Odometer", self.project_path, self.output_path, False)
        methods_odometer = ["Invariant","Zero_Trip", "Read_Trip", "Read_Total", "Inc", "Set_Mark", "Factory_Reset"]
        for method in methods_odometer[:-1]:
            subprocess.call(kiasan_run_cmd_odometer + [method])
        kiasan_run_cmd_with_report = sireum.get_run_kiasan_command(self.sireum_path, "Odometer", self.project_path, self.output_path, True)
        subprocess.call(kiasan_run_cmd_with_report + [methods_odometer[-1]])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path + "/" + self.report_file_name
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        odometer_ind = list(r._name for r in report).index("Odometer")
        self.assertTrue(odometer_ind >= 0)
        self.assertEqual(len(methods_odometer), len(report[odometer_ind]._methods))
        self.assertEqual(set(methods_odometer), set(m._name for m in report[odometer_ind]._methods))
    
    
    def test_proj3_odometer_method_inc(self):
        kiasan_run_cmd_odometer = sireum.get_run_kiasan_command(self.sireum_path, "Odometer", self.project_path, self.output_path, True)
        methods_odometer = ["Inc"]
        for method in methods_odometer:
            subprocess.call(kiasan_run_cmd_odometer + [method])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path + "/" + self.report_file_name
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        odometer_ind = list(p._name for p in report).index("Odometer")
        self.assertTrue(odometer_ind >= 0)
        self.assertEqual(len(methods_odometer), len(report[odometer_ind]._methods))
        self.assertEqual(set(methods_odometer), set(m._name for m in report[odometer_ind]._methods))
        self.assertIsNotNone(report[odometer_ind]._methods[0].get_case(0)._pre_state);
        self.assertIsNotNone(report[odometer_ind]._methods[0].get_case(0)._post_state);
        
        
    
    # proj2 - all methods
    def test_proj3_all_packages_and_methods(self):
        kiasan_run_cmd_odometer = sireum.get_run_kiasan_command(self.sireum_path, "Odometer", self.project_path, self.output_path, False)
        methods_odometer = ["Invariant","Zero_Trip", "Read_Trip", "Read_Total", "Inc", "Set_Mark", "Factory_Reset"]
        for method in methods_odometer:
            subprocess.call(kiasan_run_cmd_odometer + [method])
        
        kiasan_run_cmd_simple_sort = sireum.get_run_kiasan_command(self.sireum_path, "Simple_Sort", self.project_path, self.output_path, False)
        methods_simple_sort = ["isSorted","isPerm", "BubbleSort", "BubbleSort_using_SwapElements", "InsertionSort", "SelectionSort", "ShellSort"]
        for method in methods_simple_sort:
            subprocess.call(kiasan_run_cmd_simple_sort + [method])
        
        kiasan_run_cmd_swap = sireum.get_run_kiasan_command(self.sireum_path, "Swap_Examples", self.project_path, self.output_path, True)
        methods_swap = ["Swap"]
        for method in methods_swap:
            subprocess.call(kiasan_run_cmd_swap + [method])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path + "/" + self.report_file_name
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        
        odometer_ind = list(r._name for r in report).index("Odometer")
        self.assertTrue(odometer_ind >= 0)
        self.assertEqual(len(methods_odometer), len(report[odometer_ind]._methods))
        self.assertEqual(set(methods_odometer), set(m._name for m in report[odometer_ind]._methods))
        
        simple_sort_ind = list(r._name for r in report).index("Simple_Sort")
        self.assertTrue(simple_sort_ind >= 0)
        self.assertEqual(len(methods_simple_sort), len(report[simple_sort_ind]._methods))
        self.assertEqual(set(methods_simple_sort), set(m._name for m in report[simple_sort_ind]._methods))
        
        swap_ind = list(r._name for r in report).index("Swap_Examples")
        self.assertTrue(swap_ind >= 0)
        self.assertEqual(len(methods_swap), len(report[swap_ind]._methods))
        self.assertEqual(set(methods_swap), set(m._name for m in report[swap_ind]._methods))