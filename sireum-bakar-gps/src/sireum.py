#!/usr/bin/python
#-*- coding: utf-8 -*-

from __future__ import division
import GPS
import os
from gi.repository import Gtk
from gi.repository import Gdk
import warnings
import urllib
import subprocess
from gi.repository import GObject as gobject
import traceback
import uuid
import time
import json

server_process = None
server_id = str(uuid.uuid1())[:6] # generate guid

class ProjectNotBuiltException(Exception):
  def __init__(self, value):
    self.value = value
  def __str__(self):
    return repr(self.value)
       

def run_kiasan_plugin():
  """This method runs Kiasan plugin and load generated reports data into integrated GPS window."""
  global server_process, server_id
  try:        
    # raise exception when project is not build, because then we cannot fetch package name or subprograms
    if GPS.current_context().file().entities(False) == []:
      raise ProjectNotBuiltException
    
    if GPS.current_context().entity().is_subprogram():
      # get package name
      for entity in GPS.current_context().file().entities(False):
        warnings.warn("the second condition of below if is UGLY...but I didn't find the better way to check if entity is subprogram's package because file can have entities from external files")
        if entity.is_container and entity.name().lower() == GPS.current_context().file().name()[GPS.current_context().file().name().rfind('/')+1:-4].lower():
          package_name = entity.name()
          # set methods_list to only one method
          subprograms_list = [GPS.current_context().entity().name()]
    elif GPS.current_context().entity().is_container():
      # get package name
      package_name = GPS.current_context().entity().name()    
      # fetch all methods from file (method=subprogram)
      subprograms_list = []
      for entity in GPS.current_context().file().entities(False):
        if entity.is_subprogram():
          subprograms_list.append(entity.name())
                    
    SIREUM_PATH = get_sireum_path()
    load_sireum_settings(SIREUM_PATH)        
        
    if server_process is None:
      run_kiasan_server(SIREUM_PATH)
      time.sleep(2) #wait 2 secs to let server run the browser
        
    if server_id != GPS.Preference("sireum-kiasan-server-id").get():
      server_process.stdin.write("x\r\n")
      run_kiasan_server(SIREUM_PATH)
      time.sleep(2) #wait 2 secs to let server run the browser
      server_id = GPS.Preference("sireum-kiasan-server-id").get()
        
    send_units_for_analysis(package_name, subprograms_list)
  
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


