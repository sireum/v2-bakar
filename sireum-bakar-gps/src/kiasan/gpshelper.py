import warnings
try:
    import GPS
except ImportError:
    warnings.warn('Program is running as python app (not GPS plugin)')

files = {}

def remove_highlight(file_name):
    if file_name in files:
        for line in files[file_name]:
            line.remove()
        

def highlight(file_name, lines_numbers):
    """This function highlight lines in the file 
    
    file_name -- path to file (in which lines should be highlighted)
    lines_numbers -- is a list contains line numbers for highlight
    number_of_lines_in_file -- total number of lines in file
    """
    highlight_style = GPS.Style("my highlighting style")
    highlight_style.set_background ("#7fff00")   # a green background
    
    gps_file = GPS.File(file_name)
    
    if file_name not in files:
        files[file_name] = []
    
    # highlight lines
    for i in lines_numbers:
        files[file_name].append(GPS.Message("my message category", gps_file, i, 1, "message text", 2))
        files[file_name][-1].set_style(highlight_style)  
    