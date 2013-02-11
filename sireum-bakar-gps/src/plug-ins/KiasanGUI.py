from __future__ import division
import pygtk
pygtk.require('2.0')
import gobject
import gtk
import json
import unicodedata

(
COLUMN_PACKAGE,
COLUMN_TOTAL,
COLUMN_ERRORS,
COLUMN_INSTRUCTION,
COLUMN_BRANCH,
COLUMN_TIME
) = range(6)

rowsExpanded = []

dialog = gtk.FileChooserDialog("Open..", None, gtk.FILE_CHOOSER_ACTION_OPEN, (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK))
dialog.set_default_response(gtk.RESPONSE_OK)
response = dialog.run()
if response == gtk.RESPONSE_OK:
    jsonFileObj = open(dialog.get_filename())
    jsonFileStr = jsonFileObj.read()
    jsonFileDict = json.loads(jsonFileStr)
elif response == gtk.RESPONSE_CANCEL:
    jsonFileDict = {}
dialog.destroy()  

class caseGUI:
    pass

class caseState:
    #globals
    #list of stackFrame
    pass

class  stackFrame:
    #list of caseMethod's
    pass

class caseMethod:
    #name
    #line number
    #Individual variable instances
    #list of casePackage's
    pass

class casePackage:
    #size
    #list of variables, length of size
    pass

def deUnicode(uStr):
    if not isinstance(uStr, unicode):
        return uStr
    return unicodedata.normalize('NFKD', uStr).encode('ascii', 'ignore') #http://stackoverflow.com/questions/1207457
   
class parsedReportInformation:
    def convertToList(self, jsonDict):
        retList = []
        retList.append(self.name)
        retList.append(self.branches)
        retList.append(self.errors)
        retList.append(self.inPerc)
        retList.append(self.brPerc)
        retList.append(self.time)
        if jsonDict.has_key("theChildren"):
            retList.append(retList)
            return [retList]
        else:
            return retList
            
    def getChildren(self, jsonDict):
        if jsonDict.has_key("theChildren"):
            return jsonDict["theChildren"]
            
