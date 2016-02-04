Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Linear_Div*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*Dividend*) 2) Integer In) :: 
    (mkparameter_specification 4 ((*Divisor*) 3) Integer In) :: 
    (mkparameter_specification 5 ((*Quotient*) 4) Integer Out) :: 
    (mkparameter_specification 6 ((*Remainder*) 5) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 7
      (S_Assignment 8 (E_Identifier 9 ((*Quotient*) 4) ) (E_Literal 10 (Integer_Literal 0) )) 
      (S_Sequence 11
      (S_Assignment 12 (E_Identifier 13 ((*Remainder*) 5) ) (E_Name 14 (E_Identifier 15 ((*Dividend*) 2) ))) 
      (S_While_Loop 16 (E_Binary_Operation 17 Greater_Than_Or_Equal (E_Name 18 (E_Identifier 19 ((*Remainder*) 5) )) (E_Name 20 (E_Identifier 21 ((*Divisor*) 3) )) )
        (S_Sequence 22
        (S_Assignment 23 (E_Identifier 24 ((*Quotient*) 4) ) (E_Binary_Operation 25 Plus (E_Name 26 (E_Identifier 27 ((*Quotient*) 4) )) (E_Literal 28 (Integer_Literal 1) ) )) 
        (S_Sequence 29
        (S_Assignment 30 (E_Identifier 31 ((*Quotient*) 4) ) (E_Binary_Operation 32 Plus (E_Name 33 (E_Identifier 34 ((*Quotient*) 4) )) (E_Literal 35 (Integer_Literal 1) ) )) 
        (S_Assignment 36 (E_Identifier 37 ((*Remainder*) 5) ) (E_Binary_Operation 38 Minus (E_Name 39 (E_Identifier 40 ((*Remainder*) 5) )) (E_Name 41 (E_Identifier 42 ((*Divisor*) 3) )) ))))
      )))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Quotient*) 4), (Out, Integer)) :: (((*Dividend*) 2), (In, Integer)) :: (((*Remainder*) 5), (Out, Integer)) :: (((*Divisor*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Linear_Div*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Linear_Div*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*Dividend*) 2) Integer In) :: 
  (mkparameter_specification 4 ((*Divisor*) 3) Integer In) :: 
  (mkparameter_specification 5 ((*Quotient*) 4) Integer Out) :: 
  (mkparameter_specification 6 ((*Remainder*) 5) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 7
    (S_Assignment 8 (E_Identifier 9 ((*Quotient*) 4) ) (E_Literal 10 (Integer_Literal 0) )) 
    (S_Sequence 11
    (S_Assignment 12 (E_Identifier 13 ((*Remainder*) 5) ) (E_Name 14 (E_Identifier 15 ((*Dividend*) 2) ))) 
    (S_While_Loop 16 (E_Binary_Operation 17 Greater_Than_Or_Equal (E_Name 18 (E_Identifier 19 ((*Remainder*) 5) )) (E_Name 20 (E_Identifier 21 ((*Divisor*) 3) )) )
      (S_Sequence 22
      (S_Assignment 23 (E_Identifier 24 ((*Quotient*) 4) ) (E_Binary_Operation 25 Plus (E_Name 26 (E_Identifier 27 ((*Quotient*) 4) )) (E_Literal 28 (Integer_Literal 1) ) )) 
      (S_Sequence 29
      (S_Assignment 30 (E_Identifier 31 ((*Quotient*) 4) ) (E_Binary_Operation 32 Plus (E_Name 33 (E_Identifier 34 ((*Quotient*) 4) )) (E_Literal 35 (Integer_Literal 1) ) )) 
      (S_Assignment 36 (E_Identifier 37 ((*Remainder*) 5) ) (E_Binary_Operation 38 Minus (E_Name 39 (E_Identifier 40 ((*Remainder*) 5) )) (E_Name 41 (E_Identifier 42 ((*Divisor*) 3) )) ))))
    )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (41, Integer) :: (17, Boolean) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (40, Integer) :: (13, Integer) :: (31, Integer) :: (25, Integer) :: (34, Integer) :: (10, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Integer) :: (9, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (15, Integer) :: (24, Integer) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)30)) :: (41, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (17, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)29)) :: (35, (sloc (*Line*)18 (*Col*)30 (*EndLine*)18 (*EndCol*)30)) :: (26, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (38, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)38)) :: (20, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (14, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (40, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (13, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)12)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)14)) :: (25, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)30)) :: (34, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: (10, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (37, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)15)) :: (19, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (28, (sloc (*Line*)17 (*Col*)30 (*EndLine*)17 (*EndCol*)30)) :: (18, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (9, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)11)) :: (27, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (21, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (39, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (42, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)14)) :: (33, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("Dividend", "ada://parameter/Linear_Div+1:11/Dividend+1:23")) :: (5, ("Remainder", "ada://parameter/Linear_Div+1:11/Remainder+2:66")) :: (4, ("Quotient", "ada://parameter/Linear_Div+1:11/Quotient+2:42")) :: (3, ("Divisor", "ada://parameter/Linear_Div+1:11/Divisor+2:23")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Linear_Div", "ada://procedure_body/Linear_Div+1:11")) :: nil)
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
    ((*Linear_Div*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*Dividend*) 2) Integer In) :: 
    (mkparameter_specification_x 4 ((*Divisor*) 3) Integer In) :: 
    (mkparameter_specification_x 5 ((*Quotient*) 4) Integer Out) :: 
    (mkparameter_specification_x 6 ((*Remainder*) 5) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 7
      (S_Assignment_X 8 (E_Identifier_X 9 ((*Quotient*) 4) (nil)) (E_Literal_X 10 (Integer_Literal 0) (nil) nil)) 
      (S_Sequence_X 11
      (S_Assignment_X 12 (E_Identifier_X 13 ((*Remainder*) 5) (nil)) (E_Name_X 14 (E_Identifier_X 15 ((*Dividend*) 2) (nil)))) 
      (S_While_Loop_X 16 (E_Binary_Operation_X 17 Greater_Than_Or_Equal (E_Name_X 18 (E_Identifier_X 19 ((*Remainder*) 5) (nil))) (E_Name_X 20 (E_Identifier_X 21 ((*Divisor*) 3) (nil))) (nil) nil)
        (S_Sequence_X 22
        (S_Assignment_X 23 (E_Identifier_X 24 ((*Quotient*) 4) (nil)) (E_Binary_Operation_X 25 Plus (E_Name_X 26 (E_Identifier_X 27 ((*Quotient*) 4) (nil))) (E_Literal_X 28 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_Sequence_X 29
        (S_Assignment_X 30 (E_Identifier_X 31 ((*Quotient*) 4) (nil)) (E_Binary_Operation_X 32 Plus (E_Name_X 33 (E_Identifier_X 34 ((*Quotient*) 4) (nil))) (E_Literal_X 35 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_Assignment_X 36 (E_Identifier_X 37 ((*Remainder*) 5) (nil)) (E_Binary_Operation_X 38 Minus (E_Name_X 39 (E_Identifier_X 40 ((*Remainder*) 5) (nil))) (E_Name_X 41 (E_Identifier_X 42 ((*Divisor*) 3) (nil))) (Do_Overflow_Check :: nil) nil))))
      )))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Quotient*) 4), (Out, Integer)) :: (((*Dividend*) 2), (In, Integer)) :: (((*Remainder*) 5), (Out, Integer)) :: (((*Divisor*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Linear_Div*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Linear_Div*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*Dividend*) 2) Integer In) :: 
  (mkparameter_specification_x 4 ((*Divisor*) 3) Integer In) :: 
  (mkparameter_specification_x 5 ((*Quotient*) 4) Integer Out) :: 
  (mkparameter_specification_x 6 ((*Remainder*) 5) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 7
    (S_Assignment_X 8 (E_Identifier_X 9 ((*Quotient*) 4) (nil)) (E_Literal_X 10 (Integer_Literal 0) (nil) nil)) 
    (S_Sequence_X 11
    (S_Assignment_X 12 (E_Identifier_X 13 ((*Remainder*) 5) (nil)) (E_Name_X 14 (E_Identifier_X 15 ((*Dividend*) 2) (nil)))) 
    (S_While_Loop_X 16 (E_Binary_Operation_X 17 Greater_Than_Or_Equal (E_Name_X 18 (E_Identifier_X 19 ((*Remainder*) 5) (nil))) (E_Name_X 20 (E_Identifier_X 21 ((*Divisor*) 3) (nil))) (nil) nil)
      (S_Sequence_X 22
      (S_Assignment_X 23 (E_Identifier_X 24 ((*Quotient*) 4) (nil)) (E_Binary_Operation_X 25 Plus (E_Name_X 26 (E_Identifier_X 27 ((*Quotient*) 4) (nil))) (E_Literal_X 28 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 29
      (S_Assignment_X 30 (E_Identifier_X 31 ((*Quotient*) 4) (nil)) (E_Binary_Operation_X 32 Plus (E_Name_X 33 (E_Identifier_X 34 ((*Quotient*) 4) (nil))) (E_Literal_X 35 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Assignment_X 36 (E_Identifier_X 37 ((*Remainder*) 5) (nil)) (E_Binary_Operation_X 38 Minus (E_Name_X 39 (E_Identifier_X 40 ((*Remainder*) 5) (nil))) (E_Name_X 41 (E_Identifier_X 42 ((*Divisor*) 3) (nil))) (Do_Overflow_Check :: nil) nil))))
    )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (41, Integer) :: (17, Boolean) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (40, Integer) :: (13, Integer) :: (31, Integer) :: (25, Integer) :: (34, Integer) :: (10, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Integer) :: (9, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (15, Integer) :: (24, Integer) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)30)) :: (41, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (17, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)29)) :: (35, (sloc (*Line*)18 (*Col*)30 (*EndLine*)18 (*EndCol*)30)) :: (26, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (38, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)38)) :: (20, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (14, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (40, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (13, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)12)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)14)) :: (25, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)30)) :: (34, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: (10, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (37, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)15)) :: (19, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (28, (sloc (*Line*)17 (*Col*)30 (*EndLine*)17 (*EndCol*)30)) :: (18, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (9, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)11)) :: (27, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (21, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (39, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (42, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)14)) :: (33, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("Dividend", "ada://parameter/Linear_Div+1:11/Dividend+1:23")) :: (5, ("Remainder", "ada://parameter/Linear_Div+1:11/Remainder+2:66")) :: (4, ("Quotient", "ada://parameter/Linear_Div+1:11/Quotient+2:42")) :: (3, ("Divisor", "ada://parameter/Linear_Div+1:11/Divisor+2:23")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Linear_Div", "ada://procedure_body/Linear_Div+1:11")) :: nil)
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
