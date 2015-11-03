Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Procedure_Body 2 
  (mkprocedure_body 3
    (* = = = Procedure Name = = = *)
    ((*Q*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 4 ((*X*) 3) Integer In) :: 
    (mkparameter_specification 5 ((*Z*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 6 (E_Identifier 7 ((*Z*) 4) ) (E_Binary_Operation 8 Plus (E_Name 9 (E_Identifier 10 ((*X*) 3) )) (E_Literal 11 (Integer_Literal 2) ) ))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 3), (In, Integer)) :: (((*Z*) 4), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 1), (0, (mkprocedure_body 3
  (* = = = Procedure Name = = = *)
  ((*Q*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 4 ((*X*) 3) Integer In) :: 
  (mkparameter_specification 5 ((*Z*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 6 (E_Identifier 7 ((*Z*) 4) ) (E_Binary_Operation 8 Plus (E_Name 9 (E_Identifier 10 ((*X*) 3) )) (E_Literal 11 (Integer_Literal 2) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((8, Integer) :: (11, Integer) :: (7, Integer) :: (10, Integer) :: (9, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((8, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)15)) :: (11, (sloc (*Line*)5 (*Col*)15 (*EndLine*)5 (*EndCol*)15)) :: (7, (sloc (*Line*)5 (*Col*)6 (*EndLine*)5 (*EndCol*)6)) :: (10, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: (9, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((4, ("Z", "ada://parameter/PackageDemo_A-1:9/Q-2:13/Z-2:30")) :: (3, ("X", "ada://parameter/PackageDemo_A-1:9/Q-2:13/X-2:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Q", "ada://procedure_body/PackageDemo_A-1:9/Q-2:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("PackageDemo_A", "ada://package_body/PackageDemo_A-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Procedure_Body_X 2 
  (mkprocedure_body_x 3
    (* = = = Procedure Name = = = *)
    ((*Q*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 4 ((*X*) 3) Integer In) :: 
    (mkparameter_specification_x 5 ((*Z*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 6 (E_Identifier_X 7 ((*Z*) 4) (nil)) (E_Binary_Operation_X 8 Plus (E_Name_X 9 (E_Identifier_X 10 ((*X*) 3) (nil))) (E_Literal_X 11 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 3), (In, Integer)) :: (((*Z*) 4), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 1), (0, (mkprocedure_body_x 3
  (* = = = Procedure Name = = = *)
  ((*Q*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 4 ((*X*) 3) Integer In) :: 
  (mkparameter_specification_x 5 ((*Z*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 6 (E_Identifier_X 7 ((*Z*) 4) (nil)) (E_Binary_Operation_X 8 Plus (E_Name_X 9 (E_Identifier_X 10 ((*X*) 3) (nil))) (E_Literal_X 11 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((8, Integer) :: (11, Integer) :: (7, Integer) :: (10, Integer) :: (9, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((8, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)15)) :: (11, (sloc (*Line*)5 (*Col*)15 (*EndLine*)5 (*EndCol*)15)) :: (7, (sloc (*Line*)5 (*Col*)6 (*EndLine*)5 (*EndCol*)6)) :: (10, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: (9, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((4, ("Z", "ada://parameter/PackageDemo_A-1:9/Q-2:13/Z-2:30")) :: (3, ("X", "ada://parameter/PackageDemo_A-1:9/Q-2:13/X-2:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Q", "ada://procedure_body/PackageDemo_A-1:9/Q-2:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("PackageDemo_A", "ada://package_body/PackageDemo_A-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

