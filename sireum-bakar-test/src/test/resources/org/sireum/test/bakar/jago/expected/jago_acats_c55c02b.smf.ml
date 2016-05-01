

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (SubtypeDecl (4, ((*FILE_NUM*) 1), Integer, (Range (1, 5)))))),
(SeqDecl (5,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (6,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (7,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (8,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (9,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (10,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (11,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (12,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (13,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (14,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (15,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (16,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (17,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (18,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))))))))))))))))))))))))))))))),
(ProcBodyDecl (19, 
  mkprocBodyDecl (
   20,
    (* = = = Procedure Name = = = *)
    ((*C55C02B*) 17),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (21,
  NullDecl (* Undefined Declarations ! *),
  (SeqDecl (22,
  (ObjDecl (24, { declaration_astnum = 25; object_name = ((*I*) 19); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (23, (Integer_Literal 0) )))) })),
  (SeqDecl (26,
  (TypeDecl (27, (IntegerTypeDecl (28, ((*Index*) 20), (Range (0, 1)))))),
  (SeqDecl (29,
  (TypeDecl (30, (ArrayTypeDecl (31, ((*ArrayT*) 21), ((*index subtype mark*) (Integer_Type ((*Index*) 20))), ((*component type*) Boolean))))),
  (SeqDecl (32,
  (ObjDecl (33, { declaration_astnum = 34; object_name = ((*FT*) 22); object_nominal_subtype = (Array_Type ((*ArrayT*) 21)); initialization_exp = None })),
  (ObjDecl (35, { declaration_astnum = 36; object_name = ((*X*) 23); object_nominal_subtype = (Integer_Type ((*Index*) 20)); initialization_exp = None }))))))))))))],
    (* = = = Procedure Body = = = *)
    (Seq (37,
    (Assign (38, (IndexedComponent (39, (Identifier (40, ((*FT*) 22) )), (Literal (41, (Integer_Literal 0) )) )), (Literal (42, (Boolean_Literal false) )))),
    (Seq (43,
    (Assign (44, (IndexedComponent (45, (Identifier (46, ((*FT*) 22) )), (Literal (47, (Integer_Literal 1) )) )), (Literal (48, (Boolean_Literal true) )))),
    (Seq (49,
    Null (* arguments of procedure call are unrecognized ! *),
    (Seq (52,
    (While (53, (BinOp (54, Not_Equal, (Name (55, (Identifier (56, ((*I*) 19) )))), (Literal (57, (Integer_Literal 10) )) )),
      (Assign (58, (Identifier (59, ((*I*) 19) )), (BinOp (60, Plus, (Name (61, (Identifier (62, ((*I*) 19) )))), (Literal (63, (Integer_Literal 1) )) )))))
    ),
    (Seq (64,
    (If (65, (BinOp (66, Not_Equal, (Name (67, (Identifier (68, ((*I*) 19) )))), (Literal (69, (Integer_Literal 10) )) )),
      Null (* arguments of procedure call are unrecognized ! *),
      Null)
    ),
    (Seq (72,
    (Assign (73, (Identifier (74, ((*I*) 19) )), (Literal (75, (Integer_Literal 10) )))),
    (Seq (76,
    (If (77, (BinOp (78, Not_Equal, (Name (79, (Identifier (80, ((*I*) 19) )))), (Literal (81, (Integer_Literal 14) )) )),
      (Assign (82, (Identifier (83, ((*X*) 23) )), (Literal (84, (Integer_Literal 1) )))),
      (Assign (85, (Identifier (86, ((*X*) 23) )), (Literal (87, (Integer_Literal 0) )))))
    ),
    (Seq (88,
    (While (89, (Name (90, (IndexedComponent (91, (Identifier (92, ((*FT*) 22) )), (Name (93, (Identifier (94, ((*X*) 23) )))) )))),
      (Assign (95, (Identifier (96, ((*I*) 19) )), (BinOp (97, Plus, (Name (98, (Identifier (99, ((*I*) 19) )))), (Literal (100, (Integer_Literal 1) )) )))))
    ),
    (Seq (101,
    (If (102, (BinOp (103, Not_Equal, (Name (104, (Identifier (105, ((*I*) 19) )))), (Literal (106, (Integer_Literal 14) )) )),
      Null (* arguments of procedure call are unrecognized ! *),
      Null)
    ),
    (Call (109, 110, ((*RESULT*) 7), 
      [])
    )))))))))))))))))))
  ))
)));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 23), (In_Out, (Integer_Type ((*Index*) 20)))); (((*FT*) 22), (In_Out, (Array_Type ((*ArrayT*) 21)))); (((*I*) 19), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*TIME_STAMP*) 16), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*LEGAL_FILE_NAME*) 15), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*FAILED*) 3), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*RESULT*) 7), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*SPECIAL_ACTION*) 5), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*TEST*) 2), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*NOT_APPLICABLE*) 4), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null))); (((*C55C02B*) 17), (0, mkprocBodyDecl (
 20,
  (* = = = Procedure Name = = = *)
  ((*C55C02B*) 17),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (21,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (22,
(ObjDecl (24, { declaration_astnum = 25; object_name = ((*I*) 19); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (23, (Integer_Literal 0) )))) })),
(SeqDecl (26,
(TypeDecl (27, (IntegerTypeDecl (28, ((*Index*) 20), (Range (0, 1)))))),
(SeqDecl (29,
(TypeDecl (30, (ArrayTypeDecl (31, ((*ArrayT*) 21), ((*index subtype mark*) (Integer_Type ((*Index*) 20))), ((*component type*) Boolean))))),
(SeqDecl (32,
(ObjDecl (33, { declaration_astnum = 34; object_name = ((*FT*) 22); object_nominal_subtype = (Array_Type ((*ArrayT*) 21)); initialization_exp = None })),
(ObjDecl (35, { declaration_astnum = 36; object_name = ((*X*) 23); object_nominal_subtype = (Integer_Type ((*Index*) 20)); initialization_exp = None }))))))))))))],
  (* = = = Procedure Body = = = *)
  (Seq (37,
  (Assign (38, (IndexedComponent (39, (Identifier (40, ((*FT*) 22) )), (Literal (41, (Integer_Literal 0) )) )), (Literal (42, (Boolean_Literal false) )))),
  (Seq (43,
  (Assign (44, (IndexedComponent (45, (Identifier (46, ((*FT*) 22) )), (Literal (47, (Integer_Literal 1) )) )), (Literal (48, (Boolean_Literal true) )))),
  (Seq (49,
  Null (* arguments of procedure call are unrecognized ! *),
  (Seq (52,
  (While (53, (BinOp (54, Not_Equal, (Name (55, (Identifier (56, ((*I*) 19) )))), (Literal (57, (Integer_Literal 10) )) )),
    (Assign (58, (Identifier (59, ((*I*) 19) )), (BinOp (60, Plus, (Name (61, (Identifier (62, ((*I*) 19) )))), (Literal (63, (Integer_Literal 1) )) )))))
  ),
  (Seq (64,
  (If (65, (BinOp (66, Not_Equal, (Name (67, (Identifier (68, ((*I*) 19) )))), (Literal (69, (Integer_Literal 10) )) )),
    Null (* arguments of procedure call are unrecognized ! *),
    Null)
  ),
  (Seq (72,
  (Assign (73, (Identifier (74, ((*I*) 19) )), (Literal (75, (Integer_Literal 10) )))),
  (Seq (76,
  (If (77, (BinOp (78, Not_Equal, (Name (79, (Identifier (80, ((*I*) 19) )))), (Literal (81, (Integer_Literal 14) )) )),
    (Assign (82, (Identifier (83, ((*X*) 23) )), (Literal (84, (Integer_Literal 1) )))),
    (Assign (85, (Identifier (86, ((*X*) 23) )), (Literal (87, (Integer_Literal 0) )))))
  ),
  (Seq (88,
  (While (89, (Name (90, (IndexedComponent (91, (Identifier (92, ((*FT*) 22) )), (Name (93, (Identifier (94, ((*X*) 23) )))) )))),
    (Assign (95, (Identifier (96, ((*I*) 19) )), (BinOp (97, Plus, (Name (98, (Identifier (99, ((*I*) 19) )))), (Literal (100, (Integer_Literal 1) )) )))))
  ),
  (Seq (101,
  (If (102, (BinOp (103, Not_Equal, (Name (104, (Identifier (105, ((*I*) 19) )))), (Literal (106, (Integer_Literal 14) )) )),
    Null (* arguments of procedure call are unrecognized ! *),
    Null)
  ),
  (Call (109, 110, ((*RESULT*) 7), 
    [])
  )))))))))))))))))))
))); (((*COMMENT*) 6), (0, mkprocBodyDecl (0, 0, [], NullDecl, Null)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*ArrayT*) 21), (ArrayTypeDecl (31, ((*ArrayT*) 21), ((*index subtype mark*) (Integer_Type ((*Index*) 20))), ((*component type*) Boolean)))); (((*FILE_NUM*) 1), (SubtypeDecl (4, ((*FILE_NUM*) 1), Integer, (Range (1, 5))))); (((*Index*) 20), (IntegerTypeDecl (28, ((*Index*) 20), (Range (0, 1)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(92, (Array_Type ((*ArrayT*) 21))); (83, (Integer_Type ((*Index*) 20))); (104, Integer); (23, Integer); (86, (Integer_Type ((*Index*) 20))); (41, Integer); (59, Integer); (68, Integer); (62, Integer); (80, Integer); (98, Integer); (74, Integer); (56, Integer); (47, Integer); (106, Integer); (46, (Array_Type ((*ArrayT*) 21))); (100, Integer); (91, Boolean); (55, Integer); (94, (Integer_Type ((*Index*) 20))); (40, (Array_Type ((*ArrayT*) 21))); (67, Integer); (103, Boolean); (97, Integer); (79, Integer); (61, Integer); (87, Integer); (60, Integer); (96, Integer); (105, Integer); (69, Integer); (78, Boolean); (99, Integer); (90, Boolean); (54, Boolean); (45, Boolean); (63, Integer); (81, Integer); (84, Integer); (57, Integer); (48, Boolean); (93, (Integer_Type ((*Index*) 20))); (75, Integer); (39, Boolean); (66, Boolean); (42, Boolean)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(92, { line = (*Line*)66; col = (*Col*)12; endline = (*EndLine*)66; endcol = (*EndCol*)13 }); (83, { line = (*Line*)60; col = (*Col*)8; endline = (*EndLine*)60; endcol = (*EndCol*)8 }); (104, { line = (*Line*)69; col = (*Col*)9; endline = (*EndLine*)69; endcol = (*EndCol*)9 }); (23, { line = (*Line*)35; col = (*Col*)21; endline = (*EndLine*)35; endcol = (*EndCol*)21 }); (86, { line = (*Line*)62; col = (*Col*)8; endline = (*EndLine*)62; endcol = (*EndCol*)8 }); (41, { line = (*Line*)45; col = (*Col*)9; endline = (*EndLine*)45; endcol = (*EndCol*)9 }); (59, { line = (*Line*)51; col = (*Col*)11; endline = (*EndLine*)51; endcol = (*EndCol*)11 }); (68, { line = (*Line*)53; col = (*Col*)9; endline = (*EndLine*)53; endcol = (*EndCol*)9 }); (62, { line = (*Line*)51; col = (*Col*)16; endline = (*EndLine*)51; endcol = (*EndCol*)16 }); (80, { line = (*Line*)59; col = (*Col*)10; endline = (*EndLine*)59; endcol = (*EndCol*)10 }); (98, { line = (*Line*)67; col = (*Col*)16; endline = (*EndLine*)67; endcol = (*EndCol*)16 }); (74, { line = (*Line*)57; col = (*Col*)6; endline = (*EndLine*)57; endcol = (*EndCol*)6 }); (56, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)12 }); (47, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)9 }); (106, { line = (*Line*)69; col = (*Col*)14; endline = (*EndLine*)69; endcol = (*EndCol*)15 }); (46, { line = (*Line*)46; col = (*Col*)6; endline = (*EndLine*)46; endcol = (*EndCol*)7 }); (100, { line = (*Line*)67; col = (*Col*)20; endline = (*EndLine*)67; endcol = (*EndCol*)20 }); (91, { line = (*Line*)66; col = (*Col*)12; endline = (*EndLine*)66; endcol = (*EndCol*)17 }); (55, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)12 }); (94, { line = (*Line*)66; col = (*Col*)16; endline = (*EndLine*)66; endcol = (*EndCol*)16 }); (40, { line = (*Line*)45; col = (*Col*)6; endline = (*EndLine*)45; endcol = (*EndCol*)7 }); (67, { line = (*Line*)53; col = (*Col*)9; endline = (*EndLine*)53; endcol = (*EndCol*)9 }); (103, { line = (*Line*)69; col = (*Col*)9; endline = (*EndLine*)69; endcol = (*EndCol*)15 }); (97, { line = (*Line*)67; col = (*Col*)16; endline = (*EndLine*)67; endcol = (*EndCol*)20 }); (79, { line = (*Line*)59; col = (*Col*)10; endline = (*EndLine*)59; endcol = (*EndCol*)10 }); (61, { line = (*Line*)51; col = (*Col*)16; endline = (*EndLine*)51; endcol = (*EndCol*)16 }); (87, { line = (*Line*)62; col = (*Col*)13; endline = (*EndLine*)62; endcol = (*EndCol*)13 }); (60, { line = (*Line*)51; col = (*Col*)16; endline = (*EndLine*)51; endcol = (*EndCol*)20 }); (96, { line = (*Line*)67; col = (*Col*)11; endline = (*EndLine*)67; endcol = (*EndCol*)11 }); (105, { line = (*Line*)69; col = (*Col*)9; endline = (*EndLine*)69; endcol = (*EndCol*)9 }); (69, { line = (*Line*)53; col = (*Col*)14; endline = (*EndLine*)53; endcol = (*EndCol*)15 }); (78, { line = (*Line*)59; col = (*Col*)10; endline = (*EndLine*)59; endcol = (*EndCol*)16 }); (99, { line = (*Line*)67; col = (*Col*)16; endline = (*EndLine*)67; endcol = (*EndCol*)16 }); (90, { line = (*Line*)66; col = (*Col*)12; endline = (*EndLine*)66; endcol = (*EndCol*)17 }); (54, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)18 }); (45, { line = (*Line*)46; col = (*Col*)6; endline = (*EndLine*)46; endcol = (*EndCol*)10 }); (63, { line = (*Line*)51; col = (*Col*)20; endline = (*EndLine*)51; endcol = (*EndCol*)20 }); (81, { line = (*Line*)59; col = (*Col*)15; endline = (*EndLine*)59; endcol = (*EndCol*)16 }); (84, { line = (*Line*)60; col = (*Col*)13; endline = (*EndLine*)60; endcol = (*EndCol*)13 }); (57, { line = (*Line*)50; col = (*Col*)17; endline = (*EndLine*)50; endcol = (*EndCol*)18 }); (48, { line = (*Line*)46; col = (*Col*)15; endline = (*EndLine*)46; endcol = (*EndCol*)18 }); (93, { line = (*Line*)66; col = (*Col*)16; endline = (*EndLine*)66; endcol = (*EndCol*)16 }); (75, { line = (*Line*)57; col = (*Col*)11; endline = (*EndLine*)57; endcol = (*EndCol*)12 }); (39, { line = (*Line*)45; col = (*Col*)6; endline = (*EndLine*)45; endcol = (*EndCol*)10 }); (66, { line = (*Line*)53; col = (*Col*)9; endline = (*EndLine*)53; endcol = (*EndCol*)15 }); (42, { line = (*Line*)45; col = (*Col*)15; endline = (*EndLine*)45; endcol = (*EndCol*)19 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(23, ("X", "ada://variable/C55C02B+31:11/X+42:6")); (22, ("FT", "ada://variable/C55C02B+31:11/FT+41:6")); (19, ("I", "ada://variable/C55C02B+31:11/I+35:6"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(17, ("C55C02B", "ada://procedure_body/C55C02B+31:11")); (8, ("IDENT_INT", "ada://expression_function/ACATS_REPORT-47:9/IDENT_INT-112:15")); (11, ("IDENT_BOOL", "ada://expression_function/ACATS_REPORT-47:9/IDENT_BOOL-129:15")); (2, ("TEST", "ada://procedure/ACATS_REPORT-47:9/TEST-53:16")); (5, ("SPECIAL_ACTION", "ada://procedure/ACATS_REPORT-47:9/SPECIAL_ACTION-85:16")); (14, ("EQUAL", "ada://expression_function/ACATS_REPORT-47:9/EQUAL-144:15")); (4, ("NOT_APPLICABLE", "ada://procedure/ACATS_REPORT-47:9/NOT_APPLICABLE-75:16")); (13, ("IDENT_WIDE_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_STR-139:15")); (16, ("TIME_STAMP", "ada://function/ACATS_REPORT-47:9/TIME_STAMP-159:15")); (7, ("RESULT", "ada://procedure/ACATS_REPORT-47:9/RESULT-99:16")); (10, ("IDENT_WIDE_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_CHAR-123:15")); (9, ("IDENT_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_CHAR-117:15")); (3, ("FAILED", "ada://procedure/ACATS_REPORT-47:9/FAILED-65:16")); (12, ("IDENT_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_STR-134:15")); (15, ("LEGAL_FILE_NAME", "ada://function/ACATS_REPORT-47:9/LEGAL_FILE_NAME-152:15")); (6, ("COMMENT", "ada://procedure/ACATS_REPORT-47:9/COMMENT-94:16"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(20, ("Index", "ada://ordinary_type/C55C02B+31:11/Index+39:11")); (1, ("FILE_NUM", "ada://subtype/ACATS_REPORT-47:9/FILE_NUM-49:14")); (21, ("ArrayT", "ada://ordinary_type/C55C02B+31:11/ArrayT+40:11"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (SubtypeDeclRT (4, ((*FILE_NUM*) 1), Integer, (RangeRT (1, 5)))))),
(SeqDeclRT (5,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (6,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (7,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (8,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (9,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (10,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (11,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (12,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (13,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (14,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (15,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (16,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (17,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (18,
NullDeclRT (* Undefined Declarations ! *),
NullDeclRT (* Undefined Declarations ! *))))))))))))))))))))))))))))))),
(ProcBodyDeclRT (19, 
  mkprocBodyDeclRT (
   20,
    (* = = = Procedure Name = = = *)
    ((*C55C02B*) 17),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (21,
  NullDeclRT (* Undefined Declarations ! *),
  (SeqDeclRT (22,
  (ObjDeclRT (24, { declaration_astnumRT = 25; object_nameRT = ((*I*) 19); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (23, (Integer_Literal 0) , [], [])))) })),
  (SeqDeclRT (26,
  (TypeDeclRT (27, (IntegerTypeDeclRT (28, ((*Index*) 20), (RangeRT (0, 1)))))),
  (SeqDeclRT (29,
  (TypeDeclRT (30, (ArrayTypeDeclRT (31, ((*ArrayT*) 21), ((*index subtype mark*) (Integer_Type ((*Index*) 20))), ((*component type*) Boolean))))),
  (SeqDeclRT (32,
  (ObjDeclRT (33, { declaration_astnumRT = 34; object_nameRT = ((*FT*) 22); object_nominal_subtypeRT = (Array_Type ((*ArrayT*) 21)); initialization_expRT = None })),
  (ObjDeclRT (35, { declaration_astnumRT = 36; object_nameRT = ((*X*) 23); object_nominal_subtypeRT = (Integer_Type ((*Index*) 20)); initialization_expRT = None }))))))))))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (37,
    (AssignRT (38, (IndexedComponentRT (39, (IdentifierRT (40, ((*FT*) 22) , [])), (LiteralRT (41, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (42, (Boolean_Literal false) , [], [])))),
    (SeqRT (43,
    (AssignRT (44, (IndexedComponentRT (45, (IdentifierRT (46, ((*FT*) 22) , [])), (LiteralRT (47, (Integer_Literal 1) , [], [])) , [])), (LiteralRT (48, (Boolean_Literal true) , [], [])))),
    (SeqRT (49,
    NullRT (* arguments of procedure call are unrecognized ! *),
    (SeqRT (52,
    (WhileRT (53, (BinOpRT (54, Not_Equal, (NameRT (55, (IdentifierRT (56, ((*I*) 19) , [])))), (LiteralRT (57, (Integer_Literal 10) , [], [])) , [], [])),
      (AssignRT (58, (IdentifierRT (59, ((*I*) 19) , [])), (BinOpRT (60, Plus, (NameRT (61, (IdentifierRT (62, ((*I*) 19) , [])))), (LiteralRT (63, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ),
    (SeqRT (64,
    (IfRT (65, (BinOpRT (66, Not_Equal, (NameRT (67, (IdentifierRT (68, ((*I*) 19) , [])))), (LiteralRT (69, (Integer_Literal 10) , [], [])) , [], [])),
      NullRT (* arguments of procedure call are unrecognized ! *),
      NullRT)
    ),
    (SeqRT (72,
    (AssignRT (73, (IdentifierRT (74, ((*I*) 19) , [])), (LiteralRT (75, (Integer_Literal 10) , [], [])))),
    (SeqRT (76,
    (IfRT (77, (BinOpRT (78, Not_Equal, (NameRT (79, (IdentifierRT (80, ((*I*) 19) , [])))), (LiteralRT (81, (Integer_Literal 14) , [], [])) , [], [])),
      (AssignRT (82, (IdentifierRT (83, ((*X*) 23) , [])), (LiteralRT (84, (Integer_Literal 1) , [], [])))),
      (AssignRT (85, (IdentifierRT (86, ((*X*) 23) , [])), (LiteralRT (87, (Integer_Literal 0) , [], [])))))
    ),
    (SeqRT (88,
    (WhileRT (89, (NameRT (90, (IndexedComponentRT (91, (IdentifierRT (92, ((*FT*) 22) , [])), (NameRT (93, (IdentifierRT (94, ((*X*) 23) , [])))) , [])))),
      (AssignRT (95, (IdentifierRT (96, ((*I*) 19) , [])), (BinOpRT (97, Plus, (NameRT (98, (IdentifierRT (99, ((*I*) 19) , [])))), (LiteralRT (100, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ),
    (SeqRT (101,
    (IfRT (102, (BinOpRT (103, Not_Equal, (NameRT (104, (IdentifierRT (105, ((*I*) 19) , [])))), (LiteralRT (106, (Integer_Literal 14) , [], [])) , [], [])),
      NullRT (* arguments of procedure call are unrecognized ! *),
      NullRT)
    ),
    (CallRT (109, 110, ((*RESULT*) 7), 
      [])
    )))))))))))))))))))
  ))
)));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 23), (In_Out, (Integer_Type ((*Index*) 20)))); (((*FT*) 22), (In_Out, (Array_Type ((*ArrayT*) 21)))); (((*I*) 19), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*TIME_STAMP*) 16), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*LEGAL_FILE_NAME*) 15), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*FAILED*) 3), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*RESULT*) 7), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*SPECIAL_ACTION*) 5), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*TEST*) 2), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*NOT_APPLICABLE*) 4), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT))); (((*C55C02B*) 17), (0, mkprocBodyDeclRT (
 20,
  (* = = = Procedure Name = = = *)
  ((*C55C02B*) 17),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (21,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (22,
(ObjDeclRT (24, { declaration_astnumRT = 25; object_nameRT = ((*I*) 19); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (23, (Integer_Literal 0) , [], [])))) })),
(SeqDeclRT (26,
(TypeDeclRT (27, (IntegerTypeDeclRT (28, ((*Index*) 20), (RangeRT (0, 1)))))),
(SeqDeclRT (29,
(TypeDeclRT (30, (ArrayTypeDeclRT (31, ((*ArrayT*) 21), ((*index subtype mark*) (Integer_Type ((*Index*) 20))), ((*component type*) Boolean))))),
(SeqDeclRT (32,
(ObjDeclRT (33, { declaration_astnumRT = 34; object_nameRT = ((*FT*) 22); object_nominal_subtypeRT = (Array_Type ((*ArrayT*) 21)); initialization_expRT = None })),
(ObjDeclRT (35, { declaration_astnumRT = 36; object_nameRT = ((*X*) 23); object_nominal_subtypeRT = (Integer_Type ((*Index*) 20)); initialization_expRT = None }))))))))))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (37,
  (AssignRT (38, (IndexedComponentRT (39, (IdentifierRT (40, ((*FT*) 22) , [])), (LiteralRT (41, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (42, (Boolean_Literal false) , [], [])))),
  (SeqRT (43,
  (AssignRT (44, (IndexedComponentRT (45, (IdentifierRT (46, ((*FT*) 22) , [])), (LiteralRT (47, (Integer_Literal 1) , [], [])) , [])), (LiteralRT (48, (Boolean_Literal true) , [], [])))),
  (SeqRT (49,
  NullRT (* arguments of procedure call are unrecognized ! *),
  (SeqRT (52,
  (WhileRT (53, (BinOpRT (54, Not_Equal, (NameRT (55, (IdentifierRT (56, ((*I*) 19) , [])))), (LiteralRT (57, (Integer_Literal 10) , [], [])) , [], [])),
    (AssignRT (58, (IdentifierRT (59, ((*I*) 19) , [])), (BinOpRT (60, Plus, (NameRT (61, (IdentifierRT (62, ((*I*) 19) , [])))), (LiteralRT (63, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
  ),
  (SeqRT (64,
  (IfRT (65, (BinOpRT (66, Not_Equal, (NameRT (67, (IdentifierRT (68, ((*I*) 19) , [])))), (LiteralRT (69, (Integer_Literal 10) , [], [])) , [], [])),
    NullRT (* arguments of procedure call are unrecognized ! *),
    NullRT)
  ),
  (SeqRT (72,
  (AssignRT (73, (IdentifierRT (74, ((*I*) 19) , [])), (LiteralRT (75, (Integer_Literal 10) , [], [])))),
  (SeqRT (76,
  (IfRT (77, (BinOpRT (78, Not_Equal, (NameRT (79, (IdentifierRT (80, ((*I*) 19) , [])))), (LiteralRT (81, (Integer_Literal 14) , [], [])) , [], [])),
    (AssignRT (82, (IdentifierRT (83, ((*X*) 23) , [])), (LiteralRT (84, (Integer_Literal 1) , [], [])))),
    (AssignRT (85, (IdentifierRT (86, ((*X*) 23) , [])), (LiteralRT (87, (Integer_Literal 0) , [], [])))))
  ),
  (SeqRT (88,
  (WhileRT (89, (NameRT (90, (IndexedComponentRT (91, (IdentifierRT (92, ((*FT*) 22) , [])), (NameRT (93, (IdentifierRT (94, ((*X*) 23) , [])))) , [])))),
    (AssignRT (95, (IdentifierRT (96, ((*I*) 19) , [])), (BinOpRT (97, Plus, (NameRT (98, (IdentifierRT (99, ((*I*) 19) , [])))), (LiteralRT (100, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
  ),
  (SeqRT (101,
  (IfRT (102, (BinOpRT (103, Not_Equal, (NameRT (104, (IdentifierRT (105, ((*I*) 19) , [])))), (LiteralRT (106, (Integer_Literal 14) , [], [])) , [], [])),
    NullRT (* arguments of procedure call are unrecognized ! *),
    NullRT)
  ),
  (CallRT (109, 110, ((*RESULT*) 7), 
    [])
  )))))))))))))))))))
))); (((*COMMENT*) 6), (0, mkprocBodyDeclRT (0, 0, [], NullDeclRT, NullRT)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*ArrayT*) 21), (ArrayTypeDeclRT (31, ((*ArrayT*) 21), ((*index subtype mark*) (Integer_Type ((*Index*) 20))), ((*component type*) Boolean)))); (((*FILE_NUM*) 1), (SubtypeDeclRT (4, ((*FILE_NUM*) 1), Integer, (RangeRT (1, 5))))); (((*Index*) 20), (IntegerTypeDeclRT (28, ((*Index*) 20), (RangeRT (0, 1)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(92, (Array_Type ((*ArrayT*) 21))); (83, (Integer_Type ((*Index*) 20))); (104, Integer); (23, Integer); (86, (Integer_Type ((*Index*) 20))); (41, Integer); (59, Integer); (68, Integer); (62, Integer); (80, Integer); (98, Integer); (74, Integer); (56, Integer); (47, Integer); (106, Integer); (46, (Array_Type ((*ArrayT*) 21))); (100, Integer); (91, Boolean); (55, Integer); (94, (Integer_Type ((*Index*) 20))); (40, (Array_Type ((*ArrayT*) 21))); (67, Integer); (103, Boolean); (97, Integer); (79, Integer); (61, Integer); (87, Integer); (60, Integer); (96, Integer); (105, Integer); (69, Integer); (78, Boolean); (99, Integer); (90, Boolean); (54, Boolean); (45, Boolean); (63, Integer); (81, Integer); (84, Integer); (57, Integer); (48, Boolean); (93, (Integer_Type ((*Index*) 20))); (75, Integer); (39, Boolean); (66, Boolean); (42, Boolean)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(92, { line = (*Line*)66; col = (*Col*)12; endline = (*EndLine*)66; endcol = (*EndCol*)13 }); (83, { line = (*Line*)60; col = (*Col*)8; endline = (*EndLine*)60; endcol = (*EndCol*)8 }); (104, { line = (*Line*)69; col = (*Col*)9; endline = (*EndLine*)69; endcol = (*EndCol*)9 }); (23, { line = (*Line*)35; col = (*Col*)21; endline = (*EndLine*)35; endcol = (*EndCol*)21 }); (86, { line = (*Line*)62; col = (*Col*)8; endline = (*EndLine*)62; endcol = (*EndCol*)8 }); (41, { line = (*Line*)45; col = (*Col*)9; endline = (*EndLine*)45; endcol = (*EndCol*)9 }); (59, { line = (*Line*)51; col = (*Col*)11; endline = (*EndLine*)51; endcol = (*EndCol*)11 }); (68, { line = (*Line*)53; col = (*Col*)9; endline = (*EndLine*)53; endcol = (*EndCol*)9 }); (62, { line = (*Line*)51; col = (*Col*)16; endline = (*EndLine*)51; endcol = (*EndCol*)16 }); (80, { line = (*Line*)59; col = (*Col*)10; endline = (*EndLine*)59; endcol = (*EndCol*)10 }); (98, { line = (*Line*)67; col = (*Col*)16; endline = (*EndLine*)67; endcol = (*EndCol*)16 }); (74, { line = (*Line*)57; col = (*Col*)6; endline = (*EndLine*)57; endcol = (*EndCol*)6 }); (56, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)12 }); (47, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)9 }); (106, { line = (*Line*)69; col = (*Col*)14; endline = (*EndLine*)69; endcol = (*EndCol*)15 }); (46, { line = (*Line*)46; col = (*Col*)6; endline = (*EndLine*)46; endcol = (*EndCol*)7 }); (100, { line = (*Line*)67; col = (*Col*)20; endline = (*EndLine*)67; endcol = (*EndCol*)20 }); (91, { line = (*Line*)66; col = (*Col*)12; endline = (*EndLine*)66; endcol = (*EndCol*)17 }); (55, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)12 }); (94, { line = (*Line*)66; col = (*Col*)16; endline = (*EndLine*)66; endcol = (*EndCol*)16 }); (40, { line = (*Line*)45; col = (*Col*)6; endline = (*EndLine*)45; endcol = (*EndCol*)7 }); (67, { line = (*Line*)53; col = (*Col*)9; endline = (*EndLine*)53; endcol = (*EndCol*)9 }); (103, { line = (*Line*)69; col = (*Col*)9; endline = (*EndLine*)69; endcol = (*EndCol*)15 }); (97, { line = (*Line*)67; col = (*Col*)16; endline = (*EndLine*)67; endcol = (*EndCol*)20 }); (79, { line = (*Line*)59; col = (*Col*)10; endline = (*EndLine*)59; endcol = (*EndCol*)10 }); (61, { line = (*Line*)51; col = (*Col*)16; endline = (*EndLine*)51; endcol = (*EndCol*)16 }); (87, { line = (*Line*)62; col = (*Col*)13; endline = (*EndLine*)62; endcol = (*EndCol*)13 }); (60, { line = (*Line*)51; col = (*Col*)16; endline = (*EndLine*)51; endcol = (*EndCol*)20 }); (96, { line = (*Line*)67; col = (*Col*)11; endline = (*EndLine*)67; endcol = (*EndCol*)11 }); (105, { line = (*Line*)69; col = (*Col*)9; endline = (*EndLine*)69; endcol = (*EndCol*)9 }); (69, { line = (*Line*)53; col = (*Col*)14; endline = (*EndLine*)53; endcol = (*EndCol*)15 }); (78, { line = (*Line*)59; col = (*Col*)10; endline = (*EndLine*)59; endcol = (*EndCol*)16 }); (99, { line = (*Line*)67; col = (*Col*)16; endline = (*EndLine*)67; endcol = (*EndCol*)16 }); (90, { line = (*Line*)66; col = (*Col*)12; endline = (*EndLine*)66; endcol = (*EndCol*)17 }); (54, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)18 }); (45, { line = (*Line*)46; col = (*Col*)6; endline = (*EndLine*)46; endcol = (*EndCol*)10 }); (63, { line = (*Line*)51; col = (*Col*)20; endline = (*EndLine*)51; endcol = (*EndCol*)20 }); (81, { line = (*Line*)59; col = (*Col*)15; endline = (*EndLine*)59; endcol = (*EndCol*)16 }); (84, { line = (*Line*)60; col = (*Col*)13; endline = (*EndLine*)60; endcol = (*EndCol*)13 }); (57, { line = (*Line*)50; col = (*Col*)17; endline = (*EndLine*)50; endcol = (*EndCol*)18 }); (48, { line = (*Line*)46; col = (*Col*)15; endline = (*EndLine*)46; endcol = (*EndCol*)18 }); (93, { line = (*Line*)66; col = (*Col*)16; endline = (*EndLine*)66; endcol = (*EndCol*)16 }); (75, { line = (*Line*)57; col = (*Col*)11; endline = (*EndLine*)57; endcol = (*EndCol*)12 }); (39, { line = (*Line*)45; col = (*Col*)6; endline = (*EndLine*)45; endcol = (*EndCol*)10 }); (66, { line = (*Line*)53; col = (*Col*)9; endline = (*EndLine*)53; endcol = (*EndCol*)15 }); (42, { line = (*Line*)45; col = (*Col*)15; endline = (*EndLine*)45; endcol = (*EndCol*)19 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(23, ("X", "ada://variable/C55C02B+31:11/X+42:6")); (22, ("FT", "ada://variable/C55C02B+31:11/FT+41:6")); (19, ("I", "ada://variable/C55C02B+31:11/I+35:6"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(17, ("C55C02B", "ada://procedure_body/C55C02B+31:11")); (8, ("IDENT_INT", "ada://expression_function/ACATS_REPORT-47:9/IDENT_INT-112:15")); (11, ("IDENT_BOOL", "ada://expression_function/ACATS_REPORT-47:9/IDENT_BOOL-129:15")); (2, ("TEST", "ada://procedure/ACATS_REPORT-47:9/TEST-53:16")); (5, ("SPECIAL_ACTION", "ada://procedure/ACATS_REPORT-47:9/SPECIAL_ACTION-85:16")); (14, ("EQUAL", "ada://expression_function/ACATS_REPORT-47:9/EQUAL-144:15")); (4, ("NOT_APPLICABLE", "ada://procedure/ACATS_REPORT-47:9/NOT_APPLICABLE-75:16")); (13, ("IDENT_WIDE_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_STR-139:15")); (16, ("TIME_STAMP", "ada://function/ACATS_REPORT-47:9/TIME_STAMP-159:15")); (7, ("RESULT", "ada://procedure/ACATS_REPORT-47:9/RESULT-99:16")); (10, ("IDENT_WIDE_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_CHAR-123:15")); (9, ("IDENT_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_CHAR-117:15")); (3, ("FAILED", "ada://procedure/ACATS_REPORT-47:9/FAILED-65:16")); (12, ("IDENT_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_STR-134:15")); (15, ("LEGAL_FILE_NAME", "ada://function/ACATS_REPORT-47:9/LEGAL_FILE_NAME-152:15")); (6, ("COMMENT", "ada://procedure/ACATS_REPORT-47:9/COMMENT-94:16"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(20, ("Index", "ada://ordinary_type/C55C02B+31:11/Index+39:11")); (1, ("FILE_NUM", "ada://subtype/ACATS_REPORT-47:9/FILE_NUM-49:14")); (21, ("ArrayT", "ada://ordinary_type/C55C02B+31:11/ArrayT+40:11"))]
})
}


