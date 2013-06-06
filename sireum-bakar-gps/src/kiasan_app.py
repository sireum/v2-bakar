import pygtk
pygtk.require('2.0')
import gtk
from kiasan.logic import KiasanLogic
from kiasan.gui import KiasanGUI 

if __name__=="__main__":
    
    # get report file
#    dialog = gtk.FileChooserDialog("Open..", None, gtk.FILE_CHOOSER_ACTION_OPEN, (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK))
#    dialog.set_default_response(gtk.RESPONSE_OK)
#    response = dialog.run()
#    if response == gtk.RESPONSE_OK:
        # parse report file
#        report_file = dialog.get_filename()
        report_file = "/Users/jj/Documents/workspace/sireum-bakar/sireum-bakar-gps/src/kiasan/test/test_projects/test_proj5/.sireum/kiasan/kiasan_sireum_report.json"
#        dialog.destroy()
        logic = KiasanLogic()
        report = logic.extract_report_file(report_file)
        
        # display report in pygtk
        gui = KiasanGUI(report) #load report into gui
        window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        window.connect("destroy", lambda w: gtk.main_quit())
        window.set_resizable(True)
        window.set_default_size(800,400)        
        window.add(gui._pane)        
        window.show_all()  
        gtk.main() 
#    else:
#        dialog.destroy()
    