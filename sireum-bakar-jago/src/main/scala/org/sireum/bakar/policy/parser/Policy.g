grammar Policy;

@header {
package org.sireum.bakar.policy.parser;
import java.util.ArrayList;
import java.util.HashMap;
}

@lexer::header {
package org.sireum.bakar.policy.parser;
import java.util.ArrayList;
import java.util.HashMap;
}

start	returns [T_Policy result = new T_Policy()]
	: d=domain_definition
	  b=domain_bindings
	  f=declassifiers
	  {result.set_domains($d.result);
	   result.set_domain_bindings($b.result);
	   result.set_declassifiers($f.result);}
	;

domain_definition	returns [T_Domain result = new T_Domain()]
	: 'type' ID 'is' v=enumerated_values 'with' o=ordering ';'
	  {result.set_domains($v.result); result.set_domain_ordering($o.result);}
	;
	
enumerated_values	returns [ArrayList<String> result = new ArrayList<String>()]
	: '(' 
	      id1=ID {result.add($id1.text);}
	      (',' id2=ID {result.add($id2.text);})* 
	  ')'
	;
	
ordering	returns [HashMap<String, String> result = new HashMap<String, String>()]
@init{ boolean b = true; }
	: 'Ordered' ('=>' (('{' id1=ID '<=' id2=ID {result.put($id1.text, $id2.text); b = false;}
		           (',' id3=ID '<=' id4=ID {result.put($id3.text, $id4.text);})* '}') | 
		            'null' {b = false;}))?
	  {if(b == true)
	     result.put("default", "true");
	  }
	;
	
domain_bindings	returns [HashMap<String, String> result = new HashMap<String, String>()]
	: (d=domain_binding {result.put($d.result.getFirst(), $d.result.getSecond());})*
	;
	
domain_binding	returns [T_Pair<String, String> result = new T_Pair<String, String>()]
	: id1=ID ':' ID 'with' 'Domain' '=>' id2=ID (':=' value)? ';'
	  {result.setFirst($id1.text); result.setSecond($id2.text);}
	;

declassifiers	returns [HashMap<String, T_Declassifier> result = new HashMap<String, T_Declassifier>()]
	: (d=declassifier {result.put($d.result.get_name(), $d.result);})*
	;
	
declassifier	returns [T_Declassifier result = new T_Declassifier()]
	: 'procedure' id=ID '(' p=params ')' 'with' 
	  'Declassifier' ',' 
	  'Domain' '=>' d=domain_def ';'
	  {result.set_name($id.text); 
	   result.set_params((ArrayList<String>)($p.result.getFirst())); 
	   result.set_param_mode((HashMap<String, String>)($p.result.getSecond()));
	   result.set_param_types($d.result);}
	;
	  
params	returns [T_Pair result = new T_Pair<ArrayList<String>, HashMap<String, String>>()]
@init {
ArrayList<String> params = new ArrayList<String>();
HashMap<String, String> param_mode = new HashMap<String, String>();
String mode = "in";
}
	: id1=ID ':' (m1=access_mode {mode = $m1.result;})? ID 
	  {params.add($id1.text); param_mode.put($id1.text, mode);}
	  (';' id2=ID ':' {mode = "in";}(m2=access_mode {mode = $m2.result;})? ID 
	  {params.add($id2.text); param_mode.put($id2.text, mode);})*
	  {result.setFirst(params); result.setSecond(param_mode);}
	;
	
access_mode	returns [String result = null]
	: 'in' {result="in";} | 
	  'out' {result="out";} | 
	  'in' 'out' {result="inout";}
	;

domain_def	returns [HashMap<String, String> result = new HashMap<String, String>()]
	: '('  
	      id1=ID '=>' id2=ID {result.put($id1.text, $id2.text);}
	      (',' id3=ID '=>' id4=ID {result.put($id3.text, $id4.text);})*
	  ')'
	;

value	returns [String result = null]
	: n=NUM_INT {result = $n.text;} | id=ID {result = $id.text;}
	;

NUM_INT
	: ('0' | ('1'..'9') ('0'..'9')*)
	;

ID  : ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

COMMENT : ( '--' (~('\n'|'\r'))* ('\n'|'\r'('\n')?) ){$channel=HIDDEN;}	
	;

// Whitespace -- ignored
WS	: (' '|'\r'|'\t'|'\u000C'|'\n') { $channel=HIDDEN;}
	; 