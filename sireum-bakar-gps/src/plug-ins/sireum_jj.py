from __future__ import division
import GPS
import os
import pygtk
pygtk.require('2.0')
import gtk
import gobject
import simplejson as json

def run_java_program():
	""" This is temp function with reference to GPS function for fetching properties of project/code """
	
	os.system("java -cp /Users/jj/Programs/gnat/share/gps/plug-ins HelloJava "+GPS.current_context().file().name())
	print "filename:", GPS.current_context().file().name()
	print "dir:", GPS.current_context().directory()
	print "entity:", GPS.current_context().entity().name()
	print "project filename:", GPS.current_context().project().file().name()
	print "root project file/pathname:", GPS.Project.root().file().name()
	print "source files:", GPS.current_context().project().sources()
	print "source dirs:", GPS.current_context().project().source_dirs()
	print "project dir:", os.path.dirname(GPS.current_context().project().file().name())
	#print "column:", GPS.current_context().column()
	#print "line:", GPS.current_context().line()
	


"""Kiasan """

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
        
                

class KiasanGUI:
    def __init__(self, report):
        self._report = report
        
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
        
        self._pane.show_all()
        
        
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
        pre_tvcolumn = gtk.TreeViewColumn('')
        self._cases_pre_treeview.append_column(pre_tvcolumn)
        pre_cell = gtk.CellRendererText()
        pre_tvcolumn.pack_start(pre_cell, True)
        pre_tvcolumn.add_attribute(pre_cell, 'text', 0)
        self._cases_pre_treeview.set_headers_visible(False) #hide column header
        
        # separator
        self._cases_window_bottom_separator = gtk.VSeparator()
        self._cases_window_bottom.pack_start(self._cases_window_bottom_separator, False, False) 
        
        # post-state window
        self._cases_post_window = gtk.ScrolledWindow()
        self._cases_post_window.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        self._cases_window_bottom.pack_start(self._cases_post_window)
        self._cases_post_treeview = gtk.TreeView(gtk.TreeStore(str))
        self._cases_post_window.add(self._cases_post_treeview)
        post_tvcolumn = gtk.TreeViewColumn('')
        self._cases_post_treeview.append_column(post_tvcolumn)
        post_cell = gtk.CellRendererText()
        post_tvcolumn.pack_start(post_cell, True)
        post_tvcolumn.add_attribute(post_cell, 'text', 0)
        self._cases_post_treeview.set_headers_visible(False) #hide column header
        
    
    def get_cases(self, treeview, path, view_column):
        """ Callback function: get cases for entity(function) """
        
        """ 
        check if method was clicked (then path contains index of package and method)
        if package clicked path contains only package index
        """ 
        if len(path) > 1:
        
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
            
            # load pre state
            case_pre_state_treeview_model = self.create_case_state_treeview_model(case._pre_state)
            self._cases_pre_treeview.set_model(case_pre_state_treeview_model)
            self._cases_pre_treeview.expand_all()
            
            # load post state
            case_post_state_treeview_model = self.create_case_state_treeview_model(case._post_state)
            self._cases_post_treeview.set_model(case_post_state_treeview_model)
            self._cases_post_treeview.expand_all()            
            
            
    def create_case_state_treeview_model(self, case_state):
        """ Create treeview model for case (pre/post state) """
        
        tree_store = gtk.TreeStore(str)
        parent = tree_store.append(None, [case_state._name])
        
        # add globals
        globals = tree_store.append(parent, ["Globals"])
        for global_var in case_state._globals:
            row = global_var + " = " + str(case_state._globals[global_var])
            tree_store.append(globals, [row])
        
        # add call stack frames
        stack_frames = tree_store.append(parent, ["Call Stack Frames"])
        for frame in case_state._frames:
            stack_frame = tree_store.append(stack_frames, [str(frame._line_num) + ":" + frame._name])
            for variable_name in frame._variables:
                row = variable_name + " = " + str(frame._variables[variable_name])
                tree_store.append(stack_frame, [row])
        
        
        return tree_store    
                
                


class TreeViewColumns:
    COLUMN_PACKAGE, COLUMN_TOTAL, COLUMN_ERRORS, COLUMN_INSTRUCTION, COLUMN_BRANCH, COLUMN_TIME = range(6)
 

""" End of Kiasan code """

