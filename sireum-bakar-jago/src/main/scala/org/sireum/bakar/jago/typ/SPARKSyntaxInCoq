Require Export ZArith. 
Require Export Coq.Lists.List.
Require Export Coq.Bool.Bool.
Require Export Coq.Strings.String.

(* Module SPARK_Syntax. *)
Inductive mode: Type := 
    | In: mode
    | Out: mode.

Inductive typ: Type := 
    | Tint: typ.

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

Inductive constant: Type := 
	| Ointconst: nat -> constant.

Inductive unary_operation: Type := 
	| Onegint: unary_operation
	| Oposint: unary_operation.

Inductive binary_operation: Type := 
	| Ceq: binary_operation
	| Cge: binary_operation
	| Cgt: binary_operation
	| Cle: binary_operation
	| Clt: binary_operation
	| Cne: binary_operation
	| Oadd: binary_operation
	| Oand: binary_operation
	| Odiv: binary_operation
	| Omul: binary_operation
	| Oor: binary_operation
	| Osub: binary_operation
	| Oxor: binary_operation.

Inductive expr: Type := 
	| Econst: astnum -> constant -> expr
	| Evar: astnum -> idnum -> expr
	| Ebinop: astnum -> binary_operation -> expr -> expr -> expr
	| Eunop: astnum -> unary_operation -> expr -> expr.

Inductive stmt: Type := 
	| Sassign: astnum -> idnum -> expr -> stmt
	| Sifthen: astnum -> expr -> stmt -> stmt
	| Swhile: astnum -> expr -> stmt -> stmt
	| Sseq: astnum -> stmt -> stmt -> stmt
	| Sassert: astnum -> expr -> stmt
	| Sloopinvariant: astnum -> expr -> stmt.

Record param_specification: Type := mkparam_specification{
	param_astnum: astnum;
	param_idents: list idnum;
	param_typenum: typenum;
	param_mode: mode;
	param_init: option (expr)
}.

Record aspect_specification: Type := mkaspect_specification{
	aspect_astnum: astnum;
	aspect_mark: aspectnum;
	aspect_definition: expr
}.

(* Local variables declarations used in the procedure/function body *)
Record local_declaration: Type := mklocal_declaration{
	local_astnum: astnum;
	local_idents: list idnum;
	local_typenum: typenum;
	local_init: option (expr)
}.

Record procedure_body: Type := mkprocedure_body{
	proc_astnum: astnum;
	proc_name: procnum;
	proc_specs: option (list aspect_specification);
	proc_params: option (list param_specification);
	proc_loc_idents: option (list local_declaration);
	proc_body: stmt
}.

Record function_body: Type := mkfunction_body{
	fn_astnum: astnum;
	fn_name: procnum;
	fn_ret_type: typ;
	fn_specs: option (list aspect_specification);
	fn_params: option (list param_specification);
	fn_loc_idents: option (list local_declaration);
	fn_body: stmt
}.

Inductive subprogram: Type := 
	| Sproc: astnum -> procedure_body -> subprogram
	| Sfunc: astnum -> function_body -> subprogram.

Inductive unit_declaration: Type := 
	| UnitDecl: astnum -> subprogram -> unit_declaration.

Inductive compilation_unit: Type := 
	| CompilationUnit: astnum -> unit_declaration -> type_table -> compilation_unit.