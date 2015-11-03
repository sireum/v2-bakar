Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Subtype_Declaration 4 ((*Index_Type*) 3) Integer (Range 1 3))) 
(D_Seq_Declaration 5
(D_Type_Declaration 6 (Array_Type_Declaration 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) 
(D_Seq_Declaration 8
(D_Procedure_Body 9 
  (mkprocedure_body 10
    (* = = = Procedure Name = = = *)
    ((*Dummy*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 11 ((*X*) 5) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 12 (E_Identifier 13 ((*X*) 5) ) (E_Binary_Operation 14 Plus (E_Name 15 (E_Identifier 16 ((*X*) 5) )) (E_Literal 17 (Integer_Literal 1) ) ))
  )
) 
(D_Procedure_Body 18 
  (mkprocedure_body 19
    (* = = = Procedure Name = = = *)
    ((*SelectionSort*) 8)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 21
  (D_Object_Declaration 22 (mkobject_declaration 23 ((*Min*) 10) Integer None)) 
  (D_Seq_Declaration 24
  (D_Object_Declaration 25 (mkobject_declaration 26 ((*Temp*) 11) Integer None)) 
  (D_Seq_Declaration 27
  (D_Object_Declaration 28 (mkobject_declaration 29 ((*Pos*) 12) Integer None)) 
  (D_Object_Declaration 30 (mkobject_declaration 31 ((*I*) 13) Integer None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 32
      (S_Assignment 33 (E_Identifier 34 ((*Pos*) 12) ) (E_Literal 35 (Integer_Literal 1) )) 
      (S_While_Loop 36 (E_Binary_Operation 37 And (E_Binary_Operation 38 Greater_Than_Or_Equal (E_Name 39 (E_Identifier 40 ((*Pos*) 12) )) (E_Literal 41 (Integer_Literal 1) ) ) (E_Binary_Operation 42 Less_Than_Or_Equal (E_Name 43 (E_Identifier 44 ((*Pos*) 12) )) (E_Literal 45 (Integer_Literal 3) ) ) )
        (S_Sequence 46
        (S_Assignment 47 (E_Identifier 48 ((*Min*) 10) ) (E_Name 49 (E_Identifier 50 ((*Pos*) 12) ))) 
        (S_Sequence 51
        (S_Assignment 52 (E_Identifier 53 ((*I*) 13) ) (E_Binary_Operation 54 Plus (E_Name 55 (E_Identifier 56 ((*Pos*) 12) )) (E_Literal 57 (Integer_Literal 1) ) )) 
        (S_Sequence 58
        (S_While_Loop 59 (E_Binary_Operation 60 And (E_Binary_Operation 61 Greater_Than_Or_Equal (E_Name 62 (E_Identifier 63 ((*I*) 13) )) (E_Binary_Operation 64 Plus (E_Name 65 (E_Identifier 66 ((*Pos*) 12) )) (E_Literal 67 (Integer_Literal 1) ) ) ) (E_Binary_Operation 68 Less_Than_Or_Equal (E_Name 69 (E_Identifier 70 ((*I*) 13) )) (E_Literal 71 (Integer_Literal 3) ) ) )
          (S_Sequence 72
          (S_If 73 (E_Binary_Operation 74 Less_Than (E_Name 75 (E_Indexed_Component 76 (E_Identifier 77 ((*A*) 9) ) (E_Name 78 (E_Identifier 79 ((*I*) 13) )) )) (E_Name 80 (E_Indexed_Component 81 (E_Identifier 82 ((*A*) 9) ) (E_Name 83 (E_Identifier 84 ((*Min*) 10) )) )) )
            (S_Assignment 85 (E_Identifier 86 ((*Min*) 10) ) (E_Name 87 (E_Identifier 88 ((*I*) 13) )))
            S_Null
          ) 
          (S_Assignment 89 (E_Identifier 90 ((*I*) 13) ) (E_Binary_Operation 91 Plus (E_Name 92 (E_Identifier 93 ((*I*) 13) )) (E_Literal 94 (Integer_Literal 1) ) )))
        ) 
        (S_Sequence 95
        (S_If 96 (E_Binary_Operation 97 Not_Equal (E_Name 98 (E_Identifier 99 ((*Pos*) 12) )) (E_Name 100 (E_Identifier 101 ((*Min*) 10) )) )
          (S_Sequence 102
          (S_Assignment 103 (E_Identifier 104 ((*Temp*) 11) ) (E_Name 105 (E_Indexed_Component 106 (E_Identifier 107 ((*A*) 9) ) (E_Name 108 (E_Identifier 109 ((*Pos*) 12) )) ))) 
          (S_Sequence 110
          (S_Assignment 111 (E_Indexed_Component 112 (E_Identifier 113 ((*A*) 9) ) (E_Name 114 (E_Identifier 115 ((*Pos*) 12) )) ) (E_Name 116 (E_Indexed_Component 117 (E_Identifier 118 ((*A*) 9) ) (E_Name 119 (E_Identifier 120 ((*Min*) 10) )) ))) 
          (S_Assignment 121 (E_Indexed_Component 122 (E_Identifier 123 ((*A*) 9) ) (E_Name 124 (E_Identifier 125 ((*Min*) 10) )) ) (E_Name 126 (E_Identifier 127 ((*Temp*) 11) )))))
          S_Null
        ) 
        (S_Assignment 128 (E_Identifier 129 ((*Pos*) 12) ) (E_Binary_Operation 130 Plus (E_Name 131 (E_Identifier 132 ((*Pos*) 12) )) (E_Literal 133 (Integer_Literal 1) ) ))))))
      ))
  )
))))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 5), (In_Out, Integer)) :: (((*Pos*) 12), (In_Out, Integer)) :: (((*A*) 9), (In_Out, (Array_Type ((*Vector*) 4)))) :: (((*I*) 13), (In_Out, Integer)) :: (((*Temp*) 11), (In_Out, Integer)) :: (((*Min*) 10), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*SelectionSort*) 8), (0, (mkprocedure_body 19
  (* = = = Procedure Name = = = *)
  ((*SelectionSort*) 8)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 21
(D_Object_Declaration 22 (mkobject_declaration 23 ((*Min*) 10) Integer None)) 
(D_Seq_Declaration 24
(D_Object_Declaration 25 (mkobject_declaration 26 ((*Temp*) 11) Integer None)) 
(D_Seq_Declaration 27
(D_Object_Declaration 28 (mkobject_declaration 29 ((*Pos*) 12) Integer None)) 
(D_Object_Declaration 30 (mkobject_declaration 31 ((*I*) 13) Integer None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 32
    (S_Assignment 33 (E_Identifier 34 ((*Pos*) 12) ) (E_Literal 35 (Integer_Literal 1) )) 
    (S_While_Loop 36 (E_Binary_Operation 37 And (E_Binary_Operation 38 Greater_Than_Or_Equal (E_Name 39 (E_Identifier 40 ((*Pos*) 12) )) (E_Literal 41 (Integer_Literal 1) ) ) (E_Binary_Operation 42 Less_Than_Or_Equal (E_Name 43 (E_Identifier 44 ((*Pos*) 12) )) (E_Literal 45 (Integer_Literal 3) ) ) )
      (S_Sequence 46
      (S_Assignment 47 (E_Identifier 48 ((*Min*) 10) ) (E_Name 49 (E_Identifier 50 ((*Pos*) 12) ))) 
      (S_Sequence 51
      (S_Assignment 52 (E_Identifier 53 ((*I*) 13) ) (E_Binary_Operation 54 Plus (E_Name 55 (E_Identifier 56 ((*Pos*) 12) )) (E_Literal 57 (Integer_Literal 1) ) )) 
      (S_Sequence 58
      (S_While_Loop 59 (E_Binary_Operation 60 And (E_Binary_Operation 61 Greater_Than_Or_Equal (E_Name 62 (E_Identifier 63 ((*I*) 13) )) (E_Binary_Operation 64 Plus (E_Name 65 (E_Identifier 66 ((*Pos*) 12) )) (E_Literal 67 (Integer_Literal 1) ) ) ) (E_Binary_Operation 68 Less_Than_Or_Equal (E_Name 69 (E_Identifier 70 ((*I*) 13) )) (E_Literal 71 (Integer_Literal 3) ) ) )
        (S_Sequence 72
        (S_If 73 (E_Binary_Operation 74 Less_Than (E_Name 75 (E_Indexed_Component 76 (E_Identifier 77 ((*A*) 9) ) (E_Name 78 (E_Identifier 79 ((*I*) 13) )) )) (E_Name 80 (E_Indexed_Component 81 (E_Identifier 82 ((*A*) 9) ) (E_Name 83 (E_Identifier 84 ((*Min*) 10) )) )) )
          (S_Assignment 85 (E_Identifier 86 ((*Min*) 10) ) (E_Name 87 (E_Identifier 88 ((*I*) 13) )))
          S_Null
        ) 
        (S_Assignment 89 (E_Identifier 90 ((*I*) 13) ) (E_Binary_Operation 91 Plus (E_Name 92 (E_Identifier 93 ((*I*) 13) )) (E_Literal 94 (Integer_Literal 1) ) )))
      ) 
      (S_Sequence 95
      (S_If 96 (E_Binary_Operation 97 Not_Equal (E_Name 98 (E_Identifier 99 ((*Pos*) 12) )) (E_Name 100 (E_Identifier 101 ((*Min*) 10) )) )
        (S_Sequence 102
        (S_Assignment 103 (E_Identifier 104 ((*Temp*) 11) ) (E_Name 105 (E_Indexed_Component 106 (E_Identifier 107 ((*A*) 9) ) (E_Name 108 (E_Identifier 109 ((*Pos*) 12) )) ))) 
        (S_Sequence 110
        (S_Assignment 111 (E_Indexed_Component 112 (E_Identifier 113 ((*A*) 9) ) (E_Name 114 (E_Identifier 115 ((*Pos*) 12) )) ) (E_Name 116 (E_Indexed_Component 117 (E_Identifier 118 ((*A*) 9) ) (E_Name 119 (E_Identifier 120 ((*Min*) 10) )) ))) 
        (S_Assignment 121 (E_Indexed_Component 122 (E_Identifier 123 ((*A*) 9) ) (E_Name 124 (E_Identifier 125 ((*Min*) 10) )) ) (E_Name 126 (E_Identifier 127 ((*Temp*) 11) )))))
        S_Null
      ) 
      (S_Assignment 128 (E_Identifier 129 ((*Pos*) 12) ) (E_Binary_Operation 130 Plus (E_Name 131 (E_Identifier 132 ((*Pos*) 12) )) (E_Literal 133 (Integer_Literal 1) ) ))))))
    ))
))) :: (((*Dummy*) 1), (0, (mkprocedure_body 10
  (* = = = Procedure Name = = = *)
  ((*Dummy*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 11 ((*X*) 5) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 12 (E_Identifier 13 ((*X*) 5) ) (E_Binary_Operation 14 Plus (E_Name 15 (E_Identifier 16 ((*X*) 5) )) (E_Literal 17 (Integer_Literal 1) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Type*) 3), (Subtype_Declaration 4 ((*Index_Type*) 3) Integer (Range 1 3))) :: (((*Vector*) 4), (Array_Type_Declaration 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, Integer) :: (101, Integer) :: (83, Integer) :: (119, Integer) :: (104, Integer) :: (131, Integer) :: (122, Integer) :: (77, (Array_Type ((*Vector*) 4))) :: (86, Integer) :: (113, (Array_Type ((*Vector*) 4))) :: (50, Integer) :: (41, Integer) :: (68, Boolean) :: (53, Integer) :: (62, Integer) :: (44, Integer) :: (17, Integer) :: (35, Integer) :: (125, Integer) :: (80, Integer) :: (116, Integer) :: (98, Integer) :: (71, Integer) :: (107, (Array_Type ((*Vector*) 4))) :: (74, Boolean) :: (56, Integer) :: (38, Boolean) :: (65, Integer) :: (14, Integer) :: (124, Integer) :: (133, Integer) :: (106, Integer) :: (115, Integer) :: (127, Integer) :: (118, (Array_Type ((*Vector*) 4))) :: (100, Integer) :: (109, Integer) :: (91, Integer) :: (82, (Array_Type ((*Vector*) 4))) :: (55, Integer) :: (64, Integer) :: (94, Integer) :: (67, Integer) :: (49, Integer) :: (40, Integer) :: (130, Integer) :: (13, Integer) :: (76, Integer) :: (112, Integer) :: (97, Boolean) :: (16, Integer) :: (79, Integer) :: (88, Integer) :: (43, Integer) :: (70, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Boolean) :: (129, Integer) :: (120, Integer) :: (60, Boolean) :: (87, Integer) :: (132, Integer) :: (105, Integer) :: (123, (Array_Type ((*Vector*) 4))) :: (114, Integer) :: (69, Integer) :: (78, Integer) :: (99, Integer) :: (90, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (126, Integer) :: (81, Integer) :: (108, Integer) :: (117, Integer) :: (57, Integer) :: (48, Integer) :: (84, Integer) :: (93, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (101, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (83, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (119, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (104, (sloc (*Line*)34 (*Col*)10 (*EndLine*)34 (*EndCol*)13)) :: (131, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (122, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)15)) :: (77, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)13)) :: (86, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)14)) :: (113, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (50, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (41, (sloc (*Line*)23 (*Col*)19 (*EndLine*)23 (*EndCol*)19)) :: (68, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)37)) :: (53, (sloc (*Line*)25 (*Col*)8 (*EndLine*)25 (*EndCol*)8)) :: (62, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (44, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (17, (sloc (*Line*)11 (*Col*)16 (*EndLine*)11 (*EndCol*)16)) :: (35, (sloc (*Line*)22 (*Col*)13 (*EndLine*)22 (*EndCol*)13)) :: (125, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (80, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (116, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (98, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (71, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (107, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)18)) :: (74, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)25)) :: (56, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (38, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)19)) :: (65, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)16)) :: (124, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (133, (sloc (*Line*)39 (*Col*)21 (*EndLine*)39 (*EndCol*)21)) :: (106, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (115, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (127, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (118, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)20)) :: (100, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (109, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (91, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)19)) :: (82, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)20)) :: (55, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (64, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)26)) :: (94, (sloc (*Line*)30 (*Col*)19 (*EndLine*)30 (*EndCol*)19)) :: (67, (sloc (*Line*)26 (*Col*)26 (*EndLine*)26 (*EndCol*)26)) :: (49, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (40, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (130, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)21)) :: (13, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (76, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (112, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)15)) :: (97, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)20)) :: (16, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (79, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (88, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (43, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (70, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (34, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)8)) :: (61, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)26)) :: (37, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)32)) :: (129, (sloc (*Line*)39 (*Col*)8 (*EndLine*)39 (*EndCol*)10)) :: (120, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (60, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)37)) :: (87, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (132, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (105, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (123, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)10)) :: (114, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (69, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (78, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (99, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (90, (sloc (*Line*)30 (*Col*)10 (*EndLine*)30 (*EndCol*)10)) :: (63, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (54, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)19)) :: (45, (sloc (*Line*)23 (*Col*)32 (*EndLine*)23 (*EndCol*)32)) :: (126, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (81, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (108, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (117, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (57, (sloc (*Line*)25 (*Col*)19 (*EndLine*)25 (*EndCol*)19)) :: (48, (sloc (*Line*)24 (*Col*)8 (*EndLine*)24 (*EndCol*)10)) :: (84, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (93, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (75, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (39, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (66, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (15, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (42, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)32)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("Temp", "ada://variable/Sort-1:9/SelectionSort+14:14/Temp+18:6")) :: (5, ("X", "ada://parameter/Sort-1:9/Dummy-3:14/X-3:20")) :: (13, ("I", "ada://variable/Sort-1:9/SelectionSort+14:14/I+20:6")) :: (10, ("Min", "ada://variable/Sort-1:9/SelectionSort+14:14/Min+17:6")) :: (9, ("A", "ada://parameter/Sort-1:9/SelectionSort+14:14/A+14:29")) :: (12, ("Pos", "ada://variable/Sort-1:9/SelectionSort+14:14/Pos+19:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((8, ("SelectionSort", "ada://procedure_body/Sort-1:9/SelectionSort+14:14")) :: (1, ("Dummy", "ada://procedure_body/Sort-1:9/Dummy-3:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("Sort", "ada://package_body/Sort-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("Vector", "ada://ordinary_type/Sort-1:9/Vector+4:9")) :: (3, ("Index_Type", "ada://subtype/Sort-1:9/Index_Type+3:12")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Subtype_Declaration_X 4 ((*Index_Type*) 3) Integer (Range_X 1 3))) 
(D_Seq_Declaration_X 5
(D_Type_Declaration_X 6 (Array_Type_Declaration_X 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) 
(D_Seq_Declaration_X 8
(D_Procedure_Body_X 9 
  (mkprocedure_body_x 10
    (* = = = Procedure Name = = = *)
    ((*Dummy*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 11 ((*X*) 5) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 12 (E_Identifier_X 13 ((*X*) 5) (nil)) (E_Binary_Operation_X 14 Plus (E_Name_X 15 (E_Identifier_X 16 ((*X*) 5) (nil))) (E_Literal_X 17 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
  )
) 
(D_Procedure_Body_X 18 
  (mkprocedure_body_x 19
    (* = = = Procedure Name = = = *)
    ((*SelectionSort*) 8)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 21
  (D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*Min*) 10) Integer None)) 
  (D_Seq_Declaration_X 24
  (D_Object_Declaration_X 25 (mkobject_declaration_x 26 ((*Temp*) 11) Integer None)) 
  (D_Seq_Declaration_X 27
  (D_Object_Declaration_X 28 (mkobject_declaration_x 29 ((*Pos*) 12) Integer None)) 
  (D_Object_Declaration_X 30 (mkobject_declaration_x 31 ((*I*) 13) Integer None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 32
      (S_Assignment_X 33 (E_Identifier_X 34 ((*Pos*) 12) (nil)) (E_Literal_X 35 (Integer_Literal 1) (nil) nil)) 
      (S_While_Loop_X 36 (E_Binary_Operation_X 37 And (E_Binary_Operation_X 38 Greater_Than_Or_Equal (E_Name_X 39 (E_Identifier_X 40 ((*Pos*) 12) (nil))) (E_Literal_X 41 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Binary_Operation_X 42 Less_Than_Or_Equal (E_Name_X 43 (E_Identifier_X 44 ((*Pos*) 12) (nil))) (E_Literal_X 45 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
        (S_Sequence_X 46
        (S_Assignment_X 47 (E_Identifier_X 48 ((*Min*) 10) (nil)) (E_Name_X 49 (E_Identifier_X 50 ((*Pos*) 12) (nil)))) 
        (S_Sequence_X 51
        (S_Assignment_X 52 (E_Identifier_X 53 ((*I*) 13) (nil)) (E_Binary_Operation_X 54 Plus (E_Name_X 55 (E_Identifier_X 56 ((*Pos*) 12) (nil))) (E_Literal_X 57 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_Sequence_X 58
        (S_While_Loop_X 59 (E_Binary_Operation_X 60 And (E_Binary_Operation_X 61 Greater_Than_Or_Equal (E_Name_X 62 (E_Identifier_X 63 ((*I*) 13) (nil))) (E_Binary_Operation_X 64 Plus (E_Name_X 65 (E_Identifier_X 66 ((*Pos*) 12) (nil))) (E_Literal_X 67 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil) (nil) nil) (E_Binary_Operation_X 68 Less_Than_Or_Equal (E_Name_X 69 (E_Identifier_X 70 ((*I*) 13) (nil))) (E_Literal_X 71 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
          (S_Sequence_X 72
          (S_If_X 73 (E_Binary_Operation_X 74 Less_Than (E_Name_X 75 (E_Indexed_Component_X 76 (E_Identifier_X 77 ((*A*) 9) (nil)) (E_Name_X 78 (E_Identifier_X 79 ((*I*) 13) (Do_Range_Check :: nil))) (nil))) (E_Name_X 80 (E_Indexed_Component_X 81 (E_Identifier_X 82 ((*A*) 9) (nil)) (E_Name_X 83 (E_Identifier_X 84 ((*Min*) 10) (Do_Range_Check :: nil))) (nil))) (nil) nil)
            (S_Assignment_X 85 (E_Identifier_X 86 ((*Min*) 10) (nil)) (E_Name_X 87 (E_Identifier_X 88 ((*I*) 13) (nil))))
            S_Null_X
          ) 
          (S_Assignment_X 89 (E_Identifier_X 90 ((*I*) 13) (nil)) (E_Binary_Operation_X 91 Plus (E_Name_X 92 (E_Identifier_X 93 ((*I*) 13) (nil))) (E_Literal_X 94 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
        ) 
        (S_Sequence_X 95
        (S_If_X 96 (E_Binary_Operation_X 97 Not_Equal (E_Name_X 98 (E_Identifier_X 99 ((*Pos*) 12) (nil))) (E_Name_X 100 (E_Identifier_X 101 ((*Min*) 10) (nil))) (nil) nil)
          (S_Sequence_X 102
          (S_Assignment_X 103 (E_Identifier_X 104 ((*Temp*) 11) (nil)) (E_Name_X 105 (E_Indexed_Component_X 106 (E_Identifier_X 107 ((*A*) 9) (nil)) (E_Name_X 108 (E_Identifier_X 109 ((*Pos*) 12) (Do_Range_Check :: nil))) (nil)))) 
          (S_Sequence_X 110
          (S_Assignment_X 111 (E_Indexed_Component_X 112 (E_Identifier_X 113 ((*A*) 9) (nil)) (E_Name_X 114 (E_Identifier_X 115 ((*Pos*) 12) (Do_Range_Check :: nil))) (nil)) (E_Name_X 116 (E_Indexed_Component_X 117 (E_Identifier_X 118 ((*A*) 9) (nil)) (E_Name_X 119 (E_Identifier_X 120 ((*Min*) 10) (Do_Range_Check :: nil))) (nil)))) 
          (S_Assignment_X 121 (E_Indexed_Component_X 122 (E_Identifier_X 123 ((*A*) 9) (nil)) (E_Name_X 124 (E_Identifier_X 125 ((*Min*) 10) (Do_Range_Check :: nil))) (nil)) (E_Name_X 126 (E_Identifier_X 127 ((*Temp*) 11) (nil))))))
          S_Null_X
        ) 
        (S_Assignment_X 128 (E_Identifier_X 129 ((*Pos*) 12) (nil)) (E_Binary_Operation_X 130 Plus (E_Name_X 131 (E_Identifier_X 132 ((*Pos*) 12) (nil))) (E_Literal_X 133 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))))))
      ))
  )
))))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 5), (In_Out, Integer)) :: (((*Pos*) 12), (In_Out, Integer)) :: (((*A*) 9), (In_Out, (Array_Type ((*Vector*) 4)))) :: (((*I*) 13), (In_Out, Integer)) :: (((*Temp*) 11), (In_Out, Integer)) :: (((*Min*) 10), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*SelectionSort*) 8), (0, (mkprocedure_body_x 19
  (* = = = Procedure Name = = = *)
  ((*SelectionSort*) 8)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 21
(D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*Min*) 10) Integer None)) 
(D_Seq_Declaration_X 24
(D_Object_Declaration_X 25 (mkobject_declaration_x 26 ((*Temp*) 11) Integer None)) 
(D_Seq_Declaration_X 27
(D_Object_Declaration_X 28 (mkobject_declaration_x 29 ((*Pos*) 12) Integer None)) 
(D_Object_Declaration_X 30 (mkobject_declaration_x 31 ((*I*) 13) Integer None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 32
    (S_Assignment_X 33 (E_Identifier_X 34 ((*Pos*) 12) (nil)) (E_Literal_X 35 (Integer_Literal 1) (nil) nil)) 
    (S_While_Loop_X 36 (E_Binary_Operation_X 37 And (E_Binary_Operation_X 38 Greater_Than_Or_Equal (E_Name_X 39 (E_Identifier_X 40 ((*Pos*) 12) (nil))) (E_Literal_X 41 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Binary_Operation_X 42 Less_Than_Or_Equal (E_Name_X 43 (E_Identifier_X 44 ((*Pos*) 12) (nil))) (E_Literal_X 45 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
      (S_Sequence_X 46
      (S_Assignment_X 47 (E_Identifier_X 48 ((*Min*) 10) (nil)) (E_Name_X 49 (E_Identifier_X 50 ((*Pos*) 12) (nil)))) 
      (S_Sequence_X 51
      (S_Assignment_X 52 (E_Identifier_X 53 ((*I*) 13) (nil)) (E_Binary_Operation_X 54 Plus (E_Name_X 55 (E_Identifier_X 56 ((*Pos*) 12) (nil))) (E_Literal_X 57 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 58
      (S_While_Loop_X 59 (E_Binary_Operation_X 60 And (E_Binary_Operation_X 61 Greater_Than_Or_Equal (E_Name_X 62 (E_Identifier_X 63 ((*I*) 13) (nil))) (E_Binary_Operation_X 64 Plus (E_Name_X 65 (E_Identifier_X 66 ((*Pos*) 12) (nil))) (E_Literal_X 67 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil) (nil) nil) (E_Binary_Operation_X 68 Less_Than_Or_Equal (E_Name_X 69 (E_Identifier_X 70 ((*I*) 13) (nil))) (E_Literal_X 71 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
        (S_Sequence_X 72
        (S_If_X 73 (E_Binary_Operation_X 74 Less_Than (E_Name_X 75 (E_Indexed_Component_X 76 (E_Identifier_X 77 ((*A*) 9) (nil)) (E_Name_X 78 (E_Identifier_X 79 ((*I*) 13) (Do_Range_Check :: nil))) (nil))) (E_Name_X 80 (E_Indexed_Component_X 81 (E_Identifier_X 82 ((*A*) 9) (nil)) (E_Name_X 83 (E_Identifier_X 84 ((*Min*) 10) (Do_Range_Check :: nil))) (nil))) (nil) nil)
          (S_Assignment_X 85 (E_Identifier_X 86 ((*Min*) 10) (nil)) (E_Name_X 87 (E_Identifier_X 88 ((*I*) 13) (nil))))
          S_Null_X
        ) 
        (S_Assignment_X 89 (E_Identifier_X 90 ((*I*) 13) (nil)) (E_Binary_Operation_X 91 Plus (E_Name_X 92 (E_Identifier_X 93 ((*I*) 13) (nil))) (E_Literal_X 94 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
      ) 
      (S_Sequence_X 95
      (S_If_X 96 (E_Binary_Operation_X 97 Not_Equal (E_Name_X 98 (E_Identifier_X 99 ((*Pos*) 12) (nil))) (E_Name_X 100 (E_Identifier_X 101 ((*Min*) 10) (nil))) (nil) nil)
        (S_Sequence_X 102
        (S_Assignment_X 103 (E_Identifier_X 104 ((*Temp*) 11) (nil)) (E_Name_X 105 (E_Indexed_Component_X 106 (E_Identifier_X 107 ((*A*) 9) (nil)) (E_Name_X 108 (E_Identifier_X 109 ((*Pos*) 12) (Do_Range_Check :: nil))) (nil)))) 
        (S_Sequence_X 110
        (S_Assignment_X 111 (E_Indexed_Component_X 112 (E_Identifier_X 113 ((*A*) 9) (nil)) (E_Name_X 114 (E_Identifier_X 115 ((*Pos*) 12) (Do_Range_Check :: nil))) (nil)) (E_Name_X 116 (E_Indexed_Component_X 117 (E_Identifier_X 118 ((*A*) 9) (nil)) (E_Name_X 119 (E_Identifier_X 120 ((*Min*) 10) (Do_Range_Check :: nil))) (nil)))) 
        (S_Assignment_X 121 (E_Indexed_Component_X 122 (E_Identifier_X 123 ((*A*) 9) (nil)) (E_Name_X 124 (E_Identifier_X 125 ((*Min*) 10) (Do_Range_Check :: nil))) (nil)) (E_Name_X 126 (E_Identifier_X 127 ((*Temp*) 11) (nil))))))
        S_Null_X
      ) 
      (S_Assignment_X 128 (E_Identifier_X 129 ((*Pos*) 12) (nil)) (E_Binary_Operation_X 130 Plus (E_Name_X 131 (E_Identifier_X 132 ((*Pos*) 12) (nil))) (E_Literal_X 133 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))))))
    ))
))) :: (((*Dummy*) 1), (0, (mkprocedure_body_x 10
  (* = = = Procedure Name = = = *)
  ((*Dummy*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 11 ((*X*) 5) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 12 (E_Identifier_X 13 ((*X*) 5) (nil)) (E_Binary_Operation_X 14 Plus (E_Name_X 15 (E_Identifier_X 16 ((*X*) 5) (nil))) (E_Literal_X 17 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Type*) 3), (Subtype_Declaration_X 4 ((*Index_Type*) 3) Integer (Range_X 1 3))) :: (((*Vector*) 4), (Array_Type_Declaration_X 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, Integer) :: (101, Integer) :: (83, Integer) :: (119, Integer) :: (104, Integer) :: (131, Integer) :: (122, Integer) :: (77, (Array_Type ((*Vector*) 4))) :: (86, Integer) :: (113, (Array_Type ((*Vector*) 4))) :: (50, Integer) :: (41, Integer) :: (68, Boolean) :: (53, Integer) :: (62, Integer) :: (44, Integer) :: (17, Integer) :: (35, Integer) :: (125, Integer) :: (80, Integer) :: (116, Integer) :: (98, Integer) :: (71, Integer) :: (107, (Array_Type ((*Vector*) 4))) :: (74, Boolean) :: (56, Integer) :: (38, Boolean) :: (65, Integer) :: (14, Integer) :: (124, Integer) :: (133, Integer) :: (106, Integer) :: (115, Integer) :: (127, Integer) :: (118, (Array_Type ((*Vector*) 4))) :: (100, Integer) :: (109, Integer) :: (91, Integer) :: (82, (Array_Type ((*Vector*) 4))) :: (55, Integer) :: (64, Integer) :: (94, Integer) :: (67, Integer) :: (49, Integer) :: (40, Integer) :: (130, Integer) :: (13, Integer) :: (76, Integer) :: (112, Integer) :: (97, Boolean) :: (16, Integer) :: (79, Integer) :: (88, Integer) :: (43, Integer) :: (70, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Boolean) :: (129, Integer) :: (120, Integer) :: (60, Boolean) :: (87, Integer) :: (132, Integer) :: (105, Integer) :: (123, (Array_Type ((*Vector*) 4))) :: (114, Integer) :: (69, Integer) :: (78, Integer) :: (99, Integer) :: (90, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (126, Integer) :: (81, Integer) :: (108, Integer) :: (117, Integer) :: (57, Integer) :: (48, Integer) :: (84, Integer) :: (93, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (101, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (83, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (119, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (104, (sloc (*Line*)34 (*Col*)10 (*EndLine*)34 (*EndCol*)13)) :: (131, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (122, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)15)) :: (77, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)13)) :: (86, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)14)) :: (113, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (50, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (41, (sloc (*Line*)23 (*Col*)19 (*EndLine*)23 (*EndCol*)19)) :: (68, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)37)) :: (53, (sloc (*Line*)25 (*Col*)8 (*EndLine*)25 (*EndCol*)8)) :: (62, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (44, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (17, (sloc (*Line*)11 (*Col*)16 (*EndLine*)11 (*EndCol*)16)) :: (35, (sloc (*Line*)22 (*Col*)13 (*EndLine*)22 (*EndCol*)13)) :: (125, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (80, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (116, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (98, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (71, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (107, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)18)) :: (74, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)25)) :: (56, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (38, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)19)) :: (65, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)16)) :: (124, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (133, (sloc (*Line*)39 (*Col*)21 (*EndLine*)39 (*EndCol*)21)) :: (106, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (115, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (127, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (118, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)20)) :: (100, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (109, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (91, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)19)) :: (82, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)20)) :: (55, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (64, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)26)) :: (94, (sloc (*Line*)30 (*Col*)19 (*EndLine*)30 (*EndCol*)19)) :: (67, (sloc (*Line*)26 (*Col*)26 (*EndLine*)26 (*EndCol*)26)) :: (49, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (40, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (130, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)21)) :: (13, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (76, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (112, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)15)) :: (97, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)20)) :: (16, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (79, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (88, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (43, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (70, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (34, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)8)) :: (61, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)26)) :: (37, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)32)) :: (129, (sloc (*Line*)39 (*Col*)8 (*EndLine*)39 (*EndCol*)10)) :: (120, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (60, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)37)) :: (87, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (132, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (105, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (123, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)10)) :: (114, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (69, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (78, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (99, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (90, (sloc (*Line*)30 (*Col*)10 (*EndLine*)30 (*EndCol*)10)) :: (63, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (54, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)19)) :: (45, (sloc (*Line*)23 (*Col*)32 (*EndLine*)23 (*EndCol*)32)) :: (126, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (81, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (108, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (117, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (57, (sloc (*Line*)25 (*Col*)19 (*EndLine*)25 (*EndCol*)19)) :: (48, (sloc (*Line*)24 (*Col*)8 (*EndLine*)24 (*EndCol*)10)) :: (84, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (93, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (75, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (39, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (66, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (15, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (42, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)32)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("Temp", "ada://variable/Sort-1:9/SelectionSort+14:14/Temp+18:6")) :: (5, ("X", "ada://parameter/Sort-1:9/Dummy-3:14/X-3:20")) :: (13, ("I", "ada://variable/Sort-1:9/SelectionSort+14:14/I+20:6")) :: (10, ("Min", "ada://variable/Sort-1:9/SelectionSort+14:14/Min+17:6")) :: (9, ("A", "ada://parameter/Sort-1:9/SelectionSort+14:14/A+14:29")) :: (12, ("Pos", "ada://variable/Sort-1:9/SelectionSort+14:14/Pos+19:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((8, ("SelectionSort", "ada://procedure_body/Sort-1:9/SelectionSort+14:14")) :: (1, ("Dummy", "ada://procedure_body/Sort-1:9/Dummy-3:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("Sort", "ada://package_body/Sort-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("Vector", "ada://ordinary_type/Sort-1:9/Vector+4:9")) :: (3, ("Index_Type", "ada://subtype/Sort-1:9/Index_Type+3:12")) :: nil)
))
).

