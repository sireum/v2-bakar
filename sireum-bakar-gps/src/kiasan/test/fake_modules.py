import os

class GPS(object):
    """Fake GPS module"""
    preferences = {}
    
    @staticmethod
    def parse_xml(xml):
        pass
    
    @staticmethod
    def Preference(key):
        return GPS.preferences[key]
    
    @staticmethod
    def current_context():
        return Context()        


class Preference(object):
    def __init__(self, value):
        self.value = value
        
    def get(self):
        return self.value
    
class Context:
    @staticmethod
    def project():
        return Project()

class Project:
    @staticmethod
    def file():
        return File

class File:
    @staticmethod
    def name():
        return os.getcwd() + "/test"