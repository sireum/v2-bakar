import warnings
import GPS
           
def remove_highlight_from_file(file_name):
    """ Remove highlighted lines from file
    file_name -- path to file with highlighted lines
    """
    gps_file = GPS.File(file_name)
    old_lines = GPS.Message.list(file=gps_file)
    for line in old_lines:
        line.remove()
        

def highlight(file_name, coverage):
    """This function highlight lines in the file 
    
    file_name -- path to file (in which lines should be highlighted)
    coverage -- array with lines for highlighting
    """
    full_cover = GPS.Style("Full covered lines")
    full_cover.set_background ("#7fff00")   # a green background
    
    partial_cover = GPS.Style("Partially covered lines")
    partial_cover.set_background ("#7fffb0")   # a blue-green background
    
    gps_file = GPS.File(file_name)     
    
        
    for i in range(1,len(coverage)):
        if coverage[i] == "Full":
            line = GPS.Message("kiasan_highlight", gps_file, i, 1, "message text", 2)
            line.set_style(full_cover)        
        elif coverage[i] == "Partial":
            line = GPS.Message("kiasan_highlight", gps_file, i, 1, "message text", 2)
            line.set_style(partial_cover)
    