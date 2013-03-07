import warnings
import GPS


files = {}

def remove_all_highlight():
    for f in files.keys():
        remove_highlight(f)
        del files[f]


def remove_highlight(file_name):
    if file_name in files:
        for line in files[file_name]:
            line.remove()
        

def highlight(file_name, coverage):
    """This function highlight lines in the file 
    
    file_name -- path to file (in which lines should be highlighted)
    coverage -- list contains line coverage (None, Full or Partial)
    number_of_lines_in_file -- total number of lines in file
    """
    full_cover = GPS.Style("Full covered lines")
    full_cover.set_background ("#7fff00")   # a green background
    
#    partial_cover = GPS.Style("Partially covered lines")
#    partial_cover.set_background ("#7fffb0")   # a blue-green background
    
    gps_file = GPS.File(file_name)
    
    if file_name not in files:
        files[file_name] = []
    
    # highlight lines
    for i in range(coverage):
        if coverage[i+1] == "Full":
            files[file_name].append(GPS.Message("my message category", gps_file, i+1, 1, "message text", 2))
            files[file_name][-1].set_style(full_cover)  
#        elif coverage[i+1] == "Partial":
#            files[file_name].append(GPS.Message("my message category", gps_file, i+1, 1, "message text", 2))
#            files[file_name][-1].set_style(partial_cover)  
    