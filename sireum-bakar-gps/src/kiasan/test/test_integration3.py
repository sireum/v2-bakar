import fake_modules
import sys
sys.modules["GPS"] = fake_modules.GPS
import sireum

import kiasan.logic
import urllib
import unittest
import subprocess
import os

class TestIntegration3(unittest.TestCase):
    """Integration tests from Kiasan plugin."""
    
    # performed before all tests
    @classmethod
    def setUpClass(self):
        self.project_path = subprocess.Popen(['pwd'], stdout=subprocess.PIPE).communicate()[0].replace('\n','') + "/test_projects/test_proj3"
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
        
    
    def test_proj3_odometer(self):
        kiasan_run_cmd_odometer = sireum.get_run_kiasan_command(self.sireum_path, "Odometer", self.project_path, self.output_path, False)
        methods_odometer = ["Invariant","Zero_Trip", "Read_Trip", "Read_Total", "Inc", "Set_Mark", "Factory_Reset"]
        for method in methods_odometer[:-1]:
            subprocess.call(kiasan_run_cmd_odometer + [method])
        kiasan_run_cmd_with_report = sireum.get_run_kiasan_command(self.sireum_path, "Odometer", self.project_path, self.output_path, True)
        subprocess.call(kiasan_run_cmd_with_report + [methods_odometer[-1]])
        
        #read generated json
        kiasan_logic = kiasan.logic.KiasanLogic()
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
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
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
        report_file_url = urllib.pathname2url(report_file_path)
        report = kiasan_logic.extract_report_file(report_file_url)
        
        #assertions
        self.assertTrue(os.path.isfile(report_file_path))
        odometer_ind = list(r._name for r in report).index("Odometer")
        self.assertTrue(odometer_ind >= 0)
        self.assertEqual(len(methods_odometer), len(report[odometer_ind]._methods))
        self.assertEqual(set(methods_odometer), set(m._name for m in report[odometer_ind]._methods))
        
    
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
        report_file_path = self.output_path+"/kiasan_sireum_report.json"
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