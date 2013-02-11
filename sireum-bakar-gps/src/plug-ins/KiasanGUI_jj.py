#!usr/bin/env python

import pygtk
pygtk.require('2.0')
import gtk
import simplejson as json
import gobject

class KiasanLogic:
    def run_kiasan(self):
        pass
    
    
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



class Entity:
    """ Base class for package or function rows """
    
    def __init__(self, report_dict):
        self._name = report_dict["optLabel"]
        self._branches = report_dict["numOfTests"]
        self._errors = report_dict["numOfErrorTests"]
        self._instr_coverage = self.convert_to_percentage(report_dict["numOfInstructions"], report_dict["numOfCoveredInstructions"])
        self._branch_coverage = self.convert_to_percentage(report_dict["numOfBranches"], report_dict["numOfCoveredBranches"])
        self._time = self.convert_to_time(report_dict["timeInMilliseconds"])
        #self._dict = report_dict    #TODO: refactor - probably wont be needed in the future (can fetch data from class directly)


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
                self._cases.append(case["filename"][5:]) #skip first 5 chars ('file:')
                
                
    def get_case(self, case_no):
        """ Fetch case from json file """
        
        # get case dict
        case_file = open(self._cases[case_no])
        case_file_str = case_file.read()
        case_dict = json.loads(case_file_str)
                
        # get pre state
        self.get_state(case_dict["preState"], True)
        
        # get post state
        self.get_state(case_dict["postState"], False)


    def get_state(self, case_state_dict, is_pre_state):
        """ Get pre or post state from state_dict """
        
        case_state = CaseState()
        case_state._name = case_state_dict["id"]["name"]
        for frame in case_state_dict["optCallFrames"]:
            stack_frame = CaseStateFrame()



class CaseState:
    """ Class represents pre/post state of specific case """
    
    def __init__(self):
        self._name = ""
        self._frames = []
    
        
class CaseStateFrame:
    """ Class represents pre/post state frames of specific case """
    
    def __init__(self):
        self._functions = []
        
                

