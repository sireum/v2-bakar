from __future__ import division
import GPS
import os
import pygtk
pygtk.require('2.0')
import gtk
import warnings
import kiasan_v1.gui
import kiasan_v1.logic
import urllib
import subprocess
import gobject
import traceback



class ProjectNotBuiltException(Exception):
	def __init__(self, value):
		self.value = value
	def __str__(self):
		return repr(self.value)
	
	

def run_kiasan_plugin():
	"""This method runs Kiasan plugin and load generated reports data into integrated GPS window."""
	try:
		project_path = get_spark_sources_path()	#normalized project path
		remove_previous_reports = GPS.Preference("sireum-kiasan-delete-previous-kiasan-reports-before-re-running").get()
		prepare_directories_for_reports(project_path, remove_previous_reports)	
		
		# raise exception when project is not build, because then we cannot fetch package name or subprograms
		if GPS.current_context().file().entities(False) == []:
			raise ProjectNotBuiltException	
		
		if GPS.current_context().entity().category() == "subprogram":
			# get package name		
			for entity in GPS.current_context().file().entities(False):
				warnings.warn("the second condition of below if is UGLY...but I didn't find the better way \
				to check if entity is subprogram's package because file can have entities from external files")
				if entity.category() == 'package/namespace' and \
					entity.name().lower() == GPS.current_context().file().name()[GPS.current_context().file().name().rfind('/')+1:-4].lower():
					package_name = entity.name()
			# set methods_list to only one method
			methods_list = [GPS.current_context().entity().name()]	
		elif GPS.current_context().entity().category() == "package/namespace":
			# get package name
			package_name = GPS.current_context().entity().name()	
			# fetch all methods from file (method=subprogram)
			methods_list = []
			for entity in GPS.current_context().file().entities(False):
				if entity.category() == 'subprogram':
					methods_list.append(entity.name())	
		
		SIREUM_PATH = get_sireum_path()	
		load_sireum_settings(SIREUM_PATH)	
		source_path = GPS.current_context().directory().replace("\\","/")
		output_dir = os.path.dirname(GPS.current_context().project().file().name()).replace("\\","/") + "/.sireum/kiasan"
		kiasan_run_cmd = get_run_kiasan_command(SIREUM_PATH, package_name, source_path, output_dir, False)
		kiasan_run_cmd_with_report = get_run_kiasan_command(SIREUM_PATH, package_name, source_path, output_dir, True)
		
		# init progress bar
		win_pb, progressbar = init_progressbar()
		GPS.MDI.add(win_pb, "Kiasan", "kiasanprogress")	
		win = GPS.MDI.get('kiasanprogress')
		win.split(reuse=True)	# reuse=True: bottom from code window, reuse=False: top from code window
		win.float(float=False)	# float=True: popup, float=False: GPS integrated window
		gobject.threads_init()
		gobject.idle_add(run_kiasan_alasysis_async, progressbar, project_path, kiasan_run_cmd, kiasan_run_cmd_with_report, methods_list)

	except ProjectNotBuiltException as e:
		print "ProjectNotBuiltException({0}): {1}".format(e.errno, e.strerror)
		GPS.MDI.dialog("Build project, before run Kiasan.")
		traceback.print_exc()
	except AttributeError as e:
		print dir(e)
		print "AttributeError:" + e.message
		GPS.MDI.dialog("This file does not belongs to opened project.")
	except IOError:
		GPS.MDI.dialog("Error: Kiasan report not generated.")
		traceback.print_exc()
	except Exception:
		traceback.print_exc()		


def get_spark_sources_path():
	""" Get sources path. """
	return os.path.dirname(GPS.current_context().project().file().name()).replace("\\", "/")

		
	
def prepare_directories_for_reports(project_path, remove_previous_reports):
	"""
	If option 'Delete previous Kiasan reports before re-runing' is enabled then delete entire directory, and create new empty.
	Check if directory sireum and sireum/kiasan exists - if not create them.
	"""	
	if remove_previous_reports:
		REMOVE_DIR_CMD = "rd /s /q" if os.name=="nt" else "rm -rf"
		os.system(REMOVE_DIR_CMD + " " + "\"" + project_path + "/.sireum/kiasan" + "\"")
	if not os.path.isdir(project_path + "/.sireum"):
		os.system("mkdir \"" + project_path + "/.sireum\"")	
	if not os.path.isdir(project_path + "/.sireum/kiasan"):
		os.system("mkdir \"" + project_path + "/.sireum/kiasan\"")


