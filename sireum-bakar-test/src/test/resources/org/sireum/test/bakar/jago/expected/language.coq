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

Definition index := Z.

Inductive mode: Type := 
    | In: mode
    | Out: mode
    | In_Out: mode.

Inductive type: Type := 
    | Boolean
    | Integer
    | Subtype (t: typenum)
    | Derived_Type (t: typenum)
    | Integer_Type (t: typenum)
    | Array_Type (t: typenum)  (* t: declared array type name *)
    | Record_Type (t: typenum) (* t: declared record type name *).

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

Inductive range_xx: Type := 
	| Range_XX: Z -> Z -> range_xx.

Inductive type_declaration_xx: Type := 
	| Derived_Type_Declaration_XX: astnum -> typenum -> type -> range_xx -> type_declaration_xx
	| Integer_Type_Declaration_XX: astnum -> typenum -> range_xx -> type_declaration_xx
	| Array_Type_Declaration_XX: astnum -> typenum -> type -> type -> type_declaration_xx
	| Record_Type_Declaration_XX: astnum -> typenum -> list (idnum * type) -> type_declaration_xx
	| Subtype_Declaration_XX: astnum -> typenum -> type -> range_xx -> type_declaration_xx.

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

Inductive declaration_xx: Type := 
	| D_Null_Declaration_XX: declaration_xx
	| D_Type_Declaration_XX: astnum -> type_declaration_xx -> declaration_xx
	| D_Object_Declaration_XX: astnum -> object_declaration_xx -> declaration_xx
	| D_Procedure_Body_XX: astnum -> procedure_body_xx -> declaration_xx
	| D_Seq_Declaration_XX: astnum -> declaration_xx -> declaration_xx -> declaration_xx

with procedure_body_xx: Type := 
  mkprocedure_body_xx
	(procedure_astnum_xx: astnum)
	(procedure_name_xx: procnum)
	(procedure_parameter_profile_xx: list parameter_specification_xx)
	(procedure_declarative_part_xx: declaration_xx)
	(procedure_statements_xx: statement_xx).