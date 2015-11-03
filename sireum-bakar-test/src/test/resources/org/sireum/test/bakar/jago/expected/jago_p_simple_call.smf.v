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
(D_Seq_Declaration 7
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Object_Declaration 8 (mkobject_declaration 9 ((*C*) 5) Integer None)))))) 
(D_Seq_Declaration 10
(D_Object_Declaration 11 (mkobject_declaration 12 ((*B*) 7) Integer None)) 
(D_Seq_Declaration 13
(D_Procedure_Body 14 
  (mkprocedure_body 15
    (* = = = Procedure Name = = = *)
    ((*R*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 16 ((*X*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 17 (E_Identifier 18 ((*X*) 8) ) (E_Binary_Operation 19 Plus (E_Binary_Operation 20 Plus (E_Name 21 (E_Identifier 22 ((*Y*) 1) )) (E_Name 23 (E_Identifier 24 ((*B*) 7) )) ) (E_Name 25 (E_Identifier 26 ((*C*) 5) )) ))
  )
) 
(D_Seq_Declaration 27
(D_Procedure_Body 28 
  (mkprocedure_body 29
    (* = = = Procedure Name = = = *)
    ((*incX*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 30 ((*X*) 10) Integer In) :: 
    (mkparameter_specification 31 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 32 (mkobject_declaration 33 ((*result*) 12) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 34
      (S_If 35 (E_Binary_Operation 36 Equal (E_Name 37 (E_Identifier 38 ((*X*) 10) )) (E_Literal 39 (Integer_Literal 0) ) )
        (S_Assignment 40 (E_Identifier 41 ((*result*) 12) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 10) )) (E_Literal 45 (Integer_Literal 1) ) ))
        (S_Assignment 46 (E_Identifier 47 ((*result*) 12) ) (E_Binary_Operation 48 Minus (E_Name 49 (E_Identifier 50 ((*X*) 10) )) (E_Literal 51 (Integer_Literal 1) ) ))
      ) 
      (S_Assignment 52 (E_Identifier 53 ((*Z*) 11) ) (E_Name 54 (E_Identifier 55 ((*result*) 12) ))))
  )
) 
(D_Procedure_Body 56 
  (mkprocedure_body 57
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 58 ((*X*) 15) Integer In) :: 
    (mkparameter_specification 59 ((*Z*) 16) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 60 (mkobject_declaration 61 ((*V*) 17) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 62
      (S_Procedure_Call 63 64 ((*R*) 4) 
        ((E_Name 65 (E_Identifier 66 ((*Z*) 16) )) :: nil)
      ) 
      (S_Sequence 67
      (S_Procedure_Call 68 69 ((*incX*) 3) 
        ((E_Name 70 (E_Identifier 71 ((*X*) 15) )) :: (E_Name 72 (E_Identifier 73 ((*V*) 17) )) :: nil)
      ) 
      (S_Assignment 74 (E_Identifier 75 ((*Z*) 16) ) (E_Binary_Operation 76 Plus (E_Name 77 (E_Identifier 78 ((*Z*) 16) )) (E_Name 79 (E_Identifier 80 ((*V*) 17) )) ))))
  )
))))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*C*) 5), (In_Out, Integer)) :: (((*B*) 7), (In_Out, Integer)) :: (((*V*) 17), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*Z*) 16), (Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: (((*X*) 15), (In, Integer)) :: (((*result*) 12), (In_Out, Integer)) :: (((*X*) 8), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 4), (0, (mkprocedure_body 15
  (* = = = Procedure Name = = = *)
  ((*R*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 16 ((*X*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 17 (E_Identifier 18 ((*X*) 8) ) (E_Binary_Operation 19 Plus (E_Binary_Operation 20 Plus (E_Name 21 (E_Identifier 22 ((*Y*) 1) )) (E_Name 23 (E_Identifier 24 ((*B*) 7) )) ) (E_Name 25 (E_Identifier 26 ((*C*) 5) )) ))
))) :: (((*incX*) 3), (0, (mkprocedure_body 29
  (* = = = Procedure Name = = = *)
  ((*incX*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 30 ((*X*) 10) Integer In) :: 
  (mkparameter_specification 31 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 32 (mkobject_declaration 33 ((*result*) 12) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 34
    (S_If 35 (E_Binary_Operation 36 Equal (E_Name 37 (E_Identifier 38 ((*X*) 10) )) (E_Literal 39 (Integer_Literal 0) ) )
      (S_Assignment 40 (E_Identifier 41 ((*result*) 12) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 10) )) (E_Literal 45 (Integer_Literal 1) ) ))
      (S_Assignment 46 (E_Identifier 47 ((*result*) 12) ) (E_Binary_Operation 48 Minus (E_Name 49 (E_Identifier 50 ((*X*) 10) )) (E_Literal 51 (Integer_Literal 1) ) ))
    ) 
    (S_Assignment 52 (E_Identifier 53 ((*Z*) 11) ) (E_Name 54 (E_Identifier 55 ((*result*) 12) ))))
))) :: (((*Q*) 2), (0, (mkprocedure_body 57
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 58 ((*X*) 15) Integer In) :: 
  (mkparameter_specification 59 ((*Z*) 16) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 60 (mkobject_declaration 61 ((*V*) 17) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 62
    (S_Procedure_Call 63 64 ((*R*) 4) 
      ((E_Name 65 (E_Identifier 66 ((*Z*) 16) )) :: nil)
    ) 
    (S_Sequence 67
    (S_Procedure_Call 68 69 ((*incX*) 3) 
      ((E_Name 70 (E_Identifier 71 ((*X*) 15) )) :: (E_Name 72 (E_Identifier 73 ((*V*) 17) )) :: nil)
    ) 
    (S_Assignment 74 (E_Identifier 75 ((*Z*) 16) ) (E_Binary_Operation 76 Plus (E_Name 77 (E_Identifier 78 ((*Z*) 16) )) (E_Name 79 (E_Identifier 80 ((*V*) 17) )) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (77, Integer) :: (41, Integer) :: (50, Integer) :: (44, Integer) :: (53, Integer) :: (80, Integer) :: (26, Integer) :: (71, Integer) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (65, Integer) :: (73, Integer) :: (55, Integer) :: (49, Integer) :: (76, Integer) :: (22, Integer) :: (79, Integer) :: (70, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (78, Integer) :: (45, Integer) :: (54, Integer) :: (72, Integer) :: (36, Boolean) :: (18, Integer) :: (21, Integer) :: (48, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (42, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (77, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (41, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (50, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (44, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)5)) :: (80, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (26, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (71, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (38, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (47, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)12)) :: (20, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)16)) :: (65, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (73, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (55, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (49, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (76, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)15)) :: (22, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (79, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (70, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (43, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (25, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (37, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (19, (sloc (*Line*)8 (*Col*)11 (*EndLine*)8 (*EndCol*)21)) :: (78, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (45, (sloc (*Line*)16 (*Col*)21 (*EndLine*)16 (*EndCol*)21)) :: (54, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (72, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (36, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (18, (sloc (*Line*)8 (*Col*)6 (*EndLine*)8 (*EndCol*)6)) :: (21, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (48, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)21)) :: (75, (sloc (*Line*)29 (*Col*)6 (*EndLine*)29 (*EndCol*)6)) :: (39, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (66, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (42, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (24, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (51, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("V", "ada://variable/P_Simple_Call-1:9/Q-7:13/V+25:6")) :: (8, ("X", "ada://parameter/P_Simple_Call-1:9/R-13:13/X-13:15")) :: (11, ("Z", "ada://parameter/P_Simple_Call-1:9/incX-11:13/Z-11:34")) :: (5, ("C", "ada://variable/P_Simple_Call-1:9/C-18:4")) :: (16, ("Z", "ada://parameter/P_Simple_Call-1:9/Q-7:13/Z-7:30")) :: (7, ("B", "ada://variable/P_Simple_Call-1:9/B+4:3")) :: (10, ("X", "ada://parameter/P_Simple_Call-1:9/incX-11:13/X-11:18")) :: (1, ("Y", "ada://variable/P_Simple_Call-1:9/Y-6:3")) :: (12, ("result", "ada://variable/P_Simple_Call-1:9/incX-11:13/result+13:5")) :: (15, ("X", "ada://parameter/P_Simple_Call-1:9/Q-7:13/X-7:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call-1:9/Q-7:13")) :: (4, ("R", "ada://procedure/P_Simple_Call-1:9/R-13:13")) :: (3, ("incX", "ada://procedure/P_Simple_Call-1:9/incX-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("P_Simple_Call", "ada://package_body/P_Simple_Call-1:9")) :: nil)
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
(D_Seq_Declaration_X 7
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Object_Declaration_X 8 (mkobject_declaration_x 9 ((*C*) 5) Integer None)))))) 
(D_Seq_Declaration_X 10
(D_Object_Declaration_X 11 (mkobject_declaration_x 12 ((*B*) 7) Integer None)) 
(D_Seq_Declaration_X 13
(D_Procedure_Body_X 14 
  (mkprocedure_body_x 15
    (* = = = Procedure Name = = = *)
    ((*R*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 16 ((*X*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 17 (E_Identifier_X 18 ((*X*) 8) (nil)) (E_Binary_Operation_X 19 Plus (E_Binary_Operation_X 20 Plus (E_Name_X 21 (E_Identifier_X 22 ((*Y*) 1) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*B*) 7) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 25 (E_Identifier_X 26 ((*C*) 5) (nil))) (Do_Overflow_Check :: nil) nil))
  )
) 
(D_Seq_Declaration_X 27
(D_Procedure_Body_X 28 
  (mkprocedure_body_x 29
    (* = = = Procedure Name = = = *)
    ((*incX*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 30 ((*X*) 10) Integer In) :: 
    (mkparameter_specification_x 31 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 32 (mkobject_declaration_x 33 ((*result*) 12) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 34
      (S_If_X 35 (E_Binary_Operation_X 36 Equal (E_Name_X 37 (E_Identifier_X 38 ((*X*) 10) (nil))) (E_Literal_X 39 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Assignment_X 40 (E_Identifier_X 41 ((*result*) 12) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 10) (nil))) (E_Literal_X 45 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
        (S_Assignment_X 46 (E_Identifier_X 47 ((*result*) 12) (nil)) (E_Binary_Operation_X 48 Minus (E_Name_X 49 (E_Identifier_X 50 ((*X*) 10) (nil))) (E_Literal_X 51 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      ) 
      (S_Assignment_X 52 (E_Identifier_X 53 ((*Z*) 11) (nil)) (E_Name_X 54 (E_Identifier_X 55 ((*result*) 12) (nil)))))
  )
) 
(D_Procedure_Body_X 56 
  (mkprocedure_body_x 57
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 58 ((*X*) 15) Integer In) :: 
    (mkparameter_specification_x 59 ((*Z*) 16) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 60 (mkobject_declaration_x 61 ((*V*) 17) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 62
      (S_Procedure_Call_X 63 64 ((*R*) 4) 
        ((E_Name_X 65 (E_Identifier_X 66 ((*Z*) 16) (nil))) :: nil)
      ) 
      (S_Sequence_X 67
      (S_Procedure_Call_X 68 69 ((*incX*) 3) 
        ((E_Name_X 70 (E_Identifier_X 71 ((*X*) 15) (nil))) :: (E_Name_X 72 (E_Identifier_X 73 ((*V*) 17) (nil))) :: nil)
      ) 
      (S_Assignment_X 74 (E_Identifier_X 75 ((*Z*) 16) (nil)) (E_Binary_Operation_X 76 Plus (E_Name_X 77 (E_Identifier_X 78 ((*Z*) 16) (nil))) (E_Name_X 79 (E_Identifier_X 80 ((*V*) 17) (nil))) (Do_Overflow_Check :: nil) nil))))
  )
))))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*C*) 5), (In_Out, Integer)) :: (((*B*) 7), (In_Out, Integer)) :: (((*V*) 17), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*Z*) 16), (Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: (((*X*) 15), (In, Integer)) :: (((*result*) 12), (In_Out, Integer)) :: (((*X*) 8), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 4), (0, (mkprocedure_body_x 15
  (* = = = Procedure Name = = = *)
  ((*R*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 16 ((*X*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 17 (E_Identifier_X 18 ((*X*) 8) (nil)) (E_Binary_Operation_X 19 Plus (E_Binary_Operation_X 20 Plus (E_Name_X 21 (E_Identifier_X 22 ((*Y*) 1) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*B*) 7) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 25 (E_Identifier_X 26 ((*C*) 5) (nil))) (Do_Overflow_Check :: nil) nil))
))) :: (((*incX*) 3), (0, (mkprocedure_body_x 29
  (* = = = Procedure Name = = = *)
  ((*incX*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 30 ((*X*) 10) Integer In) :: 
  (mkparameter_specification_x 31 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 32 (mkobject_declaration_x 33 ((*result*) 12) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 34
    (S_If_X 35 (E_Binary_Operation_X 36 Equal (E_Name_X 37 (E_Identifier_X 38 ((*X*) 10) (nil))) (E_Literal_X 39 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Assignment_X 40 (E_Identifier_X 41 ((*result*) 12) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 10) (nil))) (E_Literal_X 45 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      (S_Assignment_X 46 (E_Identifier_X 47 ((*result*) 12) (nil)) (E_Binary_Operation_X 48 Minus (E_Name_X 49 (E_Identifier_X 50 ((*X*) 10) (nil))) (E_Literal_X 51 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
    ) 
    (S_Assignment_X 52 (E_Identifier_X 53 ((*Z*) 11) (nil)) (E_Name_X 54 (E_Identifier_X 55 ((*result*) 12) (nil)))))
))) :: (((*Q*) 2), (0, (mkprocedure_body_x 57
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 58 ((*X*) 15) Integer In) :: 
  (mkparameter_specification_x 59 ((*Z*) 16) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 60 (mkobject_declaration_x 61 ((*V*) 17) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 62
    (S_Procedure_Call_X 63 64 ((*R*) 4) 
      ((E_Name_X 65 (E_Identifier_X 66 ((*Z*) 16) (nil))) :: nil)
    ) 
    (S_Sequence_X 67
    (S_Procedure_Call_X 68 69 ((*incX*) 3) 
      ((E_Name_X 70 (E_Identifier_X 71 ((*X*) 15) (nil))) :: (E_Name_X 72 (E_Identifier_X 73 ((*V*) 17) (nil))) :: nil)
    ) 
    (S_Assignment_X 74 (E_Identifier_X 75 ((*Z*) 16) (nil)) (E_Binary_Operation_X 76 Plus (E_Name_X 77 (E_Identifier_X 78 ((*Z*) 16) (nil))) (E_Name_X 79 (E_Identifier_X 80 ((*V*) 17) (nil))) (Do_Overflow_Check :: nil) nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (77, Integer) :: (41, Integer) :: (50, Integer) :: (44, Integer) :: (53, Integer) :: (80, Integer) :: (26, Integer) :: (71, Integer) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (65, Integer) :: (73, Integer) :: (55, Integer) :: (49, Integer) :: (76, Integer) :: (22, Integer) :: (79, Integer) :: (70, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (78, Integer) :: (45, Integer) :: (54, Integer) :: (72, Integer) :: (36, Boolean) :: (18, Integer) :: (21, Integer) :: (48, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (42, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (77, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (41, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (50, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (44, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)5)) :: (80, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (26, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (71, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (38, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (47, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)12)) :: (20, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)16)) :: (65, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (73, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (55, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (49, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (76, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)15)) :: (22, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (79, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (70, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (43, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (25, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (37, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (19, (sloc (*Line*)8 (*Col*)11 (*EndLine*)8 (*EndCol*)21)) :: (78, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (45, (sloc (*Line*)16 (*Col*)21 (*EndLine*)16 (*EndCol*)21)) :: (54, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (72, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (36, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (18, (sloc (*Line*)8 (*Col*)6 (*EndLine*)8 (*EndCol*)6)) :: (21, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (48, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)21)) :: (75, (sloc (*Line*)29 (*Col*)6 (*EndLine*)29 (*EndCol*)6)) :: (39, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (66, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (42, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (24, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (51, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("V", "ada://variable/P_Simple_Call-1:9/Q-7:13/V+25:6")) :: (8, ("X", "ada://parameter/P_Simple_Call-1:9/R-13:13/X-13:15")) :: (11, ("Z", "ada://parameter/P_Simple_Call-1:9/incX-11:13/Z-11:34")) :: (5, ("C", "ada://variable/P_Simple_Call-1:9/C-18:4")) :: (16, ("Z", "ada://parameter/P_Simple_Call-1:9/Q-7:13/Z-7:30")) :: (7, ("B", "ada://variable/P_Simple_Call-1:9/B+4:3")) :: (10, ("X", "ada://parameter/P_Simple_Call-1:9/incX-11:13/X-11:18")) :: (1, ("Y", "ada://variable/P_Simple_Call-1:9/Y-6:3")) :: (12, ("result", "ada://variable/P_Simple_Call-1:9/incX-11:13/result+13:5")) :: (15, ("X", "ada://parameter/P_Simple_Call-1:9/Q-7:13/X-7:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call-1:9/Q-7:13")) :: (4, ("R", "ada://procedure/P_Simple_Call-1:9/R-13:13")) :: (3, ("incX", "ada://procedure/P_Simple_Call-1:9/incX-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("P_Simple_Call", "ada://package_body/P_Simple_Call-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

