from __future__ import division
import GPS
import os
import pygtk
pygtk.require('2.0')
import gtk
import re
import warnings
import urllib
import subprocess
import gtk, gobject


def run_kiasan_plugin():
    """This method runs Kiasan plugin and load generated reports data into integrated GPS window."""
    GPS.MDI.dialog("New Sireum Bakar Kiasan is under development. Coming later this year.")


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
    <submenu after="Tools">
        <title>Sireum Bakar</title>
        <menu action="run Kiasan">
            <title>Run Kiasan</title>
        </menu>                    
    </submenu>
    <contextual action="run Kiasan" >
        <Title>Sireum Bakar/Run Kiasan</Title>
    </contextual>
      
      <preference name = "sireum-kiasan-array-indices-bound"
                   page = "Sireum Bakar/Kiasan"
                   label = "Array indices bound"
                   type = "integer" 
                   default = "5"
                   />
       <preference name = "sireum-kiasan-loop-bound"
                   page = "Sireum Bakar/Kiasan"
                   label = "Loop bound"
                   type = "integer" 
                   default = "10"
                   />
       <preference name="sireum-kiasan-call-chain-bound"
                   page="Sireum Bakar/Kiasan"
                   label="Call chain bound"
                   type="integer" 
                   default = "10"
                   />
       <preference name="sireum-kiasan-timeout"
                   page="Sireum Bakar/Kiasan"
                   label="Timeout (minutes)"
                   type="integer" 
                   default = "10"
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
       <preference name="sireum-kiasan-always-run-spark-examiner-before-running-kiasan"
                   page="Sireum Bakar/Kiasan"
                   label="Always run Spark Examiner before running Kiasan"
                   type="boolean" 
                   default = "True"
                   />
       <preference name="sireum-kiasan-delete-previous-kiasan-reports-before-re-running"
                   page="Sireum Bakar/Kiasan"
                   label="Delete previous Kiasan reports before re-running"
                   type="boolean" 
                   default = "True"
                   />
       <preference name="sireum-kiasan-warn-if-configuration-not-provided"
                   page="Sireum Bakar/Kiasan"
                   label="Warn in configuration not provided"
                   type="boolean" 
                   default = "True"
                   />
       <preference name="sireum-kiasan-generate-claim-report"
                   page="Sireum Bakar/Kiasan"
                   label="Generate Claim Report"
                   type="boolean" 
                   default = "False"
                   />
       <preference name="sireum-kiasan-generate-html-report"
                   page="Sireum Bakar/Kiasan"
                   label="Generate HTML report"
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
       <preference name="sireum-kiasan-generate-aunit"
                   page="Sireum Bakar/Kiasan"
                   label="Generate AUnit (Experimental)"
                   type="boolean" 
                   default = "False"
                   />
       <preference name="sireum-kiasan-generate-json-output"
                   page="Sireum Bakar/Kiasan"
                   label="Generate JSON Output (Experimental)"
                   type="boolean" 
                   default = "True"
                   />
"""
)
