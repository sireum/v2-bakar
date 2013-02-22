import simplejson as json
from models import Package

class KiasanLogic:
    def run_kiasan(self):
        raise NotImplemented
    
    
    def extract_report_file(self, report_file_path):
        """Open .json report file and extract content into Package list."""
        
        json_obj = open(report_file_path)
        json_str = json_obj.read()
        json_dict = json.loads(json_str)
        report = self.convert_dict_to_report(json_dict)
        return report
    
    
    def convert_dict_to_report(self, json_dict):
        """Fetching reports from json dictionary (with one child - rest will be fetched after row(report) expanded."""
        
        packages = []
        for package in json_dict:
            packages.append(Package(package))
        return packages
