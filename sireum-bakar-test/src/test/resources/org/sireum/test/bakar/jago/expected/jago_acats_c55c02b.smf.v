Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (SubtypeDecl 4 ((*FILE_NUM*) 1) Integer (Range 1 5))) 
(SeqDecl 5
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 6
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 7
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 8
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 9
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 10
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 11
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 12
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 13
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 14
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 15
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 16
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 17
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 18
NullDecl (* Undefined Declarations ! *) 
NullDecl (* Undefined Declarations ! *)))))))))))))))) 
(ProcBodyDecl 19 
  (mkprocBodyDecl 20
    (* = = = Procedure Name = = = *)
    ((*C55C02B*) 17)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 21
  NullDecl (* Undefined Declarations ! *) 
  (SeqDecl 22
  (ObjDecl 24 (mkobjDecl 25 ((*I*) 19) Integer (Some ((Literal 23 (Integer_Literal 0) ))))) 
  (SeqDecl 26
  (TypeDecl 27 (IntegerTypeDecl 28 ((*Index*) 20) (Range 0 1))) 
  (SeqDecl 29
  (TypeDecl 30 (ArrayTypeDecl 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
  (SeqDecl 32
  (ObjDecl 33 (mkobjDecl 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
  (ObjDecl 35 (mkobjDecl 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
    (* = = = Procedure Body = = = *)
      (Seq 37
      (Assign 38 (IndexedComponent 39 (Identifier 40 ((*FT*) 22) ) (Literal 41 (Integer_Literal 0) ) ) (Literal 42 (Boolean_Literal false) )) 
      (Seq 43
      (Assign 44 (IndexedComponent 45 (Identifier 46 ((*FT*) 22) ) (Literal 47 (Integer_Literal 1) ) ) (Literal 48 (Boolean_Literal true) )) 
      (Seq 49
      Null (* arguments of procedure call are unrecognized ! *) 
      (Seq 52
      (While 53 (BinOp 54 Not_Equal (Name 55 (Identifier 56 ((*I*) 19) )) (Literal 57 (Integer_Literal 10) ) )
        (Assign 58 (Identifier 59 ((*I*) 19) ) (BinOp 60 Plus (Name 61 (Identifier 62 ((*I*) 19) )) (Literal 63 (Integer_Literal 1) ) ))
      ) 
      (Seq 64
      (If 65 (BinOp 66 Not_Equal (Name 67 (Identifier 68 ((*I*) 19) )) (Literal 69 (Integer_Literal 10) ) )
        Null (* arguments of procedure call are unrecognized ! *)
        Null
      ) 
      (Seq 72
      (Assign 73 (Identifier 74 ((*I*) 19) ) (Literal 75 (Integer_Literal 10) )) 
      (Seq 76
      (If 77 (BinOp 78 Not_Equal (Name 79 (Identifier 80 ((*I*) 19) )) (Literal 81 (Integer_Literal 14) ) )
        (Assign 82 (Identifier 83 ((*X*) 23) ) (Literal 84 (Integer_Literal 1) ))
        (Assign 85 (Identifier 86 ((*X*) 23) ) (Literal 87 (Integer_Literal 0) ))
      ) 
      (Seq 88
      (While 89 (Name 90 (IndexedComponent 91 (Identifier 92 ((*FT*) 22) ) (Name 93 (Identifier 94 ((*X*) 23) )) ))
        (Assign 95 (Identifier 96 ((*I*) 19) ) (BinOp 97 Plus (Name 98 (Identifier 99 ((*I*) 19) )) (Literal 100 (Integer_Literal 1) ) ))
      ) 
      (Seq 101
      (If 102 (BinOp 103 Not_Equal (Name 104 (Identifier 105 ((*I*) 19) )) (Literal 106 (Integer_Literal 14) ) )
        Null (* arguments of procedure call are unrecognized ! *)
        Null
      ) 
      (Call 109 110 ((*RESULT*) 7) 
        (nil)
      ))))))))))
  )
))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 23), (In_Out, (Integer_Type ((*Index*) 20)))) :: (((*FT*) 22), (In_Out, (Array_Type ((*ArrayT*) 21)))) :: (((*I*) 19), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*TIME_STAMP*) 16), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*LEGAL_FILE_NAME*) 15), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*FAILED*) 3), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*RESULT*) 7), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*SPECIAL_ACTION*) 5), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*TEST*) 2), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*NOT_APPLICABLE*) 4), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*C55C02B*) 17), (0, (mkprocBodyDecl 20
  (* = = = Procedure Name = = = *)
  ((*C55C02B*) 17)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 21
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 22
(ObjDecl 24 (mkobjDecl 25 ((*I*) 19) Integer (Some ((Literal 23 (Integer_Literal 0) ))))) 
(SeqDecl 26
(TypeDecl 27 (IntegerTypeDecl 28 ((*Index*) 20) (Range 0 1))) 
(SeqDecl 29
(TypeDecl 30 (ArrayTypeDecl 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
(SeqDecl 32
(ObjDecl 33 (mkobjDecl 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
(ObjDecl 35 (mkobjDecl 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
  (* = = = Procedure Body = = = *)
    (Seq 37
    (Assign 38 (IndexedComponent 39 (Identifier 40 ((*FT*) 22) ) (Literal 41 (Integer_Literal 0) ) ) (Literal 42 (Boolean_Literal false) )) 
    (Seq 43
    (Assign 44 (IndexedComponent 45 (Identifier 46 ((*FT*) 22) ) (Literal 47 (Integer_Literal 1) ) ) (Literal 48 (Boolean_Literal true) )) 
    (Seq 49
    Null (* arguments of procedure call are unrecognized ! *) 
    (Seq 52
    (While 53 (BinOp 54 Not_Equal (Name 55 (Identifier 56 ((*I*) 19) )) (Literal 57 (Integer_Literal 10) ) )
      (Assign 58 (Identifier 59 ((*I*) 19) ) (BinOp 60 Plus (Name 61 (Identifier 62 ((*I*) 19) )) (Literal 63 (Integer_Literal 1) ) ))
    ) 
    (Seq 64
    (If 65 (BinOp 66 Not_Equal (Name 67 (Identifier 68 ((*I*) 19) )) (Literal 69 (Integer_Literal 10) ) )
      Null (* arguments of procedure call are unrecognized ! *)
      Null
    ) 
    (Seq 72
    (Assign 73 (Identifier 74 ((*I*) 19) ) (Literal 75 (Integer_Literal 10) )) 
    (Seq 76
    (If 77 (BinOp 78 Not_Equal (Name 79 (Identifier 80 ((*I*) 19) )) (Literal 81 (Integer_Literal 14) ) )
      (Assign 82 (Identifier 83 ((*X*) 23) ) (Literal 84 (Integer_Literal 1) ))
      (Assign 85 (Identifier 86 ((*X*) 23) ) (Literal 87 (Integer_Literal 0) ))
    ) 
    (Seq 88
    (While 89 (Name 90 (IndexedComponent 91 (Identifier 92 ((*FT*) 22) ) (Name 93 (Identifier 94 ((*X*) 23) )) ))
      (Assign 95 (Identifier 96 ((*I*) 19) ) (BinOp 97 Plus (Name 98 (Identifier 99 ((*I*) 19) )) (Literal 100 (Integer_Literal 1) ) ))
    ) 
    (Seq 101
    (If 102 (BinOp 103 Not_Equal (Name 104 (Identifier 105 ((*I*) 19) )) (Literal 106 (Integer_Literal 14) ) )
      Null (* arguments of procedure call are unrecognized ! *)
      Null
    ) 
    (Call 109 110 ((*RESULT*) 7) 
      (nil)
    ))))))))))
))) :: (((*COMMENT*) 6), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*ArrayT*) 21), (ArrayTypeDecl 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) :: (((*FILE_NUM*) 1), (SubtypeDecl 4 ((*FILE_NUM*) 1) Integer (Range 1 5))) :: (((*Index*) 20), (IntegerTypeDecl 28 ((*Index*) 20) (Range 0 1))) :: nil)
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

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (SubtypeDeclRT 4 ((*FILE_NUM*) 1) Integer (RangeRT 1 5))) 
(SeqDeclRT 5
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 6
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 7
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 8
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 9
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 10
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 11
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 12
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 13
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 14
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 15
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 16
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 17
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 18
NullDeclRT (* Undefined Declarations ! *) 
NullDeclRT (* Undefined Declarations ! *)))))))))))))))) 
(ProcBodyDeclRT 19 
  (mkprocBodyDeclRT 20
    (* = = = Procedure Name = = = *)
    ((*C55C02B*) 17)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 21
  NullDeclRT (* Undefined Declarations ! *) 
  (SeqDeclRT 22
  (ObjDeclRT 24 (mkobjDeclRT 25 ((*I*) 19) Integer (Some ((LiteralRT 23 (Integer_Literal 0) (nil) nil))))) 
  (SeqDeclRT 26
  (TypeDeclRT 27 (IntegerTypeDeclRT 28 ((*Index*) 20) (RangeRT 0 1))) 
  (SeqDeclRT 29
  (TypeDeclRT 30 (ArrayTypeDeclRT 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
  (SeqDeclRT 32
  (ObjDeclRT 33 (mkobjDeclRT 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
  (ObjDeclRT 35 (mkobjDeclRT 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 37
      (AssignRT 38 (IndexedComponentRT 39 (IdentifierRT 40 ((*FT*) 22) (nil)) (LiteralRT 41 (Integer_Literal 0) (nil) nil) (nil)) (LiteralRT 42 (Boolean_Literal false) (nil) nil)) 
      (SeqRT 43
      (AssignRT 44 (IndexedComponentRT 45 (IdentifierRT 46 ((*FT*) 22) (nil)) (LiteralRT 47 (Integer_Literal 1) (nil) nil) (nil)) (LiteralRT 48 (Boolean_Literal true) (nil) nil)) 
      (SeqRT 49
      NullRT (* arguments of procedure call are unrecognized ! *) 
      (SeqRT 52
      (WhileRT 53 (BinOpRT 54 Not_Equal (NameRT 55 (IdentifierRT 56 ((*I*) 19) (nil))) (LiteralRT 57 (Integer_Literal 10) (nil) nil) (nil) nil)
        (AssignRT 58 (IdentifierRT 59 ((*I*) 19) (nil)) (BinOpRT 60 Plus (NameRT 61 (IdentifierRT 62 ((*I*) 19) (nil))) (LiteralRT 63 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
      ) 
      (SeqRT 64
      (IfRT 65 (BinOpRT 66 Not_Equal (NameRT 67 (IdentifierRT 68 ((*I*) 19) (nil))) (LiteralRT 69 (Integer_Literal 10) (nil) nil) (nil) nil)
        NullRT (* arguments of procedure call are unrecognized ! *)
        NullRT
      ) 
      (SeqRT 72
      (AssignRT 73 (IdentifierRT 74 ((*I*) 19) (nil)) (LiteralRT 75 (Integer_Literal 10) (nil) nil)) 
      (SeqRT 76
      (IfRT 77 (BinOpRT 78 Not_Equal (NameRT 79 (IdentifierRT 80 ((*I*) 19) (nil))) (LiteralRT 81 (Integer_Literal 14) (nil) nil) (nil) nil)
        (AssignRT 82 (IdentifierRT 83 ((*X*) 23) (nil)) (LiteralRT 84 (Integer_Literal 1) (nil) nil))
        (AssignRT 85 (IdentifierRT 86 ((*X*) 23) (nil)) (LiteralRT 87 (Integer_Literal 0) (nil) nil))
      ) 
      (SeqRT 88
      (WhileRT 89 (NameRT 90 (IndexedComponentRT 91 (IdentifierRT 92 ((*FT*) 22) (nil)) (NameRT 93 (IdentifierRT 94 ((*X*) 23) (nil))) (nil)))
        (AssignRT 95 (IdentifierRT 96 ((*I*) 19) (nil)) (BinOpRT 97 Plus (NameRT 98 (IdentifierRT 99 ((*I*) 19) (nil))) (LiteralRT 100 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
      ) 
      (SeqRT 101
      (IfRT 102 (BinOpRT 103 Not_Equal (NameRT 104 (IdentifierRT 105 ((*I*) 19) (nil))) (LiteralRT 106 (Integer_Literal 14) (nil) nil) (nil) nil)
        NullRT (* arguments of procedure call are unrecognized ! *)
        NullRT
      ) 
      (CallRT 109 110 ((*RESULT*) 7) 
        (nil)
      ))))))))))
  )
))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 23), (In_Out, (Integer_Type ((*Index*) 20)))) :: (((*FT*) 22), (In_Out, (Array_Type ((*ArrayT*) 21)))) :: (((*I*) 19), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*TIME_STAMP*) 16), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*LEGAL_FILE_NAME*) 15), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*FAILED*) 3), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*RESULT*) 7), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*SPECIAL_ACTION*) 5), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*TEST*) 2), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*NOT_APPLICABLE*) 4), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: (((*C55C02B*) 17), (0, (mkprocBodyDeclRT 20
  (* = = = Procedure Name = = = *)
  ((*C55C02B*) 17)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 21
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 22
(ObjDeclRT 24 (mkobjDeclRT 25 ((*I*) 19) Integer (Some ((LiteralRT 23 (Integer_Literal 0) (nil) nil))))) 
(SeqDeclRT 26
(TypeDeclRT 27 (IntegerTypeDeclRT 28 ((*Index*) 20) (RangeRT 0 1))) 
(SeqDeclRT 29
(TypeDeclRT 30 (ArrayTypeDeclRT 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) 
(SeqDeclRT 32
(ObjDeclRT 33 (mkobjDeclRT 34 ((*FT*) 22) (Array_Type ((*ArrayT*) 21)) None)) 
(ObjDeclRT 35 (mkobjDeclRT 36 ((*X*) 23) (Integer_Type ((*Index*) 20)) None))))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 37
    (AssignRT 38 (IndexedComponentRT 39 (IdentifierRT 40 ((*FT*) 22) (nil)) (LiteralRT 41 (Integer_Literal 0) (nil) nil) (nil)) (LiteralRT 42 (Boolean_Literal false) (nil) nil)) 
    (SeqRT 43
    (AssignRT 44 (IndexedComponentRT 45 (IdentifierRT 46 ((*FT*) 22) (nil)) (LiteralRT 47 (Integer_Literal 1) (nil) nil) (nil)) (LiteralRT 48 (Boolean_Literal true) (nil) nil)) 
    (SeqRT 49
    NullRT (* arguments of procedure call are unrecognized ! *) 
    (SeqRT 52
    (WhileRT 53 (BinOpRT 54 Not_Equal (NameRT 55 (IdentifierRT 56 ((*I*) 19) (nil))) (LiteralRT 57 (Integer_Literal 10) (nil) nil) (nil) nil)
      (AssignRT 58 (IdentifierRT 59 ((*I*) 19) (nil)) (BinOpRT 60 Plus (NameRT 61 (IdentifierRT 62 ((*I*) 19) (nil))) (LiteralRT 63 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
    ) 
    (SeqRT 64
    (IfRT 65 (BinOpRT 66 Not_Equal (NameRT 67 (IdentifierRT 68 ((*I*) 19) (nil))) (LiteralRT 69 (Integer_Literal 10) (nil) nil) (nil) nil)
      NullRT (* arguments of procedure call are unrecognized ! *)
      NullRT
    ) 
    (SeqRT 72
    (AssignRT 73 (IdentifierRT 74 ((*I*) 19) (nil)) (LiteralRT 75 (Integer_Literal 10) (nil) nil)) 
    (SeqRT 76
    (IfRT 77 (BinOpRT 78 Not_Equal (NameRT 79 (IdentifierRT 80 ((*I*) 19) (nil))) (LiteralRT 81 (Integer_Literal 14) (nil) nil) (nil) nil)
      (AssignRT 82 (IdentifierRT 83 ((*X*) 23) (nil)) (LiteralRT 84 (Integer_Literal 1) (nil) nil))
      (AssignRT 85 (IdentifierRT 86 ((*X*) 23) (nil)) (LiteralRT 87 (Integer_Literal 0) (nil) nil))
    ) 
    (SeqRT 88
    (WhileRT 89 (NameRT 90 (IndexedComponentRT 91 (IdentifierRT 92 ((*FT*) 22) (nil)) (NameRT 93 (IdentifierRT 94 ((*X*) 23) (nil))) (nil)))
      (AssignRT 95 (IdentifierRT 96 ((*I*) 19) (nil)) (BinOpRT 97 Plus (NameRT 98 (IdentifierRT 99 ((*I*) 19) (nil))) (LiteralRT 100 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
    ) 
    (SeqRT 101
    (IfRT 102 (BinOpRT 103 Not_Equal (NameRT 104 (IdentifierRT 105 ((*I*) 19) (nil))) (LiteralRT 106 (Integer_Literal 14) (nil) nil) (nil) nil)
      NullRT (* arguments of procedure call are unrecognized ! *)
      NullRT
    ) 
    (CallRT 109 110 ((*RESULT*) 7) 
      (nil)
    ))))))))))
))) :: (((*COMMENT*) 6), (0, (mkprocedure_bodyRT 0 0 nil D_Null_DeclarationRT S_NullRT))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*ArrayT*) 21), (ArrayTypeDeclRT 31 ((*ArrayT*) 21) ((*index subtype mark*) (Integer_Type ((*Index*) 20))) ((*component type*) Boolean))) :: (((*FILE_NUM*) 1), (SubtypeDeclRT 4 ((*FILE_NUM*) 1) Integer (RangeRT 1 5))) :: (((*Index*) 20), (IntegerTypeDeclRT 28 ((*Index*) 20) (RangeRT 0 1))) :: nil)
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

