import pygtk
pygtk.require('2.0')
import gtk
import gobject

class KiasanGUI:
    """ Main GUI class contains all GUI elements inside of main pane (self._pane)"""
    
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
        """ Initialize tree view with packages/procedures """        
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
            
            for procedure in package._procedures:
                iterate_children = tree_store.append(iteration)
                tree_store.set(iterate_children,
                               TreeViewColumns.COLUMN_PACKAGE, procedure._name,
                               TreeViewColumns.COLUMN_TOTAL, procedure._branches,
                               TreeViewColumns.COLUMN_ERRORS, procedure._errors,
                               TreeViewColumns.COLUMN_INSTRUCTION, procedure._instr_coverage,
                               TreeViewColumns.COLUMN_BRANCH, procedure._branch_coverage,
                               TreeViewColumns.COLUMN_TIME, procedure._time)
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
        """ Callback function: get cases for entity(procedure) """
        #check if method was clicked (then path contains index of package and method)
        #if package clicked path contains only package index        
        if len(path) > 1:
        
            # get procedure name
            package_index = path[0]
            proc_index = path[1] 
            
            proc_name = self._report[path[0]]._procedures[path[1]]._name
        
            # set label to method name            
            self._cases_entity_label.set_label(" " + proc_name + " ")
            
            # clean combo
            self._cases_combo.get_model().clear()
            
            # add cases to combo
            for case_header in self._report[package_index]._procedures[proc_index]._cases:
                self._cases_combo.append_text(proc_name + ":" + case_header._name + " " + case_header._error)
            
            #save current selection
            self._current_package_index = package_index
            self._current_fun_index = proc_index
            
    
    def cases_combo_changed(self, cases_combo):
        """ Callback function: cases combo changed """          
        selected_case_no = cases_combo.get_active()
        
        # check if any item is selected (-1: no active item selected)
        if selected_case_no != -1: 
            case = self._report[self._current_package_index]._procedures[self._current_fun_index].get_case(selected_case_no)
            
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
        globals_tree = tree_store.append(parent, ["Globals"])
        for global_var in case_state._globals:
            row = global_var + " = " + str(case_state._globals[global_var])
            tree_store.append(globals_tree, [row])
        
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
    
    
    