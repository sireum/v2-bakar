Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Array_Subtype_Index*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 4
  (D_Type_Declaration 5 (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) 
  (D_Seq_Declaration 7
  (D_Type_Declaration 8 (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
  (D_Seq_Declaration 10
  (D_Type_Declaration 11 (Array_Type_Declaration 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (D_Object_Declaration 13 (mkobject_declaration 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 15
      (S_Assignment 16 (E_Indexed_Component 17 (E_Identifier 18 ((*A*) 6) ) (E_Literal 19 (Integer_Literal 0) ) ) (E_Literal 20 (Integer_Literal 0) )) 
      (S_Assignment 21 (E_Identifier 22 ((*I*) 2) ) (E_Binary_Operation 23 Plus (E_Name 24 (E_Identifier 25 ((*I*) 2) )) (E_Literal 26 (Integer_Literal 1) ) )))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 2), (In_Out, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Array_Subtype_Index*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Array_Subtype_Index*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 4
(D_Type_Declaration 5 (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) 
(D_Seq_Declaration 7
(D_Type_Declaration 8 (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
(D_Seq_Declaration 10
(D_Type_Declaration 11 (Array_Type_Declaration 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(D_Object_Declaration 13 (mkobject_declaration 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 15
    (S_Assignment 16 (E_Indexed_Component 17 (E_Identifier 18 ((*A*) 6) ) (E_Literal 19 (Integer_Literal 0) ) ) (E_Literal 20 (Integer_Literal 0) )) 
    (S_Assignment 21 (E_Identifier 22 ((*I*) 2) ) (E_Binary_Operation 23 Plus (E_Name 24 (E_Identifier 25 ((*I*) 2) )) (E_Literal 26 (Integer_Literal 1) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 5), (Array_Type_Declaration 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*U*) 4), (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) :: (((*T*) 3), (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (26, Integer) :: (17, Integer) :: (20, Integer) :: (22, Integer) :: (25, Integer) :: (19, Integer) :: (18, (Array_Type ((*Ar*) 5))) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)13)) :: (26, (sloc (*Line*)11 (*Col*)13 (*EndLine*)11 (*EndCol*)13)) :: (17, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)7)) :: (20, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (22, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)4)) :: (25, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: (19, (sloc (*Line*)10 (*Col*)6 (*EndLine*)10 (*EndCol*)6)) :: (18, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)4)) :: (24, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Array_Subtype_Index+1:11/I+1:32")) :: (6, ("A", "ada://variable/Array_Subtype_Index+1:11/A+8:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Array_Subtype_Index", "ada://procedure_body/Array_Subtype_Index+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Ar", "ada://ordinary_type/Array_Subtype_Index+1:11/Ar+6:9")) :: (4, ("U", "ada://subtype/Array_Subtype_Index+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Array_Subtype_Index+1:11/T+3:9")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Array_Subtype_Index*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 4
  (D_Type_Declaration_X 5 (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) 
  (D_Seq_Declaration_X 7
  (D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) 
  (D_Seq_Declaration_X 10
  (D_Type_Declaration_X 11 (Array_Type_Declaration_X 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 15
      (S_Assignment_X 16 (E_Indexed_Component_X 17 (E_Identifier_X 18 ((*A*) 6) (nil)) (E_Literal_X 19 (Integer_Literal 0) (nil) nil) (nil)) (E_Literal_X 20 (Integer_Literal 0) (nil) nil)) 
      (S_Assignment_X 21 (E_Identifier_X 22 ((*I*) 2) (nil)) (E_Binary_Operation_X 23 Plus (E_Name_X 24 (E_Identifier_X 25 ((*I*) 2) (nil))) (E_Literal_X 26 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 2), (In_Out, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Array_Subtype_Index*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Array_Subtype_Index*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 4
(D_Type_Declaration_X 5 (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) 
(D_Seq_Declaration_X 7
(D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) 
(D_Seq_Declaration_X 10
(D_Type_Declaration_X 11 (Array_Type_Declaration_X 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 15
    (S_Assignment_X 16 (E_Indexed_Component_X 17 (E_Identifier_X 18 ((*A*) 6) (nil)) (E_Literal_X 19 (Integer_Literal 0) (nil) nil) (nil)) (E_Literal_X 20 (Integer_Literal 0) (nil) nil)) 
    (S_Assignment_X 21 (E_Identifier_X 22 ((*I*) 2) (nil)) (E_Binary_Operation_X 23 Plus (E_Name_X 24 (E_Identifier_X 25 ((*I*) 2) (nil))) (E_Literal_X 26 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 5), (Array_Type_Declaration_X 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*U*) 4), (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) :: (((*T*) 3), (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (26, Integer) :: (17, Integer) :: (20, Integer) :: (22, Integer) :: (25, Integer) :: (19, Integer) :: (18, (Array_Type ((*Ar*) 5))) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)13)) :: (26, (sloc (*Line*)11 (*Col*)13 (*EndLine*)11 (*EndCol*)13)) :: (17, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)7)) :: (20, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (22, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)4)) :: (25, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: (19, (sloc (*Line*)10 (*Col*)6 (*EndLine*)10 (*EndCol*)6)) :: (18, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)4)) :: (24, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Array_Subtype_Index+1:11/I+1:32")) :: (6, ("A", "ada://variable/Array_Subtype_Index+1:11/A+8:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Array_Subtype_Index", "ada://procedure_body/Array_Subtype_Index+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Ar", "ada://ordinary_type/Array_Subtype_Index+1:11/Ar+6:9")) :: (4, ("U", "ada://subtype/Array_Subtype_Index+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Array_Subtype_Index+1:11/T+3:9")) :: nil)
))
).

