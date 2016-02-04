Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Factorial*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*N*) 2) Integer In) :: 
    (mkparameter_specification 4 ((*M*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 5
  (D_Object_Declaration 7 (mkobject_declaration 8 ((*Result*) 5) Integer (Some ((E_Literal 6 (Integer_Literal 1) ))))) 
  (D_Object_Declaration 9 (mkobject_declaration 10 ((*T*) 6) Integer None))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 11
      (S_Assignment 12 (E_Identifier 13 ((*T*) 6) ) (E_Name 14 (E_Identifier 15 ((*N*) 2) ))) 
      (S_Sequence 16
      (S_While_Loop 17 (E_Binary_Operation 18 Greater_Than (E_Name 19 (E_Identifier 20 ((*T*) 6) )) (E_Literal 21 (Integer_Literal 0) ) )
        (S_Sequence 22
        (S_Assignment 23 (E_Identifier 24 ((*Result*) 5) ) (E_Binary_Operation 25 Multiply (E_Name 26 (E_Identifier 27 ((*Result*) 5) )) (E_Name 28 (E_Identifier 29 ((*T*) 6) )) )) 
        (S_Assignment 30 (E_Identifier 31 ((*T*) 6) ) (E_Binary_Operation 32 Minus (E_Name 33 (E_Identifier 34 ((*T*) 6) )) (E_Literal 35 (Integer_Literal 1) ) )))
      ) 
      (S_Assignment 36 (E_Identifier 37 ((*M*) 3) ) (E_Name 38 (E_Identifier 39 ((*Result*) 5) )))))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*N*) 2), (In, Integer)) :: (((*Result*) 5), (In_Out, Integer)) :: (((*M*) 3), (Out, Integer)) :: (((*T*) 6), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Factorial*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Factorial*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*N*) 2) Integer In) :: 
  (mkparameter_specification 4 ((*M*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 5
(D_Object_Declaration 7 (mkobject_declaration 8 ((*Result*) 5) Integer (Some ((E_Literal 6 (Integer_Literal 1) ))))) 
(D_Object_Declaration 9 (mkobject_declaration 10 ((*T*) 6) Integer None))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 11
    (S_Assignment 12 (E_Identifier 13 ((*T*) 6) ) (E_Name 14 (E_Identifier 15 ((*N*) 2) ))) 
    (S_Sequence 16
    (S_While_Loop 17 (E_Binary_Operation 18 Greater_Than (E_Name 19 (E_Identifier 20 ((*T*) 6) )) (E_Literal 21 (Integer_Literal 0) ) )
      (S_Sequence 22
      (S_Assignment 23 (E_Identifier 24 ((*Result*) 5) ) (E_Binary_Operation 25 Multiply (E_Name 26 (E_Identifier 27 ((*Result*) 5) )) (E_Name 28 (E_Identifier 29 ((*T*) 6) )) )) 
      (S_Assignment 30 (E_Identifier 31 ((*T*) 6) ) (E_Binary_Operation 32 Minus (E_Name 33 (E_Identifier 34 ((*T*) 6) )) (E_Literal 35 (Integer_Literal 1) ) )))
    ) 
    (S_Assignment 36 (E_Identifier 37 ((*M*) 3) ) (E_Name 38 (E_Identifier 39 ((*Result*) 5) )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (14, Integer) :: (13, Integer) :: (31, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Boolean) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (33, Integer) :: (6, Integer) :: (15, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)16)) :: (35, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (26, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (38, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (29, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (20, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (14, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (13, (sloc (*Line*)7 (*Col*)4 (*EndLine*)7 (*EndCol*)4)) :: (31, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (34, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (25, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)26)) :: (37, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)4)) :: (19, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (28, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (18, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)14)) :: (27, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (21, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (39, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (33, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (6, (sloc (*Line*)3 (*Col*)23 (*EndLine*)3 (*EndCol*)23)) :: (15, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (24, (sloc (*Line*)9 (*Col*)7 (*EndLine*)9 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("N", "ada://parameter/Factorial+1:11/N+1:22")) :: (5, ("Result", "ada://variable/Factorial+1:11/Result+3:4")) :: (3, ("M", "ada://parameter/Factorial+1:11/M+1:35")) :: (6, ("T", "ada://variable/Factorial+1:11/T+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Factorial", "ada://procedure_body/Factorial+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Factorial*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*N*) 2) Integer In) :: 
    (mkparameter_specification_x 4 ((*M*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 5
  (D_Object_Declaration_X 7 (mkobject_declaration_x 8 ((*Result*) 5) Integer (Some ((E_Literal_X 6 (Integer_Literal 1) (nil) nil))))) 
  (D_Object_Declaration_X 9 (mkobject_declaration_x 10 ((*T*) 6) Integer None))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 11
      (S_Assignment_X 12 (E_Identifier_X 13 ((*T*) 6) (nil)) (E_Name_X 14 (E_Identifier_X 15 ((*N*) 2) (nil)))) 
      (S_Sequence_X 16
      (S_While_Loop_X 17 (E_Binary_Operation_X 18 Greater_Than (E_Name_X 19 (E_Identifier_X 20 ((*T*) 6) (nil))) (E_Literal_X 21 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Sequence_X 22
        (S_Assignment_X 23 (E_Identifier_X 24 ((*Result*) 5) (nil)) (E_Binary_Operation_X 25 Multiply (E_Name_X 26 (E_Identifier_X 27 ((*Result*) 5) (nil))) (E_Name_X 28 (E_Identifier_X 29 ((*T*) 6) (nil))) (Do_Overflow_Check :: nil) nil)) 
        (S_Assignment_X 30 (E_Identifier_X 31 ((*T*) 6) (nil)) (E_Binary_Operation_X 32 Minus (E_Name_X 33 (E_Identifier_X 34 ((*T*) 6) (nil))) (E_Literal_X 35 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
      ) 
      (S_Assignment_X 36 (E_Identifier_X 37 ((*M*) 3) (nil)) (E_Name_X 38 (E_Identifier_X 39 ((*Result*) 5) (nil))))))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*N*) 2), (In, Integer)) :: (((*Result*) 5), (In_Out, Integer)) :: (((*M*) 3), (Out, Integer)) :: (((*T*) 6), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Factorial*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Factorial*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*N*) 2) Integer In) :: 
  (mkparameter_specification_x 4 ((*M*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 5
(D_Object_Declaration_X 7 (mkobject_declaration_x 8 ((*Result*) 5) Integer (Some ((E_Literal_X 6 (Integer_Literal 1) (nil) nil))))) 
(D_Object_Declaration_X 9 (mkobject_declaration_x 10 ((*T*) 6) Integer None))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 11
    (S_Assignment_X 12 (E_Identifier_X 13 ((*T*) 6) (nil)) (E_Name_X 14 (E_Identifier_X 15 ((*N*) 2) (nil)))) 
    (S_Sequence_X 16
    (S_While_Loop_X 17 (E_Binary_Operation_X 18 Greater_Than (E_Name_X 19 (E_Identifier_X 20 ((*T*) 6) (nil))) (E_Literal_X 21 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Sequence_X 22
      (S_Assignment_X 23 (E_Identifier_X 24 ((*Result*) 5) (nil)) (E_Binary_Operation_X 25 Multiply (E_Name_X 26 (E_Identifier_X 27 ((*Result*) 5) (nil))) (E_Name_X 28 (E_Identifier_X 29 ((*T*) 6) (nil))) (Do_Overflow_Check :: nil) nil)) 
      (S_Assignment_X 30 (E_Identifier_X 31 ((*T*) 6) (nil)) (E_Binary_Operation_X 32 Minus (E_Name_X 33 (E_Identifier_X 34 ((*T*) 6) (nil))) (E_Literal_X 35 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
    ) 
    (S_Assignment_X 36 (E_Identifier_X 37 ((*M*) 3) (nil)) (E_Name_X 38 (E_Identifier_X 39 ((*Result*) 5) (nil))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (14, Integer) :: (13, Integer) :: (31, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Boolean) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (33, Integer) :: (6, Integer) :: (15, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)16)) :: (35, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (26, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (38, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (29, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (20, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (14, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (13, (sloc (*Line*)7 (*Col*)4 (*EndLine*)7 (*EndCol*)4)) :: (31, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (34, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (25, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)26)) :: (37, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)4)) :: (19, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (28, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (18, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)14)) :: (27, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (21, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (39, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (33, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (6, (sloc (*Line*)3 (*Col*)23 (*EndLine*)3 (*EndCol*)23)) :: (15, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (24, (sloc (*Line*)9 (*Col*)7 (*EndLine*)9 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("N", "ada://parameter/Factorial+1:11/N+1:22")) :: (5, ("Result", "ada://variable/Factorial+1:11/Result+3:4")) :: (3, ("M", "ada://parameter/Factorial+1:11/M+1:35")) :: (6, ("T", "ada://variable/Factorial+1:11/T+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Factorial", "ada://procedure_body/Factorial+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).
