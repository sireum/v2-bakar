Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Integer_Type_Declaration 4 ((*Index*) 1) (Range 1 10))) 
(D_Seq_Declaration 5
(D_Type_Declaration 6 (Array_Type_Declaration 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) 
(D_Seq_Declaration 8
(D_Object_Declaration 9 (mkobject_declaration 10 ((*V*) 3) (Array_Type ((*Vector*) 2)) None)) 
D_Null_Declaration (* Undefined Declarations ! *)))) 
(D_Procedure_Body 11 
  (mkprocedure_body 12
    (* = = = Procedure Name = = = *)
    ((*dummy*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 14 (E_Indexed_Component 15 (E_Identifier 16 ((*V*) 3) ) (E_Name 17 (E_Identifier 18 ((*I*) 6) )) ) (E_Binary_Operation 19 Plus (E_Name 20 (E_Indexed_Component 21 (E_Identifier 22 ((*V*) 3) ) (E_Name 23 (E_Identifier 24 ((*I*) 6) )) )) (E_Literal 25 (Integer_Literal 3) ) ))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*V*) 3), (In_Out, (Array_Type ((*Vector*) 2)))) :: (((*I*) 6), (In, (Integer_Type ((*Index*) 1)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*dummy*) 4), (0, (mkprocedure_body 12
  (* = = = Procedure Name = = = *)
  ((*dummy*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 14 (E_Indexed_Component 15 (E_Identifier 16 ((*V*) 3) ) (E_Name 17 (E_Identifier 18 ((*I*) 6) )) ) (E_Binary_Operation 19 Plus (E_Name 20 (E_Indexed_Component 21 (E_Identifier 22 ((*V*) 3) ) (E_Name 23 (E_Identifier 24 ((*I*) 6) )) )) (E_Literal 25 (Integer_Literal 3) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index*) 1), (Integer_Type_Declaration 4 ((*Index*) 1) (Range 1 10))) :: (((*Vector*) 2), (Array_Type_Declaration 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Integer_Type ((*Index*) 1))) :: (17, (Integer_Type ((*Index*) 1))) :: (20, Integer) :: (22, (Array_Type ((*Vector*) 2))) :: (25, Integer) :: (16, (Array_Type ((*Vector*) 2))) :: (19, Integer) :: (18, (Integer_Type ((*Index*) 1))) :: (21, Integer) :: (24, (Integer_Type ((*Index*) 1))) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (17, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (20, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (22, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: (25, (sloc (*Line*)8 (*Col*)20 (*EndLine*)8 (*EndCol*)20)) :: (16, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)5)) :: (19, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)20)) :: (18, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (21, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (24, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (15, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)8)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((3, ("V", "ada://variable/QuantifierTest-1:9/V-9:3")) :: (6, ("I", "ada://parameter/QuantifierTest-1:9/dummy-11:13/I-11:19")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("dummy", "ada://procedure_body/QuantifierTest-1:9/dummy-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("QuantifierTest", "ada://package_body/QuantifierTest-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Vector", "ada://ordinary_type/QuantifierTest-1:9/Vector-7:8")) :: (1, ("Index", "ada://ordinary_type/QuantifierTest-1:9/Index-6:8")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Integer_Type_Declaration_X 4 ((*Index*) 1) (Range_X 1 10))) 
(D_Seq_Declaration_X 5
(D_Type_Declaration_X 6 (Array_Type_Declaration_X 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) 
(D_Seq_Declaration_X 8
(D_Object_Declaration_X 9 (mkobject_declaration_x 10 ((*V*) 3) (Array_Type ((*Vector*) 2)) None)) 
D_Null_Declaration_X (* Undefined Declarations ! *)))) 
(D_Procedure_Body_X 11 
  (mkprocedure_body_x 12
    (* = = = Procedure Name = = = *)
    ((*dummy*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 14 (E_Indexed_Component_X 15 (E_Identifier_X 16 ((*V*) 3) (nil)) (E_Name_X 17 (E_Identifier_X 18 ((*I*) 6) (nil))) (nil)) (E_Binary_Operation_X 19 Plus (E_Name_X 20 (E_Indexed_Component_X 21 (E_Identifier_X 22 ((*V*) 3) (nil)) (E_Name_X 23 (E_Identifier_X 24 ((*I*) 6) (nil))) (nil))) (E_Literal_X 25 (Integer_Literal 3) (nil) nil) (Do_Overflow_Check :: nil) nil))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*V*) 3), (In_Out, (Array_Type ((*Vector*) 2)))) :: (((*I*) 6), (In, (Integer_Type ((*Index*) 1)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*dummy*) 4), (0, (mkprocedure_body_x 12
  (* = = = Procedure Name = = = *)
  ((*dummy*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 14 (E_Indexed_Component_X 15 (E_Identifier_X 16 ((*V*) 3) (nil)) (E_Name_X 17 (E_Identifier_X 18 ((*I*) 6) (nil))) (nil)) (E_Binary_Operation_X 19 Plus (E_Name_X 20 (E_Indexed_Component_X 21 (E_Identifier_X 22 ((*V*) 3) (nil)) (E_Name_X 23 (E_Identifier_X 24 ((*I*) 6) (nil))) (nil))) (E_Literal_X 25 (Integer_Literal 3) (nil) nil) (Do_Overflow_Check :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index*) 1), (Integer_Type_Declaration_X 4 ((*Index*) 1) (Range_X 1 10))) :: (((*Vector*) 2), (Array_Type_Declaration_X 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Integer_Type ((*Index*) 1))) :: (17, (Integer_Type ((*Index*) 1))) :: (20, Integer) :: (22, (Array_Type ((*Vector*) 2))) :: (25, Integer) :: (16, (Array_Type ((*Vector*) 2))) :: (19, Integer) :: (18, (Integer_Type ((*Index*) 1))) :: (21, Integer) :: (24, (Integer_Type ((*Index*) 1))) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (17, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (20, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (22, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: (25, (sloc (*Line*)8 (*Col*)20 (*EndLine*)8 (*EndCol*)20)) :: (16, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)5)) :: (19, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)20)) :: (18, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (21, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (24, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (15, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)8)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((3, ("V", "ada://variable/QuantifierTest-1:9/V-9:3")) :: (6, ("I", "ada://parameter/QuantifierTest-1:9/dummy-11:13/I-11:19")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("dummy", "ada://procedure_body/QuantifierTest-1:9/dummy-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("QuantifierTest", "ada://package_body/QuantifierTest-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Vector", "ada://ordinary_type/QuantifierTest-1:9/Vector-7:8")) :: (1, ("Index", "ada://ordinary_type/QuantifierTest-1:9/Index-6:8")) :: nil)
))
).

