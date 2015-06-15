Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Record_Type_Declaration 4 ((*RecordT*) 1) ((((*X*) 2), Integer) :: nil))) 
(D_Seq_Declaration 6
(D_Type_Declaration 7 (Subtype_Declaration 8 ((*I*) 3) Integer (Range 0 5))) 
(D_Seq_Declaration 9
(D_Type_Declaration 10 (Array_Type_Declaration 11 ((*ArrayT*) 4) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) 
(D_Seq_Declaration 12
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *))))) 
(D_Seq_Declaration 13
(D_Type_Declaration 14 (Record_Type_Declaration 15 ((*RecordT1*) 8) ((((*X*) 9), Integer) :: nil))) 
(D_Seq_Declaration 17
(D_Type_Declaration 18 (Array_Type_Declaration 19 ((*ArrayT1*) 10) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) 
(D_Seq_Declaration 20
(D_Object_Declaration 22 (mkobject_declaration 23 ((*W*) 12) Integer (Some ((E_Literal 21 (Integer_Literal 1) ))))) 
(D_Seq_Declaration 24
(D_Object_Declaration 26 (mkobject_declaration 27 ((*U*) 13) Integer (Some ((E_Literal 25 (Integer_Literal 1) ))))) 
(D_Seq_Declaration 28
(D_Procedure_Body 29 
  (mkprocedure_body 30
    (* = = = Procedure Name = = = *)
    ((*Increase*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 31 ((*X*) 14) Integer In) :: 
    (mkparameter_specification 32 ((*Y*) 15) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 33 (E_Identifier 34 ((*Y*) 15) ) (E_Binary_Operation 35 Plus (E_Name 36 (E_Identifier 37 ((*X*) 14) )) (E_Literal 38 (Integer_Literal 1) ) ))
  )
) 
(D_Procedure_Body 39 
  (mkprocedure_body 40
    (* = = = Procedure Name = = = *)
    ((*Test*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 41 ((*N*) 17) Integer In) :: 
    (mkparameter_specification 42 ((*M*) 18) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 43
  (D_Object_Declaration 44 (mkobject_declaration 45 ((*R*) 19) (Record_Type ((*RecordT*) 1)) None)) 
  (D_Seq_Declaration 46
  (D_Object_Declaration 47 (mkobject_declaration 48 ((*A*) 20) (Array_Type ((*ArrayT*) 4)) None)) 
  (D_Seq_Declaration 49
  (D_Object_Declaration 51 (mkobject_declaration 52 ((*Result*) 21) Integer (Some ((E_Literal 50 (Integer_Literal 1) ))))) 
  (D_Seq_Declaration 53
  (D_Object_Declaration 56 (mkobject_declaration 57 ((*T*) 22) Integer (Some ((E_Name 54 (E_Identifier 55 ((*Result*) 21) )))))) 
  (D_Seq_Declaration 58
  (D_Object_Declaration 59 (mkobject_declaration 60 ((*T1*) 23) Integer None)) 
  (D_Object_Declaration 61 (mkobject_declaration 62 ((*T2*) 24) Integer None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 63
      (S_Assignment 64 (E_Selected_Component 65 66 ((*R*) 19) ((*X*) 2) ) (E_Binary_Operation 69 Plus (E_Binary_Operation 70 Plus (E_Name 71 (E_Identifier 72 ((*W*) 12) )) (E_Name 73 (E_Identifier 74 ((*U*) 13) )) ) (E_Literal 75 (Integer_Literal 1) ) )) 
      (S_Sequence 76
      (S_Assignment 77 (E_Indexed_Component 78 79 ((*A*) 20) (E_Name 81 (E_Identifier 82 ((*N*) 17) )) ) (E_Literal 83 (Integer_Literal 1) )) 
      (S_Sequence 84
      (S_Assignment 85 (E_Identifier 86 ((*T1*) 23) ) (E_Binary_Operation 87 Plus (E_Name 88 (E_Selected_Component 89 90 ((*R*) 19) ((*X*) 2) )) (E_Name 93 (E_Identifier 94 ((*N*) 17) )) )) 
      (S_Sequence 95
      (S_Assignment 96 (E_Identifier 97 ((*T2*) 24) ) (E_Binary_Operation 98 Plus (E_Name 99 (E_Indexed_Component 100 101 ((*A*) 20) (E_Name 103 (E_Identifier 104 ((*T1*) 23) )) )) (E_Name 105 (E_Identifier 106 ((*T1*) 23) )) )) 
      (S_Sequence 107
      (S_Assignment 108 (E_Identifier 109 ((*T*) 22) ) (E_Name 110 (E_Identifier 111 ((*T2*) 24) ))) 
      (S_Sequence 112
      (S_Procedure_Call 113 114 ((*Increase*) 5) 
        ((E_Name 115 (E_Identifier 116 ((*T2*) 24) )) :: (E_Name 117 (E_Identifier 118 ((*T*) 22) )) :: nil)
      ) 
      (S_Sequence 119
      (S_If 120 (E_Binary_Operation 121 Greater_Than (E_Name 122 (E_Identifier 123 ((*T*) 22) )) (E_Literal 124 (Integer_Literal 0) ) )
        (S_Assignment 125 (E_Identifier 126 ((*T*) 22) ) (E_Binary_Operation 127 Plus (E_Name 128 (E_Identifier 129 ((*T*) 22) )) (E_Literal 130 (Integer_Literal 1) ) ))
        S_Null
      ) 
      (S_Sequence 131
      (S_If 132 (E_Binary_Operation 133 Greater_Than (E_Name 134 (E_Identifier 135 ((*T*) 22) )) (E_Literal 136 (Integer_Literal 1) ) )
        (S_Assignment 137 (E_Identifier 138 ((*T*) 22) ) (E_Binary_Operation 139 Plus (E_Name 140 (E_Identifier 141 ((*T*) 22) )) (E_Literal 142 (Integer_Literal 2) ) ))
        (S_Assignment 143 (E_Identifier 144 ((*T*) 22) ) (E_Binary_Operation 145 Minus (E_Name 146 (E_Identifier 147 ((*T*) 22) )) (E_Literal 148 (Integer_Literal 1) ) ))
      ) 
      (S_Sequence 149
      (S_While_Loop 150 (E_Binary_Operation 151 Greater_Than (E_Name 152 (E_Identifier 153 ((*T*) 22) )) (E_Literal 154 (Integer_Literal 0) ) )
        (S_Sequence 155
        (S_Assignment 156 (E_Identifier 157 ((*Result*) 21) ) (E_Binary_Operation 158 Divide (E_Binary_Operation 159 Multiply (E_Name 160 (E_Identifier 161 ((*Result*) 21) )) (E_Name 162 (E_Identifier 163 ((*T*) 22) )) ) (E_Name 164 (E_Identifier 165 ((*N*) 17) )) )) 
        (S_Assignment 166 (E_Identifier 167 ((*T*) 22) ) (E_Binary_Operation 168 Minus (E_Name 169 (E_Identifier 170 ((*T*) 22) )) (E_Literal 171 (Integer_Literal 1) ) )))
      ) 
      (S_Assignment 172 (E_Identifier 173 ((*M*) 18) ) (E_Name 174 (E_Identifier 175 ((*Result*) 21) ))))))))))))
  )
))))))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*A*) 20), (In_Out, (Array_Type ((*ArrayT*) 4)))) :: (((*X*) 14), (In, Integer)) :: (((*W*) 12), (In_Out, Integer)) :: (((*T1*) 23), (In_Out, Integer)) :: (((*U*) 13), (In_Out, Integer)) :: (((*Y*) 15), (Out, Integer)) :: (((*Result*) 21), (In_Out, Integer)) :: (((*T2*) 24), (In_Out, Integer)) :: (((*T*) 22), (In_Out, Integer)) :: (((*M*) 18), (Out, Integer)) :: (((*N*) 17), (In, Integer)) :: (((*R*) 19), (In_Out, (Record_Type ((*RecordT*) 1)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test*) 6), (0, (mkprocedure_body 40
  (* = = = Procedure Name = = = *)
  ((*Test*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 41 ((*N*) 17) Integer In) :: 
  (mkparameter_specification 42 ((*M*) 18) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 43
(D_Object_Declaration 44 (mkobject_declaration 45 ((*R*) 19) (Record_Type ((*RecordT*) 1)) None)) 
(D_Seq_Declaration 46
(D_Object_Declaration 47 (mkobject_declaration 48 ((*A*) 20) (Array_Type ((*ArrayT*) 4)) None)) 
(D_Seq_Declaration 49
(D_Object_Declaration 51 (mkobject_declaration 52 ((*Result*) 21) Integer (Some ((E_Literal 50 (Integer_Literal 1) ))))) 
(D_Seq_Declaration 53
(D_Object_Declaration 56 (mkobject_declaration 57 ((*T*) 22) Integer (Some ((E_Name 54 (E_Identifier 55 ((*Result*) 21) )))))) 
(D_Seq_Declaration 58
(D_Object_Declaration 59 (mkobject_declaration 60 ((*T1*) 23) Integer None)) 
(D_Object_Declaration 61 (mkobject_declaration 62 ((*T2*) 24) Integer None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 63
    (S_Assignment 64 (E_Selected_Component 65 66 ((*R*) 19) ((*X*) 2) ) (E_Binary_Operation 69 Plus (E_Binary_Operation 70 Plus (E_Name 71 (E_Identifier 72 ((*W*) 12) )) (E_Name 73 (E_Identifier 74 ((*U*) 13) )) ) (E_Literal 75 (Integer_Literal 1) ) )) 
    (S_Sequence 76
    (S_Assignment 77 (E_Indexed_Component 78 79 ((*A*) 20) (E_Name 81 (E_Identifier 82 ((*N*) 17) )) ) (E_Literal 83 (Integer_Literal 1) )) 
    (S_Sequence 84
    (S_Assignment 85 (E_Identifier 86 ((*T1*) 23) ) (E_Binary_Operation 87 Plus (E_Name 88 (E_Selected_Component 89 90 ((*R*) 19) ((*X*) 2) )) (E_Name 93 (E_Identifier 94 ((*N*) 17) )) )) 
    (S_Sequence 95
    (S_Assignment 96 (E_Identifier 97 ((*T2*) 24) ) (E_Binary_Operation 98 Plus (E_Name 99 (E_Indexed_Component 100 101 ((*A*) 20) (E_Name 103 (E_Identifier 104 ((*T1*) 23) )) )) (E_Name 105 (E_Identifier 106 ((*T1*) 23) )) )) 
    (S_Sequence 107
    (S_Assignment 108 (E_Identifier 109 ((*T*) 22) ) (E_Name 110 (E_Identifier 111 ((*T2*) 24) ))) 
    (S_Sequence 112
    (S_Procedure_Call 113 114 ((*Increase*) 5) 
      ((E_Name 115 (E_Identifier 116 ((*T2*) 24) )) :: (E_Name 117 (E_Identifier 118 ((*T*) 22) )) :: nil)
    ) 
    (S_Sequence 119
    (S_If 120 (E_Binary_Operation 121 Greater_Than (E_Name 122 (E_Identifier 123 ((*T*) 22) )) (E_Literal 124 (Integer_Literal 0) ) )
      (S_Assignment 125 (E_Identifier 126 ((*T*) 22) ) (E_Binary_Operation 127 Plus (E_Name 128 (E_Identifier 129 ((*T*) 22) )) (E_Literal 130 (Integer_Literal 1) ) ))
      S_Null
    ) 
    (S_Sequence 131
    (S_If 132 (E_Binary_Operation 133 Greater_Than (E_Name 134 (E_Identifier 135 ((*T*) 22) )) (E_Literal 136 (Integer_Literal 1) ) )
      (S_Assignment 137 (E_Identifier 138 ((*T*) 22) ) (E_Binary_Operation 139 Plus (E_Name 140 (E_Identifier 141 ((*T*) 22) )) (E_Literal 142 (Integer_Literal 2) ) ))
      (S_Assignment 143 (E_Identifier 144 ((*T*) 22) ) (E_Binary_Operation 145 Minus (E_Name 146 (E_Identifier 147 ((*T*) 22) )) (E_Literal 148 (Integer_Literal 1) ) ))
    ) 
    (S_Sequence 149
    (S_While_Loop 150 (E_Binary_Operation 151 Greater_Than (E_Name 152 (E_Identifier 153 ((*T*) 22) )) (E_Literal 154 (Integer_Literal 0) ) )
      (S_Sequence 155
      (S_Assignment 156 (E_Identifier 157 ((*Result*) 21) ) (E_Binary_Operation 158 Divide (E_Binary_Operation 159 Multiply (E_Name 160 (E_Identifier 161 ((*Result*) 21) )) (E_Name 162 (E_Identifier 163 ((*T*) 22) )) ) (E_Name 164 (E_Identifier 165 ((*N*) 17) )) )) 
      (S_Assignment 166 (E_Identifier 167 ((*T*) 22) ) (E_Binary_Operation 168 Minus (E_Name 169 (E_Identifier 170 ((*T*) 22) )) (E_Literal 171 (Integer_Literal 1) ) )))
    ) 
    (S_Assignment 172 (E_Identifier 173 ((*M*) 18) ) (E_Name 174 (E_Identifier 175 ((*Result*) 21) ))))))))))))
))) :: (((*Increase*) 5), (0, (mkprocedure_body 30
  (* = = = Procedure Name = = = *)
  ((*Increase*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 31 ((*X*) 14) Integer In) :: 
  (mkparameter_specification 32 ((*Y*) 15) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 33 (E_Identifier 34 ((*Y*) 15) ) (E_Binary_Operation 35 Plus (E_Name 36 (E_Identifier 37 ((*X*) 14) )) (E_Literal 38 (Integer_Literal 1) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*I*) 3), (Subtype_Declaration 8 ((*I*) 3) Integer (Range 0 5))) :: (((*RecordT*) 1), (Record_Type_Declaration 4 ((*RecordT*) 1) ((((*X*) 2), Integer) :: nil))) :: (((*ArrayT1*) 10), (Array_Type_Declaration 19 ((*ArrayT1*) 10) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) :: (((*RecordT1*) 8), (Record_Type_Declaration 15 ((*RecordT1*) 8) ((((*X*) 9), Integer) :: nil))) :: (((*ArrayT*) 4), (Array_Type_Declaration 11 ((*ArrayT*) 4) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((146, Integer) :: (92, Integer) :: (173, Integer) :: (164, Integer) :: (83, Integer) :: (110, Integer) :: (128, Integer) :: (104, Integer) :: (122, Integer) :: (167, Integer) :: (158, Integer) :: (86, Integer) :: (140, Integer) :: (50, Integer) :: (68, Integer) :: (134, Integer) :: (35, Integer) :: (80, (Array_Type ((*ArrayT*) 4))) :: (89, Integer) :: (116, Integer) :: (71, Integer) :: (98, Integer) :: (74, Integer) :: (38, Integer) :: (65, Integer) :: (175, Integer) :: (151, Boolean) :: (142, Integer) :: (124, Integer) :: (133, Boolean) :: (106, Integer) :: (169, Integer) :: (160, Integer) :: (115, Integer) :: (163, Integer) :: (127, Integer) :: (118, Integer) :: (136, Integer) :: (100, Integer) :: (82, Integer) :: (91, (Record_Type ((*RecordT*) 1))) :: (109, Integer) :: (145, Integer) :: (73, Integer) :: (55, Integer) :: (154, Integer) :: (139, Integer) :: (67, (Record_Type ((*RecordT*) 1))) :: (94, Integer) :: (130, Integer) :: (157, Integer) :: (148, Integer) :: (121, Boolean) :: (103, Integer) :: (97, Integer) :: (88, Integer) :: (70, Integer) :: (25, Integer) :: (34, Integer) :: (37, Integer) :: (174, Integer) :: (147, Integer) :: (129, Integer) :: (138, Integer) :: (165, Integer) :: (87, Integer) :: (168, Integer) :: (159, Integer) :: (141, Integer) :: (105, Integer) :: (123, Integer) :: (78, Integer) :: (69, Integer) :: (99, Integer) :: (54, Integer) :: (171, Integer) :: (162, Integer) :: (153, Integer) :: (144, Integer) :: (126, Integer) :: (81, Integer) :: (72, Integer) :: (135, Integer) :: (36, Integer) :: (117, Integer) :: (21, Integer) :: (93, Integer) :: (102, (Array_Type ((*ArrayT*) 4))) :: (75, Integer) :: (111, Integer) :: (152, Integer) :: (170, Integer) :: (161, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((146, (sloc (*Line*)42 (*Col*)15 (*EndLine*)42 (*EndCol*)15)) :: (92, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (173, (sloc (*Line*)50 (*Col*)7 (*EndLine*)50 (*EndCol*)7)) :: (164, (sloc (*Line*)46 (*Col*)35 (*EndLine*)46 (*EndCol*)35)) :: (83, (sloc (*Line*)28 (*Col*)15 (*EndLine*)28 (*EndCol*)15)) :: (110, (sloc (*Line*)31 (*Col*)12 (*EndLine*)31 (*EndCol*)13)) :: (128, (sloc (*Line*)36 (*Col*)15 (*EndLine*)36 (*EndCol*)15)) :: (104, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)16)) :: (122, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (167, (sloc (*Line*)47 (*Col*)10 (*EndLine*)47 (*EndCol*)10)) :: (158, (sloc (*Line*)46 (*Col*)20 (*EndLine*)46 (*EndCol*)35)) :: (86, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)8)) :: (140, (sloc (*Line*)40 (*Col*)15 (*EndLine*)40 (*EndCol*)15)) :: (50, (sloc (*Line*)22 (*Col*)26 (*EndLine*)22 (*EndCol*)26)) :: (68, (sloc (*Line*)27 (*Col*)9 (*EndLine*)27 (*EndCol*)9)) :: (134, (sloc (*Line*)39 (*Col*)10 (*EndLine*)39 (*EndCol*)10)) :: (35, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)16)) :: (80, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (89, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)15)) :: (116, (sloc (*Line*)33 (*Col*)16 (*EndLine*)33 (*EndCol*)17)) :: (71, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)14)) :: (98, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)22)) :: (74, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)18)) :: (38, (sloc (*Line*)14 (*Col*)16 (*EndLine*)14 (*EndCol*)16)) :: (65, (sloc (*Line*)27 (*Col*)7 (*EndLine*)27 (*EndCol*)9)) :: (175, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)17)) :: (151, (sloc (*Line*)45 (*Col*)13 (*EndLine*)45 (*EndCol*)17)) :: (142, (sloc (*Line*)40 (*Col*)19 (*EndLine*)40 (*EndCol*)19)) :: (124, (sloc (*Line*)35 (*Col*)14 (*EndLine*)35 (*EndCol*)14)) :: (133, (sloc (*Line*)39 (*Col*)10 (*EndLine*)39 (*EndCol*)14)) :: (106, (sloc (*Line*)30 (*Col*)21 (*EndLine*)30 (*EndCol*)22)) :: (169, (sloc (*Line*)47 (*Col*)15 (*EndLine*)47 (*EndCol*)15)) :: (160, (sloc (*Line*)46 (*Col*)21 (*EndLine*)46 (*EndCol*)26)) :: (115, (sloc (*Line*)33 (*Col*)16 (*EndLine*)33 (*EndCol*)17)) :: (163, (sloc (*Line*)46 (*Col*)30 (*EndLine*)46 (*EndCol*)30)) :: (127, (sloc (*Line*)36 (*Col*)15 (*EndLine*)36 (*EndCol*)19)) :: (118, (sloc (*Line*)33 (*Col*)20 (*EndLine*)33 (*EndCol*)20)) :: (136, (sloc (*Line*)39 (*Col*)14 (*EndLine*)39 (*EndCol*)14)) :: (100, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)17)) :: (82, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)9)) :: (91, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)13)) :: (109, (sloc (*Line*)31 (*Col*)7 (*EndLine*)31 (*EndCol*)7)) :: (145, (sloc (*Line*)42 (*Col*)15 (*EndLine*)42 (*EndCol*)19)) :: (73, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)18)) :: (55, (sloc (*Line*)23 (*Col*)21 (*EndLine*)23 (*EndCol*)26)) :: (154, (sloc (*Line*)45 (*Col*)17 (*EndLine*)45 (*EndCol*)17)) :: (139, (sloc (*Line*)40 (*Col*)15 (*EndLine*)40 (*EndCol*)19)) :: (67, (sloc (*Line*)27 (*Col*)7 (*EndLine*)27 (*EndCol*)7)) :: (94, (sloc (*Line*)29 (*Col*)19 (*EndLine*)29 (*EndCol*)19)) :: (130, (sloc (*Line*)36 (*Col*)19 (*EndLine*)36 (*EndCol*)19)) :: (157, (sloc (*Line*)46 (*Col*)10 (*EndLine*)46 (*EndCol*)15)) :: (148, (sloc (*Line*)42 (*Col*)19 (*EndLine*)42 (*EndCol*)19)) :: (121, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)14)) :: (103, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)16)) :: (97, (sloc (*Line*)30 (*Col*)7 (*EndLine*)30 (*EndCol*)8)) :: (88, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)15)) :: (70, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)18)) :: (25, (sloc (*Line*)10 (*Col*)18 (*EndLine*)10 (*EndCol*)18)) :: (34, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (37, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (174, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)17)) :: (147, (sloc (*Line*)42 (*Col*)15 (*EndLine*)42 (*EndCol*)15)) :: (129, (sloc (*Line*)36 (*Col*)15 (*EndLine*)36 (*EndCol*)15)) :: (138, (sloc (*Line*)40 (*Col*)10 (*EndLine*)40 (*EndCol*)10)) :: (165, (sloc (*Line*)46 (*Col*)35 (*EndLine*)46 (*EndCol*)35)) :: (87, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)19)) :: (168, (sloc (*Line*)47 (*Col*)15 (*EndLine*)47 (*EndCol*)19)) :: (159, (sloc (*Line*)46 (*Col*)21 (*EndLine*)46 (*EndCol*)30)) :: (141, (sloc (*Line*)40 (*Col*)15 (*EndLine*)40 (*EndCol*)15)) :: (105, (sloc (*Line*)30 (*Col*)21 (*EndLine*)30 (*EndCol*)22)) :: (123, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (78, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)10)) :: (69, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)22)) :: (99, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)17)) :: (54, (sloc (*Line*)23 (*Col*)21 (*EndLine*)23 (*EndCol*)26)) :: (171, (sloc (*Line*)47 (*Col*)19 (*EndLine*)47 (*EndCol*)19)) :: (162, (sloc (*Line*)46 (*Col*)30 (*EndLine*)46 (*EndCol*)30)) :: (153, (sloc (*Line*)45 (*Col*)13 (*EndLine*)45 (*EndCol*)13)) :: (144, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)10)) :: (126, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)10)) :: (81, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)9)) :: (72, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)14)) :: (135, (sloc (*Line*)39 (*Col*)10 (*EndLine*)39 (*EndCol*)10)) :: (36, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (117, (sloc (*Line*)33 (*Col*)20 (*EndLine*)33 (*EndCol*)20)) :: (21, (sloc (*Line*)9 (*Col*)18 (*EndLine*)9 (*EndCol*)18)) :: (93, (sloc (*Line*)29 (*Col*)19 (*EndLine*)29 (*EndCol*)19)) :: (102, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)13)) :: (75, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)22)) :: (111, (sloc (*Line*)31 (*Col*)12 (*EndLine*)31 (*EndCol*)13)) :: (152, (sloc (*Line*)45 (*Col*)13 (*EndLine*)45 (*EndCol*)13)) :: (170, (sloc (*Line*)47 (*Col*)15 (*EndLine*)47 (*EndCol*)15)) :: (161, (sloc (*Line*)46 (*Col*)21 (*EndLine*)46 (*EndCol*)26)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("T1", "ada://variable/Array_Record_Package-1:9/Test-12:14/T1+24:7")) :: (17, ("N", "ada://parameter/Array_Record_Package-1:9/Test-12:14/N-12:20")) :: (2, ("X", "ada://component/Array_Record_Package-1:9/RecordT-3:9/X-4:7")) :: (20, ("A", "ada://variable/Array_Record_Package-1:9/Test-12:14/A+20:7")) :: (14, ("X", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/X-10:23")) :: (13, ("U", "ada://variable/Array_Record_Package-1:9/U+10:4")) :: (22, ("T", "ada://variable/Array_Record_Package-1:9/Test-12:14/T+23:7")) :: (19, ("R", "ada://variable/Array_Record_Package-1:9/Test-12:14/R+19:7")) :: (9, ("X", "ada://component/Array_Record_Package-1:9/RecordT1+3:9/X+4:7")) :: (18, ("M", "ada://parameter/Array_Record_Package-1:9/Test-12:14/M-12:33")) :: (12, ("W", "ada://variable/Array_Record_Package-1:9/W+9:4")) :: (21, ("Result", "ada://variable/Array_Record_Package-1:9/Test-12:14/Result+22:7")) :: (24, ("T2", "ada://variable/Array_Record_Package-1:9/Test-12:14/T2+25:7")) :: (15, ("Y", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/Y-10:35")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Increase", "ada://procedure/Array_Record_Package-1:9/Increase-10:14")) :: (6, ("Test", "ada://procedure_body/Array_Record_Package-1:9/Test-12:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((7, ("Array_Record_Package", "ada://package_body/Array_Record_Package-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((8, ("RecordT1", "ada://ordinary_type/Array_Record_Package-1:9/RecordT1+3:9")) :: (4, ("ArrayT", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT-8:9")) :: (10, ("ArrayT1", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT1+7:9")) :: (1, ("RecordT", "ada://ordinary_type/Array_Record_Package-1:9/RecordT-3:9")) :: (3, ("I", "ada://subtype/Array_Record_Package-1:9/I-7:12")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Record_Type_Declaration_X 4 ((*RecordT*) 1) ((((*X*) 2), Integer) :: nil))) 
(D_Seq_Declaration_X 6
(D_Type_Declaration_X 7 (Subtype_Declaration_X 8 ((*I*) 3) Integer (Range_X 0 5))) 
(D_Seq_Declaration_X 9
(D_Type_Declaration_X 10 (Array_Type_Declaration_X 11 ((*ArrayT*) 4) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) 
(D_Seq_Declaration_X 12
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *))))) 
(D_Seq_Declaration_X 13
(D_Type_Declaration_X 14 (Record_Type_Declaration_X 15 ((*RecordT1*) 8) ((((*X*) 9), Integer) :: nil))) 
(D_Seq_Declaration_X 17
(D_Type_Declaration_X 18 (Array_Type_Declaration_X 19 ((*ArrayT1*) 10) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) 
(D_Seq_Declaration_X 20
(D_Object_Declaration_X 22 (mkobject_declaration_x 23 ((*W*) 12) Integer (Some ((E_Literal_X 21 (Integer_Literal 1) (nil) nil))))) 
(D_Seq_Declaration_X 24
(D_Object_Declaration_X 26 (mkobject_declaration_x 27 ((*U*) 13) Integer (Some ((E_Literal_X 25 (Integer_Literal 1) (nil) nil))))) 
(D_Seq_Declaration_X 28
(D_Procedure_Body_X 29 
  (mkprocedure_body_x 30
    (* = = = Procedure Name = = = *)
    ((*Increase*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 31 ((*X*) 14) Integer In) :: 
    (mkparameter_specification_x 32 ((*Y*) 15) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 33 (E_Identifier_X 34 ((*Y*) 15) (nil)) (E_Binary_Operation_X 35 Plus (E_Name_X 36 (E_Identifier_X 37 ((*X*) 14) (nil))) (E_Literal_X 38 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
  )
) 
(D_Procedure_Body_X 39 
  (mkprocedure_body_x 40
    (* = = = Procedure Name = = = *)
    ((*Test*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 41 ((*N*) 17) Integer In) :: 
    (mkparameter_specification_x 42 ((*M*) 18) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 43
  (D_Object_Declaration_X 44 (mkobject_declaration_x 45 ((*R*) 19) (Record_Type ((*RecordT*) 1)) None)) 
  (D_Seq_Declaration_X 46
  (D_Object_Declaration_X 47 (mkobject_declaration_x 48 ((*A*) 20) (Array_Type ((*ArrayT*) 4)) None)) 
  (D_Seq_Declaration_X 49
  (D_Object_Declaration_X 51 (mkobject_declaration_x 52 ((*Result*) 21) Integer (Some ((E_Literal_X 50 (Integer_Literal 1) (nil) nil))))) 
  (D_Seq_Declaration_X 53
  (D_Object_Declaration_X 56 (mkobject_declaration_x 57 ((*T*) 22) Integer (Some ((E_Name_X 54 (E_Identifier_X 55 ((*Result*) 21) (nil))))))) 
  (D_Seq_Declaration_X 58
  (D_Object_Declaration_X 59 (mkobject_declaration_x 60 ((*T1*) 23) Integer None)) 
  (D_Object_Declaration_X 61 (mkobject_declaration_x 62 ((*T2*) 24) Integer None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 63
      (S_Assignment_X 64 (E_Selected_Component_X 65 66 ((*R*) 19) ((*X*) 2) (nil)) (E_Binary_Operation_X 69 Plus (E_Binary_Operation_X 70 Plus (E_Name_X 71 (E_Identifier_X 72 ((*W*) 12) (nil))) (E_Name_X 73 (E_Identifier_X 74 ((*U*) 13) (nil))) (Do_Overflow_Check :: nil) nil) (E_Literal_X 75 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 76
      (S_Assignment_X 77 (E_Indexed_Component_X 78 79 ((*A*) 20) (E_Name_X 81 (E_Identifier_X 82 ((*N*) 17) (Do_Range_Check :: nil))) (nil)) (E_Literal_X 83 (Integer_Literal 1) (nil) nil)) 
      (S_Sequence_X 84
      (S_Assignment_X 85 (E_Identifier_X 86 ((*T1*) 23) (nil)) (E_Binary_Operation_X 87 Plus (E_Name_X 88 (E_Selected_Component_X 89 90 ((*R*) 19) ((*X*) 2) (nil))) (E_Name_X 93 (E_Identifier_X 94 ((*N*) 17) (nil))) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 95
      (S_Assignment_X 96 (E_Identifier_X 97 ((*T2*) 24) (nil)) (E_Binary_Operation_X 98 Plus (E_Name_X 99 (E_Indexed_Component_X 100 101 ((*A*) 20) (E_Name_X 103 (E_Identifier_X 104 ((*T1*) 23) (Do_Range_Check :: nil))) (nil))) (E_Name_X 105 (E_Identifier_X 106 ((*T1*) 23) (nil))) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 107
      (S_Assignment_X 108 (E_Identifier_X 109 ((*T*) 22) (nil)) (E_Name_X 110 (E_Identifier_X 111 ((*T2*) 24) (nil)))) 
      (S_Sequence_X 112
      (S_Procedure_Call_X 113 114 ((*Increase*) 5) 
        ((E_Name_X 115 (E_Identifier_X 116 ((*T2*) 24) (nil))) :: (E_Name_X 117 (E_Identifier_X 118 ((*T*) 22) (nil))) :: nil)
      ) 
      (S_Sequence_X 119
      (S_If_X 120 (E_Binary_Operation_X 121 Greater_Than (E_Name_X 122 (E_Identifier_X 123 ((*T*) 22) (nil))) (E_Literal_X 124 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Assignment_X 125 (E_Identifier_X 126 ((*T*) 22) (nil)) (E_Binary_Operation_X 127 Plus (E_Name_X 128 (E_Identifier_X 129 ((*T*) 22) (nil))) (E_Literal_X 130 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
        S_Null_X
      ) 
      (S_Sequence_X 131
      (S_If_X 132 (E_Binary_Operation_X 133 Greater_Than (E_Name_X 134 (E_Identifier_X 135 ((*T*) 22) (nil))) (E_Literal_X 136 (Integer_Literal 1) (nil) nil) (nil) nil)
        (S_Assignment_X 137 (E_Identifier_X 138 ((*T*) 22) (nil)) (E_Binary_Operation_X 139 Plus (E_Name_X 140 (E_Identifier_X 141 ((*T*) 22) (nil))) (E_Literal_X 142 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil))
        (S_Assignment_X 143 (E_Identifier_X 144 ((*T*) 22) (nil)) (E_Binary_Operation_X 145 Minus (E_Name_X 146 (E_Identifier_X 147 ((*T*) 22) (nil))) (E_Literal_X 148 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      ) 
      (S_Sequence_X 149
      (S_While_Loop_X 150 (E_Binary_Operation_X 151 Greater_Than (E_Name_X 152 (E_Identifier_X 153 ((*T*) 22) (nil))) (E_Literal_X 154 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Sequence_X 155
        (S_Assignment_X 156 (E_Identifier_X 157 ((*Result*) 21) (nil)) (E_Binary_Operation_X 158 Divide (E_Binary_Operation_X 159 Multiply (E_Name_X 160 (E_Identifier_X 161 ((*Result*) 21) (nil))) (E_Name_X 162 (E_Identifier_X 163 ((*T*) 22) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 164 (E_Identifier_X 165 ((*N*) 17) (nil))) (Do_Division_Check :: Do_Overflow_Check :: nil) nil)) 
        (S_Assignment_X 166 (E_Identifier_X 167 ((*T*) 22) (nil)) (E_Binary_Operation_X 168 Minus (E_Name_X 169 (E_Identifier_X 170 ((*T*) 22) (nil))) (E_Literal_X 171 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
      ) 
      (S_Assignment_X 172 (E_Identifier_X 173 ((*M*) 18) (nil)) (E_Name_X 174 (E_Identifier_X 175 ((*Result*) 21) (nil)))))))))))))
  )
))))))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*A*) 20), (In_Out, (Array_Type ((*ArrayT*) 4)))) :: (((*X*) 14), (In, Integer)) :: (((*W*) 12), (In_Out, Integer)) :: (((*T1*) 23), (In_Out, Integer)) :: (((*U*) 13), (In_Out, Integer)) :: (((*Y*) 15), (Out, Integer)) :: (((*Result*) 21), (In_Out, Integer)) :: (((*T2*) 24), (In_Out, Integer)) :: (((*T*) 22), (In_Out, Integer)) :: (((*M*) 18), (Out, Integer)) :: (((*N*) 17), (In, Integer)) :: (((*R*) 19), (In_Out, (Record_Type ((*RecordT*) 1)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test*) 6), (0, (mkprocedure_body_x 40
  (* = = = Procedure Name = = = *)
  ((*Test*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 41 ((*N*) 17) Integer In) :: 
  (mkparameter_specification_x 42 ((*M*) 18) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 43
(D_Object_Declaration_X 44 (mkobject_declaration_x 45 ((*R*) 19) (Record_Type ((*RecordT*) 1)) None)) 
(D_Seq_Declaration_X 46
(D_Object_Declaration_X 47 (mkobject_declaration_x 48 ((*A*) 20) (Array_Type ((*ArrayT*) 4)) None)) 
(D_Seq_Declaration_X 49
(D_Object_Declaration_X 51 (mkobject_declaration_x 52 ((*Result*) 21) Integer (Some ((E_Literal_X 50 (Integer_Literal 1) (nil) nil))))) 
(D_Seq_Declaration_X 53
(D_Object_Declaration_X 56 (mkobject_declaration_x 57 ((*T*) 22) Integer (Some ((E_Name_X 54 (E_Identifier_X 55 ((*Result*) 21) (nil))))))) 
(D_Seq_Declaration_X 58
(D_Object_Declaration_X 59 (mkobject_declaration_x 60 ((*T1*) 23) Integer None)) 
(D_Object_Declaration_X 61 (mkobject_declaration_x 62 ((*T2*) 24) Integer None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 63
    (S_Assignment_X 64 (E_Selected_Component_X 65 66 ((*R*) 19) ((*X*) 2) (nil)) (E_Binary_Operation_X 69 Plus (E_Binary_Operation_X 70 Plus (E_Name_X 71 (E_Identifier_X 72 ((*W*) 12) (nil))) (E_Name_X 73 (E_Identifier_X 74 ((*U*) 13) (nil))) (Do_Overflow_Check :: nil) nil) (E_Literal_X 75 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
    (S_Sequence_X 76
    (S_Assignment_X 77 (E_Indexed_Component_X 78 79 ((*A*) 20) (E_Name_X 81 (E_Identifier_X 82 ((*N*) 17) (Do_Range_Check :: nil))) (nil)) (E_Literal_X 83 (Integer_Literal 1) (nil) nil)) 
    (S_Sequence_X 84
    (S_Assignment_X 85 (E_Identifier_X 86 ((*T1*) 23) (nil)) (E_Binary_Operation_X 87 Plus (E_Name_X 88 (E_Selected_Component_X 89 90 ((*R*) 19) ((*X*) 2) (nil))) (E_Name_X 93 (E_Identifier_X 94 ((*N*) 17) (nil))) (Do_Overflow_Check :: nil) nil)) 
    (S_Sequence_X 95
    (S_Assignment_X 96 (E_Identifier_X 97 ((*T2*) 24) (nil)) (E_Binary_Operation_X 98 Plus (E_Name_X 99 (E_Indexed_Component_X 100 101 ((*A*) 20) (E_Name_X 103 (E_Identifier_X 104 ((*T1*) 23) (Do_Range_Check :: nil))) (nil))) (E_Name_X 105 (E_Identifier_X 106 ((*T1*) 23) (nil))) (Do_Overflow_Check :: nil) nil)) 
    (S_Sequence_X 107
    (S_Assignment_X 108 (E_Identifier_X 109 ((*T*) 22) (nil)) (E_Name_X 110 (E_Identifier_X 111 ((*T2*) 24) (nil)))) 
    (S_Sequence_X 112
    (S_Procedure_Call_X 113 114 ((*Increase*) 5) 
      ((E_Name_X 115 (E_Identifier_X 116 ((*T2*) 24) (nil))) :: (E_Name_X 117 (E_Identifier_X 118 ((*T*) 22) (nil))) :: nil)
    ) 
    (S_Sequence_X 119
    (S_If_X 120 (E_Binary_Operation_X 121 Greater_Than (E_Name_X 122 (E_Identifier_X 123 ((*T*) 22) (nil))) (E_Literal_X 124 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Assignment_X 125 (E_Identifier_X 126 ((*T*) 22) (nil)) (E_Binary_Operation_X 127 Plus (E_Name_X 128 (E_Identifier_X 129 ((*T*) 22) (nil))) (E_Literal_X 130 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      S_Null_X
    ) 
    (S_Sequence_X 131
    (S_If_X 132 (E_Binary_Operation_X 133 Greater_Than (E_Name_X 134 (E_Identifier_X 135 ((*T*) 22) (nil))) (E_Literal_X 136 (Integer_Literal 1) (nil) nil) (nil) nil)
      (S_Assignment_X 137 (E_Identifier_X 138 ((*T*) 22) (nil)) (E_Binary_Operation_X 139 Plus (E_Name_X 140 (E_Identifier_X 141 ((*T*) 22) (nil))) (E_Literal_X 142 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil))
      (S_Assignment_X 143 (E_Identifier_X 144 ((*T*) 22) (nil)) (E_Binary_Operation_X 145 Minus (E_Name_X 146 (E_Identifier_X 147 ((*T*) 22) (nil))) (E_Literal_X 148 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
    ) 
    (S_Sequence_X 149
    (S_While_Loop_X 150 (E_Binary_Operation_X 151 Greater_Than (E_Name_X 152 (E_Identifier_X 153 ((*T*) 22) (nil))) (E_Literal_X 154 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Sequence_X 155
      (S_Assignment_X 156 (E_Identifier_X 157 ((*Result*) 21) (nil)) (E_Binary_Operation_X 158 Divide (E_Binary_Operation_X 159 Multiply (E_Name_X 160 (E_Identifier_X 161 ((*Result*) 21) (nil))) (E_Name_X 162 (E_Identifier_X 163 ((*T*) 22) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 164 (E_Identifier_X 165 ((*N*) 17) (nil))) (Do_Division_Check :: Do_Overflow_Check :: nil) nil)) 
      (S_Assignment_X 166 (E_Identifier_X 167 ((*T*) 22) (nil)) (E_Binary_Operation_X 168 Minus (E_Name_X 169 (E_Identifier_X 170 ((*T*) 22) (nil))) (E_Literal_X 171 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
    ) 
    (S_Assignment_X 172 (E_Identifier_X 173 ((*M*) 18) (nil)) (E_Name_X 174 (E_Identifier_X 175 ((*Result*) 21) (nil)))))))))))))
))) :: (((*Increase*) 5), (0, (mkprocedure_body_x 30
  (* = = = Procedure Name = = = *)
  ((*Increase*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 31 ((*X*) 14) Integer In) :: 
  (mkparameter_specification_x 32 ((*Y*) 15) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 33 (E_Identifier_X 34 ((*Y*) 15) (nil)) (E_Binary_Operation_X 35 Plus (E_Name_X 36 (E_Identifier_X 37 ((*X*) 14) (nil))) (E_Literal_X 38 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*I*) 3), (Subtype_Declaration_X 8 ((*I*) 3) Integer (Range_X 0 5))) :: (((*RecordT*) 1), (Record_Type_Declaration_X 4 ((*RecordT*) 1) ((((*X*) 2), Integer) :: nil))) :: (((*ArrayT1*) 10), (Array_Type_Declaration_X 19 ((*ArrayT1*) 10) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) :: (((*RecordT1*) 8), (Record_Type_Declaration_X 15 ((*RecordT1*) 8) ((((*X*) 9), Integer) :: nil))) :: (((*ArrayT*) 4), (Array_Type_Declaration_X 11 ((*ArrayT*) 4) ((*index subtype mark*) Integer) ((*component type*) (Subtype ((*I*) 3))))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((146, Integer) :: (92, Integer) :: (173, Integer) :: (164, Integer) :: (83, Integer) :: (110, Integer) :: (128, Integer) :: (104, Integer) :: (122, Integer) :: (167, Integer) :: (158, Integer) :: (86, Integer) :: (140, Integer) :: (50, Integer) :: (68, Integer) :: (134, Integer) :: (35, Integer) :: (80, (Array_Type ((*ArrayT*) 4))) :: (89, Integer) :: (116, Integer) :: (71, Integer) :: (98, Integer) :: (74, Integer) :: (38, Integer) :: (65, Integer) :: (175, Integer) :: (151, Boolean) :: (142, Integer) :: (124, Integer) :: (133, Boolean) :: (106, Integer) :: (169, Integer) :: (160, Integer) :: (115, Integer) :: (163, Integer) :: (127, Integer) :: (118, Integer) :: (136, Integer) :: (100, Integer) :: (82, Integer) :: (91, (Record_Type ((*RecordT*) 1))) :: (109, Integer) :: (145, Integer) :: (73, Integer) :: (55, Integer) :: (154, Integer) :: (139, Integer) :: (67, (Record_Type ((*RecordT*) 1))) :: (94, Integer) :: (130, Integer) :: (157, Integer) :: (148, Integer) :: (121, Boolean) :: (103, Integer) :: (97, Integer) :: (88, Integer) :: (70, Integer) :: (25, Integer) :: (34, Integer) :: (37, Integer) :: (174, Integer) :: (147, Integer) :: (129, Integer) :: (138, Integer) :: (165, Integer) :: (87, Integer) :: (168, Integer) :: (159, Integer) :: (141, Integer) :: (105, Integer) :: (123, Integer) :: (78, Integer) :: (69, Integer) :: (99, Integer) :: (54, Integer) :: (171, Integer) :: (162, Integer) :: (153, Integer) :: (144, Integer) :: (126, Integer) :: (81, Integer) :: (72, Integer) :: (135, Integer) :: (36, Integer) :: (117, Integer) :: (21, Integer) :: (93, Integer) :: (102, (Array_Type ((*ArrayT*) 4))) :: (75, Integer) :: (111, Integer) :: (152, Integer) :: (170, Integer) :: (161, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((146, (sloc (*Line*)42 (*Col*)15 (*EndLine*)42 (*EndCol*)15)) :: (92, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (173, (sloc (*Line*)50 (*Col*)7 (*EndLine*)50 (*EndCol*)7)) :: (164, (sloc (*Line*)46 (*Col*)35 (*EndLine*)46 (*EndCol*)35)) :: (83, (sloc (*Line*)28 (*Col*)15 (*EndLine*)28 (*EndCol*)15)) :: (110, (sloc (*Line*)31 (*Col*)12 (*EndLine*)31 (*EndCol*)13)) :: (128, (sloc (*Line*)36 (*Col*)15 (*EndLine*)36 (*EndCol*)15)) :: (104, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)16)) :: (122, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (167, (sloc (*Line*)47 (*Col*)10 (*EndLine*)47 (*EndCol*)10)) :: (158, (sloc (*Line*)46 (*Col*)20 (*EndLine*)46 (*EndCol*)35)) :: (86, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)8)) :: (140, (sloc (*Line*)40 (*Col*)15 (*EndLine*)40 (*EndCol*)15)) :: (50, (sloc (*Line*)22 (*Col*)26 (*EndLine*)22 (*EndCol*)26)) :: (68, (sloc (*Line*)27 (*Col*)9 (*EndLine*)27 (*EndCol*)9)) :: (134, (sloc (*Line*)39 (*Col*)10 (*EndLine*)39 (*EndCol*)10)) :: (35, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)16)) :: (80, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (89, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)15)) :: (116, (sloc (*Line*)33 (*Col*)16 (*EndLine*)33 (*EndCol*)17)) :: (71, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)14)) :: (98, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)22)) :: (74, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)18)) :: (38, (sloc (*Line*)14 (*Col*)16 (*EndLine*)14 (*EndCol*)16)) :: (65, (sloc (*Line*)27 (*Col*)7 (*EndLine*)27 (*EndCol*)9)) :: (175, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)17)) :: (151, (sloc (*Line*)45 (*Col*)13 (*EndLine*)45 (*EndCol*)17)) :: (142, (sloc (*Line*)40 (*Col*)19 (*EndLine*)40 (*EndCol*)19)) :: (124, (sloc (*Line*)35 (*Col*)14 (*EndLine*)35 (*EndCol*)14)) :: (133, (sloc (*Line*)39 (*Col*)10 (*EndLine*)39 (*EndCol*)14)) :: (106, (sloc (*Line*)30 (*Col*)21 (*EndLine*)30 (*EndCol*)22)) :: (169, (sloc (*Line*)47 (*Col*)15 (*EndLine*)47 (*EndCol*)15)) :: (160, (sloc (*Line*)46 (*Col*)21 (*EndLine*)46 (*EndCol*)26)) :: (115, (sloc (*Line*)33 (*Col*)16 (*EndLine*)33 (*EndCol*)17)) :: (163, (sloc (*Line*)46 (*Col*)30 (*EndLine*)46 (*EndCol*)30)) :: (127, (sloc (*Line*)36 (*Col*)15 (*EndLine*)36 (*EndCol*)19)) :: (118, (sloc (*Line*)33 (*Col*)20 (*EndLine*)33 (*EndCol*)20)) :: (136, (sloc (*Line*)39 (*Col*)14 (*EndLine*)39 (*EndCol*)14)) :: (100, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)17)) :: (82, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)9)) :: (91, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)13)) :: (109, (sloc (*Line*)31 (*Col*)7 (*EndLine*)31 (*EndCol*)7)) :: (145, (sloc (*Line*)42 (*Col*)15 (*EndLine*)42 (*EndCol*)19)) :: (73, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)18)) :: (55, (sloc (*Line*)23 (*Col*)21 (*EndLine*)23 (*EndCol*)26)) :: (154, (sloc (*Line*)45 (*Col*)17 (*EndLine*)45 (*EndCol*)17)) :: (139, (sloc (*Line*)40 (*Col*)15 (*EndLine*)40 (*EndCol*)19)) :: (67, (sloc (*Line*)27 (*Col*)7 (*EndLine*)27 (*EndCol*)7)) :: (94, (sloc (*Line*)29 (*Col*)19 (*EndLine*)29 (*EndCol*)19)) :: (130, (sloc (*Line*)36 (*Col*)19 (*EndLine*)36 (*EndCol*)19)) :: (157, (sloc (*Line*)46 (*Col*)10 (*EndLine*)46 (*EndCol*)15)) :: (148, (sloc (*Line*)42 (*Col*)19 (*EndLine*)42 (*EndCol*)19)) :: (121, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)14)) :: (103, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)16)) :: (97, (sloc (*Line*)30 (*Col*)7 (*EndLine*)30 (*EndCol*)8)) :: (88, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)15)) :: (70, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)18)) :: (25, (sloc (*Line*)10 (*Col*)18 (*EndLine*)10 (*EndCol*)18)) :: (34, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (37, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (174, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)17)) :: (147, (sloc (*Line*)42 (*Col*)15 (*EndLine*)42 (*EndCol*)15)) :: (129, (sloc (*Line*)36 (*Col*)15 (*EndLine*)36 (*EndCol*)15)) :: (138, (sloc (*Line*)40 (*Col*)10 (*EndLine*)40 (*EndCol*)10)) :: (165, (sloc (*Line*)46 (*Col*)35 (*EndLine*)46 (*EndCol*)35)) :: (87, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)19)) :: (168, (sloc (*Line*)47 (*Col*)15 (*EndLine*)47 (*EndCol*)19)) :: (159, (sloc (*Line*)46 (*Col*)21 (*EndLine*)46 (*EndCol*)30)) :: (141, (sloc (*Line*)40 (*Col*)15 (*EndLine*)40 (*EndCol*)15)) :: (105, (sloc (*Line*)30 (*Col*)21 (*EndLine*)30 (*EndCol*)22)) :: (123, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (78, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)10)) :: (69, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)22)) :: (99, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)17)) :: (54, (sloc (*Line*)23 (*Col*)21 (*EndLine*)23 (*EndCol*)26)) :: (171, (sloc (*Line*)47 (*Col*)19 (*EndLine*)47 (*EndCol*)19)) :: (162, (sloc (*Line*)46 (*Col*)30 (*EndLine*)46 (*EndCol*)30)) :: (153, (sloc (*Line*)45 (*Col*)13 (*EndLine*)45 (*EndCol*)13)) :: (144, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)10)) :: (126, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)10)) :: (81, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)9)) :: (72, (sloc (*Line*)27 (*Col*)14 (*EndLine*)27 (*EndCol*)14)) :: (135, (sloc (*Line*)39 (*Col*)10 (*EndLine*)39 (*EndCol*)10)) :: (36, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (117, (sloc (*Line*)33 (*Col*)20 (*EndLine*)33 (*EndCol*)20)) :: (21, (sloc (*Line*)9 (*Col*)18 (*EndLine*)9 (*EndCol*)18)) :: (93, (sloc (*Line*)29 (*Col*)19 (*EndLine*)29 (*EndCol*)19)) :: (102, (sloc (*Line*)30 (*Col*)13 (*EndLine*)30 (*EndCol*)13)) :: (75, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)22)) :: (111, (sloc (*Line*)31 (*Col*)12 (*EndLine*)31 (*EndCol*)13)) :: (152, (sloc (*Line*)45 (*Col*)13 (*EndLine*)45 (*EndCol*)13)) :: (170, (sloc (*Line*)47 (*Col*)15 (*EndLine*)47 (*EndCol*)15)) :: (161, (sloc (*Line*)46 (*Col*)21 (*EndLine*)46 (*EndCol*)26)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("T1", "ada://variable/Array_Record_Package-1:9/Test-12:14/T1+24:7")) :: (17, ("N", "ada://parameter/Array_Record_Package-1:9/Test-12:14/N-12:20")) :: (2, ("X", "ada://component/Array_Record_Package-1:9/RecordT-3:9/X-4:7")) :: (20, ("A", "ada://variable/Array_Record_Package-1:9/Test-12:14/A+20:7")) :: (14, ("X", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/X-10:23")) :: (13, ("U", "ada://variable/Array_Record_Package-1:9/U+10:4")) :: (22, ("T", "ada://variable/Array_Record_Package-1:9/Test-12:14/T+23:7")) :: (19, ("R", "ada://variable/Array_Record_Package-1:9/Test-12:14/R+19:7")) :: (9, ("X", "ada://component/Array_Record_Package-1:9/RecordT1+3:9/X+4:7")) :: (18, ("M", "ada://parameter/Array_Record_Package-1:9/Test-12:14/M-12:33")) :: (12, ("W", "ada://variable/Array_Record_Package-1:9/W+9:4")) :: (21, ("Result", "ada://variable/Array_Record_Package-1:9/Test-12:14/Result+22:7")) :: (24, ("T2", "ada://variable/Array_Record_Package-1:9/Test-12:14/T2+25:7")) :: (15, ("Y", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/Y-10:35")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Increase", "ada://procedure/Array_Record_Package-1:9/Increase-10:14")) :: (6, ("Test", "ada://procedure_body/Array_Record_Package-1:9/Test-12:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((7, ("Array_Record_Package", "ada://package_body/Array_Record_Package-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((8, ("RecordT1", "ada://ordinary_type/Array_Record_Package-1:9/RecordT1+3:9")) :: (4, ("ArrayT", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT-8:9")) :: (10, ("ArrayT1", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT1+7:9")) :: (1, ("RecordT", "ada://ordinary_type/Array_Record_Package-1:9/RecordT-3:9")) :: (3, ("I", "ada://subtype/Array_Record_Package-1:9/I-7:12")) :: nil)
))
).

