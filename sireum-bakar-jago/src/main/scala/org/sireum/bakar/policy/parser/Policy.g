grammar Policy;

@header {
package org.sireum.bakar.policy.parser;
}

@lexer::header {
package org.sireum.bakar.policy.parser;
}

start
	: domain_definition
	  domain_bindings
	  declassifiers
	;

domain_definition
	: 'type' ID 'is' enumerated_values 'with' ordering ';'
	;
	
enumerated_values
	: '(' 
	      ID (',' ID)* 
	  ')'
	;
	
ordering
	: 'Ordered' ('=>' (('{' ID '<=' ID (',' ID '<=' ID)* '}') | 'null'))?
	;
	
domain_bindings
	: (domain_binding)*
	;
	
domain_binding
	: ID ':' ID 'with' 'Domain' '=>' ID (':=' value)? ';'
	;

declassifiers
	: (declassifier)*
	;
	
declassifier
	: 'procedure' ID '(' params ')' 'with' 
	  'Declassifier' ',' 
	  'Domain' '=>' domain_def
	;
	  
params
	: ID ':' (access_mode)? ID (';' ID ':' (access_mode)? ID)*
	;
	
access_mode
	: 'in' | 'out' | 'in' 'out'
	;

domain_def
	: '('  
	      ID '=>' ID (',' ID '=>' ID )*
	  ')'
	;

value
	: NUM_INT | ID
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