class KiasanGUI:
    def __init__(self, report):
        self._report = report
        
        self._window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self._window.connect("destroy", lambda w: gtk.main_quit())
        self._window.set_resizable(True)
        self._window.set_default_size(800,400)
        
        # create pane for split window in two parts: reports and cases
        self._pane = gtk.VPaned()
        
        # init report window
        self._report_window = gtk.ScrolledWindow()
        self._report_window.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        #self._report_window.set_size_request(600, 200)        
        
        # init report window tree view
        self.init_report_treeview()
        
        self._report_window.add(self._treeview)
        
        # cases pane
        self._cases_pane = gtk.VPaned()
        
        # cases pane init
        self.init_cases_window()
        
        self._pane.add1(self._report_window)
        self._pane.add2(self._cases_pane)
        
        self._window.add(self._pane)
        
        self._window.show_all()
        
        
    def init_report_treeview(self):
        """ Initialize tree view with packages/functions """
        
        # create report model
        report_model = self.create_report_treeview_model(self._report)
        
        # initialize tree view based on tree model
        self._treeview = gtk.TreeView(report_model)
        
        self._treeview.set_rules_hint(False)
        
        self.add_columns_to_report_treeview()
        self._treeview.show()
        
        # double click
        self._treeview.connect('row-activated', self.get_cases)
        
        
    def create_report_treeview_model(self, report):
        """ Create TreeStore object - model for treeview with columns """
        
        tree_store = gtk.TreeStore(gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_INT, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_INT, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING) #@UndefinedVariable-is not a problem
            
        for package in report:
            iteration = tree_store.append(None)
            tree_store.set(iteration,
                          TreeViewColumns.COLUMN_PACKAGE, package._name,
                          TreeViewColumns.COLUMN_TOTAL, package._branches,
                          TreeViewColumns.COLUMN_ERRORS, package._errors,
                          TreeViewColumns.COLUMN_INSTRUCTION, package._instr_coverage,
                          TreeViewColumns.COLUMN_BRANCH, package._branch_coverage,
                          TreeViewColumns.COLUMN_TIME, package._time)
            
            for function in package._functions:
                iterate_children = tree_store.append(iteration)
                tree_store.set(iterate_children,
                               TreeViewColumns.COLUMN_PACKAGE, function._name,
                               TreeViewColumns.COLUMN_TOTAL, function._branches,
                               TreeViewColumns.COLUMN_ERRORS, function._errors,
                               TreeViewColumns.COLUMN_INSTRUCTION, function._instr_coverage,
                               TreeViewColumns.COLUMN_BRANCH, function._branch_coverage,
                               TreeViewColumns.COLUMN_TIME, function._time)
        return tree_store
        
    
    def add_columns_to_report_treeview(self):
        """ Add columns to tree view """
        
        column = gtk.TreeViewColumn('Package/Unit', gtk.CellRendererText(), text=TreeViewColumns.COLUMN_PACKAGE)
        column.set_sort_column_id(TreeViewColumns.COLUMN_PACKAGE)
        column.set_resizable(True)
        self._treeview.append_column(column)
        
        column = gtk.TreeViewColumn('T#', gtk.CellRendererText(), text=TreeViewColumns.COLUMN_TOTAL)
        column.set_sort_column_id(TreeViewColumns.COLUMN_TOTAL)
        column.set_resizable(True)
        self._treeview.append_column(column)
        
        column = gtk.TreeViewColumn('E#', gtk.CellRendererText(), text=TreeViewColumns.COLUMN_ERRORS)
        column.set_sort_column_id(TreeViewColumns.COLUMN_ERRORS)
        column.set_resizable(True)
        self._treeview.append_column(column)
        
        column = gtk.TreeViewColumn('Instruction Coverage', gtk.CellRendererText(), text=TreeViewColumns.COLUMN_INSTRUCTION)
        column.set_sort_column_id(TreeViewColumns.COLUMN_INSTRUCTION)
        column.set_resizable(True)
        self._treeview.append_column(column)
        
        column = gtk.TreeViewColumn('Branch Coverage', gtk.CellRendererText(), text=TreeViewColumns.COLUMN_BRANCH)
        column.set_sort_column_id(TreeViewColumns.COLUMN_BRANCH)
        column.set_resizable(True)
        self._treeview.append_column(column)
        
        column = gtk.TreeViewColumn('Time', gtk.CellRendererText(), text=TreeViewColumns.COLUMN_TIME)
        column.set_sort_column_id(TreeViewColumns.COLUMN_TIME)
        column.set_resizable(True)
        self._treeview.append_column(column)
    
        
    def init_cases_window(self):
        """ Initialize cases window: labels, combo and scrolled windows """
        
        # initialize top part: labels and combo box
        self._cases_window_top = gtk.HBox()
        self._cases_pane.add1(self._cases_window_top)
        
        self._cases_entity_label = gtk.Label("")
        self._cases_window_top.pack_start(self._cases_entity_label, False, False, 0)
        self._cases_label = gtk.Label(" Cases: ")
        self._cases_window_top.pack_start(self._cases_label, False, False, 0)
        
        self._cases_combo = gtk.combo_box_new_text()
        #self._cases_combo.append_text("")
        self._cases_window_top.pack_start(self._cases_combo, True, True, 0)
        self._cases_combo.connect("changed", self.cases_combo_changed)
        
        #initialize bottom part: pre and post state tree views
        self._cases_window_bottom = gtk.HBox()
        self._cases_pane.add2(self._cases_window_bottom)
        
        # pre-state window
        self._cases_pre_window = gtk.ScrolledWindow()
        self._cases_pre_window.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        self._cases_window_bottom.pack_start(self._cases_pre_window)
        self._cases_pre_treeview = gtk.TreeView(gtk.TreeStore(str))
        self._cases_pre_window.add(self._cases_pre_treeview)
        
        # post-state window
        self._cases_post_window = gtk.ScrolledWindow()
        self._cases_post_window.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        self._cases_window_bottom.pack_start(self._cases_post_window)
        self._cases_post_treeview = gtk.TreeView(gtk.TreeStore(str))
        self._cases_post_window.add(self._cases_post_treeview)
        
    
    def get_cases(self, treeview, path, view_column):
        """ Callback function: get cases for entity(function) """
        
        """ 
        check if method was clicked (then path contains index of package and method)
        if package clicked path contains only package index
        """ 
        if len(path)>1:
        
            # get function name
            package_index = path[0]
            fun_index = path[1] 
            
            fun_name = self._report[path[0]]._functions[path[1]]._name
        
            # set label to method name            
            self._cases_entity_label.set_label(" " + fun_name + " ")
            
            # clean combo
            self._cases_combo.get_model().clear()
            
            # add cases to combo
            for case_no in range(len(self._report[package_index]._functions[fun_index]._cases)):
                self._cases_combo.append_text(fun_name + ":" + str(case_no))                
            
            #save current selection
            self._current_package_index = package_index
            self._current_fun_index = fun_index
            
    
    def cases_combo_changed(self, cases_combo):
        """ Callback function: cases combo changed """  
        
        selected_case_no = cases_combo.get_active()
        
        # check if any item is selected (-1: no active item selected)
        if selected_case_no != -1: 
            case = self._report[self._current_package_index]._functions[self._current_fun_index].get_case(selected_case_no)
    
            
                
        
    def main(self):
        gtk.main()



class TreeViewColumns:
    COLUMN_PACKAGE, COLUMN_TOTAL, COLUMN_ERRORS, COLUMN_INSTRUCTION, COLUMN_BRANCH, COLUMN_TIME = range(6)


if __name__=="__main__":
    logic = KiasanLogic()
    # 1 - run kiasan
    logic.run_kiasan() #TODO: run Kiasan
        
    # 2 - parse report
    #reports = logic.extract_report_file("/Users/jj/Documents/workspace/test/.sireum/kiasan/kiasan_sireum_report.json")
    #reports = logic.extract_report_file("/Users/jj/SAnToS/KiasanGUI/test2/kiasan_sireum_report.json")
    report = logic.extract_report_file("/Users/jj/Documents/workspace/test/.sireum/kiasan/kiasan_sireum_report.json")
    
    
    # 3 - display it in pygtk
    gui = KiasanGUI(report)
    gui.main()