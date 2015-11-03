Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Bounded_In_Out*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*V*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 4
  (D_Type_Declaration 5 (Subtype_Declaration 6 ((*T1*) 3) Integer (Range 0 10))) 
  (D_Seq_Declaration 7
  (D_Type_Declaration 8 (Subtype_Declaration 9 ((*T2*) 4) Integer (Range 5 15))) 
  (D_Seq_Declaration 10
  (D_Procedure_Body 11 
    (mkprocedure_body 12
      (* = = = Procedure Name = = = *)
      ((*Decrease*) 5)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration)
      (* = = = Procedure Body = = = *)
        (S_Assignment 14 (E_Identifier 15 ((*X*) 6) ) (E_Binary_Operation 16 Minus (E_Name 17 (E_Identifier 18 ((*X*) 6) )) (E_Literal 19 (Integer_Literal 1) ) ))
    )
  ) 
  (D_Procedure_Body 20 
    (mkprocedure_body 21
      (* = = = Procedure Name = = = *)
      ((*Call_Decrease*) 9)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration)
      (* = = = Procedure Body = = = *)
        (S_Procedure_Call 23 24 ((*Decrease*) 5) 
          ((E_Name 25 (E_Identifier 26 ((*X*) 10) )) :: nil)
        )
    )
  )))))
    (* = = = Procedure Body = = = *)
      (S_Procedure_Call 27 28 ((*Call_Decrease*) 9) 
        ((E_Name 29 (E_Identifier 30 ((*V*) 2) )) :: nil)
      )
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 10), (In_Out, (Subtype ((*T2*) 4)))) :: (((*X*) 6), (In_Out, (Subtype ((*T1*) 3)))) :: (((*V*) 2), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Call_Decrease*) 9), (1, (mkprocedure_body 21
  (* = = = Procedure Name = = = *)
  ((*Call_Decrease*) 9)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Procedure_Call 23 24 ((*Decrease*) 5) 
      ((E_Name 25 (E_Identifier 26 ((*X*) 10) )) :: nil)
    )
))) :: (((*Decrease*) 5), (1, (mkprocedure_body 12
  (* = = = Procedure Name = = = *)
  ((*Decrease*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 14 (E_Identifier 15 ((*X*) 6) ) (E_Binary_Operation 16 Minus (E_Name 17 (E_Identifier 18 ((*X*) 6) )) (E_Literal 19 (Integer_Literal 1) ) ))
))) :: (((*Bounded_In_Out*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Bounded_In_Out*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*V*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 4
(D_Type_Declaration 5 (Subtype_Declaration 6 ((*T1*) 3) Integer (Range 0 10))) 
(D_Seq_Declaration 7
(D_Type_Declaration 8 (Subtype_Declaration 9 ((*T2*) 4) Integer (Range 5 15))) 
(D_Seq_Declaration 10
(D_Procedure_Body 11 
  (mkprocedure_body 12
    (* = = = Procedure Name = = = *)
    ((*Decrease*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 14 (E_Identifier 15 ((*X*) 6) ) (E_Binary_Operation 16 Minus (E_Name 17 (E_Identifier 18 ((*X*) 6) )) (E_Literal 19 (Integer_Literal 1) ) ))
  )
) 
(D_Procedure_Body 20 
  (mkprocedure_body 21
    (* = = = Procedure Name = = = *)
    ((*Call_Decrease*) 9)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Procedure_Call 23 24 ((*Decrease*) 5) 
        ((E_Name 25 (E_Identifier 26 ((*X*) 10) )) :: nil)
      )
  )
)))))
  (* = = = Procedure Body = = = *)
    (S_Procedure_Call 27 28 ((*Call_Decrease*) 9) 
      ((E_Name 29 (E_Identifier 30 ((*V*) 2) )) :: nil)
    )
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T2*) 4), (Subtype_Declaration 9 ((*T2*) 4) Integer (Range 5 15))) :: (((*T1*) 3), (Subtype_Declaration 6 ((*T1*) 3) Integer (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((26, (Subtype ((*T2*) 4))) :: (17, (Subtype ((*T1*) 3))) :: (29, Integer) :: (25, (Subtype ((*T2*) 4))) :: (16, Integer) :: (19, Integer) :: (18, (Subtype ((*T1*) 3))) :: (30, Integer) :: (15, (Subtype ((*T1*) 3))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((26, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (17, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (29, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (25, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (16, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)16)) :: (19, (sloc (*Line*)7 (*Col*)16 (*EndLine*)7 (*EndCol*)16)) :: (18, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (30, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (15, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("V", "ada://parameter/Bounded_In_Out+1:11/V+1:27")) :: (10, ("X", "ada://parameter/Bounded_In_Out+1:11/Call_Decrease+10:14/X+10:29")) :: (6, ("X", "ada://parameter/Bounded_In_Out+1:11/Decrease+5:14/X+5:24")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Decrease+5:14")) :: (1, ("Bounded_In_Out", "ada://procedure_body/Bounded_In_Out+1:11")) :: (9, ("Call_Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Call_Decrease+10:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("T2", "ada://subtype/Bounded_In_Out+1:11/T2+3:12")) :: (3, ("T1", "ada://subtype/Bounded_In_Out+1:11/T1+2:12")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Bounded_In_Out*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*V*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 4
  (D_Type_Declaration_X 5 (Subtype_Declaration_X 6 ((*T1*) 3) Integer (Range_X 0 10))) 
  (D_Seq_Declaration_X 7
  (D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*T2*) 4) Integer (Range_X 5 15))) 
  (D_Seq_Declaration_X 10
  (D_Procedure_Body_X 11 
    (mkprocedure_body_x 12
      (* = = = Procedure Name = = = *)
      ((*Decrease*) 5)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration_X)
      (* = = = Procedure Body = = = *)
        (S_Assignment_X 14 (E_Identifier_X 15 ((*X*) 6) (nil)) (E_Binary_Operation_X 16 Minus (E_Name_X 17 (E_Identifier_X 18 ((*X*) 6) (nil))) (E_Literal_X 19 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
    )
  ) 
  (D_Procedure_Body_X 20 
    (mkprocedure_body_x 21
      (* = = = Procedure Name = = = *)
      ((*Call_Decrease*) 9)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration_X)
      (* = = = Procedure Body = = = *)
        (S_Procedure_Call_X 23 24 ((*Decrease*) 5) 
          ((E_Name_X 25 (E_Identifier_X 26 ((*X*) 10) (Do_Range_Check :: nil))) :: nil)
        )
    )
  )))))
    (* = = = Procedure Body = = = *)
      (S_Procedure_Call_X 27 28 ((*Call_Decrease*) 9) 
        ((E_Name_X 29 (E_Identifier_X 30 ((*V*) 2) (Do_Range_Check :: nil))) :: nil)
      )
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 10), (In_Out, (Subtype ((*T2*) 4)))) :: (((*X*) 6), (In_Out, (Subtype ((*T1*) 3)))) :: (((*V*) 2), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Call_Decrease*) 9), (1, (mkprocedure_body_x 21
  (* = = = Procedure Name = = = *)
  ((*Call_Decrease*) 9)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Procedure_Call_X 23 24 ((*Decrease*) 5) 
      ((E_Name_X 25 (E_Identifier_X 26 ((*X*) 10) (Do_Range_Check :: nil))) :: nil)
    )
))) :: (((*Decrease*) 5), (1, (mkprocedure_body_x 12
  (* = = = Procedure Name = = = *)
  ((*Decrease*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 14 (E_Identifier_X 15 ((*X*) 6) (nil)) (E_Binary_Operation_X 16 Minus (E_Name_X 17 (E_Identifier_X 18 ((*X*) 6) (nil))) (E_Literal_X 19 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
))) :: (((*Bounded_In_Out*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Bounded_In_Out*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*V*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 4
(D_Type_Declaration_X 5 (Subtype_Declaration_X 6 ((*T1*) 3) Integer (Range_X 0 10))) 
(D_Seq_Declaration_X 7
(D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*T2*) 4) Integer (Range_X 5 15))) 
(D_Seq_Declaration_X 10
(D_Procedure_Body_X 11 
  (mkprocedure_body_x 12
    (* = = = Procedure Name = = = *)
    ((*Decrease*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 14 (E_Identifier_X 15 ((*X*) 6) (nil)) (E_Binary_Operation_X 16 Minus (E_Name_X 17 (E_Identifier_X 18 ((*X*) 6) (nil))) (E_Literal_X 19 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
  )
) 
(D_Procedure_Body_X 20 
  (mkprocedure_body_x 21
    (* = = = Procedure Name = = = *)
    ((*Call_Decrease*) 9)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Procedure_Call_X 23 24 ((*Decrease*) 5) 
        ((E_Name_X 25 (E_Identifier_X 26 ((*X*) 10) (Do_Range_Check :: nil))) :: nil)
      )
  )
)))))
  (* = = = Procedure Body = = = *)
    (S_Procedure_Call_X 27 28 ((*Call_Decrease*) 9) 
      ((E_Name_X 29 (E_Identifier_X 30 ((*V*) 2) (Do_Range_Check :: nil))) :: nil)
    )
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T2*) 4), (Subtype_Declaration_X 9 ((*T2*) 4) Integer (Range_X 5 15))) :: (((*T1*) 3), (Subtype_Declaration_X 6 ((*T1*) 3) Integer (Range_X 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((26, (Subtype ((*T2*) 4))) :: (17, (Subtype ((*T1*) 3))) :: (29, Integer) :: (25, (Subtype ((*T2*) 4))) :: (16, Integer) :: (19, Integer) :: (18, (Subtype ((*T1*) 3))) :: (30, Integer) :: (15, (Subtype ((*T1*) 3))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((26, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (17, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (29, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (25, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (16, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)16)) :: (19, (sloc (*Line*)7 (*Col*)16 (*EndLine*)7 (*EndCol*)16)) :: (18, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (30, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (15, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("V", "ada://parameter/Bounded_In_Out+1:11/V+1:27")) :: (10, ("X", "ada://parameter/Bounded_In_Out+1:11/Call_Decrease+10:14/X+10:29")) :: (6, ("X", "ada://parameter/Bounded_In_Out+1:11/Decrease+5:14/X+5:24")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Decrease+5:14")) :: (1, ("Bounded_In_Out", "ada://procedure_body/Bounded_In_Out+1:11")) :: (9, ("Call_Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Call_Decrease+10:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("T2", "ada://subtype/Bounded_In_Out+1:11/T2+3:12")) :: (3, ("T1", "ada://subtype/Bounded_In_Out+1:11/T1+2:12")) :: nil)
))
).

