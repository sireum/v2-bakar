import simplejson as json

class Entity:
    """ Base class for package or function rows """
    
    def __init__(self, report_dict):
        self._name = report_dict["optLabel"]
        self._branches = report_dict["numOfTests"]
        self._errors = report_dict["numOfErrorTests"]
        self._instr_coverage = self.convert_to_percentage(report_dict["numOfInstructions"], report_dict["numOfCoveredInstructions"])
        self._branch_coverage = self.convert_to_percentage(report_dict["numOfBranches"], report_dict["numOfCoveredBranches"])
        self._time = self.convert_to_time(report_dict["timeInMilliseconds"])


    def convert_to_percentage(self, num, cov_nums):
        if num == 0:
            return "0%"
        else:
            return str(int((cov_nums / num) * 100)) + "%"


    def convert_to_time(self, time):
        return str(time / 1000) + "s"
    
    

class Package(Entity):
    """ Class represents package row (parent) """
    
    def __init__(self, report_dict):
        Entity.__init__(self, report_dict)
        self.extract_functions(report_dict)       


    def extract_functions(self, report_dict):
        self._functions = []
        if report_dict.has_key("theChildren"):
            for child in report_dict["theChildren"]:
                self._functions.append(Function(child))



class Function(Entity):
    """ Class represents function row (child) """
    
    def __init__(self, report_dict):
        Entity.__init__(self, report_dict) 
        self.extract_cases(report_dict)
        
        
    def extract_cases(self, report_dict):   
        self._cases = []
        if report_dict.has_key("cases"):
            for case in report_dict["cases"]:
                self._cases.append(case["filename"][5:].replace(".xml",".json")) #skip first 5 chars ('file:') and replace .xml with .json
                
                
    def get_case(self, case_no):
        """ Fetch case from json file """
        
        # get case dict
        case_file = open(self._cases[case_no])
        case_file_str = case_file.read()
        case_dict = json.loads(case_file_str)
                
        case = Case()
        # get pre state
        case._pre_state = self.get_state(case_dict["preState"], True)
        
        # get post state
        case._post_state = self.get_state(case_dict["postState"], False)
        
        return case


    def get_state(self, case_state_dict, is_pre_state):
        """ Get pre or post state from state_dict """
        
        case_state = CaseState()
        case_state._name = case_state_dict["id"]["name"]
        for variable_name in case_state_dict["optBaseElementMap"]:
            variable_value = case_state_dict["optBaseElementMap"][variable_name]["theValue"]            
            case_state._globals[variable_name] = variable_value
        
        for stack_frame_dict in case_state_dict["optCallFrames"]:
            stack_frame = CaseStateFrame()
            stack_frame._name = stack_frame_dict["location"]["name"]
            stack_frame._line_num = stack_frame_dict["line"]
            
            #if not is_pre_state: - CHECK THIS
            for variable_name in stack_frame_dict["optBaseElementMap"]:
                variable_value = stack_frame_dict["optBaseElementMap"][variable_name]["theValue"]
                stack_frame._variables[variable_name] = variable_value
            case_state._frames.append(stack_frame)
        return case_state



class Case:
    """ class represents case with pre and post state """
    
    pass



class CaseState:
    """ Class represents pre/post state of specific case """
    
    def __init__(self):
        self._name = ""
        self._globals = {}
        self._frames = []
    
        
        
class CaseStateFrame:
    """ Class represents pre/post state frames of specific case """
    
    def __init__(self):
        self._variables = {}
        


class CaseFunction:
    """ Class represents function in CaseStateFrame """
    
    def __init__(self):
        self._name = ""
        self._lineNum = 0
        
