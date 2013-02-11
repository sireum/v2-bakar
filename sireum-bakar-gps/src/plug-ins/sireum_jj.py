from __future__ import division
import GPS
import os
import pygtk
pygtk.require('2.0')
import gtk
import gobject
import simplejson as json
import unicodedata

(
COLUMN_PACKAGE,
COLUMN_TOTAL,
COLUMN_ERRORS,
COLUMN_INSTRUCTION,
COLUMN_BRANCH,
COLUMN_TIME
) = range(6)

jsonFileDict = {}
rowsExpanded = []

def run_java_program():
	os.system("java -cp /Users/jj/Programs/gnat/share/gps/plug-ins HelloJava "+GPS.current_context().file().name())
	print "filename:", GPS.current_context().file().name()
	print "dir:", GPS.current_context().directory()
	print "entity:", GPS.current_context().entity().name()
	print "project filename:", GPS.current_context().project().file().name()
	print "root project file/pathname:", GPS.Project.root().file().name()
	print "source files:", GPS.current_context().project().sources()
	print "source dirs:", GPS.current_context().project().source_dirs()
	print "project dir:", os.path.dirname(GPS.current_context().project().file().name())
	#print "column:", GPS.current_context().column()
	#print "line:", GPS.current_context().line()
	


"""Kiasan GUI"""

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
            return \
                [retList]
        else:
            return retList
            
    def getChildren(self, jsonDict):
        if jsonDict.has_key("theChildren"):
            return jsonDict["theChildren"]
            
class KiasanNotebook:  
    #Initializes all of the components of the GUI and displays them
    def __init__(self):
        reportWindow, reportLabel = self.initWindow()
        caseGUIObj, notebook = self.initNotebook(reportWindow, reportLabel)
        self.initTree(caseGUIObj, reportWindow, notebook)   
        self.showEverything(reportWindow, reportLabel, notebook, caseGUIObj)
   
    #Initializes the main window, the report section of the window, and the label for the report section
    def initWindow(self):
        reportLabel = gtk.Label("Kiasan Report")
        reportWindow = gtk.ScrolledWindow()
        reportWindow.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        reportWindow.set_size_request(100, 75)
        return reportWindow, reportLabel
    
    #Initializes the notebook tabbed layout of the window, and adds the report window as a tap, along with an empty case tab
    def initNotebook(self, reportWindow, reportLabel):
        notebook = gtk.Notebook()
        notebook.set_tab_pos(gtk.POS_TOP)
        self.show_tabs = True
        self.show_border = True
        notebook.set_current_page(0)
        GPS.MDI.add(notebook, "Kiasan", "kiasan")
        win = GPS.MDI.get('kiasan')
        win.split(reuse="True")
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
            
    def showEverything(self, reportWindow, reportLabel, notebook, caseGUIObj):
        reportLabel.show()
        notebook.show()
        reportWindow.show()
        caseGUIObj.label.show()
        caseGUIObj.casesCombo.show()
        caseGUIObj.casePre.show()
        caseGUIObj.casePost.show()
        caseGUIObj.casesWindow.show()  


