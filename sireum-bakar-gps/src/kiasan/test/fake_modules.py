class GPS(object):
    """Fake GPS module"""
    preferences = {}
    
    @staticmethod
    def parse_xml(xml):
        pass
    
    @staticmethod
    def Preference(key):
        return GPS.preferences[key]


class Preference(object):
    def __init__(self, value):
        self.value = value
        
    def get(self):
        return self.value