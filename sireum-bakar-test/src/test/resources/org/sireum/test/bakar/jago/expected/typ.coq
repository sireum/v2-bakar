Require Export ZArith. 
Require Export Coq.Lists.List.
Require Export Coq.Bool.Bool.
Require Export Coq.Strings.String.

Definition astnum := nat.

Definition idnum := nat.

Definition procnum := nat.

Definition typenum := nat.

Definition typedeclnum := astnum.

Definition aspectnum := nat.

Definition typeuri := string.

Record type_table: Type := mktype_table{
    tt_exptype_table: list (astnum * typenum);
    tt_typename_table: list (typenum * (typeuri * option typedeclnum))
}.

Inductive literal: Type := 
	| Integer_Literal: Z -> literal
	| Boolean_Literal: bool -> literal.

Inductive unary_operator: Type := 
	| Not: unary_operator
	| Unary_Minus: unary_operator
	| Unary_Plus: unary_operator.

Inductive binary_operator: Type := 
	| And: binary_operator
	| Divide: binary_operator
	| Equal: binary_operator
	| Greater_Than: binary_operator
	| Greater_Than_Or_Equal: binary_operator
	| Less_Than: binary_operator
	| Less_Than_Or_Equal: binary_operator
	| Minus: binary_operator
	| Multiply: binary_operator
	| Not_Equal: binary_operator
	| Or: binary_operator
	| Plus: binary_operator.

Inductive type: Type := 
    | Boolean: type
    | Integer: type.

Inductive expression: Type := 
	| E_Literal: astnum -> literal -> expression
	| E_Identifier: astnum -> idnum -> expression
	| E_Binary_Operation: astnum -> binary_operator -> expression -> expression -> expression
	| E_Unary_Operation: astnum -> unary_operator -> expression -> expression.

Inductive statement: Type := 
	| S_Assignment: astnum -> idnum -> expression -> statement
	| S_If: astnum -> expression -> statement -> statement
	| S_While_Loop: astnum -> expression -> statement -> statement
	| S_Sequence: astnum -> statement -> statement -> statement
	| S_Return: astnum -> option (expression) -> statement
	| S_Assert: astnum -> expression -> statement
	| S_Loop_Invariant: astnum -> expression -> statement.

Inductive mode: Type := 
    | In: mode
    | Out: mode
    | In_Out: mode.

(* variables declarations in procedure/function *)
Record object_declaration: Type := mkobject_declaration{
	declaration_astnum: astnum;
	object_name: idnum;
	object_nominal_subtype: typenum;
	initialization_expression: option (expression)
}.

Record parameter_specification: Type := mkparameter_specification{
	parameter_astnum: astnum;
	parameter_name: idnum;
	parameter_subtype_mark: typenum;
	parameter_mode: mode;
	parameter_default_expression: option (expression)
}.

Record aspect_specification: Type := mkaspect_specification{
	aspect_astnum: astnum;
	aspect_mark: aspectnum;
	aspect_definition: expression
}.

Record procedure_body: Type := mkprocedure_body{
	procedure_astnum: astnum;
	procedure_name: procnum;
	procedure_contracts: list aspect_specification;
	procedure_parameter_profile: list parameter_specification;
	procedure_declarative_part: list object_declaration;
	procedure_statements: statement
}.

Record function_body: Type := mkfunction_body{
	function_astnum: astnum;
	function_name: procnum;
	function_result_subtype: type;
	function_contracts: list aspect_specification;
	function_parameter_profile: list parameter_specification;
	function_declarative_part: list object_declaration;
	function_statements: statement
}.

Inductive subprogram: Type := 
	| Procedure: astnum -> procedure_body -> subprogram
	| Function: astnum -> function_body -> subprogram.

Inductive library_unit_declaration: Type := 
	| Library_Subprogram: astnum -> subprogram -> library_unit_declaration.

Inductive compilation_unit: Type := 
	| Library_Unit: astnum -> library_unit_declaration -> type_table -> compilation_unit.