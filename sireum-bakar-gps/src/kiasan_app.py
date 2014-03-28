from gi.repository import Gtk
from kiasan.logic import KiasanLogic
from kiasan.gui import KiasanGUI 
import threading
import hashlib
import os
import time
from gi.repository import GObject
#from gi.repository import GLib

def get_check_sum(file_path):
    f = open(file_path)
    content = "".join(f.readlines())
    f.close()
    return hashlib.sha1(content).digest()
    

def monitor_report(report_path, gui, logic):
    while not os.path.isdir(report_path):
        time.sleep(1)
    
    report = logic.get_report(report_path)
    gui.load_report_data(report)
    
    check_file = report_path + "/kreport"
    check_sum = get_check_sum(check_file)
    while True:
        print "Checking..."
        if check_sum != get_check_sum(check_file):
            print check_sum
            print get_check_sum(check_file)
            check_sum = get_check_sum(check_file)
            report = logic.get_report(report_path)
            gui.load_report_data(report)
        time.sleep(10)
    

if __name__=="__main__":
    
    # get report file
#    dialog = gtk.FileChooserDialog("Open..", None, gtk.FILE_CHOOSER_ACTION_OPEN, (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK))
#    dialog.set_default_response(gtk.RESPONSE_OK)
#    response = dialog.run()
#    if response == gtk.RESPONSE_OK:
        # parse report file
#        report_file = dialog.get_filename()
        #report_file = "/Users/jj/Documents/workspace/sireum-bakar/sireum-bakar-gps/src/kiasan/test/test_projects/test_proj5/.sireum/kiasan/kiasan_sireum_report.json"
        #report_file = "/Users/jj/SkyDrive/workspace/abs_sample/.sireum/kiasan/kiasan_sireum_report.json"
#        dialog.destroy()
        logic = KiasanLogic()
        #report = logic.extract_report_file(report_file)
        kiasan_result_dir = "/home/super/shared/kreport"
        #report = logic.get_report(kiasan_result_dir)
        
        # display report in pygtk
        gui = KiasanGUI() #load report into gui
        window = Gtk.Window()
        window.connect("delete-event", Gtk.main_quit)
        window.set_resizable(True)
        window.set_default_size(800,400)
        window.add(gui._pane)        
        window.show_all()  
        GObject.threads_init()
        t = threading.Thread(target=monitor_report, args = (kiasan_result_dir, gui, logic))
        t.start()
        #gui.load_report_data(report)
        Gtk.main() 
        
#    else:
#        dialog.destroy()
    