def run_kiasan_and_read_json():
	#run kiasan
	
	if GPS.Preference("sireum-kiasan-delete-previous-kiasan-reports-before-re-running"):
		os.system("rm -rf " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")
		os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")
		os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan/xml")
	
	kiasanLibDir = "/Users/jj/Programs/Sireum/apps/bakarv1/eclipse/plugins/org.sireum.spark.eclipse_0.0.4.201212051038/lib/"
	
	runKiasanCommand = "java -jar " + kiasanLibDir + "BakarKiasan.jar"
	runKiasanCommand += " --topi-lib-dir " + kiasanLibDir
	runKiasanCommand += " --outdir /Users/jj/Documents/workspace/test/.sireum/kiasan"
	runKiasanCommand += " --array-bound " + str(GPS.Preference("sireum-kiasan-array-indices-bound").get())
	runKiasanCommand += " --loop-bound " + str(GPS.Preference("sireum-kiasan-loop-bound").get())
	runKiasanCommand += " --invoke-bound " + str(GPS.Preference("sireum-kiasan-call-chain-bound").get())
	runKiasanCommand += " --timeout " + str(GPS.Preference("sireum-kiasan-timeout").get())
	runKiasanCommand += " --constrain-values" if GPS.Preference("sireum-kiasan-constrain-scalar-values").get() else ""
	runKiasanCommand += " --smt " + GPS.Preference("sireum-kiasan-theorem-prover").get()
	runKiasanCommand += " --constraint-solver " + GPS.Preference("sireum-kiasan-theorem-prover").get()
	runKiasanCommand += " --topi-bin-dir " + GPS.Preference("sireum-kiasan-theorem-prover-bin-directory").get()
	runKiasanCommand += " --generate-claim-coverage-report --modular-analysis --generate-pogs-report" if GPS.Preference("sireum-kiasan-generate-claim-report") else ""
	runKiasanCommand += " --source-paths=" + GPS.current_context().directory()
	runKiasanCommand += " --source-files=example.adb,example.ads"
	runKiasanCommand += " --print-trace-bound-exhausted"
	#runKiasanCommand += " --gen-bound-exhaustion-cases"
	runKiasanCommand += " --generate-sireum-report"
	#runKiasanCommand += " --generate-sireum-report-only" 
	runKiasanCommand += " --generate-xml-report"
	runKiasanCommand += " --generate-json-report" if GPS.Preference("sireum-kiasan-generate-json-output").get() else ""
	runKiasanCommand += " --generate-aunit-test-cases" if GPS.Preference("sireum-kiasan-generate-aunit").get() else ""
	runKiasanCommand += " --generate-html-report " + GPS.Preference("sireum-kiasan-html-output-directory").get() if GPS.Preference("sireum-kiasan-generate-html-report").get() else ""
	#TODO: add dotLocation (KiasanRunner.java:443)
	runKiasanCommand += " Example " + GPS.current_context().entity().name()
	
	print runKiasanCommand
	os.system(runKiasanCommand)	
	
	#read generated json
	
	#jsonFileObj = open("/Users/jj/SAnToS/KiasanGUI/test/sireum/kiasan/kiasan_sireum_report.json")
	#jsonFileObj = open("/Users/jj/SAnToS/KiasanGUI/test2/kiasan_sireum_report.json")
	jsonFileObj = open(os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan/kiasan_sireum_report.json")
	jsonFileStr = jsonFileObj.read()
	global jsonFileDict
	jsonFileDict = json.loads(jsonFileStr)
	KiasanNotebook()
    
"""End of Kiasan GUI"""

GPS.parse_xml ("""
	<filter_and name="Source editor in Ada" >
    	<filter language="ada" />
    	<filter id="Source editor" />
  	</filter_and>
    <action name="run Kiasan">
    	<filter id="Source editor in Ada" />
    	<shell>echo "Procedure:" %e %attr(%e)</shell>
        <shell lang="python">sireum_jj.run_kiasan_and_read_json()</shell>
    </action>
    <submenu before="Window">
        <title>Sireum</title>
        <menu action="run Kiasan">
            <title>Run Kiasan</title>
        </menu>        	
    </submenu>     	
	<contextual action="run Kiasan" >
    	<Title>Sireum/Run Kiasan</Title>
  	</contextual>  
  	
  	<preference name = "sireum-kiasan-array-indices-bound"
   				page = "Sireum/Kiasan"
   				label = "Array indices bound"
   				type = "integer" 
   				default = "5"
   				/>
   	<preference name = "sireum-kiasan-loop-bound"
   				page = "Sireum/Kiasan"
   				label = "Loop bound"
   				type = "integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-call-chain-bound"
   				page="Sireum/Kiasan"
   				label="Call chain bound"
   				type="integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-timeout"
   				page="Sireum/Kiasan"
   				label="Timeout (minutes)"
   				type="integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-constrain-scalar-values"
   				page="Sireum/Kiasan"
   				label="Constrain Scalar Values"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-save-dirty-editors-before-running-kiasan"
   				page="Sireum/Kiasan"
   				label="Save dirty editors before running Kiasan"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-always-run-spark-examiner-before-running-kiasan"
   				page="Sireum/Kiasan"
   				label="Always run Spark Examiner before running Kiasan"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-delete-previous-kiasan-reports-before-re-running"
   				page="Sireum/Kiasan"
   				label="Delete previous Kiasan reports before re-running"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-warn-if-configuration-not-provided"
   				page="Sireum/Kiasan"
   				label="Warn in configuration not provided"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-generate-claim-report"
   				page="Sireum/Kiasan"
   				label="Generate Claim Report"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-generate-html-report"
   				page="Sireum/Kiasan"
   				label="Generate HTML report"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-html-output-directory"
   				page="Sireum/Kiasan"
   				label="HTML Output Directory"
   				type="string" 
   				default = "~/Documents/Kiasan"
   				/>
   	<preference name="sireum-kiasan-location-of-dot-executable"
   				page="Sireum/Kiasan"
   				label="Location of Dot Executable"
   				type="string" 
   				default = "/Users/jj/Programs/Sireum/apps/graphviz/bin/dot"
   				/>
   	<preference name="sireum-kiasan-theorem-prover"
   				page="Sireum/Kiasan"
   				label="Theorem prover"
   				type="choices" 
   				default = "1">
   				<choice>Yices</choice>
   				<choice>Z3</choice> <!--  The default choice -->
	</preference>
   	<preference name="sireum-kiasan-theorem-prover-bin-directory"
   				page="Sireum/Kiasan"
   				label="Theorem Prover Bin Directory"
   				type="string" 
   				default = "/Users/jj/Programs/Sireum/apps/z3/bin"
   				/>
   	<preference name="sireum-kiasan-generate-aunit"
   				page="Sireum/Kiasan"
   				label="Generate AUnit (Experimental)"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-generate-json-output"
   				page="Sireum/Kiasan"
   				label="Generate JSON Output (Experimental)"
   				type="boolean" 
   				default = "True"
   				/>
""")