import simplejson as json
from models import Package
import urllib
import os
import warnings


class KiasanLogic:
    
    def get_report(self, kiasan_result_dir):
        """This method parse .json reports (packages, methods, cases) from kiasan result dir
        to pythod dictonary."""
        packages = []
        for package_name in os.walk(kiasan_result_dir).next()[1]:
            package_dir = kiasan_result_dir + "/" + package_name
            packages.append(Package(package_dir))
        
        return packages        
    
