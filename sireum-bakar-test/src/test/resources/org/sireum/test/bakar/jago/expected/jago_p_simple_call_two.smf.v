Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Object_Declaration 3 (mkobject_declaration 4 ((*Y*) 1) Integer None)) 
(D_Seq_Declaration 5
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 6
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Object_Declaration 7 (mkobject_declaration 8 ((*C*) 4) Integer None))))) 
(D_Seq_Declaration 9
(D_Object_Declaration 10 (mkobject_declaration 11 ((*B*) 6) Integer None)) 
(D_Seq_Declaration 12
(D_Procedure_Body 13 
  (mkprocedure_body 14
    (* = = = Procedure Name = = = *)
    ((*R*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 15 ((*X*) 7) Integer In) :: 
    (mkparameter_specification 16 ((*Z*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 17 (E_Identifier 18 ((*Z*) 8) ) (E_Binary_Operation 19 Plus (E_Binary_Operation 20 Plus (E_Binary_Operation 21 Plus (E_Name 22 (E_Identifier 23 ((*X*) 7) )) (E_Name 24 (E_Identifier 25 ((*Y*) 1) )) ) (E_Name 26 (E_Identifier 27 ((*B*) 6) )) ) (E_Name 28 (E_Identifier 29 ((*C*) 4) )) ))
  )
) 
(D_Procedure_Body 30 
  (mkprocedure_body 31
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 32 ((*X*) 10) Integer In) :: 
    (mkparameter_specification 33 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 34
      (S_Procedure_Call 35 36 ((*R*) 3) 
        ((E_Name 37 (E_Identifier 38 ((*X*) 10) )) :: (E_Name 39 (E_Identifier 40 ((*Z*) 11) )) :: nil)
      ) 
      (S_Assignment 41 (E_Identifier 42 ((*Z*) 11) ) (E_Binary_Operation 43 Plus (E_Name 44 (E_Identifier 45 ((*Z*) 11) )) (E_Name 46 (E_Identifier 47 ((*X*) 10) )) )))
  )
)))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 7), (In, Integer)) :: (((*Z*) 8), (Out, Integer)) :: (((*C*) 4), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*B*) 6), (In_Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 3), (0, (mkprocedure_body 14
  (* = = = Procedure Name = = = *)
  ((*R*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 15 ((*X*) 7) Integer In) :: 
  (mkparameter_specification 16 ((*Z*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 17 (E_Identifier 18 ((*Z*) 8) ) (E_Binary_Operation 19 Plus (E_Binary_Operation 20 Plus (E_Binary_Operation 21 Plus (E_Name 22 (E_Identifier 23 ((*X*) 7) )) (E_Name 24 (E_Identifier 25 ((*Y*) 1) )) ) (E_Name 26 (E_Identifier 27 ((*B*) 6) )) ) (E_Name 28 (E_Identifier 29 ((*C*) 4) )) ))
))) :: (((*Q*) 2), (0, (mkprocedure_body 31
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 32 ((*X*) 10) Integer In) :: 
  (mkparameter_specification 33 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 34
    (S_Procedure_Call 35 36 ((*R*) 3) 
      ((E_Name 37 (E_Identifier 38 ((*X*) 10) )) :: (E_Name 39 (E_Identifier 40 ((*Z*) 11) )) :: nil)
    ) 
    (S_Assignment 41 (E_Identifier 42 ((*Z*) 11) ) (E_Binary_Operation 43 Plus (E_Name 44 (E_Identifier 45 ((*Z*) 11) )) (E_Name 46 (E_Identifier 47 ((*X*) 10) )) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (44, Integer) :: (26, Integer) :: (47, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (46, Integer) :: (40, Integer) :: (22, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (45, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (44, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (26, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (47, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (38, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (29, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (20, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)22)) :: (46, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (40, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (22, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (43, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)15)) :: (25, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: (37, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (19, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)27)) :: (28, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (45, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (18, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (21, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)17)) :: (39, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (24, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/Z-11:30")) :: (11, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/Z-7:30")) :: (4, ("C", "ada://variable/P_Simple_Call_Two-1:9/C-16:4")) :: (7, ("X", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/X-11:15")) :: (10, ("X", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/X-7:15")) :: (1, ("Y", "ada://variable/P_Simple_Call_Two-1:9/Y-6:3")) :: (6, ("B", "ada://variable/P_Simple_Call_Two-1:9/B+3:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call_Two-1:9/Q-7:13")) :: (3, ("R", "ada://procedure/P_Simple_Call_Two-1:9/R-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("P_Simple_Call_Two", "ada://package_body/P_Simple_Call_Two-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Object_Declaration_X 3 (mkobject_declaration_x 4 ((*Y*) 1) Integer None)) 
(D_Seq_Declaration_X 5
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 6
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Object_Declaration_X 7 (mkobject_declaration_x 8 ((*C*) 4) Integer None))))) 
(D_Seq_Declaration_X 9
(D_Object_Declaration_X 10 (mkobject_declaration_x 11 ((*B*) 6) Integer None)) 
(D_Seq_Declaration_X 12
(D_Procedure_Body_X 13 
  (mkprocedure_body_x 14
    (* = = = Procedure Name = = = *)
    ((*R*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 15 ((*X*) 7) Integer In) :: 
    (mkparameter_specification_x 16 ((*Z*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 17 (E_Identifier_X 18 ((*Z*) 8) (nil)) (E_Binary_Operation_X 19 Plus (E_Binary_Operation_X 20 Plus (E_Binary_Operation_X 21 Plus (E_Name_X 22 (E_Identifier_X 23 ((*X*) 7) (nil))) (E_Name_X 24 (E_Identifier_X 25 ((*Y*) 1) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 26 (E_Identifier_X 27 ((*B*) 6) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 28 (E_Identifier_X 29 ((*C*) 4) (nil))) (Do_Overflow_Check :: nil) nil))
  )
) 
(D_Procedure_Body_X 30 
  (mkprocedure_body_x 31
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 32 ((*X*) 10) Integer In) :: 
    (mkparameter_specification_x 33 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 34
      (S_Procedure_Call_X 35 36 ((*R*) 3) 
        ((E_Name_X 37 (E_Identifier_X 38 ((*X*) 10) (nil))) :: (E_Name_X 39 (E_Identifier_X 40 ((*Z*) 11) (nil))) :: nil)
      ) 
      (S_Assignment_X 41 (E_Identifier_X 42 ((*Z*) 11) (nil)) (E_Binary_Operation_X 43 Plus (E_Name_X 44 (E_Identifier_X 45 ((*Z*) 11) (nil))) (E_Name_X 46 (E_Identifier_X 47 ((*X*) 10) (nil))) (Do_Overflow_Check :: nil) nil)))
  )
)))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 7), (In, Integer)) :: (((*Z*) 8), (Out, Integer)) :: (((*C*) 4), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*B*) 6), (In_Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 3), (0, (mkprocedure_body_x 14
  (* = = = Procedure Name = = = *)
  ((*R*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 15 ((*X*) 7) Integer In) :: 
  (mkparameter_specification_x 16 ((*Z*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 17 (E_Identifier_X 18 ((*Z*) 8) (nil)) (E_Binary_Operation_X 19 Plus (E_Binary_Operation_X 20 Plus (E_Binary_Operation_X 21 Plus (E_Name_X 22 (E_Identifier_X 23 ((*X*) 7) (nil))) (E_Name_X 24 (E_Identifier_X 25 ((*Y*) 1) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 26 (E_Identifier_X 27 ((*B*) 6) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 28 (E_Identifier_X 29 ((*C*) 4) (nil))) (Do_Overflow_Check :: nil) nil))
))) :: (((*Q*) 2), (0, (mkprocedure_body_x 31
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 32 ((*X*) 10) Integer In) :: 
  (mkparameter_specification_x 33 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 34
    (S_Procedure_Call_X 35 36 ((*R*) 3) 
      ((E_Name_X 37 (E_Identifier_X 38 ((*X*) 10) (nil))) :: (E_Name_X 39 (E_Identifier_X 40 ((*Z*) 11) (nil))) :: nil)
    ) 
    (S_Assignment_X 41 (E_Identifier_X 42 ((*Z*) 11) (nil)) (E_Binary_Operation_X 43 Plus (E_Name_X 44 (E_Identifier_X 45 ((*Z*) 11) (nil))) (E_Name_X 46 (E_Identifier_X 47 ((*X*) 10) (nil))) (Do_Overflow_Check :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (44, Integer) :: (26, Integer) :: (47, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (46, Integer) :: (40, Integer) :: (22, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (45, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (44, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (26, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (47, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (38, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (29, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (20, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)22)) :: (46, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (40, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (22, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (43, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)15)) :: (25, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: (37, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (19, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)27)) :: (28, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (45, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (18, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (21, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)17)) :: (39, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (24, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/Z-11:30")) :: (11, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/Z-7:30")) :: (4, ("C", "ada://variable/P_Simple_Call_Two-1:9/C-16:4")) :: (7, ("X", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/X-11:15")) :: (10, ("X", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/X-7:15")) :: (1, ("Y", "ada://variable/P_Simple_Call_Two-1:9/Y-6:3")) :: (6, ("B", "ada://variable/P_Simple_Call_Two-1:9/B+3:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call_Two-1:9/Q-7:13")) :: (3, ("R", "ada://procedure/P_Simple_Call_Two-1:9/R-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("P_Simple_Call_Two", "ada://package_body/P_Simple_Call_Two-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

