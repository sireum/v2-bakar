

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (RecordTypeDecl (4, ((*RecordT*) 1), [(((*X*) 2), Integer)])))),
(SeqDecl (6,
(TypeDecl (7, (SubtypeDecl (8, ((*I*) 3), Integer, (Range (0, 5)))))),
(SeqDecl (9,
(TypeDecl (10, (ArrayTypeDecl (11, ((*ArrayT*) 4), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer))))),
(SeqDecl (12,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))))))))),
(SeqDecl (13,
(TypeDecl (14, (RecordTypeDecl (15, ((*RecordT1*) 8), [(((*X*) 9), Integer)])))),
(SeqDecl (17,
(TypeDecl (18, (ArrayTypeDecl (19, ((*ArrayT1*) 10), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer))))),
(SeqDecl (20,
(ObjDecl (22, { declaration_astnum = 23; object_name = ((*W*) 12); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (21, (Integer_Literal 1) )))) })),
(SeqDecl (24,
(ObjDecl (26, { declaration_astnum = 27; object_name = ((*U*) 13); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (25, (Integer_Literal 1) )))) })),
(SeqDecl (28,
(ProcBodyDecl (29, 
  mkprocBodyDecl (
   30,
    (* = = = Procedure Name = = = *)
    ((*Increase*) 5),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 31; parameter_name = ((*X*) 14); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 32; parameter_name = ((*Y*) 15); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (33, (Identifier (34, ((*Y*) 15) )), (BinOp (35, Plus, (Name (36, (Identifier (37, ((*X*) 14) )))), (Literal (38, (Integer_Literal 1) )) ))))
  ))
),
(ProcBodyDecl (39, 
  mkprocBodyDecl (
   40,
    (* = = = Procedure Name = = = *)
    ((*Test*) 6),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 41; parameter_name = ((*N*) 17); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 42; parameter_name = ((*M*) 18); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDecl (43,
    (ObjDecl (44, { declaration_astnum = 45; object_name = ((*R*) 19); object_nominal_subtype = (Record_Type ((*RecordT*) 1)); initialization_exp = None })),
    (SeqDecl (46,
    (ObjDecl (47, { declaration_astnum = 48; object_name = ((*A*) 20); object_nominal_subtype = (Array_Type ((*ArrayT*) 4)); initialization_exp = None })),
    (SeqDecl (49,
    (ObjDecl (51, { declaration_astnum = 52; object_name = ((*Result*) 21); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (50, (Integer_Literal 1) )))) })),
    (SeqDecl (53,
    (ObjDecl (56, { declaration_astnum = 57; object_name = ((*T*) 22); object_nominal_subtype = Integer; initialization_exp = (Some ((Name (54, (Identifier (55, ((*Result*) 21) )))))) })),
    (SeqDecl (58,
    (ObjDecl (59, { declaration_astnum = 60; object_name = ((*T1*) 23); object_nominal_subtype = Integer; initialization_exp = None })),
    (ObjDecl (61, { declaration_astnum = 62; object_name = ((*T2*) 24); object_nominal_subtype = Integer; initialization_exp = None })))))))))))),
    (* = = = Procedure Body = = = *)
    (Seq (63,
    (Assign (64, (SelectedComponent (65, (Identifier (66, ((*R*) 19) )), ((*X*) 2) )), (BinOp (68, Plus, (BinOp (69, Plus, (Name (70, (Identifier (71, ((*W*) 12) )))), (Name (72, (Identifier (73, ((*U*) 13) )))) )), (Literal (74, (Integer_Literal 1) )) )))),
    (Seq (75,
    (Assign (76, (IndexedComponent (77, (Identifier (78, ((*A*) 20) )), (Name (79, (Identifier (80, ((*N*) 17) )))) )), (Literal (81, (Integer_Literal 1) )))),
    (Seq (82,
    (Assign (83, (Identifier (84, ((*T1*) 23) )), (BinOp (85, Plus, (Name (86, (SelectedComponent (87, (Identifier (88, ((*R*) 19) )), ((*X*) 2) )))), (Name (90, (Identifier (91, ((*N*) 17) )))) )))),
    (Seq (92,
    (Assign (93, (Identifier (94, ((*T2*) 24) )), (BinOp (95, Plus, (Name (96, (IndexedComponent (97, (Identifier (98, ((*A*) 20) )), (Name (99, (Identifier (100, ((*T1*) 23) )))) )))), (Name (101, (Identifier (102, ((*T1*) 23) )))) )))),
    (Seq (103,
    (Assign (104, (Identifier (105, ((*T*) 22) )), (Name (106, (Identifier (107, ((*T2*) 24) )))))),
    (Seq (108,
    (Call (109, 110, ((*Increase*) 5), 
      [(Name (111, (Identifier (112, ((*T2*) 24) )))); (Name (113, (Identifier (114, ((*T*) 22) ))))])
    ),
    (Seq (115,
    (If (116, (BinOp (117, Greater_Than, (Name (118, (Identifier (119, ((*T*) 22) )))), (Literal (120, (Integer_Literal 0) )) )),
      (Assign (121, (Identifier (122, ((*T*) 22) )), (BinOp (123, Plus, (Name (124, (Identifier (125, ((*T*) 22) )))), (Literal (126, (Integer_Literal 1) )) )))),
      Null)
    ),
    (Seq (127,
    (If (128, (BinOp (129, Greater_Than, (Name (130, (Identifier (131, ((*T*) 22) )))), (Literal (132, (Integer_Literal 1) )) )),
      (Assign (133, (Identifier (134, ((*T*) 22) )), (BinOp (135, Plus, (Name (136, (Identifier (137, ((*T*) 22) )))), (Literal (138, (Integer_Literal 2) )) )))),
      (Assign (139, (Identifier (140, ((*T*) 22) )), (BinOp (141, Minus, (Name (142, (Identifier (143, ((*T*) 22) )))), (Literal (144, (Integer_Literal 1) )) )))))
    ),
    (Seq (145,
    (While (146, (BinOp (147, Greater_Than, (Name (148, (Identifier (149, ((*T*) 22) )))), (Literal (150, (Integer_Literal 0) )) )),
      (Seq (151,
      (Assign (152, (Identifier (153, ((*Result*) 21) )), (BinOp (154, Divide, (BinOp (155, Multiply, (Name (156, (Identifier (157, ((*Result*) 21) )))), (Name (158, (Identifier (159, ((*T*) 22) )))) )), (Name (160, (Identifier (161, ((*N*) 17) )))) )))),
      (Assign (162, (Identifier (163, ((*T*) 22) )), (BinOp (164, Minus, (Name (165, (Identifier (166, ((*T*) 22) )))), (Literal (167, (Integer_Literal 1) )) )))))))
    ),
    (Assign (168, (Identifier (169, ((*M*) 18) )), (Name (170, (Identifier (171, ((*Result*) 21) ))))))))))))))))))))))))
  ))
)))))))))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*A*) 20), (In_Out, (Array_Type ((*ArrayT*) 4)))); (((*X*) 14), (In, Integer)); (((*W*) 12), (In_Out, Integer)); (((*T1*) 23), (In_Out, Integer)); (((*U*) 13), (In_Out, Integer)); (((*Y*) 15), (Out, Integer)); (((*Result*) 21), (In_Out, Integer)); (((*T2*) 24), (In_Out, Integer)); (((*T*) 22), (In_Out, Integer)); (((*M*) 18), (Out, Integer)); (((*N*) 17), (In, Integer)); (((*R*) 19), (In_Out, (Record_Type ((*RecordT*) 1))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test*) 6), (0, mkprocBodyDecl (
 40,
  (* = = = Procedure Name = = = *)
  ((*Test*) 6),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 41; parameter_name = ((*N*) 17); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 42; parameter_name = ((*M*) 18); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDecl (43,
  (ObjDecl (44, { declaration_astnum = 45; object_name = ((*R*) 19); object_nominal_subtype = (Record_Type ((*RecordT*) 1)); initialization_exp = None })),
  (SeqDecl (46,
  (ObjDecl (47, { declaration_astnum = 48; object_name = ((*A*) 20); object_nominal_subtype = (Array_Type ((*ArrayT*) 4)); initialization_exp = None })),
  (SeqDecl (49,
  (ObjDecl (51, { declaration_astnum = 52; object_name = ((*Result*) 21); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (50, (Integer_Literal 1) )))) })),
  (SeqDecl (53,
  (ObjDecl (56, { declaration_astnum = 57; object_name = ((*T*) 22); object_nominal_subtype = Integer; initialization_exp = (Some ((Name (54, (Identifier (55, ((*Result*) 21) )))))) })),
  (SeqDecl (58,
  (ObjDecl (59, { declaration_astnum = 60; object_name = ((*T1*) 23); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (61, { declaration_astnum = 62; object_name = ((*T2*) 24); object_nominal_subtype = Integer; initialization_exp = None })))))))))))),
  (* = = = Procedure Body = = = *)
  (Seq (63,
  (Assign (64, (SelectedComponent (65, (Identifier (66, ((*R*) 19) )), ((*X*) 2) )), (BinOp (68, Plus, (BinOp (69, Plus, (Name (70, (Identifier (71, ((*W*) 12) )))), (Name (72, (Identifier (73, ((*U*) 13) )))) )), (Literal (74, (Integer_Literal 1) )) )))),
  (Seq (75,
  (Assign (76, (IndexedComponent (77, (Identifier (78, ((*A*) 20) )), (Name (79, (Identifier (80, ((*N*) 17) )))) )), (Literal (81, (Integer_Literal 1) )))),
  (Seq (82,
  (Assign (83, (Identifier (84, ((*T1*) 23) )), (BinOp (85, Plus, (Name (86, (SelectedComponent (87, (Identifier (88, ((*R*) 19) )), ((*X*) 2) )))), (Name (90, (Identifier (91, ((*N*) 17) )))) )))),
  (Seq (92,
  (Assign (93, (Identifier (94, ((*T2*) 24) )), (BinOp (95, Plus, (Name (96, (IndexedComponent (97, (Identifier (98, ((*A*) 20) )), (Name (99, (Identifier (100, ((*T1*) 23) )))) )))), (Name (101, (Identifier (102, ((*T1*) 23) )))) )))),
  (Seq (103,
  (Assign (104, (Identifier (105, ((*T*) 22) )), (Name (106, (Identifier (107, ((*T2*) 24) )))))),
  (Seq (108,
  (Call (109, 110, ((*Increase*) 5), 
    [(Name (111, (Identifier (112, ((*T2*) 24) )))); (Name (113, (Identifier (114, ((*T*) 22) ))))])
  ),
  (Seq (115,
  (If (116, (BinOp (117, Greater_Than, (Name (118, (Identifier (119, ((*T*) 22) )))), (Literal (120, (Integer_Literal 0) )) )),
    (Assign (121, (Identifier (122, ((*T*) 22) )), (BinOp (123, Plus, (Name (124, (Identifier (125, ((*T*) 22) )))), (Literal (126, (Integer_Literal 1) )) )))),
    Null)
  ),
  (Seq (127,
  (If (128, (BinOp (129, Greater_Than, (Name (130, (Identifier (131, ((*T*) 22) )))), (Literal (132, (Integer_Literal 1) )) )),
    (Assign (133, (Identifier (134, ((*T*) 22) )), (BinOp (135, Plus, (Name (136, (Identifier (137, ((*T*) 22) )))), (Literal (138, (Integer_Literal 2) )) )))),
    (Assign (139, (Identifier (140, ((*T*) 22) )), (BinOp (141, Minus, (Name (142, (Identifier (143, ((*T*) 22) )))), (Literal (144, (Integer_Literal 1) )) )))))
  ),
  (Seq (145,
  (While (146, (BinOp (147, Greater_Than, (Name (148, (Identifier (149, ((*T*) 22) )))), (Literal (150, (Integer_Literal 0) )) )),
    (Seq (151,
    (Assign (152, (Identifier (153, ((*Result*) 21) )), (BinOp (154, Divide, (BinOp (155, Multiply, (Name (156, (Identifier (157, ((*Result*) 21) )))), (Name (158, (Identifier (159, ((*T*) 22) )))) )), (Name (160, (Identifier (161, ((*N*) 17) )))) )))),
    (Assign (162, (Identifier (163, ((*T*) 22) )), (BinOp (164, Minus, (Name (165, (Identifier (166, ((*T*) 22) )))), (Literal (167, (Integer_Literal 1) )) )))))))
  ),
  (Assign (168, (Identifier (169, ((*M*) 18) )), (Name (170, (Identifier (171, ((*Result*) 21) ))))))))))))))))))))))))
))); (((*Increase*) 5), (0, mkprocBodyDecl (
 30,
  (* = = = Procedure Name = = = *)
  ((*Increase*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 31; parameter_name = ((*X*) 14); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 32; parameter_name = ((*Y*) 15); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (33, (Identifier (34, ((*Y*) 15) )), (BinOp (35, Plus, (Name (36, (Identifier (37, ((*X*) 14) )))), (Literal (38, (Integer_Literal 1) )) ))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*I*) 3), (SubtypeDecl (8, ((*I*) 3), Integer, (Range (0, 5))))); (((*RecordT*) 1), (RecordTypeDecl (4, ((*RecordT*) 1), [(((*X*) 2), Integer)]))); (((*ArrayT1*) 10), (ArrayTypeDecl (19, ((*ArrayT1*) 10), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer)))); (((*RecordT1*) 8), (RecordTypeDecl (15, ((*RecordT1*) 8), [(((*X*) 9), Integer)]))); (((*ArrayT*) 4), (ArrayTypeDecl (11, ((*ArrayT*) 4), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(137, Integer); (101, Integer); (164, Integer); (155, Integer); (119, Integer); (95, Integer); (131, Integer); (122, Integer); (167, Integer); (158, Integer); (77, Integer); (86, Integer); (140, Integer); (68, Integer); (50, Integer); (113, Integer); (149, Integer); (134, Integer); (35, Integer); (125, Integer); (80, Integer); (89, Integer); (71, Integer); (98, (Array_Type ((*ArrayT*) 4))); (107, Integer); (74, Integer); (38, Integer); (65, Integer); (166, Integer); (142, Integer); (124, Integer); (106, Integer); (169, Integer); (160, Integer); (163, Integer); (118, Integer); (136, Integer); (100, Integer); (91, Integer); (73, Integer); (55, Integer); (154, Integer); (67, Integer); (85, Integer); (94, Integer); (130, Integer); (157, Integer); (148, Integer); (112, Integer); (97, Integer); (79, Integer); (88, (Record_Type ((*RecordT*) 1))); (70, Integer); (25, Integer); (34, Integer); (37, Integer); (156, Integer); (147, Boolean); (129, Boolean); (138, Integer); (165, Integer); (120, Integer); (87, Integer); (96, Integer); (159, Integer); (150, Integer); (132, Integer); (141, Integer); (105, Integer); (123, Integer); (114, Integer); (78, (Array_Type ((*ArrayT*) 4))); (69, Integer); (90, Integer); (99, Integer); (54, Integer); (171, Integer); (153, Integer); (144, Integer); (126, Integer); (81, Integer); (72, Integer); (135, Integer); (36, Integer); (117, Boolean); (21, Integer); (84, Integer); (102, Integer); (111, Integer); (66, (Record_Type ((*RecordT*) 1))); (170, Integer); (143, Integer); (161, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(137, { line = (*Line*)40; col = (*Col*)15; endline = (*EndLine*)40; endcol = (*EndCol*)15 }); (101, { line = (*Line*)30; col = (*Col*)21; endline = (*EndLine*)30; endcol = (*EndCol*)22 }); (164, { line = (*Line*)47; col = (*Col*)15; endline = (*EndLine*)47; endcol = (*EndCol*)19 }); (155, { line = (*Line*)46; col = (*Col*)21; endline = (*EndLine*)46; endcol = (*EndCol*)30 }); (119, { line = (*Line*)35; col = (*Col*)10; endline = (*EndLine*)35; endcol = (*EndCol*)10 }); (95, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)22 }); (131, { line = (*Line*)39; col = (*Col*)10; endline = (*EndLine*)39; endcol = (*EndCol*)10 }); (122, { line = (*Line*)36; col = (*Col*)10; endline = (*EndLine*)36; endcol = (*EndCol*)10 }); (167, { line = (*Line*)47; col = (*Col*)19; endline = (*EndLine*)47; endcol = (*EndCol*)19 }); (158, { line = (*Line*)46; col = (*Col*)30; endline = (*EndLine*)46; endcol = (*EndCol*)30 }); (77, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)10 }); (86, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (140, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)10 }); (68, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)22 }); (50, { line = (*Line*)22; col = (*Col*)26; endline = (*EndLine*)22; endcol = (*EndCol*)26 }); (113, { line = (*Line*)33; col = (*Col*)20; endline = (*EndLine*)33; endcol = (*EndCol*)20 }); (149, { line = (*Line*)45; col = (*Col*)13; endline = (*EndLine*)45; endcol = (*EndCol*)13 }); (134, { line = (*Line*)40; col = (*Col*)10; endline = (*EndLine*)40; endcol = (*EndCol*)10 }); (35, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)16 }); (125, { line = (*Line*)36; col = (*Col*)15; endline = (*EndLine*)36; endcol = (*EndCol*)15 }); (80, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)9 }); (89, { line = (*Line*)29; col = (*Col*)15; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (71, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (98, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)13 }); (107, { line = (*Line*)31; col = (*Col*)12; endline = (*EndLine*)31; endcol = (*EndCol*)13 }); (74, { line = (*Line*)27; col = (*Col*)22; endline = (*EndLine*)27; endcol = (*EndCol*)22 }); (38, { line = (*Line*)14; col = (*Col*)16; endline = (*EndLine*)14; endcol = (*EndCol*)16 }); (65, { line = (*Line*)27; col = (*Col*)7; endline = (*EndLine*)27; endcol = (*EndCol*)9 }); (166, { line = (*Line*)47; col = (*Col*)15; endline = (*EndLine*)47; endcol = (*EndCol*)15 }); (142, { line = (*Line*)42; col = (*Col*)15; endline = (*EndLine*)42; endcol = (*EndCol*)15 }); (124, { line = (*Line*)36; col = (*Col*)15; endline = (*EndLine*)36; endcol = (*EndCol*)15 }); (106, { line = (*Line*)31; col = (*Col*)12; endline = (*EndLine*)31; endcol = (*EndCol*)13 }); (169, { line = (*Line*)50; col = (*Col*)7; endline = (*EndLine*)50; endcol = (*EndCol*)7 }); (160, { line = (*Line*)46; col = (*Col*)35; endline = (*EndLine*)46; endcol = (*EndCol*)35 }); (163, { line = (*Line*)47; col = (*Col*)10; endline = (*EndLine*)47; endcol = (*EndCol*)10 }); (118, { line = (*Line*)35; col = (*Col*)10; endline = (*EndLine*)35; endcol = (*EndCol*)10 }); (136, { line = (*Line*)40; col = (*Col*)15; endline = (*EndLine*)40; endcol = (*EndCol*)15 }); (100, { line = (*Line*)30; col = (*Col*)15; endline = (*EndLine*)30; endcol = (*EndCol*)16 }); (91, { line = (*Line*)29; col = (*Col*)19; endline = (*EndLine*)29; endcol = (*EndCol*)19 }); (73, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)18 }); (55, { line = (*Line*)23; col = (*Col*)21; endline = (*EndLine*)23; endcol = (*EndCol*)26 }); (154, { line = (*Line*)46; col = (*Col*)20; endline = (*EndLine*)46; endcol = (*EndCol*)35 }); (67, { line = (*Line*)27; col = (*Col*)9; endline = (*EndLine*)27; endcol = (*EndCol*)9 }); (85, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)19 }); (94, { line = (*Line*)30; col = (*Col*)7; endline = (*EndLine*)30; endcol = (*EndCol*)8 }); (130, { line = (*Line*)39; col = (*Col*)10; endline = (*EndLine*)39; endcol = (*EndCol*)10 }); (157, { line = (*Line*)46; col = (*Col*)21; endline = (*EndLine*)46; endcol = (*EndCol*)26 }); (148, { line = (*Line*)45; col = (*Col*)13; endline = (*EndLine*)45; endcol = (*EndCol*)13 }); (112, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)17 }); (97, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)17 }); (79, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)9 }); (88, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)13 }); (70, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (25, { line = (*Line*)10; col = (*Col*)18; endline = (*EndLine*)10; endcol = (*EndCol*)18 }); (34, { line = (*Line*)14; col = (*Col*)7; endline = (*EndLine*)14; endcol = (*EndCol*)7 }); (37, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (156, { line = (*Line*)46; col = (*Col*)21; endline = (*EndLine*)46; endcol = (*EndCol*)26 }); (147, { line = (*Line*)45; col = (*Col*)13; endline = (*EndLine*)45; endcol = (*EndCol*)17 }); (129, { line = (*Line*)39; col = (*Col*)10; endline = (*EndLine*)39; endcol = (*EndCol*)14 }); (138, { line = (*Line*)40; col = (*Col*)19; endline = (*EndLine*)40; endcol = (*EndCol*)19 }); (165, { line = (*Line*)47; col = (*Col*)15; endline = (*EndLine*)47; endcol = (*EndCol*)15 }); (120, { line = (*Line*)35; col = (*Col*)14; endline = (*EndLine*)35; endcol = (*EndCol*)14 }); (87, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (96, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)17 }); (159, { line = (*Line*)46; col = (*Col*)30; endline = (*EndLine*)46; endcol = (*EndCol*)30 }); (150, { line = (*Line*)45; col = (*Col*)17; endline = (*EndLine*)45; endcol = (*EndCol*)17 }); (132, { line = (*Line*)39; col = (*Col*)14; endline = (*EndLine*)39; endcol = (*EndCol*)14 }); (141, { line = (*Line*)42; col = (*Col*)15; endline = (*EndLine*)42; endcol = (*EndCol*)19 }); (105, { line = (*Line*)31; col = (*Col*)7; endline = (*EndLine*)31; endcol = (*EndCol*)7 }); (123, { line = (*Line*)36; col = (*Col*)15; endline = (*EndLine*)36; endcol = (*EndCol*)19 }); (114, { line = (*Line*)33; col = (*Col*)20; endline = (*EndLine*)33; endcol = (*EndCol*)20 }); (78, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (69, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)18 }); (90, { line = (*Line*)29; col = (*Col*)19; endline = (*EndLine*)29; endcol = (*EndCol*)19 }); (99, { line = (*Line*)30; col = (*Col*)15; endline = (*EndLine*)30; endcol = (*EndCol*)16 }); (54, { line = (*Line*)23; col = (*Col*)21; endline = (*EndLine*)23; endcol = (*EndCol*)26 }); (171, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)17 }); (153, { line = (*Line*)46; col = (*Col*)10; endline = (*EndLine*)46; endcol = (*EndCol*)15 }); (144, { line = (*Line*)42; col = (*Col*)19; endline = (*EndLine*)42; endcol = (*EndCol*)19 }); (126, { line = (*Line*)36; col = (*Col*)19; endline = (*EndLine*)36; endcol = (*EndCol*)19 }); (81, { line = (*Line*)28; col = (*Col*)15; endline = (*EndLine*)28; endcol = (*EndCol*)15 }); (72, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)18 }); (135, { line = (*Line*)40; col = (*Col*)15; endline = (*EndLine*)40; endcol = (*EndCol*)19 }); (36, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (117, { line = (*Line*)35; col = (*Col*)10; endline = (*EndLine*)35; endcol = (*EndCol*)14 }); (21, { line = (*Line*)9; col = (*Col*)18; endline = (*EndLine*)9; endcol = (*EndCol*)18 }); (84, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)8 }); (102, { line = (*Line*)30; col = (*Col*)21; endline = (*EndLine*)30; endcol = (*EndCol*)22 }); (111, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)17 }); (66, { line = (*Line*)27; col = (*Col*)7; endline = (*EndLine*)27; endcol = (*EndCol*)7 }); (170, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)17 }); (143, { line = (*Line*)42; col = (*Col*)15; endline = (*EndLine*)42; endcol = (*EndCol*)15 }); (161, { line = (*Line*)46; col = (*Col*)35; endline = (*EndLine*)46; endcol = (*EndCol*)35 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(23, ("T1", "ada://variable/Array_Record_Package-1:9/Test-12:14/T1+24:7")); (17, ("N", "ada://parameter/Array_Record_Package-1:9/Test-12:14/N-12:20")); (2, ("X", "ada://component/Array_Record_Package-1:9/RecordT-3:9/X-4:7")); (20, ("A", "ada://variable/Array_Record_Package-1:9/Test-12:14/A+20:7")); (14, ("X", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/X-10:23")); (13, ("U", "ada://variable/Array_Record_Package-1:9/U+10:4")); (22, ("T", "ada://variable/Array_Record_Package-1:9/Test-12:14/T+23:7")); (19, ("R", "ada://variable/Array_Record_Package-1:9/Test-12:14/R+19:7")); (9, ("X", "ada://component/Array_Record_Package-1:9/RecordT1+3:9/X+4:7")); (18, ("M", "ada://parameter/Array_Record_Package-1:9/Test-12:14/M-12:33")); (12, ("W", "ada://variable/Array_Record_Package-1:9/W+9:4")); (21, ("Result", "ada://variable/Array_Record_Package-1:9/Test-12:14/Result+22:7")); (24, ("T2", "ada://variable/Array_Record_Package-1:9/Test-12:14/T2+25:7")); (15, ("Y", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/Y-10:35"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Increase", "ada://procedure/Array_Record_Package-1:9/Increase-10:14")); (6, ("Test", "ada://procedure_body/Array_Record_Package-1:9/Test-12:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(7, ("Array_Record_Package", "ada://package_body/Array_Record_Package-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(8, ("RecordT1", "ada://ordinary_type/Array_Record_Package-1:9/RecordT1+3:9")); (4, ("ArrayT", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT-8:9")); (10, ("ArrayT1", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT1+7:9")); (1, ("RecordT", "ada://ordinary_type/Array_Record_Package-1:9/RecordT-3:9")); (3, ("I", "ada://subtype/Array_Record_Package-1:9/I-7:12"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (RecordTypeDeclRT (4, ((*RecordT*) 1), [(((*X*) 2), Integer)])))),
(SeqDeclRT (6,
(TypeDeclRT (7, (SubtypeDeclRT (8, ((*I*) 3), Integer, (RangeRT (0, 5)))))),
(SeqDeclRT (9,
(TypeDeclRT (10, (ArrayTypeDeclRT (11, ((*ArrayT*) 4), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer))))),
(SeqDeclRT (12,
NullDeclRT (* Undefined Declarations ! *),
NullDeclRT (* Undefined Declarations ! *))))))))),
(SeqDeclRT (13,
(TypeDeclRT (14, (RecordTypeDeclRT (15, ((*RecordT1*) 8), [(((*X*) 9), Integer)])))),
(SeqDeclRT (17,
(TypeDeclRT (18, (ArrayTypeDeclRT (19, ((*ArrayT1*) 10), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer))))),
(SeqDeclRT (20,
(ObjDeclRT (22, { declaration_astnumRT = 23; object_nameRT = ((*W*) 12); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (21, (Integer_Literal 1) , [], [])))) })),
(SeqDeclRT (24,
(ObjDeclRT (26, { declaration_astnumRT = 27; object_nameRT = ((*U*) 13); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (25, (Integer_Literal 1) , [], [])))) })),
(SeqDeclRT (28,
(ProcBodyDeclRT (29, 
  mkprocBodyDeclRT (
   30,
    (* = = = Procedure Name = = = *)
    ((*Increase*) 5),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 31; parameter_nameRT = ((*X*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 32; parameter_nameRT = ((*Y*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (33, (IdentifierRT (34, ((*Y*) 15) , [])), (BinOpRT (35, Plus, (NameRT (36, (IdentifierRT (37, ((*X*) 14) , [])))), (LiteralRT (38, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
  ))
),
(ProcBodyDeclRT (39, 
  mkprocBodyDeclRT (
   40,
    (* = = = Procedure Name = = = *)
    ((*Test*) 6),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 41; parameter_nameRT = ((*N*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 42; parameter_nameRT = ((*M*) 18); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (43,
    (ObjDeclRT (44, { declaration_astnumRT = 45; object_nameRT = ((*R*) 19); object_nominal_subtypeRT = (Record_Type ((*RecordT*) 1)); initialization_expRT = None })),
    (SeqDeclRT (46,
    (ObjDeclRT (47, { declaration_astnumRT = 48; object_nameRT = ((*A*) 20); object_nominal_subtypeRT = (Array_Type ((*ArrayT*) 4)); initialization_expRT = None })),
    (SeqDeclRT (49,
    (ObjDeclRT (51, { declaration_astnumRT = 52; object_nameRT = ((*Result*) 21); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (50, (Integer_Literal 1) , [], [])))) })),
    (SeqDeclRT (53,
    (ObjDeclRT (56, { declaration_astnumRT = 57; object_nameRT = ((*T*) 22); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((NameRT (54, (IdentifierRT (55, ((*Result*) 21) , [])))))) })),
    (SeqDeclRT (58,
    (ObjDeclRT (59, { declaration_astnumRT = 60; object_nameRT = ((*T1*) 23); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (ObjDeclRT (61, { declaration_astnumRT = 62; object_nameRT = ((*T2*) 24); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (63,
    (AssignRT (64, (SelectedComponentRT (65, (IdentifierRT (66, ((*R*) 19) , [])), ((*X*) 2) , [])), (BinOpRT (68, Plus, (BinOpRT (69, Plus, (NameRT (70, (IdentifierRT (71, ((*W*) 12) , [])))), (NameRT (72, (IdentifierRT (73, ((*U*) 13) , [])))) , [OverflowCheck], [])), (LiteralRT (74, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    (SeqRT (75,
    (AssignRT (76, (IndexedComponentRT (77, (IdentifierRT (78, ((*A*) 20) , [])), (NameRT (79, (IdentifierRT (80, ((*N*) 17) , [RangeCheck])))) , [])), (LiteralRT (81, (Integer_Literal 1) , [], [])))),
    (SeqRT (82,
    (AssignRT (83, (IdentifierRT (84, ((*T1*) 23) , [])), (BinOpRT (85, Plus, (NameRT (86, (SelectedComponentRT (87, (IdentifierRT (88, ((*R*) 19) , [])), ((*X*) 2) , [])))), (NameRT (90, (IdentifierRT (91, ((*N*) 17) , [])))) , [OverflowCheck], [])))),
    (SeqRT (92,
    (AssignRT (93, (IdentifierRT (94, ((*T2*) 24) , [])), (BinOpRT (95, Plus, (NameRT (96, (IndexedComponentRT (97, (IdentifierRT (98, ((*A*) 20) , [])), (NameRT (99, (IdentifierRT (100, ((*T1*) 23) , [RangeCheck])))) , [])))), (NameRT (101, (IdentifierRT (102, ((*T1*) 23) , [])))) , [OverflowCheck], [])))),
    (SeqRT (103,
    (AssignRT (104, (IdentifierRT (105, ((*T*) 22) , [])), (NameRT (106, (IdentifierRT (107, ((*T2*) 24) , [])))))),
    (SeqRT (108,
    (CallRT (109, 110, ((*Increase*) 5), 
      [(NameRT (111, (IdentifierRT (112, ((*T2*) 24) , [])))); (NameRT (113, (IdentifierRT (114, ((*T*) 22) , []))))])
    ),
    (SeqRT (115,
    (IfRT (116, (BinOpRT (117, Greater_Than, (NameRT (118, (IdentifierRT (119, ((*T*) 22) , [])))), (LiteralRT (120, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (121, (IdentifierRT (122, ((*T*) 22) , [])), (BinOpRT (123, Plus, (NameRT (124, (IdentifierRT (125, ((*T*) 22) , [])))), (LiteralRT (126, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
      NullRT)
    ),
    (SeqRT (127,
    (IfRT (128, (BinOpRT (129, Greater_Than, (NameRT (130, (IdentifierRT (131, ((*T*) 22) , [])))), (LiteralRT (132, (Integer_Literal 1) , [], [])) , [], [])),
      (AssignRT (133, (IdentifierRT (134, ((*T*) 22) , [])), (BinOpRT (135, Plus, (NameRT (136, (IdentifierRT (137, ((*T*) 22) , [])))), (LiteralRT (138, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])))),
      (AssignRT (139, (IdentifierRT (140, ((*T*) 22) , [])), (BinOpRT (141, Minus, (NameRT (142, (IdentifierRT (143, ((*T*) 22) , [])))), (LiteralRT (144, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ),
    (SeqRT (145,
    (WhileRT (146, (BinOpRT (147, Greater_Than, (NameRT (148, (IdentifierRT (149, ((*T*) 22) , [])))), (LiteralRT (150, (Integer_Literal 0) , [], [])) , [], [])),
      (SeqRT (151,
      (AssignRT (152, (IdentifierRT (153, ((*Result*) 21) , [])), (BinOpRT (154, Divide, (BinOpRT (155, Multiply, (NameRT (156, (IdentifierRT (157, ((*Result*) 21) , [])))), (NameRT (158, (IdentifierRT (159, ((*T*) 22) , [])))) , [OverflowCheck], [])), (NameRT (160, (IdentifierRT (161, ((*N*) 17) , [])))) , [DivCheck; OverflowCheck], [])))),
      (AssignRT (162, (IdentifierRT (163, ((*T*) 22) , [])), (BinOpRT (164, Minus, (NameRT (165, (IdentifierRT (166, ((*T*) 22) , [])))), (LiteralRT (167, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))
    ),
    (AssignRT (168, (IdentifierRT (169, ((*M*) 18) , [])), (NameRT (170, (IdentifierRT (171, ((*Result*) 21) , []))))))))))))))))))))))))
  ))
)))))))))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*A*) 20), (In_Out, (Array_Type ((*ArrayT*) 4)))); (((*X*) 14), (In, Integer)); (((*W*) 12), (In_Out, Integer)); (((*T1*) 23), (In_Out, Integer)); (((*U*) 13), (In_Out, Integer)); (((*Y*) 15), (Out, Integer)); (((*Result*) 21), (In_Out, Integer)); (((*T2*) 24), (In_Out, Integer)); (((*T*) 22), (In_Out, Integer)); (((*M*) 18), (Out, Integer)); (((*N*) 17), (In, Integer)); (((*R*) 19), (In_Out, (Record_Type ((*RecordT*) 1))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test*) 6), (0, mkprocBodyDeclRT (
 40,
  (* = = = Procedure Name = = = *)
  ((*Test*) 6),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 41; parameter_nameRT = ((*N*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 42; parameter_nameRT = ((*M*) 18); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (43,
  (ObjDeclRT (44, { declaration_astnumRT = 45; object_nameRT = ((*R*) 19); object_nominal_subtypeRT = (Record_Type ((*RecordT*) 1)); initialization_expRT = None })),
  (SeqDeclRT (46,
  (ObjDeclRT (47, { declaration_astnumRT = 48; object_nameRT = ((*A*) 20); object_nominal_subtypeRT = (Array_Type ((*ArrayT*) 4)); initialization_expRT = None })),
  (SeqDeclRT (49,
  (ObjDeclRT (51, { declaration_astnumRT = 52; object_nameRT = ((*Result*) 21); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (50, (Integer_Literal 1) , [], [])))) })),
  (SeqDeclRT (53,
  (ObjDeclRT (56, { declaration_astnumRT = 57; object_nameRT = ((*T*) 22); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((NameRT (54, (IdentifierRT (55, ((*Result*) 21) , [])))))) })),
  (SeqDeclRT (58,
  (ObjDeclRT (59, { declaration_astnumRT = 60; object_nameRT = ((*T1*) 23); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (61, { declaration_astnumRT = 62; object_nameRT = ((*T2*) 24); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (63,
  (AssignRT (64, (SelectedComponentRT (65, (IdentifierRT (66, ((*R*) 19) , [])), ((*X*) 2) , [])), (BinOpRT (68, Plus, (BinOpRT (69, Plus, (NameRT (70, (IdentifierRT (71, ((*W*) 12) , [])))), (NameRT (72, (IdentifierRT (73, ((*U*) 13) , [])))) , [OverflowCheck], [])), (LiteralRT (74, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
  (SeqRT (75,
  (AssignRT (76, (IndexedComponentRT (77, (IdentifierRT (78, ((*A*) 20) , [])), (NameRT (79, (IdentifierRT (80, ((*N*) 17) , [RangeCheck])))) , [])), (LiteralRT (81, (Integer_Literal 1) , [], [])))),
  (SeqRT (82,
  (AssignRT (83, (IdentifierRT (84, ((*T1*) 23) , [])), (BinOpRT (85, Plus, (NameRT (86, (SelectedComponentRT (87, (IdentifierRT (88, ((*R*) 19) , [])), ((*X*) 2) , [])))), (NameRT (90, (IdentifierRT (91, ((*N*) 17) , [])))) , [OverflowCheck], [])))),
  (SeqRT (92,
  (AssignRT (93, (IdentifierRT (94, ((*T2*) 24) , [])), (BinOpRT (95, Plus, (NameRT (96, (IndexedComponentRT (97, (IdentifierRT (98, ((*A*) 20) , [])), (NameRT (99, (IdentifierRT (100, ((*T1*) 23) , [RangeCheck])))) , [])))), (NameRT (101, (IdentifierRT (102, ((*T1*) 23) , [])))) , [OverflowCheck], [])))),
  (SeqRT (103,
  (AssignRT (104, (IdentifierRT (105, ((*T*) 22) , [])), (NameRT (106, (IdentifierRT (107, ((*T2*) 24) , [])))))),
  (SeqRT (108,
  (CallRT (109, 110, ((*Increase*) 5), 
    [(NameRT (111, (IdentifierRT (112, ((*T2*) 24) , [])))); (NameRT (113, (IdentifierRT (114, ((*T*) 22) , []))))])
  ),
  (SeqRT (115,
  (IfRT (116, (BinOpRT (117, Greater_Than, (NameRT (118, (IdentifierRT (119, ((*T*) 22) , [])))), (LiteralRT (120, (Integer_Literal 0) , [], [])) , [], [])),
    (AssignRT (121, (IdentifierRT (122, ((*T*) 22) , [])), (BinOpRT (123, Plus, (NameRT (124, (IdentifierRT (125, ((*T*) 22) , [])))), (LiteralRT (126, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    NullRT)
  ),
  (SeqRT (127,
  (IfRT (128, (BinOpRT (129, Greater_Than, (NameRT (130, (IdentifierRT (131, ((*T*) 22) , [])))), (LiteralRT (132, (Integer_Literal 1) , [], [])) , [], [])),
    (AssignRT (133, (IdentifierRT (134, ((*T*) 22) , [])), (BinOpRT (135, Plus, (NameRT (136, (IdentifierRT (137, ((*T*) 22) , [])))), (LiteralRT (138, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])))),
    (AssignRT (139, (IdentifierRT (140, ((*T*) 22) , [])), (BinOpRT (141, Minus, (NameRT (142, (IdentifierRT (143, ((*T*) 22) , [])))), (LiteralRT (144, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
  ),
  (SeqRT (145,
  (WhileRT (146, (BinOpRT (147, Greater_Than, (NameRT (148, (IdentifierRT (149, ((*T*) 22) , [])))), (LiteralRT (150, (Integer_Literal 0) , [], [])) , [], [])),
    (SeqRT (151,
    (AssignRT (152, (IdentifierRT (153, ((*Result*) 21) , [])), (BinOpRT (154, Divide, (BinOpRT (155, Multiply, (NameRT (156, (IdentifierRT (157, ((*Result*) 21) , [])))), (NameRT (158, (IdentifierRT (159, ((*T*) 22) , [])))) , [OverflowCheck], [])), (NameRT (160, (IdentifierRT (161, ((*N*) 17) , [])))) , [DivCheck; OverflowCheck], [])))),
    (AssignRT (162, (IdentifierRT (163, ((*T*) 22) , [])), (BinOpRT (164, Minus, (NameRT (165, (IdentifierRT (166, ((*T*) 22) , [])))), (LiteralRT (167, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))
  ),
  (AssignRT (168, (IdentifierRT (169, ((*M*) 18) , [])), (NameRT (170, (IdentifierRT (171, ((*Result*) 21) , []))))))))))))))))))))))))
))); (((*Increase*) 5), (0, mkprocBodyDeclRT (
 30,
  (* = = = Procedure Name = = = *)
  ((*Increase*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 31; parameter_nameRT = ((*X*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 32; parameter_nameRT = ((*Y*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (33, (IdentifierRT (34, ((*Y*) 15) , [])), (BinOpRT (35, Plus, (NameRT (36, (IdentifierRT (37, ((*X*) 14) , [])))), (LiteralRT (38, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*I*) 3), (SubtypeDeclRT (8, ((*I*) 3), Integer, (RangeRT (0, 5))))); (((*RecordT*) 1), (RecordTypeDeclRT (4, ((*RecordT*) 1), [(((*X*) 2), Integer)]))); (((*ArrayT1*) 10), (ArrayTypeDeclRT (19, ((*ArrayT1*) 10), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer)))); (((*RecordT1*) 8), (RecordTypeDeclRT (15, ((*RecordT1*) 8), [(((*X*) 9), Integer)]))); (((*ArrayT*) 4), (ArrayTypeDeclRT (11, ((*ArrayT*) 4), ((*index subtype mark*) (Subtype ((*I*) 3))), ((*component type*) Integer))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(137, Integer); (101, Integer); (164, Integer); (155, Integer); (119, Integer); (95, Integer); (131, Integer); (122, Integer); (167, Integer); (158, Integer); (77, Integer); (86, Integer); (140, Integer); (68, Integer); (50, Integer); (113, Integer); (149, Integer); (134, Integer); (35, Integer); (125, Integer); (80, Integer); (89, Integer); (71, Integer); (98, (Array_Type ((*ArrayT*) 4))); (107, Integer); (74, Integer); (38, Integer); (65, Integer); (166, Integer); (142, Integer); (124, Integer); (106, Integer); (169, Integer); (160, Integer); (163, Integer); (118, Integer); (136, Integer); (100, Integer); (91, Integer); (73, Integer); (55, Integer); (154, Integer); (67, Integer); (85, Integer); (94, Integer); (130, Integer); (157, Integer); (148, Integer); (112, Integer); (97, Integer); (79, Integer); (88, (Record_Type ((*RecordT*) 1))); (70, Integer); (25, Integer); (34, Integer); (37, Integer); (156, Integer); (147, Boolean); (129, Boolean); (138, Integer); (165, Integer); (120, Integer); (87, Integer); (96, Integer); (159, Integer); (150, Integer); (132, Integer); (141, Integer); (105, Integer); (123, Integer); (114, Integer); (78, (Array_Type ((*ArrayT*) 4))); (69, Integer); (90, Integer); (99, Integer); (54, Integer); (171, Integer); (153, Integer); (144, Integer); (126, Integer); (81, Integer); (72, Integer); (135, Integer); (36, Integer); (117, Boolean); (21, Integer); (84, Integer); (102, Integer); (111, Integer); (66, (Record_Type ((*RecordT*) 1))); (170, Integer); (143, Integer); (161, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(137, { line = (*Line*)40; col = (*Col*)15; endline = (*EndLine*)40; endcol = (*EndCol*)15 }); (101, { line = (*Line*)30; col = (*Col*)21; endline = (*EndLine*)30; endcol = (*EndCol*)22 }); (164, { line = (*Line*)47; col = (*Col*)15; endline = (*EndLine*)47; endcol = (*EndCol*)19 }); (155, { line = (*Line*)46; col = (*Col*)21; endline = (*EndLine*)46; endcol = (*EndCol*)30 }); (119, { line = (*Line*)35; col = (*Col*)10; endline = (*EndLine*)35; endcol = (*EndCol*)10 }); (95, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)22 }); (131, { line = (*Line*)39; col = (*Col*)10; endline = (*EndLine*)39; endcol = (*EndCol*)10 }); (122, { line = (*Line*)36; col = (*Col*)10; endline = (*EndLine*)36; endcol = (*EndCol*)10 }); (167, { line = (*Line*)47; col = (*Col*)19; endline = (*EndLine*)47; endcol = (*EndCol*)19 }); (158, { line = (*Line*)46; col = (*Col*)30; endline = (*EndLine*)46; endcol = (*EndCol*)30 }); (77, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)10 }); (86, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (140, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)10 }); (68, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)22 }); (50, { line = (*Line*)22; col = (*Col*)26; endline = (*EndLine*)22; endcol = (*EndCol*)26 }); (113, { line = (*Line*)33; col = (*Col*)20; endline = (*EndLine*)33; endcol = (*EndCol*)20 }); (149, { line = (*Line*)45; col = (*Col*)13; endline = (*EndLine*)45; endcol = (*EndCol*)13 }); (134, { line = (*Line*)40; col = (*Col*)10; endline = (*EndLine*)40; endcol = (*EndCol*)10 }); (35, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)16 }); (125, { line = (*Line*)36; col = (*Col*)15; endline = (*EndLine*)36; endcol = (*EndCol*)15 }); (80, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)9 }); (89, { line = (*Line*)29; col = (*Col*)15; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (71, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (98, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)13 }); (107, { line = (*Line*)31; col = (*Col*)12; endline = (*EndLine*)31; endcol = (*EndCol*)13 }); (74, { line = (*Line*)27; col = (*Col*)22; endline = (*EndLine*)27; endcol = (*EndCol*)22 }); (38, { line = (*Line*)14; col = (*Col*)16; endline = (*EndLine*)14; endcol = (*EndCol*)16 }); (65, { line = (*Line*)27; col = (*Col*)7; endline = (*EndLine*)27; endcol = (*EndCol*)9 }); (166, { line = (*Line*)47; col = (*Col*)15; endline = (*EndLine*)47; endcol = (*EndCol*)15 }); (142, { line = (*Line*)42; col = (*Col*)15; endline = (*EndLine*)42; endcol = (*EndCol*)15 }); (124, { line = (*Line*)36; col = (*Col*)15; endline = (*EndLine*)36; endcol = (*EndCol*)15 }); (106, { line = (*Line*)31; col = (*Col*)12; endline = (*EndLine*)31; endcol = (*EndCol*)13 }); (169, { line = (*Line*)50; col = (*Col*)7; endline = (*EndLine*)50; endcol = (*EndCol*)7 }); (160, { line = (*Line*)46; col = (*Col*)35; endline = (*EndLine*)46; endcol = (*EndCol*)35 }); (163, { line = (*Line*)47; col = (*Col*)10; endline = (*EndLine*)47; endcol = (*EndCol*)10 }); (118, { line = (*Line*)35; col = (*Col*)10; endline = (*EndLine*)35; endcol = (*EndCol*)10 }); (136, { line = (*Line*)40; col = (*Col*)15; endline = (*EndLine*)40; endcol = (*EndCol*)15 }); (100, { line = (*Line*)30; col = (*Col*)15; endline = (*EndLine*)30; endcol = (*EndCol*)16 }); (91, { line = (*Line*)29; col = (*Col*)19; endline = (*EndLine*)29; endcol = (*EndCol*)19 }); (73, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)18 }); (55, { line = (*Line*)23; col = (*Col*)21; endline = (*EndLine*)23; endcol = (*EndCol*)26 }); (154, { line = (*Line*)46; col = (*Col*)20; endline = (*EndLine*)46; endcol = (*EndCol*)35 }); (67, { line = (*Line*)27; col = (*Col*)9; endline = (*EndLine*)27; endcol = (*EndCol*)9 }); (85, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)19 }); (94, { line = (*Line*)30; col = (*Col*)7; endline = (*EndLine*)30; endcol = (*EndCol*)8 }); (130, { line = (*Line*)39; col = (*Col*)10; endline = (*EndLine*)39; endcol = (*EndCol*)10 }); (157, { line = (*Line*)46; col = (*Col*)21; endline = (*EndLine*)46; endcol = (*EndCol*)26 }); (148, { line = (*Line*)45; col = (*Col*)13; endline = (*EndLine*)45; endcol = (*EndCol*)13 }); (112, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)17 }); (97, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)17 }); (79, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)9 }); (88, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)13 }); (70, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (25, { line = (*Line*)10; col = (*Col*)18; endline = (*EndLine*)10; endcol = (*EndCol*)18 }); (34, { line = (*Line*)14; col = (*Col*)7; endline = (*EndLine*)14; endcol = (*EndCol*)7 }); (37, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (156, { line = (*Line*)46; col = (*Col*)21; endline = (*EndLine*)46; endcol = (*EndCol*)26 }); (147, { line = (*Line*)45; col = (*Col*)13; endline = (*EndLine*)45; endcol = (*EndCol*)17 }); (129, { line = (*Line*)39; col = (*Col*)10; endline = (*EndLine*)39; endcol = (*EndCol*)14 }); (138, { line = (*Line*)40; col = (*Col*)19; endline = (*EndLine*)40; endcol = (*EndCol*)19 }); (165, { line = (*Line*)47; col = (*Col*)15; endline = (*EndLine*)47; endcol = (*EndCol*)15 }); (120, { line = (*Line*)35; col = (*Col*)14; endline = (*EndLine*)35; endcol = (*EndCol*)14 }); (87, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (96, { line = (*Line*)30; col = (*Col*)13; endline = (*EndLine*)30; endcol = (*EndCol*)17 }); (159, { line = (*Line*)46; col = (*Col*)30; endline = (*EndLine*)46; endcol = (*EndCol*)30 }); (150, { line = (*Line*)45; col = (*Col*)17; endline = (*EndLine*)45; endcol = (*EndCol*)17 }); (132, { line = (*Line*)39; col = (*Col*)14; endline = (*EndLine*)39; endcol = (*EndCol*)14 }); (141, { line = (*Line*)42; col = (*Col*)15; endline = (*EndLine*)42; endcol = (*EndCol*)19 }); (105, { line = (*Line*)31; col = (*Col*)7; endline = (*EndLine*)31; endcol = (*EndCol*)7 }); (123, { line = (*Line*)36; col = (*Col*)15; endline = (*EndLine*)36; endcol = (*EndCol*)19 }); (114, { line = (*Line*)33; col = (*Col*)20; endline = (*EndLine*)33; endcol = (*EndCol*)20 }); (78, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (69, { line = (*Line*)27; col = (*Col*)14; endline = (*EndLine*)27; endcol = (*EndCol*)18 }); (90, { line = (*Line*)29; col = (*Col*)19; endline = (*EndLine*)29; endcol = (*EndCol*)19 }); (99, { line = (*Line*)30; col = (*Col*)15; endline = (*EndLine*)30; endcol = (*EndCol*)16 }); (54, { line = (*Line*)23; col = (*Col*)21; endline = (*EndLine*)23; endcol = (*EndCol*)26 }); (171, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)17 }); (153, { line = (*Line*)46; col = (*Col*)10; endline = (*EndLine*)46; endcol = (*EndCol*)15 }); (144, { line = (*Line*)42; col = (*Col*)19; endline = (*EndLine*)42; endcol = (*EndCol*)19 }); (126, { line = (*Line*)36; col = (*Col*)19; endline = (*EndLine*)36; endcol = (*EndCol*)19 }); (81, { line = (*Line*)28; col = (*Col*)15; endline = (*EndLine*)28; endcol = (*EndCol*)15 }); (72, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)18 }); (135, { line = (*Line*)40; col = (*Col*)15; endline = (*EndLine*)40; endcol = (*EndCol*)19 }); (36, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (117, { line = (*Line*)35; col = (*Col*)10; endline = (*EndLine*)35; endcol = (*EndCol*)14 }); (21, { line = (*Line*)9; col = (*Col*)18; endline = (*EndLine*)9; endcol = (*EndCol*)18 }); (84, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)8 }); (102, { line = (*Line*)30; col = (*Col*)21; endline = (*EndLine*)30; endcol = (*EndCol*)22 }); (111, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)17 }); (66, { line = (*Line*)27; col = (*Col*)7; endline = (*EndLine*)27; endcol = (*EndCol*)7 }); (170, { line = (*Line*)50; col = (*Col*)12; endline = (*EndLine*)50; endcol = (*EndCol*)17 }); (143, { line = (*Line*)42; col = (*Col*)15; endline = (*EndLine*)42; endcol = (*EndCol*)15 }); (161, { line = (*Line*)46; col = (*Col*)35; endline = (*EndLine*)46; endcol = (*EndCol*)35 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(23, ("T1", "ada://variable/Array_Record_Package-1:9/Test-12:14/T1+24:7")); (17, ("N", "ada://parameter/Array_Record_Package-1:9/Test-12:14/N-12:20")); (2, ("X", "ada://component/Array_Record_Package-1:9/RecordT-3:9/X-4:7")); (20, ("A", "ada://variable/Array_Record_Package-1:9/Test-12:14/A+20:7")); (14, ("X", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/X-10:23")); (13, ("U", "ada://variable/Array_Record_Package-1:9/U+10:4")); (22, ("T", "ada://variable/Array_Record_Package-1:9/Test-12:14/T+23:7")); (19, ("R", "ada://variable/Array_Record_Package-1:9/Test-12:14/R+19:7")); (9, ("X", "ada://component/Array_Record_Package-1:9/RecordT1+3:9/X+4:7")); (18, ("M", "ada://parameter/Array_Record_Package-1:9/Test-12:14/M-12:33")); (12, ("W", "ada://variable/Array_Record_Package-1:9/W+9:4")); (21, ("Result", "ada://variable/Array_Record_Package-1:9/Test-12:14/Result+22:7")); (24, ("T2", "ada://variable/Array_Record_Package-1:9/Test-12:14/T2+25:7")); (15, ("Y", "ada://parameter/Array_Record_Package-1:9/Increase-10:14/Y-10:35"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Increase", "ada://procedure/Array_Record_Package-1:9/Increase-10:14")); (6, ("Test", "ada://procedure_body/Array_Record_Package-1:9/Test-12:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(7, ("Array_Record_Package", "ada://package_body/Array_Record_Package-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(8, ("RecordT1", "ada://ordinary_type/Array_Record_Package-1:9/RecordT1+3:9")); (4, ("ArrayT", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT-8:9")); (10, ("ArrayT1", "ada://ordinary_type/Array_Record_Package-1:9/ArrayT1+7:9")); (1, ("RecordT", "ada://ordinary_type/Array_Record_Package-1:9/RecordT-3:9")); (3, ("I", "ada://subtype/Array_Record_Package-1:9/I-7:12"))]
})
}