def run_kiasan_alasysis_async(progressbar, project_path, kiasan_run_cmd, kiasan_run_cmd_with_report, methods_list):	
	""" Runs Kiasan analysis based on preferences and clicked entity. """
	# get package_name and methods list
	
	try:
		method_no = 0	# for progress bar
		# run Kiasan tool for each method except last one
		for method in methods_list[:-1]:			
			
			#update progress bar
			progressbar.set_fraction(float(method_no)/len(methods_list))
			progressbar.set_text(str(int(float(method_no)/len(methods_list)*100)) + " %")
			while gtk.events_pending():
				gtk.main_iteration() # http://stackoverflow.com/questions/496814/progress-bar-not-updating-during-operation	
			method_no += 1
			run_kiasan(kiasan_run_cmd, method)
					
		#update progress bar	
		progressbar.set_fraction(float(method_no)/len(methods_list))
		progressbar.set_text(str(int(float(method_no)/len(methods_list)*100)) + " %")
		while gtk.events_pending():
			gtk.main_iteration() # http://stackoverflow.com/questions/496814/progress-bar-not-updating-during-operation
		method_no += 1
		
		# run kiasan on last method with report
		
		run_kiasan(kiasan_run_cmd_with_report, methods_list[-1])
		progressbar.set_fraction(float(method_no)/len(methods_list))
		progressbar.set_text(str(int(float(method_no)/len(methods_list)*100)) + " %")
		while gtk.events_pending():
			gtk.main_iteration() # http://stackoverflow.com/questions/496814/progress-bar-not-updating-during-operation
						
		# read generated json
		kiasan_logic = kiasan_v1.logic.KiasanLogic()
		report_file_path = project_path + "/.sireum/kiasan/kiasan_sireum_report.json"
		report_file_url = urllib.pathname2url(report_file_path)
		report = kiasan_logic.extract_report_file(report_file_url)
		
		# load data into GUI
		gui = kiasan_v1.gui.KiasanGUI(report)
			
		# attach GUI to GPS
		if GPS.MDI.get('kiasan') is not None:
			GPS.MDI.get('kiasan').hide()	# hide previous Kiasan results
		GPS.MDI.add(gui._pane, "Kiasan", "kiasan")
		win = GPS.MDI.get('kiasan')
		win.split(reuse=False) # reuse=True: bottom from code window, reuse=False: top from code window
		win.float(float=False)	# float=True: popup, float=False: GPS integrated window
		
		# hide progressbar
		GPS.MDI.get('kiasanprogress').hide()
	except Exception:
		traceback.print_exc()



def run_kiasan(kiasan_run_cmd, method):
	""" Single Kiasan run. """
	print " ".join(kiasan_run_cmd + [method])
	subprocess.call(kiasan_run_cmd + [method])
		

def init_progressbar():
	main_box = gtk.VBox()

	progressbar = gtk.ProgressBar()

	progressbar_box = gtk.HBox(False, 20)
	main_box.pack_start(progressbar_box, False, False, 20)
	progressbar_box.pack_start(progressbar)

	info_box = gtk.VBox()
	main_box.pack_start(info_box, False, False, 10)
	
	info_label = gtk.Label("Kiasan is running...")
	info_box.pack_start(info_label)
	
	#cancel_box = gtk.HBox()
	#info_box.pack_start(cancel_box)
	#cancel_button = gtk.Button("Cancel")
	#cancel_button.connect("clicked", cancel_counting, info_label)
	#cancel_box.pack_start(cancel_button, False, False, 20)

	return main_box, progressbar


def get_sireum_path():
	""" This method is fetching sireum path from SIREUM_HOME environmental variable or from the PATH (if SIREUM_HOME not set) """
	
	SPLITTER = ";" if os.name=="nt" else ":"
	SIREUM_HOME = "SIREUM_HOME"
	
	sireum_path = ""
	# check if SIREUM_HOME is set
	if SIREUM_HOME in os.environ:
		sireum_path = os.environ[SIREUM_HOME].replace("\\","/").replace("\n","")
	# check if Sireum is in the PATH
	else:
		output = os.environ['PATH'].replace("\\","/")
		paths = output.split(SPLITTER)
		sireum_paths = [i for i in paths if 'Sireum' in i]
		if len(sireum_paths)>0:
			r_index = sireum_paths[0].rfind('Sireum')
			if r_index>-1:
				sireum_path = sireum_paths[0][:r_index+len('Sireum')]
	
	sireum_path = os.path.abspath(sireum_path)	# normalize path (remove / at the end if exists)	
	
	if sireum_path == "":
		raise Exception('Sireum path not found')
	
	return sireum_path


