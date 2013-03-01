from __future__ import division
import GPS
import os
import pygtk
pygtk.require('2.0')
import gtk
import re
import warnings
import kiasan.gui
import kiasan.logic


def run_helper():
	"""This is helper function with reference to GPS function for fetching properties of project/code."""
	
#	print "filename:", GPS.current_context().file().name()
#	print "dir:", GPS.current_context().directory()
#	print "entity:", GPS.current_context().entity().name()
#	print "entity category:", GPS.current_context().entity().category()
#	print "entity declaration:", GPS.current_context().entity().declaration()
#	#print "entity body:", GPS.current_context().entity().body()
#	print "entity methods:", GPS.current_context().entity().methods()
#	print "entity primitive_of:", GPS.current_context().entity().primitive_of()
#	print "entity references:", GPS.current_context().entity().references()
#	#print "dir(entity)", dir(GPS.current_context().entity())
#	print "project filename:", GPS.current_context().project().file().name()
#	print "root project file/pathname:", GPS.Project.root().file().name()
#	print "source files:", GPS.current_context().project().sources()
#	print "source dirs:", GPS.current_context().project().source_dirs()
#	print "project dir:", os.path.dirname(GPS.current_context().project().file().name())
	
#	print '\n\nGPS.File(GPS.current_context().file().name()).entities()', GPS.File(GPS.current_context().file().name()).entities()
#	print '\n\nGPS.current_context().file().entities()', GPS.current_context().file().entities()
#	
#	print '\n\nGPS.File(GPS.current_context().file().name()).entities(False)', GPS.File(GPS.current_context().file().name()).entities(False)
#	print '\n\nGPS.current_context().file().entities(False)', GPS.current_context().file().entities(False)
	
	


def run_kiasan_plugin():
	"""This method runs Kiasan plugin and load generated reports data into integrated GPS window."""	
	prepare_directories_for_reports()	
	run_kiasan_tool()
	
	#read generated json
	kiasan_logic = kiasan.logic.KiasanLogic()
	report_file_path = os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan/kiasan_sireum_report.json"
	report = kiasan_logic.extract_report_file(report_file_path)
	
	# load data into GUI
	gui = kiasan.gui.KiasanGUI(report)
	
	# attach GUI to GPS
	GPS.MDI.add(gui._pane, "Kiasan", "kiasan")
	win = GPS.MDI.get('kiasan')
	win.split(reuse=True) # reuse=True: bottom from code window, reuse=False: top from code window
	win.float(float=False)	# float=True: popup, float=False: GPS integrated window


def prepare_directories_for_reports():
	"""
	If option 'Delete previous Kiasan reports before re-runing' is enabled then delete entire directory, and create new empty.
	Check if directory sireum and sireum/kiasan exists - if not create them.
	"""	
	if GPS.Preference("sireum-kiasan-delete-previous-kiasan-reports-before-re-running").get():
		os.system("rm -rf " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")
		os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")
	else:
		if not os.path.isdir(os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum"):
			os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum")	
		if not os.path.isdir(os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan"):
			os.system("mkdir " + os.path.dirname(GPS.current_context().project().file().name()) + "/.sireum/kiasan")


def run_kiasan_tool():
	"""Runs Kiasan based on preferences and clicked entity."""	
	# get package name (we assume that package_name = file_name_without_extension)
	warnings.warn('Maybe better solution is fetch package from entities list? (like methods)')
	file_name = GPS.current_context().file().name()
	match = re.search(r'(?<=\/)(\w+)\.ad[bs]', file_name)
	package_name = match.groups()[0]
	
	# get methods list	
	if GPS.current_context().entity().category() == "subprogram":
		methods_list = [GPS.current_context().entity().name()]
	elif GPS.current_context().entity().category() == "package/namespace":
		# fetch all methods from file (method=subprogram) 
		methods_list = []
		for entity in GPS.current_context().file().entities(False):
			if entity.category() == 'subprogram':
				methods_list.append(entity.name())
		
	
	kiasan_lib_dir = "/Users/jj/Programs/Sireum/apps/bakarv1/eclipse/plugins/org.sireum.spark.eclipse_0.0.4.201302251534/lib/"
	
	# create run command
	run_kiasan_command = "java -jar " + kiasan_lib_dir + "BakarKiasan.jar"
	run_kiasan_command += " --topi-lib-dir " + kiasan_lib_dir
	run_kiasan_command += " --outdir /Users/jj/Documents/workspace/test/.sireum/kiasan"
	run_kiasan_command += " --array-bound " + str(GPS.Preference("sireum-kiasan-array-indices-bound").get())
	run_kiasan_command += " --loop-bound " + str(GPS.Preference("sireum-kiasan-loop-bound").get())
	run_kiasan_command += " --invoke-bound " + str(GPS.Preference("sireum-kiasan-call-chain-bound").get())
	run_kiasan_command += " --timeout " + str(GPS.Preference("sireum-kiasan-timeout").get())
	run_kiasan_command += " --constrain-values" if GPS.Preference("sireum-kiasan-constrain-scalar-values").get() else ""
	run_kiasan_command += " --smt " + GPS.Preference("sireum-kiasan-theorem-prover").get()
	run_kiasan_command += " --constraint-solver " + GPS.Preference("sireum-kiasan-theorem-prover").get()
	run_kiasan_command += " --topi-bin-dir " + GPS.Preference("sireum-kiasan-theorem-prover-bin-directory").get()
	run_kiasan_command += " --generate-claim-coverage-report --modular-analysis --generate-pogs-report" if GPS.Preference("sireum-kiasan-generate-claim-report") else ""
	run_kiasan_command += " --source-paths=" + GPS.current_context().directory()
	run_kiasan_command += " --source-files=" + package_name + ".adb" + "," + package_name + ".ads"
	run_kiasan_command += " --print-trace-bound-exhausted"
	#run_kiasan_command += " --gen-bound-exhaustion-cases"
	run_kiasan_command += " --generate-sireum-report"
	#run_kiasan_command += " --generate-sireum-report-only" 
	run_kiasan_command += " --generate-xml-report"
	run_kiasan_command += " --generate-json-report" if GPS.Preference("sireum-kiasan-generate-json-output").get() else ""
	run_kiasan_command += " --generate-aunit-test-cases" if GPS.Preference("sireum-kiasan-generate-aunit").get() else ""
	run_kiasan_command += " --generate-html-report " + GPS.Preference("sireum-kiasan-html-output-directory").get() if GPS.Preference("sireum-kiasan-generate-html-report").get() else ""
	#TODO: add dotLocation?? (KiasanRunner.java:443)
	run_kiasan_command += " " + package_name
	
	# run Kiasan tool for each method
	for method in methods_list:
		print run_kiasan_command + " " + method
		os.system(run_kiasan_command + " " + method)	


GPS.parse_xml ("""
	<filter_and name="Source editor in Ada" >
    	<filter language="ada" />
    	<filter id="Source editor" />
    	<filter 
    		shell_lang="python" 
    		shell_cmd="GPS.current_context().entity().category() in ['subprogram', 'package/namespace'] " />
  	</filter_and>
    <action name="run Kiasan">
    	<filter id="Source editor in Ada" />
        <shell lang="python">sireum.run_kiasan_plugin()</shell>
    </action>
    <action name="run Helper">
        <shell lang="python">sireum.run_helper()</shell>
    </action>
    <submenu before="Window">
        <title>Sireum</title>
        <menu action="run Kiasan">
            <title>Run Kiasan</title>
        </menu>
        <menu action="run Helper">
            <title>Run Helper</title>
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