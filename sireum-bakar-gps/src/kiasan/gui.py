from gi.repository import Gtk
from gi.repository import GObject as gobject
import warnings

class KiasanGUI:
    """ Main GUI class contains all GUI elements inside of main pane (self._pane)"""
    
    def __init__(self):        
        # create pane for split window in two parts: reports and cases
        self._pane = Gtk.VPaned()
        
        # init report window
        self._report_window = Gtk.ScrolledWindow()
        #self._report_window.set_policy(Gtk.POLICY_AUTOMATIC, Gtk.POLICY_AUTOMATIC)
        #self._report_window.set_size_request(600, 200)
        
        # init report window tree view
        self.tree_view = self.init_report_treeview()
        
        self._report_window.add(self.tree_view)
        
        # cases pane
        self._cases_pane = Gtk.VPaned()
        
        # cases pane init
        self.init_cases_window()
        
        self._pane.add1(self._report_window)
        self._pane.add2(self._cases_pane)
        
        self._pane.show_all()
        
        # load data into report        
        #self.load_report_data(report)
        
        
    def init_report_treeview(self):
        """ Initialize tree view with packages/methods """        
        # create report model
        self.tree_store = self.create_report_treeview_model()
        
        # initialize tree view based on tree model
        self.tree_view = Gtk.TreeView(self.tree_store)
        
        self.tree_view.set_rules_hint(False)
        
        self.add_columns_to_report_treeview()
        self.tree_view.show()
        
        # double click
        self.tree_view.connect('row-activated', self.get_cases)        
        self.tree_view.connect('row-activated', self.highlight_methods)
        
        return self.tree_view
        
        
    def create_report_treeview_model(self):
        """ Create TreeStore object - model for treeview with columns """        
        tree_store = Gtk.TreeStore(gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_INT, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_INT, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING) #@UndefinedVariable-is not a problem
        return tree_store
    
    def load_report_data(self, report):
        self.report = report
        self.tree_store.clear()
        for package in report:
            iteration = self.tree_store.append(None)
            self.tree_store.set(iteration,
                                TreeViewColumns.COLUMN_PACKAGE, package.name,
                                TreeViewColumns.COLUMN_TOTAL, package.branches,
                                TreeViewColumns.COLUMN_ERRORS, package.errors,
                                TreeViewColumns.COLUMN_INSTRUCTION, package.instr_coverage,
                                TreeViewColumns.COLUMN_BRANCH, package.branch_coverage,
                                TreeViewColumns.COLUMN_TIME, package.time)
            for method in package.methods:
                iterate_children = self.tree_store.append(iteration)
                self.tree_store.set(iterate_children,
                               TreeViewColumns.COLUMN_PACKAGE, method.name,
                               TreeViewColumns.COLUMN_TOTAL, method.branches,
                               TreeViewColumns.COLUMN_ERRORS, method.errors,
                               TreeViewColumns.COLUMN_INSTRUCTION, method.instr_coverage,
                               TreeViewColumns.COLUMN_BRANCH, method.branch_coverage,
                               TreeViewColumns.COLUMN_TIME, method.time)
        
        
    
    def add_columns_to_report_treeview(self):
        """ Add columns to tree view """        
        column = Gtk.TreeViewColumn('Package/Unit', Gtk.CellRendererText(), text=TreeViewColumns.COLUMN_PACKAGE)
        column.set_sort_column_id(TreeViewColumns.COLUMN_PACKAGE)
        column.set_resizable(True)
        self.tree_view.append_column(column)
        
        column = Gtk.TreeViewColumn('T#', Gtk.CellRendererText(), text=TreeViewColumns.COLUMN_TOTAL)
        column.set_sort_column_id(TreeViewColumns.COLUMN_TOTAL)
        column.set_resizable(True)
        # add tooltip
        column_header = Gtk.Label('T#')
        column_header.show()
        column.set_widget(column_header)
        #tooltips = Gtk.Tooltips()
        #tooltips.set_tip(column_header, 'Number of test cases')
        # end of add tooltip
        self.tree_view.append_column(column)
        
        column = Gtk.TreeViewColumn('E#', Gtk.CellRendererText(), text=TreeViewColumns.COLUMN_ERRORS)
        column.set_sort_column_id(TreeViewColumns.COLUMN_ERRORS)
        column.set_resizable(True)
        # add tooltip
        column_header = Gtk.Label('E#')
        column_header.show()
        column.set_widget(column_header)
        #tooltips.set_tip(column_header, 'Number of error cases')
        # end of add tooltip
        self.tree_view.append_column(column)
        
        column = Gtk.TreeViewColumn('Instruction Coverage', Gtk.CellRendererText(), text=TreeViewColumns.COLUMN_INSTRUCTION)
        column.set_sort_column_id(TreeViewColumns.COLUMN_INSTRUCTION)
        column.set_resizable(True)
        self.tree_view.append_column(column)
        
        column = Gtk.TreeViewColumn('Branch Coverage', Gtk.CellRendererText(), text=TreeViewColumns.COLUMN_BRANCH)
        column.set_sort_column_id(TreeViewColumns.COLUMN_BRANCH)
        column.set_resizable(True)
        self.tree_view.append_column(column)
        
        column = Gtk.TreeViewColumn('Time', Gtk.CellRendererText(), text=TreeViewColumns.COLUMN_TIME)
        column.set_sort_column_id(TreeViewColumns.COLUMN_TIME)
        column.set_resizable(True)
        self.tree_view.append_column(column)
        

    
        
    def init_cases_window(self):
        """ Initialize cases window: labels, combo and scrolled windows """        
        # initialize top part: labels and combo box
        self._cases_window_top = Gtk.HBox()
        self._cases_pane.add1(self._cases_window_top)
        
        self._cases_entity_label = Gtk.Label("")
        self._cases_window_top.pack_start(self._cases_entity_label, False, False, 0)
        self._cases_label = Gtk.Label(" Cases: ")
        self._cases_window_top.pack_start(self._cases_label, False, False, 0)
        
        self._cases_combo = Gtk.ComboBoxText()
        self._cases_window_top.pack_start(self._cases_combo, True, True, 0)
        self._cases_combo.connect("changed", self.cases_combo_changed)
        
    
    def get_cases(self, treeview, path, view_column):
        """ Callback function: get cases for entity(method) """
        #check if method was clicked (then path contains index of package and method)
        #if package clicked path contains only package index
        path = path.get_indices() #gtk2 to gtk3 translation
        if len(path) == 2:
        
            # get method name
            package_index = path[0]
            method_index = path[1]
            method_name = self.report[package_index].methods[method_index].name
        
            # set label to method name            
            self._cases_entity_label.set_label(" " + method_name + " ")
            
            # clean combo
            self._cases_combo.get_model().clear()
            
            # add cases to combo
            self._cases_combo.append_text("All")
            for case in self.report[package_index].methods[method_index].cases:
                self._cases_combo.append_text(method_name + ":" + case.name + " " + (case.error if case.error != None else ""))
            
            #save current selection
            self._current_package_index = package_index
            self._current_fun_index = method_index
            
    
    def highlight_methods(self, treeview, path, view_column):
        """ Callback function: highlight lines of clicked method/package """
        
        #check if method was clicked (then path contains index of package and method: len=2)
        #if package was clicked then path contains only package index: len=1
        path = path.get_indices() #gtk2 to gtk3 translation    
        if len(path) == 2:
            package_index = path[0]
            method_index = path[1]
            self.highlight_method(package_index, method_index)
            
        elif len(path) == 1:
            package_index = path[0]            
            self.highlight_package(package_index)
    
    
    def highlight_package(self, package_index):
        try:
            import gpshelper
        except ImportError:
            warnings.warn('Program is running as python app (not GPS plugin)')
        
        # remove old highlighting
        for method in self.report[package_index].methods:
            for method_file in method._files:
                file_name = method_file._path
                gpshelper.remove_highlight_from_file(file_name)
                
        # highlight
        for method in self.report[package_index].methods:
            for method_file in method._files:
                file_name = method_file._path
                lines = method_file._covered_lines            
                gpshelper.highlight(file_name, lines)
    
    
    def highlight_method(self, package_index, method_index):
        try:
            import gpshelper
        except ImportError:
            warnings.warn('Program is running as python app (not GPS plugin)')
            
        for method_file in self.report[package_index].methods[method_index]._files:
            file_name = method_file._path
            gpshelper.remove_highlight_from_file(file_name) # remove old highlight
            lines = method_file._covered_lines  
            gpshelper.highlight(file_name, lines)   # highlight lines
    
    
    def cases_combo_changed(self, cases_combo):
        """ Callback function: cases combo changed """          
        selected_case_no = cases_combo.get_active()
        
        
        if selected_case_no == 0:
            self.highlight_method(self._current_package_index, self._current_fun_index)
            return
        # check if any item is selected (-1: no active item selected)
        if selected_case_no > -1:            
            selected_case_no -= 1   # correction because of one extra case: All cases
            case = self.report[self._current_package_index].methods[self._current_fun_index].get_case(selected_case_no)
            
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



class TreeViewColumns:
    COLUMN_PACKAGE, COLUMN_TOTAL, COLUMN_ERRORS, COLUMN_INSTRUCTION, COLUMN_BRANCH, COLUMN_TIME = range(6)
