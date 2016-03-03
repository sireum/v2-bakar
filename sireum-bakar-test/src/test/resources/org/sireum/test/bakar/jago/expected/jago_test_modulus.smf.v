Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Subtype_Declaration 4 ((*U64*) 1) Integer (Range 0 2147483647))) 
(D_Seq_Declaration 5
(D_Type_Declaration 6 (Subtype_Declaration 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (Range 0 7))) 
(D_Seq_Declaration 8
(D_Type_Declaration 9 (Subtype_Declaration 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (Range 0 8))) 
(D_Seq_Declaration 11
(D_Type_Declaration 12 (Array_Type_Declaration 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) 
D_Null_Declaration (* Undefined Declarations ! *))))) 
(D_Procedure_Body 14 
  (mkprocedure_body 15
    (* = = = Procedure Name = = = *)
    ((*Mod_Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
    (mkparameter_specification 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
    (mkparameter_specification 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 19 (E_Indexed_Component 20 (E_Identifier 21 ((*KS*) 9) ) (E_Name 22 (E_Identifier 23 ((*I*) 8) )) ) (E_Name 24 (E_Indexed_Component 25 (E_Identifier 26 ((*KS*) 9) ) (E_Binary_Operation 27 Modulus (E_Binary_Operation 28 Plus (E_Name 29 (E_Identifier 30 ((*R*) 7) )) (E_Name 31 (E_Identifier 32 ((*I*) 8) )) ) (E_Binary_Operation 33 Plus (E_Literal 34 (Integer_Literal 8) ) (E_Literal 35 (Integer_Literal 1) ) ) ) )))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 8), (In, (Subtype ((*Injection_Range*) 2)))) :: (((*R*) 7), (In, (Subtype ((*U64*) 1)))) :: (((*KS*) 9), (In_Out, (Array_Type ((*U64_Seq_9*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Mod_Test*) 5), (0, (mkprocedure_body 15
  (* = = = Procedure Name = = = *)
  ((*Mod_Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
  (mkparameter_specification 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
  (mkparameter_specification 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 19 (E_Indexed_Component 20 (E_Identifier 21 ((*KS*) 9) ) (E_Name 22 (E_Identifier 23 ((*I*) 8) )) ) (E_Name 24 (E_Indexed_Component 25 (E_Identifier 26 ((*KS*) 9) ) (E_Binary_Operation 27 Modulus (E_Binary_Operation 28 Plus (E_Name 29 (E_Identifier 30 ((*R*) 7) )) (E_Name 31 (E_Identifier 32 ((*I*) 8) )) ) (E_Binary_Operation 33 Plus (E_Literal 34 (Integer_Literal 8) ) (E_Literal 35 (Integer_Literal 1) ) ) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Injection_Range*) 2), (Subtype_Declaration 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (Range 0 7))) :: (((*I9*) 3), (Subtype_Declaration 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (Range 0 8))) :: (((*U64_Seq_9*) 4), (Array_Type_Declaration 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) :: (((*U64*) 1), (Subtype_Declaration 4 ((*U64*) 1) Integer (Range 0 2147483647))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Subtype ((*Injection_Range*) 2))) :: (32, (Subtype ((*Injection_Range*) 2))) :: (35, Integer) :: (26, (Array_Type ((*U64_Seq_9*) 4))) :: (29, (Subtype ((*U64*) 1))) :: (20, (Subtype ((*U64*) 1))) :: (22, (Subtype ((*Injection_Range*) 2))) :: (31, (Subtype ((*Injection_Range*) 2))) :: (34, Integer) :: (25, (Subtype ((*U64*) 1))) :: (28, Integer) :: (27, Integer) :: (21, (Array_Type ((*U64_Seq_9*) 4))) :: (30, (Subtype ((*U64*) 1))) :: (33, Integer) :: (24, (Subtype ((*U64*) 1))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (32, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (35, (sloc (*Line*)7 (*Col*)39 (*EndLine*)7 (*EndCol*)39)) :: (26, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)19)) :: (29, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (20, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)13)) :: (22, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (31, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (34, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)35)) :: (25, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: (28, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)27)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)40)) :: (21, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)9)) :: (30, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (33, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)39)) :: (24, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("I", "ada://parameter/Modulus-1:9/Mod_Test-9:14/I-9:36")) :: (7, ("R", "ada://parameter/Modulus-1:9/Mod_Test-9:14/R-9:24")) :: (9, ("KS", "ada://parameter/Modulus-1:9/Mod_Test-9:14/KS-9:57")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Mod_Test", "ada://procedure_body/Modulus-1:9/Mod_Test-9:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("Modulus", "ada://package_body/Modulus-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Injection_Range", "ada://subtype/Modulus-1:9/Injection_Range-4:12")) :: (4, ("U64_Seq_9", "ada://ordinary_type/Modulus-1:9/U64_Seq_9-7:9")) :: (1, ("U64", "ada://subtype/Modulus-1:9/U64-3:12")) :: (3, ("I9", "ada://subtype/Modulus-1:9/I9-5:12")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Subtype_Declaration_X 4 ((*U64*) 1) Integer (Range_X 0 2147483647))) 
(D_Seq_Declaration_X 5
(D_Type_Declaration_X 6 (Subtype_Declaration_X 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (Range_X 0 7))) 
(D_Seq_Declaration_X 8
(D_Type_Declaration_X 9 (Subtype_Declaration_X 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (Range_X 0 8))) 
(D_Seq_Declaration_X 11
(D_Type_Declaration_X 12 (Array_Type_Declaration_X 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) 
D_Null_Declaration_X (* Undefined Declarations ! *))))) 
(D_Procedure_Body_X 14 
  (mkprocedure_body_x 15
    (* = = = Procedure Name = = = *)
    ((*Mod_Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
    (mkparameter_specification_x 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
    (mkparameter_specification_x 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 19 (E_Indexed_Component_X 20 (E_Identifier_X 21 ((*KS*) 9) (nil)) (E_Name_X 22 (E_Identifier_X 23 ((*I*) 8) (nil))) (nil)) (E_Name_X 24 (E_Indexed_Component_X 25 (E_Identifier_X 26 ((*KS*) 9) (nil)) (E_Binary_Operation_X 27 Modulus (E_Binary_Operation_X 28 Plus (E_Name_X 29 (E_Identifier_X 30 ((*R*) 7) (nil))) (E_Name_X 31 (E_Identifier_X 32 ((*I*) 8) (nil))) (Do_Overflow_Check :: nil) nil) (E_Binary_Operation_X 33 Plus (E_Literal_X 34 (Integer_Literal 8) (nil) nil) (E_Literal_X 35 (Integer_Literal 1) (nil) nil) (nil) nil) (Do_Division_Check :: nil) nil) (nil))))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 8), (In, (Subtype ((*Injection_Range*) 2)))) :: (((*R*) 7), (In, (Subtype ((*U64*) 1)))) :: (((*KS*) 9), (In_Out, (Array_Type ((*U64_Seq_9*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Mod_Test*) 5), (0, (mkprocedure_body_x 15
  (* = = = Procedure Name = = = *)
  ((*Mod_Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
  (mkparameter_specification_x 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
  (mkparameter_specification_x 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 19 (E_Indexed_Component_X 20 (E_Identifier_X 21 ((*KS*) 9) (nil)) (E_Name_X 22 (E_Identifier_X 23 ((*I*) 8) (nil))) (nil)) (E_Name_X 24 (E_Indexed_Component_X 25 (E_Identifier_X 26 ((*KS*) 9) (nil)) (E_Binary_Operation_X 27 Modulus (E_Binary_Operation_X 28 Plus (E_Name_X 29 (E_Identifier_X 30 ((*R*) 7) (nil))) (E_Name_X 31 (E_Identifier_X 32 ((*I*) 8) (nil))) (Do_Overflow_Check :: nil) nil) (E_Binary_Operation_X 33 Plus (E_Literal_X 34 (Integer_Literal 8) (nil) nil) (E_Literal_X 35 (Integer_Literal 1) (nil) nil) (nil) nil) (Do_Division_Check :: nil) nil) (nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Injection_Range*) 2), (Subtype_Declaration_X 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (Range_X 0 7))) :: (((*I9*) 3), (Subtype_Declaration_X 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (Range_X 0 8))) :: (((*U64_Seq_9*) 4), (Array_Type_Declaration_X 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) :: (((*U64*) 1), (Subtype_Declaration_X 4 ((*U64*) 1) Integer (Range_X 0 2147483647))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Subtype ((*Injection_Range*) 2))) :: (32, (Subtype ((*Injection_Range*) 2))) :: (35, Integer) :: (26, (Array_Type ((*U64_Seq_9*) 4))) :: (29, (Subtype ((*U64*) 1))) :: (20, (Subtype ((*U64*) 1))) :: (22, (Subtype ((*Injection_Range*) 2))) :: (31, (Subtype ((*Injection_Range*) 2))) :: (34, Integer) :: (25, (Subtype ((*U64*) 1))) :: (28, Integer) :: (27, Integer) :: (21, (Array_Type ((*U64_Seq_9*) 4))) :: (30, (Subtype ((*U64*) 1))) :: (33, Integer) :: (24, (Subtype ((*U64*) 1))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (32, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (35, (sloc (*Line*)7 (*Col*)39 (*EndLine*)7 (*EndCol*)39)) :: (26, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)19)) :: (29, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (20, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)13)) :: (22, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (31, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (34, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)35)) :: (25, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: (28, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)27)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)40)) :: (21, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)9)) :: (30, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (33, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)39)) :: (24, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("I", "ada://parameter/Modulus-1:9/Mod_Test-9:14/I-9:36")) :: (7, ("R", "ada://parameter/Modulus-1:9/Mod_Test-9:14/R-9:24")) :: (9, ("KS", "ada://parameter/Modulus-1:9/Mod_Test-9:14/KS-9:57")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Mod_Test", "ada://procedure_body/Modulus-1:9/Mod_Test-9:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("Modulus", "ada://package_body/Modulus-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Injection_Range", "ada://subtype/Modulus-1:9/Injection_Range-4:12")) :: (4, ("U64_Seq_9", "ada://ordinary_type/Modulus-1:9/U64_Seq_9-7:9")) :: (1, ("U64", "ada://subtype/Modulus-1:9/U64-3:12")) :: (3, ("I9", "ada://subtype/Modulus-1:9/I9-5:12")) :: nil)
))
).

