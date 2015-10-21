Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Subtype_Declaration 4 ((*FILE_NUM*) 1) Integer (Range 1 5))) 
(D_Seq_Declaration 5
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 6
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 7
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 8
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 9
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 10
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 11
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 12
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 13
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 14
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 15
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 16
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 17
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 18
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *)))))))))))))))) 
(D_Procedure_Body 19 
  (mkprocedure_body 20
    (* = = = Procedure Name = = = *)
    ((*C55C02B*) 17)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 21
  D_Null_Declaration (* Undefined Declarations ! *) 
  (D_Seq_Declaration 22
  (D_Object_Declaration 24 (mkobject_declaration 25 ((*I*) 19) Integer (Some ((E_Literal 23 (Integer_Literal 0) ))))) 
  (D_Seq_Declaration 26
  (D_Type_Declaration 27 (Integer_Type_Declaration 28 ((*Index*) 20) (Range 0 1))) 
  (D_Seq_Declaration 29
  (D_Type_Declaration 30 (Array_Type_Declaration 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
  (D_Seq_Declaration 32
  (D_Object_Declaration 33 (mkobject_declaration 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
  (D_Object_Declaration 35 (mkobject_declaration 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 37
      (S_Assignment 38 (E_Indexed_Component 39 (E_Identifier 40 ((*FT*) 22) ) (E_Literal 41 (Integer_Literal 0) ) ) (E_Literal 42 (Boolean_Literal false) )) 
      (S_Sequence 43
      (S_Assignment 44 (E_Indexed_Component 45 (E_Identifier 46 ((*FT*) 22) ) (E_Literal 47 (Integer_Literal 1) ) ) (E_Literal 48 (Boolean_Literal true) )) 
      (S_Sequence 49
      S_Null (* arguments of procedure call are unrecognized ! *) 
      (S_Sequence 52
      (S_While_Loop 53 (E_Binary_Operation 54 Not_Equal (E_Name 55 (E_Identifier 56 ((*I*) 19) )) (E_Literal 57 (Integer_Literal 10) ) )
        (S_Assignment 58 (E_Identifier 59 ((*I*) 19) ) (E_Binary_Operation 60 Plus (E_Name 61 (E_Identifier 62 ((*I*) 19) )) (E_Literal 63 (Integer_Literal 1) ) ))
      ) 
      (S_Sequence 64
      (S_If 65 (E_Binary_Operation 66 Not_Equal (E_Name 67 (E_Identifier 68 ((*I*) 19) )) (E_Literal 69 (Integer_Literal 10) ) )
        S_Null (* arguments of procedure call are unrecognized ! *)
        S_Null
      ) 
      (S_Sequence 72
      (S_Assignment 73 (E_Identifier 74 ((*I*) 19) ) (E_Literal 75 (Integer_Literal 10) )) 
      (S_Sequence 76
      (S_If 77 (E_Binary_Operation 78 Not_Equal (E_Name 79 (E_Identifier 80 ((*I*) 19) )) (E_Literal 81 (Integer_Literal 14) ) )
        (S_Assignment 82 (E_Identifier 83 ((*X*) 23) ) (E_Literal 84 (Integer_Literal 1) ))
        (S_Assignment 85 (E_Identifier 86 ((*X*) 23) ) (E_Literal 87 (Integer_Literal 0) ))
      ) 
      (S_Sequence 88
      (S_While_Loop 89 (E_Name 90 (E_Indexed_Component 91 (E_Identifier 92 ((*FT*) 22) ) (E_Name 93 (E_Identifier 94 ((*X*) 23) )) ))
        (S_Assignment 95 (E_Identifier 96 ((*I*) 19) ) (E_Binary_Operation 97 Plus (E_Name 98 (E_Identifier 99 ((*I*) 19) )) (E_Literal 100 (Integer_Literal 1) ) ))
      ) 
      (S_Sequence 101
      (S_If 102 (E_Binary_Operation 103 Not_Equal (E_Name 104 (E_Identifier 105 ((*I*) 19) )) (E_Literal 106 (Integer_Literal 14) ) )
        S_Null (* arguments of procedure call are unrecognized ! *)
        S_Null
      ) 
      (S_Procedure_Call 109 110 ((*RESULT*) 7) 
        (nil)
      ))))))))))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 23), (In_Out, (Integer_Type ((*Index*) 20)))) :: (((*FT*) 22), (In_Out, (Array_Type ((*ArrayT*) 21)))) :: (((*I*) 19), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*TIME_STAMP*) 16), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*LEGAL_FILE_NAME*) 15), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*FAILED*) 3), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*RESULT*) 7), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*SPECIAL_ACTION*) 5), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*TEST*) 2), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*NOT_APPLICABLE*) 4), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*C55C02B*) 17), (0, (mkprocedure_body 20
  (* = = = Procedure Name = = = *)
  ((*C55C02B*) 17)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 21
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 22
(D_Object_Declaration 24 (mkobject_declaration 25 ((*I*) 19) Integer (Some ((E_Literal 23 (Integer_Literal 0) ))))) 
(D_Seq_Declaration 26
(D_Type_Declaration 27 (Integer_Type_Declaration 28 ((*Index*) 20) (Range 0 1))) 
(D_Seq_Declaration 29
(D_Type_Declaration 30 (Array_Type_Declaration 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
(D_Seq_Declaration 32
(D_Object_Declaration 33 (mkobject_declaration 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
(D_Object_Declaration 35 (mkobject_declaration 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 37
    (S_Assignment 38 (E_Indexed_Component 39 (E_Identifier 40 ((*FT*) 22) ) (E_Literal 41 (Integer_Literal 0) ) ) (E_Literal 42 (Boolean_Literal false) )) 
    (S_Sequence 43
    (S_Assignment 44 (E_Indexed_Component 45 (E_Identifier 46 ((*FT*) 22) ) (E_Literal 47 (Integer_Literal 1) ) ) (E_Literal 48 (Boolean_Literal true) )) 
    (S_Sequence 49
    S_Null (* arguments of procedure call are unrecognized ! *) 
    (S_Sequence 52
    (S_While_Loop 53 (E_Binary_Operation 54 Not_Equal (E_Name 55 (E_Identifier 56 ((*I*) 19) )) (E_Literal 57 (Integer_Literal 10) ) )
      (S_Assignment 58 (E_Identifier 59 ((*I*) 19) ) (E_Binary_Operation 60 Plus (E_Name 61 (E_Identifier 62 ((*I*) 19) )) (E_Literal 63 (Integer_Literal 1) ) ))
    ) 
    (S_Sequence 64
    (S_If 65 (E_Binary_Operation 66 Not_Equal (E_Name 67 (E_Identifier 68 ((*I*) 19) )) (E_Literal 69 (Integer_Literal 10) ) )
      S_Null (* arguments of procedure call are unrecognized ! *)
      S_Null
    ) 
    (S_Sequence 72
    (S_Assignment 73 (E_Identifier 74 ((*I*) 19) ) (E_Literal 75 (Integer_Literal 10) )) 
    (S_Sequence 76
    (S_If 77 (E_Binary_Operation 78 Not_Equal (E_Name 79 (E_Identifier 80 ((*I*) 19) )) (E_Literal 81 (Integer_Literal 14) ) )
      (S_Assignment 82 (E_Identifier 83 ((*X*) 23) ) (E_Literal 84 (Integer_Literal 1) ))
      (S_Assignment 85 (E_Identifier 86 ((*X*) 23) ) (E_Literal 87 (Integer_Literal 0) ))
    ) 
    (S_Sequence 88
    (S_While_Loop 89 (E_Name 90 (E_Indexed_Component 91 (E_Identifier 92 ((*FT*) 22) ) (E_Name 93 (E_Identifier 94 ((*X*) 23) )) ))
      (S_Assignment 95 (E_Identifier 96 ((*I*) 19) ) (E_Binary_Operation 97 Plus (E_Name 98 (E_Identifier 99 ((*I*) 19) )) (E_Literal 100 (Integer_Literal 1) ) ))
    ) 
    (S_Sequence 101
    (S_If 102 (E_Binary_Operation 103 Not_Equal (E_Name 104 (E_Identifier 105 ((*I*) 19) )) (E_Literal 106 (Integer_Literal 14) ) )
      S_Null (* arguments of procedure call are unrecognized ! *)
      S_Null
    ) 
    (S_Procedure_Call 109 110 ((*RESULT*) 7) 
      (nil)
    ))))))))))
))) :: (((*COMMENT*) 6), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*ArrayT*) 21), (Array_Type_Declaration 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) :: (((*FILE_NUM*) 1), (Subtype_Declaration 4 ((*FILE_NUM*) 1) Integer (Range 1 5))) :: (((*Index*) 20), (Integer_Type_Declaration 28 ((*Index*) 20) (Range 0 1))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, (Array_Type ((*ArrayT*) 21))) :: (83, (Integer_Type ((*Index*) 20))) :: (104, Integer) :: (23, Integer) :: (86, (Integer_Type ((*Index*) 20))) :: (41, Integer) :: (59, Integer) :: (68, Integer) :: (62, Integer) :: (80, Integer) :: (98, Integer) :: (74, Integer) :: (56, Integer) :: (47, Integer) :: (106, Integer) :: (46, (Array_Type ((*ArrayT*) 21))) :: (100, Integer) :: (91, Boolean) :: (55, Integer) :: (94, (Integer_Type ((*Index*) 20))) :: (40, (Array_Type ((*ArrayT*) 21))) :: (67, Integer) :: (103, Boolean) :: (97, Integer) :: (79, Integer) :: (61, Integer) :: (87, Integer) :: (60, Integer) :: (96, Integer) :: (105, Integer) :: (69, Integer) :: (78, Boolean) :: (99, Integer) :: (90, Boolean) :: (54, Boolean) :: (45, Boolean) :: (63, Integer) :: (81, Integer) :: (84, Integer) :: (57, Integer) :: (48, Boolean) :: (93, (Integer_Type ((*Index*) 20))) :: (75, Integer) :: (39, Boolean) :: (66, Boolean) :: (42, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)66 (*Col*)12 (*EndLine*)66 (*EndCol*)13)) :: (83, (sloc (*Line*)60 (*Col*)8 (*EndLine*)60 (*EndCol*)8)) :: (104, (sloc (*Line*)69 (*Col*)9 (*EndLine*)69 (*EndCol*)9)) :: (23, (sloc (*Line*)35 (*Col*)21 (*EndLine*)35 (*EndCol*)21)) :: (86, (sloc (*Line*)62 (*Col*)8 (*EndLine*)62 (*EndCol*)8)) :: (41, (sloc (*Line*)45 (*Col*)9 (*EndLine*)45 (*EndCol*)9)) :: (59, (sloc (*Line*)51 (*Col*)11 (*EndLine*)51 (*EndCol*)11)) :: (68, (sloc (*Line*)53 (*Col*)9 (*EndLine*)53 (*EndCol*)9)) :: (62, (sloc (*Line*)51 (*Col*)16 (*EndLine*)51 (*EndCol*)16)) :: (80, (sloc (*Line*)59 (*Col*)10 (*EndLine*)59 (*EndCol*)10)) :: (98, (sloc (*Line*)67 (*Col*)16 (*EndLine*)67 (*EndCol*)16)) :: (74, (sloc (*Line*)57 (*Col*)6 (*EndLine*)57 (*EndCol*)6)) :: (56, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)12)) :: (47, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)9)) :: (106, (sloc (*Line*)69 (*Col*)14 (*EndLine*)69 (*EndCol*)15)) :: (46, (sloc (*Line*)46 (*Col*)6 (*EndLine*)46 (*EndCol*)7)) :: (100, (sloc (*Line*)67 (*Col*)20 (*EndLine*)67 (*EndCol*)20)) :: (91, (sloc (*Line*)66 (*Col*)12 (*EndLine*)66 (*EndCol*)17)) :: (55, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)12)) :: (94, (sloc (*Line*)66 (*Col*)16 (*EndLine*)66 (*EndCol*)16)) :: (40, (sloc (*Line*)45 (*Col*)6 (*EndLine*)45 (*EndCol*)7)) :: (67, (sloc (*Line*)53 (*Col*)9 (*EndLine*)53 (*EndCol*)9)) :: (103, (sloc (*Line*)69 (*Col*)9 (*EndLine*)69 (*EndCol*)15)) :: (97, (sloc (*Line*)67 (*Col*)16 (*EndLine*)67 (*EndCol*)20)) :: (79, (sloc (*Line*)59 (*Col*)10 (*EndLine*)59 (*EndCol*)10)) :: (61, (sloc (*Line*)51 (*Col*)16 (*EndLine*)51 (*EndCol*)16)) :: (87, (sloc (*Line*)62 (*Col*)13 (*EndLine*)62 (*EndCol*)13)) :: (60, (sloc (*Line*)51 (*Col*)16 (*EndLine*)51 (*EndCol*)20)) :: (96, (sloc (*Line*)67 (*Col*)11 (*EndLine*)67 (*EndCol*)11)) :: (105, (sloc (*Line*)69 (*Col*)9 (*EndLine*)69 (*EndCol*)9)) :: (69, (sloc (*Line*)53 (*Col*)14 (*EndLine*)53 (*EndCol*)15)) :: (78, (sloc (*Line*)59 (*Col*)10 (*EndLine*)59 (*EndCol*)16)) :: (99, (sloc (*Line*)67 (*Col*)16 (*EndLine*)67 (*EndCol*)16)) :: (90, (sloc (*Line*)66 (*Col*)12 (*EndLine*)66 (*EndCol*)17)) :: (54, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)18)) :: (45, (sloc (*Line*)46 (*Col*)6 (*EndLine*)46 (*EndCol*)10)) :: (63, (sloc (*Line*)51 (*Col*)20 (*EndLine*)51 (*EndCol*)20)) :: (81, (sloc (*Line*)59 (*Col*)15 (*EndLine*)59 (*EndCol*)16)) :: (84, (sloc (*Line*)60 (*Col*)13 (*EndLine*)60 (*EndCol*)13)) :: (57, (sloc (*Line*)50 (*Col*)17 (*EndLine*)50 (*EndCol*)18)) :: (48, (sloc (*Line*)46 (*Col*)15 (*EndLine*)46 (*EndCol*)18)) :: (93, (sloc (*Line*)66 (*Col*)16 (*EndLine*)66 (*EndCol*)16)) :: (75, (sloc (*Line*)57 (*Col*)11 (*EndLine*)57 (*EndCol*)12)) :: (39, (sloc (*Line*)45 (*Col*)6 (*EndLine*)45 (*EndCol*)10)) :: (66, (sloc (*Line*)53 (*Col*)9 (*EndLine*)53 (*EndCol*)15)) :: (42, (sloc (*Line*)45 (*Col*)15 (*EndLine*)45 (*EndCol*)19)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("X", "ada://variable/C55C02B+31:11/X+42:6")) :: (22, ("FT", "ada://variable/C55C02B+31:11/FT+41:6")) :: (19, ("I", "ada://variable/C55C02B+31:11/I+35:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((17, ("C55C02B", "ada://procedure_body/C55C02B+31:11")) :: (8, ("IDENT_INT", "ada://expression_function/ACATS_REPORT-47:9/IDENT_INT-112:15")) :: (11, ("IDENT_BOOL", "ada://expression_function/ACATS_REPORT-47:9/IDENT_BOOL-129:15")) :: (2, ("TEST", "ada://procedure/ACATS_REPORT-47:9/TEST-53:16")) :: (5, ("SPECIAL_ACTION", "ada://procedure/ACATS_REPORT-47:9/SPECIAL_ACTION-85:16")) :: (14, ("EQUAL", "ada://expression_function/ACATS_REPORT-47:9/EQUAL-144:15")) :: (4, ("NOT_APPLICABLE", "ada://procedure/ACATS_REPORT-47:9/NOT_APPLICABLE-75:16")) :: (13, ("IDENT_WIDE_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_STR-139:15")) :: (16, ("TIME_STAMP", "ada://function/ACATS_REPORT-47:9/TIME_STAMP-159:15")) :: (7, ("RESULT", "ada://procedure/ACATS_REPORT-47:9/RESULT-99:16")) :: (10, ("IDENT_WIDE_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_CHAR-123:15")) :: (9, ("IDENT_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_CHAR-117:15")) :: (3, ("FAILED", "ada://procedure/ACATS_REPORT-47:9/FAILED-65:16")) :: (12, ("IDENT_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_STR-134:15")) :: (15, ("LEGAL_FILE_NAME", "ada://function/ACATS_REPORT-47:9/LEGAL_FILE_NAME-152:15")) :: (6, ("COMMENT", "ada://procedure/ACATS_REPORT-47:9/COMMENT-94:16")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((20, ("Index", "ada://ordinary_type/C55C02B+31:11/Index+39:11")) :: (1, ("FILE_NUM", "ada://subtype/ACATS_REPORT-47:9/FILE_NUM-49:14")) :: (21, ("ArrayT", "ada://ordinary_type/C55C02B+31:11/ArrayT+40:11")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Subtype_Declaration_X 4 ((*FILE_NUM*) 1) Integer (Range_X 1 5))) 
(D_Seq_Declaration_X 5
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 6
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 7
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 8
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 9
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 10
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 11
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 12
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 13
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 14
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 15
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 16
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 17
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 18
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *)))))))))))))))) 
(D_Procedure_Body_X 19 
  (mkprocedure_body_x 20
    (* = = = Procedure Name = = = *)
    ((*C55C02B*) 17)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 21
  D_Null_Declaration_X (* Undefined Declarations ! *) 
  (D_Seq_Declaration_X 22
  (D_Object_Declaration_X 24 (mkobject_declaration_x 25 ((*I*) 19) Integer (Some ((E_Literal_X 23 (Integer_Literal 0) (nil) nil))))) 
  (D_Seq_Declaration_X 26
  (D_Type_Declaration_X 27 (Integer_Type_Declaration_X 28 ((*Index*) 20) (Range_X 0 1))) 
  (D_Seq_Declaration_X 29
  (D_Type_Declaration_X 30 (Array_Type_Declaration_X 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
  (D_Seq_Declaration_X 32
  (D_Object_Declaration_X 33 (mkobject_declaration_x 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
  (D_Object_Declaration_X 35 (mkobject_declaration_x 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 37
      (S_Assignment_X 38 (E_Indexed_Component_X 39 (E_Identifier_X 40 ((*FT*) 22) (nil)) (E_Literal_X 41 (Integer_Literal 0) (nil) nil) (nil)) (E_Literal_X 42 (Boolean_Literal false) (nil) nil)) 
      (S_Sequence_X 43
      (S_Assignment_X 44 (E_Indexed_Component_X 45 (E_Identifier_X 46 ((*FT*) 22) (nil)) (E_Literal_X 47 (Integer_Literal 1) (nil) nil) (nil)) (E_Literal_X 48 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 49
      S_Null_X (* arguments of procedure call are unrecognized ! *) 
      (S_Sequence_X 52
      (S_While_Loop_X 53 (E_Binary_Operation_X 54 Not_Equal (E_Name_X 55 (E_Identifier_X 56 ((*I*) 19) (nil))) (E_Literal_X 57 (Integer_Literal 10) (nil) nil) (nil) nil)
        (S_Assignment_X 58 (E_Identifier_X 59 ((*I*) 19) (nil)) (E_Binary_Operation_X 60 Plus (E_Name_X 61 (E_Identifier_X 62 ((*I*) 19) (nil))) (E_Literal_X 63 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      ) 
      (S_Sequence_X 64
      (S_If_X 65 (E_Binary_Operation_X 66 Not_Equal (E_Name_X 67 (E_Identifier_X 68 ((*I*) 19) (nil))) (E_Literal_X 69 (Integer_Literal 10) (nil) nil) (nil) nil)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        S_Null_X
      ) 
      (S_Sequence_X 72
      (S_Assignment_X 73 (E_Identifier_X 74 ((*I*) 19) (nil)) (E_Literal_X 75 (Integer_Literal 10) (nil) nil)) 
      (S_Sequence_X 76
      (S_If_X 77 (E_Binary_Operation_X 78 Not_Equal (E_Name_X 79 (E_Identifier_X 80 ((*I*) 19) (nil))) (E_Literal_X 81 (Integer_Literal 14) (nil) nil) (nil) nil)
        (S_Assignment_X 82 (E_Identifier_X 83 ((*X*) 23) (nil)) (E_Literal_X 84 (Integer_Literal 1) (nil) nil))
        (S_Assignment_X 85 (E_Identifier_X 86 ((*X*) 23) (nil)) (E_Literal_X 87 (Integer_Literal 0) (nil) nil))
      ) 
      (S_Sequence_X 88
      (S_While_Loop_X 89 (E_Name_X 90 (E_Indexed_Component_X 91 (E_Identifier_X 92 ((*FT*) 22) (nil)) (E_Name_X 93 (E_Identifier_X 94 ((*X*) 23) (nil))) (nil)))
        (S_Assignment_X 95 (E_Identifier_X 96 ((*I*) 19) (nil)) (E_Binary_Operation_X 97 Plus (E_Name_X 98 (E_Identifier_X 99 ((*I*) 19) (nil))) (E_Literal_X 100 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      ) 
      (S_Sequence_X 101
      (S_If_X 102 (E_Binary_Operation_X 103 Not_Equal (E_Name_X 104 (E_Identifier_X 105 ((*I*) 19) (nil))) (E_Literal_X 106 (Integer_Literal 14) (nil) nil) (nil) nil)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        S_Null_X
      ) 
      (S_Procedure_Call_X 109 110 ((*RESULT*) 7) 
        (nil)
      ))))))))))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 23), (In_Out, (Integer_Type ((*Index*) 20)))) :: (((*FT*) 22), (In_Out, (Array_Type ((*ArrayT*) 21)))) :: (((*I*) 19), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*TIME_STAMP*) 16), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*LEGAL_FILE_NAME*) 15), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*FAILED*) 3), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*RESULT*) 7), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*SPECIAL_ACTION*) 5), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*TEST*) 2), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*NOT_APPLICABLE*) 4), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*C55C02B*) 17), (0, (mkprocedure_body_x 20
  (* = = = Procedure Name = = = *)
  ((*C55C02B*) 17)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 21
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 22
(D_Object_Declaration_X 24 (mkobject_declaration_x 25 ((*I*) 19) Integer (Some ((E_Literal_X 23 (Integer_Literal 0) (nil) nil))))) 
(D_Seq_Declaration_X 26
(D_Type_Declaration_X 27 (Integer_Type_Declaration_X 28 ((*Index*) 20) (Range_X 0 1))) 
(D_Seq_Declaration_X 29
(D_Type_Declaration_X 30 (Array_Type_Declaration_X 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
(D_Seq_Declaration_X 32
(D_Object_Declaration_X 33 (mkobject_declaration_x 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
(D_Object_Declaration_X 35 (mkobject_declaration_x 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 37
    (S_Assignment_X 38 (E_Indexed_Component_X 39 (E_Identifier_X 40 ((*FT*) 22) (nil)) (E_Literal_X 41 (Integer_Literal 0) (nil) nil) (nil)) (E_Literal_X 42 (Boolean_Literal false) (nil) nil)) 
    (S_Sequence_X 43
    (S_Assignment_X 44 (E_Indexed_Component_X 45 (E_Identifier_X 46 ((*FT*) 22) (nil)) (E_Literal_X 47 (Integer_Literal 1) (nil) nil) (nil)) (E_Literal_X 48 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 49
    S_Null_X (* arguments of procedure call are unrecognized ! *) 
    (S_Sequence_X 52
    (S_While_Loop_X 53 (E_Binary_Operation_X 54 Not_Equal (E_Name_X 55 (E_Identifier_X 56 ((*I*) 19) (nil))) (E_Literal_X 57 (Integer_Literal 10) (nil) nil) (nil) nil)
      (S_Assignment_X 58 (E_Identifier_X 59 ((*I*) 19) (nil)) (E_Binary_Operation_X 60 Plus (E_Name_X 61 (E_Identifier_X 62 ((*I*) 19) (nil))) (E_Literal_X 63 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
    ) 
    (S_Sequence_X 64
    (S_If_X 65 (E_Binary_Operation_X 66 Not_Equal (E_Name_X 67 (E_Identifier_X 68 ((*I*) 19) (nil))) (E_Literal_X 69 (Integer_Literal 10) (nil) nil) (nil) nil)
      S_Null_X (* arguments of procedure call are unrecognized ! *)
      S_Null_X
    ) 
    (S_Sequence_X 72
    (S_Assignment_X 73 (E_Identifier_X 74 ((*I*) 19) (nil)) (E_Literal_X 75 (Integer_Literal 10) (nil) nil)) 
    (S_Sequence_X 76
    (S_If_X 77 (E_Binary_Operation_X 78 Not_Equal (E_Name_X 79 (E_Identifier_X 80 ((*I*) 19) (nil))) (E_Literal_X 81 (Integer_Literal 14) (nil) nil) (nil) nil)
      (S_Assignment_X 82 (E_Identifier_X 83 ((*X*) 23) (nil)) (E_Literal_X 84 (Integer_Literal 1) (nil) nil))
      (S_Assignment_X 85 (E_Identifier_X 86 ((*X*) 23) (nil)) (E_Literal_X 87 (Integer_Literal 0) (nil) nil))
    ) 
    (S_Sequence_X 88
    (S_While_Loop_X 89 (E_Name_X 90 (E_Indexed_Component_X 91 (E_Identifier_X 92 ((*FT*) 22) (nil)) (E_Name_X 93 (E_Identifier_X 94 ((*X*) 23) (nil))) (nil)))
      (S_Assignment_X 95 (E_Identifier_X 96 ((*I*) 19) (nil)) (E_Binary_Operation_X 97 Plus (E_Name_X 98 (E_Identifier_X 99 ((*I*) 19) (nil))) (E_Literal_X 100 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
    ) 
    (S_Sequence_X 101
    (S_If_X 102 (E_Binary_Operation_X 103 Not_Equal (E_Name_X 104 (E_Identifier_X 105 ((*I*) 19) (nil))) (E_Literal_X 106 (Integer_Literal 14) (nil) nil) (nil) nil)
      S_Null_X (* arguments of procedure call are unrecognized ! *)
      S_Null_X
    ) 
    (S_Procedure_Call_X 109 110 ((*RESULT*) 7) 
      (nil)
    ))))))))))
))) :: (((*COMMENT*) 6), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*ArrayT*) 21), (Array_Type_Declaration_X 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) :: (((*FILE_NUM*) 1), (Subtype_Declaration_X 4 ((*FILE_NUM*) 1) Integer (Range_X 1 5))) :: (((*Index*) 20), (Integer_Type_Declaration_X 28 ((*Index*) 20) (Range_X 0 1))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, (Array_Type ((*ArrayT*) 21))) :: (83, (Integer_Type ((*Index*) 20))) :: (104, Integer) :: (23, Integer) :: (86, (Integer_Type ((*Index*) 20))) :: (41, Integer) :: (59, Integer) :: (68, Integer) :: (62, Integer) :: (80, Integer) :: (98, Integer) :: (74, Integer) :: (56, Integer) :: (47, Integer) :: (106, Integer) :: (46, (Array_Type ((*ArrayT*) 21))) :: (100, Integer) :: (91, Boolean) :: (55, Integer) :: (94, (Integer_Type ((*Index*) 20))) :: (40, (Array_Type ((*ArrayT*) 21))) :: (67, Integer) :: (103, Boolean) :: (97, Integer) :: (79, Integer) :: (61, Integer) :: (87, Integer) :: (60, Integer) :: (96, Integer) :: (105, Integer) :: (69, Integer) :: (78, Boolean) :: (99, Integer) :: (90, Boolean) :: (54, Boolean) :: (45, Boolean) :: (63, Integer) :: (81, Integer) :: (84, Integer) :: (57, Integer) :: (48, Boolean) :: (93, (Integer_Type ((*Index*) 20))) :: (75, Integer) :: (39, Boolean) :: (66, Boolean) :: (42, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)66 (*Col*)12 (*EndLine*)66 (*EndCol*)13)) :: (83, (sloc (*Line*)60 (*Col*)8 (*EndLine*)60 (*EndCol*)8)) :: (104, (sloc (*Line*)69 (*Col*)9 (*EndLine*)69 (*EndCol*)9)) :: (23, (sloc (*Line*)35 (*Col*)21 (*EndLine*)35 (*EndCol*)21)) :: (86, (sloc (*Line*)62 (*Col*)8 (*EndLine*)62 (*EndCol*)8)) :: (41, (sloc (*Line*)45 (*Col*)9 (*EndLine*)45 (*EndCol*)9)) :: (59, (sloc (*Line*)51 (*Col*)11 (*EndLine*)51 (*EndCol*)11)) :: (68, (sloc (*Line*)53 (*Col*)9 (*EndLine*)53 (*EndCol*)9)) :: (62, (sloc (*Line*)51 (*Col*)16 (*EndLine*)51 (*EndCol*)16)) :: (80, (sloc (*Line*)59 (*Col*)10 (*EndLine*)59 (*EndCol*)10)) :: (98, (sloc (*Line*)67 (*Col*)16 (*EndLine*)67 (*EndCol*)16)) :: (74, (sloc (*Line*)57 (*Col*)6 (*EndLine*)57 (*EndCol*)6)) :: (56, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)12)) :: (47, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)9)) :: (106, (sloc (*Line*)69 (*Col*)14 (*EndLine*)69 (*EndCol*)15)) :: (46, (sloc (*Line*)46 (*Col*)6 (*EndLine*)46 (*EndCol*)7)) :: (100, (sloc (*Line*)67 (*Col*)20 (*EndLine*)67 (*EndCol*)20)) :: (91, (sloc (*Line*)66 (*Col*)12 (*EndLine*)66 (*EndCol*)17)) :: (55, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)12)) :: (94, (sloc (*Line*)66 (*Col*)16 (*EndLine*)66 (*EndCol*)16)) :: (40, (sloc (*Line*)45 (*Col*)6 (*EndLine*)45 (*EndCol*)7)) :: (67, (sloc (*Line*)53 (*Col*)9 (*EndLine*)53 (*EndCol*)9)) :: (103, (sloc (*Line*)69 (*Col*)9 (*EndLine*)69 (*EndCol*)15)) :: (97, (sloc (*Line*)67 (*Col*)16 (*EndLine*)67 (*EndCol*)20)) :: (79, (sloc (*Line*)59 (*Col*)10 (*EndLine*)59 (*EndCol*)10)) :: (61, (sloc (*Line*)51 (*Col*)16 (*EndLine*)51 (*EndCol*)16)) :: (87, (sloc (*Line*)62 (*Col*)13 (*EndLine*)62 (*EndCol*)13)) :: (60, (sloc (*Line*)51 (*Col*)16 (*EndLine*)51 (*EndCol*)20)) :: (96, (sloc (*Line*)67 (*Col*)11 (*EndLine*)67 (*EndCol*)11)) :: (105, (sloc (*Line*)69 (*Col*)9 (*EndLine*)69 (*EndCol*)9)) :: (69, (sloc (*Line*)53 (*Col*)14 (*EndLine*)53 (*EndCol*)15)) :: (78, (sloc (*Line*)59 (*Col*)10 (*EndLine*)59 (*EndCol*)16)) :: (99, (sloc (*Line*)67 (*Col*)16 (*EndLine*)67 (*EndCol*)16)) :: (90, (sloc (*Line*)66 (*Col*)12 (*EndLine*)66 (*EndCol*)17)) :: (54, (sloc (*Line*)50 (*Col*)12 (*EndLine*)50 (*EndCol*)18)) :: (45, (sloc (*Line*)46 (*Col*)6 (*EndLine*)46 (*EndCol*)10)) :: (63, (sloc (*Line*)51 (*Col*)20 (*EndLine*)51 (*EndCol*)20)) :: (81, (sloc (*Line*)59 (*Col*)15 (*EndLine*)59 (*EndCol*)16)) :: (84, (sloc (*Line*)60 (*Col*)13 (*EndLine*)60 (*EndCol*)13)) :: (57, (sloc (*Line*)50 (*Col*)17 (*EndLine*)50 (*EndCol*)18)) :: (48, (sloc (*Line*)46 (*Col*)15 (*EndLine*)46 (*EndCol*)18)) :: (93, (sloc (*Line*)66 (*Col*)16 (*EndLine*)66 (*EndCol*)16)) :: (75, (sloc (*Line*)57 (*Col*)11 (*EndLine*)57 (*EndCol*)12)) :: (39, (sloc (*Line*)45 (*Col*)6 (*EndLine*)45 (*EndCol*)10)) :: (66, (sloc (*Line*)53 (*Col*)9 (*EndLine*)53 (*EndCol*)15)) :: (42, (sloc (*Line*)45 (*Col*)15 (*EndLine*)45 (*EndCol*)19)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("X", "ada://variable/C55C02B+31:11/X+42:6")) :: (22, ("FT", "ada://variable/C55C02B+31:11/FT+41:6")) :: (19, ("I", "ada://variable/C55C02B+31:11/I+35:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((17, ("C55C02B", "ada://procedure_body/C55C02B+31:11")) :: (8, ("IDENT_INT", "ada://expression_function/ACATS_REPORT-47:9/IDENT_INT-112:15")) :: (11, ("IDENT_BOOL", "ada://expression_function/ACATS_REPORT-47:9/IDENT_BOOL-129:15")) :: (2, ("TEST", "ada://procedure/ACATS_REPORT-47:9/TEST-53:16")) :: (5, ("SPECIAL_ACTION", "ada://procedure/ACATS_REPORT-47:9/SPECIAL_ACTION-85:16")) :: (14, ("EQUAL", "ada://expression_function/ACATS_REPORT-47:9/EQUAL-144:15")) :: (4, ("NOT_APPLICABLE", "ada://procedure/ACATS_REPORT-47:9/NOT_APPLICABLE-75:16")) :: (13, ("IDENT_WIDE_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_STR-139:15")) :: (16, ("TIME_STAMP", "ada://function/ACATS_REPORT-47:9/TIME_STAMP-159:15")) :: (7, ("RESULT", "ada://procedure/ACATS_REPORT-47:9/RESULT-99:16")) :: (10, ("IDENT_WIDE_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_CHAR-123:15")) :: (9, ("IDENT_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_CHAR-117:15")) :: (3, ("FAILED", "ada://procedure/ACATS_REPORT-47:9/FAILED-65:16")) :: (12, ("IDENT_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_STR-134:15")) :: (15, ("LEGAL_FILE_NAME", "ada://function/ACATS_REPORT-47:9/LEGAL_FILE_NAME-152:15")) :: (6, ("COMMENT", "ada://procedure/ACATS_REPORT-47:9/COMMENT-94:16")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((20, ("Index", "ada://ordinary_type/C55C02B+31:11/Index+39:11")) :: (1, ("FILE_NUM", "ada://subtype/ACATS_REPORT-47:9/FILE_NUM-49:14")) :: (21, ("ArrayT", "ada://ordinary_type/C55C02B+31:11/ArrayT+40:11")) :: nil)
))
).

