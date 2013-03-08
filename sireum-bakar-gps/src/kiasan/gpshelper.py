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
            import os
            os.system('echo removefrom_'+str(line.get_line())+str(file_name))
            line.remove()
        

def highlight(file_name, coverage):
    """This function highlight lines in the file 
    
    file_name -- path to file (in which lines should be highlighted)
    lines_numbers -- is a list contains line numbers for highlight
    number_of_lines_in_file -- total number of lines in file
    """
    import os
    
    full_cover = GPS.Style("Full covered lines")
    full_cover.set_background ("#7fff00")   # a green background
    
    partial_cover = GPS.Style("Partially covered lines")
    partial_cover.set_background ("#7fffb0")   # a blue-green background
    
    gps_file = GPS.File(file_name)
    
    if file_name not in files:
        files[file_name] = []
    #os.system("echo "+file_name)
    # highlight lines
    for i in range(1,len(coverage)):
        if coverage[i] == "Full":
            os.system('echo '+file_name)
            os.system('echo full'+str(i))
            files[file_name].append(GPS.Message("my message category", gps_file, i, 1, "message text", 2))
            files[file_name][-1].set_style(full_cover)            
        elif coverage[i] == "Partial":
            os.system('echo '+file_name)
            os.system('echo partial'+str(i))
            files[file_name].append(GPS.Message("my message category", gps_file, i, 1, "message text", 2))
            files[file_name][-1].set_style(partial_cover)   
    os.system('echo not_crashed')
    