def load_sireum_settings(SIREUM_PATH):
	""" Set preferences (if not set). """
	
	# set HTML Output dir
	html_output_dir = GPS.Preference("sireum-kiasan-html-output-directory")
	if html_output_dir.get()=="":
		home_path = os.environ['HOME'].replace("\\","/")
		default_html_output_path = home_path + "/Documents/Kiasan"
		html_output_dir.set(default_html_output_path)
	
	# set theorem prover and dot exec paths	
	if SIREUM_PATH != "":
		dot_exec = GPS.Preference("sireum-kiasan-location-of-dot-executable")
		if dot_exec.get() == "":
			default_dot_exec_path = SIREUM_PATH + "/apps/graphviz/bin/dot"
			dot_exec.set(default_dot_exec_path)
		
		theorem_prover = GPS.Preference("sireum-kiasan-theorem-prover-bin-directory")
		if theorem_prover.get() == "":
			default_theorem_prover_path = SIREUM_PATH + "/apps/z3/bin"
			theorem_prover.set(default_theorem_prover_path)
	

def get_run_kiasan_command(SIREUM_PATH, package_name, source_path, output_dir, generate_report):
	""" Create command for run Kiasan. """
	kiasan_lib_dir = SIREUM_PATH + "/apps/bakarv1/eclipse/plugins/org.sireum.spark.eclipse/lib/"	
	spark_source_files = ",".join(get_spark_source_files(source_path))
	
	run_kiasan_command = []
	if os.path.isdir(SIREUM_PATH + "/apps/platform/java"):
		run_kiasan_command.append(SIREUM_PATH + "/apps/platform/java/bin/java")
	else:
		run_kiasan_command.append("java")
	run_kiasan_command.append("-jar")
	run_kiasan_command.append(kiasan_lib_dir + "BakarKiasan.jar")
	run_kiasan_command.append("--topi-lib-dir")
	run_kiasan_command.append(kiasan_lib_dir)
	run_kiasan_command.append("--outdir")
	run_kiasan_command.append(output_dir)
	run_kiasan_command.append("--array-bound")
	run_kiasan_command.append(str(GPS.Preference("sireum-kiasan-array-indices-bound").get()))
	run_kiasan_command.append("--loop-bound")
	run_kiasan_command.append(str(GPS.Preference("sireum-kiasan-loop-bound").get()))
	run_kiasan_command.append("--invoke-bound")
	run_kiasan_command.append(str(GPS.Preference("sireum-kiasan-call-chain-bound").get()))
	run_kiasan_command.append("--timeout")
	run_kiasan_command.append(str(GPS.Preference("sireum-kiasan-timeout").get()))
	if GPS.Preference("sireum-kiasan-constrain-scalar-values").get():
		run_kiasan_command.append("--constrain-values")
	run_kiasan_command.append("--smt")
	run_kiasan_command.append(GPS.Preference("sireum-kiasan-theorem-prover").get())
	run_kiasan_command.append("--constraint-solver")
	run_kiasan_command.append(GPS.Preference("sireum-kiasan-theorem-prover").get())
	run_kiasan_command.append("--topi-bin-dir")
	run_kiasan_command.append(GPS.Preference("sireum-kiasan-theorem-prover-bin-directory").get())
	run_kiasan_command.append("--source-paths=" + source_path)
	
	
	#run_kiasan_command.append("--source-files=" + package_name + ".adb" + "," + package_name + ".ads")
	run_kiasan_command.append("--source-files=" + spark_source_files)
	
	run_kiasan_command.append("--print-trace-bound-exhausted")
	warnings.warn('run_kiasan_command.append("--gen-bound-exhaustion-cases")')
	if generate_report:
		if GPS.Preference("sireum-kiasan-generate-claim-report").get():
			run_kiasan_command.append("--generate-claim-coverage-report")
			run_kiasan_command.append("--modular-analysis")
		run_kiasan_command.append("--generate-pogs-report")
		run_kiasan_command.append("--generate-sireum-report")
		warnings.warn('run_kiasan_command.append("--generate-sireum-report-only")') 
		run_kiasan_command.append("--generate-xml-report")
		if GPS.Preference("sireum-kiasan-generate-json-output").get():
			run_kiasan_command.append("--generate-json-report")
		if GPS.Preference("sireum-kiasan-generate-aunit").get():
			run_kiasan_command.append("--generate-aunit-test-cases")
		if GPS.Preference("sireum-kiasan-generate-html-report").get():
			run_kiasan_command.append("--generate-html-report")
			run_kiasan_command.append("--html-report-dir")
			html_output_dir = GPS.Preference("sireum-kiasan-html-output-directory").get()
			if html_output_dir == "":
				html_output_dir = output_dir
			run_kiasan_command.append(html_output_dir)
			run_kiasan_command.append("--dot-location")
			run_kiasan_command.append(GPS.Preference("sireum-kiasan-location-of-dot-executable").get())
			run_kiasan_command.append("--dot-format") 
			run_kiasan_command.append("XDOT") 
	run_kiasan_command.append(package_name)
	
	return run_kiasan_command


