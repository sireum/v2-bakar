from kiasan import models
import simplejson as json
import unittest


class TestModels(unittest.TestCase):
    
    @classmethod
    def setUpClass(self):
        pass
    
    # performed before each test
    def setUp(self): 
        pass
    
    
    def test_get_package_data(self):
        # arrange
        package_dir = "kreport/p"
        
        # act
        package = models.Package(package_dir)
        
        # assert
        self.assertEqual("P", package.name)
        self.assertEqual(0, package.branches)
        self.assertEqual(0, package.errors)
        self.assertEqual("0%", package.branch_coverage)        
        self.assertEqual("0%", package.instr_coverage)
        self.assertEqual("0.0s", package.time)
    
        
    def test_get_method_data(self):
        # arrange
        method_dir = "kreport/p/swap"
        
        # act
        method = models.Method(method_dir)
        
        # assert
        self.assertEqual("Swap", method.name)
        self.assertEqual(0, method.branches)
        self.assertEqual(0, method.errors)
        self.assertEqual("0%", method.branch_coverage)        
        self.assertEqual("0%", method.instr_coverage)
        self.assertEqual("0.0s", method.time)
        
    
    def test_get_method_and_cases_data(self):
        # arrange
        method_dir = "kreport/p/swap"
        
        # act
        method = models.Method(method_dir)
        
        # assert
        self.assertEqual("Swap", method.name)
        self.assertEqual(0, method.branches)
        self.assertEqual(0, method.errors)
        self.assertEqual("0%", method.branch_coverage)        
        self.assertEqual("0%", method.instr_coverage)
        self.assertEqual("0.0s", method.time)
        self.assertEqual(1, len(method.cases))
        
    
    def test_get_case(self):
        # arrange
        case_file = "kreport/p/swap/cases/0.json"
        
        # act
        case = models.Case(case_file)
        
        # assert
        self.assertEqual("0", case.name)
        self.assertEqual(None, case.error)