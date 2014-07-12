(*******************************************
   Put This Part in language_basics.v
 *******************************************)

Require Export ZArith. 
Require Export Coq.Lists.List.
Require Export Coq.Bool.Bool.

Definition astnum := nat.

Definition idnum := nat.

Definition procnum := nat.

Definition typenum := nat.

Definition typedeclnum := astnum.

Definition aspectnum := nat.

Definition index := Z.

Inductive mode: Type := 
    | In: mode
    | Out: mode
    | In_Out: mode.

Inductive type: Type := 
    | Boolean: type
    | Integer: type
    | Aggregate (t: typenum).

Inductive unary_operator: Type := 
	| Unary_Plus: unary_operator
	| Unary_Minus: unary_operator
	| Not: unary_operator.

Inductive binary_operator: Type := 
	| And: binary_operator
	| Or: binary_operator
	| Equal: binary_operator
	| Not_Equal: binary_operator
	| Less_Than: binary_operator
	| Less_Than_Or_Equal: binary_operator
	| Greater_Than: binary_operator
	| Greater_Than_Or_Equal: binary_operator
	| Plus: binary_operator
	| Minus: binary_operator
	| Multiply: binary_operator
	| Divide: binary_operator.

Inductive literal: Type := 
	| Integer_Literal: Z -> literal
	| Boolean_Literal: bool -> literal.

(*******************************************
   Put This Part in language_template.v
 *******************************************)

Inductive expression_xx: Type := 
	| E_Literal_XX: astnum -> literal (*checks*) -> expression_xx
	| E_Name_XX: astnum -> name_xx (*checks*) -> expression_xx
	| E_Binary_Operation_XX: astnum -> binary_operator -> expression_xx -> expression_xx (*checks*) -> expression_xx
	| E_Unary_Operation_XX: astnum -> unary_operator -> expression_xx (*checks*) -> expression_xx

with name_xx: Type := 
	| E_Identifier_XX: astnum -> idnum (*checks*) -> name_xx
	| E_Indexed_Component_XX: astnum -> astnum -> idnum -> expression_xx (*checks*) -> name_xx
	| E_Selected_Component_XX: astnum -> astnum -> idnum -> idnum (*checks*) -> name_xx.

Inductive statement_xx: Type := 
	| S_Null_XX: statement_xx
	| S_Assignment_XX: astnum -> name_xx -> expression_xx -> statement_xx
	| S_If_XX: astnum -> expression_xx -> statement_xx -> statement_xx -> statement_xx
	| S_While_Loop_XX: astnum -> expression_xx -> statement_xx -> statement_xx
	| S_Procedure_Call_XX: astnum -> astnum -> procnum -> list expression_xx -> statement_xx
	| S_Sequence_XX: astnum -> statement_xx -> statement_xx -> statement_xx.

Inductive type_declaration_xx: Type := 
	| Array_Type_Declaration_XX: astnum -> typenum -> type -> Z -> Z -> type_declaration_xx
	| Record_Type_Declaration_XX: astnum -> typenum -> list (idnum * type) -> type_declaration_xx.

Record object_declaration_xx: Type := mkobject_declaration_xx{
	declaration_astnum_xx: astnum;
	object_name_xx: idnum;
	object_nominal_subtype_xx: type;
	initialization_expression_xx: option (expression_xx)
}.

Record parameter_specification_xx: Type := mkparameter_specification_xx{
	parameter_astnum_xx: astnum;
	parameter_name_xx: idnum;
	parameter_subtype_mark_xx: type;
	parameter_mode_xx: mode
}.

Record aspect_specification_xx: Type := mkaspect_specification_xx{
	aspect_astnum_xx: astnum;
	aspect_mark_xx: aspectnum;
	aspect_definition_xx: expression_xx
}.

Inductive declaration_xx: Type := 
	| D_Null_Declaration_XX: declaration_xx
	| D_Type_Declaration_XX: astnum -> type_declaration_xx -> declaration_xx
	| D_Object_Declaration_XX: astnum -> object_declaration_xx -> declaration_xx
	| D_Procedure_Declaration_XX: astnum -> procedure_declaration_xx -> declaration_xx
	| D_Seq_Declaration_XX: astnum -> declaration_xx -> declaration_xx -> declaration_xx

with procedure_declaration_xx: Type := 
  mkprocedure_declaration_xx
	(procedure_astnum_xx: astnum)
	(procedure_name_xx: procnum)
	(procedure_parameter_profile_xx: list parameter_specification_xx)
	(procedure_contracts_xx: list aspect_specification_xx)
	(procedure_declarative_part_xx: declaration_xx)
	(procedure_statements_xx: statement_xx).

Inductive subprogram_xx: Type := 
	| Global_Procedure_XX: astnum -> procedure_declaration_xx -> subprogram_xx.

Inductive library_unit_declaration_xx: Type := 
	| Library_Subprogram_XX: astnum -> subprogram_xx -> library_unit_declaration_xx.

Inductive compilation_unit_xx: Type := 
	| Library_Unit_XX: astnum -> library_unit_declaration_xx -> compilation_unit_xx.