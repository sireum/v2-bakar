Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Assign_Subtype_Var*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 4
  (D_Type_Declaration 5 (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) 
  (D_Seq_Declaration 7
  (D_Type_Declaration 8 (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
  (D_Object_Declaration 10 (mkobject_declaration 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 12
      (S_Assignment 13 (E_Identifier 14 ((*Left*) 5) ) (E_Literal 15 (Integer_Literal 0) )) 
      (S_Assignment 16 (E_Identifier 17 ((*I*) 2) ) (E_Binary_Operation 18 Plus (E_Name 19 (E_Identifier 20 ((*I*) 2) )) (E_Literal 21 (Integer_Literal 1) ) )))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 2), (In_Out, Integer)) :: (((*Left*) 5), (In_Out, (Subtype ((*U*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Assign_Subtype_Var*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Assign_Subtype_Var*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 4
(D_Type_Declaration 5 (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) 
(D_Seq_Declaration 7
(D_Type_Declaration 8 (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
(D_Object_Declaration 10 (mkobject_declaration 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 12
    (S_Assignment 13 (E_Identifier 14 ((*Left*) 5) ) (E_Literal 15 (Integer_Literal 0) )) 
    (S_Assignment 16 (E_Identifier 17 ((*I*) 2) ) (E_Binary_Operation 18 Plus (E_Name 19 (E_Identifier 20 ((*I*) 2) )) (E_Literal 21 (Integer_Literal 1) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*U*) 4), (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) :: (((*T*) 3), (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (20, Integer) :: (14, (Subtype ((*U*) 4))) :: (19, Integer) :: (18, Integer) :: (21, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (20, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (14, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (21, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (15, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Assign_Subtype_Var+1:11/I+1:31")) :: (5, ("Left", "ada://variable/Assign_Subtype_Var+1:11/Left+5:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Assign_Subtype_Var", "ada://procedure_body/Assign_Subtype_Var+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("U", "ada://subtype/Assign_Subtype_Var+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Assign_Subtype_Var+1:11/T+3:9")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Assign_Subtype_Var*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 4
  (D_Type_Declaration_X 5 (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) 
  (D_Seq_Declaration_X 7
  (D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) 
  (D_Object_Declaration_X 10 (mkobject_declaration_x 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 12
      (S_Assignment_X 13 (E_Identifier_X 14 ((*Left*) 5) (nil)) (E_Literal_X 15 (Integer_Literal 0) (nil) nil)) 
      (S_Assignment_X 16 (E_Identifier_X 17 ((*I*) 2) (nil)) (E_Binary_Operation_X 18 Plus (E_Name_X 19 (E_Identifier_X 20 ((*I*) 2) (nil))) (E_Literal_X 21 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 2), (In_Out, Integer)) :: (((*Left*) 5), (In_Out, (Subtype ((*U*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Assign_Subtype_Var*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Assign_Subtype_Var*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 4
(D_Type_Declaration_X 5 (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) 
(D_Seq_Declaration_X 7
(D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) 
(D_Object_Declaration_X 10 (mkobject_declaration_x 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 12
    (S_Assignment_X 13 (E_Identifier_X 14 ((*Left*) 5) (nil)) (E_Literal_X 15 (Integer_Literal 0) (nil) nil)) 
    (S_Assignment_X 16 (E_Identifier_X 17 ((*I*) 2) (nil)) (E_Binary_Operation_X 18 Plus (E_Name_X 19 (E_Identifier_X 20 ((*I*) 2) (nil))) (E_Literal_X 21 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*U*) 4), (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) :: (((*T*) 3), (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (20, Integer) :: (14, (Subtype ((*U*) 4))) :: (19, Integer) :: (18, Integer) :: (21, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (20, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (14, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (21, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (15, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Assign_Subtype_Var+1:11/I+1:31")) :: (5, ("Left", "ada://variable/Assign_Subtype_Var+1:11/Left+5:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Assign_Subtype_Var", "ada://procedure_body/Assign_Subtype_Var+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("U", "ada://subtype/Assign_Subtype_Var+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Assign_Subtype_Var+1:11/T+3:9")) :: nil)
))
).

