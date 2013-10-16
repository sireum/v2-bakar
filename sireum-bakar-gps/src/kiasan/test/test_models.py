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
    
    
    def test_get_globals(self):
        # arrange
        json_str = '[{"string":{"@sid":"1","$":"ada:\/\/variable\/Globals-3:9\/@@K+2:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"1","@num":"9"}},{"string":{"@sid":"2","$":"ada:\/\/variable\/Globals-3:9\/@@O+6:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"2","@num":"4"}},{"string":{"@sid":"3","$":"ada:\/\/variable\/Globals-3:9\/@@N+5:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"3","@num":"10"}},{"string":{"@sid":"4","$":"ada:\/\/variable\/Globals-3:9\/@@M+4:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"4","@num":"5"}},{"string":{"@sid":"5","$":"ada:\/\/variable\/Globals-3:9\/@@Q+8:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"5","@num":"6"}},{"string":{"@sid":"6","$":"ada:\/\/variable\/Globals-3:9\/@@P+7:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"6","@num":"7"}},{"string":{"@sid":"7","$":"ada:\/\/variable\/Globals-3:9\/@@L+3:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"7","@num":"8"}}]'
        json_dict = json.loads(json_str)
        case_state = models.CaseState()
        
        # act
        global_variables = case_state.get_globals(json_dict)
        
        # assert
        self.assertEqual(len(global_variables), 7)                
        self.assertEqual(global_variables[0].name, "ada://variable/Globals-3:9/@@K+2:5")
        self.assertEqual(global_variables[0].symbolic_value, '9')
        self.assertEqual(global_variables[0].concrete_value, None)
    
    
    def test_get_call_stack_frame(self):
        # arrange
        json_str = '{"@cid":"2","procedure":{"@type":"string","@sid":"1","$":"ada:\/\/function_body\/AbsPackage-1:9\/AbsFunc-2:14"},"locationUri":{"@type":"some","@etype":"string","$":"l7"},"locationIndex":{"@type":"int","$":"12"},"store":{"@mtype":"imap","entry":[{"string":{"@sid":"2","$":"ada:\/\/variable_temp\/AbsPackage\/AbsFunc\/_t1"},"konkritIntCIType":{"@typecontype":"konkritIntCIType","@tid":"1","@nestedtype":"org.sireum.util.math.IntegerInteger","@value":"0"}},{"string":{"@sid":"3","$":"ada:\/\/variable_temp\/AbsPackage\/AbsFunc\/_t0"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"2","@num":"1"}},{"string":{"@sid":"4","$":"ada:\/\/variable_temp\/AbsPackage\/AbsFunc\/_t3"},"konkritIntCIType":{"@typecontype":"konkritIntCIType","@tid":"3","@nestedtype":"org.sireum.util.math.IntegerInteger","@value":"-1"}},{"string":{"@sid":"5","$":"ada:\/\/variable_temp\/AbsPackage\/AbsFunc\/_t2"},"kiasanIntKIType":{"@trefid":"2"}},{"string":{"@sid":"6","$":"ada:\/\/variable\/AbsPackage-1:9\/AbsFunc-2:14\/r+4:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"4","@num":"4"}},{"string":{"@sid":"7","$":"ada:\/\/parameter\/AbsPackage-1:9\/AbsFunc-2:14\/x-2:22"},"kiasanIntKIType":{"@trefid":"2"}}]},"result":{"@type":"none"},"returnLocationUri":{"@type":"none"},"returnLocationIndex":{"@type":"int","$":"-1"},"returnVariableUri":{"@type":"none"}}'
        json_dict = json.loads(json_str)
        case_state = models.CaseState()
        
        # act
        frame = case_state.get_call_stack_frame(json_dict)
        
        # assert
        self.assertEqual(len(frame.variables), 6)
                
        self.assertEqual(frame.variables[0].name, "ada://variable_temp/AbsPackage/AbsFunc/_t1")
        self.assertEqual(frame.variables[0].symbolic_value, None)
        self.assertEqual(frame.variables[0].concrete_value, '0')
        
        self.assertEqual(frame.variables[1].name, "ada://variable_temp/AbsPackage/AbsFunc/_t0")
        self.assertEqual(frame.variables[1].symbolic_value, '1')
        self.assertEqual(frame.variables[1].concrete_value, None)
        
        self.assertEqual(frame.line_number, '12')   # line number (location in pilar)
        self.assertEqual("ada://function_body/AbsPackage-1:9/AbsFunc-2:14", frame.name) # subprogram/frame name
        
        
    def test_state_variables_lookup_dict_empty_dict(self):
        # arrange
        json_str = '[{"string":{"@sid":"1","$":"ada://variable/Globals-3:9/@@K+2:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"1","@num":"9"}},{"string":{"@sid":"2","$":"ada://variable/Globals-3:9/@@O+6:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"2","@num":"4"}},{"string":{"@sid":"3","$":"ada://variable/Globals-3:9/@@N+5:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"3","@num":"10"}},{"string":{"@sid":"4","$":"ada://variable/Globals-3:9/@@M+4:5"},"konkritIntCIType":{"@typecontype":"konkritIntCIType","@tid":"4","@nestedtype":"org.sireum.util.math.IntegerInteger","@value":"3"}},{"string":{"@sid":"5","$":"ada://variable/Globals-3:9/@@Q+8:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"5","@num":"6"}},{"string":{"@sid":"6","$":"ada://variable/Globals-3:9/@@P+7:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"6","@num":"7"}},{"string":{"@sid":"7","$":"ada://variable/Globals-3:9/@@L+3:5"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"7","@num":"8"}}]'
        json_dict = json.loads(json_str)
        case_state = models.CaseState()
        
        # act
        case_state.get_globals(json_dict)
        
        # assert
        self.assertEqual(len(case_state.lookup_variables), 7)
        
    
    def test_state_variables_lookup_dict_not_empty_dict(self):
        # arrange
        json_str = '{"@cid":"2","procedure":{"@type":"string","@sid":"8","$":"ada://procedure_body/Globals-3:9/ReadGlobal+12:15"},"locationUri":{"@type":"some","@etype":"string","$":"l6"},"locationIndex":{"@type":"int","$":"8"},"store":{"@mtype":"imap","entry":[{"string":{"@sid":"9","$":"ada://variable/Globals-3:9/ReadGlobal+12:15/local+17:9"},"konkritIntCIType":{"@trefid":"4"}},{"string":{"@sid":"10","$":"ada://parameter/Globals-3:9/ReadGlobal+12:15/I+12:26"},"kiasanIntKIType":{"@typecontype":"kiasanIntKIType","@tid":"8","@num":"1"}},{"string":{"@sid":"11","$":"ada://variable_temp/Globals/ReadGlobal/_t0"},"kiasanIntKIType":{"@trefid":"8"}},{"string":{"@sid":"12","$":"ada://variable_temp/Globals/ReadGlobal/_t1"},"kiasanIntKIType":{"@trefid":"1"}},{"string":{"@sid":"13","$":"ada://parameter/Globals-3:9/ReadGlobal+12:15/R+12:39"},"kiasanIntKIType":{"@trefid":"8"}}]},"result":{"@type":"none"},"returnLocationUri":{"@type":"none"},"returnLocationIndex":{"@type":"int","$":"-1"},"returnVariableUri":{"@type":"none"}}'
        json_dict = json.loads(json_str)
        case_state = models.CaseState()
        case_state.lookup_variables['4'] = models.StateVariable('4')
        case_state.lookup_variables['1'] = models.StateVariable('1')
        case_state.lookup_variables['8'] = models.StateVariable('8')
        
        # act
        case_state.get_call_stack_frame(json_dict)
        
        # assert
        self.assertEqual(len(case_state.lookup_variables), 8)
        
        
    def test_get_case(self):
        # arrange
        case = models.Case('/Users/jj/SkyDrive/workspace/globals_sample/kreport/globals/readglobal/cases/0post.json')
                 
        # act
        case.get_pre_and_post_state()
         
        # assert
        self.assertNotEqual(case.pre_state, None)
        self.assertNotEqual(case.post_state, None)