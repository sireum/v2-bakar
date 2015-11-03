Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Division_By_Non_Zero*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*X*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 4
  (D_Type_Declaration 5 (Subtype_Declaration 6 ((*T1*) 3) Integer (Range 0 10))) 
  (D_Seq_Declaration 7
  (D_Procedure_Body 8 
    (mkprocedure_body 9
      (* = = = Procedure Name = = = *)
      ((*Divide*) 4)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 10 ((*X*) 5) Integer In) :: 
      (mkparameter_specification 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
      (mkparameter_specification 12 ((*Z*) 7) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration)
      (* = = = Procedure Body = = = *)
        (S_Assignment 13 (E_Identifier 14 ((*Z*) 7) ) (E_Binary_Operation 15 Divide (E_Name 16 (E_Identifier 17 ((*X*) 5) )) (E_Binary_Operation 18 Plus (E_Name 19 (E_Identifier 20 ((*Y*) 6) )) (E_Literal 21 (Integer_Literal 1) ) ) ))
    )
  ) 
  (D_Object_Declaration 22 (mkobject_declaration 23 ((*Result*) 10) Integer None)))))
    (* = = = Procedure Body = = = *)
      (S_Procedure_Call 24 25 ((*Divide*) 4) 
        ((E_Name 26 (E_Identifier 27 ((*X*) 2) )) :: (E_Literal 28 (Integer_Literal 8) ) :: (E_Name 29 (E_Identifier 30 ((*Result*) 10) )) :: nil)
      )
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 5), (In, Integer)) :: (((*Result*) 10), (In_Out, Integer)) :: (((*X*) 2), (In_Out, Integer)) :: (((*Z*) 7), (Out, Integer)) :: (((*Y*) 6), (In, (Subtype ((*T1*) 3)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Division_By_Non_Zero*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Division_By_Non_Zero*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*X*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 4
(D_Type_Declaration 5 (Subtype_Declaration 6 ((*T1*) 3) Integer (Range 0 10))) 
(D_Seq_Declaration 7
(D_Procedure_Body 8 
  (mkprocedure_body 9
    (* = = = Procedure Name = = = *)
    ((*Divide*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 10 ((*X*) 5) Integer In) :: 
    (mkparameter_specification 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
    (mkparameter_specification 12 ((*Z*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 13 (E_Identifier 14 ((*Z*) 7) ) (E_Binary_Operation 15 Divide (E_Name 16 (E_Identifier 17 ((*X*) 5) )) (E_Binary_Operation 18 Plus (E_Name 19 (E_Identifier 20 ((*Y*) 6) )) (E_Literal 21 (Integer_Literal 1) ) ) ))
  )
) 
(D_Object_Declaration 22 (mkobject_declaration 23 ((*Result*) 10) Integer None)))))
  (* = = = Procedure Body = = = *)
    (S_Procedure_Call 24 25 ((*Divide*) 4) 
      ((E_Name 26 (E_Identifier 27 ((*X*) 2) )) :: (E_Literal 28 (Integer_Literal 8) ) :: (E_Name 29 (E_Identifier 30 ((*Result*) 10) )) :: nil)
    )
))) :: (((*Divide*) 4), (1, (mkprocedure_body 9
  (* = = = Procedure Name = = = *)
  ((*Divide*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 10 ((*X*) 5) Integer In) :: 
  (mkparameter_specification 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
  (mkparameter_specification 12 ((*Z*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 13 (E_Identifier 14 ((*Z*) 7) ) (E_Binary_Operation 15 Divide (E_Name 16 (E_Identifier 17 ((*X*) 5) )) (E_Binary_Operation 18 Plus (E_Name 19 (E_Identifier 20 ((*Y*) 6) )) (E_Literal 21 (Integer_Literal 1) ) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T1*) 3), (Subtype_Declaration 6 ((*T1*) 3) Integer (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (26, Integer) :: (29, Integer) :: (20, (Subtype ((*T1*) 3))) :: (14, Integer) :: (16, Integer) :: (19, (Subtype ((*T1*) 3))) :: (28, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (30, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (26, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (29, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (20, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (14, (sloc (*Line*)6 (*Col*)7 (*EndLine*)6 (*EndCol*)7)) :: (16, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (19, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (28, (sloc (*Line*)11 (*Col*)14 (*EndLine*)11 (*EndCol*)14)) :: (18, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)21)) :: (27, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (21, (sloc (*Line*)6 (*Col*)21 (*EndLine*)6 (*EndCol*)21)) :: (30, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (15, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)22)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Division_By_Non_Zero+1:11/X+1:33")) :: (5, ("X", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/X+4:22")) :: (7, ("Z", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Z+4:47")) :: (10, ("Result", "ada://variable/Division_By_Non_Zero+1:11/Result+9:4")) :: (6, ("Y", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Y+4:37")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Divide", "ada://procedure_body/Division_By_Non_Zero+1:11/Divide+4:14")) :: (1, ("Division_By_Non_Zero", "ada://procedure_body/Division_By_Non_Zero+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((3, ("T1", "ada://subtype/Division_By_Non_Zero+1:11/T1+2:12")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Division_By_Non_Zero*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*X*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 4
  (D_Type_Declaration_X 5 (Subtype_Declaration_X 6 ((*T1*) 3) Integer (Range_X 0 10))) 
  (D_Seq_Declaration_X 7
  (D_Procedure_Body_X 8 
    (mkprocedure_body_x 9
      (* = = = Procedure Name = = = *)
      ((*Divide*) 4)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 10 ((*X*) 5) Integer In) :: 
      (mkparameter_specification_x 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
      (mkparameter_specification_x 12 ((*Z*) 7) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration_X)
      (* = = = Procedure Body = = = *)
        (S_Assignment_X 13 (E_Identifier_X 14 ((*Z*) 7) (nil)) (E_Binary_Operation_X 15 Divide (E_Name_X 16 (E_Identifier_X 17 ((*X*) 5) (nil))) (E_Binary_Operation_X 18 Plus (E_Name_X 19 (E_Identifier_X 20 ((*Y*) 6) (nil))) (E_Literal_X 21 (Integer_Literal 1) (nil) nil) (nil) nil) (Do_Division_Check :: nil) nil))
    )
  ) 
  (D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*Result*) 10) Integer None)))))
    (* = = = Procedure Body = = = *)
      (S_Procedure_Call_X 24 25 ((*Divide*) 4) 
        ((E_Name_X 26 (E_Identifier_X 27 ((*X*) 2) (nil))) :: (E_Literal_X 28 (Integer_Literal 8) (nil) nil) :: (E_Name_X 29 (E_Identifier_X 30 ((*Result*) 10) (nil))) :: nil)
      )
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 5), (In, Integer)) :: (((*Result*) 10), (In_Out, Integer)) :: (((*X*) 2), (In_Out, Integer)) :: (((*Z*) 7), (Out, Integer)) :: (((*Y*) 6), (In, (Subtype ((*T1*) 3)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Division_By_Non_Zero*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Division_By_Non_Zero*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*X*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 4
(D_Type_Declaration_X 5 (Subtype_Declaration_X 6 ((*T1*) 3) Integer (Range_X 0 10))) 
(D_Seq_Declaration_X 7
(D_Procedure_Body_X 8 
  (mkprocedure_body_x 9
    (* = = = Procedure Name = = = *)
    ((*Divide*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 10 ((*X*) 5) Integer In) :: 
    (mkparameter_specification_x 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
    (mkparameter_specification_x 12 ((*Z*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 13 (E_Identifier_X 14 ((*Z*) 7) (nil)) (E_Binary_Operation_X 15 Divide (E_Name_X 16 (E_Identifier_X 17 ((*X*) 5) (nil))) (E_Binary_Operation_X 18 Plus (E_Name_X 19 (E_Identifier_X 20 ((*Y*) 6) (nil))) (E_Literal_X 21 (Integer_Literal 1) (nil) nil) (nil) nil) (Do_Division_Check :: nil) nil))
  )
) 
(D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*Result*) 10) Integer None)))))
  (* = = = Procedure Body = = = *)
    (S_Procedure_Call_X 24 25 ((*Divide*) 4) 
      ((E_Name_X 26 (E_Identifier_X 27 ((*X*) 2) (nil))) :: (E_Literal_X 28 (Integer_Literal 8) (nil) nil) :: (E_Name_X 29 (E_Identifier_X 30 ((*Result*) 10) (nil))) :: nil)
    )
))) :: (((*Divide*) 4), (1, (mkprocedure_body_x 9
  (* = = = Procedure Name = = = *)
  ((*Divide*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 10 ((*X*) 5) Integer In) :: 
  (mkparameter_specification_x 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
  (mkparameter_specification_x 12 ((*Z*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 13 (E_Identifier_X 14 ((*Z*) 7) (nil)) (E_Binary_Operation_X 15 Divide (E_Name_X 16 (E_Identifier_X 17 ((*X*) 5) (nil))) (E_Binary_Operation_X 18 Plus (E_Name_X 19 (E_Identifier_X 20 ((*Y*) 6) (nil))) (E_Literal_X 21 (Integer_Literal 1) (nil) nil) (nil) nil) (Do_Division_Check :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T1*) 3), (Subtype_Declaration_X 6 ((*T1*) 3) Integer (Range_X 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (26, Integer) :: (29, Integer) :: (20, (Subtype ((*T1*) 3))) :: (14, Integer) :: (16, Integer) :: (19, (Subtype ((*T1*) 3))) :: (28, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (30, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (26, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (29, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (20, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (14, (sloc (*Line*)6 (*Col*)7 (*EndLine*)6 (*EndCol*)7)) :: (16, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (19, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (28, (sloc (*Line*)11 (*Col*)14 (*EndLine*)11 (*EndCol*)14)) :: (18, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)21)) :: (27, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (21, (sloc (*Line*)6 (*Col*)21 (*EndLine*)6 (*EndCol*)21)) :: (30, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (15, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)22)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Division_By_Non_Zero+1:11/X+1:33")) :: (5, ("X", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/X+4:22")) :: (7, ("Z", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Z+4:47")) :: (10, ("Result", "ada://variable/Division_By_Non_Zero+1:11/Result+9:4")) :: (6, ("Y", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Y+4:37")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Divide", "ada://procedure_body/Division_By_Non_Zero+1:11/Divide+4:14")) :: (1, ("Division_By_Non_Zero", "ada://procedure_body/Division_By_Non_Zero+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((3, ("T1", "ada://subtype/Division_By_Non_Zero+1:11/T1+2:12")) :: nil)
))
).

