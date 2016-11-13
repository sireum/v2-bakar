

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Test*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*N*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*M*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDecl (5,
    (TypeDecl (6, (RecordTypeDecl (7, ((*RecordT*) 4), [(((*X*) 5), Integer)])))),
    (SeqDecl (9,
    (TypeDecl (10, (SubtypeDecl (11, ((*I*) 6), Integer, (Range (0, 5)))))),
    (SeqDecl (12,
    (TypeDecl (13, (ArrayTypeDecl (14, ((*ArrayT*) 7), ((*index subtype mark*) (Subtype ((*I*) 6))), ((*component type*) Integer))))),
    (SeqDecl (15,
    (ProcBodyDecl (16, 
      mkprocBodyDecl (
       17,
        (* = = = Procedure Name = = = *)
        ((*Increase*) 8),
        (* = = = Formal Parameters = = = *)
        [{ parameter_astnum = 18; parameter_name = ((*X*) 9); parameter_subtype_mark = Integer; parameter_mode = In }; 
      { parameter_astnum = 19; parameter_name = ((*Y*) 10); parameter_subtype_mark = Integer; parameter_mode = Out }],
        (* = = = Object Declarations = = = *)
        NullDecl,
        (* = = = Procedure Body = = = *)
        (Assign (20, (Identifier (21, ((*Y*) 10) )), (BinOp (22, Plus, (Name (23, (Identifier (24, ((*X*) 9) )))), (Literal (25, (Integer_Literal 1) )) ))))
      ))
    ),
    (SeqDecl (26,
    (ObjDecl (27, { declaration_astnum = 28; object_name = ((*R*) 13); object_nominal_subtype = (Record_Type ((*RecordT*) 4)); initialization_exp = None })),
    (SeqDecl (29,
    (ObjDecl (30, { declaration_astnum = 31; object_name = ((*A*) 14); object_nominal_subtype = (Array_Type ((*ArrayT*) 7)); initialization_exp = None })),
    (SeqDecl (32,
    (ObjDecl (34, { declaration_astnum = 35; object_name = ((*Result*) 15); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (33, (Integer_Literal 1) )))) })),
    (SeqDecl (36,
    (ObjDecl (39, { declaration_astnum = 40; object_name = ((*T*) 16); object_nominal_subtype = Integer; initialization_exp = (Some ((Name (37, (Identifier (38, ((*Result*) 15) )))))) })),
    (SeqDecl (41,
    (ObjDecl (42, { declaration_astnum = 43; object_name = ((*T1*) 17); object_nominal_subtype = Integer; initialization_exp = None })),
    (ObjDecl (44, { declaration_astnum = 45; object_name = ((*T2*) 18); object_nominal_subtype = Integer; initialization_exp = None })))))))))))))))))))),
    (* = = = Procedure Body = = = *)
    (Seq (46,
    (Assign (47, (SelectedComponent (48, (Identifier (49, ((*R*) 13) )), ((*X*) 5) )), (Literal (51, (Integer_Literal 1) )))),
    (Seq (52,
    (Assign (53, (IndexedComponent (54, (Identifier (55, ((*A*) 14) )), (Literal (56, (Integer_Literal 0) )) )), (Literal (57, (Integer_Literal 1) )))),
    (Seq (58,
    (Assign (59, (Identifier (60, ((*T1*) 17) )), (BinOp (61, Plus, (Name (62, (SelectedComponent (63, (Identifier (64, ((*R*) 13) )), ((*X*) 5) )))), (Name (66, (Identifier (67, ((*N*) 2) )))) )))),
    (Seq (68,
    (Assign (69, (Identifier (70, ((*T2*) 18) )), (BinOp (71, Plus, (Name (72, (IndexedComponent (73, (Identifier (74, ((*A*) 14) )), (Literal (75, (Integer_Literal 0) )) )))), (Name (76, (Identifier (77, ((*T1*) 17) )))) )))),
    (Seq (78,
    (Assign (79, (Identifier (80, ((*T*) 16) )), (Name (81, (Identifier (82, ((*T2*) 18) )))))),
    (Seq (83,
    (Call (84, 85, ((*Increase*) 8), 
      [(Name (86, (Identifier (87, ((*T2*) 18) )))); (Name (88, (Identifier (89, ((*T*) 16) ))))])
    ),
    (Seq (90,
    (If (91, (BinOp (92, Greater_Than, (Name (93, (Identifier (94, ((*T*) 16) )))), (Literal (95, (Integer_Literal 0) )) )),
      (Assign (96, (Identifier (97, ((*T*) 16) )), (BinOp (98, Plus, (Name (99, (Identifier (100, ((*T*) 16) )))), (Literal (101, (Integer_Literal 1) )) )))),
      Null)
    ),
    (Seq (102,
    (If (103, (BinOp (104, Greater_Than, (Name (105, (Identifier (106, ((*T*) 16) )))), (Literal (107, (Integer_Literal 1) )) )),
      (Assign (108, (Identifier (109, ((*T*) 16) )), (BinOp (110, Plus, (Name (111, (Identifier (112, ((*T*) 16) )))), (Literal (113, (Integer_Literal 2) )) )))),
      (Assign (114, (Identifier (115, ((*T*) 16) )), (BinOp (116, Minus, (Name (117, (Identifier (118, ((*T*) 16) )))), (Literal (119, (Integer_Literal 1) )) )))))
    ),
    (Seq (120,
    (While (121, (BinOp (122, Greater_Than, (Name (123, (Identifier (124, ((*T*) 16) )))), (Literal (125, (Integer_Literal 0) )) )),
      (Seq (126,
      (Assign (127, (Identifier (128, ((*Result*) 15) )), (BinOp (129, Divide, (BinOp (130, Multiply, (Name (131, (Identifier (132, ((*Result*) 15) )))), (Name (133, (Identifier (134, ((*T*) 16) )))) )), (Name (135, (Identifier (136, ((*N*) 2) )))) )))),
      (Assign (137, (Identifier (138, ((*T*) 16) )), (BinOp (139, Minus, (Name (140, (Identifier (141, ((*T*) 16) )))), (Literal (142, (Integer_Literal 1) )) )))))))
    ),
    (Assign (143, (Identifier (144, ((*M*) 3) )), (Name (145, (Identifier (146, ((*Result*) 15) ))))))))))))))))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*T1*) 17), (In_Out, Integer)); (((*R*) 13), (In_Out, (Record_Type ((*RecordT*) 4)))); (((*Y*) 10), (Out, Integer)); (((*N*) 2), (In, Integer)); (((*Result*) 15), (In_Out, Integer)); (((*T2*) 18), (In_Out, Integer)); (((*T*) 16), (In_Out, Integer)); (((*X*) 9), (In, Integer)); (((*M*) 3), (Out, Integer)); (((*A*) 14), (In_Out, (Array_Type ((*ArrayT*) 7))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Test*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*N*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*M*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDecl (5,
  (TypeDecl (6, (RecordTypeDecl (7, ((*RecordT*) 4), [(((*X*) 5), Integer)])))),
  (SeqDecl (9,
  (TypeDecl (10, (SubtypeDecl (11, ((*I*) 6), Integer, (Range (0, 5)))))),
  (SeqDecl (12,
  (TypeDecl (13, (ArrayTypeDecl (14, ((*ArrayT*) 7), ((*index subtype mark*) (Subtype ((*I*) 6))), ((*component type*) Integer))))),
  (SeqDecl (15,
  (ProcBodyDecl (16, 
    mkprocBodyDecl (
     17,
      (* = = = Procedure Name = = = *)
      ((*Increase*) 8),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnum = 18; parameter_name = ((*X*) 9); parameter_subtype_mark = Integer; parameter_mode = In }; 
    { parameter_astnum = 19; parameter_name = ((*Y*) 10); parameter_subtype_mark = Integer; parameter_mode = Out }],
      (* = = = Object Declarations = = = *)
      NullDecl,
      (* = = = Procedure Body = = = *)
      (Assign (20, (Identifier (21, ((*Y*) 10) )), (BinOp (22, Plus, (Name (23, (Identifier (24, ((*X*) 9) )))), (Literal (25, (Integer_Literal 1) )) ))))
    ))
  ),
  (SeqDecl (26,
  (ObjDecl (27, { declaration_astnum = 28; object_name = ((*R*) 13); object_nominal_subtype = (Record_Type ((*RecordT*) 4)); initialization_exp = None })),
  (SeqDecl (29,
  (ObjDecl (30, { declaration_astnum = 31; object_name = ((*A*) 14); object_nominal_subtype = (Array_Type ((*ArrayT*) 7)); initialization_exp = None })),
  (SeqDecl (32,
  (ObjDecl (34, { declaration_astnum = 35; object_name = ((*Result*) 15); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (33, (Integer_Literal 1) )))) })),
  (SeqDecl (36,
  (ObjDecl (39, { declaration_astnum = 40; object_name = ((*T*) 16); object_nominal_subtype = Integer; initialization_exp = (Some ((Name (37, (Identifier (38, ((*Result*) 15) )))))) })),
  (SeqDecl (41,
  (ObjDecl (42, { declaration_astnum = 43; object_name = ((*T1*) 17); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (44, { declaration_astnum = 45; object_name = ((*T2*) 18); object_nominal_subtype = Integer; initialization_exp = None })))))))))))))))))))),
  (* = = = Procedure Body = = = *)
  (Seq (46,
  (Assign (47, (SelectedComponent (48, (Identifier (49, ((*R*) 13) )), ((*X*) 5) )), (Literal (51, (Integer_Literal 1) )))),
  (Seq (52,
  (Assign (53, (IndexedComponent (54, (Identifier (55, ((*A*) 14) )), (Literal (56, (Integer_Literal 0) )) )), (Literal (57, (Integer_Literal 1) )))),
  (Seq (58,
  (Assign (59, (Identifier (60, ((*T1*) 17) )), (BinOp (61, Plus, (Name (62, (SelectedComponent (63, (Identifier (64, ((*R*) 13) )), ((*X*) 5) )))), (Name (66, (Identifier (67, ((*N*) 2) )))) )))),
  (Seq (68,
  (Assign (69, (Identifier (70, ((*T2*) 18) )), (BinOp (71, Plus, (Name (72, (IndexedComponent (73, (Identifier (74, ((*A*) 14) )), (Literal (75, (Integer_Literal 0) )) )))), (Name (76, (Identifier (77, ((*T1*) 17) )))) )))),
  (Seq (78,
  (Assign (79, (Identifier (80, ((*T*) 16) )), (Name (81, (Identifier (82, ((*T2*) 18) )))))),
  (Seq (83,
  (Call (84, 85, ((*Increase*) 8), 
    [(Name (86, (Identifier (87, ((*T2*) 18) )))); (Name (88, (Identifier (89, ((*T*) 16) ))))])
  ),
  (Seq (90,
  (If (91, (BinOp (92, Greater_Than, (Name (93, (Identifier (94, ((*T*) 16) )))), (Literal (95, (Integer_Literal 0) )) )),
    (Assign (96, (Identifier (97, ((*T*) 16) )), (BinOp (98, Plus, (Name (99, (Identifier (100, ((*T*) 16) )))), (Literal (101, (Integer_Literal 1) )) )))),
    Null)
  ),
  (Seq (102,
  (If (103, (BinOp (104, Greater_Than, (Name (105, (Identifier (106, ((*T*) 16) )))), (Literal (107, (Integer_Literal 1) )) )),
    (Assign (108, (Identifier (109, ((*T*) 16) )), (BinOp (110, Plus, (Name (111, (Identifier (112, ((*T*) 16) )))), (Literal (113, (Integer_Literal 2) )) )))),
    (Assign (114, (Identifier (115, ((*T*) 16) )), (BinOp (116, Minus, (Name (117, (Identifier (118, ((*T*) 16) )))), (Literal (119, (Integer_Literal 1) )) )))))
  ),
  (Seq (120,
  (While (121, (BinOp (122, Greater_Than, (Name (123, (Identifier (124, ((*T*) 16) )))), (Literal (125, (Integer_Literal 0) )) )),
    (Seq (126,
    (Assign (127, (Identifier (128, ((*Result*) 15) )), (BinOp (129, Divide, (BinOp (130, Multiply, (Name (131, (Identifier (132, ((*Result*) 15) )))), (Name (133, (Identifier (134, ((*T*) 16) )))) )), (Name (135, (Identifier (136, ((*N*) 2) )))) )))),
    (Assign (137, (Identifier (138, ((*T*) 16) )), (BinOp (139, Minus, (Name (140, (Identifier (141, ((*T*) 16) )))), (Literal (142, (Integer_Literal 1) )) )))))))
  ),
  (Assign (143, (Identifier (144, ((*M*) 3) )), (Name (145, (Identifier (146, ((*Result*) 15) ))))))))))))))))))))))))
))); (((*Increase*) 8), (1, mkprocBodyDecl (
 17,
  (* = = = Procedure Name = = = *)
  ((*Increase*) 8),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 18; parameter_name = ((*X*) 9); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 19; parameter_name = ((*Y*) 10); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (20, (Identifier (21, ((*Y*) 10) )), (BinOp (22, Plus, (Name (23, (Identifier (24, ((*X*) 9) )))), (Literal (25, (Integer_Literal 1) )) ))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*ArrayT*) 7), (ArrayTypeDecl (14, ((*ArrayT*) 7), ((*index subtype mark*) (Subtype ((*I*) 6))), ((*component type*) Integer)))); (((*I*) 6), (SubtypeDecl (11, ((*I*) 6), Integer, (Range (0, 5))))); (((*RecordT*) 4), (RecordTypeDecl (7, ((*RecordT*) 4), [(((*X*) 5), Integer)])))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(146, Integer); (92, Boolean); (101, Integer); (110, Integer); (128, Integer); (119, Integer); (23, Integer); (95, Integer); (104, Boolean); (131, Integer); (122, Boolean); (77, Integer); (86, Integer); (140, Integer); (113, Integer); (50, Integer); (134, Integer); (62, Integer); (125, Integer); (80, Integer); (89, Integer); (116, Integer); (71, Integer); (98, Integer); (107, Integer); (74, (Array_Type ((*ArrayT*) 7))); (56, Integer); (38, Integer); (65, Integer); (142, Integer); (124, Integer); (133, Integer); (106, Integer); (115, Integer); (118, Integer); (136, Integer); (100, Integer); (109, Integer); (82, Integer); (145, Integer); (64, (Record_Type ((*RecordT*) 4))); (55, (Array_Type ((*ArrayT*) 7))); (73, Integer); (139, Integer); (67, Integer); (94, Integer); (49, (Record_Type ((*RecordT*) 4))); (130, Integer); (22, Integer); (76, Integer); (112, Integer); (97, Integer); (88, Integer); (70, Integer); (25, Integer); (61, Integer); (37, Integer); (129, Integer); (138, Integer); (60, Integer); (87, Integer); (132, Integer); (141, Integer); (105, Integer); (123, Integer); (63, Integer); (99, Integer); (54, Integer); (144, Integer); (72, Integer); (81, Integer); (135, Integer); (117, Integer); (57, Integer); (21, Integer); (48, Integer); (93, Integer); (75, Integer); (111, Integer); (66, Integer); (51, Integer); (24, Integer); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(146, { line = (*Line*)42; col = (*Col*)9; endline = (*EndLine*)42; endcol = (*EndCol*)14 }); (92, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (101, { line = (*Line*)29; col = (*Col*)16; endline = (*EndLine*)29; endcol = (*EndCol*)16 }); (110, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)16 }); (128, { line = (*Line*)39; col = (*Col*)7; endline = (*EndLine*)39; endcol = (*EndCol*)12 }); (119, { line = (*Line*)35; col = (*Col*)16; endline = (*EndLine*)35; endcol = (*EndCol*)16 }); (23, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (95, { line = (*Line*)28; col = (*Col*)11; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (104, { line = (*Line*)32; col = (*Col*)7; endline = (*EndLine*)32; endcol = (*EndCol*)11 }); (131, { line = (*Line*)39; col = (*Col*)18; endline = (*EndLine*)39; endcol = (*EndCol*)23 }); (122, { line = (*Line*)38; col = (*Col*)10; endline = (*EndLine*)38; endcol = (*EndCol*)14 }); (77, { line = (*Line*)25; col = (*Col*)17; endline = (*EndLine*)25; endcol = (*EndCol*)18 }); (86, { line = (*Line*)27; col = (*Col*)13; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (140, { line = (*Line*)40; col = (*Col*)12; endline = (*EndLine*)40; endcol = (*EndCol*)12 }); (113, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)16 }); (50, { line = (*Line*)22; col = (*Col*)6; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (134, { line = (*Line*)39; col = (*Col*)27; endline = (*EndLine*)39; endcol = (*EndCol*)27 }); (62, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (125, { line = (*Line*)38; col = (*Col*)14; endline = (*EndLine*)38; endcol = (*EndCol*)14 }); (80, { line = (*Line*)26; col = (*Col*)4; endline = (*EndLine*)26; endcol = (*EndCol*)4 }); (89, { line = (*Line*)27; col = (*Col*)17; endline = (*EndLine*)27; endcol = (*EndCol*)17 }); (116, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)16 }); (71, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)18 }); (98, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)16 }); (107, { line = (*Line*)32; col = (*Col*)11; endline = (*EndLine*)32; endcol = (*EndCol*)11 }); (74, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)10 }); (56, { line = (*Line*)23; col = (*Col*)6; endline = (*EndLine*)23; endcol = (*EndCol*)6 }); (38, { line = (*Line*)18; col = (*Col*)18; endline = (*EndLine*)18; endcol = (*EndCol*)23 }); (65, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (142, { line = (*Line*)40; col = (*Col*)16; endline = (*EndLine*)40; endcol = (*EndCol*)16 }); (124, { line = (*Line*)38; col = (*Col*)10; endline = (*EndLine*)38; endcol = (*EndCol*)10 }); (133, { line = (*Line*)39; col = (*Col*)27; endline = (*EndLine*)39; endcol = (*EndCol*)27 }); (106, { line = (*Line*)32; col = (*Col*)7; endline = (*EndLine*)32; endcol = (*EndCol*)7 }); (115, { line = (*Line*)35; col = (*Col*)7; endline = (*EndLine*)35; endcol = (*EndCol*)7 }); (118, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)12 }); (136, { line = (*Line*)39; col = (*Col*)32; endline = (*EndLine*)39; endcol = (*EndCol*)32 }); (100, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)12 }); (109, { line = (*Line*)33; col = (*Col*)7; endline = (*EndLine*)33; endcol = (*EndCol*)7 }); (82, { line = (*Line*)26; col = (*Col*)9; endline = (*EndLine*)26; endcol = (*EndCol*)10 }); (145, { line = (*Line*)42; col = (*Col*)9; endline = (*EndLine*)42; endcol = (*EndCol*)14 }); (64, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)10 }); (55, { line = (*Line*)23; col = (*Col*)4; endline = (*EndLine*)23; endcol = (*EndCol*)4 }); (73, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)13 }); (139, { line = (*Line*)40; col = (*Col*)12; endline = (*EndLine*)40; endcol = (*EndCol*)16 }); (67, { line = (*Line*)24; col = (*Col*)16; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (94, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (49, { line = (*Line*)22; col = (*Col*)4; endline = (*EndLine*)22; endcol = (*EndCol*)4 }); (130, { line = (*Line*)39; col = (*Col*)18; endline = (*EndLine*)39; endcol = (*EndCol*)27 }); (22, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)16 }); (76, { line = (*Line*)25; col = (*Col*)17; endline = (*EndLine*)25; endcol = (*EndCol*)18 }); (112, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)12 }); (97, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)7 }); (88, { line = (*Line*)27; col = (*Col*)17; endline = (*EndLine*)27; endcol = (*EndCol*)17 }); (70, { line = (*Line*)25; col = (*Col*)4; endline = (*EndLine*)25; endcol = (*EndCol*)5 }); (25, { line = (*Line*)11; col = (*Col*)16; endline = (*EndLine*)11; endcol = (*EndCol*)16 }); (61, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (37, { line = (*Line*)18; col = (*Col*)18; endline = (*EndLine*)18; endcol = (*EndCol*)23 }); (129, { line = (*Line*)39; col = (*Col*)17; endline = (*EndLine*)39; endcol = (*EndCol*)32 }); (138, { line = (*Line*)40; col = (*Col*)7; endline = (*EndLine*)40; endcol = (*EndCol*)7 }); (60, { line = (*Line*)24; col = (*Col*)4; endline = (*EndLine*)24; endcol = (*EndCol*)5 }); (87, { line = (*Line*)27; col = (*Col*)13; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (132, { line = (*Line*)39; col = (*Col*)18; endline = (*EndLine*)39; endcol = (*EndCol*)23 }); (141, { line = (*Line*)40; col = (*Col*)12; endline = (*EndLine*)40; endcol = (*EndCol*)12 }); (105, { line = (*Line*)32; col = (*Col*)7; endline = (*EndLine*)32; endcol = (*EndCol*)7 }); (123, { line = (*Line*)38; col = (*Col*)10; endline = (*EndLine*)38; endcol = (*EndCol*)10 }); (63, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (99, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)12 }); (54, { line = (*Line*)23; col = (*Col*)4; endline = (*EndLine*)23; endcol = (*EndCol*)7 }); (144, { line = (*Line*)42; col = (*Col*)4; endline = (*EndLine*)42; endcol = (*EndCol*)4 }); (72, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)13 }); (81, { line = (*Line*)26; col = (*Col*)9; endline = (*EndLine*)26; endcol = (*EndCol*)10 }); (135, { line = (*Line*)39; col = (*Col*)32; endline = (*EndLine*)39; endcol = (*EndCol*)32 }); (117, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)12 }); (57, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)12 }); (21, { line = (*Line*)11; col = (*Col*)7; endline = (*EndLine*)11; endcol = (*EndCol*)7 }); (48, { line = (*Line*)22; col = (*Col*)4; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (93, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (75, { line = (*Line*)25; col = (*Col*)12; endline = (*EndLine*)25; endcol = (*EndCol*)12 }); (111, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)12 }); (66, { line = (*Line*)24; col = (*Col*)16; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (51, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)11 }); (24, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (33, { line = (*Line*)17; col = (*Col*)23; endline = (*EndLine*)17; endcol = (*EndCol*)23 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("T1", "ada://variable/Test+1:11/T1+19:4")); (2, ("N", "ada://parameter/Test+1:11/N+1:17")); (14, ("A", "ada://variable/Test+1:11/A+15:4")); (5, ("X", "ada://component/Test+1:11/RecordT+3:9/X+4:7")); (13, ("R", "ada://variable/Test+1:11/R+14:4")); (16, ("T", "ada://variable/Test+1:11/T+18:4")); (10, ("Y", "ada://parameter/Test+1:11/Increase+9:14/Y+9:35")); (18, ("T2", "ada://variable/Test+1:11/T2+20:4")); (9, ("X", "ada://parameter/Test+1:11/Increase+9:14/X+9:23")); (3, ("M", "ada://parameter/Test+1:11/M+1:30")); (15, ("Result", "ada://variable/Test+1:11/Result+17:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(8, ("Increase", "ada://procedure_body/Test+1:11/Increase+9:14")); (1, ("Test", "ada://procedure_body/Test+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("RecordT", "ada://ordinary_type/Test+1:11/RecordT+3:9")); (7, ("ArrayT", "ada://ordinary_type/Test+1:11/ArrayT+7:9")); (6, ("I", "ada://subtype/Test+1:11/I+6:12"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Test*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*N*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*M*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (5,
    (TypeDeclRT (6, (RecordTypeDeclRT (7, ((*RecordT*) 4), [(((*X*) 5), Integer)])))),
    (SeqDeclRT (9,
    (TypeDeclRT (10, (SubtypeDeclRT (11, ((*I*) 6), Integer, (RangeRT (0, 5)))))),
    (SeqDeclRT (12,
    (TypeDeclRT (13, (ArrayTypeDeclRT (14, ((*ArrayT*) 7), ((*index subtype mark*) (Subtype ((*I*) 6))), ((*component type*) Integer))))),
    (SeqDeclRT (15,
    (ProcBodyDeclRT (16, 
      mkprocBodyDeclRT (
       17,
        (* = = = Procedure Name = = = *)
        ((*Increase*) 8),
        (* = = = Formal Parameters = = = *)
        [{ parameter_astnumRT = 18; parameter_nameRT = ((*X*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
      { parameter_astnumRT = 19; parameter_nameRT = ((*Y*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
        (* = = = Object Declarations = = = *)
        NullDeclRT,
        (* = = = Procedure Body = = = *)
        (AssignRT (20, (IdentifierRT (21, ((*Y*) 10) , [])), (BinOpRT (22, Plus, (NameRT (23, (IdentifierRT (24, ((*X*) 9) , [])))), (LiteralRT (25, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
      ))
    ),
    (SeqDeclRT (26,
    (ObjDeclRT (27, { declaration_astnumRT = 28; object_nameRT = ((*R*) 13); object_nominal_subtypeRT = (Record_Type ((*RecordT*) 4)); initialization_expRT = None })),
    (SeqDeclRT (29,
    (ObjDeclRT (30, { declaration_astnumRT = 31; object_nameRT = ((*A*) 14); object_nominal_subtypeRT = (Array_Type ((*ArrayT*) 7)); initialization_expRT = None })),
    (SeqDeclRT (32,
    (ObjDeclRT (34, { declaration_astnumRT = 35; object_nameRT = ((*Result*) 15); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (33, (Integer_Literal 1) , [], [])))) })),
    (SeqDeclRT (36,
    (ObjDeclRT (39, { declaration_astnumRT = 40; object_nameRT = ((*T*) 16); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((NameRT (37, (IdentifierRT (38, ((*Result*) 15) , [])))))) })),
    (SeqDeclRT (41,
    (ObjDeclRT (42, { declaration_astnumRT = 43; object_nameRT = ((*T1*) 17); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (ObjDeclRT (44, { declaration_astnumRT = 45; object_nameRT = ((*T2*) 18); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))))))))))))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (46,
    (AssignRT (47, (SelectedComponentRT (48, (IdentifierRT (49, ((*R*) 13) , [])), ((*X*) 5) , [])), (LiteralRT (51, (Integer_Literal 1) , [], [])))),
    (SeqRT (52,
    (AssignRT (53, (IndexedComponentRT (54, (IdentifierRT (55, ((*A*) 14) , [])), (LiteralRT (56, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (57, (Integer_Literal 1) , [], [])))),
    (SeqRT (58,
    (AssignRT (59, (IdentifierRT (60, ((*T1*) 17) , [])), (BinOpRT (61, Plus, (NameRT (62, (SelectedComponentRT (63, (IdentifierRT (64, ((*R*) 13) , [])), ((*X*) 5) , [])))), (NameRT (66, (IdentifierRT (67, ((*N*) 2) , [])))) , [OverflowCheck], [])))),
    (SeqRT (68,
    (AssignRT (69, (IdentifierRT (70, ((*T2*) 18) , [])), (BinOpRT (71, Plus, (NameRT (72, (IndexedComponentRT (73, (IdentifierRT (74, ((*A*) 14) , [])), (LiteralRT (75, (Integer_Literal 0) , [], [])) , [])))), (NameRT (76, (IdentifierRT (77, ((*T1*) 17) , [])))) , [OverflowCheck], [])))),
    (SeqRT (78,
    (AssignRT (79, (IdentifierRT (80, ((*T*) 16) , [])), (NameRT (81, (IdentifierRT (82, ((*T2*) 18) , [])))))),
    (SeqRT (83,
    (CallRT (84, 85, ((*Increase*) 8), 
      [(NameRT (86, (IdentifierRT (87, ((*T2*) 18) , [])))); (NameRT (88, (IdentifierRT (89, ((*T*) 16) , []))))])
    ),
    (SeqRT (90,
    (IfRT (91, (BinOpRT (92, Greater_Than, (NameRT (93, (IdentifierRT (94, ((*T*) 16) , [])))), (LiteralRT (95, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (96, (IdentifierRT (97, ((*T*) 16) , [])), (BinOpRT (98, Plus, (NameRT (99, (IdentifierRT (100, ((*T*) 16) , [])))), (LiteralRT (101, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
      NullRT)
    ),
    (SeqRT (102,
    (IfRT (103, (BinOpRT (104, Greater_Than, (NameRT (105, (IdentifierRT (106, ((*T*) 16) , [])))), (LiteralRT (107, (Integer_Literal 1) , [], [])) , [], [])),
      (AssignRT (108, (IdentifierRT (109, ((*T*) 16) , [])), (BinOpRT (110, Plus, (NameRT (111, (IdentifierRT (112, ((*T*) 16) , [])))), (LiteralRT (113, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])))),
      (AssignRT (114, (IdentifierRT (115, ((*T*) 16) , [])), (BinOpRT (116, Minus, (NameRT (117, (IdentifierRT (118, ((*T*) 16) , [])))), (LiteralRT (119, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ),
    (SeqRT (120,
    (WhileRT (121, (BinOpRT (122, Greater_Than, (NameRT (123, (IdentifierRT (124, ((*T*) 16) , [])))), (LiteralRT (125, (Integer_Literal 0) , [], [])) , [], [])),
      (SeqRT (126,
      (AssignRT (127, (IdentifierRT (128, ((*Result*) 15) , [])), (BinOpRT (129, Divide, (BinOpRT (130, Multiply, (NameRT (131, (IdentifierRT (132, ((*Result*) 15) , [])))), (NameRT (133, (IdentifierRT (134, ((*T*) 16) , [])))) , [OverflowCheck], [])), (NameRT (135, (IdentifierRT (136, ((*N*) 2) , [])))) , [DivCheck; OverflowCheck], [])))),
      (AssignRT (137, (IdentifierRT (138, ((*T*) 16) , [])), (BinOpRT (139, Minus, (NameRT (140, (IdentifierRT (141, ((*T*) 16) , [])))), (LiteralRT (142, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))
    ),
    (AssignRT (143, (IdentifierRT (144, ((*M*) 3) , [])), (NameRT (145, (IdentifierRT (146, ((*Result*) 15) , []))))))))))))))))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*T1*) 17), (In_Out, Integer)); (((*R*) 13), (In_Out, (Record_Type ((*RecordT*) 4)))); (((*Y*) 10), (Out, Integer)); (((*N*) 2), (In, Integer)); (((*Result*) 15), (In_Out, Integer)); (((*T2*) 18), (In_Out, Integer)); (((*T*) 16), (In_Out, Integer)); (((*X*) 9), (In, Integer)); (((*M*) 3), (Out, Integer)); (((*A*) 14), (In_Out, (Array_Type ((*ArrayT*) 7))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Test*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*N*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*M*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (5,
  (TypeDeclRT (6, (RecordTypeDeclRT (7, ((*RecordT*) 4), [(((*X*) 5), Integer)])))),
  (SeqDeclRT (9,
  (TypeDeclRT (10, (SubtypeDeclRT (11, ((*I*) 6), Integer, (RangeRT (0, 5)))))),
  (SeqDeclRT (12,
  (TypeDeclRT (13, (ArrayTypeDeclRT (14, ((*ArrayT*) 7), ((*index subtype mark*) (Subtype ((*I*) 6))), ((*component type*) Integer))))),
  (SeqDeclRT (15,
  (ProcBodyDeclRT (16, 
    mkprocBodyDeclRT (
     17,
      (* = = = Procedure Name = = = *)
      ((*Increase*) 8),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnumRT = 18; parameter_nameRT = ((*X*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
    { parameter_astnumRT = 19; parameter_nameRT = ((*Y*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
      (* = = = Object Declarations = = = *)
      NullDeclRT,
      (* = = = Procedure Body = = = *)
      (AssignRT (20, (IdentifierRT (21, ((*Y*) 10) , [])), (BinOpRT (22, Plus, (NameRT (23, (IdentifierRT (24, ((*X*) 9) , [])))), (LiteralRT (25, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
    ))
  ),
  (SeqDeclRT (26,
  (ObjDeclRT (27, { declaration_astnumRT = 28; object_nameRT = ((*R*) 13); object_nominal_subtypeRT = (Record_Type ((*RecordT*) 4)); initialization_expRT = None })),
  (SeqDeclRT (29,
  (ObjDeclRT (30, { declaration_astnumRT = 31; object_nameRT = ((*A*) 14); object_nominal_subtypeRT = (Array_Type ((*ArrayT*) 7)); initialization_expRT = None })),
  (SeqDeclRT (32,
  (ObjDeclRT (34, { declaration_astnumRT = 35; object_nameRT = ((*Result*) 15); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (33, (Integer_Literal 1) , [], [])))) })),
  (SeqDeclRT (36,
  (ObjDeclRT (39, { declaration_astnumRT = 40; object_nameRT = ((*T*) 16); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((NameRT (37, (IdentifierRT (38, ((*Result*) 15) , [])))))) })),
  (SeqDeclRT (41,
  (ObjDeclRT (42, { declaration_astnumRT = 43; object_nameRT = ((*T1*) 17); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (44, { declaration_astnumRT = 45; object_nameRT = ((*T2*) 18); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))))))))))))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (46,
  (AssignRT (47, (SelectedComponentRT (48, (IdentifierRT (49, ((*R*) 13) , [])), ((*X*) 5) , [])), (LiteralRT (51, (Integer_Literal 1) , [], [])))),
  (SeqRT (52,
  (AssignRT (53, (IndexedComponentRT (54, (IdentifierRT (55, ((*A*) 14) , [])), (LiteralRT (56, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (57, (Integer_Literal 1) , [], [])))),
  (SeqRT (58,
  (AssignRT (59, (IdentifierRT (60, ((*T1*) 17) , [])), (BinOpRT (61, Plus, (NameRT (62, (SelectedComponentRT (63, (IdentifierRT (64, ((*R*) 13) , [])), ((*X*) 5) , [])))), (NameRT (66, (IdentifierRT (67, ((*N*) 2) , [])))) , [OverflowCheck], [])))),
  (SeqRT (68,
  (AssignRT (69, (IdentifierRT (70, ((*T2*) 18) , [])), (BinOpRT (71, Plus, (NameRT (72, (IndexedComponentRT (73, (IdentifierRT (74, ((*A*) 14) , [])), (LiteralRT (75, (Integer_Literal 0) , [], [])) , [])))), (NameRT (76, (IdentifierRT (77, ((*T1*) 17) , [])))) , [OverflowCheck], [])))),
  (SeqRT (78,
  (AssignRT (79, (IdentifierRT (80, ((*T*) 16) , [])), (NameRT (81, (IdentifierRT (82, ((*T2*) 18) , [])))))),
  (SeqRT (83,
  (CallRT (84, 85, ((*Increase*) 8), 
    [(NameRT (86, (IdentifierRT (87, ((*T2*) 18) , [])))); (NameRT (88, (IdentifierRT (89, ((*T*) 16) , []))))])
  ),
  (SeqRT (90,
  (IfRT (91, (BinOpRT (92, Greater_Than, (NameRT (93, (IdentifierRT (94, ((*T*) 16) , [])))), (LiteralRT (95, (Integer_Literal 0) , [], [])) , [], [])),
    (AssignRT (96, (IdentifierRT (97, ((*T*) 16) , [])), (BinOpRT (98, Plus, (NameRT (99, (IdentifierRT (100, ((*T*) 16) , [])))), (LiteralRT (101, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    NullRT)
  ),
  (SeqRT (102,
  (IfRT (103, (BinOpRT (104, Greater_Than, (NameRT (105, (IdentifierRT (106, ((*T*) 16) , [])))), (LiteralRT (107, (Integer_Literal 1) , [], [])) , [], [])),
    (AssignRT (108, (IdentifierRT (109, ((*T*) 16) , [])), (BinOpRT (110, Plus, (NameRT (111, (IdentifierRT (112, ((*T*) 16) , [])))), (LiteralRT (113, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])))),
    (AssignRT (114, (IdentifierRT (115, ((*T*) 16) , [])), (BinOpRT (116, Minus, (NameRT (117, (IdentifierRT (118, ((*T*) 16) , [])))), (LiteralRT (119, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
  ),
  (SeqRT (120,
  (WhileRT (121, (BinOpRT (122, Greater_Than, (NameRT (123, (IdentifierRT (124, ((*T*) 16) , [])))), (LiteralRT (125, (Integer_Literal 0) , [], [])) , [], [])),
    (SeqRT (126,
    (AssignRT (127, (IdentifierRT (128, ((*Result*) 15) , [])), (BinOpRT (129, Divide, (BinOpRT (130, Multiply, (NameRT (131, (IdentifierRT (132, ((*Result*) 15) , [])))), (NameRT (133, (IdentifierRT (134, ((*T*) 16) , [])))) , [OverflowCheck], [])), (NameRT (135, (IdentifierRT (136, ((*N*) 2) , [])))) , [DivCheck; OverflowCheck], [])))),
    (AssignRT (137, (IdentifierRT (138, ((*T*) 16) , [])), (BinOpRT (139, Minus, (NameRT (140, (IdentifierRT (141, ((*T*) 16) , [])))), (LiteralRT (142, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))
  ),
  (AssignRT (143, (IdentifierRT (144, ((*M*) 3) , [])), (NameRT (145, (IdentifierRT (146, ((*Result*) 15) , []))))))))))))))))))))))))
))); (((*Increase*) 8), (1, mkprocBodyDeclRT (
 17,
  (* = = = Procedure Name = = = *)
  ((*Increase*) 8),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 18; parameter_nameRT = ((*X*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 19; parameter_nameRT = ((*Y*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (20, (IdentifierRT (21, ((*Y*) 10) , [])), (BinOpRT (22, Plus, (NameRT (23, (IdentifierRT (24, ((*X*) 9) , [])))), (LiteralRT (25, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*ArrayT*) 7), (ArrayTypeDeclRT (14, ((*ArrayT*) 7), ((*index subtype mark*) (Subtype ((*I*) 6))), ((*component type*) Integer)))); (((*I*) 6), (SubtypeDeclRT (11, ((*I*) 6), Integer, (RangeRT (0, 5))))); (((*RecordT*) 4), (RecordTypeDeclRT (7, ((*RecordT*) 4), [(((*X*) 5), Integer)])))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(146, Integer); (92, Boolean); (101, Integer); (110, Integer); (128, Integer); (119, Integer); (23, Integer); (95, Integer); (104, Boolean); (131, Integer); (122, Boolean); (77, Integer); (86, Integer); (140, Integer); (113, Integer); (50, Integer); (134, Integer); (62, Integer); (125, Integer); (80, Integer); (89, Integer); (116, Integer); (71, Integer); (98, Integer); (107, Integer); (74, (Array_Type ((*ArrayT*) 7))); (56, Integer); (38, Integer); (65, Integer); (142, Integer); (124, Integer); (133, Integer); (106, Integer); (115, Integer); (118, Integer); (136, Integer); (100, Integer); (109, Integer); (82, Integer); (145, Integer); (64, (Record_Type ((*RecordT*) 4))); (55, (Array_Type ((*ArrayT*) 7))); (73, Integer); (139, Integer); (67, Integer); (94, Integer); (49, (Record_Type ((*RecordT*) 4))); (130, Integer); (22, Integer); (76, Integer); (112, Integer); (97, Integer); (88, Integer); (70, Integer); (25, Integer); (61, Integer); (37, Integer); (129, Integer); (138, Integer); (60, Integer); (87, Integer); (132, Integer); (141, Integer); (105, Integer); (123, Integer); (63, Integer); (99, Integer); (54, Integer); (144, Integer); (72, Integer); (81, Integer); (135, Integer); (117, Integer); (57, Integer); (21, Integer); (48, Integer); (93, Integer); (75, Integer); (111, Integer); (66, Integer); (51, Integer); (24, Integer); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(146, { line = (*Line*)42; col = (*Col*)9; endline = (*EndLine*)42; endcol = (*EndCol*)14 }); (92, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (101, { line = (*Line*)29; col = (*Col*)16; endline = (*EndLine*)29; endcol = (*EndCol*)16 }); (110, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)16 }); (128, { line = (*Line*)39; col = (*Col*)7; endline = (*EndLine*)39; endcol = (*EndCol*)12 }); (119, { line = (*Line*)35; col = (*Col*)16; endline = (*EndLine*)35; endcol = (*EndCol*)16 }); (23, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (95, { line = (*Line*)28; col = (*Col*)11; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (104, { line = (*Line*)32; col = (*Col*)7; endline = (*EndLine*)32; endcol = (*EndCol*)11 }); (131, { line = (*Line*)39; col = (*Col*)18; endline = (*EndLine*)39; endcol = (*EndCol*)23 }); (122, { line = (*Line*)38; col = (*Col*)10; endline = (*EndLine*)38; endcol = (*EndCol*)14 }); (77, { line = (*Line*)25; col = (*Col*)17; endline = (*EndLine*)25; endcol = (*EndCol*)18 }); (86, { line = (*Line*)27; col = (*Col*)13; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (140, { line = (*Line*)40; col = (*Col*)12; endline = (*EndLine*)40; endcol = (*EndCol*)12 }); (113, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)16 }); (50, { line = (*Line*)22; col = (*Col*)6; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (134, { line = (*Line*)39; col = (*Col*)27; endline = (*EndLine*)39; endcol = (*EndCol*)27 }); (62, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (125, { line = (*Line*)38; col = (*Col*)14; endline = (*EndLine*)38; endcol = (*EndCol*)14 }); (80, { line = (*Line*)26; col = (*Col*)4; endline = (*EndLine*)26; endcol = (*EndCol*)4 }); (89, { line = (*Line*)27; col = (*Col*)17; endline = (*EndLine*)27; endcol = (*EndCol*)17 }); (116, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)16 }); (71, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)18 }); (98, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)16 }); (107, { line = (*Line*)32; col = (*Col*)11; endline = (*EndLine*)32; endcol = (*EndCol*)11 }); (74, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)10 }); (56, { line = (*Line*)23; col = (*Col*)6; endline = (*EndLine*)23; endcol = (*EndCol*)6 }); (38, { line = (*Line*)18; col = (*Col*)18; endline = (*EndLine*)18; endcol = (*EndCol*)23 }); (65, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (142, { line = (*Line*)40; col = (*Col*)16; endline = (*EndLine*)40; endcol = (*EndCol*)16 }); (124, { line = (*Line*)38; col = (*Col*)10; endline = (*EndLine*)38; endcol = (*EndCol*)10 }); (133, { line = (*Line*)39; col = (*Col*)27; endline = (*EndLine*)39; endcol = (*EndCol*)27 }); (106, { line = (*Line*)32; col = (*Col*)7; endline = (*EndLine*)32; endcol = (*EndCol*)7 }); (115, { line = (*Line*)35; col = (*Col*)7; endline = (*EndLine*)35; endcol = (*EndCol*)7 }); (118, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)12 }); (136, { line = (*Line*)39; col = (*Col*)32; endline = (*EndLine*)39; endcol = (*EndCol*)32 }); (100, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)12 }); (109, { line = (*Line*)33; col = (*Col*)7; endline = (*EndLine*)33; endcol = (*EndCol*)7 }); (82, { line = (*Line*)26; col = (*Col*)9; endline = (*EndLine*)26; endcol = (*EndCol*)10 }); (145, { line = (*Line*)42; col = (*Col*)9; endline = (*EndLine*)42; endcol = (*EndCol*)14 }); (64, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)10 }); (55, { line = (*Line*)23; col = (*Col*)4; endline = (*EndLine*)23; endcol = (*EndCol*)4 }); (73, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)13 }); (139, { line = (*Line*)40; col = (*Col*)12; endline = (*EndLine*)40; endcol = (*EndCol*)16 }); (67, { line = (*Line*)24; col = (*Col*)16; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (94, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (49, { line = (*Line*)22; col = (*Col*)4; endline = (*EndLine*)22; endcol = (*EndCol*)4 }); (130, { line = (*Line*)39; col = (*Col*)18; endline = (*EndLine*)39; endcol = (*EndCol*)27 }); (22, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)16 }); (76, { line = (*Line*)25; col = (*Col*)17; endline = (*EndLine*)25; endcol = (*EndCol*)18 }); (112, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)12 }); (97, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)7 }); (88, { line = (*Line*)27; col = (*Col*)17; endline = (*EndLine*)27; endcol = (*EndCol*)17 }); (70, { line = (*Line*)25; col = (*Col*)4; endline = (*EndLine*)25; endcol = (*EndCol*)5 }); (25, { line = (*Line*)11; col = (*Col*)16; endline = (*EndLine*)11; endcol = (*EndCol*)16 }); (61, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (37, { line = (*Line*)18; col = (*Col*)18; endline = (*EndLine*)18; endcol = (*EndCol*)23 }); (129, { line = (*Line*)39; col = (*Col*)17; endline = (*EndLine*)39; endcol = (*EndCol*)32 }); (138, { line = (*Line*)40; col = (*Col*)7; endline = (*EndLine*)40; endcol = (*EndCol*)7 }); (60, { line = (*Line*)24; col = (*Col*)4; endline = (*EndLine*)24; endcol = (*EndCol*)5 }); (87, { line = (*Line*)27; col = (*Col*)13; endline = (*EndLine*)27; endcol = (*EndCol*)14 }); (132, { line = (*Line*)39; col = (*Col*)18; endline = (*EndLine*)39; endcol = (*EndCol*)23 }); (141, { line = (*Line*)40; col = (*Col*)12; endline = (*EndLine*)40; endcol = (*EndCol*)12 }); (105, { line = (*Line*)32; col = (*Col*)7; endline = (*EndLine*)32; endcol = (*EndCol*)7 }); (123, { line = (*Line*)38; col = (*Col*)10; endline = (*EndLine*)38; endcol = (*EndCol*)10 }); (63, { line = (*Line*)24; col = (*Col*)10; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (99, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)12 }); (54, { line = (*Line*)23; col = (*Col*)4; endline = (*EndLine*)23; endcol = (*EndCol*)7 }); (144, { line = (*Line*)42; col = (*Col*)4; endline = (*EndLine*)42; endcol = (*EndCol*)4 }); (72, { line = (*Line*)25; col = (*Col*)10; endline = (*EndLine*)25; endcol = (*EndCol*)13 }); (81, { line = (*Line*)26; col = (*Col*)9; endline = (*EndLine*)26; endcol = (*EndCol*)10 }); (135, { line = (*Line*)39; col = (*Col*)32; endline = (*EndLine*)39; endcol = (*EndCol*)32 }); (117, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)12 }); (57, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)12 }); (21, { line = (*Line*)11; col = (*Col*)7; endline = (*EndLine*)11; endcol = (*EndCol*)7 }); (48, { line = (*Line*)22; col = (*Col*)4; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (93, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (75, { line = (*Line*)25; col = (*Col*)12; endline = (*EndLine*)25; endcol = (*EndCol*)12 }); (111, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)12 }); (66, { line = (*Line*)24; col = (*Col*)16; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (51, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)11 }); (24, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (33, { line = (*Line*)17; col = (*Col*)23; endline = (*EndLine*)17; endcol = (*EndCol*)23 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("T1", "ada://variable/Test+1:11/T1+19:4")); (2, ("N", "ada://parameter/Test+1:11/N+1:17")); (14, ("A", "ada://variable/Test+1:11/A+15:4")); (5, ("X", "ada://component/Test+1:11/RecordT+3:9/X+4:7")); (13, ("R", "ada://variable/Test+1:11/R+14:4")); (16, ("T", "ada://variable/Test+1:11/T+18:4")); (10, ("Y", "ada://parameter/Test+1:11/Increase+9:14/Y+9:35")); (18, ("T2", "ada://variable/Test+1:11/T2+20:4")); (9, ("X", "ada://parameter/Test+1:11/Increase+9:14/X+9:23")); (3, ("M", "ada://parameter/Test+1:11/M+1:30")); (15, ("Result", "ada://variable/Test+1:11/Result+17:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(8, ("Increase", "ada://procedure_body/Test+1:11/Increase+9:14")); (1, ("Test", "ada://procedure_body/Test+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("RecordT", "ada://ordinary_type/Test+1:11/RecordT+3:9")); (7, ("ArrayT", "ada://ordinary_type/Test+1:11/ArrayT+7:9")); (6, ("I", "ada://subtype/Test+1:11/I+6:12"))]
})
}


