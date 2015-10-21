Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *)) 
(D_Seq_Declaration 3
(D_Type_Declaration 4 (Integer_Type_Declaration 5 ((*Pointer_Range*) 4) (Range 0 100))) 
(D_Seq_Declaration 6
(D_Type_Declaration 7 (Subtype_Declaration 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (Range 1 100))) 
(D_Seq_Declaration 9
(D_Type_Declaration 10 (Array_Type_Declaration 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) 
(D_Seq_Declaration 12
(D_Object_Declaration 13 (mkobject_declaration 14 ((*S*) 7) (Array_Type ((*Vector*) 6)) None)) 
(D_Seq_Declaration 15
(D_Object_Declaration 16 (mkobject_declaration 17 ((*Pointer*) 8) (Integer_Type ((*Pointer_Range*) 4)) None)) 
(D_Seq_Declaration 18
(D_Procedure_Body 19 
  (mkprocedure_body 20
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 21 ((*X*) 9) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 22
      (S_Assignment 23 (E_Identifier 24 ((*Pointer*) 8) ) (E_Binary_Operation 25 Plus (E_Name 26 (E_Identifier 27 ((*Pointer*) 8) )) (E_Literal 28 (Integer_Literal 1) ) )) 
      (S_Assignment 29 (E_Indexed_Component 30 (E_Identifier 31 ((*S*) 7) ) (E_Name 32 (E_Identifier 33 ((*Pointer*) 8) )) ) (E_Name 34 (E_Identifier 35 ((*X*) 9) ))))
  )
) 
(D_Procedure_Body 36 
  (mkprocedure_body 37
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 38 ((*X*) 12) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 39
      (S_Assignment 40 (E_Identifier 41 ((*X*) 12) ) (E_Name 42 (E_Indexed_Component 43 (E_Identifier 44 ((*S*) 7) ) (E_Name 45 (E_Identifier 46 ((*Pointer*) 8) )) ))) 
      (S_Assignment 47 (E_Identifier 48 ((*Pointer*) 8) ) (E_Binary_Operation 49 Minus (E_Name 50 (E_Identifier 51 ((*Pointer*) 8) )) (E_Literal 52 (Integer_Literal 1) ) )))
  )
)))))))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Pointer*) 8), (In_Out, (Integer_Type ((*Pointer_Range*) 4)))) :: (((*S*) 7), (In_Out, (Array_Type ((*Vector*) 6)))) :: (((*X*) 9), (In, Integer)) :: (((*X*) 12), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocedure_body 20
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 21 ((*X*) 9) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 22
    (S_Assignment 23 (E_Identifier 24 ((*Pointer*) 8) ) (E_Binary_Operation 25 Plus (E_Name 26 (E_Identifier 27 ((*Pointer*) 8) )) (E_Literal 28 (Integer_Literal 1) ) )) 
    (S_Assignment 29 (E_Indexed_Component 30 (E_Identifier 31 ((*S*) 7) ) (E_Name 32 (E_Identifier 33 ((*Pointer*) 8) )) ) (E_Name 34 (E_Identifier 35 ((*X*) 9) ))))
))) :: (((*Pop*) 2), (0, (mkprocedure_body 37
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 38 ((*X*) 12) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 39
    (S_Assignment 40 (E_Identifier 41 ((*X*) 12) ) (E_Name 42 (E_Indexed_Component 43 (E_Identifier 44 ((*S*) 7) ) (E_Name 45 (E_Identifier 46 ((*Pointer*) 8) )) ))) 
    (S_Assignment 47 (E_Identifier 48 ((*Pointer*) 8) ) (E_Binary_Operation 49 Minus (E_Name 50 (E_Identifier 51 ((*Pointer*) 8) )) (E_Literal 52 (Integer_Literal 1) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Range*) 5), (Subtype_Declaration 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (Range 1 100))) :: (((*Pointer_Range*) 4), (Integer_Type_Declaration 5 ((*Pointer_Range*) 4) (Range 0 100))) :: (((*Vector*) 6), (Array_Type_Declaration 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((50, (Integer_Type ((*Pointer_Range*) 4))) :: (32, (Integer_Type ((*Pointer_Range*) 4))) :: (41, Integer) :: (44, (Array_Type ((*Vector*) 6))) :: (26, (Integer_Type ((*Pointer_Range*) 4))) :: (35, Integer) :: (46, (Integer_Type ((*Pointer_Range*) 4))) :: (49, (Integer_Type ((*Pointer_Range*) 4))) :: (31, (Array_Type ((*Vector*) 6))) :: (52, Integer) :: (43, Integer) :: (25, (Integer_Type ((*Pointer_Range*) 4))) :: (34, Integer) :: (28, Integer) :: (45, (Integer_Type ((*Pointer_Range*) 4))) :: (27, (Integer_Type ((*Pointer_Range*) 4))) :: (48, (Integer_Type ((*Pointer_Range*) 4))) :: (30, Integer) :: (51, (Integer_Type ((*Pointer_Range*) 4))) :: (24, (Integer_Type ((*Pointer_Range*) 4))) :: (33, (Integer_Type ((*Pointer_Range*) 4))) :: (42, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((50, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (32, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (41, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (44, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)12)) :: (26, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (35, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (46, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (49, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)28)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)7)) :: (52, (sloc (*Line*)30 (*Col*)28 (*EndLine*)30 (*EndCol*)28)) :: (43, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (25, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)28)) :: (34, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (28, (sloc (*Line*)17 (*Col*)28 (*EndLine*)17 (*EndCol*)28)) :: (45, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (27, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (48, (sloc (*Line*)30 (*Col*)7 (*EndLine*)30 (*EndCol*)13)) :: (30, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)16)) :: (51, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)13)) :: (33, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (42, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Pointer", "ada://variable/The_Stack_Praxis-1:9/Pointer+9:4")) :: (7, ("S", "ada://variable/The_Stack_Praxis-1:9/S+8:4")) :: (9, ("X", "ada://parameter/The_Stack_Praxis-1:9/Push-5:14/X-5:19")) :: (12, ("X", "ada://parameter/The_Stack_Praxis-1:9/Pop-9:14/X-9:18")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Pop", "ada://procedure_body/The_Stack_Praxis-1:9/Pop-9:14")) :: (1, ("Push", "ada://procedure_body/The_Stack_Praxis-1:9/Push-5:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("The_Stack_Praxis", "ada://package_body/The_Stack_Praxis-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Index_Range", "ada://subtype/The_Stack_Praxis-1:9/Index_Range+6:12")) :: (4, ("Pointer_Range", "ada://ordinary_type/The_Stack_Praxis-1:9/Pointer_Range+5:9")) :: (6, ("Vector", "ada://ordinary_type/The_Stack_Praxis-1:9/Vector+7:9")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *)) 
(D_Seq_Declaration_X 3
(D_Type_Declaration_X 4 (Integer_Type_Declaration_X 5 ((*Pointer_Range*) 4) (Range_X 0 100))) 
(D_Seq_Declaration_X 6
(D_Type_Declaration_X 7 (Subtype_Declaration_X 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (Range_X 1 100))) 
(D_Seq_Declaration_X 9
(D_Type_Declaration_X 10 (Array_Type_Declaration_X 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) 
(D_Seq_Declaration_X 12
(D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*S*) 7) (Array_Type ((*Vector*) 6)) None)) 
(D_Seq_Declaration_X 15
(D_Object_Declaration_X 16 (mkobject_declaration_x 17 ((*Pointer*) 8) (Integer_Type ((*Pointer_Range*) 4)) None)) 
(D_Seq_Declaration_X 18
(D_Procedure_Body_X 19 
  (mkprocedure_body_x 20
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 21 ((*X*) 9) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 22
      (S_Assignment_X 23 (E_Identifier_X 24 ((*Pointer*) 8) (nil)) (E_Binary_Operation_X 25 Plus (E_Name_X 26 (E_Identifier_X 27 ((*Pointer*) 8) (nil))) (E_Literal_X 28 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_Assignment_X 29 (E_Indexed_Component_X 30 (E_Identifier_X 31 ((*S*) 7) (nil)) (E_Name_X 32 (E_Identifier_X 33 ((*Pointer*) 8) (Do_Range_Check :: nil))) (nil)) (E_Name_X 34 (E_Identifier_X 35 ((*X*) 9) (nil)))))
  )
) 
(D_Procedure_Body_X 36 
  (mkprocedure_body_x 37
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 38 ((*X*) 12) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 39
      (S_Assignment_X 40 (E_Identifier_X 41 ((*X*) 12) (nil)) (E_Name_X 42 (E_Indexed_Component_X 43 (E_Identifier_X 44 ((*S*) 7) (nil)) (E_Name_X 45 (E_Identifier_X 46 ((*Pointer*) 8) (Do_Range_Check :: nil))) (nil)))) 
      (S_Assignment_X 47 (E_Identifier_X 48 ((*Pointer*) 8) (nil)) (E_Binary_Operation_X 49 Minus (E_Name_X 50 (E_Identifier_X 51 ((*Pointer*) 8) (nil))) (E_Literal_X 52 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)))
  )
)))))))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Pointer*) 8), (In_Out, (Integer_Type ((*Pointer_Range*) 4)))) :: (((*S*) 7), (In_Out, (Array_Type ((*Vector*) 6)))) :: (((*X*) 9), (In, Integer)) :: (((*X*) 12), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocedure_body_x 20
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 21 ((*X*) 9) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 22
    (S_Assignment_X 23 (E_Identifier_X 24 ((*Pointer*) 8) (nil)) (E_Binary_Operation_X 25 Plus (E_Name_X 26 (E_Identifier_X 27 ((*Pointer*) 8) (nil))) (E_Literal_X 28 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
    (S_Assignment_X 29 (E_Indexed_Component_X 30 (E_Identifier_X 31 ((*S*) 7) (nil)) (E_Name_X 32 (E_Identifier_X 33 ((*Pointer*) 8) (Do_Range_Check :: nil))) (nil)) (E_Name_X 34 (E_Identifier_X 35 ((*X*) 9) (nil)))))
))) :: (((*Pop*) 2), (0, (mkprocedure_body_x 37
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 38 ((*X*) 12) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 39
    (S_Assignment_X 40 (E_Identifier_X 41 ((*X*) 12) (nil)) (E_Name_X 42 (E_Indexed_Component_X 43 (E_Identifier_X 44 ((*S*) 7) (nil)) (E_Name_X 45 (E_Identifier_X 46 ((*Pointer*) 8) (Do_Range_Check :: nil))) (nil)))) 
    (S_Assignment_X 47 (E_Identifier_X 48 ((*Pointer*) 8) (nil)) (E_Binary_Operation_X 49 Minus (E_Name_X 50 (E_Identifier_X 51 ((*Pointer*) 8) (nil))) (E_Literal_X 52 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Range*) 5), (Subtype_Declaration_X 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (Range_X 1 100))) :: (((*Pointer_Range*) 4), (Integer_Type_Declaration_X 5 ((*Pointer_Range*) 4) (Range_X 0 100))) :: (((*Vector*) 6), (Array_Type_Declaration_X 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((50, (Integer_Type ((*Pointer_Range*) 4))) :: (32, (Integer_Type ((*Pointer_Range*) 4))) :: (41, Integer) :: (44, (Array_Type ((*Vector*) 6))) :: (26, (Integer_Type ((*Pointer_Range*) 4))) :: (35, Integer) :: (46, (Integer_Type ((*Pointer_Range*) 4))) :: (49, (Integer_Type ((*Pointer_Range*) 4))) :: (31, (Array_Type ((*Vector*) 6))) :: (52, Integer) :: (43, Integer) :: (25, (Integer_Type ((*Pointer_Range*) 4))) :: (34, Integer) :: (28, Integer) :: (45, (Integer_Type ((*Pointer_Range*) 4))) :: (27, (Integer_Type ((*Pointer_Range*) 4))) :: (48, (Integer_Type ((*Pointer_Range*) 4))) :: (30, Integer) :: (51, (Integer_Type ((*Pointer_Range*) 4))) :: (24, (Integer_Type ((*Pointer_Range*) 4))) :: (33, (Integer_Type ((*Pointer_Range*) 4))) :: (42, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((50, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (32, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (41, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (44, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)12)) :: (26, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (35, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (46, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (49, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)28)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)7)) :: (52, (sloc (*Line*)30 (*Col*)28 (*EndLine*)30 (*EndCol*)28)) :: (43, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (25, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)28)) :: (34, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (28, (sloc (*Line*)17 (*Col*)28 (*EndLine*)17 (*EndCol*)28)) :: (45, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (27, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (48, (sloc (*Line*)30 (*Col*)7 (*EndLine*)30 (*EndCol*)13)) :: (30, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)16)) :: (51, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)13)) :: (33, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (42, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Pointer", "ada://variable/The_Stack_Praxis-1:9/Pointer+9:4")) :: (7, ("S", "ada://variable/The_Stack_Praxis-1:9/S+8:4")) :: (9, ("X", "ada://parameter/The_Stack_Praxis-1:9/Push-5:14/X-5:19")) :: (12, ("X", "ada://parameter/The_Stack_Praxis-1:9/Pop-9:14/X-9:18")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Pop", "ada://procedure_body/The_Stack_Praxis-1:9/Pop-9:14")) :: (1, ("Push", "ada://procedure_body/The_Stack_Praxis-1:9/Push-5:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("The_Stack_Praxis", "ada://package_body/The_Stack_Praxis-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Index_Range", "ada://subtype/The_Stack_Praxis-1:9/Index_Range+6:12")) :: (4, ("Pointer_Range", "ada://ordinary_type/The_Stack_Praxis-1:9/Pointer_Range+5:9")) :: (6, ("Vector", "ada://ordinary_type/The_Stack_Praxis-1:9/Vector+7:9")) :: nil)
))
).

