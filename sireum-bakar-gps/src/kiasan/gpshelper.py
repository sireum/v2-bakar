import warnings
import GPS

def remove_highlight_from_file(file_name):
    """ Remove highlighted lines from file
    file_name -- path to file with highlighted lines
    """    
    gps_file = GPS.File(file_name)
    buf = GPS.EditorBuffer.get(gps_file)
    overlays = get_overlays(buf)
    for overlay in overlays.values():
        buf.remove_overlay(overlay)
        

def highlight(file_name, coverage):
    """This function highlight lines in the file 
    
    file_name -- path to file (in which lines should be highlighted)
    coverage -- array with lines for highlighting
    """
    gps_file = GPS.File(file_name)
    buf = GPS.EditorBuffer.get(gps_file)
    overlays = get_overlays(buf)    
    for i in range(1,len(coverage)):
        if coverage[i] in overlays:
            buf.apply_overlay(overlays[coverage[i]], GPS.EditorLocation(buf, i, 1), GPS.EditorLocation(buf, i, 1).end_of_line())
    

def get_overlays(buf):
    overlays = {}
    
    full_overlay = buf.create_overlay("full_cover")
    full_overlay.set_property("background", "#7fff00")
    overlays['Full'] = full_overlay
    
    partial_overlay = buf.create_overlay("partial_cover")
    partial_overlay.set_property("background", "#7fffb0")
    overlays['Partial'] = partial_overlay
    
    case_overlay = buf.create_overlay("case_cover")
    case_overlay.set_property("background", "#c1c4f9")
    overlays['Case'] = case_overlay
    
    return overlays


def get_marked_area():
    """ Returns marked area in current file as a tuple: (start_line, start_column, end_line, end_column). """
    buffer = GPS.EditorBuffer.get()
    
    selection_start = buffer.selection_start()
    start_line = selection_start.line()
    start_column = selection_start.column()
    
    selection_end = buffer.selection_end()
    end_line = selection_end.line()
    end_column = selection_end.column()
    
    return start_line, start_column, end_line, end_column
    
    
def highlight_area(file_name, start_line, start_column, end_line, end_column):
    """ This function highlight area from (start_line, start_column) to (end_line, end_column) in specified file_name. """
    buffer = GPS.EditorBuffer.get(GPS.File(file_name))
    overlay = buffer.create_overlay("highlight_overlay")
    overlay.set_property("background", "#ffff00")
    buffer.apply_overlay(overlay, GPS.EditorLocation(buffer, start_line, start_column), GPS.EditorLocation(buffer, end_line, end_column))