def run_kiasan_and_read_json():
	#run kiasan
	
	if GPS.Preference("sireum-kiasan-delete-previous-kiasan-reports-before-re-running").get():
		os.system("rm -rf " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")
		os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")
		os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan/xml")
	
	kiasanLibDir = "/Users/jj/Programs/Sireum/apps/bakarv1/eclipse/plugins/org.sireum.spark.eclipse_0.0.4.201212051038/lib/"
	
	runKiasanCommand = "java -jar " + kiasanLibDir + "BakarKiasan.jar"
	runKiasanCommand += " --topi-lib-dir " + kiasanLibDir
	runKiasanCommand += " --outdir /Users/jj/Documents/workspace/test/.sireum/kiasan"
	runKiasanCommand += " --array-bound " + str(GPS.Preference("sireum-kiasan-array-indices-bound").get())
	runKiasanCommand += " --loop-bound " + str(GPS.Preference("sireum-kiasan-loop-bound").get())
	runKiasanCommand += " --invoke-bound " + str(GPS.Preference("sireum-kiasan-call-chain-bound").get())
	runKiasanCommand += " --timeout " + str(GPS.Preference("sireum-kiasan-timeout").get())
	runKiasanCommand += " --constrain-values" if GPS.Preference("sireum-kiasan-constrain-scalar-values").get() else ""
	runKiasanCommand += " --smt " + GPS.Preference("sireum-kiasan-theorem-prover").get()
	runKiasanCommand += " --constraint-solver " + GPS.Preference("sireum-kiasan-theorem-prover").get()
	runKiasanCommand += " --topi-bin-dir " + GPS.Preference("sireum-kiasan-theorem-prover-bin-directory").get()
	runKiasanCommand += " --generate-claim-coverage-report --modular-analysis --generate-pogs-report" if GPS.Preference("sireum-kiasan-generate-claim-report") else ""
	runKiasanCommand += " --source-paths=" + GPS.current_context().directory()
	runKiasanCommand += " --source-files=example.adb,example.ads"
	runKiasanCommand += " --print-trace-bound-exhausted"
	#runKiasanCommand += " --gen-bound-exhaustion-cases"
	runKiasanCommand += " --generate-sireum-report"
	#runKiasanCommand += " --generate-sireum-report-only" 
	runKiasanCommand += " --generate-xml-report"
	runKiasanCommand += " --generate-json-report" if GPS.Preference("sireum-kiasan-generate-json-output").get() else ""
	runKiasanCommand += " --generate-aunit-test-cases" if GPS.Preference("sireum-kiasan-generate-aunit").get() else ""
	runKiasanCommand += " --generate-html-report " + GPS.Preference("sireum-kiasan-html-output-directory").get() if GPS.Preference("sireum-kiasan-generate-html-report").get() else ""
	#TODO: add dotLocation (KiasanRunner.java:443)
	runKiasanCommand += " Example " + GPS.current_context().entity().name()
	
	print runKiasanCommand
	os.system(runKiasanCommand)	
	
	#read generated json
	kiasan_logic = KiasanLogic()
	report = kiasan_logic.extract_report_file(os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan/kiasan_sireum_report.json")
	
	# load data into GUI
	gui = KiasanGUI(report)
	
	# attach GUI to GPS
	GPS.MDI.add(gui._pane, "Kiasan", "kiasan")
	win = GPS.MDI.get('kiasan')
	win.split(reuse="True")
    
"""End of Kiasan GUI"""

GPS.parse_xml ("""
	<filter_and name="Source editor in Ada" >
    	<filter language="ada" />
    	<filter id="Source editor" />
  	</filter_and>
    <action name="run Kiasan">
    	<filter id="Source editor in Ada" />
    	<shell>echo "Procedure:" %e %attr(%e)</shell>
        <shell lang="python">sireum_jj.run_kiasan_and_read_json()</shell>
    </action>
    <submenu before="Window">
        <title>Sireum</title>
        <menu action="run Kiasan">
            <title>Run Kiasan</title>
        </menu>        	
    </submenu>     	
	<contextual action="run Kiasan" >
    	<Title>Sireum/Run Kiasan</Title>
  	</contextual>  
  	
  	<preference name = "sireum-kiasan-array-indices-bound"
   				page = "Sireum/Kiasan"
   				label = "Array indices bound"
   				type = "integer" 
   				default = "5"
   				/>
   	<preference name = "sireum-kiasan-loop-bound"
   				page = "Sireum/Kiasan"
   				label = "Loop bound"
   				type = "integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-call-chain-bound"
   				page="Sireum/Kiasan"
   				label="Call chain bound"
   				type="integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-timeout"
   				page="Sireum/Kiasan"
   				label="Timeout (minutes)"
   				type="integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-constrain-scalar-values"
   				page="Sireum/Kiasan"
   				label="Constrain Scalar Values"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-save-dirty-editors-before-running-kiasan"
   				page="Sireum/Kiasan"
   				label="Save dirty editors before running Kiasan"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-always-run-spark-examiner-before-running-kiasan"
   				page="Sireum/Kiasan"
   				label="Always run Spark Examiner before running Kiasan"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-delete-previous-kiasan-reports-before-re-running"
   				page="Sireum/Kiasan"
   				label="Delete previous Kiasan reports before re-running"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-warn-if-configuration-not-provided"
   				page="Sireum/Kiasan"
   				label="Warn in configuration not provided"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-generate-claim-report"
   				page="Sireum/Kiasan"
   				label="Generate Claim Report"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-generate-html-report"
   				page="Sireum/Kiasan"
   				label="Generate HTML report"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-html-output-directory"
   				page="Sireum/Kiasan"
   				label="HTML Output Directory"
   				type="string" 
   				default = "~/Documents/Kiasan"
   				/>
   	<preference name="sireum-kiasan-location-of-dot-executable"
   				page="Sireum/Kiasan"
   				label="Location of Dot Executable"
   				type="string" 
   				default = "/Users/jj/Programs/Sireum/apps/graphviz/bin/dot"
   				/>
   	<preference name="sireum-kiasan-theorem-prover"
   				page="Sireum/Kiasan"
   				label="Theorem prover"
   				type="choices" 
   				default = "1">
   				<choice>Yices</choice>
   				<choice>Z3</choice> <!--  The default choice -->
	</preference>
   	<preference name="sireum-kiasan-theorem-prover-bin-directory"
   				page="Sireum/Kiasan"
   				label="Theorem Prover Bin Directory"
   				type="string" 
   				default = "/Users/jj/Programs/Sireum/apps/z3/bin"
   				/>
   	<preference name="sireum-kiasan-generate-aunit"
   				page="Sireum/Kiasan"
   				label="Generate AUnit (Experimental)"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-generate-json-output"
   				page="Sireum/Kiasan"
   				label="Generate JSON Output (Experimental)"
   				type="boolean" 
   				default = "True"
   				/>
""")