class KiasanNotebook:  
    #Initializes all of the components of the GUI and displays them
    def __init__(self):
        reportWindow, mainWindow, reportLabel = self.initWindow()
        caseGUIObj, notebook = self.initNotebook(reportWindow, mainWindow, reportLabel)
        self.initTree(caseGUIObj, reportWindow, notebook)   
        self.showEverything(reportWindow, mainWindow, reportLabel, notebook, caseGUIObj)    

    #Deletes the GUI and ends execution
    def delete_event(self, widget, event, data=None):
        gtk.main_quit()
        return False
    
    #Initializes the main window, the report section of the window, and the label for the report section
    def initWindow(self):
        mainWindow = gtk.Window(gtk.WINDOW_TOPLEVEL)
        mainWindow.set_title("Kiasan")
        mainWindow.connect("delete_event", self.delete_event)
        mainWindow.set_default_size(800, 300)
        reportLabel = gtk.Label("Kiasan Report")
        reportWindow = gtk.ScrolledWindow()
        reportWindow.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        reportWindow.set_size_request(100, 75)
        return reportWindow, mainWindow, reportLabel
    
    #Initializes the notebook tabbed layout of the window, and adds the report window as a tap, along with an empty case tab
    def initNotebook(self, reportWindow, mainWindow, reportLabel):
        notebook = gtk.Notebook()
        notebook.set_tab_pos(gtk.POS_TOP)
        self.show_tabs = True
        self.show_border = True
        notebook.set_current_page(0)
        mainWindow.add(notebook)
        notebook.append_page(reportWindow, reportLabel)
        pageLabel = gtk.Label("Kiasan Cases")
        caseGUIObj = self.createCasePage()
        notebook.append_page(caseGUIObj.casesWindow, pageLabel)
        return caseGUIObj, notebook
    
    #Creates and displays a tree model for a given report file, connects event handlers to the tree
    def initTree(self, caseGUIObj, reportWindow, notebook):
        reports = []
        for x in jsonFileDict:
            reports.append(self.getReportInfo(x))
          
        reportModel = self.createModel(reports[0].convertToList(jsonFileDict[0]))
        tree = gtk.TreeView(reportModel)
        tree.set_rules_hint(False)
        reportWindow.add(tree)
        self.add_columns(tree)
        for i in range(len(reports)):
            if(i == 0):
                continue
            tempModel = tree.get_model()
            tempModel.insertAfter(None, None, reports[i].convertToList(jsonFileDict[i]))
             
        tree.show()
        tree.connect('test-expand-row', self.on_row_expanded, reports[0], jsonFileDict[0])
        tree.connect('row-activated', self.signal_row_activated, caseGUIObj, notebook)
        
    def initCases(self, caseGUIObj, method, notebook):
        methodName = str(method)
            
        caseGUIObj.label.set_label(methodName)
        caseNames = self.getCaseNames(methodName)
        comboText = self.getComboNames(caseNames)
        for x in range(caseGUIObj.comboSize):
            caseGUIObj.casesCombo.remove_text(0)
        caseGUIObj.casesCombo.append_text("All")
        caseGUIObj.comboSize = 1;
        for text in comboText:
            caseGUIObj.comboSize += 1
            caseGUIObj.casesCombo.append_text(methodName + " " + text) 
          
        if(not caseGUIObj.casePre.get_child() == None):
            child = caseGUIObj.casePre.get_child()
            caseGUIObj.casePre.remove(child)    
        if(not caseGUIObj.casePost.get_child() == None):
            child = caseGUIObj.casePost.get_child()
            caseGUIObj.casePost.remove(child)    
        caseGUIObj.casesCombo.connect('changed', self.combo_changed, caseGUIObj.casesWindow, caseGUIObj.casesCombo, caseGUIObj.casePre, caseGUIObj.casePost, caseNames)   
        caseGUIObj.label.show()
        caseGUIObj.casesCombo.show()
        caseGUIObj.casePre.show()
        caseGUIObj.casePost.show()
        caseGUIObj.casesWindow.show()
        notebook.set_current_page(1)
     
    def parseCaseFile(self, casePath):
        caseFileObj = open(casePath)
        caseFileStr = caseFileObj.read()
        caseDict = json.loads(caseFileStr)
        preCase = self.getCase(caseDict, True)
        postCase = self.getCase(caseDict, False)
        return preCase, postCase
       
    def createCasePage(self):
        caseGUIObj = caseGUI()
        caseGUIObj.casesWindow = gtk.Table(10, 2, False)
        caseGUIObj.casesCombo = gtk.combo_box_new_text()
        caseGUIObj.casesCombo.append_text("")
        caseGUIObj.comboSize = 1
        caseGUIObj.label = gtk.Label("")
        caseGUIObj.casesWindow.attach(caseGUIObj.label, 0, 1, 0, 1)
        caseGUIObj.casesWindow.attach(caseGUIObj.casesCombo, 1, 2, 0, 1)
        caseGUIObj.casePost = gtk.ScrolledWindow()
        caseGUIObj.casePost.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        caseGUIObj.casesWindow.attach(caseGUIObj.casePost, 1, 2, 1, 10)
        caseGUIObj.casePre = gtk.ScrolledWindow()
        caseGUIObj.casePre.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        caseGUIObj.casesWindow.attach(caseGUIObj.casePre, 0, 1, 1, 10)
        return caseGUIObj
    
    def createModel(self, report):
        treeStore = gtk.TreeStore(gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_INT, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_INT, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING, #@UndefinedVariable-is not a problem
                                  gobject.TYPE_STRING) #@UndefinedVariable-is not a problem
            
        for package in report:
            iteration = treeStore.append(None)
            treeStore.set(iteration,
                          COLUMN_PACKAGE, package[COLUMN_PACKAGE],
                          COLUMN_TOTAL, package[COLUMN_TOTAL],
                          COLUMN_ERRORS, package[COLUMN_ERRORS],
                          COLUMN_INSTRUCTION, str(package[COLUMN_INSTRUCTION]),
                          COLUMN_BRANCH, str(package[COLUMN_BRANCH]),
                          COLUMN_TIME, str(package[COLUMN_TIME]))
            
            for method in package[-1]:
                if(type(method) == list):
                    iterateChildren = treeStore.append(iteration)
                    treeStore.set(iterateChildren,
                                  COLUMN_PACKAGE, str(method[COLUMN_PACKAGE]),
                                  COLUMN_TOTAL, method[COLUMN_TOTAL],
                                  COLUMN_ERRORS, method[COLUMN_ERRORS],
                                  COLUMN_INSTRUCTION, str(method[COLUMN_INSTRUCTION]),
                                  COLUMN_BRANCH, str(method[COLUMN_BRANCH]),
                                  COLUMN_TIME, str(method[COLUMN_TIME]))
        return treeStore
        
    def createCaseModel(self, case):
        treeStore = gtk.TreeStore(gobject.TYPE_STRING)
            
        iteration = treeStore.append(None)
        treeStore.set(iteration,  COLUMN_PACKAGE, case.name)
        iterateChild1 = treeStore.append(iteration)
        treeStore.set(iterateChild1, COLUMN_PACKAGE, "Globals")
        iterateChild2 = treeStore.append(iteration)
        treeStore.set(iterateChild2, COLUMN_PACKAGE, "Call Stack Frames")
        for stackFrame in case.frames:
            callStackIter = treeStore.append(iterateChild2)
            for method in stackFrame.methods:
                if("post-state" in case.name):
                    iIter = treeStore.append(callStackIter)
                    treeStore.set(iIter, COLUMN_PACKAGE, "I = " + str(method.I))
                    nIter = treeStore.append(callStackIter)
                    treeStore.set(nIter, COLUMN_PACKAGE, "N = " + str(method.N))
                    if hasattr(method, "swapped"):
                        swappedIter = treeStore.append(callStackIter)
                        treeStore.set(swappedIter, COLUMN_PACKAGE, "Swapped = " + str(method.swapped))
                        if hasattr(method, "temp"):
                            tempIter = treeStore.append(callStackIter)
                            treeStore.set(tempIter, COLUMN_PACKAGE, "Temp = " + str(method.temp))
                methodIter = treeStore.append(callStackIter)
                treeStore.set(callStackIter, COLUMN_PACKAGE, str(method.lineNum) + ":" + method.name)
                for package in method.packages:
                    packIter1 = treeStore.append(methodIter)
                    treeStore.set(methodIter, COLUMN_PACKAGE, package.letter + " = " + package.name)
                    treeStore.set(packIter1, COLUMN_PACKAGE, "size = " + str(package.size))
                    i = 1
                    for var in package.vars:
                        packIter2 = treeStore.append(methodIter)
                        treeStore.set(packIter2, COLUMN_PACKAGE, str(i) + " = " + str(var))
                        i += 1

        return treeStore
        
    def add_caseColumns(self, tree): 
        column = gtk.TreeViewColumn('', gtk.CellRendererText(), text=COLUMN_PACKAGE)
        column.set_sort_column_id(COLUMN_PACKAGE)
        column.set_resizable(True)
        tree.append_column(column)
   
    def add_columns(self, tree): 
        column = gtk.TreeViewColumn('Package/Unit', gtk.CellRendererText(), text=COLUMN_PACKAGE)
        column.set_sort_column_id(COLUMN_PACKAGE)
        column.set_resizable(True)
        tree.append_column(column)
        
        column = gtk.TreeViewColumn('T#', gtk.CellRendererText(), text=COLUMN_TOTAL)
        column.set_sort_column_id(COLUMN_TOTAL)
        column.set_resizable(True)
        tree.append_column(column)
        
        column = gtk.TreeViewColumn('E#', gtk.CellRendererText(), text=COLUMN_ERRORS)
        column.set_sort_column_id(COLUMN_ERRORS)
        column.set_resizable(True)
        tree.append_column(column)
        
        column = gtk.TreeViewColumn('Instruction Coverage', gtk.CellRendererText(), text=COLUMN_INSTRUCTION)
        column.set_sort_column_id(COLUMN_INSTRUCTION)
        column.set_resizable(True)
        tree.append_column(column)
        
        column = gtk.TreeViewColumn('Branch Coverage', gtk.CellRendererText(), text=COLUMN_BRANCH)
        column.set_sort_column_id(COLUMN_BRANCH)
        column.set_resizable(True)
        tree.append_column(column)
        
        column = gtk.TreeViewColumn('Time', gtk.CellRendererText(), text=COLUMN_TIME)
        column.set_sort_column_id(COLUMN_TIME)
        column.set_resizable(True)
        tree.append_column(column)
    
    def getCaseNames(self, methodName):
        caseFiles = {}
        for x in jsonFileDict:
            if x.has_key("theChildren"):
                for child in x["theChildren"]:
                    if not child["optLabel"] == methodName:
                        continue
                    caseFiles[child["optLabel"]] = []
                    for case in child["cases"]: 
                        caseFiles[child["optLabel"]].append(case["filename"])        
        
        caseNames = []
        count = 0
        for x in caseFiles:
            for y in range(len(caseFiles[x])):
                caseNames.append(caseFiles[x][y])
                str(caseNames[count])
                temp = caseNames[count].split(':')[1]
                caseNames[count] = temp
                caseNames[count] = caseNames[count].replace(".xml", ".json")
                count = count + 1
                
        for x in range(len(caseNames)):
            caseNames[x] = deUnicode(caseNames[x])
        
        return caseNames
    
    def getComboNames(self, fileNames):
        comboNames = []
        for fileName in fileNames:
            caseFileObj = open(fileName)
            caseFileStr = caseFileObj.read()
            caseDict = json.loads(caseFileStr)
            comboNames.append(caseDict["postState"]["id"]["name"])
        return comboNames
    
    def getCase(self, caseDict, isPreState):
        case = caseState()
        if(isPreState):
            name = "preState"
        else:
            name = "postState"
        case.name = caseDict[name]["id"]["name"]
        caseState.frames = []
        for frame in caseDict[name]["optCallFrames"]:
            theStackFrame = stackFrame()
            theStackFrame.methods = []
            theMethod = caseMethod()
            theMethod.name = frame["location"]["name"]
            theMethod.lineNum = frame["line"]
            if not isPreState:
                i = -1
                for x in frame["optBaseElementMap"]:
                    """TODO: FIX THIS SECTION"""
                    i += 1
                    if(i == 0):
                        theMethod.I = 2#frame["optBaseElementMap"][x]["theValue"]
                    elif(i == 1):
                        theMethod.N = 2#frame["optBaseElementMap"][x]["theValue"]
                    elif(i == 2):
                        theMethod.swapped = "false"#frame["optBaseElementMap"][x]["theValue"]
                    elif(i == 3):
                        theMethod.temp = 0#frame["optBaseElementMap"][x]["theValue"]
            theMethod.packages = []
            for x in frame["optRefElementMap"]:
                thePackage = casePackage()
                thePackage.name = frame["optRefElementMap"][x]["id"]["name"]
                thePackage.letter = "A"
                thePackage.size = len(frame["optRefElementMap"][x]["values"])
                thePackage.vars = []
                for i in range(thePackage.size):
                    thePackage.vars.append(frame["optRefElementMap"][x]["values"][i]["theValue"])
                
                theMethod.packages.append(thePackage)
            
            theStackFrame.methods.append(theMethod)
            caseState.frames.append(theStackFrame)
        
        return case
 
    def getReportInfo(self, jsonDict):
        retVal = parsedReportInformation()
        retVal.name = jsonDict["optLabel"]
        retVal.branches = jsonDict["numOfTests"]
        retVal.errors = jsonDict["numOfErrorTests"]
        retVal.inPerc = self.convertPercent(jsonDict["numOfInstructions"], jsonDict["numOfCoveredInstructions"])
        retVal.brPerc = self.convertPercent(jsonDict["numOfBranches"], jsonDict["numOfCoveredBranches"])
        retVal.time = self.convertTime(jsonDict["timeInMilliseconds"])
        return retVal
 
    def convertPercent(self, num, covNums):
        if num == 0:
            return "0%"
        else:
            return str(int((covNums / num) * 100)) + "%"
    
    def convertTime(self, time):
        return str(time / 1000) + "s" 
 
    def signal_row_activated(self, theTree, path, column, caseGUIObj, notebook):
        mod = theTree.get_model()
        modIter = mod.get_iter(path)
        if(len(path) == 1):
            return
        self.initCases(caseGUIObj, mod.get_value(modIter, 0), notebook)

    def on_row_expanded(self, theTree, theIter, rowTuple, curReport, jsonDictionary):
        if(rowsExpanded.__contains__(curReport.name)):
            return
        else:
            rowsExpanded.append(curReport.name)
            kids = curReport.getChildren(jsonDictionary) 
            mod = theTree.get_model()
            i = 0
            for x in kids:
                i += 1
                newInfo = self.getReportInfo(x)
                mod.insert_after(theIter, None, newInfo.convertToList(x))
            removeIter = mod.iter_nth_child(theIter, i)
            mod.remove(removeIter)            
    		    
    def combo_changed(self, foo, casesWindow, casesCombo, casePre, casePost, caseNames):
        curIndex = casesCombo.get_active() - 1
        if not casesCombo.get_active_text() == None and not casesCombo.get_active_text() == "All":
            curText = caseNames[curIndex]
            preCase, postCase = self.parseCaseFile(curText)
            preModel = self.createCaseModel(preCase)
            preTree = gtk.TreeView(preModel)
            preTree.set_rules_hint(False)
            if(casePre.get_child() == None):
                casePre.add(preTree)
            else:
                child = casePre.get_child()
                casePre.remove(child)
                casePre.add(preTree)
            self.add_caseColumns(preTree)         
            preTree.show()
            postModel = self.createCaseModel(postCase)
            postTree = gtk.TreeView(postModel)
            postTree.set_rules_hint(False)
            if(casePost.get_child() == None):
                casePost.add(postTree)
            else:
                child = casePost.get_child()
                casePost.remove(child)
                casePost.add(postTree)
            self.add_caseColumns(postTree)         
            postTree.show()
            
    def showEverything(self, reportWindow, mainWindow, reportLabel, notebook, caseGUIObj):
        reportLabel.show()
        notebook.show()
        reportWindow.show()
        mainWindow.show()
        caseGUIObj.label.show()
        caseGUIObj.casesCombo.show()
        caseGUIObj.casePre.show()
        caseGUIObj.casePost.show()
        caseGUIObj.casesWindow.show()                     

def main():
    gtk.main()

if __name__ == "__main__":
    KiasanNotebook()
    main()