def get_spark_source_files(source_path):
	""" Get SPARK source files. """	
	spark_files_list = []
	for f in os.listdir(source_path):
		if f.endswith(".adb") or f.endswith(".ads"):
			spark_files_list.append(f)
	return spark_files_list



GPS.parse_xml ("""
	<filter_and name="Source editor in Ada" >
    	<filter language="ada" />
    	<filter id="Source editor" />
    	<filter 
    		shell_lang="python" 
    		shell_cmd="GPS.current_context().entity().category() in ['subprogram', 'package/namespace'] " />
  	</filter_and>
	<action name="run Kiasan V1">
		<filter id="Source editor in Ada" />
		<shell lang="python">sireum_v1.run_kiasan_plugin()</shell>
	</action>	
    <submenu before="Window">
        <title>Sireum Bakar (v1)</title>
        <menu action="run Kiasan V1">
            <title>Run Kiasan</title>
        </menu>	            	
    </submenu>
	<contextual action="run Kiasan V1" >
    	<Title>Sireum Bakar (v1)/Run Kiasan</Title>
  	</contextual>
  	
  	<preference name = "sireum-kiasan-array-indices-bound"
   				page = "Sireum Bakar (v1)/Kiasan"
   				label = "Array indices bound"
   				type = "integer" 
   				default = "5"
   				/>
   	<preference name = "sireum-kiasan-loop-bound"
   				page = "Sireum Bakar (v1)/Kiasan"
   				label = "Loop bound"
   				type = "integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-call-chain-bound"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Call chain bound"
   				type="integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-timeout"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Timeout (minutes)"
   				type="integer" 
   				default = "10"
   				/>
   	<preference name="sireum-kiasan-constrain-scalar-values"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Constrain Scalar Values"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-save-dirty-editors-before-running-kiasan"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Save dirty editors before running Kiasan"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-always-run-spark-examiner-before-running-kiasan"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Always run Spark Examiner before running Kiasan"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-delete-previous-kiasan-reports-before-re-running"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Delete previous Kiasan reports before re-running"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-warn-if-configuration-not-provided"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Warn in configuration not provided"
   				type="boolean" 
   				default = "True"
   				/>
   	<preference name="sireum-kiasan-generate-claim-report"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Generate Claim Report"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-generate-html-report"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Generate HTML report"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-html-output-directory"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="HTML Output Directory"
   				type="string" 
   				default = "~/Documents/Kiasan"
   				/>
   	<preference name="sireum-kiasan-location-of-dot-executable"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Location of Dot Executable"
   				type="string" 
   				default = ""
   				/>
   	<preference name="sireum-kiasan-theorem-prover"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Theorem prover"
   				type="choices" 
   				default = "1">
   				<choice>Yices</choice>
   				<choice>Z3</choice> <!--  The default choice -->
	</preference>
   	<preference name="sireum-kiasan-theorem-prover-bin-directory"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Theorem Prover Bin Directory"
   				type="string" 
   				default = ""
   				/>
   	<preference name="sireum-kiasan-generate-aunit"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Generate AUnit (Experimental)"
   				type="boolean" 
   				default = "False"
   				/>
   	<preference name="sireum-kiasan-generate-json-output"
   				page="Sireum Bakar (v1)/Kiasan"
   				label="Generate JSON Output (Experimental)"
   				type="boolean" 
   				default = "True"
   				/>
""")
