Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Gcd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*M*) 2) Integer In) :: 
    (mkparameter_specification 4 ((*N*) 3) Integer In) :: 
    (mkparameter_specification 5 ((*Y*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 6
  (D_Object_Declaration 7 (mkobject_declaration 8 ((*C*) 5) Integer None)) 
  (D_Seq_Declaration 9
  (D_Object_Declaration 10 (mkobject_declaration 11 ((*D*) 6) Integer None)) 
  (D_Seq_Declaration 12
  (D_Object_Declaration 13 (mkobject_declaration 14 ((*T*) 7) Integer None)) 
  (D_Object_Declaration 15 (mkobject_declaration 16 ((*R*) 8) Integer None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 17
      (S_Assignment 18 (E_Identifier 19 ((*C*) 5) ) (E_Name 20 (E_Identifier 21 ((*M*) 2) ))) 
      (S_Sequence 22
      (S_Assignment 23 (E_Identifier 24 ((*D*) 6) ) (E_Name 25 (E_Identifier 26 ((*N*) 3) ))) 
      (S_Sequence 27
      (S_While_Loop 28 (E_Binary_Operation 29 Not_Equal (E_Name 30 (E_Identifier 31 ((*D*) 6) )) (E_Literal 32 (Integer_Literal 0) ) )
        (S_Sequence 33
        (S_Assignment 34 (E_Identifier 35 ((*T*) 7) ) (E_Binary_Operation 36 Divide (E_Name 37 (E_Identifier 38 ((*C*) 5) )) (E_Name 39 (E_Identifier 40 ((*D*) 6) )) )) 
        (S_Sequence 41
        (S_Assignment 42 (E_Identifier 43 ((*R*) 8) ) (E_Binary_Operation 44 Minus (E_Name 45 (E_Identifier 46 ((*C*) 5) )) (E_Binary_Operation 47 Multiply (E_Name 48 (E_Identifier 49 ((*T*) 7) )) (E_Name 50 (E_Identifier 51 ((*D*) 6) )) ) )) 
        (S_Sequence 52
        (S_Assignment 53 (E_Identifier 54 ((*C*) 5) ) (E_Name 55 (E_Identifier 56 ((*D*) 6) ))) 
        (S_Assignment 57 (E_Identifier 58 ((*D*) 6) ) (E_Name 59 (E_Identifier 60 ((*R*) 8) ))))))
      ) 
      (S_Assignment 61 (E_Identifier 62 ((*Y*) 4) ) (E_Name 63 (E_Identifier 64 ((*C*) 5) ))))))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*C*) 5), (In_Out, Integer)) :: (((*M*) 2), (In, Integer)) :: (((*T*) 7), (In_Out, Integer)) :: (((*Y*) 4), (Out, Integer)) :: (((*R*) 8), (In_Out, Integer)) :: (((*D*) 6), (In_Out, Integer)) :: (((*N*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Gcd*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Gcd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*M*) 2) Integer In) :: 
  (mkparameter_specification 4 ((*N*) 3) Integer In) :: 
  (mkparameter_specification 5 ((*Y*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 6
(D_Object_Declaration 7 (mkobject_declaration 8 ((*C*) 5) Integer None)) 
(D_Seq_Declaration 9
(D_Object_Declaration 10 (mkobject_declaration 11 ((*D*) 6) Integer None)) 
(D_Seq_Declaration 12
(D_Object_Declaration 13 (mkobject_declaration 14 ((*T*) 7) Integer None)) 
(D_Object_Declaration 15 (mkobject_declaration 16 ((*R*) 8) Integer None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 17
    (S_Assignment 18 (E_Identifier 19 ((*C*) 5) ) (E_Name 20 (E_Identifier 21 ((*M*) 2) ))) 
    (S_Sequence 22
    (S_Assignment 23 (E_Identifier 24 ((*D*) 6) ) (E_Name 25 (E_Identifier 26 ((*N*) 3) ))) 
    (S_Sequence 27
    (S_While_Loop 28 (E_Binary_Operation 29 Not_Equal (E_Name 30 (E_Identifier 31 ((*D*) 6) )) (E_Literal 32 (Integer_Literal 0) ) )
      (S_Sequence 33
      (S_Assignment 34 (E_Identifier 35 ((*T*) 7) ) (E_Binary_Operation 36 Divide (E_Name 37 (E_Identifier 38 ((*C*) 5) )) (E_Name 39 (E_Identifier 40 ((*D*) 6) )) )) 
      (S_Sequence 41
      (S_Assignment 42 (E_Identifier 43 ((*R*) 8) ) (E_Binary_Operation 44 Minus (E_Name 45 (E_Identifier 46 ((*C*) 5) )) (E_Binary_Operation 47 Multiply (E_Name 48 (E_Identifier 49 ((*T*) 7) )) (E_Name 50 (E_Identifier 51 ((*D*) 6) )) ) )) 
      (S_Sequence 52
      (S_Assignment 53 (E_Identifier 54 ((*C*) 5) ) (E_Name 55 (E_Identifier 56 ((*D*) 6) ))) 
      (S_Assignment 57 (E_Identifier 58 ((*D*) 6) ) (E_Name 59 (E_Identifier 60 ((*R*) 8) ))))))
    ) 
    (S_Assignment 61 (E_Identifier 62 ((*Y*) 4) ) (E_Name 63 (E_Identifier 64 ((*C*) 5) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((59, Integer) :: (32, Integer) :: (50, Integer) :: (62, Integer) :: (35, Integer) :: (44, Integer) :: (26, Integer) :: (56, Integer) :: (29, Boolean) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (58, Integer) :: (40, Integer) :: (49, Integer) :: (31, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (60, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (36, Integer) :: (21, Integer) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((59, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (32, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (50, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: (62, (sloc (*Line*)17 (*Col*)4 (*EndLine*)17 (*EndCol*)4)) :: (35, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (44, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)20)) :: (26, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (56, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (29, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)15)) :: (38, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (47, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)20)) :: (20, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (46, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (64, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (55, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (58, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (40, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (49, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (31, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (43, (sloc (*Line*)13 (*Col*)7 (*EndLine*)13 (*EndCol*)7)) :: (25, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (37, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (19, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)4)) :: (60, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (63, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (54, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (45, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (36, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (21, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (48, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (30, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (39, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (24, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (51, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("R", "ada://variable/Gcd+1:11/R+6:4")) :: (2, ("M", "ada://parameter/Gcd+1:11/M+1:16")) :: (5, ("C", "ada://variable/Gcd+1:11/C+3:4")) :: (4, ("Y", "ada://parameter/Gcd+1:11/Y+1:42")) :: (7, ("T", "ada://variable/Gcd+1:11/T+5:4")) :: (3, ("N", "ada://parameter/Gcd+1:11/N+1:29")) :: (6, ("D", "ada://variable/Gcd+1:11/D+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Gcd", "ada://procedure_body/Gcd+1:11")) :: nil)
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
    ((*Gcd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*M*) 2) Integer In) :: 
    (mkparameter_specification_x 4 ((*N*) 3) Integer In) :: 
    (mkparameter_specification_x 5 ((*Y*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 6
  (D_Object_Declaration_X 7 (mkobject_declaration_x 8 ((*C*) 5) Integer None)) 
  (D_Seq_Declaration_X 9
  (D_Object_Declaration_X 10 (mkobject_declaration_x 11 ((*D*) 6) Integer None)) 
  (D_Seq_Declaration_X 12
  (D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*T*) 7) Integer None)) 
  (D_Object_Declaration_X 15 (mkobject_declaration_x 16 ((*R*) 8) Integer None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 17
      (S_Assignment_X 18 (E_Identifier_X 19 ((*C*) 5) (nil)) (E_Name_X 20 (E_Identifier_X 21 ((*M*) 2) (nil)))) 
      (S_Sequence_X 22
      (S_Assignment_X 23 (E_Identifier_X 24 ((*D*) 6) (nil)) (E_Name_X 25 (E_Identifier_X 26 ((*N*) 3) (nil)))) 
      (S_Sequence_X 27
      (S_While_Loop_X 28 (E_Binary_Operation_X 29 Not_Equal (E_Name_X 30 (E_Identifier_X 31 ((*D*) 6) (nil))) (E_Literal_X 32 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Sequence_X 33
        (S_Assignment_X 34 (E_Identifier_X 35 ((*T*) 7) (nil)) (E_Binary_Operation_X 36 Divide (E_Name_X 37 (E_Identifier_X 38 ((*C*) 5) (nil))) (E_Name_X 39 (E_Identifier_X 40 ((*D*) 6) (nil))) (Do_Division_Check :: Do_Overflow_Check :: nil) nil)) 
        (S_Sequence_X 41
        (S_Assignment_X 42 (E_Identifier_X 43 ((*R*) 8) (nil)) (E_Binary_Operation_X 44 Minus (E_Name_X 45 (E_Identifier_X 46 ((*C*) 5) (nil))) (E_Binary_Operation_X 47 Multiply (E_Name_X 48 (E_Identifier_X 49 ((*T*) 7) (nil))) (E_Name_X 50 (E_Identifier_X 51 ((*D*) 6) (nil))) (Do_Overflow_Check :: nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_Sequence_X 52
        (S_Assignment_X 53 (E_Identifier_X 54 ((*C*) 5) (nil)) (E_Name_X 55 (E_Identifier_X 56 ((*D*) 6) (nil)))) 
        (S_Assignment_X 57 (E_Identifier_X 58 ((*D*) 6) (nil)) (E_Name_X 59 (E_Identifier_X 60 ((*R*) 8) (nil)))))))
      ) 
      (S_Assignment_X 61 (E_Identifier_X 62 ((*Y*) 4) (nil)) (E_Name_X 63 (E_Identifier_X 64 ((*C*) 5) (nil)))))))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*C*) 5), (In_Out, Integer)) :: (((*M*) 2), (In, Integer)) :: (((*T*) 7), (In_Out, Integer)) :: (((*Y*) 4), (Out, Integer)) :: (((*R*) 8), (In_Out, Integer)) :: (((*D*) 6), (In_Out, Integer)) :: (((*N*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Gcd*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Gcd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*M*) 2) Integer In) :: 
  (mkparameter_specification_x 4 ((*N*) 3) Integer In) :: 
  (mkparameter_specification_x 5 ((*Y*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 6
(D_Object_Declaration_X 7 (mkobject_declaration_x 8 ((*C*) 5) Integer None)) 
(D_Seq_Declaration_X 9
(D_Object_Declaration_X 10 (mkobject_declaration_x 11 ((*D*) 6) Integer None)) 
(D_Seq_Declaration_X 12
(D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*T*) 7) Integer None)) 
(D_Object_Declaration_X 15 (mkobject_declaration_x 16 ((*R*) 8) Integer None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 17
    (S_Assignment_X 18 (E_Identifier_X 19 ((*C*) 5) (nil)) (E_Name_X 20 (E_Identifier_X 21 ((*M*) 2) (nil)))) 
    (S_Sequence_X 22
    (S_Assignment_X 23 (E_Identifier_X 24 ((*D*) 6) (nil)) (E_Name_X 25 (E_Identifier_X 26 ((*N*) 3) (nil)))) 
    (S_Sequence_X 27
    (S_While_Loop_X 28 (E_Binary_Operation_X 29 Not_Equal (E_Name_X 30 (E_Identifier_X 31 ((*D*) 6) (nil))) (E_Literal_X 32 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Sequence_X 33
      (S_Assignment_X 34 (E_Identifier_X 35 ((*T*) 7) (nil)) (E_Binary_Operation_X 36 Divide (E_Name_X 37 (E_Identifier_X 38 ((*C*) 5) (nil))) (E_Name_X 39 (E_Identifier_X 40 ((*D*) 6) (nil))) (Do_Division_Check :: Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 41
      (S_Assignment_X 42 (E_Identifier_X 43 ((*R*) 8) (nil)) (E_Binary_Operation_X 44 Minus (E_Name_X 45 (E_Identifier_X 46 ((*C*) 5) (nil))) (E_Binary_Operation_X 47 Multiply (E_Name_X 48 (E_Identifier_X 49 ((*T*) 7) (nil))) (E_Name_X 50 (E_Identifier_X 51 ((*D*) 6) (nil))) (Do_Overflow_Check :: nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 52
      (S_Assignment_X 53 (E_Identifier_X 54 ((*C*) 5) (nil)) (E_Name_X 55 (E_Identifier_X 56 ((*D*) 6) (nil)))) 
      (S_Assignment_X 57 (E_Identifier_X 58 ((*D*) 6) (nil)) (E_Name_X 59 (E_Identifier_X 60 ((*R*) 8) (nil)))))))
    ) 
    (S_Assignment_X 61 (E_Identifier_X 62 ((*Y*) 4) (nil)) (E_Name_X 63 (E_Identifier_X 64 ((*C*) 5) (nil)))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((59, Integer) :: (32, Integer) :: (50, Integer) :: (62, Integer) :: (35, Integer) :: (44, Integer) :: (26, Integer) :: (56, Integer) :: (29, Boolean) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (58, Integer) :: (40, Integer) :: (49, Integer) :: (31, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (60, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (36, Integer) :: (21, Integer) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((59, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (32, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (50, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: (62, (sloc (*Line*)17 (*Col*)4 (*EndLine*)17 (*EndCol*)4)) :: (35, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (44, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)20)) :: (26, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (56, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (29, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)15)) :: (38, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (47, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)20)) :: (20, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (46, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (64, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (55, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (58, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (40, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (49, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (31, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (43, (sloc (*Line*)13 (*Col*)7 (*EndLine*)13 (*EndCol*)7)) :: (25, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (37, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (19, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)4)) :: (60, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (63, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (54, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (45, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (36, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (21, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (48, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (30, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (39, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (24, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (51, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("R", "ada://variable/Gcd+1:11/R+6:4")) :: (2, ("M", "ada://parameter/Gcd+1:11/M+1:16")) :: (5, ("C", "ada://variable/Gcd+1:11/C+3:4")) :: (4, ("Y", "ada://parameter/Gcd+1:11/Y+1:42")) :: (7, ("T", "ada://variable/Gcd+1:11/T+5:4")) :: (3, ("N", "ada://parameter/Gcd+1:11/N+1:29")) :: (6, ("D", "ada://variable/Gcd+1:11/D+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Gcd", "ada://procedure_body/Gcd+1:11")) :: nil)
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