def run_kiasan_server(SIREUM_PATH):
  global server_process, server_id
  os.putenv('SCALA_OPTIONS', '-J-mx2048m')
  host = GPS.Preference("sireum-kiasan-server-address").get()
  port = str(GPS.Preference("sireum-kiasan-server-port").get())
  remote = GPS.Preference("sireum-kiasan-remote-server-address").get()
  remoteport = str(GPS.Preference("sireum-kiasan-remote-server-port").get())
  run_server_cmd = [SIREUM_PATH + "/sireum", "launch", "bkserver", "--id", server_id, "--host", host, "--port", port, "--remote", remote, "--remoteport", remoteport]    
  server_process = subprocess.Popen(run_server_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
  print " ".join(run_server_cmd)
  #p.stdin.write("bakarkiasan:hi\r\n")
  #print p.stdout.readline()
  #p.stdin.write("x\r\n")
    

def send_units_for_analysis(package_name, subprograms_list):
  global server_process, server_id
  host = GPS.Preference("sireum-kiasan-server-address").get()
  port = GPS.Preference("sireum-kiasan-server-port").get()
  files = get_spark_source_files()
  depth_bound = GPS.Preference("sireum-kiasan-depth-bound").get()
  array_indices_bound = GPS.Preference("sireum-kiasan-array-indices-bound").get()
  loop_bound = GPS.Preference("sireum-kiasan-loop-bound").get()
  call_chain_bound = GPS.Preference("sireum-kiasan-call-chain-bound").get()
  timeout = GPS.Preference("sireum-kiasan-timeout").get()
  project_name = GPS.Project.root().name()
  for subprogram in subprograms_list:
    unit_name = [project_name, package_name, subprogram]
    json_str = AnalysisProcessRequestMessage(server_id, host, port, unit_name, files, depth_bound, array_indices_bound, loop_bound, call_chain_bound, timeout)
    print json_str
    server_process.stdin.write("bakarkiasan:" + json_str + "\r\n")


def AnalysisProcessRequestMessage(server_id, host, port, unitName, files, depthBound, arrayIndicesBound, loopBound, callChainBound, timeout):
  o = {}
  o['id'] = server_id
  o['host'] = host
  o['port'] = port
  o['unitName'] = unitName
  o['files'] = files
  o['depthBound'] = depthBound
  o['arrayIndicesBound'] = arrayIndicesBound
  o['loopBound'] = loopBound
  o['callChainBound'] = callChainBound
  o['timeout'] = timeout
  o['type'] = "AnalysisProcessRequestMessage"
  return json.dumps(o)


def get_spark_source_files():
  """ Get SPARK source files based on spark.smf. """
  try:
    import urlparse, urllib
    with open('spark.smf') as spark_idx_file:
      files = []
      paths = spark_idx_file.readlines()
      for path in paths:
        uri = urlparse.urljoin('file:', urllib.pathname2url(path.strip()))
        files.append(uri)
      return files
  except (OSError, IOError):        
    GPS.MDI.dialog("SPARK meta file (spark.smf) not found. Run SPARK make on project and try again.")
    traceback.print_exc()
    raise
        

def get_sireum_path():
  """ This method is fetching sireum path from SIREUM_HOME environmental variable or from the PATH (if SIREUM_HOME not set) """
    
  SPLITTER = ";" if os.name=="nt" else ":"
  SIREUM_HOME = "SIREUM_HOME"
    
  sireum_path = ""
  if SIREUM_HOME in os.environ:   # check if SIREUM_HOME is set
    sireum_path = os.environ[SIREUM_HOME].replace("\\","/").replace("\n","")
  else:   # check if Sireum is in the PATH
    output = os.environ['PATH'].replace("\\","/")
    paths = output.split(SPLITTER)
    sireum_paths = [i for i in paths if 'Sireum' in i]
    if len(sireum_paths)>0:
      r_index = sireum_paths[0].rfind('Sireum')
      if r_index>-1:
        sireum_path = sireum_paths[0][:r_index+len('Sireum')]
    
  sireum_path = os.path.abspath(sireum_path)    # normalize path (remove / at the end if exists)    
    
  if sireum_path == "":
    raise Exception('Sireum path not found')
    
  return sireum_path


def load_sireum_settings(SIREUM_PATH):
  """ Set preferences (if not set). """
    
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

GPS.parse_xml ("""
    <filter_and name="Source editor in Ada" >
        <filter language="ada" />
        <filter id="Source editor" />
        <filter 
            shell_lang="python" 
            shell_cmd="GPS.current_context().entity().is_subprogram() or GPS.current_context().entity().is_container() " />
    </filter_and>
    
    <action name="run Kiasan">
        <filter id="Source editor in Ada" />
        <shell lang="python">sireum.run_kiasan_plugin()</shell>
    </action>    
    <action name="run Kiasan...">
        <filter id="Source editor in Ada" />
        <shell lang="python">sireum.run_kiasan_with_options()</shell>
    </action> 
    <submenu after="Tools">
        <title>Sireum Bakar</title>
        <menu action="run Kiasan">
            <title>Run Kiasan</title>
        </menu>     
        <menu action="run Kiasan...">
            <title>Run Kiasan...</title>
        </menu>                
    </submenu>
    <contextual action="run Kiasan" >
        <Title>Sireum Bakar/Run Kiasan</Title>
    </contextual>
    <contextual action="run Kiasan..." >
        <Title>Sireum Bakar/Run Kiasan...</Title>
    </contextual>
    <key action="run Kiasan">control-k</key>
      
      <preference name = "sireum-kiasan-depth-bound"
                   page = "Sireum Bakar/Kiasan"
                   label = "Depth bound"
                   type = "integer" 
                   minimum = "1"
                   maximum = "10000"
                   default = "10"
                   />
      <preference name = "sireum-kiasan-array-indices-bound"
                   page = "Sireum Bakar/Kiasan"
                   label = "Array indices bound"
                   type = "integer" 
                   minimum = "1"
                   maximum = "10000"
                   default = "5"
                   />
       <preference name = "sireum-kiasan-loop-bound"
                   page = "Sireum Bakar/Kiasan"
                   label = "Loop bound"
                   type = "integer" 
                   minimum = "1"
                   maximum = "10000"
                   default = "10"
                   />
       <preference name="sireum-kiasan-call-chain-bound"
                   page="Sireum Bakar/Kiasan"
                   label="Call chain bound"
                   type="integer" 
                   minimum = "1"
                   maximum = "10000"
                   default = "10"
                   />
       <preference name="sireum-kiasan-timeout"
                   page="Sireum Bakar/Kiasan"
                   label="Timeout (minutes)"
                   type="integer" 
                   default = "10"
                   minimum = "1"
                   maximum = "1440"
                   />
       <preference name="sireum-kiasan-constrain-scalar-values"
                   page="Sireum Bakar/Kiasan"
                   label="Constrain Scalar Values"
                   type="boolean" 
                   default = "True"
                   />
       <preference name="sireum-kiasan-save-dirty-editors-before-running-kiasan"
                   page="Sireum Bakar/Kiasan"
                   label="Save dirty editors before running Kiasan"
                   type="boolean" 
                   default = "False"
                   />
       <preference name="sireum-kiasan-html-output-directory"
                   page="Sireum Bakar/Kiasan"
                   label="HTML Output Directory"
                   type="string" 
                   default = "~/Documents/Kiasan"
                   />
       <preference name="sireum-kiasan-location-of-dot-executable"
                   page="Sireum Bakar/Kiasan"
                   label="Location of Dot Executable"
                   type="string" 
                   default = ""
                   />
       <preference name="sireum-kiasan-theorem-prover-bin-directory"
                   page="Sireum Bakar/Kiasan"
                   label="Theorem Prover Bin Directory"
                   type="string" 
                   default = ""
                   />
       <preference name="sireum-kiasan-server-address"
                   page="Sireum Bakar/Kiasan"
                   label="Server Address"
                   type="string" 
                   default = "127.0.0.1"
                   />
        <preference name="sireum-kiasan-server-port"
                   page="Sireum Bakar/Kiasan"
                   label="Server Port"
                   type="integer"
                   minimum = "0"
                   maximum = "65535"
                   default = "8080"
                   />
        <preference name="sireum-kiasan-server-id"
                   page="Sireum Bakar/Kiasan"
                   label="Server Id"
                   type="string" 
                   default = "%s"
                   />
        <preference name="sireum-kiasan-remote-server-address"
                   page="Sireum Bakar/Kiasan"
                   label="Remote Server DNS"
                   type="string" 
                   default = ""
                   />
        <preference name="sireum-kiasan-remote-server-port"
                   page="Sireum Bakar/Kiasan"
                   label="Remote Server Port"
                   type="integer"
                   minimum = "0"
                   maximum = "65535" 
                   default = "80"
                   />
                
""" % server_id
)
