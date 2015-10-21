Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Integer_Type_Declaration 4 ((*T*) 1) (Range 0 10))) 
(D_Seq_Declaration 5
(D_Type_Declaration 6 (Subtype_Declaration 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (Range 1 10))) 
(D_Seq_Declaration 8
(D_Type_Declaration 9 (Array_Type_Declaration 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) 
D_Null_Declaration (* Undefined Declarations ! *)))) 
(D_Procedure_Body 11 
  (mkprocedure_body 12
    (* = = = Procedure Name = = = *)
    ((*Search*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
    (mkparameter_specification 14 ((*I*) 7) Integer In) :: 
    (mkparameter_specification 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 16
  (D_Object_Declaration 17 (mkobject_declaration 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
  (D_Seq_Declaration 19
  (D_Object_Declaration 20 (mkobject_declaration 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
  (D_Object_Declaration 22 (mkobject_declaration 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 24
      (S_Assignment 25 (E_Identifier 26 ((*Left*) 9) ) (E_Literal 27 (Integer_Literal 1) )) 
      (S_Sequence 28
      (S_Assignment 29 (E_Identifier 30 ((*Right*) 10) ) (E_Literal 31 (Integer_Literal 10) )) 
      (S_Sequence 32
      (S_Assignment 33 (E_Identifier 34 ((*Result*) 8) ) (E_Literal 35 (Integer_Literal 0) )) 
      (S_Sequence 36
      (S_If 37 (E_Binary_Operation 38 Or (E_Binary_Operation 39 Greater_Than (E_Name 40 (E_Indexed_Component 41 (E_Identifier 42 ((*A*) 6) ) (E_Binary_Operation 43 Plus (E_Name 44 (E_Identifier 45 ((*Left*) 9) )) (E_Literal 46 (Integer_Literal 1) ) ) )) (E_Name 47 (E_Identifier 48 ((*I*) 7) )) ) (E_Binary_Operation 49 Less_Than (E_Name 50 (E_Indexed_Component 51 (E_Identifier 52 ((*A*) 6) ) (E_Name 53 (E_Identifier 54 ((*Right*) 10) )) )) (E_Name 55 (E_Identifier 56 ((*I*) 7) )) ) )
        (S_Assignment 57 (E_Identifier 58 ((*Result*) 8) ) (E_Literal 59 (Integer_Literal 0) ))
        S_Null
      ) 
      (S_While_Loop 60 (E_Binary_Operation 61 Less_Than_Or_Equal (E_Name 62 (E_Identifier 63 ((*Left*) 9) )) (E_Name 64 (E_Identifier 65 ((*Right*) 10) )) )
        (S_Sequence 66
        (S_Assignment 67 (E_Identifier 68 ((*Med*) 11) ) (E_Binary_Operation 69 Plus (E_Name 70 (E_Identifier 71 ((*Left*) 9) )) (E_Binary_Operation 72 Divide (E_Binary_Operation 73 Minus (E_Name 74 (E_Identifier 75 ((*Right*) 10) )) (E_Name 76 (E_Identifier 77 ((*Left*) 9) )) ) (E_Literal 78 (Integer_Literal 2) ) ) )) 
        (S_If 79 (E_Binary_Operation 80 Less_Than (E_Name 81 (E_Indexed_Component 82 (E_Identifier 83 ((*A*) 6) ) (E_Name 84 (E_Identifier 85 ((*Med*) 11) )) )) (E_Name 86 (E_Identifier 87 ((*I*) 7) )) )
          (S_Assignment 88 (E_Identifier 89 ((*Left*) 9) ) (E_Binary_Operation 90 Plus (E_Name 91 (E_Identifier 92 ((*Med*) 11) )) (E_Literal 93 (Integer_Literal 1) ) ))
          (S_If 94 (E_Binary_Operation 95 Greater_Than (E_Name 96 (E_Indexed_Component 97 (E_Identifier 98 ((*A*) 6) ) (E_Name 99 (E_Identifier 100 ((*Med*) 11) )) )) (E_Name 101 (E_Identifier 102 ((*I*) 7) )) )
            (S_Assignment 103 (E_Identifier 104 ((*Right*) 10) ) (E_Binary_Operation 105 Minus (E_Name 106 (E_Identifier 107 ((*Med*) 11) )) (E_Literal 108 (Integer_Literal 1) ) ))
            (S_Assignment 109 (E_Identifier 110 ((*Result*) 8) ) (E_Name 111 (E_Identifier 112 ((*Med*) 11) )))
          )
        ))
      )))))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Result*) 8), (Out, (Integer_Type ((*T*) 1)))) :: (((*Left*) 9), (In_Out, (Subtype ((*U*) 2)))) :: (((*I*) 7), (In, Integer)) :: (((*A*) 6), (In, (Array_Type ((*Ar*) 3)))) :: (((*Right*) 10), (In_Out, (Subtype ((*U*) 2)))) :: (((*Med*) 11), (In_Out, (Subtype ((*U*) 2)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 4), (0, (mkprocedure_body 12
  (* = = = Procedure Name = = = *)
  ((*Search*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
  (mkparameter_specification 14 ((*I*) 7) Integer In) :: 
  (mkparameter_specification 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 16
(D_Object_Declaration 17 (mkobject_declaration 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
(D_Seq_Declaration 19
(D_Object_Declaration 20 (mkobject_declaration 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
(D_Object_Declaration 22 (mkobject_declaration 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 24
    (S_Assignment 25 (E_Identifier 26 ((*Left*) 9) ) (E_Literal 27 (Integer_Literal 1) )) 
    (S_Sequence 28
    (S_Assignment 29 (E_Identifier 30 ((*Right*) 10) ) (E_Literal 31 (Integer_Literal 10) )) 
    (S_Sequence 32
    (S_Assignment 33 (E_Identifier 34 ((*Result*) 8) ) (E_Literal 35 (Integer_Literal 0) )) 
    (S_Sequence 36
    (S_If 37 (E_Binary_Operation 38 Or (E_Binary_Operation 39 Greater_Than (E_Name 40 (E_Indexed_Component 41 (E_Identifier 42 ((*A*) 6) ) (E_Binary_Operation 43 Plus (E_Name 44 (E_Identifier 45 ((*Left*) 9) )) (E_Literal 46 (Integer_Literal 1) ) ) )) (E_Name 47 (E_Identifier 48 ((*I*) 7) )) ) (E_Binary_Operation 49 Less_Than (E_Name 50 (E_Indexed_Component 51 (E_Identifier 52 ((*A*) 6) ) (E_Name 53 (E_Identifier 54 ((*Right*) 10) )) )) (E_Name 55 (E_Identifier 56 ((*I*) 7) )) ) )
      (S_Assignment 57 (E_Identifier 58 ((*Result*) 8) ) (E_Literal 59 (Integer_Literal 0) ))
      S_Null
    ) 
    (S_While_Loop 60 (E_Binary_Operation 61 Less_Than_Or_Equal (E_Name 62 (E_Identifier 63 ((*Left*) 9) )) (E_Name 64 (E_Identifier 65 ((*Right*) 10) )) )
      (S_Sequence 66
      (S_Assignment 67 (E_Identifier 68 ((*Med*) 11) ) (E_Binary_Operation 69 Plus (E_Name 70 (E_Identifier 71 ((*Left*) 9) )) (E_Binary_Operation 72 Divide (E_Binary_Operation 73 Minus (E_Name 74 (E_Identifier 75 ((*Right*) 10) )) (E_Name 76 (E_Identifier 77 ((*Left*) 9) )) ) (E_Literal 78 (Integer_Literal 2) ) ) )) 
      (S_If 79 (E_Binary_Operation 80 Less_Than (E_Name 81 (E_Indexed_Component 82 (E_Identifier 83 ((*A*) 6) ) (E_Name 84 (E_Identifier 85 ((*Med*) 11) )) )) (E_Name 86 (E_Identifier 87 ((*I*) 7) )) )
        (S_Assignment 88 (E_Identifier 89 ((*Left*) 9) ) (E_Binary_Operation 90 Plus (E_Name 91 (E_Identifier 92 ((*Med*) 11) )) (E_Literal 93 (Integer_Literal 1) ) ))
        (S_If 94 (E_Binary_Operation 95 Greater_Than (E_Name 96 (E_Indexed_Component 97 (E_Identifier 98 ((*A*) 6) ) (E_Name 99 (E_Identifier 100 ((*Med*) 11) )) )) (E_Name 101 (E_Identifier 102 ((*I*) 7) )) )
          (S_Assignment 103 (E_Identifier 104 ((*Right*) 10) ) (E_Binary_Operation 105 Minus (E_Name 106 (E_Identifier 107 ((*Med*) 11) )) (E_Literal 108 (Integer_Literal 1) ) ))
          (S_Assignment 109 (E_Identifier 110 ((*Result*) 8) ) (E_Name 111 (E_Identifier 112 ((*Med*) 11) )))
        )
      ))
    )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 3), (Array_Type_Declaration 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) :: (((*U*) 2), (Subtype_Declaration 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (Range 1 10))) :: (((*T*) 1), (Integer_Type_Declaration 4 ((*T*) 1) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, (Subtype ((*U*) 2))) :: (101, Integer) :: (83, (Array_Type ((*Ar*) 3))) :: (110, (Integer_Type ((*T*) 1))) :: (104, (Subtype ((*U*) 2))) :: (95, Boolean) :: (86, Integer) :: (77, (Subtype ((*U*) 2))) :: (50, Integer) :: (41, Integer) :: (59, Integer) :: (68, (Subtype ((*U*) 2))) :: (53, (Subtype ((*U*) 2))) :: (62, (Subtype ((*U*) 2))) :: (35, Integer) :: (44, (Subtype ((*U*) 2))) :: (26, (Subtype ((*U*) 2))) :: (89, (Subtype ((*U*) 2))) :: (80, Boolean) :: (98, (Array_Type ((*Ar*) 3))) :: (71, (Subtype ((*U*) 2))) :: (107, (Subtype ((*U*) 2))) :: (74, (Subtype ((*U*) 2))) :: (56, Integer) :: (47, Integer) :: (38, Boolean) :: (65, (Subtype ((*U*) 2))) :: (106, (Subtype ((*U*) 2))) :: (46, Integer) :: (100, (Subtype ((*U*) 2))) :: (91, (Subtype ((*U*) 2))) :: (82, Integer) :: (55, Integer) :: (64, (Subtype ((*U*) 2))) :: (73, (Integer_Type ((*T*) 1))) :: (58, (Integer_Type ((*T*) 1))) :: (85, (Subtype ((*U*) 2))) :: (49, Boolean) :: (40, Integer) :: (31, Integer) :: (76, (Subtype ((*U*) 2))) :: (112, (Subtype ((*U*) 2))) :: (97, Integer) :: (52, (Array_Type ((*Ar*) 3))) :: (43, (Integer_Type ((*T*) 1))) :: (70, (Subtype ((*U*) 2))) :: (34, (Integer_Type ((*T*) 1))) :: (61, Boolean) :: (87, Integer) :: (96, Integer) :: (105, (Integer_Type ((*T*) 1))) :: (69, (Integer_Type ((*T*) 1))) :: (78, Integer) :: (99, (Subtype ((*U*) 2))) :: (90, (Integer_Type ((*T*) 1))) :: (63, (Subtype ((*U*) 2))) :: (54, (Subtype ((*U*) 2))) :: (45, (Subtype ((*U*) 2))) :: (72, (Integer_Type ((*T*) 1))) :: (81, Integer) :: (108, Integer) :: (27, Integer) :: (48, Integer) :: (84, (Subtype ((*U*) 2))) :: (102, Integer) :: (93, Integer) :: (75, (Subtype ((*U*) 2))) :: (30, (Subtype ((*U*) 2))) :: (111, (Subtype ((*U*) 2))) :: (39, Boolean) :: (42, (Array_Type ((*Ar*) 3))) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (101, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (83, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)13)) :: (110, (sloc (*Line*)34 (*Col*)15 (*EndLine*)34 (*EndCol*)20)) :: (104, (sloc (*Line*)32 (*Col*)15 (*EndLine*)32 (*EndCol*)19)) :: (95, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)24)) :: (86, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (77, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (50, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: (41, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (59, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)20)) :: (68, (sloc (*Line*)26 (*Col*)10 (*EndLine*)26 (*EndCol*)12)) :: (53, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (62, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (35, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (44, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)10)) :: (89, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)16)) :: (80, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)23)) :: (98, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)14)) :: (71, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (107, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (74, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (56, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (47, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (38, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)45)) :: (65, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (106, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (46, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (100, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (91, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (82, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (55, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (64, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (73, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)36)) :: (58, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (85, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (49, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)45)) :: (40, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (31, (sloc (*Line*)17 (*Col*)16 (*EndLine*)17 (*EndCol*)17)) :: (76, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (112, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (97, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (52, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)33)) :: (43, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)18)) :: (70, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (34, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)25)) :: (87, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (96, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (105, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)30)) :: (69, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)41)) :: (78, (sloc (*Line*)26 (*Col*)41 (*EndLine*)26 (*EndCol*)41)) :: (99, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (90, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)27)) :: (63, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (54, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (45, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (72, (sloc (*Line*)26 (*Col*)24 (*EndLine*)26 (*EndCol*)41)) :: (81, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (108, (sloc (*Line*)32 (*Col*)30 (*EndLine*)32 (*EndCol*)30)) :: (27, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (48, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (84, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (102, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (93, (sloc (*Line*)29 (*Col*)27 (*EndLine*)29 (*EndCol*)27)) :: (75, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (30, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)11)) :: (111, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (39, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)23)) :: (42, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (51, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Result", "ada://parameter/Binary_Search-1:9/Search-16:14/Result-16:43")) :: (11, ("Med", "ada://variable/Binary_Search-1:9/Search-16:14/Med+14:7")) :: (7, ("I", "ada://parameter/Binary_Search-1:9/Search-16:14/I-16:30")) :: (10, ("Right", "ada://variable/Binary_Search-1:9/Search-16:14/Right+13:7")) :: (9, ("Left", "ada://variable/Binary_Search-1:9/Search-16:14/Left+12:7")) :: (6, ("A", "ada://parameter/Binary_Search-1:9/Search-16:14/A-16:22")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Search", "ada://procedure_body/Binary_Search-1:9/Search-16:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("Binary_Search", "ada://package_body/Binary_Search-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("U", "ada://subtype/Binary_Search-1:9/U-12:12")) :: (1, ("T", "ada://ordinary_type/Binary_Search-1:9/T-11:9")) :: (3, ("Ar", "ada://ordinary_type/Binary_Search-1:9/Ar-14:9")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Integer_Type_Declaration_X 4 ((*T*) 1) (Range_X 0 10))) 
(D_Seq_Declaration_X 5
(D_Type_Declaration_X 6 (Subtype_Declaration_X 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (Range_X 1 10))) 
(D_Seq_Declaration_X 8
(D_Type_Declaration_X 9 (Array_Type_Declaration_X 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) 
D_Null_Declaration_X (* Undefined Declarations ! *)))) 
(D_Procedure_Body_X 11 
  (mkprocedure_body_x 12
    (* = = = Procedure Name = = = *)
    ((*Search*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
    (mkparameter_specification_x 14 ((*I*) 7) Integer In) :: 
    (mkparameter_specification_x 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 16
  (D_Object_Declaration_X 17 (mkobject_declaration_x 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
  (D_Seq_Declaration_X 19
  (D_Object_Declaration_X 20 (mkobject_declaration_x 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
  (D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 24
      (S_Assignment_X 25 (E_Identifier_X 26 ((*Left*) 9) (nil)) (E_Literal_X 27 (Integer_Literal 1) (nil) nil)) 
      (S_Sequence_X 28
      (S_Assignment_X 29 (E_Identifier_X 30 ((*Right*) 10) (nil)) (E_Literal_X 31 (Integer_Literal 10) (nil) nil)) 
      (S_Sequence_X 32
      (S_Assignment_X 33 (E_Identifier_X 34 ((*Result*) 8) (nil)) (E_Literal_X 35 (Integer_Literal 0) (nil) nil)) 
      (S_Sequence_X 36
      (S_If_X 37 (E_Binary_Operation_X 38 Or (E_Binary_Operation_X 39 Greater_Than (E_Name_X 40 (E_Indexed_Component_X 41 (E_Identifier_X 42 ((*A*) 6) (nil)) (E_Binary_Operation_X 43 Plus (E_Name_X 44 (E_Identifier_X 45 ((*Left*) 9) (nil))) (E_Literal_X 46 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil))) (E_Name_X 47 (E_Identifier_X 48 ((*I*) 7) (nil))) (nil) nil) (E_Binary_Operation_X 49 Less_Than (E_Name_X 50 (E_Indexed_Component_X 51 (E_Identifier_X 52 ((*A*) 6) (nil)) (E_Name_X 53 (E_Identifier_X 54 ((*Right*) 10) (nil))) (nil))) (E_Name_X 55 (E_Identifier_X 56 ((*I*) 7) (nil))) (nil) nil) (nil) nil)
        (S_Assignment_X 57 (E_Identifier_X 58 ((*Result*) 8) (nil)) (E_Literal_X 59 (Integer_Literal 0) (nil) nil))
        S_Null_X
      ) 
      (S_While_Loop_X 60 (E_Binary_Operation_X 61 Less_Than_Or_Equal (E_Name_X 62 (E_Identifier_X 63 ((*Left*) 9) (nil))) (E_Name_X 64 (E_Identifier_X 65 ((*Right*) 10) (nil))) (nil) nil)
        (S_Sequence_X 66
        (S_Assignment_X 67 (E_Identifier_X 68 ((*Med*) 11) (nil)) (E_Binary_Operation_X 69 Plus (E_Name_X 70 (E_Identifier_X 71 ((*Left*) 9) (nil))) (E_Binary_Operation_X 72 Divide (E_Binary_Operation_X 73 Minus (E_Name_X 74 (E_Identifier_X 75 ((*Right*) 10) (nil))) (E_Name_X 76 (E_Identifier_X 77 ((*Left*) 9) (nil))) (nil) nil) (E_Literal_X 78 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil) (Do_Range_Check :: nil) nil)) 
        (S_If_X 79 (E_Binary_Operation_X 80 Less_Than (E_Name_X 81 (E_Indexed_Component_X 82 (E_Identifier_X 83 ((*A*) 6) (nil)) (E_Name_X 84 (E_Identifier_X 85 ((*Med*) 11) (nil))) (nil))) (E_Name_X 86 (E_Identifier_X 87 ((*I*) 7) (nil))) (nil) nil)
          (S_Assignment_X 88 (E_Identifier_X 89 ((*Left*) 9) (nil)) (E_Binary_Operation_X 90 Plus (E_Name_X 91 (E_Identifier_X 92 ((*Med*) 11) (nil))) (E_Literal_X 93 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
          (S_If_X 94 (E_Binary_Operation_X 95 Greater_Than (E_Name_X 96 (E_Indexed_Component_X 97 (E_Identifier_X 98 ((*A*) 6) (nil)) (E_Name_X 99 (E_Identifier_X 100 ((*Med*) 11) (nil))) (nil))) (E_Name_X 101 (E_Identifier_X 102 ((*I*) 7) (nil))) (nil) nil)
            (S_Assignment_X 103 (E_Identifier_X 104 ((*Right*) 10) (nil)) (E_Binary_Operation_X 105 Minus (E_Name_X 106 (E_Identifier_X 107 ((*Med*) 11) (nil))) (E_Literal_X 108 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
            (S_Assignment_X 109 (E_Identifier_X 110 ((*Result*) 8) (nil)) (E_Name_X 111 (E_Identifier_X 112 ((*Med*) 11) (nil))))
          )
        ))
      )))))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Result*) 8), (Out, (Integer_Type ((*T*) 1)))) :: (((*Left*) 9), (In_Out, (Subtype ((*U*) 2)))) :: (((*I*) 7), (In, Integer)) :: (((*A*) 6), (In, (Array_Type ((*Ar*) 3)))) :: (((*Right*) 10), (In_Out, (Subtype ((*U*) 2)))) :: (((*Med*) 11), (In_Out, (Subtype ((*U*) 2)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 4), (0, (mkprocedure_body_x 12
  (* = = = Procedure Name = = = *)
  ((*Search*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
  (mkparameter_specification_x 14 ((*I*) 7) Integer In) :: 
  (mkparameter_specification_x 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 16
(D_Object_Declaration_X 17 (mkobject_declaration_x 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
(D_Seq_Declaration_X 19
(D_Object_Declaration_X 20 (mkobject_declaration_x 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
(D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 24
    (S_Assignment_X 25 (E_Identifier_X 26 ((*Left*) 9) (nil)) (E_Literal_X 27 (Integer_Literal 1) (nil) nil)) 
    (S_Sequence_X 28
    (S_Assignment_X 29 (E_Identifier_X 30 ((*Right*) 10) (nil)) (E_Literal_X 31 (Integer_Literal 10) (nil) nil)) 
    (S_Sequence_X 32
    (S_Assignment_X 33 (E_Identifier_X 34 ((*Result*) 8) (nil)) (E_Literal_X 35 (Integer_Literal 0) (nil) nil)) 
    (S_Sequence_X 36
    (S_If_X 37 (E_Binary_Operation_X 38 Or (E_Binary_Operation_X 39 Greater_Than (E_Name_X 40 (E_Indexed_Component_X 41 (E_Identifier_X 42 ((*A*) 6) (nil)) (E_Binary_Operation_X 43 Plus (E_Name_X 44 (E_Identifier_X 45 ((*Left*) 9) (nil))) (E_Literal_X 46 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil))) (E_Name_X 47 (E_Identifier_X 48 ((*I*) 7) (nil))) (nil) nil) (E_Binary_Operation_X 49 Less_Than (E_Name_X 50 (E_Indexed_Component_X 51 (E_Identifier_X 52 ((*A*) 6) (nil)) (E_Name_X 53 (E_Identifier_X 54 ((*Right*) 10) (nil))) (nil))) (E_Name_X 55 (E_Identifier_X 56 ((*I*) 7) (nil))) (nil) nil) (nil) nil)
      (S_Assignment_X 57 (E_Identifier_X 58 ((*Result*) 8) (nil)) (E_Literal_X 59 (Integer_Literal 0) (nil) nil))
      S_Null_X
    ) 
    (S_While_Loop_X 60 (E_Binary_Operation_X 61 Less_Than_Or_Equal (E_Name_X 62 (E_Identifier_X 63 ((*Left*) 9) (nil))) (E_Name_X 64 (E_Identifier_X 65 ((*Right*) 10) (nil))) (nil) nil)
      (S_Sequence_X 66
      (S_Assignment_X 67 (E_Identifier_X 68 ((*Med*) 11) (nil)) (E_Binary_Operation_X 69 Plus (E_Name_X 70 (E_Identifier_X 71 ((*Left*) 9) (nil))) (E_Binary_Operation_X 72 Divide (E_Binary_Operation_X 73 Minus (E_Name_X 74 (E_Identifier_X 75 ((*Right*) 10) (nil))) (E_Name_X 76 (E_Identifier_X 77 ((*Left*) 9) (nil))) (nil) nil) (E_Literal_X 78 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_If_X 79 (E_Binary_Operation_X 80 Less_Than (E_Name_X 81 (E_Indexed_Component_X 82 (E_Identifier_X 83 ((*A*) 6) (nil)) (E_Name_X 84 (E_Identifier_X 85 ((*Med*) 11) (nil))) (nil))) (E_Name_X 86 (E_Identifier_X 87 ((*I*) 7) (nil))) (nil) nil)
        (S_Assignment_X 88 (E_Identifier_X 89 ((*Left*) 9) (nil)) (E_Binary_Operation_X 90 Plus (E_Name_X 91 (E_Identifier_X 92 ((*Med*) 11) (nil))) (E_Literal_X 93 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
        (S_If_X 94 (E_Binary_Operation_X 95 Greater_Than (E_Name_X 96 (E_Indexed_Component_X 97 (E_Identifier_X 98 ((*A*) 6) (nil)) (E_Name_X 99 (E_Identifier_X 100 ((*Med*) 11) (nil))) (nil))) (E_Name_X 101 (E_Identifier_X 102 ((*I*) 7) (nil))) (nil) nil)
          (S_Assignment_X 103 (E_Identifier_X 104 ((*Right*) 10) (nil)) (E_Binary_Operation_X 105 Minus (E_Name_X 106 (E_Identifier_X 107 ((*Med*) 11) (nil))) (E_Literal_X 108 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
          (S_Assignment_X 109 (E_Identifier_X 110 ((*Result*) 8) (nil)) (E_Name_X 111 (E_Identifier_X 112 ((*Med*) 11) (nil))))
        )
      ))
    )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 3), (Array_Type_Declaration_X 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) :: (((*U*) 2), (Subtype_Declaration_X 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (Range_X 1 10))) :: (((*T*) 1), (Integer_Type_Declaration_X 4 ((*T*) 1) (Range_X 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, (Subtype ((*U*) 2))) :: (101, Integer) :: (83, (Array_Type ((*Ar*) 3))) :: (110, (Integer_Type ((*T*) 1))) :: (104, (Subtype ((*U*) 2))) :: (95, Boolean) :: (86, Integer) :: (77, (Subtype ((*U*) 2))) :: (50, Integer) :: (41, Integer) :: (59, Integer) :: (68, (Subtype ((*U*) 2))) :: (53, (Subtype ((*U*) 2))) :: (62, (Subtype ((*U*) 2))) :: (35, Integer) :: (44, (Subtype ((*U*) 2))) :: (26, (Subtype ((*U*) 2))) :: (89, (Subtype ((*U*) 2))) :: (80, Boolean) :: (98, (Array_Type ((*Ar*) 3))) :: (71, (Subtype ((*U*) 2))) :: (107, (Subtype ((*U*) 2))) :: (74, (Subtype ((*U*) 2))) :: (56, Integer) :: (47, Integer) :: (38, Boolean) :: (65, (Subtype ((*U*) 2))) :: (106, (Subtype ((*U*) 2))) :: (46, Integer) :: (100, (Subtype ((*U*) 2))) :: (91, (Subtype ((*U*) 2))) :: (82, Integer) :: (55, Integer) :: (64, (Subtype ((*U*) 2))) :: (73, (Integer_Type ((*T*) 1))) :: (58, (Integer_Type ((*T*) 1))) :: (85, (Subtype ((*U*) 2))) :: (49, Boolean) :: (40, Integer) :: (31, Integer) :: (76, (Subtype ((*U*) 2))) :: (112, (Subtype ((*U*) 2))) :: (97, Integer) :: (52, (Array_Type ((*Ar*) 3))) :: (43, (Integer_Type ((*T*) 1))) :: (70, (Subtype ((*U*) 2))) :: (34, (Integer_Type ((*T*) 1))) :: (61, Boolean) :: (87, Integer) :: (96, Integer) :: (105, (Integer_Type ((*T*) 1))) :: (69, (Integer_Type ((*T*) 1))) :: (78, Integer) :: (99, (Subtype ((*U*) 2))) :: (90, (Integer_Type ((*T*) 1))) :: (63, (Subtype ((*U*) 2))) :: (54, (Subtype ((*U*) 2))) :: (45, (Subtype ((*U*) 2))) :: (72, (Integer_Type ((*T*) 1))) :: (81, Integer) :: (108, Integer) :: (27, Integer) :: (48, Integer) :: (84, (Subtype ((*U*) 2))) :: (102, Integer) :: (93, Integer) :: (75, (Subtype ((*U*) 2))) :: (30, (Subtype ((*U*) 2))) :: (111, (Subtype ((*U*) 2))) :: (39, Boolean) :: (42, (Array_Type ((*Ar*) 3))) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (101, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (83, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)13)) :: (110, (sloc (*Line*)34 (*Col*)15 (*EndLine*)34 (*EndCol*)20)) :: (104, (sloc (*Line*)32 (*Col*)15 (*EndLine*)32 (*EndCol*)19)) :: (95, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)24)) :: (86, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (77, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (50, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: (41, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (59, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)20)) :: (68, (sloc (*Line*)26 (*Col*)10 (*EndLine*)26 (*EndCol*)12)) :: (53, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (62, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (35, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (44, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)10)) :: (89, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)16)) :: (80, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)23)) :: (98, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)14)) :: (71, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (107, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (74, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (56, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (47, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (38, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)45)) :: (65, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (106, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (46, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (100, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (91, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (82, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (55, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (64, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (73, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)36)) :: (58, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (85, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (49, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)45)) :: (40, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (31, (sloc (*Line*)17 (*Col*)16 (*EndLine*)17 (*EndCol*)17)) :: (76, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (112, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (97, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (52, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)33)) :: (43, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)18)) :: (70, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (34, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)25)) :: (87, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (96, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (105, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)30)) :: (69, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)41)) :: (78, (sloc (*Line*)26 (*Col*)41 (*EndLine*)26 (*EndCol*)41)) :: (99, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (90, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)27)) :: (63, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (54, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (45, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (72, (sloc (*Line*)26 (*Col*)24 (*EndLine*)26 (*EndCol*)41)) :: (81, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (108, (sloc (*Line*)32 (*Col*)30 (*EndLine*)32 (*EndCol*)30)) :: (27, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (48, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (84, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (102, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (93, (sloc (*Line*)29 (*Col*)27 (*EndLine*)29 (*EndCol*)27)) :: (75, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (30, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)11)) :: (111, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (39, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)23)) :: (42, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (51, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Result", "ada://parameter/Binary_Search-1:9/Search-16:14/Result-16:43")) :: (11, ("Med", "ada://variable/Binary_Search-1:9/Search-16:14/Med+14:7")) :: (7, ("I", "ada://parameter/Binary_Search-1:9/Search-16:14/I-16:30")) :: (10, ("Right", "ada://variable/Binary_Search-1:9/Search-16:14/Right+13:7")) :: (9, ("Left", "ada://variable/Binary_Search-1:9/Search-16:14/Left+12:7")) :: (6, ("A", "ada://parameter/Binary_Search-1:9/Search-16:14/A-16:22")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Search", "ada://procedure_body/Binary_Search-1:9/Search-16:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("Binary_Search", "ada://package_body/Binary_Search-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("U", "ada://subtype/Binary_Search-1:9/U-12:12")) :: (1, ("T", "ada://ordinary_type/Binary_Search-1:9/T-11:9")) :: (3, ("Ar", "ada://ordinary_type/Binary_Search-1:9/Ar-14:9")) :: nil)
))
).

