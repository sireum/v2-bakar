# fake GPS module
class GPS(object):
    """Fake GPS module"""
    @staticmethod
    def parse_xml(xml):
        pass

import sys
sys.modules["GPS"] = GPS


#class os_fake(object):
#    """Fake os module"""
#    environ = {}
#    environ['PATH'] = '/Users/user/Programs'
#    name = 'possix'
#    
#os = os_fake

import os
import unittest
import sireum

SIREUM_HOME = 'SIREUM_HOME'

class Test(unittest.TestCase):
    """Unit tests for sireum plugin."""

    def test_get_sireum_path_sireum_home_set(self):
        """Test get sireum path, when SIREUM_HOME env is set."""
        # save state
        sireum_home_was_set = False
        if SIREUM_HOME in os.environ:
            sireum_home_temp = os.environ[SIREUM_HOME]
            sireum_home_was_set = True
        
        # test
        sireum_path = '/Fake/path'
        os.environ[SIREUM_HOME] = sireum_path
        sireum_path_result = sireum.get_sireum_path()
        self.assertEqual(sireum_path, sireum_path_result)
        
        # restore previous state
        if sireum_home_was_set:
            os.environ[SIREUM_HOME] = sireum_home_temp
        else:
            del os.environ[SIREUM_HOME]
    
    
    def test_get_sireum_path_sireum_home_in_path(self):    
        """Test get sireum path, when SIREUM_HOME env is not set, but SIREUM_HOME is in PATH."""
        # save state
        sireum_home_was_set = False
        if SIREUM_HOME in os.environ:
            sireum_home_temp = os.environ[SIREUM_HOME]
            sireum_home_was_set = True
            del os.environ[SIREUM_HOME]
        path_temp = os.environ['PATH']
        
        
        sireum_path = '/Fake/path'
        SPLITTER = ";" if os.name=="nt" else ":"        
        os.environ['PATH'] += SPLITTER+sireum_path
        sireum_path_result = sireum.get_sireum_path()
        self.assertTrue(sireum_path_result)        
        
        # restore previous state
        if sireum_home_was_set:
            os.environ[SIREUM_HOME] = sireum_home_temp
        os.environ['PATH'] = path_temp
        
        
    def test_get_sireum_path_sireum_home_not_set_and_not_in_path(self):
        """Test get sireum path, when SIREUM_HOME env is not set, and SIREUM_HOME is not in PATH."""
        # save state
        sireum_home_was_set = False
        if SIREUM_HOME in os.environ:
            sireum_home_temp = os.environ[SIREUM_HOME]
            sireum_home_was_set = True
            del os.environ[SIREUM_HOME]
        path_temp = os.environ['PATH']
        del os.environ['PATH']
            
        self.assertRaises(Exception, sireum.get_sireum_path)
            
        # restore previous state
        if sireum_home_was_set:
            os.environ[SIREUM_HOME] = sireum_home_temp
        else:
            del os.environ[SIREUM_HOME]
        os.environ['PATH'] = path_temp
        

if __name__ == "__main__":
    unittest.main()