Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Odd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*X*) 2) Integer In) :: 
    (mkparameter_specification 4 ((*R*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 5
  (D_Object_Declaration 6 (mkobject_declaration 7 ((*Result*) 4) Integer None)) 
  (D_Object_Declaration 8 (mkobject_declaration 9 ((*T*) 5) Integer None))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 10
      (S_Assignment 11 (E_Identifier 12 ((*Result*) 4) ) (E_Literal 13 (Integer_Literal 1) )) 
      (S_Sequence 14
      (S_Assignment 15 (E_Identifier 16 ((*T*) 5) ) (E_Binary_Operation 17 Divide (E_Name 18 (E_Identifier 19 ((*X*) 2) )) (E_Literal 20 (Integer_Literal 2) ) )) 
      (S_Sequence 21
      (S_If 22 (E_Binary_Operation 23 Equal (E_Name 24 (E_Identifier 25 ((*X*) 2) )) (E_Binary_Operation 26 Multiply (E_Name 27 (E_Identifier 28 ((*T*) 5) )) (E_Literal 29 (Integer_Literal 2) ) ) )
        (S_Assignment 30 (E_Identifier 31 ((*Result*) 4) ) (E_Literal 32 (Integer_Literal 0) ))
        S_Null
      ) 
      (S_Assignment 33 (E_Identifier 34 ((*R*) 3) ) (E_Name 35 (E_Identifier 36 ((*Result*) 4) ))))))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 2), (In, Integer)) :: (((*T*) 5), (In_Out, Integer)) :: (((*R*) 3), (Out, Integer)) :: (((*Result*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Odd*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Odd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*X*) 2) Integer In) :: 
  (mkparameter_specification 4 ((*R*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 5
(D_Object_Declaration 6 (mkobject_declaration 7 ((*Result*) 4) Integer None)) 
(D_Object_Declaration 8 (mkobject_declaration 9 ((*T*) 5) Integer None))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 10
    (S_Assignment 11 (E_Identifier 12 ((*Result*) 4) ) (E_Literal 13 (Integer_Literal 1) )) 
    (S_Sequence 14
    (S_Assignment 15 (E_Identifier 16 ((*T*) 5) ) (E_Binary_Operation 17 Divide (E_Name 18 (E_Identifier 19 ((*X*) 2) )) (E_Literal 20 (Integer_Literal 2) ) )) 
    (S_Sequence 21
    (S_If 22 (E_Binary_Operation 23 Equal (E_Name 24 (E_Identifier 25 ((*X*) 2) )) (E_Binary_Operation 26 Multiply (E_Name 27 (E_Identifier 28 ((*T*) 5) )) (E_Literal 29 (Integer_Literal 2) ) ) )
      (S_Assignment 30 (E_Identifier 31 ((*Result*) 4) ) (E_Literal 32 (Integer_Literal 0) ))
      S_Null
    ) 
    (S_Assignment 33 (E_Identifier 34 ((*R*) 3) ) (E_Name 35 (E_Identifier 36 ((*Result*) 4) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Boolean) :: (32, Integer) :: (35, Integer) :: (17, Integer) :: (26, Integer) :: (29, Integer) :: (20, Integer) :: (13, Integer) :: (31, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (19, Integer) :: (28, Integer) :: (36, Integer) :: (18, Integer) :: (27, Integer) :: (12, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)15)) :: (32, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (35, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (17, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (26, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)15)) :: (29, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (20, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (13, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (31, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)12)) :: (16, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (34, (sloc (*Line*)13 (*Col*)4 (*EndLine*)13 (*EndCol*)4)) :: (25, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (28, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (36, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (27, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (12, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)9)) :: (24, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Odd+1:11/X+1:16")) :: (5, ("T", "ada://variable/Odd+1:11/T+4:4")) :: (4, ("Result", "ada://variable/Odd+1:11/Result+3:4")) :: (3, ("R", "ada://parameter/Odd+1:11/R+1:32")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Odd", "ada://procedure_body/Odd+1:11")) :: nil)
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
    ((*Odd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*X*) 2) Integer In) :: 
    (mkparameter_specification_x 4 ((*R*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 5
  (D_Object_Declaration_X 6 (mkobject_declaration_x 7 ((*Result*) 4) Integer None)) 
  (D_Object_Declaration_X 8 (mkobject_declaration_x 9 ((*T*) 5) Integer None))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 10
      (S_Assignment_X 11 (E_Identifier_X 12 ((*Result*) 4) (nil)) (E_Literal_X 13 (Integer_Literal 1) (nil) nil)) 
      (S_Sequence_X 14
      (S_Assignment_X 15 (E_Identifier_X 16 ((*T*) 5) (nil)) (E_Binary_Operation_X 17 Divide (E_Name_X 18 (E_Identifier_X 19 ((*X*) 2) (nil))) (E_Literal_X 20 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil)) 
      (S_Sequence_X 21
      (S_If_X 22 (E_Binary_Operation_X 23 Equal (E_Name_X 24 (E_Identifier_X 25 ((*X*) 2) (nil))) (E_Binary_Operation_X 26 Multiply (E_Name_X 27 (E_Identifier_X 28 ((*T*) 5) (nil))) (E_Literal_X 29 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil) (nil) nil)
        (S_Assignment_X 30 (E_Identifier_X 31 ((*Result*) 4) (nil)) (E_Literal_X 32 (Integer_Literal 0) (nil) nil))
        S_Null_X
      ) 
      (S_Assignment_X 33 (E_Identifier_X 34 ((*R*) 3) (nil)) (E_Name_X 35 (E_Identifier_X 36 ((*Result*) 4) (nil)))))))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 2), (In, Integer)) :: (((*T*) 5), (In_Out, Integer)) :: (((*R*) 3), (Out, Integer)) :: (((*Result*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Odd*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Odd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*X*) 2) Integer In) :: 
  (mkparameter_specification_x 4 ((*R*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 5
(D_Object_Declaration_X 6 (mkobject_declaration_x 7 ((*Result*) 4) Integer None)) 
(D_Object_Declaration_X 8 (mkobject_declaration_x 9 ((*T*) 5) Integer None))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 10
    (S_Assignment_X 11 (E_Identifier_X 12 ((*Result*) 4) (nil)) (E_Literal_X 13 (Integer_Literal 1) (nil) nil)) 
    (S_Sequence_X 14
    (S_Assignment_X 15 (E_Identifier_X 16 ((*T*) 5) (nil)) (E_Binary_Operation_X 17 Divide (E_Name_X 18 (E_Identifier_X 19 ((*X*) 2) (nil))) (E_Literal_X 20 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil)) 
    (S_Sequence_X 21
    (S_If_X 22 (E_Binary_Operation_X 23 Equal (E_Name_X 24 (E_Identifier_X 25 ((*X*) 2) (nil))) (E_Binary_Operation_X 26 Multiply (E_Name_X 27 (E_Identifier_X 28 ((*T*) 5) (nil))) (E_Literal_X 29 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil) (nil) nil)
      (S_Assignment_X 30 (E_Identifier_X 31 ((*Result*) 4) (nil)) (E_Literal_X 32 (Integer_Literal 0) (nil) nil))
      S_Null_X
    ) 
    (S_Assignment_X 33 (E_Identifier_X 34 ((*R*) 3) (nil)) (E_Name_X 35 (E_Identifier_X 36 ((*Result*) 4) (nil)))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Boolean) :: (32, Integer) :: (35, Integer) :: (17, Integer) :: (26, Integer) :: (29, Integer) :: (20, Integer) :: (13, Integer) :: (31, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (19, Integer) :: (28, Integer) :: (36, Integer) :: (18, Integer) :: (27, Integer) :: (12, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)15)) :: (32, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (35, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (17, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (26, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)15)) :: (29, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (20, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (13, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (31, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)12)) :: (16, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (34, (sloc (*Line*)13 (*Col*)4 (*EndLine*)13 (*EndCol*)4)) :: (25, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (28, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (36, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (27, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (12, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)9)) :: (24, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Odd+1:11/X+1:16")) :: (5, ("T", "ada://variable/Odd+1:11/T+4:4")) :: (4, ("Result", "ada://variable/Odd+1:11/Result+3:4")) :: (3, ("R", "ada://parameter/Odd+1:11/R+1:32")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Odd", "ada://procedure_body/Odd+1:11")) :: nil)
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

