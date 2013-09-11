import simplejson as json
from models import Package
import urllib
import os

class KiasanLogic:
    def run_kiasan(self):
        raise NotImplemented
    
    def get_report(self, kiasan_result_dir):
        
        packages = []
        for package_name in os.walk(kiasan_result_dir).next()[1]:
            package_dir = kiasan_result_dir + "/" + package_name
            packages.append(Package(package_name, package_dir))
        
        return packages
        
    
    
    def extract_report_file(self, report_file_url):
        """Open .json report file and extract content into Package list."""
        json_obj = urllib.urlopen(report_file_url)
        json_str = json_obj.read()
        json_obj.close()
        json_dict = json.loads(json_str)
        report = self.convert_dict_to_report(json_dict)
        return report
    
    
    def convert_dict_to_report(self, json_dict):
        """Fetching reports from json dictionary (with one child - rest will be fetched after row(report) expanded."""
        packages = []
        for package in json_dict:
            packages.append(Package(package))
        return packages
