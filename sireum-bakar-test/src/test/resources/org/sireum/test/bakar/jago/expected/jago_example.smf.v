Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *)) 
(D_Seq_Declaration 3
(D_Procedure_Body 4 
  (mkprocedure_body 5
    (* = = = Procedure Name = = = *)
    ((*add*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 6 ((*x*) 4) Integer In_Out) :: 
    (mkparameter_specification 7 ((*y*) 5) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 8 (E_Identifier 9 ((*x*) 4) ) (E_Binary_Operation 10 Plus (E_Name 11 (E_Identifier 12 ((*x*) 4) )) (E_Name 13 (E_Identifier 14 ((*y*) 5) )) ))
  )
) 
(D_Procedure_Body 15 
  (mkprocedure_body 16
    (* = = = Procedure Name = = = *)
    ((*foo*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 17 ((*A*) 7) Integer In_Out) :: 
    (mkparameter_specification 18 ((*B*) 8) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 19 (mkobject_declaration 20 ((*M*) 9) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 21
      (S_Assignment 22 (E_Identifier 23 ((*M*) 9) ) (E_Literal 24 (Integer_Literal 3) )) 
      (S_Sequence 25
      (S_Procedure_Call 26 27 ((*add*) 1) 
        ((E_Name 28 (E_Identifier 29 ((*A*) 7) )) :: (E_Name 30 (E_Identifier 31 ((*M*) 9) )) :: nil)
      ) 
      (S_Sequence 32
      (S_Procedure_Call 33 34 ((*add*) 1) 
        ((E_Name 35 (E_Identifier 36 ((*B*) 8) )) :: (E_Literal 37 (Integer_Literal 5) ) :: nil)
      ) 
      (S_Sequence 38
      (S_Assignment 39 (E_Identifier 40 ((*A*) 7) ) (E_Binary_Operation 41 Plus (E_Name 42 (E_Identifier 43 ((*A*) 7) )) (E_Literal 44 (Integer_Literal 2) ) )) 
      (S_Assignment 45 (E_Identifier 46 ((*B*) 8) ) (E_Binary_Operation 47 Plus (E_Name 48 (E_Identifier 49 ((*B*) 8) )) (E_Literal 50 (Integer_Literal 5) ) ))))))
  )
))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*y*) 5), (In, Integer)) :: (((*A*) 7), (In_Out, Integer)) :: (((*x*) 4), (In_Out, Integer)) :: (((*M*) 9), (In_Out, Integer)) :: (((*B*) 8), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*add*) 1), (0, (mkprocedure_body 5
  (* = = = Procedure Name = = = *)
  ((*add*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 6 ((*x*) 4) Integer In_Out) :: 
  (mkparameter_specification 7 ((*y*) 5) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 8 (E_Identifier 9 ((*x*) 4) ) (E_Binary_Operation 10 Plus (E_Name 11 (E_Identifier 12 ((*x*) 4) )) (E_Name 13 (E_Identifier 14 ((*y*) 5) )) ))
))) :: (((*foo*) 2), (0, (mkprocedure_body 16
  (* = = = Procedure Name = = = *)
  ((*foo*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 17 ((*A*) 7) Integer In_Out) :: 
  (mkparameter_specification 18 ((*B*) 8) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 19 (mkobject_declaration 20 ((*M*) 9) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 21
    (S_Assignment 22 (E_Identifier 23 ((*M*) 9) ) (E_Literal 24 (Integer_Literal 3) )) 
    (S_Sequence 25
    (S_Procedure_Call 26 27 ((*add*) 1) 
      ((E_Name 28 (E_Identifier 29 ((*A*) 7) )) :: (E_Name 30 (E_Identifier 31 ((*M*) 9) )) :: nil)
    ) 
    (S_Sequence 32
    (S_Procedure_Call 33 34 ((*add*) 1) 
      ((E_Name 35 (E_Identifier 36 ((*B*) 8) )) :: (E_Literal 37 (Integer_Literal 5) ) :: nil)
    ) 
    (S_Sequence 38
    (S_Assignment 39 (E_Identifier 40 ((*A*) 7) ) (E_Binary_Operation 41 Plus (E_Name 42 (E_Identifier 43 ((*A*) 7) )) (E_Literal 44 (Integer_Literal 2) ) )) 
    (S_Assignment 45 (E_Identifier 46 ((*B*) 8) ) (E_Binary_Operation 47 Plus (E_Name 48 (E_Identifier 49 ((*B*) 8) )) (E_Literal 50 (Integer_Literal 5) ) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (50, Integer) :: (35, Integer) :: (44, Integer) :: (11, Integer) :: (29, Integer) :: (47, Integer) :: (14, Integer) :: (46, Integer) :: (40, Integer) :: (49, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (10, Integer) :: (37, Integer) :: (28, Integer) :: (9, Integer) :: (36, Integer) :: (12, Integer) :: (48, Integer) :: (30, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (41, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)15)) :: (50, (sloc (*Line*)18 (*Col*)15 (*EndLine*)18 (*EndCol*)15)) :: (35, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (44, (sloc (*Line*)17 (*Col*)15 (*EndLine*)17 (*EndCol*)15)) :: (11, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (29, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (47, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)15)) :: (14, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (46, (sloc (*Line*)18 (*Col*)6 (*EndLine*)18 (*EndCol*)6)) :: (40, (sloc (*Line*)17 (*Col*)6 (*EndLine*)17 (*EndCol*)6)) :: (49, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (13, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (31, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (43, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (10, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)15)) :: (37, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)12)) :: (28, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (9, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (36, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (12, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (48, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (30, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (42, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (24, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("B", "ada://parameter/Example-1:9/foo-5:15/B-5:41")) :: (5, ("y", "ada://parameter/Example-1:9/add-2:15/y-2:41")) :: (4, ("x", "ada://parameter/Example-1:9/add-2:15/x-2:21")) :: (7, ("A", "ada://parameter/Example-1:9/foo-5:15/A-5:21")) :: (9, ("M", "ada://variable/Example-1:9/foo-5:15/M+12:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("foo", "ada://procedure_body/Example-1:9/foo-5:15")) :: (1, ("add", "ada://procedure/Example-1:9/add-2:15")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Example", "ada://package_body/Example-1:9")) :: nil)
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
D_Null_Declaration_X (* Undefined Declarations ! *)) 
(D_Seq_Declaration_X 3
(D_Procedure_Body_X 4 
  (mkprocedure_body_x 5
    (* = = = Procedure Name = = = *)
    ((*add*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 6 ((*x*) 4) Integer In_Out) :: 
    (mkparameter_specification_x 7 ((*y*) 5) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 8 (E_Identifier_X 9 ((*x*) 4) (nil)) (E_Binary_Operation_X 10 Plus (E_Name_X 11 (E_Identifier_X 12 ((*x*) 4) (nil))) (E_Name_X 13 (E_Identifier_X 14 ((*y*) 5) (nil))) (Do_Overflow_Check :: nil) nil))
  )
) 
(D_Procedure_Body_X 15 
  (mkprocedure_body_x 16
    (* = = = Procedure Name = = = *)
    ((*foo*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 17 ((*A*) 7) Integer In_Out) :: 
    (mkparameter_specification_x 18 ((*B*) 8) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 19 (mkobject_declaration_x 20 ((*M*) 9) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 21
      (S_Assignment_X 22 (E_Identifier_X 23 ((*M*) 9) (nil)) (E_Literal_X 24 (Integer_Literal 3) (nil) nil)) 
      (S_Sequence_X 25
      (S_Procedure_Call_X 26 27 ((*add*) 1) 
        ((E_Name_X 28 (E_Identifier_X 29 ((*A*) 7) (nil))) :: (E_Name_X 30 (E_Identifier_X 31 ((*M*) 9) (nil))) :: nil)
      ) 
      (S_Sequence_X 32
      (S_Procedure_Call_X 33 34 ((*add*) 1) 
        ((E_Name_X 35 (E_Identifier_X 36 ((*B*) 8) (nil))) :: (E_Literal_X 37 (Integer_Literal 5) (nil) nil) :: nil)
      ) 
      (S_Sequence_X 38
      (S_Assignment_X 39 (E_Identifier_X 40 ((*A*) 7) (nil)) (E_Binary_Operation_X 41 Plus (E_Name_X 42 (E_Identifier_X 43 ((*A*) 7) (nil))) (E_Literal_X 44 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Assignment_X 45 (E_Identifier_X 46 ((*B*) 8) (nil)) (E_Binary_Operation_X 47 Plus (E_Name_X 48 (E_Identifier_X 49 ((*B*) 8) (nil))) (E_Literal_X 50 (Integer_Literal 5) (nil) nil) (Do_Overflow_Check :: nil) nil))))))
  )
))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*y*) 5), (In, Integer)) :: (((*A*) 7), (In_Out, Integer)) :: (((*x*) 4), (In_Out, Integer)) :: (((*M*) 9), (In_Out, Integer)) :: (((*B*) 8), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*add*) 1), (0, (mkprocedure_body_x 5
  (* = = = Procedure Name = = = *)
  ((*add*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 6 ((*x*) 4) Integer In_Out) :: 
  (mkparameter_specification_x 7 ((*y*) 5) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 8 (E_Identifier_X 9 ((*x*) 4) (nil)) (E_Binary_Operation_X 10 Plus (E_Name_X 11 (E_Identifier_X 12 ((*x*) 4) (nil))) (E_Name_X 13 (E_Identifier_X 14 ((*y*) 5) (nil))) (Do_Overflow_Check :: nil) nil))
))) :: (((*foo*) 2), (0, (mkprocedure_body_x 16
  (* = = = Procedure Name = = = *)
  ((*foo*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 17 ((*A*) 7) Integer In_Out) :: 
  (mkparameter_specification_x 18 ((*B*) 8) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 19 (mkobject_declaration_x 20 ((*M*) 9) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 21
    (S_Assignment_X 22 (E_Identifier_X 23 ((*M*) 9) (nil)) (E_Literal_X 24 (Integer_Literal 3) (nil) nil)) 
    (S_Sequence_X 25
    (S_Procedure_Call_X 26 27 ((*add*) 1) 
      ((E_Name_X 28 (E_Identifier_X 29 ((*A*) 7) (nil))) :: (E_Name_X 30 (E_Identifier_X 31 ((*M*) 9) (nil))) :: nil)
    ) 
    (S_Sequence_X 32
    (S_Procedure_Call_X 33 34 ((*add*) 1) 
      ((E_Name_X 35 (E_Identifier_X 36 ((*B*) 8) (nil))) :: (E_Literal_X 37 (Integer_Literal 5) (nil) nil) :: nil)
    ) 
    (S_Sequence_X 38
    (S_Assignment_X 39 (E_Identifier_X 40 ((*A*) 7) (nil)) (E_Binary_Operation_X 41 Plus (E_Name_X 42 (E_Identifier_X 43 ((*A*) 7) (nil))) (E_Literal_X 44 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
    (S_Assignment_X 45 (E_Identifier_X 46 ((*B*) 8) (nil)) (E_Binary_Operation_X 47 Plus (E_Name_X 48 (E_Identifier_X 49 ((*B*) 8) (nil))) (E_Literal_X 50 (Integer_Literal 5) (nil) nil) (Do_Overflow_Check :: nil) nil))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (50, Integer) :: (35, Integer) :: (44, Integer) :: (11, Integer) :: (29, Integer) :: (47, Integer) :: (14, Integer) :: (46, Integer) :: (40, Integer) :: (49, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (10, Integer) :: (37, Integer) :: (28, Integer) :: (9, Integer) :: (36, Integer) :: (12, Integer) :: (48, Integer) :: (30, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (41, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)15)) :: (50, (sloc (*Line*)18 (*Col*)15 (*EndLine*)18 (*EndCol*)15)) :: (35, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (44, (sloc (*Line*)17 (*Col*)15 (*EndLine*)17 (*EndCol*)15)) :: (11, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (29, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (47, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)15)) :: (14, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (46, (sloc (*Line*)18 (*Col*)6 (*EndLine*)18 (*EndCol*)6)) :: (40, (sloc (*Line*)17 (*Col*)6 (*EndLine*)17 (*EndCol*)6)) :: (49, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (13, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (31, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (43, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (10, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)15)) :: (37, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)12)) :: (28, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (9, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (36, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (12, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (48, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (30, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (42, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (24, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("B", "ada://parameter/Example-1:9/foo-5:15/B-5:41")) :: (5, ("y", "ada://parameter/Example-1:9/add-2:15/y-2:41")) :: (4, ("x", "ada://parameter/Example-1:9/add-2:15/x-2:21")) :: (7, ("A", "ada://parameter/Example-1:9/foo-5:15/A-5:21")) :: (9, ("M", "ada://variable/Example-1:9/foo-5:15/M+12:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("foo", "ada://procedure_body/Example-1:9/foo-5:15")) :: (1, ("add", "ada://procedure/Example-1:9/add-2:15")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Example", "ada://package_body/Example-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

