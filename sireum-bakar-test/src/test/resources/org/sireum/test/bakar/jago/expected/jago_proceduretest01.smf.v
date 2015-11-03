Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 3
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *))) 
(D_Seq_Declaration 4
(D_Procedure_Body 5 
  (mkprocedure_body 6
    (* = = = Procedure Name = = = *)
    ((*P*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 7 ((*a*) 5) Integer In) :: 
    (mkparameter_specification 8 ((*b*) 6) Integer In_Out) :: 
    (mkparameter_specification 9 ((*c*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 10
      (S_Assignment 11 (E_Identifier 12 ((*b*) 6) ) (E_Binary_Operation 13 Plus (E_Name 14 (E_Identifier 15 ((*a*) 5) )) (E_Name 16 (E_Identifier 17 ((*b*) 6) )) )) 
      (S_Assignment 18 (E_Identifier 19 ((*c*) 7) ) (E_Binary_Operation 20 Plus (E_Name 21 (E_Identifier 22 ((*a*) 5) )) (E_Name 23 (E_Identifier 24 ((*b*) 6) )) )))
  )
) 
(D_Seq_Declaration 25
(D_Procedure_Body 26 
  (mkprocedure_body 27
    (* = = = Procedure Name = = = *)
    ((*helper*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 28 ((*x*) 9) Integer In_Out) :: 
    (mkparameter_specification 29 ((*y*) 10) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 30 (mkobject_declaration 31 ((*arg0*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 32
      (S_Assignment 33 (E_Identifier 34 ((*arg0*) 11) ) (E_Literal 35 (Integer_Literal 1) )) 
      (S_Procedure_Call 36 37 ((*P*) 1) 
        ((E_Name 38 (E_Identifier 39 ((*arg0*) 11) )) :: (E_Name 40 (E_Identifier 41 ((*x*) 9) )) :: (E_Name 42 (E_Identifier 43 ((*y*) 10) )) :: nil)
      ))
  )
) 
(D_Procedure_Body 44 
  (mkprocedure_body 45
    (* = = = Procedure Name = = = *)
    ((*Q*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 46 ((*S*) 13) Integer In) :: 
    (mkparameter_specification 47 ((*T*) 14) Integer Out) :: 
    (mkparameter_specification 48 ((*R*) 15) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 49 (mkobject_declaration 50 ((*L1*) 16) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 51
      (S_Assignment 52 (E_Identifier 53 ((*L1*) 16) ) (E_Name 54 (E_Identifier 55 ((*S*) 13) ))) 
      (S_Sequence 56
      (S_Procedure_Call 57 58 ((*P*) 1) 
        ((E_Literal 59 (Integer_Literal 2) ) :: (E_Name 60 (E_Identifier 61 ((*L1*) 16) )) :: (E_Name 62 (E_Identifier 63 ((*T*) 14) )) :: nil)
      ) 
      (S_Sequence 64
      (S_Assignment 65 (E_Identifier 66 ((*R*) 15) ) (E_Literal 67 (Integer_Literal 5) )) 
      (S_Assignment 68 (E_Identifier 69 ((*T*) 14) ) (E_Binary_Operation 70 Plus (E_Name 71 (E_Identifier 72 ((*T*) 14) )) (E_Name 73 (E_Identifier 74 ((*L1*) 16) )) )))))
  )
)))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*T*) 14), (Out, Integer)) :: (((*c*) 7), (Out, Integer)) :: (((*L1*) 16), (In_Out, Integer)) :: (((*R*) 15), (Out, Integer)) :: (((*x*) 9), (In_Out, Integer)) :: (((*b*) 6), (In_Out, Integer)) :: (((*arg0*) 11), (In_Out, Integer)) :: (((*y*) 10), (Out, Integer)) :: (((*a*) 5), (In, Integer)) :: (((*S*) 13), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 3), (0, (mkprocedure_body 45
  (* = = = Procedure Name = = = *)
  ((*Q*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 46 ((*S*) 13) Integer In) :: 
  (mkparameter_specification 47 ((*T*) 14) Integer Out) :: 
  (mkparameter_specification 48 ((*R*) 15) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 49 (mkobject_declaration 50 ((*L1*) 16) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 51
    (S_Assignment 52 (E_Identifier 53 ((*L1*) 16) ) (E_Name 54 (E_Identifier 55 ((*S*) 13) ))) 
    (S_Sequence 56
    (S_Procedure_Call 57 58 ((*P*) 1) 
      ((E_Literal 59 (Integer_Literal 2) ) :: (E_Name 60 (E_Identifier 61 ((*L1*) 16) )) :: (E_Name 62 (E_Identifier 63 ((*T*) 14) )) :: nil)
    ) 
    (S_Sequence 64
    (S_Assignment 65 (E_Identifier 66 ((*R*) 15) ) (E_Literal 67 (Integer_Literal 5) )) 
    (S_Assignment 68 (E_Identifier 69 ((*T*) 14) ) (E_Binary_Operation 70 Plus (E_Name 71 (E_Identifier 72 ((*T*) 14) )) (E_Name 73 (E_Identifier 74 ((*L1*) 16) )) )))))
))) :: (((*helper*) 2), (0, (mkprocedure_body 27
  (* = = = Procedure Name = = = *)
  ((*helper*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 28 ((*x*) 9) Integer In_Out) :: 
  (mkparameter_specification 29 ((*y*) 10) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 30 (mkobject_declaration 31 ((*arg0*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 32
    (S_Assignment 33 (E_Identifier 34 ((*arg0*) 11) ) (E_Literal 35 (Integer_Literal 1) )) 
    (S_Procedure_Call 36 37 ((*P*) 1) 
      ((E_Name 38 (E_Identifier 39 ((*arg0*) 11) )) :: (E_Name 40 (E_Identifier 41 ((*x*) 9) )) :: (E_Name 42 (E_Identifier 43 ((*y*) 10) )) :: nil)
    ))
))) :: (((*P*) 1), (0, (mkprocedure_body 6
  (* = = = Procedure Name = = = *)
  ((*P*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 7 ((*a*) 5) Integer In) :: 
  (mkparameter_specification 8 ((*b*) 6) Integer In_Out) :: 
  (mkparameter_specification 9 ((*c*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 10
    (S_Assignment 11 (E_Identifier 12 ((*b*) 6) ) (E_Binary_Operation 13 Plus (E_Name 14 (E_Identifier 15 ((*a*) 5) )) (E_Name 16 (E_Identifier 17 ((*b*) 6) )) )) 
    (S_Assignment 18 (E_Identifier 19 ((*c*) 7) ) (E_Binary_Operation 20 Plus (E_Name 21 (E_Identifier 22 ((*a*) 5) )) (E_Name 23 (E_Identifier 24 ((*b*) 6) )) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (59, Integer) :: (62, Integer) :: (17, Integer) :: (35, Integer) :: (53, Integer) :: (71, Integer) :: (74, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (73, Integer) :: (55, Integer) :: (67, Integer) :: (40, Integer) :: (13, Integer) :: (22, Integer) :: (16, Integer) :: (70, Integer) :: (43, Integer) :: (34, Integer) :: (61, Integer) :: (19, Integer) :: (60, Integer) :: (69, Integer) :: (63, Integer) :: (54, Integer) :: (72, Integer) :: (21, Integer) :: (12, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: (41, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (59, (sloc (*Line*)21 (*Col*)8 (*EndLine*)21 (*EndCol*)8)) :: (62, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (17, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (35, (sloc (*Line*)13 (*Col*)17 (*EndLine*)13 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)6 (*EndLine*)20 (*EndCol*)7)) :: (71, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (74, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (38, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (20, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)14)) :: (14, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (73, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (55, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (67, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)11)) :: (40, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (13, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)14)) :: (22, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (16, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (70, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)16)) :: (43, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (34, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)12)) :: (61, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (19, (sloc (*Line*)7 (*Col*)5 (*EndLine*)7 (*EndCol*)5)) :: (60, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (69, (sloc (*Line*)23 (*Col*)6 (*EndLine*)23 (*EndCol*)6)) :: (63, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (54, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (72, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (21, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (12, (sloc (*Line*)6 (*Col*)5 (*EndLine*)6 (*EndCol*)5)) :: (39, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (66, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)6)) :: (15, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (24, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("arg0", "ada://variable/ProcedureTest01-1:9/helper-7:13/arg0+11:5")) :: (14, ("T", "ada://parameter/ProcedureTest01-1:9/Q-11:13/T-11:30")) :: (5, ("a", "ada://parameter/ProcedureTest01-1:9/P-3:13/a-3:15")) :: (13, ("S", "ada://parameter/ProcedureTest01-1:9/Q-11:13/S-11:15")) :: (16, ("L1", "ada://variable/ProcedureTest01-1:9/Q-11:13/L1+18:6")) :: (7, ("c", "ada://parameter/ProcedureTest01-1:9/P-3:13/c-3:49")) :: (10, ("y", "ada://parameter/ProcedureTest01-1:9/helper-7:13/y-7:39")) :: (9, ("x", "ada://parameter/ProcedureTest01-1:9/helper-7:13/x-7:20")) :: (15, ("R", "ada://parameter/ProcedureTest01-1:9/Q-11:13/R-11:46")) :: (6, ("b", "ada://parameter/ProcedureTest01-1:9/P-3:13/b-3:30")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("helper", "ada://procedure_body/ProcedureTest01-1:9/helper-7:13")) :: (1, ("P", "ada://procedure/ProcedureTest01-1:9/P-3:13")) :: (3, ("Q", "ada://procedure_body/ProcedureTest01-1:9/Q-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((4, ("ProcedureTest01", "ada://package_body/ProcedureTest01-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 3
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *))) 
(D_Seq_Declaration_X 4
(D_Procedure_Body_X 5 
  (mkprocedure_body_x 6
    (* = = = Procedure Name = = = *)
    ((*P*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 7 ((*a*) 5) Integer In) :: 
    (mkparameter_specification_x 8 ((*b*) 6) Integer In_Out) :: 
    (mkparameter_specification_x 9 ((*c*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 10
      (S_Assignment_X 11 (E_Identifier_X 12 ((*b*) 6) (nil)) (E_Binary_Operation_X 13 Plus (E_Name_X 14 (E_Identifier_X 15 ((*a*) 5) (nil))) (E_Name_X 16 (E_Identifier_X 17 ((*b*) 6) (nil))) (Do_Overflow_Check :: nil) nil)) 
      (S_Assignment_X 18 (E_Identifier_X 19 ((*c*) 7) (nil)) (E_Binary_Operation_X 20 Plus (E_Name_X 21 (E_Identifier_X 22 ((*a*) 5) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*b*) 6) (nil))) (Do_Overflow_Check :: nil) nil)))
  )
) 
(D_Seq_Declaration_X 25
(D_Procedure_Body_X 26 
  (mkprocedure_body_x 27
    (* = = = Procedure Name = = = *)
    ((*helper*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 28 ((*x*) 9) Integer In_Out) :: 
    (mkparameter_specification_x 29 ((*y*) 10) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 30 (mkobject_declaration_x 31 ((*arg0*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 32
      (S_Assignment_X 33 (E_Identifier_X 34 ((*arg0*) 11) (nil)) (E_Literal_X 35 (Integer_Literal 1) (nil) nil)) 
      (S_Procedure_Call_X 36 37 ((*P*) 1) 
        ((E_Name_X 38 (E_Identifier_X 39 ((*arg0*) 11) (nil))) :: (E_Name_X 40 (E_Identifier_X 41 ((*x*) 9) (nil))) :: (E_Name_X 42 (E_Identifier_X 43 ((*y*) 10) (nil))) :: nil)
      ))
  )
) 
(D_Procedure_Body_X 44 
  (mkprocedure_body_x 45
    (* = = = Procedure Name = = = *)
    ((*Q*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 46 ((*S*) 13) Integer In) :: 
    (mkparameter_specification_x 47 ((*T*) 14) Integer Out) :: 
    (mkparameter_specification_x 48 ((*R*) 15) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 49 (mkobject_declaration_x 50 ((*L1*) 16) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 51
      (S_Assignment_X 52 (E_Identifier_X 53 ((*L1*) 16) (nil)) (E_Name_X 54 (E_Identifier_X 55 ((*S*) 13) (nil)))) 
      (S_Sequence_X 56
      (S_Procedure_Call_X 57 58 ((*P*) 1) 
        ((E_Literal_X 59 (Integer_Literal 2) (nil) nil) :: (E_Name_X 60 (E_Identifier_X 61 ((*L1*) 16) (nil))) :: (E_Name_X 62 (E_Identifier_X 63 ((*T*) 14) (nil))) :: nil)
      ) 
      (S_Sequence_X 64
      (S_Assignment_X 65 (E_Identifier_X 66 ((*R*) 15) (nil)) (E_Literal_X 67 (Integer_Literal 5) (nil) nil)) 
      (S_Assignment_X 68 (E_Identifier_X 69 ((*T*) 14) (nil)) (E_Binary_Operation_X 70 Plus (E_Name_X 71 (E_Identifier_X 72 ((*T*) 14) (nil))) (E_Name_X 73 (E_Identifier_X 74 ((*L1*) 16) (nil))) (Do_Overflow_Check :: nil) nil)))))
  )
)))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*T*) 14), (Out, Integer)) :: (((*c*) 7), (Out, Integer)) :: (((*L1*) 16), (In_Out, Integer)) :: (((*R*) 15), (Out, Integer)) :: (((*x*) 9), (In_Out, Integer)) :: (((*b*) 6), (In_Out, Integer)) :: (((*arg0*) 11), (In_Out, Integer)) :: (((*y*) 10), (Out, Integer)) :: (((*a*) 5), (In, Integer)) :: (((*S*) 13), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 3), (0, (mkprocedure_body_x 45
  (* = = = Procedure Name = = = *)
  ((*Q*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 46 ((*S*) 13) Integer In) :: 
  (mkparameter_specification_x 47 ((*T*) 14) Integer Out) :: 
  (mkparameter_specification_x 48 ((*R*) 15) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 49 (mkobject_declaration_x 50 ((*L1*) 16) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 51
    (S_Assignment_X 52 (E_Identifier_X 53 ((*L1*) 16) (nil)) (E_Name_X 54 (E_Identifier_X 55 ((*S*) 13) (nil)))) 
    (S_Sequence_X 56
    (S_Procedure_Call_X 57 58 ((*P*) 1) 
      ((E_Literal_X 59 (Integer_Literal 2) (nil) nil) :: (E_Name_X 60 (E_Identifier_X 61 ((*L1*) 16) (nil))) :: (E_Name_X 62 (E_Identifier_X 63 ((*T*) 14) (nil))) :: nil)
    ) 
    (S_Sequence_X 64
    (S_Assignment_X 65 (E_Identifier_X 66 ((*R*) 15) (nil)) (E_Literal_X 67 (Integer_Literal 5) (nil) nil)) 
    (S_Assignment_X 68 (E_Identifier_X 69 ((*T*) 14) (nil)) (E_Binary_Operation_X 70 Plus (E_Name_X 71 (E_Identifier_X 72 ((*T*) 14) (nil))) (E_Name_X 73 (E_Identifier_X 74 ((*L1*) 16) (nil))) (Do_Overflow_Check :: nil) nil)))))
))) :: (((*helper*) 2), (0, (mkprocedure_body_x 27
  (* = = = Procedure Name = = = *)
  ((*helper*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 28 ((*x*) 9) Integer In_Out) :: 
  (mkparameter_specification_x 29 ((*y*) 10) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 30 (mkobject_declaration_x 31 ((*arg0*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 32
    (S_Assignment_X 33 (E_Identifier_X 34 ((*arg0*) 11) (nil)) (E_Literal_X 35 (Integer_Literal 1) (nil) nil)) 
    (S_Procedure_Call_X 36 37 ((*P*) 1) 
      ((E_Name_X 38 (E_Identifier_X 39 ((*arg0*) 11) (nil))) :: (E_Name_X 40 (E_Identifier_X 41 ((*x*) 9) (nil))) :: (E_Name_X 42 (E_Identifier_X 43 ((*y*) 10) (nil))) :: nil)
    ))
))) :: (((*P*) 1), (0, (mkprocedure_body_x 6
  (* = = = Procedure Name = = = *)
  ((*P*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 7 ((*a*) 5) Integer In) :: 
  (mkparameter_specification_x 8 ((*b*) 6) Integer In_Out) :: 
  (mkparameter_specification_x 9 ((*c*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 10
    (S_Assignment_X 11 (E_Identifier_X 12 ((*b*) 6) (nil)) (E_Binary_Operation_X 13 Plus (E_Name_X 14 (E_Identifier_X 15 ((*a*) 5) (nil))) (E_Name_X 16 (E_Identifier_X 17 ((*b*) 6) (nil))) (Do_Overflow_Check :: nil) nil)) 
    (S_Assignment_X 18 (E_Identifier_X 19 ((*c*) 7) (nil)) (E_Binary_Operation_X 20 Plus (E_Name_X 21 (E_Identifier_X 22 ((*a*) 5) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*b*) 6) (nil))) (Do_Overflow_Check :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (59, Integer) :: (62, Integer) :: (17, Integer) :: (35, Integer) :: (53, Integer) :: (71, Integer) :: (74, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (73, Integer) :: (55, Integer) :: (67, Integer) :: (40, Integer) :: (13, Integer) :: (22, Integer) :: (16, Integer) :: (70, Integer) :: (43, Integer) :: (34, Integer) :: (61, Integer) :: (19, Integer) :: (60, Integer) :: (69, Integer) :: (63, Integer) :: (54, Integer) :: (72, Integer) :: (21, Integer) :: (12, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: (41, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (59, (sloc (*Line*)21 (*Col*)8 (*EndLine*)21 (*EndCol*)8)) :: (62, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (17, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (35, (sloc (*Line*)13 (*Col*)17 (*EndLine*)13 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)6 (*EndLine*)20 (*EndCol*)7)) :: (71, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (74, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (38, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (20, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)14)) :: (14, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (73, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (55, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (67, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)11)) :: (40, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (13, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)14)) :: (22, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (16, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (70, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)16)) :: (43, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (34, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)12)) :: (61, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (19, (sloc (*Line*)7 (*Col*)5 (*EndLine*)7 (*EndCol*)5)) :: (60, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (69, (sloc (*Line*)23 (*Col*)6 (*EndLine*)23 (*EndCol*)6)) :: (63, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (54, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (72, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (21, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (12, (sloc (*Line*)6 (*Col*)5 (*EndLine*)6 (*EndCol*)5)) :: (39, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (66, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)6)) :: (15, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (24, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("arg0", "ada://variable/ProcedureTest01-1:9/helper-7:13/arg0+11:5")) :: (14, ("T", "ada://parameter/ProcedureTest01-1:9/Q-11:13/T-11:30")) :: (5, ("a", "ada://parameter/ProcedureTest01-1:9/P-3:13/a-3:15")) :: (13, ("S", "ada://parameter/ProcedureTest01-1:9/Q-11:13/S-11:15")) :: (16, ("L1", "ada://variable/ProcedureTest01-1:9/Q-11:13/L1+18:6")) :: (7, ("c", "ada://parameter/ProcedureTest01-1:9/P-3:13/c-3:49")) :: (10, ("y", "ada://parameter/ProcedureTest01-1:9/helper-7:13/y-7:39")) :: (9, ("x", "ada://parameter/ProcedureTest01-1:9/helper-7:13/x-7:20")) :: (15, ("R", "ada://parameter/ProcedureTest01-1:9/Q-11:13/R-11:46")) :: (6, ("b", "ada://parameter/ProcedureTest01-1:9/P-3:13/b-3:30")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("helper", "ada://procedure_body/ProcedureTest01-1:9/helper-7:13")) :: (1, ("P", "ada://procedure/ProcedureTest01-1:9/P-3:13")) :: (3, ("Q", "ada://procedure_body/ProcedureTest01-1:9/Q-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((4, ("ProcedureTest01", "ada://package_body/ProcedureTest01-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

