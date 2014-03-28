import simplejson as json
import urllib
import os

class Entity:
    """ Base class for package or method rows """
    
    def __init__(self, report_dir, node_key):
        # extract report file to dict
        report_file_url = urllib.pathname2url(report_dir + "/report.json")
        json_obj = urllib.urlopen(report_file_url)
        json_str = json_obj.read()
        json_obj.close()
        report_dict = json.loads(json_str)[node_key]
        self.extract_data(report_dict)
        
        
    def extract_data(self, report_dict):        
        self.name = report_dict["label"]["$"]
        self.branches = int(report_dict["numOfTests"]["$"])
        self.errors = int(report_dict["numOfErrorTests"]["$"])
        self.instr_coverage = self.convert_to_percentage(report_dict["numCoveredInstructions"]["$"], report_dict["numInstructions"]["$"])
        self.branch_coverage = self.convert_to_percentage(report_dict["numCoveredBranches"]["$"], report_dict["numBranches"]["$"])
        self.time = self.convert_milis_to_secs(report_dict["time"]["$"])


    def convert_to_percentage(self, num, total):
        """Return the percentage value of num (total=100%)"""
        if int(num) == 0:
            return "0%"
        else:
            return str(int((float(num) / total) * 100)) + "%"


    def convert_milis_to_secs(self, time):
        """Convert miliseconds to seconds"""
        return str(float(time) / 1000) + "s"
    
    

class Package(Entity):
    """ Class represents package row (parent) """
        
    def __init__(self, package_dir):
        Entity.__init__(self, package_dir, "org.sireum.bakar.kiasan.report.GroupNode")
        self.extract_methods(package_dir)


    def extract_methods(self, package_dir):
        self.methods = []
        for method_name in os.walk(package_dir).next()[1]:
            method_dir = package_dir + "/" + method_name
            self.methods.append(Method(method_dir))



class Method(Entity):
    """ Class represents method row """    
    def __init__(self, method_dir):
        Entity.__init__(self, method_dir, "org.sireum.bakar.kiasan.report.UnitNode")
        self.extract_cases(method_dir)
        

    def extract_cases(self, method_dir):
        self.cases = []
        for case_file in os.walk(method_dir + "/cases").next()[2]:
            self.cases.append(Case(method_dir + "/cases/" + case_file))   



class Case:
    """ class represents case header (used for combo box) """
    def __init__(self, case_file):
        self.name = case_file.split("/")[-1].split(".")[0]
        self.error = None
#         case_file_url = urllib.pathname2url(case_file)
#         json_obj = urllib.urlopen(case_file_url)
#         json_str = json_obj.read()
#         json_obj.close()
#         report_dict = json.loads(json_str)


