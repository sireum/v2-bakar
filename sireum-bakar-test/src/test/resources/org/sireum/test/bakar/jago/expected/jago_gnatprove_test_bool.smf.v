Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Bool*) 1)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 3
  D_Null_Declaration (* Undefined Declarations ! *) 
  (D_Seq_Declaration 4
  (D_Procedure_Body 5 
    (mkprocedure_body 6
      (* = = = Procedure Name = = = *)
      ((*Swap*) 2)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 7 ((*X*) 3) Boolean In_Out) :: (mkparameter_specification 8 ((*Y*) 4) Boolean In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration)
      (* = = = Procedure Body = = = *)
        (S_Sequence 9
        (S_Assignment 10 (E_Identifier 11 ((*X*) 3) ) (E_Binary_Operation 12 Or (E_Name 13 (E_Identifier 14 ((*X*) 3) )) (E_Name 15 (E_Identifier 16 ((*Y*) 4) )) )) 
        (S_Sequence 17
        (S_Assignment 18 (E_Identifier 19 ((*Y*) 4) ) (E_Binary_Operation 20 Equal (E_Name 21 (E_Identifier 22 ((*X*) 3) )) (E_Name 23 (E_Identifier 24 ((*Y*) 4) )) )) 
        (S_Sequence 25
        (S_Assignment 26 (E_Identifier 27 ((*X*) 3) ) (E_Binary_Operation 28 Or (E_Name 29 (E_Identifier 30 ((*X*) 3) )) (E_Name 31 (E_Identifier 32 ((*Y*) 4) )) )) 
        (S_Sequence 33
        (S_Assignment 34 (E_Identifier 35 ((*X*) 3) ) (E_Unary_Operation 36 Not (E_Name 37 (E_Identifier 38 ((*X*) 3) )) )) 
        (S_Assignment 39 (E_Identifier 40 ((*Y*) 4) ) (E_Unary_Operation 41 Not (E_Name 42 (E_Identifier 43 ((*Y*) 4) )) ))))))
    )
  ) 
  (D_Seq_Declaration 44
  D_Null_Declaration (* Undefined Declarations ! *) 
  (D_Seq_Declaration 45
  (D_Procedure_Body 46 
    (mkprocedure_body 47
      (* = = = Procedure Name = = = *)
      ((*Implies*) 6)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 48 ((*X*) 7) Boolean In_Out) :: (mkparameter_specification 49 ((*Y*) 8) Boolean In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      ((D_Object_Declaration 55 (mkobject_declaration 56 ((*Z*) 9) Boolean (Some ((E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ))))))
      (* = = = Procedure Body = = = *)
        (S_Sequence 57
        (S_Assignment 58 (E_Identifier 59 ((*X*) 7) ) (E_Binary_Operation 60 Or (E_Unary_Operation 61 Not (E_Name 62 (E_Identifier 63 ((*X*) 7) )) ) (E_Name 64 (E_Identifier 65 ((*Z*) 9) )) )) 
        (S_Assignment 66 (E_Identifier 67 ((*Y*) 8) ) (E_Binary_Operation 68 Or (E_Unary_Operation 69 Not (E_Name 70 (E_Identifier 71 ((*Y*) 8) )) ) (E_Name 72 (E_Identifier 73 ((*Z*) 9) )) )))
    )
  ) 
  (D_Seq_Declaration 74
  (D_Object_Declaration 75 (mkobject_declaration 76 ((*X*) 10) Boolean None)) 
  (D_Object_Declaration 77 (mkobject_declaration 78 ((*Y*) 11) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 79
      (S_Assignment 80 (E_Identifier 81 ((*X*) 10) ) (E_Literal 82 (Boolean_Literal true) )) 
      (S_Sequence 83
      (S_Assignment 84 (E_Identifier 85 ((*Y*) 11) ) (E_Literal 86 (Boolean_Literal false) )) 
      (S_Sequence 87
      (S_Procedure_Call 88 89 ((*Swap*) 2) 
        ((E_Name 90 (E_Identifier 91 ((*X*) 10) )) :: (E_Name 92 (E_Identifier 93 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 94
      (S_Procedure_Call 95 96 ((*Implies*) 6) 
        ((E_Name 97 (E_Identifier 98 ((*X*) 10) )) :: (E_Name 99 (E_Identifier 100 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 101
      (S_Assignment 102 (E_Identifier 103 ((*X*) 10) ) (E_Literal 104 (Boolean_Literal false) )) 
      (S_Sequence 105
      (S_Assignment 106 (E_Identifier 107 ((*Y*) 11) ) (E_Literal 108 (Boolean_Literal true) )) 
      (S_Sequence 109
      (S_Procedure_Call 110 111 ((*Swap*) 2) 
        ((E_Name 112 (E_Identifier 113 ((*X*) 10) )) :: (E_Name 114 (E_Identifier 115 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 116
      (S_Procedure_Call 117 118 ((*Implies*) 6) 
        ((E_Name 119 (E_Identifier 120 ((*X*) 10) )) :: (E_Name 121 (E_Identifier 122 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 123
      (S_Assignment 124 (E_Identifier 125 ((*X*) 10) ) (E_Literal 126 (Boolean_Literal false) )) 
      (S_Sequence 127
      (S_Assignment 128 (E_Identifier 129 ((*Y*) 11) ) (E_Literal 130 (Boolean_Literal false) )) 
      (S_Sequence 131
      (S_Procedure_Call 132 133 ((*Swap*) 2) 
        ((E_Name 134 (E_Identifier 135 ((*X*) 10) )) :: (E_Name 136 (E_Identifier 137 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 138
      (S_Procedure_Call 139 140 ((*Implies*) 6) 
        ((E_Name 141 (E_Identifier 142 ((*X*) 10) )) :: (E_Name 143 (E_Identifier 144 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 145
      (S_Assignment 146 (E_Identifier 147 ((*X*) 10) ) (E_Literal 148 (Boolean_Literal true) )) 
      (S_Sequence 149
      (S_Assignment 150 (E_Identifier 151 ((*Y*) 11) ) (E_Literal 152 (Boolean_Literal true) )) 
      (S_Sequence 153
      (S_Procedure_Call 154 155 ((*Swap*) 2) 
        ((E_Name 156 (E_Identifier 157 ((*X*) 10) )) :: (E_Name 158 (E_Identifier 159 ((*Y*) 11) )) :: nil)
      ) 
      (S_Procedure_Call 160 161 ((*Implies*) 6) 
        ((E_Name 162 (E_Identifier 163 ((*X*) 10) )) :: (E_Name 164 (E_Identifier 165 ((*Y*) 11) )) :: nil)
      ))))))))))))))))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Y*) 8), (In_Out, Boolean)) :: (((*X*) 7), (In_Out, Boolean)) :: (((*X*) 10), (In_Out, Boolean)) :: (((*Y*) 4), (In_Out, Boolean)) :: (((*X*) 3), (In_Out, Boolean)) :: (((*Y*) 11), (In_Out, Boolean)) :: (((*Z*) 9), (In, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Bool*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Bool*) 1)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 3
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 4
(D_Procedure_Body 5 
  (mkprocedure_body 6
    (* = = = Procedure Name = = = *)
    ((*Swap*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 7 ((*X*) 3) Boolean In_Out) :: (mkparameter_specification 8 ((*Y*) 4) Boolean In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 9
      (S_Assignment 10 (E_Identifier 11 ((*X*) 3) ) (E_Binary_Operation 12 Or (E_Name 13 (E_Identifier 14 ((*X*) 3) )) (E_Name 15 (E_Identifier 16 ((*Y*) 4) )) )) 
      (S_Sequence 17
      (S_Assignment 18 (E_Identifier 19 ((*Y*) 4) ) (E_Binary_Operation 20 Equal (E_Name 21 (E_Identifier 22 ((*X*) 3) )) (E_Name 23 (E_Identifier 24 ((*Y*) 4) )) )) 
      (S_Sequence 25
      (S_Assignment 26 (E_Identifier 27 ((*X*) 3) ) (E_Binary_Operation 28 Or (E_Name 29 (E_Identifier 30 ((*X*) 3) )) (E_Name 31 (E_Identifier 32 ((*Y*) 4) )) )) 
      (S_Sequence 33
      (S_Assignment 34 (E_Identifier 35 ((*X*) 3) ) (E_Unary_Operation 36 Not (E_Name 37 (E_Identifier 38 ((*X*) 3) )) )) 
      (S_Assignment 39 (E_Identifier 40 ((*Y*) 4) ) (E_Unary_Operation 41 Not (E_Name 42 (E_Identifier 43 ((*Y*) 4) )) ))))))
  )
) 
(D_Seq_Declaration 44
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 45
(D_Procedure_Body 46 
  (mkprocedure_body 47
    (* = = = Procedure Name = = = *)
    ((*Implies*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 48 ((*X*) 7) Boolean In_Out) :: (mkparameter_specification 49 ((*Y*) 8) Boolean In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 55 (mkobject_declaration 56 ((*Z*) 9) Boolean (Some ((E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 57
      (S_Assignment 58 (E_Identifier 59 ((*X*) 7) ) (E_Binary_Operation 60 Or (E_Unary_Operation 61 Not (E_Name 62 (E_Identifier 63 ((*X*) 7) )) ) (E_Name 64 (E_Identifier 65 ((*Z*) 9) )) )) 
      (S_Assignment 66 (E_Identifier 67 ((*Y*) 8) ) (E_Binary_Operation 68 Or (E_Unary_Operation 69 Not (E_Name 70 (E_Identifier 71 ((*Y*) 8) )) ) (E_Name 72 (E_Identifier 73 ((*Z*) 9) )) )))
  )
) 
(D_Seq_Declaration 74
(D_Object_Declaration 75 (mkobject_declaration 76 ((*X*) 10) Boolean None)) 
(D_Object_Declaration 77 (mkobject_declaration 78 ((*Y*) 11) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 79
    (S_Assignment 80 (E_Identifier 81 ((*X*) 10) ) (E_Literal 82 (Boolean_Literal true) )) 
    (S_Sequence 83
    (S_Assignment 84 (E_Identifier 85 ((*Y*) 11) ) (E_Literal 86 (Boolean_Literal false) )) 
    (S_Sequence 87
    (S_Procedure_Call 88 89 ((*Swap*) 2) 
      ((E_Name 90 (E_Identifier 91 ((*X*) 10) )) :: (E_Name 92 (E_Identifier 93 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 94
    (S_Procedure_Call 95 96 ((*Implies*) 6) 
      ((E_Name 97 (E_Identifier 98 ((*X*) 10) )) :: (E_Name 99 (E_Identifier 100 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 101
    (S_Assignment 102 (E_Identifier 103 ((*X*) 10) ) (E_Literal 104 (Boolean_Literal false) )) 
    (S_Sequence 105
    (S_Assignment 106 (E_Identifier 107 ((*Y*) 11) ) (E_Literal 108 (Boolean_Literal true) )) 
    (S_Sequence 109
    (S_Procedure_Call 110 111 ((*Swap*) 2) 
      ((E_Name 112 (E_Identifier 113 ((*X*) 10) )) :: (E_Name 114 (E_Identifier 115 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 116
    (S_Procedure_Call 117 118 ((*Implies*) 6) 
      ((E_Name 119 (E_Identifier 120 ((*X*) 10) )) :: (E_Name 121 (E_Identifier 122 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 123
    (S_Assignment 124 (E_Identifier 125 ((*X*) 10) ) (E_Literal 126 (Boolean_Literal false) )) 
    (S_Sequence 127
    (S_Assignment 128 (E_Identifier 129 ((*Y*) 11) ) (E_Literal 130 (Boolean_Literal false) )) 
    (S_Sequence 131
    (S_Procedure_Call 132 133 ((*Swap*) 2) 
      ((E_Name 134 (E_Identifier 135 ((*X*) 10) )) :: (E_Name 136 (E_Identifier 137 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 138
    (S_Procedure_Call 139 140 ((*Implies*) 6) 
      ((E_Name 141 (E_Identifier 142 ((*X*) 10) )) :: (E_Name 143 (E_Identifier 144 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 145
    (S_Assignment 146 (E_Identifier 147 ((*X*) 10) ) (E_Literal 148 (Boolean_Literal true) )) 
    (S_Sequence 149
    (S_Assignment 150 (E_Identifier 151 ((*Y*) 11) ) (E_Literal 152 (Boolean_Literal true) )) 
    (S_Sequence 153
    (S_Procedure_Call 154 155 ((*Swap*) 2) 
      ((E_Name 156 (E_Identifier 157 ((*X*) 10) )) :: (E_Name 158 (E_Identifier 159 ((*Y*) 11) )) :: nil)
    ) 
    (S_Procedure_Call 160 161 ((*Implies*) 6) 
      ((E_Name 162 (E_Identifier 163 ((*X*) 10) )) :: (E_Name 164 (E_Identifier 165 ((*Y*) 11) )) :: nil)
    ))))))))))))))))
))) :: (((*Implies*) 6), (1, (mkprocedure_body 47
  (* = = = Procedure Name = = = *)
  ((*Implies*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 48 ((*X*) 7) Boolean In_Out) :: (mkparameter_specification 49 ((*Y*) 8) Boolean In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 55 (mkobject_declaration 56 ((*Z*) 9) Boolean (Some ((E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 57
    (S_Assignment 58 (E_Identifier 59 ((*X*) 7) ) (E_Binary_Operation 60 Or (E_Unary_Operation 61 Not (E_Name 62 (E_Identifier 63 ((*X*) 7) )) ) (E_Name 64 (E_Identifier 65 ((*Z*) 9) )) )) 
    (S_Assignment 66 (E_Identifier 67 ((*Y*) 8) ) (E_Binary_Operation 68 Or (E_Unary_Operation 69 Not (E_Name 70 (E_Identifier 71 ((*Y*) 8) )) ) (E_Name 72 (E_Identifier 73 ((*Z*) 9) )) )))
))) :: (((*Swap*) 2), (1, (mkprocedure_body 6
  (* = = = Procedure Name = = = *)
  ((*Swap*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 7 ((*X*) 3) Boolean In_Out) :: (mkparameter_specification 8 ((*Y*) 4) Boolean In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 9
    (S_Assignment 10 (E_Identifier 11 ((*X*) 3) ) (E_Binary_Operation 12 Or (E_Name 13 (E_Identifier 14 ((*X*) 3) )) (E_Name 15 (E_Identifier 16 ((*Y*) 4) )) )) 
    (S_Sequence 17
    (S_Assignment 18 (E_Identifier 19 ((*Y*) 4) ) (E_Binary_Operation 20 Equal (E_Name 21 (E_Identifier 22 ((*X*) 3) )) (E_Name 23 (E_Identifier 24 ((*Y*) 4) )) )) 
    (S_Sequence 25
    (S_Assignment 26 (E_Identifier 27 ((*X*) 3) ) (E_Binary_Operation 28 Or (E_Name 29 (E_Identifier 30 ((*X*) 3) )) (E_Name 31 (E_Identifier 32 ((*Y*) 4) )) )) 
    (S_Sequence 33
    (S_Assignment 34 (E_Identifier 35 ((*X*) 3) ) (E_Unary_Operation 36 Not (E_Name 37 (E_Identifier 38 ((*X*) 3) )) )) 
    (S_Assignment 39 (E_Identifier 40 ((*Y*) 4) ) (E_Unary_Operation 41 Not (E_Name 42 (E_Identifier 43 ((*Y*) 4) )) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((137, Boolean) :: (92, Boolean) :: (164, Boolean) :: (119, Boolean) :: (104, Boolean) :: (23, Boolean) :: (122, Boolean) :: (158, Boolean) :: (86, Boolean) :: (113, Boolean) :: (41, Boolean) :: (32, Boolean) :: (50, Boolean) :: (59, Boolean) :: (68, Boolean) :: (134, Boolean) :: (53, Boolean) :: (62, Boolean) :: (35, Boolean) :: (125, Boolean) :: (98, Boolean) :: (71, Boolean) :: (107, Boolean) :: (11, Boolean) :: (38, Boolean) :: (29, Boolean) :: (20, Boolean) :: (65, Boolean) :: (14, Boolean) :: (151, Boolean) :: (142, Boolean) :: (115, Boolean) :: (163, Boolean) :: (136, Boolean) :: (100, Boolean) :: (91, Boolean) :: (82, Boolean) :: (64, Boolean) :: (73, Boolean) :: (67, Boolean) :: (85, Boolean) :: (40, Boolean) :: (130, Boolean) :: (13, Boolean) :: (157, Boolean) :: (148, Boolean) :: (121, Boolean) :: (103, Boolean) :: (31, Boolean) :: (22, Boolean) :: (112, Boolean) :: (97, Boolean) :: (16, Boolean) :: (43, Boolean) :: (52, Boolean) :: (70, Boolean) :: (61, Boolean) :: (37, Boolean) :: (28, Boolean) :: (19, Boolean) :: (156, Boolean) :: (147, Boolean) :: (129, Boolean) :: (165, Boolean) :: (120, Boolean) :: (60, Boolean) :: (159, Boolean) :: (141, Boolean) :: (114, Boolean) :: (69, Boolean) :: (99, Boolean) :: (90, Boolean) :: (63, Boolean) :: (54, Boolean) :: (162, Boolean) :: (144, Boolean) :: (126, Boolean) :: (72, Boolean) :: (81, Boolean) :: (135, Boolean) :: (108, Boolean) :: (36, Boolean) :: (27, Boolean) :: (21, Boolean) :: (12, Boolean) :: (93, Boolean) :: (30, Boolean) :: (15, Boolean) :: (42, Boolean) :: (51, Boolean) :: (24, Boolean) :: (152, Boolean) :: (143, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((137, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (92, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (164, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (119, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (104, (sloc (*Line*)35 (*Col*)9 (*EndLine*)35 (*EndCol*)13)) :: (23, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (122, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (158, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (86, (sloc (*Line*)34 (*Col*)21 (*EndLine*)34 (*EndCol*)25)) :: (113, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (41, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)16)) :: (32, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (50, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)37)) :: (59, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (68, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (134, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (53, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (62, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (35, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (125, (sloc (*Line*)36 (*Col*)4 (*EndLine*)36 (*EndCol*)4)) :: (98, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (71, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (107, (sloc (*Line*)35 (*Col*)16 (*EndLine*)35 (*EndCol*)16)) :: (11, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (38, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (29, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (20, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (65, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (151, (sloc (*Line*)37 (*Col*)16 (*EndLine*)37 (*EndCol*)16)) :: (142, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (115, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (163, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: (136, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (100, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (91, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (82, (sloc (*Line*)34 (*Col*)9 (*EndLine*)34 (*EndCol*)12)) :: (64, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (73, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)21)) :: (67, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (85, (sloc (*Line*)34 (*Col*)16 (*EndLine*)34 (*EndCol*)16)) :: (40, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)7)) :: (130, (sloc (*Line*)36 (*Col*)21 (*EndLine*)36 (*EndCol*)25)) :: (13, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (157, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (148, (sloc (*Line*)37 (*Col*)9 (*EndLine*)37 (*EndCol*)12)) :: (121, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (103, (sloc (*Line*)35 (*Col*)4 (*EndLine*)35 (*EndCol*)4)) :: (31, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (22, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (112, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (97, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (16, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (43, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (52, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (70, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (61, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)16)) :: (37, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (28, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)17)) :: (19, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (156, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (147, (sloc (*Line*)37 (*Col*)4 (*EndLine*)37 (*EndCol*)4)) :: (129, (sloc (*Line*)36 (*Col*)16 (*EndLine*)36 (*EndCol*)16)) :: (165, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (120, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (60, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)21)) :: (159, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (141, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (114, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (69, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)16)) :: (99, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (90, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (63, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (54, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (162, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: (144, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: (126, (sloc (*Line*)36 (*Col*)9 (*EndLine*)36 (*EndCol*)13)) :: (72, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)21)) :: (81, (sloc (*Line*)34 (*Col*)4 (*EndLine*)34 (*EndCol*)4)) :: (135, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (108, (sloc (*Line*)35 (*Col*)21 (*EndLine*)35 (*EndCol*)24)) :: (36, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)16)) :: (27, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (21, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (12, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)17)) :: (93, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (30, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (42, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (51, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (24, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (152, (sloc (*Line*)37 (*Col*)21 (*EndLine*)37 (*EndCol*)24)) :: (143, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Y", "ada://parameter/Bool+1:11/Implies+19:14/Y+19:26")) :: (11, ("Y", "ada://variable/Bool+1:11/Y+32:7")) :: (4, ("Y", "ada://parameter/Bool+1:11/Swap+3:14/Y+3:23")) :: (7, ("X", "ada://parameter/Bool+1:11/Implies+19:14/X+19:23")) :: (10, ("X", "ada://variable/Bool+1:11/X+32:4")) :: (9, ("Z", "ada://constant/Bool+1:11/Implies+19:14/Z+26:7")) :: (3, ("X", "ada://parameter/Bool+1:11/Swap+3:14/X+3:20")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Swap", "ada://procedure_body/Bool+1:11/Swap+3:14")) :: (1, ("Bool", "ada://procedure_body/Bool+1:11")) :: (6, ("Implies", "ada://procedure/Bool+1:11/Implies+19:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Bool*) 1)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 3
  D_Null_Declaration_X (* Undefined Declarations ! *) 
  (D_Seq_Declaration_X 4
  (D_Procedure_Body_X 5 
    (mkprocedure_body_x 6
      (* = = = Procedure Name = = = *)
      ((*Swap*) 2)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 7 ((*X*) 3) Boolean In_Out) :: (mkparameter_specification_x 8 ((*Y*) 4) Boolean In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration_X)
      (* = = = Procedure Body = = = *)
        (S_Sequence_X 9
        (S_Assignment_X 10 (E_Identifier_X 11 ((*X*) 3) (nil)) (E_Binary_Operation_X 12 Or (E_Name_X 13 (E_Identifier_X 14 ((*X*) 3) (nil))) (E_Name_X 15 (E_Identifier_X 16 ((*Y*) 4) (nil))) (nil) nil)) 
        (S_Sequence_X 17
        (S_Assignment_X 18 (E_Identifier_X 19 ((*Y*) 4) (nil)) (E_Binary_Operation_X 20 Equal (E_Name_X 21 (E_Identifier_X 22 ((*X*) 3) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*Y*) 4) (nil))) (nil) nil)) 
        (S_Sequence_X 25
        (S_Assignment_X 26 (E_Identifier_X 27 ((*X*) 3) (nil)) (E_Binary_Operation_X 28 Or (E_Name_X 29 (E_Identifier_X 30 ((*X*) 3) (nil))) (E_Name_X 31 (E_Identifier_X 32 ((*Y*) 4) (nil))) (nil) nil)) 
        (S_Sequence_X 33
        (S_Assignment_X 34 (E_Identifier_X 35 ((*X*) 3) (nil)) (E_Unary_Operation_X 36 Not (E_Name_X 37 (E_Identifier_X 38 ((*X*) 3) (nil))) (nil) nil)) 
        (S_Assignment_X 39 (E_Identifier_X 40 ((*Y*) 4) (nil)) (E_Unary_Operation_X 41 Not (E_Name_X 42 (E_Identifier_X 43 ((*Y*) 4) (nil))) (nil) nil))))))
    )
  ) 
  (D_Seq_Declaration_X 44
  D_Null_Declaration_X (* Undefined Declarations ! *) 
  (D_Seq_Declaration_X 45
  (D_Procedure_Body_X 46 
    (mkprocedure_body_x 47
      (* = = = Procedure Name = = = *)
      ((*Implies*) 6)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 48 ((*X*) 7) Boolean In_Out) :: (mkparameter_specification_x 49 ((*Y*) 8) Boolean In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      ((D_Object_Declaration_X 55 (mkobject_declaration_x 56 ((*Z*) 9) Boolean (Some ((E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil))))))
      (* = = = Procedure Body = = = *)
        (S_Sequence_X 57
        (S_Assignment_X 58 (E_Identifier_X 59 ((*X*) 7) (nil)) (E_Binary_Operation_X 60 Or (E_Unary_Operation_X 61 Not (E_Name_X 62 (E_Identifier_X 63 ((*X*) 7) (nil))) (nil) nil) (E_Name_X 64 (E_Identifier_X 65 ((*Z*) 9) (nil))) (nil) nil)) 
        (S_Assignment_X 66 (E_Identifier_X 67 ((*Y*) 8) (nil)) (E_Binary_Operation_X 68 Or (E_Unary_Operation_X 69 Not (E_Name_X 70 (E_Identifier_X 71 ((*Y*) 8) (nil))) (nil) nil) (E_Name_X 72 (E_Identifier_X 73 ((*Z*) 9) (nil))) (nil) nil)))
    )
  ) 
  (D_Seq_Declaration_X 74
  (D_Object_Declaration_X 75 (mkobject_declaration_x 76 ((*X*) 10) Boolean None)) 
  (D_Object_Declaration_X 77 (mkobject_declaration_x 78 ((*Y*) 11) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 79
      (S_Assignment_X 80 (E_Identifier_X 81 ((*X*) 10) (nil)) (E_Literal_X 82 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 83
      (S_Assignment_X 84 (E_Identifier_X 85 ((*Y*) 11) (nil)) (E_Literal_X 86 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 87
      (S_Procedure_Call_X 88 89 ((*Swap*) 2) 
        ((E_Name_X 90 (E_Identifier_X 91 ((*X*) 10) (nil))) :: (E_Name_X 92 (E_Identifier_X 93 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 94
      (S_Procedure_Call_X 95 96 ((*Implies*) 6) 
        ((E_Name_X 97 (E_Identifier_X 98 ((*X*) 10) (nil))) :: (E_Name_X 99 (E_Identifier_X 100 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 101
      (S_Assignment_X 102 (E_Identifier_X 103 ((*X*) 10) (nil)) (E_Literal_X 104 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 105
      (S_Assignment_X 106 (E_Identifier_X 107 ((*Y*) 11) (nil)) (E_Literal_X 108 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 109
      (S_Procedure_Call_X 110 111 ((*Swap*) 2) 
        ((E_Name_X 112 (E_Identifier_X 113 ((*X*) 10) (nil))) :: (E_Name_X 114 (E_Identifier_X 115 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 116
      (S_Procedure_Call_X 117 118 ((*Implies*) 6) 
        ((E_Name_X 119 (E_Identifier_X 120 ((*X*) 10) (nil))) :: (E_Name_X 121 (E_Identifier_X 122 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 123
      (S_Assignment_X 124 (E_Identifier_X 125 ((*X*) 10) (nil)) (E_Literal_X 126 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 127
      (S_Assignment_X 128 (E_Identifier_X 129 ((*Y*) 11) (nil)) (E_Literal_X 130 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 131
      (S_Procedure_Call_X 132 133 ((*Swap*) 2) 
        ((E_Name_X 134 (E_Identifier_X 135 ((*X*) 10) (nil))) :: (E_Name_X 136 (E_Identifier_X 137 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 138
      (S_Procedure_Call_X 139 140 ((*Implies*) 6) 
        ((E_Name_X 141 (E_Identifier_X 142 ((*X*) 10) (nil))) :: (E_Name_X 143 (E_Identifier_X 144 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 145
      (S_Assignment_X 146 (E_Identifier_X 147 ((*X*) 10) (nil)) (E_Literal_X 148 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 149
      (S_Assignment_X 150 (E_Identifier_X 151 ((*Y*) 11) (nil)) (E_Literal_X 152 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 153
      (S_Procedure_Call_X 154 155 ((*Swap*) 2) 
        ((E_Name_X 156 (E_Identifier_X 157 ((*X*) 10) (nil))) :: (E_Name_X 158 (E_Identifier_X 159 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Procedure_Call_X 160 161 ((*Implies*) 6) 
        ((E_Name_X 162 (E_Identifier_X 163 ((*X*) 10) (nil))) :: (E_Name_X 164 (E_Identifier_X 165 ((*Y*) 11) (nil))) :: nil)
      ))))))))))))))))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Y*) 8), (In_Out, Boolean)) :: (((*X*) 7), (In_Out, Boolean)) :: (((*X*) 10), (In_Out, Boolean)) :: (((*Y*) 4), (In_Out, Boolean)) :: (((*X*) 3), (In_Out, Boolean)) :: (((*Y*) 11), (In_Out, Boolean)) :: (((*Z*) 9), (In, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Bool*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Bool*) 1)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 3
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 4
(D_Procedure_Body_X 5 
  (mkprocedure_body_x 6
    (* = = = Procedure Name = = = *)
    ((*Swap*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 7 ((*X*) 3) Boolean In_Out) :: (mkparameter_specification_x 8 ((*Y*) 4) Boolean In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 9
      (S_Assignment_X 10 (E_Identifier_X 11 ((*X*) 3) (nil)) (E_Binary_Operation_X 12 Or (E_Name_X 13 (E_Identifier_X 14 ((*X*) 3) (nil))) (E_Name_X 15 (E_Identifier_X 16 ((*Y*) 4) (nil))) (nil) nil)) 
      (S_Sequence_X 17
      (S_Assignment_X 18 (E_Identifier_X 19 ((*Y*) 4) (nil)) (E_Binary_Operation_X 20 Equal (E_Name_X 21 (E_Identifier_X 22 ((*X*) 3) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*Y*) 4) (nil))) (nil) nil)) 
      (S_Sequence_X 25
      (S_Assignment_X 26 (E_Identifier_X 27 ((*X*) 3) (nil)) (E_Binary_Operation_X 28 Or (E_Name_X 29 (E_Identifier_X 30 ((*X*) 3) (nil))) (E_Name_X 31 (E_Identifier_X 32 ((*Y*) 4) (nil))) (nil) nil)) 
      (S_Sequence_X 33
      (S_Assignment_X 34 (E_Identifier_X 35 ((*X*) 3) (nil)) (E_Unary_Operation_X 36 Not (E_Name_X 37 (E_Identifier_X 38 ((*X*) 3) (nil))) (nil) nil)) 
      (S_Assignment_X 39 (E_Identifier_X 40 ((*Y*) 4) (nil)) (E_Unary_Operation_X 41 Not (E_Name_X 42 (E_Identifier_X 43 ((*Y*) 4) (nil))) (nil) nil))))))
  )
) 
(D_Seq_Declaration_X 44
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 45
(D_Procedure_Body_X 46 
  (mkprocedure_body_x 47
    (* = = = Procedure Name = = = *)
    ((*Implies*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 48 ((*X*) 7) Boolean In_Out) :: (mkparameter_specification_x 49 ((*Y*) 8) Boolean In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 55 (mkobject_declaration_x 56 ((*Z*) 9) Boolean (Some ((E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 57
      (S_Assignment_X 58 (E_Identifier_X 59 ((*X*) 7) (nil)) (E_Binary_Operation_X 60 Or (E_Unary_Operation_X 61 Not (E_Name_X 62 (E_Identifier_X 63 ((*X*) 7) (nil))) (nil) nil) (E_Name_X 64 (E_Identifier_X 65 ((*Z*) 9) (nil))) (nil) nil)) 
      (S_Assignment_X 66 (E_Identifier_X 67 ((*Y*) 8) (nil)) (E_Binary_Operation_X 68 Or (E_Unary_Operation_X 69 Not (E_Name_X 70 (E_Identifier_X 71 ((*Y*) 8) (nil))) (nil) nil) (E_Name_X 72 (E_Identifier_X 73 ((*Z*) 9) (nil))) (nil) nil)))
  )
) 
(D_Seq_Declaration_X 74
(D_Object_Declaration_X 75 (mkobject_declaration_x 76 ((*X*) 10) Boolean None)) 
(D_Object_Declaration_X 77 (mkobject_declaration_x 78 ((*Y*) 11) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 79
    (S_Assignment_X 80 (E_Identifier_X 81 ((*X*) 10) (nil)) (E_Literal_X 82 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 83
    (S_Assignment_X 84 (E_Identifier_X 85 ((*Y*) 11) (nil)) (E_Literal_X 86 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 87
    (S_Procedure_Call_X 88 89 ((*Swap*) 2) 
      ((E_Name_X 90 (E_Identifier_X 91 ((*X*) 10) (nil))) :: (E_Name_X 92 (E_Identifier_X 93 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 94
    (S_Procedure_Call_X 95 96 ((*Implies*) 6) 
      ((E_Name_X 97 (E_Identifier_X 98 ((*X*) 10) (nil))) :: (E_Name_X 99 (E_Identifier_X 100 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 101
    (S_Assignment_X 102 (E_Identifier_X 103 ((*X*) 10) (nil)) (E_Literal_X 104 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 105
    (S_Assignment_X 106 (E_Identifier_X 107 ((*Y*) 11) (nil)) (E_Literal_X 108 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 109
    (S_Procedure_Call_X 110 111 ((*Swap*) 2) 
      ((E_Name_X 112 (E_Identifier_X 113 ((*X*) 10) (nil))) :: (E_Name_X 114 (E_Identifier_X 115 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 116
    (S_Procedure_Call_X 117 118 ((*Implies*) 6) 
      ((E_Name_X 119 (E_Identifier_X 120 ((*X*) 10) (nil))) :: (E_Name_X 121 (E_Identifier_X 122 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 123
    (S_Assignment_X 124 (E_Identifier_X 125 ((*X*) 10) (nil)) (E_Literal_X 126 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 127
    (S_Assignment_X 128 (E_Identifier_X 129 ((*Y*) 11) (nil)) (E_Literal_X 130 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 131
    (S_Procedure_Call_X 132 133 ((*Swap*) 2) 
      ((E_Name_X 134 (E_Identifier_X 135 ((*X*) 10) (nil))) :: (E_Name_X 136 (E_Identifier_X 137 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 138
    (S_Procedure_Call_X 139 140 ((*Implies*) 6) 
      ((E_Name_X 141 (E_Identifier_X 142 ((*X*) 10) (nil))) :: (E_Name_X 143 (E_Identifier_X 144 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 145
    (S_Assignment_X 146 (E_Identifier_X 147 ((*X*) 10) (nil)) (E_Literal_X 148 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 149
    (S_Assignment_X 150 (E_Identifier_X 151 ((*Y*) 11) (nil)) (E_Literal_X 152 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 153
    (S_Procedure_Call_X 154 155 ((*Swap*) 2) 
      ((E_Name_X 156 (E_Identifier_X 157 ((*X*) 10) (nil))) :: (E_Name_X 158 (E_Identifier_X 159 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Procedure_Call_X 160 161 ((*Implies*) 6) 
      ((E_Name_X 162 (E_Identifier_X 163 ((*X*) 10) (nil))) :: (E_Name_X 164 (E_Identifier_X 165 ((*Y*) 11) (nil))) :: nil)
    ))))))))))))))))
))) :: (((*Implies*) 6), (1, (mkprocedure_body_x 47
  (* = = = Procedure Name = = = *)
  ((*Implies*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 48 ((*X*) 7) Boolean In_Out) :: (mkparameter_specification_x 49 ((*Y*) 8) Boolean In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 55 (mkobject_declaration_x 56 ((*Z*) 9) Boolean (Some ((E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 57
    (S_Assignment_X 58 (E_Identifier_X 59 ((*X*) 7) (nil)) (E_Binary_Operation_X 60 Or (E_Unary_Operation_X 61 Not (E_Name_X 62 (E_Identifier_X 63 ((*X*) 7) (nil))) (nil) nil) (E_Name_X 64 (E_Identifier_X 65 ((*Z*) 9) (nil))) (nil) nil)) 
    (S_Assignment_X 66 (E_Identifier_X 67 ((*Y*) 8) (nil)) (E_Binary_Operation_X 68 Or (E_Unary_Operation_X 69 Not (E_Name_X 70 (E_Identifier_X 71 ((*Y*) 8) (nil))) (nil) nil) (E_Name_X 72 (E_Identifier_X 73 ((*Z*) 9) (nil))) (nil) nil)))
))) :: (((*Swap*) 2), (1, (mkprocedure_body_x 6
  (* = = = Procedure Name = = = *)
  ((*Swap*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 7 ((*X*) 3) Boolean In_Out) :: (mkparameter_specification_x 8 ((*Y*) 4) Boolean In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 9
    (S_Assignment_X 10 (E_Identifier_X 11 ((*X*) 3) (nil)) (E_Binary_Operation_X 12 Or (E_Name_X 13 (E_Identifier_X 14 ((*X*) 3) (nil))) (E_Name_X 15 (E_Identifier_X 16 ((*Y*) 4) (nil))) (nil) nil)) 
    (S_Sequence_X 17
    (S_Assignment_X 18 (E_Identifier_X 19 ((*Y*) 4) (nil)) (E_Binary_Operation_X 20 Equal (E_Name_X 21 (E_Identifier_X 22 ((*X*) 3) (nil))) (E_Name_X 23 (E_Identifier_X 24 ((*Y*) 4) (nil))) (nil) nil)) 
    (S_Sequence_X 25
    (S_Assignment_X 26 (E_Identifier_X 27 ((*X*) 3) (nil)) (E_Binary_Operation_X 28 Or (E_Name_X 29 (E_Identifier_X 30 ((*X*) 3) (nil))) (E_Name_X 31 (E_Identifier_X 32 ((*Y*) 4) (nil))) (nil) nil)) 
    (S_Sequence_X 33
    (S_Assignment_X 34 (E_Identifier_X 35 ((*X*) 3) (nil)) (E_Unary_Operation_X 36 Not (E_Name_X 37 (E_Identifier_X 38 ((*X*) 3) (nil))) (nil) nil)) 
    (S_Assignment_X 39 (E_Identifier_X 40 ((*Y*) 4) (nil)) (E_Unary_Operation_X 41 Not (E_Name_X 42 (E_Identifier_X 43 ((*Y*) 4) (nil))) (nil) nil))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((137, Boolean) :: (92, Boolean) :: (164, Boolean) :: (119, Boolean) :: (104, Boolean) :: (23, Boolean) :: (122, Boolean) :: (158, Boolean) :: (86, Boolean) :: (113, Boolean) :: (41, Boolean) :: (32, Boolean) :: (50, Boolean) :: (59, Boolean) :: (68, Boolean) :: (134, Boolean) :: (53, Boolean) :: (62, Boolean) :: (35, Boolean) :: (125, Boolean) :: (98, Boolean) :: (71, Boolean) :: (107, Boolean) :: (11, Boolean) :: (38, Boolean) :: (29, Boolean) :: (20, Boolean) :: (65, Boolean) :: (14, Boolean) :: (151, Boolean) :: (142, Boolean) :: (115, Boolean) :: (163, Boolean) :: (136, Boolean) :: (100, Boolean) :: (91, Boolean) :: (82, Boolean) :: (64, Boolean) :: (73, Boolean) :: (67, Boolean) :: (85, Boolean) :: (40, Boolean) :: (130, Boolean) :: (13, Boolean) :: (157, Boolean) :: (148, Boolean) :: (121, Boolean) :: (103, Boolean) :: (31, Boolean) :: (22, Boolean) :: (112, Boolean) :: (97, Boolean) :: (16, Boolean) :: (43, Boolean) :: (52, Boolean) :: (70, Boolean) :: (61, Boolean) :: (37, Boolean) :: (28, Boolean) :: (19, Boolean) :: (156, Boolean) :: (147, Boolean) :: (129, Boolean) :: (165, Boolean) :: (120, Boolean) :: (60, Boolean) :: (159, Boolean) :: (141, Boolean) :: (114, Boolean) :: (69, Boolean) :: (99, Boolean) :: (90, Boolean) :: (63, Boolean) :: (54, Boolean) :: (162, Boolean) :: (144, Boolean) :: (126, Boolean) :: (72, Boolean) :: (81, Boolean) :: (135, Boolean) :: (108, Boolean) :: (36, Boolean) :: (27, Boolean) :: (21, Boolean) :: (12, Boolean) :: (93, Boolean) :: (30, Boolean) :: (15, Boolean) :: (42, Boolean) :: (51, Boolean) :: (24, Boolean) :: (152, Boolean) :: (143, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((137, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (92, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (164, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (119, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (104, (sloc (*Line*)35 (*Col*)9 (*EndLine*)35 (*EndCol*)13)) :: (23, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (122, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (158, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (86, (sloc (*Line*)34 (*Col*)21 (*EndLine*)34 (*EndCol*)25)) :: (113, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (41, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)16)) :: (32, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (50, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)37)) :: (59, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (68, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (134, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (53, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (62, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (35, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (125, (sloc (*Line*)36 (*Col*)4 (*EndLine*)36 (*EndCol*)4)) :: (98, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (71, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (107, (sloc (*Line*)35 (*Col*)16 (*EndLine*)35 (*EndCol*)16)) :: (11, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (38, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (29, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (20, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (65, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (151, (sloc (*Line*)37 (*Col*)16 (*EndLine*)37 (*EndCol*)16)) :: (142, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (115, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (163, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: (136, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (100, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (91, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (82, (sloc (*Line*)34 (*Col*)9 (*EndLine*)34 (*EndCol*)12)) :: (64, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (73, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)21)) :: (67, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (85, (sloc (*Line*)34 (*Col*)16 (*EndLine*)34 (*EndCol*)16)) :: (40, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)7)) :: (130, (sloc (*Line*)36 (*Col*)21 (*EndLine*)36 (*EndCol*)25)) :: (13, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (157, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (148, (sloc (*Line*)37 (*Col*)9 (*EndLine*)37 (*EndCol*)12)) :: (121, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (103, (sloc (*Line*)35 (*Col*)4 (*EndLine*)35 (*EndCol*)4)) :: (31, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (22, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (112, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (97, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (16, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (43, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (52, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (70, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (61, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)16)) :: (37, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (28, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)17)) :: (19, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (156, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (147, (sloc (*Line*)37 (*Col*)4 (*EndLine*)37 (*EndCol*)4)) :: (129, (sloc (*Line*)36 (*Col*)16 (*EndLine*)36 (*EndCol*)16)) :: (165, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (120, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (60, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)21)) :: (159, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (141, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (114, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (69, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)16)) :: (99, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (90, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (63, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (54, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (162, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: (144, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: (126, (sloc (*Line*)36 (*Col*)9 (*EndLine*)36 (*EndCol*)13)) :: (72, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)21)) :: (81, (sloc (*Line*)34 (*Col*)4 (*EndLine*)34 (*EndCol*)4)) :: (135, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (108, (sloc (*Line*)35 (*Col*)21 (*EndLine*)35 (*EndCol*)24)) :: (36, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)16)) :: (27, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (21, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (12, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)17)) :: (93, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (30, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (42, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (51, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (24, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (152, (sloc (*Line*)37 (*Col*)21 (*EndLine*)37 (*EndCol*)24)) :: (143, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Y", "ada://parameter/Bool+1:11/Implies+19:14/Y+19:26")) :: (11, ("Y", "ada://variable/Bool+1:11/Y+32:7")) :: (4, ("Y", "ada://parameter/Bool+1:11/Swap+3:14/Y+3:23")) :: (7, ("X", "ada://parameter/Bool+1:11/Implies+19:14/X+19:23")) :: (10, ("X", "ada://variable/Bool+1:11/X+32:4")) :: (9, ("Z", "ada://constant/Bool+1:11/Implies+19:14/Z+26:7")) :: (3, ("X", "ada://parameter/Bool+1:11/Swap+3:14/X+3:20")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Swap", "ada://procedure_body/Bool+1:11/Swap+3:14")) :: (1, ("Bool", "ada://procedure_body/Bool+1:11")) :: (6, ("Implies", "ada://procedure/Bool+1:11/Implies+19:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).
