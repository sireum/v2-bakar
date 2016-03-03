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
        (S_Assignment 58 (E_Identifier 59 ((*X*) 7) ) (E_Binary_Operation 60 Or (E_Unary_Operation 61 Not (E_Name 62 (E_Identifier 63 ((*X*) 7) )) ) (E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ) )) 
        (S_Assignment 65 (E_Identifier 66 ((*Y*) 8) ) (E_Binary_Operation 67 Or (E_Unary_Operation 68 Not (E_Name 69 (E_Identifier 70 ((*Y*) 8) )) ) (E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ) )))
    )
  ) 
  (D_Seq_Declaration 72
  (D_Object_Declaration 73 (mkobject_declaration 74 ((*X*) 10) Boolean None)) 
  (D_Object_Declaration 75 (mkobject_declaration 76 ((*Y*) 11) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 77
      (S_Assignment 78 (E_Identifier 79 ((*X*) 10) ) (E_Literal 80 (Boolean_Literal true) )) 
      (S_Sequence 81
      (S_Assignment 82 (E_Identifier 83 ((*Y*) 11) ) (E_Literal 84 (Boolean_Literal false) )) 
      (S_Sequence 85
      (S_Procedure_Call 86 87 ((*Swap*) 2) 
        ((E_Name 88 (E_Identifier 89 ((*X*) 10) )) :: (E_Name 90 (E_Identifier 91 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 92
      (S_Procedure_Call 93 94 ((*Implies*) 6) 
        ((E_Name 95 (E_Identifier 96 ((*X*) 10) )) :: (E_Name 97 (E_Identifier 98 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 99
      (S_Assignment 100 (E_Identifier 101 ((*X*) 10) ) (E_Literal 102 (Boolean_Literal false) )) 
      (S_Sequence 103
      (S_Assignment 104 (E_Identifier 105 ((*Y*) 11) ) (E_Literal 106 (Boolean_Literal true) )) 
      (S_Sequence 107
      (S_Procedure_Call 108 109 ((*Swap*) 2) 
        ((E_Name 110 (E_Identifier 111 ((*X*) 10) )) :: (E_Name 112 (E_Identifier 113 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 114
      (S_Procedure_Call 115 116 ((*Implies*) 6) 
        ((E_Name 117 (E_Identifier 118 ((*X*) 10) )) :: (E_Name 119 (E_Identifier 120 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 121
      (S_Assignment 122 (E_Identifier 123 ((*X*) 10) ) (E_Literal 124 (Boolean_Literal false) )) 
      (S_Sequence 125
      (S_Assignment 126 (E_Identifier 127 ((*Y*) 11) ) (E_Literal 128 (Boolean_Literal false) )) 
      (S_Sequence 129
      (S_Procedure_Call 130 131 ((*Swap*) 2) 
        ((E_Name 132 (E_Identifier 133 ((*X*) 10) )) :: (E_Name 134 (E_Identifier 135 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 136
      (S_Procedure_Call 137 138 ((*Implies*) 6) 
        ((E_Name 139 (E_Identifier 140 ((*X*) 10) )) :: (E_Name 141 (E_Identifier 142 ((*Y*) 11) )) :: nil)
      ) 
      (S_Sequence 143
      (S_Assignment 144 (E_Identifier 145 ((*X*) 10) ) (E_Literal 146 (Boolean_Literal true) )) 
      (S_Sequence 147
      (S_Assignment 148 (E_Identifier 149 ((*Y*) 11) ) (E_Literal 150 (Boolean_Literal true) )) 
      (S_Sequence 151
      (S_Procedure_Call 152 153 ((*Swap*) 2) 
        ((E_Name 154 (E_Identifier 155 ((*X*) 10) )) :: (E_Name 156 (E_Identifier 157 ((*Y*) 11) )) :: nil)
      ) 
      (S_Procedure_Call 158 159 ((*Implies*) 6) 
        ((E_Name 160 (E_Identifier 161 ((*X*) 10) )) :: (E_Name 162 (E_Identifier 163 ((*Y*) 11) )) :: nil)
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
      (S_Assignment 58 (E_Identifier 59 ((*X*) 7) ) (E_Binary_Operation 60 Or (E_Unary_Operation 61 Not (E_Name 62 (E_Identifier 63 ((*X*) 7) )) ) (E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ) )) 
      (S_Assignment 65 (E_Identifier 66 ((*Y*) 8) ) (E_Binary_Operation 67 Or (E_Unary_Operation 68 Not (E_Name 69 (E_Identifier 70 ((*Y*) 8) )) ) (E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ) )))
  )
) 
(D_Seq_Declaration 72
(D_Object_Declaration 73 (mkobject_declaration 74 ((*X*) 10) Boolean None)) 
(D_Object_Declaration 75 (mkobject_declaration 76 ((*Y*) 11) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 77
    (S_Assignment 78 (E_Identifier 79 ((*X*) 10) ) (E_Literal 80 (Boolean_Literal true) )) 
    (S_Sequence 81
    (S_Assignment 82 (E_Identifier 83 ((*Y*) 11) ) (E_Literal 84 (Boolean_Literal false) )) 
    (S_Sequence 85
    (S_Procedure_Call 86 87 ((*Swap*) 2) 
      ((E_Name 88 (E_Identifier 89 ((*X*) 10) )) :: (E_Name 90 (E_Identifier 91 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 92
    (S_Procedure_Call 93 94 ((*Implies*) 6) 
      ((E_Name 95 (E_Identifier 96 ((*X*) 10) )) :: (E_Name 97 (E_Identifier 98 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 99
    (S_Assignment 100 (E_Identifier 101 ((*X*) 10) ) (E_Literal 102 (Boolean_Literal false) )) 
    (S_Sequence 103
    (S_Assignment 104 (E_Identifier 105 ((*Y*) 11) ) (E_Literal 106 (Boolean_Literal true) )) 
    (S_Sequence 107
    (S_Procedure_Call 108 109 ((*Swap*) 2) 
      ((E_Name 110 (E_Identifier 111 ((*X*) 10) )) :: (E_Name 112 (E_Identifier 113 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 114
    (S_Procedure_Call 115 116 ((*Implies*) 6) 
      ((E_Name 117 (E_Identifier 118 ((*X*) 10) )) :: (E_Name 119 (E_Identifier 120 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 121
    (S_Assignment 122 (E_Identifier 123 ((*X*) 10) ) (E_Literal 124 (Boolean_Literal false) )) 
    (S_Sequence 125
    (S_Assignment 126 (E_Identifier 127 ((*Y*) 11) ) (E_Literal 128 (Boolean_Literal false) )) 
    (S_Sequence 129
    (S_Procedure_Call 130 131 ((*Swap*) 2) 
      ((E_Name 132 (E_Identifier 133 ((*X*) 10) )) :: (E_Name 134 (E_Identifier 135 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 136
    (S_Procedure_Call 137 138 ((*Implies*) 6) 
      ((E_Name 139 (E_Identifier 140 ((*X*) 10) )) :: (E_Name 141 (E_Identifier 142 ((*Y*) 11) )) :: nil)
    ) 
    (S_Sequence 143
    (S_Assignment 144 (E_Identifier 145 ((*X*) 10) ) (E_Literal 146 (Boolean_Literal true) )) 
    (S_Sequence 147
    (S_Assignment 148 (E_Identifier 149 ((*Y*) 11) ) (E_Literal 150 (Boolean_Literal true) )) 
    (S_Sequence 151
    (S_Procedure_Call 152 153 ((*Swap*) 2) 
      ((E_Name 154 (E_Identifier 155 ((*X*) 10) )) :: (E_Name 156 (E_Identifier 157 ((*Y*) 11) )) :: nil)
    ) 
    (S_Procedure_Call 158 159 ((*Implies*) 6) 
      ((E_Name 160 (E_Identifier 161 ((*X*) 10) )) :: (E_Name 162 (E_Identifier 163 ((*Y*) 11) )) :: nil)
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
    (S_Assignment 58 (E_Identifier 59 ((*X*) 7) ) (E_Binary_Operation 60 Or (E_Unary_Operation 61 Not (E_Name 62 (E_Identifier 63 ((*X*) 7) )) ) (E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ) )) 
    (S_Assignment 65 (E_Identifier 66 ((*Y*) 8) ) (E_Binary_Operation 67 Or (E_Unary_Operation 68 Not (E_Name 69 (E_Identifier 70 ((*Y*) 8) )) ) (E_Binary_Operation 50 And (E_Name 51 (E_Identifier 52 ((*X*) 7) )) (E_Name 53 (E_Identifier 54 ((*Y*) 8) )) ) )))
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
  ((146, Boolean) :: (101, Boolean) :: (155, Boolean) :: (83, Boolean) :: (110, Boolean) :: (128, Boolean) :: (119, Boolean) :: (95, Boolean) :: (23, Boolean) :: (140, Boolean) :: (113, Boolean) :: (41, Boolean) :: (32, Boolean) :: (50, Boolean) :: (59, Boolean) :: (68, Boolean) :: (149, Boolean) :: (134, Boolean) :: (53, Boolean) :: (62, Boolean) :: (35, Boolean) :: (80, Boolean) :: (89, Boolean) :: (98, Boolean) :: (71, Boolean) :: (11, Boolean) :: (38, Boolean) :: (29, Boolean) :: (20, Boolean) :: (14, Boolean) :: (142, Boolean) :: (124, Boolean) :: (133, Boolean) :: (106, Boolean) :: (160, Boolean) :: (163, Boolean) :: (127, Boolean) :: (118, Boolean) :: (91, Boolean) :: (145, Boolean) :: (64, Boolean) :: (154, Boolean) :: (139, Boolean) :: (67, Boolean) :: (40, Boolean) :: (13, Boolean) :: (157, Boolean) :: (31, Boolean) :: (22, Boolean) :: (112, Boolean) :: (97, Boolean) :: (16, Boolean) :: (79, Boolean) :: (88, Boolean) :: (43, Boolean) :: (52, Boolean) :: (70, Boolean) :: (61, Boolean) :: (37, Boolean) :: (28, Boolean) :: (19, Boolean) :: (156, Boolean) :: (120, Boolean) :: (60, Boolean) :: (96, Boolean) :: (150, Boolean) :: (132, Boolean) :: (141, Boolean) :: (105, Boolean) :: (123, Boolean) :: (69, Boolean) :: (90, Boolean) :: (63, Boolean) :: (54, Boolean) :: (162, Boolean) :: (135, Boolean) :: (36, Boolean) :: (27, Boolean) :: (117, Boolean) :: (21, Boolean) :: (12, Boolean) :: (84, Boolean) :: (102, Boolean) :: (30, Boolean) :: (111, Boolean) :: (66, Boolean) :: (15, Boolean) :: (42, Boolean) :: (51, Boolean) :: (24, Boolean) :: (161, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((146, (sloc (*Line*)37 (*Col*)9 (*EndLine*)37 (*EndCol*)12)) :: (101, (sloc (*Line*)35 (*Col*)4 (*EndLine*)35 (*EndCol*)4)) :: (155, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (83, (sloc (*Line*)34 (*Col*)16 (*EndLine*)34 (*EndCol*)16)) :: (110, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (128, (sloc (*Line*)36 (*Col*)21 (*EndLine*)36 (*EndCol*)25)) :: (119, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (95, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (23, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (140, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (113, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (41, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)16)) :: (32, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (50, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)37)) :: (59, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (68, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)16)) :: (149, (sloc (*Line*)37 (*Col*)16 (*EndLine*)37 (*EndCol*)16)) :: (134, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (53, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (62, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (35, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (80, (sloc (*Line*)34 (*Col*)9 (*EndLine*)34 (*EndCol*)12)) :: (89, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (98, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (71, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)21)) :: (11, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (38, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (29, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (20, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (142, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: (124, (sloc (*Line*)36 (*Col*)9 (*EndLine*)36 (*EndCol*)13)) :: (133, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (106, (sloc (*Line*)35 (*Col*)21 (*EndLine*)35 (*EndCol*)24)) :: (160, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: (163, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (127, (sloc (*Line*)36 (*Col*)16 (*EndLine*)36 (*EndCol*)16)) :: (118, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (91, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (145, (sloc (*Line*)37 (*Col*)4 (*EndLine*)37 (*EndCol*)4)) :: (64, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (154, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (139, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (67, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (40, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)7)) :: (13, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (157, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (31, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (22, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (112, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (97, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (16, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (79, (sloc (*Line*)34 (*Col*)4 (*EndLine*)34 (*EndCol*)4)) :: (88, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (43, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (52, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (70, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (61, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)16)) :: (37, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (28, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)17)) :: (19, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (156, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (120, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (60, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)21)) :: (96, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (150, (sloc (*Line*)37 (*Col*)21 (*EndLine*)37 (*EndCol*)24)) :: (132, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (141, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: (105, (sloc (*Line*)35 (*Col*)16 (*EndLine*)35 (*EndCol*)16)) :: (123, (sloc (*Line*)36 (*Col*)4 (*EndLine*)36 (*EndCol*)4)) :: (69, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (90, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (63, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (54, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (162, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (135, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (36, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)16)) :: (27, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (117, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (21, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (12, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)17)) :: (84, (sloc (*Line*)34 (*Col*)21 (*EndLine*)34 (*EndCol*)25)) :: (102, (sloc (*Line*)35 (*Col*)9 (*EndLine*)35 (*EndCol*)13)) :: (30, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (111, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (66, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (42, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (51, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (24, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (161, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: nil)
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
        (S_Assignment_X 58 (E_Identifier_X 59 ((*X*) 7) (nil)) (E_Binary_Operation_X 60 Or (E_Unary_Operation_X 61 Not (E_Name_X 62 (E_Identifier_X 63 ((*X*) 7) (nil))) (nil) nil) (E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil) (nil) nil)) 
        (S_Assignment_X 65 (E_Identifier_X 66 ((*Y*) 8) (nil)) (E_Binary_Operation_X 67 Or (E_Unary_Operation_X 68 Not (E_Name_X 69 (E_Identifier_X 70 ((*Y*) 8) (nil))) (nil) nil) (E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil) (nil) nil)))
    )
  ) 
  (D_Seq_Declaration_X 72
  (D_Object_Declaration_X 73 (mkobject_declaration_x 74 ((*X*) 10) Boolean None)) 
  (D_Object_Declaration_X 75 (mkobject_declaration_x 76 ((*Y*) 11) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 77
      (S_Assignment_X 78 (E_Identifier_X 79 ((*X*) 10) (nil)) (E_Literal_X 80 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 81
      (S_Assignment_X 82 (E_Identifier_X 83 ((*Y*) 11) (nil)) (E_Literal_X 84 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 85
      (S_Procedure_Call_X 86 87 ((*Swap*) 2) 
        ((E_Name_X 88 (E_Identifier_X 89 ((*X*) 10) (nil))) :: (E_Name_X 90 (E_Identifier_X 91 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 92
      (S_Procedure_Call_X 93 94 ((*Implies*) 6) 
        ((E_Name_X 95 (E_Identifier_X 96 ((*X*) 10) (nil))) :: (E_Name_X 97 (E_Identifier_X 98 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 99
      (S_Assignment_X 100 (E_Identifier_X 101 ((*X*) 10) (nil)) (E_Literal_X 102 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 103
      (S_Assignment_X 104 (E_Identifier_X 105 ((*Y*) 11) (nil)) (E_Literal_X 106 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 107
      (S_Procedure_Call_X 108 109 ((*Swap*) 2) 
        ((E_Name_X 110 (E_Identifier_X 111 ((*X*) 10) (nil))) :: (E_Name_X 112 (E_Identifier_X 113 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 114
      (S_Procedure_Call_X 115 116 ((*Implies*) 6) 
        ((E_Name_X 117 (E_Identifier_X 118 ((*X*) 10) (nil))) :: (E_Name_X 119 (E_Identifier_X 120 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 121
      (S_Assignment_X 122 (E_Identifier_X 123 ((*X*) 10) (nil)) (E_Literal_X 124 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 125
      (S_Assignment_X 126 (E_Identifier_X 127 ((*Y*) 11) (nil)) (E_Literal_X 128 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 129
      (S_Procedure_Call_X 130 131 ((*Swap*) 2) 
        ((E_Name_X 132 (E_Identifier_X 133 ((*X*) 10) (nil))) :: (E_Name_X 134 (E_Identifier_X 135 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 136
      (S_Procedure_Call_X 137 138 ((*Implies*) 6) 
        ((E_Name_X 139 (E_Identifier_X 140 ((*X*) 10) (nil))) :: (E_Name_X 141 (E_Identifier_X 142 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Sequence_X 143
      (S_Assignment_X 144 (E_Identifier_X 145 ((*X*) 10) (nil)) (E_Literal_X 146 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 147
      (S_Assignment_X 148 (E_Identifier_X 149 ((*Y*) 11) (nil)) (E_Literal_X 150 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 151
      (S_Procedure_Call_X 152 153 ((*Swap*) 2) 
        ((E_Name_X 154 (E_Identifier_X 155 ((*X*) 10) (nil))) :: (E_Name_X 156 (E_Identifier_X 157 ((*Y*) 11) (nil))) :: nil)
      ) 
      (S_Procedure_Call_X 158 159 ((*Implies*) 6) 
        ((E_Name_X 160 (E_Identifier_X 161 ((*X*) 10) (nil))) :: (E_Name_X 162 (E_Identifier_X 163 ((*Y*) 11) (nil))) :: nil)
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
      (S_Assignment_X 58 (E_Identifier_X 59 ((*X*) 7) (nil)) (E_Binary_Operation_X 60 Or (E_Unary_Operation_X 61 Not (E_Name_X 62 (E_Identifier_X 63 ((*X*) 7) (nil))) (nil) nil) (E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil) (nil) nil)) 
      (S_Assignment_X 65 (E_Identifier_X 66 ((*Y*) 8) (nil)) (E_Binary_Operation_X 67 Or (E_Unary_Operation_X 68 Not (E_Name_X 69 (E_Identifier_X 70 ((*Y*) 8) (nil))) (nil) nil) (E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil) (nil) nil)))
  )
) 
(D_Seq_Declaration_X 72
(D_Object_Declaration_X 73 (mkobject_declaration_x 74 ((*X*) 10) Boolean None)) 
(D_Object_Declaration_X 75 (mkobject_declaration_x 76 ((*Y*) 11) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 77
    (S_Assignment_X 78 (E_Identifier_X 79 ((*X*) 10) (nil)) (E_Literal_X 80 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 81
    (S_Assignment_X 82 (E_Identifier_X 83 ((*Y*) 11) (nil)) (E_Literal_X 84 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 85
    (S_Procedure_Call_X 86 87 ((*Swap*) 2) 
      ((E_Name_X 88 (E_Identifier_X 89 ((*X*) 10) (nil))) :: (E_Name_X 90 (E_Identifier_X 91 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 92
    (S_Procedure_Call_X 93 94 ((*Implies*) 6) 
      ((E_Name_X 95 (E_Identifier_X 96 ((*X*) 10) (nil))) :: (E_Name_X 97 (E_Identifier_X 98 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 99
    (S_Assignment_X 100 (E_Identifier_X 101 ((*X*) 10) (nil)) (E_Literal_X 102 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 103
    (S_Assignment_X 104 (E_Identifier_X 105 ((*Y*) 11) (nil)) (E_Literal_X 106 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 107
    (S_Procedure_Call_X 108 109 ((*Swap*) 2) 
      ((E_Name_X 110 (E_Identifier_X 111 ((*X*) 10) (nil))) :: (E_Name_X 112 (E_Identifier_X 113 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 114
    (S_Procedure_Call_X 115 116 ((*Implies*) 6) 
      ((E_Name_X 117 (E_Identifier_X 118 ((*X*) 10) (nil))) :: (E_Name_X 119 (E_Identifier_X 120 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 121
    (S_Assignment_X 122 (E_Identifier_X 123 ((*X*) 10) (nil)) (E_Literal_X 124 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 125
    (S_Assignment_X 126 (E_Identifier_X 127 ((*Y*) 11) (nil)) (E_Literal_X 128 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 129
    (S_Procedure_Call_X 130 131 ((*Swap*) 2) 
      ((E_Name_X 132 (E_Identifier_X 133 ((*X*) 10) (nil))) :: (E_Name_X 134 (E_Identifier_X 135 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 136
    (S_Procedure_Call_X 137 138 ((*Implies*) 6) 
      ((E_Name_X 139 (E_Identifier_X 140 ((*X*) 10) (nil))) :: (E_Name_X 141 (E_Identifier_X 142 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Sequence_X 143
    (S_Assignment_X 144 (E_Identifier_X 145 ((*X*) 10) (nil)) (E_Literal_X 146 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 147
    (S_Assignment_X 148 (E_Identifier_X 149 ((*Y*) 11) (nil)) (E_Literal_X 150 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 151
    (S_Procedure_Call_X 152 153 ((*Swap*) 2) 
      ((E_Name_X 154 (E_Identifier_X 155 ((*X*) 10) (nil))) :: (E_Name_X 156 (E_Identifier_X 157 ((*Y*) 11) (nil))) :: nil)
    ) 
    (S_Procedure_Call_X 158 159 ((*Implies*) 6) 
      ((E_Name_X 160 (E_Identifier_X 161 ((*X*) 10) (nil))) :: (E_Name_X 162 (E_Identifier_X 163 ((*Y*) 11) (nil))) :: nil)
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
    (S_Assignment_X 58 (E_Identifier_X 59 ((*X*) 7) (nil)) (E_Binary_Operation_X 60 Or (E_Unary_Operation_X 61 Not (E_Name_X 62 (E_Identifier_X 63 ((*X*) 7) (nil))) (nil) nil) (E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil) (nil) nil)) 
    (S_Assignment_X 65 (E_Identifier_X 66 ((*Y*) 8) (nil)) (E_Binary_Operation_X 67 Or (E_Unary_Operation_X 68 Not (E_Name_X 69 (E_Identifier_X 70 ((*Y*) 8) (nil))) (nil) nil) (E_Binary_Operation_X 50 And (E_Name_X 51 (E_Identifier_X 52 ((*X*) 7) (nil))) (E_Name_X 53 (E_Identifier_X 54 ((*Y*) 8) (nil))) (nil) nil) (nil) nil)))
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
  ((146, Boolean) :: (101, Boolean) :: (155, Boolean) :: (83, Boolean) :: (110, Boolean) :: (128, Boolean) :: (119, Boolean) :: (95, Boolean) :: (23, Boolean) :: (140, Boolean) :: (113, Boolean) :: (41, Boolean) :: (32, Boolean) :: (50, Boolean) :: (59, Boolean) :: (68, Boolean) :: (149, Boolean) :: (134, Boolean) :: (53, Boolean) :: (62, Boolean) :: (35, Boolean) :: (80, Boolean) :: (89, Boolean) :: (98, Boolean) :: (71, Boolean) :: (11, Boolean) :: (38, Boolean) :: (29, Boolean) :: (20, Boolean) :: (14, Boolean) :: (142, Boolean) :: (124, Boolean) :: (133, Boolean) :: (106, Boolean) :: (160, Boolean) :: (163, Boolean) :: (127, Boolean) :: (118, Boolean) :: (91, Boolean) :: (145, Boolean) :: (64, Boolean) :: (154, Boolean) :: (139, Boolean) :: (67, Boolean) :: (40, Boolean) :: (13, Boolean) :: (157, Boolean) :: (31, Boolean) :: (22, Boolean) :: (112, Boolean) :: (97, Boolean) :: (16, Boolean) :: (79, Boolean) :: (88, Boolean) :: (43, Boolean) :: (52, Boolean) :: (70, Boolean) :: (61, Boolean) :: (37, Boolean) :: (28, Boolean) :: (19, Boolean) :: (156, Boolean) :: (120, Boolean) :: (60, Boolean) :: (96, Boolean) :: (150, Boolean) :: (132, Boolean) :: (141, Boolean) :: (105, Boolean) :: (123, Boolean) :: (69, Boolean) :: (90, Boolean) :: (63, Boolean) :: (54, Boolean) :: (162, Boolean) :: (135, Boolean) :: (36, Boolean) :: (27, Boolean) :: (117, Boolean) :: (21, Boolean) :: (12, Boolean) :: (84, Boolean) :: (102, Boolean) :: (30, Boolean) :: (111, Boolean) :: (66, Boolean) :: (15, Boolean) :: (42, Boolean) :: (51, Boolean) :: (24, Boolean) :: (161, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((146, (sloc (*Line*)37 (*Col*)9 (*EndLine*)37 (*EndCol*)12)) :: (101, (sloc (*Line*)35 (*Col*)4 (*EndLine*)35 (*EndCol*)4)) :: (155, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (83, (sloc (*Line*)34 (*Col*)16 (*EndLine*)34 (*EndCol*)16)) :: (110, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (128, (sloc (*Line*)36 (*Col*)21 (*EndLine*)36 (*EndCol*)25)) :: (119, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (95, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (23, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (140, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (113, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (41, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)16)) :: (32, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (50, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)37)) :: (59, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (68, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)16)) :: (149, (sloc (*Line*)37 (*Col*)16 (*EndLine*)37 (*EndCol*)16)) :: (134, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (53, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (62, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (35, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (80, (sloc (*Line*)34 (*Col*)9 (*EndLine*)34 (*EndCol*)12)) :: (89, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (98, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (71, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)21)) :: (11, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (38, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (29, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (20, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (142, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: (124, (sloc (*Line*)36 (*Col*)9 (*EndLine*)36 (*EndCol*)13)) :: (133, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (106, (sloc (*Line*)35 (*Col*)21 (*EndLine*)35 (*EndCol*)24)) :: (160, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: (163, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (127, (sloc (*Line*)36 (*Col*)16 (*EndLine*)36 (*EndCol*)16)) :: (118, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (91, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (145, (sloc (*Line*)37 (*Col*)4 (*EndLine*)37 (*EndCol*)4)) :: (64, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (154, (sloc (*Line*)37 (*Col*)34 (*EndLine*)37 (*EndCol*)34)) :: (139, (sloc (*Line*)36 (*Col*)50 (*EndLine*)36 (*EndCol*)50)) :: (67, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (40, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)7)) :: (13, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (157, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (31, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (22, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (112, (sloc (*Line*)35 (*Col*)37 (*EndLine*)35 (*EndCol*)37)) :: (97, (sloc (*Line*)34 (*Col*)53 (*EndLine*)34 (*EndCol*)53)) :: (16, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (79, (sloc (*Line*)34 (*Col*)4 (*EndLine*)34 (*EndCol*)4)) :: (88, (sloc (*Line*)34 (*Col*)34 (*EndLine*)34 (*EndCol*)34)) :: (43, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (52, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (70, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (61, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)16)) :: (37, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (28, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)17)) :: (19, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (156, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)37)) :: (120, (sloc (*Line*)35 (*Col*)53 (*EndLine*)35 (*EndCol*)53)) :: (60, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)21)) :: (96, (sloc (*Line*)34 (*Col*)50 (*EndLine*)34 (*EndCol*)50)) :: (150, (sloc (*Line*)37 (*Col*)21 (*EndLine*)37 (*EndCol*)24)) :: (132, (sloc (*Line*)36 (*Col*)34 (*EndLine*)36 (*EndCol*)34)) :: (141, (sloc (*Line*)36 (*Col*)53 (*EndLine*)36 (*EndCol*)53)) :: (105, (sloc (*Line*)35 (*Col*)16 (*EndLine*)35 (*EndCol*)16)) :: (123, (sloc (*Line*)36 (*Col*)4 (*EndLine*)36 (*EndCol*)4)) :: (69, (sloc (*Line*)29 (*Col*)16 (*EndLine*)29 (*EndCol*)16)) :: (90, (sloc (*Line*)34 (*Col*)37 (*EndLine*)34 (*EndCol*)37)) :: (63, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)16)) :: (54, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (162, (sloc (*Line*)37 (*Col*)53 (*EndLine*)37 (*EndCol*)53)) :: (135, (sloc (*Line*)36 (*Col*)37 (*EndLine*)36 (*EndCol*)37)) :: (36, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)16)) :: (27, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (117, (sloc (*Line*)35 (*Col*)50 (*EndLine*)35 (*EndCol*)50)) :: (21, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (12, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)17)) :: (84, (sloc (*Line*)34 (*Col*)21 (*EndLine*)34 (*EndCol*)25)) :: (102, (sloc (*Line*)35 (*Col*)9 (*EndLine*)35 (*EndCol*)13)) :: (30, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (111, (sloc (*Line*)35 (*Col*)34 (*EndLine*)35 (*EndCol*)34)) :: (66, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (42, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (51, (sloc (*Line*)26 (*Col*)31 (*EndLine*)26 (*EndCol*)31)) :: (24, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (161, (sloc (*Line*)37 (*Col*)50 (*EndLine*)37 (*EndCol*)50)) :: nil)
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

