import pygtk
pygtk.require('2.0')
import gtk
import gobject
import warnings

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
        """ Initialize tree view with packages/methods """        
        # create report model
        report_model = self.create_report_treeview_model(self._report)
        
        # initialize tree view based on tree model
        self._treeview = gtk.TreeView(report_model)
        
        self._treeview.set_rules_hint(False)
        
        self.add_columns_to_report_treeview()
        self._treeview.show()
        
        # double click
        self._treeview.connect('row-activated', self.get_cases)        
        self._treeview.connect('row-activated', self.highlight_methods)
        
        
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
            
            for method in package._methods:
                iterate_children = tree_store.append(iteration)
                tree_store.set(iterate_children,
                               TreeViewColumns.COLUMN_PACKAGE, method._name,
                               TreeViewColumns.COLUMN_TOTAL, method._branches,
                               TreeViewColumns.COLUMN_ERRORS, method._errors,
                               TreeViewColumns.COLUMN_INSTRUCTION, method._instr_coverage,
                               TreeViewColumns.COLUMN_BRANCH, method._branch_coverage,
                               TreeViewColumns.COLUMN_TIME, method._time)
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
        pre_tvcolumn.add_attribute(pre_cell, 'foreground', 1)
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
        post_tvcolumn.add_attribute(post_cell, 'foreground', 1)
        self._cases_post_treeview.set_headers_visible(False) #hide column header
        
    
    def get_cases(self, treeview, path, view_column):
        """ Callback function: get cases for entity(method) """
        #check if method was clicked (then path contains index of package and method)
        #if package clicked path contains only package index
        if len(path) == 2:
        
            # get method name
            package_index = path[0]
            method_index = path[1]             
            method_name = self._report[package_index]._methods[method_index]._name
        
            # set label to method name            
            self._cases_entity_label.set_label(" " + method_name + " ")
            
            # clean combo
            self._cases_combo.get_model().clear()
            
            # add cases to combo
            for case_header in self._report[package_index]._methods[method_index]._cases_headers:
                self._cases_combo.append_text(method_name + ":" + case_header._name + " " + (case_header._error if case_header._error != None else ""))
            
            #save current selection
            self._current_package_index = package_index
            self._current_fun_index = method_index
            
    
    def highlight_methods(self, treeview, path, view_column):
        """ Callback function: highlight lines of clicked method/package """
        try:
            import gpshelper
        except ImportError:
            warnings.warn('Program is running as python app (not GPS plugin)')
        
        #check if method was clicked (then path contains index of package and method: len=2)
        #if package clicked path contains only package index: len=1    
        if len(path) == 2:
            package_index = path[0]
            method_index = path[1]
            for method_file in self._report[package_index]._methods[method_index]._files:                
                file_name = method_file._path
                gpshelper.remove_highlight_from_file(file_name) # remove old highlight
                lines = method_file._covered_lines  
                gpshelper.highlight(file_name, lines)   # highlight lines
            
        elif len(path) == 1:
            package_index = path[0]
            
            # remove old highlighting
            for method in self._report[package_index]._methods:
                for method_file in method._files:
                    file_name = method_file._path
                    gpshelper.remove_highlight_from_file(file_name)
                    
            # highlight
            for method in self._report[package_index]._methods:
                for method_file in method._files:
                    file_name = method_file._path
                    lines = method_file._covered_lines            
                    gpshelper.highlight(file_name, lines)            
    
    
    def cases_combo_changed(self, cases_combo):
        """ Callback function: cases combo changed """          
        selected_case_no = cases_combo.get_active()
        
        # check if any item is selected (-1: no active item selected)
        if selected_case_no != -1: 
            case = self._report[self._current_package_index]._methods[self._current_fun_index].get_case(selected_case_no)
            
            # load pre and post state models
            case_pre_state_treeview_model, case_post_state_treeview_model = self.create_case_state_treeview_model(case._pre_state, case._post_state)
            
            # create pre and post state treeviews
            self._cases_pre_treeview.set_model(case_pre_state_treeview_model)
            self._cases_pre_treeview.expand_all()
            
            self._cases_post_treeview.set_model(case_post_state_treeview_model)
            self._cases_post_treeview.expand_all()
            
            # highlight case lines
            try:
                import gpshelper
                for file_name, lines in case._files_coverage.iteritems():
                    gpshelper.remove_highlight_from_file(file_name)
                    gpshelper.highlight(file_name, lines) 
            except ImportError:
                warnings.warn('Program is running as python app (not GPS plugin)')            
            
            
    def create_case_state_treeview_model(self, pre_state, post_state):
        """ Create treeview model for case (pre/post state) """
        # colors for changed and not changed(default) vars
        COLOR_DEFAULT = "#000000"
        COLOR_CHANGED = "#ff0000"        
        COLOR_NEW = "#0000ff"
        
        pre_tree_store = gtk.TreeStore(str, str)
        post_tree_store = gtk.TreeStore(str, str)
        pre_parent = pre_tree_store.append(None, [pre_state._name, COLOR_DEFAULT])
        post_parent = post_tree_store.append(None, [post_state._name, COLOR_DEFAULT])
        
        # add globals
        pre_globals_tree = pre_tree_store.append(pre_parent, ["Globals", COLOR_DEFAULT])
        post_globals_tree = post_tree_store.append(post_parent, ["Globals", COLOR_DEFAULT])
        for global_var in post_state._globals:
            post_row = global_var + " = " + str(post_state._globals[global_var])
            if global_var in pre_state._globals:
                pre_row = global_var + " = " + str(pre_state._globals[global_var])
                color = COLOR_DEFAULT if pre_row == post_row else COLOR_CHANGED
            else:
                pre_row = " "
                color = COLOR_NEW            
            pre_tree_store.append(pre_globals_tree, [pre_row, COLOR_DEFAULT])
            post_tree_store.append(post_globals_tree, [post_row, color])
        
        # add call stack frames
        pre_stack_frames = pre_tree_store.append(pre_parent, ["Call Stack Frames", COLOR_DEFAULT])
        post_stack_frames = post_tree_store.append(post_parent, ["Call Stack Frames", COLOR_DEFAULT])
        pre_frames_count = 0
        for pre_frame, post_frame in zip(pre_state._frames, post_state._frames):
            pre_frames_count += 1
            color = COLOR_DEFAULT if pre_frame._line_num == post_frame._line_num else COLOR_CHANGED
            pre_stack_frame = pre_tree_store.append(pre_stack_frames, [str(pre_frame._line_num) + ":" + pre_frame._name, COLOR_DEFAULT])
            post_stack_frame = post_tree_store.append(post_stack_frames, [str(post_frame._line_num) + ":" + post_frame._name, color])
            for variable_name in post_frame._variables:
                post_row = variable_name + " = " + str(post_frame._variables[variable_name])
                if variable_name in pre_frame._variables:
                    pre_row = variable_name + " = " + str(pre_frame._variables[variable_name])
                    color = COLOR_DEFAULT if pre_frame._variables[variable_name] == post_frame._variables[variable_name] else COLOR_CHANGED
                else:
                    pre_row = " "
                    color = COLOR_NEW
                pre_tree_store.append(pre_stack_frame, [pre_row, COLOR_DEFAULT])
                post_tree_store.append(post_stack_frame, [post_row, color])   
        
        for post_frame in post_state._frames[pre_frames_count:]:
            post_stack_frame = post_tree_store.append(post_stack_frames, [str(post_frame._line_num) + ":" + post_frame._name, COLOR_NEW])
            for variable_name in post_frame._variables:
                post_row = variable_name + " = " + str(post_frame._variables[variable_name])
                post_tree_store.append(post_stack_frame, [post_row, COLOR_NEW])
        
        return pre_tree_store, post_tree_store
                
                

class TreeViewColumns:
    COLUMN_PACKAGE, COLUMN_TOTAL, COLUMN_ERRORS, COLUMN_INSTRUCTION, COLUMN_BRANCH, COLUMN_TIME = range(6)
