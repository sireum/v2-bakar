import simplejson as json
import urllib

class Entity:
    """ Base class for package or method rows """
    
    def __init__(self, report_dict):
        self._name = report_dict["optLabel"]
        self._branches = report_dict["numOfTests"]
        self._errors = report_dict["numOfErrorTests"]
        self._instr_coverage = self.convert_to_percentage(report_dict["numOfCoveredInstructions"], report_dict["numOfInstructions"])
        self._branch_coverage = self.convert_to_percentage(report_dict["numOfCoveredBranches"], report_dict["numOfBranches"])
        self._time = self.convert_milis_to_secs(report_dict["timeInMilliseconds"])


    def convert_to_percentage(self, num, total):
        """Return the percentage value of num (total=100%)"""
        if num == 0:
            return "0%"
        else:
            return str(int((float(num) / total) * 100)) + "%"


    def convert_milis_to_secs(self, time):
        """Convert miliseconds to seconds"""        
        return str(float(time) / 1000) + "s"
    
    

class Package(Entity):
    """ Class represents package row (parent) """
        
    def __init__(self, report_dict):
        Entity.__init__(self, report_dict)
        self.extract_methods(report_dict)       


    def extract_methods(self, report_dict):
        self._methods = []
        if report_dict.has_key("theChildren"):
            for child in report_dict["theChildren"]:
                self._methods.append(Method(child))



class Method(Entity):
    """ Class represents method row """    
    def __init__(self, report_dict):
        Entity.__init__(self, report_dict) 
        self._cases_headers = []
        self._cases = {}
        self.extract_cases_headers(report_dict)
        self.extract_file_coverage(report_dict)        
        
        
    def extract_cases_headers(self, report_dict):   
        """Extract cases from dictionary"""
        if report_dict.has_key("cases"):
            for case in report_dict["cases"]:
                case_header = CaseHeader() 
                case_header._file = case["filename"].replace(".xml",".json") #replace .xml with .json
                case_header._name = case["caseName"]
                case_header._error = case["optErrorStatus"]
                self._cases_headers.append(case_header)
                
    
    def extract_file_coverage(self, report_dict):
        """Extract file coverage (line for highlight) from dictionary"""
        self._files = []
        if report_dict.has_key("optFileCoverage"):
            for file_dict in report_dict["optFileCoverage"]:
                method_file = MethodFile()
                method_file._path = file_dict["sourcePath"]
                method_file._covered_lines = file_dict["coverage"]
                self._files.append(method_file)
                
        
                    
    def get_case(self, case_no):
        """ Fetch case from json file """   
        if case_no not in self._cases:
            case_file = urllib.urlopen(self._cases_headers[case_no]._file)
            case_file_str = case_file.read()
            case_dict = json.loads(case_file_str)
                    
            self._cases[case_no] = Case()
            self._cases[case_no]._pre_state = self.get_state(case_dict["preState"])
            self._cases[case_no]._post_state = self.get_state(case_dict["postState"])
            self._cases[case_no]._files_coverage = self.get_coverage(case_dict["steps"])
        
        return self._cases[case_no]


    def get_state(self, case_state_dict):
        """ Get pre or post state from state_dict """        
        case_state = CaseState()
        case_state._name = case_state_dict["id"]["name"]
        
        base_elements = self.get_base_types(case_state_dict["optBaseElementMap"])
        ref_elements = self.get_ref_types(case_state_dict["optRefElementMap"])
        case_state._globals = dict(base_elements.items() + ref_elements.items())
                
        for stack_frame_dict in case_state_dict["optCallFrames"]:
            stack_frame = CaseStateFrame()
            stack_frame._name = stack_frame_dict["location"]["name"]
            stack_frame._line_num = stack_frame_dict["line"]
            
            stack_frame._variables = {}
            if stack_frame_dict["optBaseElementMap"] != None:                        
                for variable_name in stack_frame_dict["optBaseElementMap"]:
                    variable_value = stack_frame_dict["optBaseElementMap"][variable_name]["theValue"]
                    stack_frame._variables[variable_name] = variable_value
            if stack_frame_dict["optRefElementMap"] != None:
                stack_frame._variables = dict(stack_frame._variables.items() + self.get_ref_types(stack_frame_dict["optRefElementMap"]).items())
            case_state._frames.append(stack_frame)
            
        return case_state
    
    
    def get_ref_types(self, ref_type_dict):
        ref_structure = {}
        
        if ref_type_dict is not None:
            for variable_name, variable_dict in ref_type_dict.items():
                variable_type = variable_dict["id"]["name"];
                if variable_dict["@class"] == "org.sireum.graph.object.model.ConcreteRefArrayNode":
                    variable_dict_values = dict(zip(range(0,len(variable_dict["values"])), variable_dict["values"]));
                    variable_value = self.get_ref_types(variable_dict_values)
                elif variable_dict["@class"] == "org.sireum.graph.object.model.BaseArrayNode":
                    ref_elements = self.get_ref_types(variable_dict["optIndexValueMap"])
                    variable_value = dict(ref_elements.items())
                    variable_value["size"] = variable_dict["length"]["theValue"]
                elif variable_dict["@class"] == "org.sireum.graph.object.model.ConcreteBaseArrayNode":
                    variable_value = {}
                    i = variable_dict["minIndex"]
                    for value in variable_dict["values"]:
                        variable_value[i] = value["theValue"]
                        i += 1
                    variable_value["size"] = i
                elif variable_dict["@class"] == "org.sireum.graph.object.model.RecordNode":
                    base_elements = self.get_base_types(variable_dict["optBaseElementMap"])
                    ref_elements = self.get_ref_types(variable_dict["optRefElementMap"])
                    variable_value = dict(base_elements.items() + ref_elements.items())
                elif variable_dict["@class"] == "org.sireum.graph.object.model.RefArrayNode":
                    variable_value = self.get_ref_types(variable_dict["optIndexValueMap"])
                    variable_value["size"] = variable_dict["length"]["theValue"]
                ref_structure[str(variable_name) + (" = " + str(variable_type) if str(variable_type) else "")] = variable_value
            
        return ref_structure
            

    def get_base_types(self, base_type_dict):
        base_structure = {}
        
        if base_type_dict is not None:
            for variable_name in base_type_dict:
                variable_value = base_type_dict[variable_name]["theValue"]            
                base_structure[variable_name] = variable_value
        
        return base_structure
        
        
        
    def get_coverage(self, steps_dict):
        """ Get line coverage(which should be highlighted) for single case. """
        coverage_dict = {}
        for step in steps_dict:
            if step["sourcePath"] not in coverage_dict:
                coverage_dict[step["sourcePath"]] = []
                lines_in_file = len(open(step["sourcePath"]).readlines())
                for i in range(lines_in_file+1):
                    coverage_dict[step["sourcePath"]].append("None")
            coverage_dict[step["sourcePath"]][step["line"]] = "Case"
        return coverage_dict        



class MethodFile:
    """ class represents files which contains method definition or body """
    pass
    
    
    
class CaseHeader:
    """ class represents case header (used for combo box) """
    pass



class Case:
    """ class represents case with pre and post state """  
    
    def __init__(self):
        self._pre_state = None
        self._post_state = None
        self._files_coverage = None



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
        


class CaseMethod:
    """ Class represents method in CaseStateFrame """
    
    def __init__(self):
        self._name = ""
        self._lineNum = 0
        
