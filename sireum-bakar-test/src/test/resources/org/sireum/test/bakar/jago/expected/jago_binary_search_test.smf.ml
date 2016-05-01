

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Binary_Search_Test*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*I*) 2); parameter_subtype_mark = Integer; parameter_mode = In }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (4,
  (TypeDecl (5, (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))),
  (SeqDecl (7,
  (TypeDecl (8, (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10)))))),
  (SeqDecl (10,
  (TypeDecl (11, (ArrayTypeDecl (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
  (SeqDecl (13,
  (ObjDecl (14, { declaration_astnum = 15; object_name = ((*A*) 6); object_nominal_subtype = (Array_Type ((*Ar*) 5)); initialization_exp = None })),
  (SeqDecl (16,
  (ObjDecl (17, { declaration_astnum = 18; object_name = ((*R*) 7); object_nominal_subtype = (Integer_Type ((*T*) 3)); initialization_exp = None })),
  (SeqDecl (19,
  (TypeDecl (20, (DerivedTypeDecl (21, ((*T1*) 8), Integer, (Range (1, 10)))))),
  (SeqDecl (22,
  (TypeDecl (23, (DerivedTypeDecl (24, ((*T2*) 9), (Integer_Type ((*T*) 3)), (Range (2, 5)))))),
  (SeqDecl (25,
  (TypeDecl (26, (SubtypeDecl (27, ((*T3*) 10), Integer, (Range (1, 10)))))),
  (SeqDecl (28,
  (TypeDecl (29, (SubtypeDecl (30, ((*T4*) 11), Integer, (Range (5, 10)))))),
  (SeqDecl (31,
  (TypeDecl (32, (RecordTypeDecl (33, ((*RT*) 12), [(((*X*) 13), Integer); (((*Y*) 14), Integer)])))),
  (SeqDecl (35,
  (ProcBodyDecl (36, 
    mkprocBodyDecl (
     37,
      (* = = = Procedure Name = = = *)
      ((*increase*) 15),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnum = 38; parameter_name = ((*X*) 16); parameter_subtype_mark = Integer; parameter_mode = In }; 
    { parameter_astnum = 39; parameter_name = ((*Y*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
      (* = = = Object Declarations = = = *)
      [NullDecl],
      (* = = = Procedure Body = = = *)
      (Assign (40, (Identifier (41, ((*Y*) 17) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 16) )))), (Literal (45, (Integer_Literal 1) )) ))))
    ))
  ),
  (SeqDecl (46,
  (ObjDecl (48, { declaration_astnum = 49; object_name = ((*B*) 21); object_nominal_subtype = Boolean; initialization_exp = (Some ((Literal (47, (Boolean_Literal true) )))) })),
  (SeqDecl (50,
  (ProcBodyDecl (51, 
    mkprocBodyDecl (
     52,
      (* = = = Procedure Name = = = *)
      ((*Search*) 22),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnum = 53; parameter_name = ((*A*) 23); parameter_subtype_mark = (Array_Type ((*Ar*) 5)); parameter_mode = In }; 
    { parameter_astnum = 54; parameter_name = ((*I*) 24); parameter_subtype_mark = Integer; parameter_mode = In }; 
    { parameter_astnum = 55; parameter_name = ((*R*) 25); parameter_subtype_mark = (Integer_Type ((*T*) 3)); parameter_mode = Out }],
      (* = = = Object Declarations = = = *)
      [(SeqDecl (56,
    (ObjDecl (57, { declaration_astnum = 58; object_name = ((*Left*) 26); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None })),
    (SeqDecl (59,
    (ObjDecl (60, { declaration_astnum = 61; object_name = ((*Right*) 27); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None })),
    (ObjDecl (62, { declaration_astnum = 63; object_name = ((*Med*) 28); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None }))))))],
      (* = = = Procedure Body = = = *)
      (Seq (64,
      (Assign (65, (Identifier (66, ((*Left*) 26) )), (Literal (67, (Integer_Literal 0) )))),
      (Seq (68,
      (Assign (69, (Identifier (70, ((*Right*) 27) )), (Literal (71, (Integer_Literal 10) )))),
      (Seq (72,
      (Assign (73, (Identifier (74, ((*R*) 25) )), (Literal (75, (Integer_Literal 0) )))),
      (Seq (76,
      (If (77, (BinOp (78, Or, (BinOp (79, Greater_Than, (Name (80, (IndexedComponent (81, (Identifier (82, ((*A*) 23) )), (BinOp (83, Plus, (Name (84, (Identifier (85, ((*Left*) 26) )))), (Literal (86, (Integer_Literal 1) )) )) )))), (Name (87, (Identifier (88, ((*I*) 24) )))) )), (BinOp (89, Less_Than, (Name (90, (IndexedComponent (91, (Identifier (92, ((*A*) 23) )), (Name (93, (Identifier (94, ((*Right*) 27) )))) )))), (Name (95, (Identifier (96, ((*I*) 24) )))) )) )),
        (Assign (97, (Identifier (98, ((*R*) 25) )), (Literal (99, (Integer_Literal 0) )))),
        Null)
      ),
      (While (100, (BinOp (101, Less_Than_Or_Equal, (Name (102, (Identifier (103, ((*Left*) 26) )))), (Name (104, (Identifier (105, ((*Right*) 27) )))) )),
        (Seq (106,
        (Assign (107, (Identifier (108, ((*Med*) 28) )), (BinOp (109, Plus, (Name (110, (Identifier (111, ((*Left*) 26) )))), (BinOp (112, Divide, (BinOp (113, Minus, (Name (114, (Identifier (115, ((*Right*) 27) )))), (Name (116, (Identifier (117, ((*Left*) 26) )))) )), (Literal (118, (Integer_Literal 2) )) )) )))),
        (If (119, (BinOp (120, Less_Than, (Name (121, (IndexedComponent (122, (Identifier (123, ((*A*) 23) )), (Name (124, (Identifier (125, ((*Med*) 28) )))) )))), (Name (126, (Identifier (127, ((*I*) 24) )))) )),
          (Assign (128, (Identifier (129, ((*Left*) 26) )), (BinOp (130, Plus, (Name (131, (Identifier (132, ((*Med*) 28) )))), (Literal (133, (Integer_Literal 1) )) )))),
          (If (134, (BinOp (135, Greater_Than, (Name (136, (IndexedComponent (137, (Identifier (138, ((*A*) 23) )), (Name (139, (Identifier (140, ((*Med*) 28) )))) )))), (Name (141, (Identifier (142, ((*I*) 24) )))) )),
            (Assign (143, (Identifier (144, ((*Right*) 27) )), (BinOp (145, Minus, (Name (146, (Identifier (147, ((*Med*) 28) )))), (Literal (148, (Integer_Literal 1) )) )))),
            (Assign (149, (Identifier (150, ((*R*) 25) )), (Name (151, (Identifier (152, ((*Med*) 28) )))))))
          ))
        ))))
      )))))))))
    ))
  ),
  (SeqDecl (153,
  (ObjDecl (155, { declaration_astnum = 156; object_name = ((*X1*) 29); object_nominal_subtype = (Derived_Type ((*T1*) 8)); initialization_exp = (Some ((Literal (154, (Integer_Literal 2) )))) })),
  (SeqDecl (157,
  (ObjDecl (159, { declaration_astnum = 160; object_name = ((*X2*) 30); object_nominal_subtype = (Derived_Type ((*T2*) 9)); initialization_exp = (Some ((Literal (158, (Integer_Literal 3) )))) })),
  (SeqDecl (161,
  (ObjDecl (163, { declaration_astnum = 164; object_name = ((*X3*) 31); object_nominal_subtype = (Subtype ((*T3*) 10)); initialization_exp = (Some ((Literal (162, (Integer_Literal 4) )))) })),
  (ObjDecl (166, { declaration_astnum = 167; object_name = ((*X4*) 32); object_nominal_subtype = (Subtype ((*T4*) 11)); initialization_exp = (Some ((Literal (165, (Integer_Literal 6) )))) }))))))))))))))))))))))))))))))))))],
    (* = = = Procedure Body = = = *)
    (Seq (168,
    (Call (169, 170, ((*increase*) 15), 
      [(Literal (171, (Integer_Literal 10) )); (Name (172, (Identifier (173, ((*X4*) 32) ))))])
    ),
    (Seq (174,
    (Assign (175, (Identifier (176, ((*X1*) 29) )), (BinOp (177, Plus, (Name (178, (Identifier (179, ((*X1*) 29) )))), (Literal (180, (Integer_Literal 1) )) )))),
    (Seq (181,
    (Assign (182, (Identifier (183, ((*X2*) 30) )), (BinOp (184, Plus, (Name (185, (Identifier (186, ((*X2*) 30) )))), (Literal (187, (Integer_Literal 2) )) )))),
    (Seq (188,
    (Assign (189, (Identifier (190, ((*X4*) 32) )), (BinOp (191, Plus, (Name (192, (Identifier (193, ((*X3*) 31) )))), (Name (194, (Identifier (195, ((*X4*) 32) )))) )))),
    (Seq (196,
    (Assign (197, (IndexedComponent (198, (Identifier (199, ((*A*) 6) )), (Literal (200, (Integer_Literal 0) )) )), (Literal (201, (Integer_Literal 0) )))),
    (Seq (202,
    (Assign (203, (IndexedComponent (204, (Identifier (205, ((*A*) 6) )), (Literal (206, (Integer_Literal 1) )) )), (Literal (207, (Integer_Literal 10) )))),
    (Call (208, 209, ((*Search*) 22), 
      [(Name (210, (Identifier (211, ((*A*) 6) )))); (Name (212, (Identifier (213, ((*I*) 2) )))); (Name (214, (Identifier (215, ((*R*) 7) ))))])
    )))))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X3*) 31), (In_Out, (Subtype ((*T3*) 10)))); (((*R*) 25), (Out, (Integer_Type ((*T*) 3)))); (((*R*) 7), (In_Out, (Integer_Type ((*T*) 3)))); (((*X1*) 29), (In_Out, (Derived_Type ((*T1*) 8)))); (((*I*) 24), (In, Integer)); (((*X*) 16), (In, Integer)); (((*B*) 21), (In_Out, Boolean)); (((*X4*) 32), (In_Out, (Subtype ((*T4*) 11)))); (((*I*) 2), (In, Integer)); (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))); (((*Left*) 26), (In_Out, (Subtype ((*U*) 4)))); (((*Right*) 27), (In_Out, (Subtype ((*U*) 4)))); (((*Med*) 28), (In_Out, (Subtype ((*U*) 4)))); (((*X2*) 30), (In_Out, (Derived_Type ((*T2*) 9)))); (((*Y*) 17), (Out, Integer)); (((*A*) 23), (In, (Array_Type ((*Ar*) 5))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Search*) 22), (1, mkprocBodyDecl (
 52,
  (* = = = Procedure Name = = = *)
  ((*Search*) 22),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 53; parameter_name = ((*A*) 23); parameter_subtype_mark = (Array_Type ((*Ar*) 5)); parameter_mode = In }; 
{ parameter_astnum = 54; parameter_name = ((*I*) 24); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 55; parameter_name = ((*R*) 25); parameter_subtype_mark = (Integer_Type ((*T*) 3)); parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (56,
(ObjDecl (57, { declaration_astnum = 58; object_name = ((*Left*) 26); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None })),
(SeqDecl (59,
(ObjDecl (60, { declaration_astnum = 61; object_name = ((*Right*) 27); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None })),
(ObjDecl (62, { declaration_astnum = 63; object_name = ((*Med*) 28); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None }))))))],
  (* = = = Procedure Body = = = *)
  (Seq (64,
  (Assign (65, (Identifier (66, ((*Left*) 26) )), (Literal (67, (Integer_Literal 0) )))),
  (Seq (68,
  (Assign (69, (Identifier (70, ((*Right*) 27) )), (Literal (71, (Integer_Literal 10) )))),
  (Seq (72,
  (Assign (73, (Identifier (74, ((*R*) 25) )), (Literal (75, (Integer_Literal 0) )))),
  (Seq (76,
  (If (77, (BinOp (78, Or, (BinOp (79, Greater_Than, (Name (80, (IndexedComponent (81, (Identifier (82, ((*A*) 23) )), (BinOp (83, Plus, (Name (84, (Identifier (85, ((*Left*) 26) )))), (Literal (86, (Integer_Literal 1) )) )) )))), (Name (87, (Identifier (88, ((*I*) 24) )))) )), (BinOp (89, Less_Than, (Name (90, (IndexedComponent (91, (Identifier (92, ((*A*) 23) )), (Name (93, (Identifier (94, ((*Right*) 27) )))) )))), (Name (95, (Identifier (96, ((*I*) 24) )))) )) )),
    (Assign (97, (Identifier (98, ((*R*) 25) )), (Literal (99, (Integer_Literal 0) )))),
    Null)
  ),
  (While (100, (BinOp (101, Less_Than_Or_Equal, (Name (102, (Identifier (103, ((*Left*) 26) )))), (Name (104, (Identifier (105, ((*Right*) 27) )))) )),
    (Seq (106,
    (Assign (107, (Identifier (108, ((*Med*) 28) )), (BinOp (109, Plus, (Name (110, (Identifier (111, ((*Left*) 26) )))), (BinOp (112, Divide, (BinOp (113, Minus, (Name (114, (Identifier (115, ((*Right*) 27) )))), (Name (116, (Identifier (117, ((*Left*) 26) )))) )), (Literal (118, (Integer_Literal 2) )) )) )))),
    (If (119, (BinOp (120, Less_Than, (Name (121, (IndexedComponent (122, (Identifier (123, ((*A*) 23) )), (Name (124, (Identifier (125, ((*Med*) 28) )))) )))), (Name (126, (Identifier (127, ((*I*) 24) )))) )),
      (Assign (128, (Identifier (129, ((*Left*) 26) )), (BinOp (130, Plus, (Name (131, (Identifier (132, ((*Med*) 28) )))), (Literal (133, (Integer_Literal 1) )) )))),
      (If (134, (BinOp (135, Greater_Than, (Name (136, (IndexedComponent (137, (Identifier (138, ((*A*) 23) )), (Name (139, (Identifier (140, ((*Med*) 28) )))) )))), (Name (141, (Identifier (142, ((*I*) 24) )))) )),
        (Assign (143, (Identifier (144, ((*Right*) 27) )), (BinOp (145, Minus, (Name (146, (Identifier (147, ((*Med*) 28) )))), (Literal (148, (Integer_Literal 1) )) )))),
        (Assign (149, (Identifier (150, ((*R*) 25) )), (Name (151, (Identifier (152, ((*Med*) 28) )))))))
      ))
    ))))
  )))))))))
))); (((*Binary_Search_Test*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Binary_Search_Test*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*I*) 2); parameter_subtype_mark = Integer; parameter_mode = In }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (4,
(TypeDecl (5, (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))),
(SeqDecl (7,
(TypeDecl (8, (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10)))))),
(SeqDecl (10,
(TypeDecl (11, (ArrayTypeDecl (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
(SeqDecl (13,
(ObjDecl (14, { declaration_astnum = 15; object_name = ((*A*) 6); object_nominal_subtype = (Array_Type ((*Ar*) 5)); initialization_exp = None })),
(SeqDecl (16,
(ObjDecl (17, { declaration_astnum = 18; object_name = ((*R*) 7); object_nominal_subtype = (Integer_Type ((*T*) 3)); initialization_exp = None })),
(SeqDecl (19,
(TypeDecl (20, (DerivedTypeDecl (21, ((*T1*) 8), Integer, (Range (1, 10)))))),
(SeqDecl (22,
(TypeDecl (23, (DerivedTypeDecl (24, ((*T2*) 9), (Integer_Type ((*T*) 3)), (Range (2, 5)))))),
(SeqDecl (25,
(TypeDecl (26, (SubtypeDecl (27, ((*T3*) 10), Integer, (Range (1, 10)))))),
(SeqDecl (28,
(TypeDecl (29, (SubtypeDecl (30, ((*T4*) 11), Integer, (Range (5, 10)))))),
(SeqDecl (31,
(TypeDecl (32, (RecordTypeDecl (33, ((*RT*) 12), [(((*X*) 13), Integer); (((*Y*) 14), Integer)])))),
(SeqDecl (35,
(ProcBodyDecl (36, 
  mkprocBodyDecl (
   37,
    (* = = = Procedure Name = = = *)
    ((*increase*) 15),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 38; parameter_name = ((*X*) 16); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 39; parameter_name = ((*Y*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [NullDecl],
    (* = = = Procedure Body = = = *)
    (Assign (40, (Identifier (41, ((*Y*) 17) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 16) )))), (Literal (45, (Integer_Literal 1) )) ))))
  ))
),
(SeqDecl (46,
(ObjDecl (48, { declaration_astnum = 49; object_name = ((*B*) 21); object_nominal_subtype = Boolean; initialization_exp = (Some ((Literal (47, (Boolean_Literal true) )))) })),
(SeqDecl (50,
(ProcBodyDecl (51, 
  mkprocBodyDecl (
   52,
    (* = = = Procedure Name = = = *)
    ((*Search*) 22),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 53; parameter_name = ((*A*) 23); parameter_subtype_mark = (Array_Type ((*Ar*) 5)); parameter_mode = In }; 
  { parameter_astnum = 54; parameter_name = ((*I*) 24); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 55; parameter_name = ((*R*) 25); parameter_subtype_mark = (Integer_Type ((*T*) 3)); parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (56,
  (ObjDecl (57, { declaration_astnum = 58; object_name = ((*Left*) 26); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None })),
  (SeqDecl (59,
  (ObjDecl (60, { declaration_astnum = 61; object_name = ((*Right*) 27); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None })),
  (ObjDecl (62, { declaration_astnum = 63; object_name = ((*Med*) 28); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None }))))))],
    (* = = = Procedure Body = = = *)
    (Seq (64,
    (Assign (65, (Identifier (66, ((*Left*) 26) )), (Literal (67, (Integer_Literal 0) )))),
    (Seq (68,
    (Assign (69, (Identifier (70, ((*Right*) 27) )), (Literal (71, (Integer_Literal 10) )))),
    (Seq (72,
    (Assign (73, (Identifier (74, ((*R*) 25) )), (Literal (75, (Integer_Literal 0) )))),
    (Seq (76,
    (If (77, (BinOp (78, Or, (BinOp (79, Greater_Than, (Name (80, (IndexedComponent (81, (Identifier (82, ((*A*) 23) )), (BinOp (83, Plus, (Name (84, (Identifier (85, ((*Left*) 26) )))), (Literal (86, (Integer_Literal 1) )) )) )))), (Name (87, (Identifier (88, ((*I*) 24) )))) )), (BinOp (89, Less_Than, (Name (90, (IndexedComponent (91, (Identifier (92, ((*A*) 23) )), (Name (93, (Identifier (94, ((*Right*) 27) )))) )))), (Name (95, (Identifier (96, ((*I*) 24) )))) )) )),
      (Assign (97, (Identifier (98, ((*R*) 25) )), (Literal (99, (Integer_Literal 0) )))),
      Null)
    ),
    (While (100, (BinOp (101, Less_Than_Or_Equal, (Name (102, (Identifier (103, ((*Left*) 26) )))), (Name (104, (Identifier (105, ((*Right*) 27) )))) )),
      (Seq (106,
      (Assign (107, (Identifier (108, ((*Med*) 28) )), (BinOp (109, Plus, (Name (110, (Identifier (111, ((*Left*) 26) )))), (BinOp (112, Divide, (BinOp (113, Minus, (Name (114, (Identifier (115, ((*Right*) 27) )))), (Name (116, (Identifier (117, ((*Left*) 26) )))) )), (Literal (118, (Integer_Literal 2) )) )) )))),
      (If (119, (BinOp (120, Less_Than, (Name (121, (IndexedComponent (122, (Identifier (123, ((*A*) 23) )), (Name (124, (Identifier (125, ((*Med*) 28) )))) )))), (Name (126, (Identifier (127, ((*I*) 24) )))) )),
        (Assign (128, (Identifier (129, ((*Left*) 26) )), (BinOp (130, Plus, (Name (131, (Identifier (132, ((*Med*) 28) )))), (Literal (133, (Integer_Literal 1) )) )))),
        (If (134, (BinOp (135, Greater_Than, (Name (136, (IndexedComponent (137, (Identifier (138, ((*A*) 23) )), (Name (139, (Identifier (140, ((*Med*) 28) )))) )))), (Name (141, (Identifier (142, ((*I*) 24) )))) )),
          (Assign (143, (Identifier (144, ((*Right*) 27) )), (BinOp (145, Minus, (Name (146, (Identifier (147, ((*Med*) 28) )))), (Literal (148, (Integer_Literal 1) )) )))),
          (Assign (149, (Identifier (150, ((*R*) 25) )), (Name (151, (Identifier (152, ((*Med*) 28) )))))))
        ))
      ))))
    )))))))))
  ))
),
(SeqDecl (153,
(ObjDecl (155, { declaration_astnum = 156; object_name = ((*X1*) 29); object_nominal_subtype = (Derived_Type ((*T1*) 8)); initialization_exp = (Some ((Literal (154, (Integer_Literal 2) )))) })),
(SeqDecl (157,
(ObjDecl (159, { declaration_astnum = 160; object_name = ((*X2*) 30); object_nominal_subtype = (Derived_Type ((*T2*) 9)); initialization_exp = (Some ((Literal (158, (Integer_Literal 3) )))) })),
(SeqDecl (161,
(ObjDecl (163, { declaration_astnum = 164; object_name = ((*X3*) 31); object_nominal_subtype = (Subtype ((*T3*) 10)); initialization_exp = (Some ((Literal (162, (Integer_Literal 4) )))) })),
(ObjDecl (166, { declaration_astnum = 167; object_name = ((*X4*) 32); object_nominal_subtype = (Subtype ((*T4*) 11)); initialization_exp = (Some ((Literal (165, (Integer_Literal 6) )))) }))))))))))))))))))))))))))))))))))],
  (* = = = Procedure Body = = = *)
  (Seq (168,
  (Call (169, 170, ((*increase*) 15), 
    [(Literal (171, (Integer_Literal 10) )); (Name (172, (Identifier (173, ((*X4*) 32) ))))])
  ),
  (Seq (174,
  (Assign (175, (Identifier (176, ((*X1*) 29) )), (BinOp (177, Plus, (Name (178, (Identifier (179, ((*X1*) 29) )))), (Literal (180, (Integer_Literal 1) )) )))),
  (Seq (181,
  (Assign (182, (Identifier (183, ((*X2*) 30) )), (BinOp (184, Plus, (Name (185, (Identifier (186, ((*X2*) 30) )))), (Literal (187, (Integer_Literal 2) )) )))),
  (Seq (188,
  (Assign (189, (Identifier (190, ((*X4*) 32) )), (BinOp (191, Plus, (Name (192, (Identifier (193, ((*X3*) 31) )))), (Name (194, (Identifier (195, ((*X4*) 32) )))) )))),
  (Seq (196,
  (Assign (197, (IndexedComponent (198, (Identifier (199, ((*A*) 6) )), (Literal (200, (Integer_Literal 0) )) )), (Literal (201, (Integer_Literal 0) )))),
  (Seq (202,
  (Assign (203, (IndexedComponent (204, (Identifier (205, ((*A*) 6) )), (Literal (206, (Integer_Literal 1) )) )), (Literal (207, (Integer_Literal 10) )))),
  (Call (208, 209, ((*Search*) 22), 
    [(Name (210, (Identifier (211, ((*A*) 6) )))); (Name (212, (Identifier (213, ((*I*) 2) )))); (Name (214, (Identifier (215, ((*R*) 7) ))))])
  )))))))))))))
))); (((*increase*) 15), (1, mkprocBodyDecl (
 37,
  (* = = = Procedure Name = = = *)
  ((*increase*) 15),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 38; parameter_name = ((*X*) 16); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 39; parameter_name = ((*Y*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [NullDecl],
  (* = = = Procedure Body = = = *)
  (Assign (40, (Identifier (41, ((*Y*) 17) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 16) )))), (Literal (45, (Integer_Literal 1) )) ))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*RT*) 12), (RecordTypeDecl (33, ((*RT*) 12), [(((*X*) 13), Integer); (((*Y*) 14), Integer)]))); (((*T3*) 10), (SubtypeDecl (27, ((*T3*) 10), Integer, (Range (1, 10))))); (((*Ar*) 5), (ArrayTypeDecl (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer)))); (((*T4*) 11), (SubtypeDecl (30, ((*T4*) 11), Integer, (Range (5, 10))))); (((*T2*) 9), (DerivedTypeDecl (24, ((*T2*) 9), (Integer_Type ((*T*) 3)), (Range (2, 5))))); (((*T1*) 8), (DerivedTypeDecl (21, ((*T1*) 8), Integer, (Range (1, 10))))); (((*U*) 4), (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10))))); (((*T*) 3), (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(137, Integer); (146, (Subtype ((*U*) 4))); (92, (Array_Type ((*Ar*) 5))); (200, Integer); (101, Boolean); (173, (Subtype ((*T4*) 11))); (191, Integer); (83, (Integer_Type ((*T*) 3))); (110, (Subtype ((*U*) 4))); (104, (Subtype ((*U*) 4))); (95, Integer); (131, (Subtype ((*U*) 4))); (122, Integer); (194, (Subtype ((*T4*) 11))); (176, (Derived_Type ((*T1*) 8))); (86, Integer); (158, Integer); (185, (Derived_Type ((*T2*) 9))); (113, (Integer_Type ((*T*) 3))); (41, Integer); (140, (Subtype ((*U*) 4))); (44, Integer); (125, (Subtype ((*U*) 4))); (80, Integer); (89, Boolean); (116, (Subtype ((*U*) 4))); (98, (Integer_Type ((*T*) 3))); (71, Integer); (74, (Integer_Type ((*T*) 3))); (47, Boolean); (193, (Subtype ((*T3*) 10))); (184, (Derived_Type ((*T2*) 9))); (211, (Array_Type ((*Ar*) 5))); (142, Integer); (151, (Subtype ((*U*) 4))); (124, (Subtype ((*U*) 4))); (205, (Array_Type ((*Ar*) 5))); (133, Integer); (214, (Integer_Type ((*T*) 3))); (178, (Derived_Type ((*T1*) 8))); (115, (Subtype ((*U*) 4))); (187, Integer); (172, (Subtype ((*T4*) 11))); (118, Integer); (127, Integer); (199, (Array_Type ((*Ar*) 5))); (136, Integer); (109, (Integer_Type ((*T*) 3))); (91, Integer); (82, (Array_Type ((*Ar*) 5))); (190, (Subtype ((*T4*) 11))); (145, (Integer_Type ((*T*) 3))); (154, Integer); (94, (Subtype ((*U*) 4))); (67, Integer); (85, (Subtype ((*U*) 4))); (139, (Subtype ((*U*) 4))); (130, (Integer_Type ((*T*) 3))); (121, Integer); (148, Integer); (103, (Subtype ((*U*) 4))); (112, (Integer_Type ((*T*) 3))); (79, Boolean); (88, Integer); (70, (Subtype ((*U*) 4))); (43, Integer); (180, Integer); (207, Integer); (198, Integer); (147, (Subtype ((*U*) 4))); (183, (Derived_Type ((*T2*) 9))); (129, (Subtype ((*U*) 4))); (210, (Array_Type ((*Ar*) 5))); (138, (Array_Type ((*Ar*) 5))); (120, Boolean); (165, Integer); (192, (Subtype ((*T3*) 10))); (201, Integer); (213, Integer); (186, (Derived_Type ((*T2*) 9))); (87, Integer); (96, Integer); (177, (Derived_Type ((*T1*) 8))); (132, (Subtype ((*U*) 4))); (150, (Integer_Type ((*T*) 3))); (141, Integer); (105, (Subtype ((*U*) 4))); (114, (Subtype ((*U*) 4))); (123, (Array_Type ((*Ar*) 5))); (204, Integer); (195, (Subtype ((*T4*) 11))); (78, Boolean); (99, Integer); (90, Integer); (45, Integer); (171, Integer); (81, Integer); (144, (Subtype ((*U*) 4))); (126, Integer); (162, Integer); (108, (Subtype ((*U*) 4))); (135, Boolean); (117, (Subtype ((*U*) 4))); (84, (Subtype ((*U*) 4))); (102, (Subtype ((*U*) 4))); (93, (Subtype ((*U*) 4))); (75, Integer); (111, (Subtype ((*U*) 4))); (66, (Subtype ((*U*) 4))); (42, Integer); (212, Integer); (152, (Subtype ((*U*) 4))); (179, (Derived_Type ((*T1*) 8))); (215, (Integer_Type ((*T*) 3))); (206, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(137, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)15 }); (146, { line = (*Line*)47; col = (*Col*)18; endline = (*EndLine*)47; endcol = (*EndCol*)20 }); (92, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)28 }); (200, { line = (*Line*)67; col = (*Col*)6; endline = (*EndLine*)67; endcol = (*EndCol*)6 }); (101, { line = (*Line*)41; col = (*Col*)13; endline = (*EndLine*)41; endcol = (*EndCol*)25 }); (173, { line = (*Line*)62; col = (*Col*)17; endline = (*EndLine*)62; endcol = (*EndCol*)18 }); (191, { line = (*Line*)65; col = (*Col*)10; endline = (*EndLine*)65; endcol = (*EndCol*)16 }); (83, { line = (*Line*)37; col = (*Col*)13; endline = (*EndLine*)37; endcol = (*EndCol*)18 }); (110, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)13 }); (104, { line = (*Line*)41; col = (*Col*)21; endline = (*EndLine*)41; endcol = (*EndCol*)25 }); (95, { line = (*Line*)37; col = (*Col*)40; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (131, { line = (*Line*)44; col = (*Col*)14; endline = (*EndLine*)44; endcol = (*EndCol*)16 }); (122, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)12 }); (194, { line = (*Line*)65; col = (*Col*)15; endline = (*EndLine*)65; endcol = (*EndCol*)16 }); (176, { line = (*Line*)63; col = (*Col*)4; endline = (*EndLine*)63; endcol = (*EndCol*)5 }); (86, { line = (*Line*)37; col = (*Col*)18; endline = (*EndLine*)37; endcol = (*EndCol*)18 }); (158, { line = (*Line*)57; col = (*Col*)14; endline = (*EndLine*)57; endcol = (*EndCol*)14 }); (185, { line = (*Line*)64; col = (*Col*)10; endline = (*EndLine*)64; endcol = (*EndCol*)11 }); (113, { line = (*Line*)42; col = (*Col*)18; endline = (*EndLine*)42; endcol = (*EndCol*)29 }); (41, { line = (*Line*)23; col = (*Col*)7; endline = (*EndLine*)23; endcol = (*EndCol*)7 }); (140, { line = (*Line*)46; col = (*Col*)12; endline = (*EndLine*)46; endcol = (*EndCol*)14 }); (44, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)12 }); (125, { line = (*Line*)43; col = (*Col*)9; endline = (*EndLine*)43; endcol = (*EndCol*)11 }); (80, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)19 }); (89, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (116, { line = (*Line*)42; col = (*Col*)26; endline = (*EndLine*)42; endcol = (*EndCol*)29 }); (98, { line = (*Line*)38; col = (*Col*)3; endline = (*EndLine*)38; endcol = (*EndCol*)3 }); (71, { line = (*Line*)34; col = (*Col*)16; endline = (*EndLine*)34; endcol = (*EndCol*)17 }); (74, { line = (*Line*)36; col = (*Col*)7; endline = (*EndLine*)36; endcol = (*EndCol*)7 }); (47, { line = (*Line*)25; col = (*Col*)18; endline = (*EndLine*)25; endcol = (*EndCol*)21 }); (193, { line = (*Line*)65; col = (*Col*)10; endline = (*EndLine*)65; endcol = (*EndCol*)11 }); (184, { line = (*Line*)64; col = (*Col*)10; endline = (*EndLine*)64; endcol = (*EndCol*)15 }); (211, { line = (*Line*)69; col = (*Col*)11; endline = (*EndLine*)69; endcol = (*EndCol*)11 }); (142, { line = (*Line*)46; col = (*Col*)19; endline = (*EndLine*)46; endcol = (*EndCol*)19 }); (151, { line = (*Line*)49; col = (*Col*)14; endline = (*EndLine*)49; endcol = (*EndCol*)16 }); (124, { line = (*Line*)43; col = (*Col*)9; endline = (*EndLine*)43; endcol = (*EndCol*)11 }); (205, { line = (*Line*)68; col = (*Col*)4; endline = (*EndLine*)68; endcol = (*EndCol*)4 }); (133, { line = (*Line*)44; col = (*Col*)20; endline = (*EndLine*)44; endcol = (*EndCol*)20 }); (214, { line = (*Line*)69; col = (*Col*)17; endline = (*EndLine*)69; endcol = (*EndCol*)17 }); (178, { line = (*Line*)63; col = (*Col*)10; endline = (*EndLine*)63; endcol = (*EndCol*)11 }); (115, { line = (*Line*)42; col = (*Col*)18; endline = (*EndLine*)42; endcol = (*EndCol*)22 }); (187, { line = (*Line*)64; col = (*Col*)15; endline = (*EndLine*)64; endcol = (*EndCol*)15 }); (172, { line = (*Line*)62; col = (*Col*)17; endline = (*EndLine*)62; endcol = (*EndCol*)18 }); (118, { line = (*Line*)42; col = (*Col*)34; endline = (*EndLine*)42; endcol = (*EndCol*)34 }); (127, { line = (*Line*)43; col = (*Col*)16; endline = (*EndLine*)43; endcol = (*EndCol*)16 }); (199, { line = (*Line*)67; col = (*Col*)4; endline = (*EndLine*)67; endcol = (*EndCol*)4 }); (136, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)15 }); (109, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)34 }); (91, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)36 }); (82, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)10 }); (190, { line = (*Line*)65; col = (*Col*)4; endline = (*EndLine*)65; endcol = (*EndCol*)5 }); (145, { line = (*Line*)47; col = (*Col*)18; endline = (*EndLine*)47; endcol = (*EndCol*)24 }); (154, { line = (*Line*)56; col = (*Col*)14; endline = (*EndLine*)56; endcol = (*EndCol*)14 }); (94, { line = (*Line*)37; col = (*Col*)31; endline = (*EndLine*)37; endcol = (*EndCol*)35 }); (67, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)16 }); (85, { line = (*Line*)37; col = (*Col*)13; endline = (*EndLine*)37; endcol = (*EndCol*)16 }); (139, { line = (*Line*)46; col = (*Col*)12; endline = (*EndLine*)46; endcol = (*EndCol*)14 }); (130, { line = (*Line*)44; col = (*Col*)14; endline = (*EndLine*)44; endcol = (*EndCol*)20 }); (121, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)12 }); (148, { line = (*Line*)47; col = (*Col*)24; endline = (*EndLine*)47; endcol = (*EndCol*)24 }); (103, { line = (*Line*)41; col = (*Col*)13; endline = (*EndLine*)41; endcol = (*EndCol*)16 }); (112, { line = (*Line*)42; col = (*Col*)17; endline = (*EndLine*)42; endcol = (*EndCol*)34 }); (79, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)23 }); (88, { line = (*Line*)37; col = (*Col*)23; endline = (*EndLine*)37; endcol = (*EndCol*)23 }); (70, { line = (*Line*)34; col = (*Col*)7; endline = (*EndLine*)34; endcol = (*EndCol*)11 }); (43, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)12 }); (180, { line = (*Line*)63; col = (*Col*)15; endline = (*EndLine*)63; endcol = (*EndCol*)15 }); (207, { line = (*Line*)68; col = (*Col*)12; endline = (*EndLine*)68; endcol = (*EndCol*)13 }); (198, { line = (*Line*)67; col = (*Col*)4; endline = (*EndLine*)67; endcol = (*EndCol*)7 }); (147, { line = (*Line*)47; col = (*Col*)18; endline = (*EndLine*)47; endcol = (*EndCol*)20 }); (183, { line = (*Line*)64; col = (*Col*)4; endline = (*EndLine*)64; endcol = (*EndCol*)5 }); (129, { line = (*Line*)44; col = (*Col*)6; endline = (*EndLine*)44; endcol = (*EndCol*)9 }); (210, { line = (*Line*)69; col = (*Col*)11; endline = (*EndLine*)69; endcol = (*EndCol*)11 }); (138, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)9 }); (120, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)16 }); (165, { line = (*Line*)59; col = (*Col*)14; endline = (*EndLine*)59; endcol = (*EndCol*)14 }); (192, { line = (*Line*)65; col = (*Col*)10; endline = (*EndLine*)65; endcol = (*EndCol*)11 }); (201, { line = (*Line*)67; col = (*Col*)12; endline = (*EndLine*)67; endcol = (*EndCol*)12 }); (213, { line = (*Line*)69; col = (*Col*)14; endline = (*EndLine*)69; endcol = (*EndCol*)14 }); (186, { line = (*Line*)64; col = (*Col*)10; endline = (*EndLine*)64; endcol = (*EndCol*)11 }); (87, { line = (*Line*)37; col = (*Col*)23; endline = (*EndLine*)37; endcol = (*EndCol*)23 }); (96, { line = (*Line*)37; col = (*Col*)40; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (177, { line = (*Line*)63; col = (*Col*)10; endline = (*EndLine*)63; endcol = (*EndCol*)15 }); (132, { line = (*Line*)44; col = (*Col*)14; endline = (*EndLine*)44; endcol = (*EndCol*)16 }); (150, { line = (*Line*)49; col = (*Col*)9; endline = (*EndLine*)49; endcol = (*EndCol*)9 }); (141, { line = (*Line*)46; col = (*Col*)19; endline = (*EndLine*)46; endcol = (*EndCol*)19 }); (105, { line = (*Line*)41; col = (*Col*)21; endline = (*EndLine*)41; endcol = (*EndCol*)25 }); (114, { line = (*Line*)42; col = (*Col*)18; endline = (*EndLine*)42; endcol = (*EndCol*)22 }); (123, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)6 }); (204, { line = (*Line*)68; col = (*Col*)4; endline = (*EndLine*)68; endcol = (*EndCol*)7 }); (195, { line = (*Line*)65; col = (*Col*)15; endline = (*EndLine*)65; endcol = (*EndCol*)16 }); (78, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (99, { line = (*Line*)38; col = (*Col*)8; endline = (*EndLine*)38; endcol = (*EndCol*)8 }); (90, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)36 }); (45, { line = (*Line*)23; col = (*Col*)16; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (171, { line = (*Line*)62; col = (*Col*)13; endline = (*EndLine*)62; endcol = (*EndCol*)14 }); (81, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)19 }); (144, { line = (*Line*)47; col = (*Col*)9; endline = (*EndLine*)47; endcol = (*EndCol*)13 }); (126, { line = (*Line*)43; col = (*Col*)16; endline = (*EndLine*)43; endcol = (*EndCol*)16 }); (162, { line = (*Line*)58; col = (*Col*)14; endline = (*EndLine*)58; endcol = (*EndCol*)14 }); (108, { line = (*Line*)42; col = (*Col*)3; endline = (*EndLine*)42; endcol = (*EndCol*)5 }); (135, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)19 }); (117, { line = (*Line*)42; col = (*Col*)26; endline = (*EndLine*)42; endcol = (*EndCol*)29 }); (84, { line = (*Line*)37; col = (*Col*)13; endline = (*EndLine*)37; endcol = (*EndCol*)16 }); (102, { line = (*Line*)41; col = (*Col*)13; endline = (*EndLine*)41; endcol = (*EndCol*)16 }); (93, { line = (*Line*)37; col = (*Col*)31; endline = (*EndLine*)37; endcol = (*EndCol*)35 }); (75, { line = (*Line*)36; col = (*Col*)12; endline = (*EndLine*)36; endcol = (*EndCol*)12 }); (111, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)13 }); (66, { line = (*Line*)33; col = (*Col*)7; endline = (*EndLine*)33; endcol = (*EndCol*)10 }); (42, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (212, { line = (*Line*)69; col = (*Col*)14; endline = (*EndLine*)69; endcol = (*EndCol*)14 }); (152, { line = (*Line*)49; col = (*Col*)14; endline = (*EndLine*)49; endcol = (*EndCol*)16 }); (179, { line = (*Line*)63; col = (*Col*)10; endline = (*EndLine*)63; endcol = (*EndCol*)11 }); (215, { line = (*Line*)69; col = (*Col*)17; endline = (*EndLine*)69; endcol = (*EndCol*)17 }); (206, { line = (*Line*)68; col = (*Col*)6; endline = (*EndLine*)68; endcol = (*EndCol*)6 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(23, ("A", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/A+28:22")); (32, ("X4", "ada://variable/Binary_Search_Test+1:11/X4+59:4")); (17, ("Y", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/Y+21:36")); (26, ("Left", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Left+29:7")); (29, ("X1", "ada://variable/Binary_Search_Test+1:11/X1+56:4")); (2, ("I", "ada://parameter/Binary_Search_Test+1:11/I+1:31")); (14, ("Y", "ada://component/Binary_Search_Test+1:11/RT+16:9/Y+18:7")); (13, ("X", "ada://component/Binary_Search_Test+1:11/RT+16:9/X+17:7")); (31, ("X3", "ada://variable/Binary_Search_Test+1:11/X3+58:4")); (7, ("R", "ada://variable/Binary_Search_Test+1:11/R+9:4")); (16, ("X", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/X+21:24")); (25, ("R", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/R+28:43")); (28, ("Med", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Med+31:7")); (27, ("Right", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Right+30:7")); (21, ("B", "ada://variable/Binary_Search_Test+1:11/B+25:4")); (30, ("X2", "ada://variable/Binary_Search_Test+1:11/X2+57:4")); (6, ("A", "ada://variable/Binary_Search_Test+1:11/A+8:4")); (24, ("I", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/I+28:30"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(22, ("Search", "ada://procedure_body/Binary_Search_Test+1:11/Search+28:14")); (1, ("Binary_Search_Test", "ada://procedure_body/Binary_Search_Test+1:11")); (15, ("increase", "ada://procedure_body/Binary_Search_Test+1:11/increase+21:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(8, ("T1", "ada://ordinary_type/Binary_Search_Test+1:11/T1+12:9")); (11, ("T4", "ada://subtype/Binary_Search_Test+1:11/T4+15:12")); (5, ("Ar", "ada://ordinary_type/Binary_Search_Test+1:11/Ar+6:9")); (4, ("U", "ada://subtype/Binary_Search_Test+1:11/U+4:12")); (10, ("T3", "ada://subtype/Binary_Search_Test+1:11/T3+14:12")); (9, ("T2", "ada://ordinary_type/Binary_Search_Test+1:11/T2+13:9")); (12, ("RT", "ada://ordinary_type/Binary_Search_Test+1:11/RT+16:9")); (3, ("T", "ada://ordinary_type/Binary_Search_Test+1:11/T+3:9"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Binary_Search_Test*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*I*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (4,
  (TypeDeclRT (5, (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))),
  (SeqDeclRT (7,
  (TypeDeclRT (8, (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10)))))),
  (SeqDeclRT (10,
  (TypeDeclRT (11, (ArrayTypeDeclRT (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
  (SeqDeclRT (13,
  (ObjDeclRT (14, { declaration_astnumRT = 15; object_nameRT = ((*A*) 6); object_nominal_subtypeRT = (Array_Type ((*Ar*) 5)); initialization_expRT = None })),
  (SeqDeclRT (16,
  (ObjDeclRT (17, { declaration_astnumRT = 18; object_nameRT = ((*R*) 7); object_nominal_subtypeRT = (Integer_Type ((*T*) 3)); initialization_expRT = None })),
  (SeqDeclRT (19,
  (TypeDeclRT (20, (DerivedTypeDeclRT (21, ((*T1*) 8), Integer, (RangeRT (1, 10)))))),
  (SeqDeclRT (22,
  (TypeDeclRT (23, (DerivedTypeDeclRT (24, ((*T2*) 9), (Integer_Type ((*T*) 3)), (RangeRT (2, 5)))))),
  (SeqDeclRT (25,
  (TypeDeclRT (26, (SubtypeDeclRT (27, ((*T3*) 10), Integer, (RangeRT (1, 10)))))),
  (SeqDeclRT (28,
  (TypeDeclRT (29, (SubtypeDeclRT (30, ((*T4*) 11), Integer, (RangeRT (5, 10)))))),
  (SeqDeclRT (31,
  (TypeDeclRT (32, (RecordTypeDeclRT (33, ((*RT*) 12), [(((*X*) 13), Integer); (((*Y*) 14), Integer)])))),
  (SeqDeclRT (35,
  (ProcBodyDeclRT (36, 
    mkprocBodyDeclRT (
     37,
      (* = = = Procedure Name = = = *)
      ((*increase*) 15),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnumRT = 38; parameter_nameRT = ((*X*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
    { parameter_astnumRT = 39; parameter_nameRT = ((*Y*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
      (* = = = Object Declarations = = = *)
      [NullDeclRT],
      (* = = = Procedure Body = = = *)
      (AssignRT (40, (IdentifierRT (41, ((*Y*) 17) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 16) , [])))), (LiteralRT (45, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
    ))
  ),
  (SeqDeclRT (46,
  (ObjDeclRT (48, { declaration_astnumRT = 49; object_nameRT = ((*B*) 21); object_nominal_subtypeRT = Boolean; initialization_expRT = (Some ((LiteralRT (47, (Boolean_Literal true) , [], [])))) })),
  (SeqDeclRT (50,
  (ProcBodyDeclRT (51, 
    mkprocBodyDeclRT (
     52,
      (* = = = Procedure Name = = = *)
      ((*Search*) 22),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnumRT = 53; parameter_nameRT = ((*A*) 23); parameter_subtype_markRT = (Array_Type ((*Ar*) 5)); parameter_modeRT = In }; 
    { parameter_astnumRT = 54; parameter_nameRT = ((*I*) 24); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
    { parameter_astnumRT = 55; parameter_nameRT = ((*R*) 25); parameter_subtype_markRT = (Integer_Type ((*T*) 3)); parameter_modeRT = Out }],
      (* = = = Object Declarations = = = *)
      [(SeqDeclRT (56,
    (ObjDeclRT (57, { declaration_astnumRT = 58; object_nameRT = ((*Left*) 26); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None })),
    (SeqDeclRT (59,
    (ObjDeclRT (60, { declaration_astnumRT = 61; object_nameRT = ((*Right*) 27); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None })),
    (ObjDeclRT (62, { declaration_astnumRT = 63; object_nameRT = ((*Med*) 28); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None }))))))],
      (* = = = Procedure Body = = = *)
      (SeqRT (64,
      (AssignRT (65, (IdentifierRT (66, ((*Left*) 26) , [])), (LiteralRT (67, (Integer_Literal 0) , [], [])))),
      (SeqRT (68,
      (AssignRT (69, (IdentifierRT (70, ((*Right*) 27) , [])), (LiteralRT (71, (Integer_Literal 10) , [], [])))),
      (SeqRT (72,
      (AssignRT (73, (IdentifierRT (74, ((*R*) 25) , [])), (LiteralRT (75, (Integer_Literal 0) , [], [])))),
      (SeqRT (76,
      (IfRT (77, (BinOpRT (78, Or, (BinOpRT (79, Greater_Than, (NameRT (80, (IndexedComponentRT (81, (IdentifierRT (82, ((*A*) 23) , [])), (BinOpRT (83, Plus, (NameRT (84, (IdentifierRT (85, ((*Left*) 26) , [])))), (LiteralRT (86, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])))), (NameRT (87, (IdentifierRT (88, ((*I*) 24) , [])))) , [], [])), (BinOpRT (89, Less_Than, (NameRT (90, (IndexedComponentRT (91, (IdentifierRT (92, ((*A*) 23) , [])), (NameRT (93, (IdentifierRT (94, ((*Right*) 27) , [])))) , [])))), (NameRT (95, (IdentifierRT (96, ((*I*) 24) , [])))) , [], [])) , [], [])),
        (AssignRT (97, (IdentifierRT (98, ((*R*) 25) , [])), (LiteralRT (99, (Integer_Literal 0) , [], [])))),
        NullRT)
      ),
      (WhileRT (100, (BinOpRT (101, Less_Than_Or_Equal, (NameRT (102, (IdentifierRT (103, ((*Left*) 26) , [])))), (NameRT (104, (IdentifierRT (105, ((*Right*) 27) , [])))) , [], [])),
        (SeqRT (106,
        (AssignRT (107, (IdentifierRT (108, ((*Med*) 28) , [])), (BinOpRT (109, Plus, (NameRT (110, (IdentifierRT (111, ((*Left*) 26) , [])))), (BinOpRT (112, Divide, (BinOpRT (113, Minus, (NameRT (114, (IdentifierRT (115, ((*Right*) 27) , [])))), (NameRT (116, (IdentifierRT (117, ((*Left*) 26) , [])))) , [], [])), (LiteralRT (118, (Integer_Literal 2) , [], [])) , [DivCheck], [])) , [RangeCheck], [])))),
        (IfRT (119, (BinOpRT (120, Less_Than, (NameRT (121, (IndexedComponentRT (122, (IdentifierRT (123, ((*A*) 23) , [])), (NameRT (124, (IdentifierRT (125, ((*Med*) 28) , [])))) , [])))), (NameRT (126, (IdentifierRT (127, ((*I*) 24) , [])))) , [], [])),
          (AssignRT (128, (IdentifierRT (129, ((*Left*) 26) , [])), (BinOpRT (130, Plus, (NameRT (131, (IdentifierRT (132, ((*Med*) 28) , [])))), (LiteralRT (133, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
          (IfRT (134, (BinOpRT (135, Greater_Than, (NameRT (136, (IndexedComponentRT (137, (IdentifierRT (138, ((*A*) 23) , [])), (NameRT (139, (IdentifierRT (140, ((*Med*) 28) , [])))) , [])))), (NameRT (141, (IdentifierRT (142, ((*I*) 24) , [])))) , [], [])),
            (AssignRT (143, (IdentifierRT (144, ((*Right*) 27) , [])), (BinOpRT (145, Minus, (NameRT (146, (IdentifierRT (147, ((*Med*) 28) , [])))), (LiteralRT (148, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
            (AssignRT (149, (IdentifierRT (150, ((*R*) 25) , [])), (NameRT (151, (IdentifierRT (152, ((*Med*) 28) , [])))))))
          ))
        ))))
      )))))))))
    ))
  ),
  (SeqDeclRT (153,
  (ObjDeclRT (155, { declaration_astnumRT = 156; object_nameRT = ((*X1*) 29); object_nominal_subtypeRT = (Derived_Type ((*T1*) 8)); initialization_expRT = (Some ((LiteralRT (154, (Integer_Literal 2) , [], [])))) })),
  (SeqDeclRT (157,
  (ObjDeclRT (159, { declaration_astnumRT = 160; object_nameRT = ((*X2*) 30); object_nominal_subtypeRT = (Derived_Type ((*T2*) 9)); initialization_expRT = (Some ((LiteralRT (158, (Integer_Literal 3) , [], [])))) })),
  (SeqDeclRT (161,
  (ObjDeclRT (163, { declaration_astnumRT = 164; object_nameRT = ((*X3*) 31); object_nominal_subtypeRT = (Subtype ((*T3*) 10)); initialization_expRT = (Some ((LiteralRT (162, (Integer_Literal 4) , [], [])))) })),
  (ObjDeclRT (166, { declaration_astnumRT = 167; object_nameRT = ((*X4*) 32); object_nominal_subtypeRT = (Subtype ((*T4*) 11)); initialization_expRT = (Some ((LiteralRT (165, (Integer_Literal 6) , [], [])))) }))))))))))))))))))))))))))))))))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (168,
    (CallRT (169, 170, ((*increase*) 15), 
      [(LiteralRT (171, (Integer_Literal 10) , [], [])); (NameRT (172, (IdentifierRT (173, ((*X4*) 32) , [RangeCheck]))))])
    ),
    (SeqRT (174,
    (AssignRT (175, (IdentifierRT (176, ((*X1*) 29) , [])), (BinOpRT (177, Plus, (NameRT (178, (IdentifierRT (179, ((*X1*) 29) , [])))), (LiteralRT (180, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
    (SeqRT (181,
    (AssignRT (182, (IdentifierRT (183, ((*X2*) 30) , [])), (BinOpRT (184, Plus, (NameRT (185, (IdentifierRT (186, ((*X2*) 30) , [])))), (LiteralRT (187, (Integer_Literal 2) , [], [])) , [RangeCheck], [])))),
    (SeqRT (188,
    (AssignRT (189, (IdentifierRT (190, ((*X4*) 32) , [])), (BinOpRT (191, Plus, (NameRT (192, (IdentifierRT (193, ((*X3*) 31) , [])))), (NameRT (194, (IdentifierRT (195, ((*X4*) 32) , [])))) , [RangeCheck], [])))),
    (SeqRT (196,
    (AssignRT (197, (IndexedComponentRT (198, (IdentifierRT (199, ((*A*) 6) , [])), (LiteralRT (200, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (201, (Integer_Literal 0) , [], [])))),
    (SeqRT (202,
    (AssignRT (203, (IndexedComponentRT (204, (IdentifierRT (205, ((*A*) 6) , [])), (LiteralRT (206, (Integer_Literal 1) , [], [])) , [])), (LiteralRT (207, (Integer_Literal 10) , [], [])))),
    (CallRT (208, 209, ((*Search*) 22), 
      [(NameRT (210, (IdentifierRT (211, ((*A*) 6) , [])))); (NameRT (212, (IdentifierRT (213, ((*I*) 2) , [])))); (NameRT (214, (IdentifierRT (215, ((*R*) 7) , []))))])
    )))))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X3*) 31), (In_Out, (Subtype ((*T3*) 10)))); (((*R*) 25), (Out, (Integer_Type ((*T*) 3)))); (((*R*) 7), (In_Out, (Integer_Type ((*T*) 3)))); (((*X1*) 29), (In_Out, (Derived_Type ((*T1*) 8)))); (((*I*) 24), (In, Integer)); (((*X*) 16), (In, Integer)); (((*B*) 21), (In_Out, Boolean)); (((*X4*) 32), (In_Out, (Subtype ((*T4*) 11)))); (((*I*) 2), (In, Integer)); (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))); (((*Left*) 26), (In_Out, (Subtype ((*U*) 4)))); (((*Right*) 27), (In_Out, (Subtype ((*U*) 4)))); (((*Med*) 28), (In_Out, (Subtype ((*U*) 4)))); (((*X2*) 30), (In_Out, (Derived_Type ((*T2*) 9)))); (((*Y*) 17), (Out, Integer)); (((*A*) 23), (In, (Array_Type ((*Ar*) 5))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Search*) 22), (1, mkprocBodyDeclRT (
 52,
  (* = = = Procedure Name = = = *)
  ((*Search*) 22),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 53; parameter_nameRT = ((*A*) 23); parameter_subtype_markRT = (Array_Type ((*Ar*) 5)); parameter_modeRT = In }; 
{ parameter_astnumRT = 54; parameter_nameRT = ((*I*) 24); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 55; parameter_nameRT = ((*R*) 25); parameter_subtype_markRT = (Integer_Type ((*T*) 3)); parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (56,
(ObjDeclRT (57, { declaration_astnumRT = 58; object_nameRT = ((*Left*) 26); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None })),
(SeqDeclRT (59,
(ObjDeclRT (60, { declaration_astnumRT = 61; object_nameRT = ((*Right*) 27); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None })),
(ObjDeclRT (62, { declaration_astnumRT = 63; object_nameRT = ((*Med*) 28); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None }))))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (64,
  (AssignRT (65, (IdentifierRT (66, ((*Left*) 26) , [])), (LiteralRT (67, (Integer_Literal 0) , [], [])))),
  (SeqRT (68,
  (AssignRT (69, (IdentifierRT (70, ((*Right*) 27) , [])), (LiteralRT (71, (Integer_Literal 10) , [], [])))),
  (SeqRT (72,
  (AssignRT (73, (IdentifierRT (74, ((*R*) 25) , [])), (LiteralRT (75, (Integer_Literal 0) , [], [])))),
  (SeqRT (76,
  (IfRT (77, (BinOpRT (78, Or, (BinOpRT (79, Greater_Than, (NameRT (80, (IndexedComponentRT (81, (IdentifierRT (82, ((*A*) 23) , [])), (BinOpRT (83, Plus, (NameRT (84, (IdentifierRT (85, ((*Left*) 26) , [])))), (LiteralRT (86, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])))), (NameRT (87, (IdentifierRT (88, ((*I*) 24) , [])))) , [], [])), (BinOpRT (89, Less_Than, (NameRT (90, (IndexedComponentRT (91, (IdentifierRT (92, ((*A*) 23) , [])), (NameRT (93, (IdentifierRT (94, ((*Right*) 27) , [])))) , [])))), (NameRT (95, (IdentifierRT (96, ((*I*) 24) , [])))) , [], [])) , [], [])),
    (AssignRT (97, (IdentifierRT (98, ((*R*) 25) , [])), (LiteralRT (99, (Integer_Literal 0) , [], [])))),
    NullRT)
  ),
  (WhileRT (100, (BinOpRT (101, Less_Than_Or_Equal, (NameRT (102, (IdentifierRT (103, ((*Left*) 26) , [])))), (NameRT (104, (IdentifierRT (105, ((*Right*) 27) , [])))) , [], [])),
    (SeqRT (106,
    (AssignRT (107, (IdentifierRT (108, ((*Med*) 28) , [])), (BinOpRT (109, Plus, (NameRT (110, (IdentifierRT (111, ((*Left*) 26) , [])))), (BinOpRT (112, Divide, (BinOpRT (113, Minus, (NameRT (114, (IdentifierRT (115, ((*Right*) 27) , [])))), (NameRT (116, (IdentifierRT (117, ((*Left*) 26) , [])))) , [], [])), (LiteralRT (118, (Integer_Literal 2) , [], [])) , [DivCheck], [])) , [RangeCheck], [])))),
    (IfRT (119, (BinOpRT (120, Less_Than, (NameRT (121, (IndexedComponentRT (122, (IdentifierRT (123, ((*A*) 23) , [])), (NameRT (124, (IdentifierRT (125, ((*Med*) 28) , [])))) , [])))), (NameRT (126, (IdentifierRT (127, ((*I*) 24) , [])))) , [], [])),
      (AssignRT (128, (IdentifierRT (129, ((*Left*) 26) , [])), (BinOpRT (130, Plus, (NameRT (131, (IdentifierRT (132, ((*Med*) 28) , [])))), (LiteralRT (133, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
      (IfRT (134, (BinOpRT (135, Greater_Than, (NameRT (136, (IndexedComponentRT (137, (IdentifierRT (138, ((*A*) 23) , [])), (NameRT (139, (IdentifierRT (140, ((*Med*) 28) , [])))) , [])))), (NameRT (141, (IdentifierRT (142, ((*I*) 24) , [])))) , [], [])),
        (AssignRT (143, (IdentifierRT (144, ((*Right*) 27) , [])), (BinOpRT (145, Minus, (NameRT (146, (IdentifierRT (147, ((*Med*) 28) , [])))), (LiteralRT (148, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
        (AssignRT (149, (IdentifierRT (150, ((*R*) 25) , [])), (NameRT (151, (IdentifierRT (152, ((*Med*) 28) , [])))))))
      ))
    ))))
  )))))))))
))); (((*Binary_Search_Test*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Binary_Search_Test*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*I*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (4,
(TypeDeclRT (5, (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))),
(SeqDeclRT (7,
(TypeDeclRT (8, (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10)))))),
(SeqDeclRT (10,
(TypeDeclRT (11, (ArrayTypeDeclRT (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
(SeqDeclRT (13,
(ObjDeclRT (14, { declaration_astnumRT = 15; object_nameRT = ((*A*) 6); object_nominal_subtypeRT = (Array_Type ((*Ar*) 5)); initialization_expRT = None })),
(SeqDeclRT (16,
(ObjDeclRT (17, { declaration_astnumRT = 18; object_nameRT = ((*R*) 7); object_nominal_subtypeRT = (Integer_Type ((*T*) 3)); initialization_expRT = None })),
(SeqDeclRT (19,
(TypeDeclRT (20, (DerivedTypeDeclRT (21, ((*T1*) 8), Integer, (RangeRT (1, 10)))))),
(SeqDeclRT (22,
(TypeDeclRT (23, (DerivedTypeDeclRT (24, ((*T2*) 9), (Integer_Type ((*T*) 3)), (RangeRT (2, 5)))))),
(SeqDeclRT (25,
(TypeDeclRT (26, (SubtypeDeclRT (27, ((*T3*) 10), Integer, (RangeRT (1, 10)))))),
(SeqDeclRT (28,
(TypeDeclRT (29, (SubtypeDeclRT (30, ((*T4*) 11), Integer, (RangeRT (5, 10)))))),
(SeqDeclRT (31,
(TypeDeclRT (32, (RecordTypeDeclRT (33, ((*RT*) 12), [(((*X*) 13), Integer); (((*Y*) 14), Integer)])))),
(SeqDeclRT (35,
(ProcBodyDeclRT (36, 
  mkprocBodyDeclRT (
   37,
    (* = = = Procedure Name = = = *)
    ((*increase*) 15),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 38; parameter_nameRT = ((*X*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 39; parameter_nameRT = ((*Y*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [NullDeclRT],
    (* = = = Procedure Body = = = *)
    (AssignRT (40, (IdentifierRT (41, ((*Y*) 17) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 16) , [])))), (LiteralRT (45, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
  ))
),
(SeqDeclRT (46,
(ObjDeclRT (48, { declaration_astnumRT = 49; object_nameRT = ((*B*) 21); object_nominal_subtypeRT = Boolean; initialization_expRT = (Some ((LiteralRT (47, (Boolean_Literal true) , [], [])))) })),
(SeqDeclRT (50,
(ProcBodyDeclRT (51, 
  mkprocBodyDeclRT (
   52,
    (* = = = Procedure Name = = = *)
    ((*Search*) 22),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 53; parameter_nameRT = ((*A*) 23); parameter_subtype_markRT = (Array_Type ((*Ar*) 5)); parameter_modeRT = In }; 
  { parameter_astnumRT = 54; parameter_nameRT = ((*I*) 24); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 55; parameter_nameRT = ((*R*) 25); parameter_subtype_markRT = (Integer_Type ((*T*) 3)); parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (56,
  (ObjDeclRT (57, { declaration_astnumRT = 58; object_nameRT = ((*Left*) 26); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None })),
  (SeqDeclRT (59,
  (ObjDeclRT (60, { declaration_astnumRT = 61; object_nameRT = ((*Right*) 27); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None })),
  (ObjDeclRT (62, { declaration_astnumRT = 63; object_nameRT = ((*Med*) 28); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None }))))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (64,
    (AssignRT (65, (IdentifierRT (66, ((*Left*) 26) , [])), (LiteralRT (67, (Integer_Literal 0) , [], [])))),
    (SeqRT (68,
    (AssignRT (69, (IdentifierRT (70, ((*Right*) 27) , [])), (LiteralRT (71, (Integer_Literal 10) , [], [])))),
    (SeqRT (72,
    (AssignRT (73, (IdentifierRT (74, ((*R*) 25) , [])), (LiteralRT (75, (Integer_Literal 0) , [], [])))),
    (SeqRT (76,
    (IfRT (77, (BinOpRT (78, Or, (BinOpRT (79, Greater_Than, (NameRT (80, (IndexedComponentRT (81, (IdentifierRT (82, ((*A*) 23) , [])), (BinOpRT (83, Plus, (NameRT (84, (IdentifierRT (85, ((*Left*) 26) , [])))), (LiteralRT (86, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])))), (NameRT (87, (IdentifierRT (88, ((*I*) 24) , [])))) , [], [])), (BinOpRT (89, Less_Than, (NameRT (90, (IndexedComponentRT (91, (IdentifierRT (92, ((*A*) 23) , [])), (NameRT (93, (IdentifierRT (94, ((*Right*) 27) , [])))) , [])))), (NameRT (95, (IdentifierRT (96, ((*I*) 24) , [])))) , [], [])) , [], [])),
      (AssignRT (97, (IdentifierRT (98, ((*R*) 25) , [])), (LiteralRT (99, (Integer_Literal 0) , [], [])))),
      NullRT)
    ),
    (WhileRT (100, (BinOpRT (101, Less_Than_Or_Equal, (NameRT (102, (IdentifierRT (103, ((*Left*) 26) , [])))), (NameRT (104, (IdentifierRT (105, ((*Right*) 27) , [])))) , [], [])),
      (SeqRT (106,
      (AssignRT (107, (IdentifierRT (108, ((*Med*) 28) , [])), (BinOpRT (109, Plus, (NameRT (110, (IdentifierRT (111, ((*Left*) 26) , [])))), (BinOpRT (112, Divide, (BinOpRT (113, Minus, (NameRT (114, (IdentifierRT (115, ((*Right*) 27) , [])))), (NameRT (116, (IdentifierRT (117, ((*Left*) 26) , [])))) , [], [])), (LiteralRT (118, (Integer_Literal 2) , [], [])) , [DivCheck], [])) , [RangeCheck], [])))),
      (IfRT (119, (BinOpRT (120, Less_Than, (NameRT (121, (IndexedComponentRT (122, (IdentifierRT (123, ((*A*) 23) , [])), (NameRT (124, (IdentifierRT (125, ((*Med*) 28) , [])))) , [])))), (NameRT (126, (IdentifierRT (127, ((*I*) 24) , [])))) , [], [])),
        (AssignRT (128, (IdentifierRT (129, ((*Left*) 26) , [])), (BinOpRT (130, Plus, (NameRT (131, (IdentifierRT (132, ((*Med*) 28) , [])))), (LiteralRT (133, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
        (IfRT (134, (BinOpRT (135, Greater_Than, (NameRT (136, (IndexedComponentRT (137, (IdentifierRT (138, ((*A*) 23) , [])), (NameRT (139, (IdentifierRT (140, ((*Med*) 28) , [])))) , [])))), (NameRT (141, (IdentifierRT (142, ((*I*) 24) , [])))) , [], [])),
          (AssignRT (143, (IdentifierRT (144, ((*Right*) 27) , [])), (BinOpRT (145, Minus, (NameRT (146, (IdentifierRT (147, ((*Med*) 28) , [])))), (LiteralRT (148, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
          (AssignRT (149, (IdentifierRT (150, ((*R*) 25) , [])), (NameRT (151, (IdentifierRT (152, ((*Med*) 28) , [])))))))
        ))
      ))))
    )))))))))
  ))
),
(SeqDeclRT (153,
(ObjDeclRT (155, { declaration_astnumRT = 156; object_nameRT = ((*X1*) 29); object_nominal_subtypeRT = (Derived_Type ((*T1*) 8)); initialization_expRT = (Some ((LiteralRT (154, (Integer_Literal 2) , [], [])))) })),
(SeqDeclRT (157,
(ObjDeclRT (159, { declaration_astnumRT = 160; object_nameRT = ((*X2*) 30); object_nominal_subtypeRT = (Derived_Type ((*T2*) 9)); initialization_expRT = (Some ((LiteralRT (158, (Integer_Literal 3) , [], [])))) })),
(SeqDeclRT (161,
(ObjDeclRT (163, { declaration_astnumRT = 164; object_nameRT = ((*X3*) 31); object_nominal_subtypeRT = (Subtype ((*T3*) 10)); initialization_expRT = (Some ((LiteralRT (162, (Integer_Literal 4) , [], [])))) })),
(ObjDeclRT (166, { declaration_astnumRT = 167; object_nameRT = ((*X4*) 32); object_nominal_subtypeRT = (Subtype ((*T4*) 11)); initialization_expRT = (Some ((LiteralRT (165, (Integer_Literal 6) , [], [])))) }))))))))))))))))))))))))))))))))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (168,
  (CallRT (169, 170, ((*increase*) 15), 
    [(LiteralRT (171, (Integer_Literal 10) , [], [])); (NameRT (172, (IdentifierRT (173, ((*X4*) 32) , [RangeCheck]))))])
  ),
  (SeqRT (174,
  (AssignRT (175, (IdentifierRT (176, ((*X1*) 29) , [])), (BinOpRT (177, Plus, (NameRT (178, (IdentifierRT (179, ((*X1*) 29) , [])))), (LiteralRT (180, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
  (SeqRT (181,
  (AssignRT (182, (IdentifierRT (183, ((*X2*) 30) , [])), (BinOpRT (184, Plus, (NameRT (185, (IdentifierRT (186, ((*X2*) 30) , [])))), (LiteralRT (187, (Integer_Literal 2) , [], [])) , [RangeCheck], [])))),
  (SeqRT (188,
  (AssignRT (189, (IdentifierRT (190, ((*X4*) 32) , [])), (BinOpRT (191, Plus, (NameRT (192, (IdentifierRT (193, ((*X3*) 31) , [])))), (NameRT (194, (IdentifierRT (195, ((*X4*) 32) , [])))) , [RangeCheck], [])))),
  (SeqRT (196,
  (AssignRT (197, (IndexedComponentRT (198, (IdentifierRT (199, ((*A*) 6) , [])), (LiteralRT (200, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (201, (Integer_Literal 0) , [], [])))),
  (SeqRT (202,
  (AssignRT (203, (IndexedComponentRT (204, (IdentifierRT (205, ((*A*) 6) , [])), (LiteralRT (206, (Integer_Literal 1) , [], [])) , [])), (LiteralRT (207, (Integer_Literal 10) , [], [])))),
  (CallRT (208, 209, ((*Search*) 22), 
    [(NameRT (210, (IdentifierRT (211, ((*A*) 6) , [])))); (NameRT (212, (IdentifierRT (213, ((*I*) 2) , [])))); (NameRT (214, (IdentifierRT (215, ((*R*) 7) , []))))])
  )))))))))))))
))); (((*increase*) 15), (1, mkprocBodyDeclRT (
 37,
  (* = = = Procedure Name = = = *)
  ((*increase*) 15),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 38; parameter_nameRT = ((*X*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 39; parameter_nameRT = ((*Y*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [NullDeclRT],
  (* = = = Procedure Body = = = *)
  (AssignRT (40, (IdentifierRT (41, ((*Y*) 17) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 16) , [])))), (LiteralRT (45, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*RT*) 12), (RecordTypeDeclRT (33, ((*RT*) 12), [(((*X*) 13), Integer); (((*Y*) 14), Integer)]))); (((*T3*) 10), (SubtypeDeclRT (27, ((*T3*) 10), Integer, (RangeRT (1, 10))))); (((*Ar*) 5), (ArrayTypeDeclRT (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer)))); (((*T4*) 11), (SubtypeDeclRT (30, ((*T4*) 11), Integer, (RangeRT (5, 10))))); (((*T2*) 9), (DerivedTypeDeclRT (24, ((*T2*) 9), (Integer_Type ((*T*) 3)), (RangeRT (2, 5))))); (((*T1*) 8), (DerivedTypeDeclRT (21, ((*T1*) 8), Integer, (RangeRT (1, 10))))); (((*U*) 4), (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10))))); (((*T*) 3), (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(137, Integer); (146, (Subtype ((*U*) 4))); (92, (Array_Type ((*Ar*) 5))); (200, Integer); (101, Boolean); (173, (Subtype ((*T4*) 11))); (191, Integer); (83, (Integer_Type ((*T*) 3))); (110, (Subtype ((*U*) 4))); (104, (Subtype ((*U*) 4))); (95, Integer); (131, (Subtype ((*U*) 4))); (122, Integer); (194, (Subtype ((*T4*) 11))); (176, (Derived_Type ((*T1*) 8))); (86, Integer); (158, Integer); (185, (Derived_Type ((*T2*) 9))); (113, (Integer_Type ((*T*) 3))); (41, Integer); (140, (Subtype ((*U*) 4))); (44, Integer); (125, (Subtype ((*U*) 4))); (80, Integer); (89, Boolean); (116, (Subtype ((*U*) 4))); (98, (Integer_Type ((*T*) 3))); (71, Integer); (74, (Integer_Type ((*T*) 3))); (47, Boolean); (193, (Subtype ((*T3*) 10))); (184, (Derived_Type ((*T2*) 9))); (211, (Array_Type ((*Ar*) 5))); (142, Integer); (151, (Subtype ((*U*) 4))); (124, (Subtype ((*U*) 4))); (205, (Array_Type ((*Ar*) 5))); (133, Integer); (214, (Integer_Type ((*T*) 3))); (178, (Derived_Type ((*T1*) 8))); (115, (Subtype ((*U*) 4))); (187, Integer); (172, (Subtype ((*T4*) 11))); (118, Integer); (127, Integer); (199, (Array_Type ((*Ar*) 5))); (136, Integer); (109, (Integer_Type ((*T*) 3))); (91, Integer); (82, (Array_Type ((*Ar*) 5))); (190, (Subtype ((*T4*) 11))); (145, (Integer_Type ((*T*) 3))); (154, Integer); (94, (Subtype ((*U*) 4))); (67, Integer); (85, (Subtype ((*U*) 4))); (139, (Subtype ((*U*) 4))); (130, (Integer_Type ((*T*) 3))); (121, Integer); (148, Integer); (103, (Subtype ((*U*) 4))); (112, (Integer_Type ((*T*) 3))); (79, Boolean); (88, Integer); (70, (Subtype ((*U*) 4))); (43, Integer); (180, Integer); (207, Integer); (198, Integer); (147, (Subtype ((*U*) 4))); (183, (Derived_Type ((*T2*) 9))); (129, (Subtype ((*U*) 4))); (210, (Array_Type ((*Ar*) 5))); (138, (Array_Type ((*Ar*) 5))); (120, Boolean); (165, Integer); (192, (Subtype ((*T3*) 10))); (201, Integer); (213, Integer); (186, (Derived_Type ((*T2*) 9))); (87, Integer); (96, Integer); (177, (Derived_Type ((*T1*) 8))); (132, (Subtype ((*U*) 4))); (150, (Integer_Type ((*T*) 3))); (141, Integer); (105, (Subtype ((*U*) 4))); (114, (Subtype ((*U*) 4))); (123, (Array_Type ((*Ar*) 5))); (204, Integer); (195, (Subtype ((*T4*) 11))); (78, Boolean); (99, Integer); (90, Integer); (45, Integer); (171, Integer); (81, Integer); (144, (Subtype ((*U*) 4))); (126, Integer); (162, Integer); (108, (Subtype ((*U*) 4))); (135, Boolean); (117, (Subtype ((*U*) 4))); (84, (Subtype ((*U*) 4))); (102, (Subtype ((*U*) 4))); (93, (Subtype ((*U*) 4))); (75, Integer); (111, (Subtype ((*U*) 4))); (66, (Subtype ((*U*) 4))); (42, Integer); (212, Integer); (152, (Subtype ((*U*) 4))); (179, (Derived_Type ((*T1*) 8))); (215, (Integer_Type ((*T*) 3))); (206, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(137, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)15 }); (146, { line = (*Line*)47; col = (*Col*)18; endline = (*EndLine*)47; endcol = (*EndCol*)20 }); (92, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)28 }); (200, { line = (*Line*)67; col = (*Col*)6; endline = (*EndLine*)67; endcol = (*EndCol*)6 }); (101, { line = (*Line*)41; col = (*Col*)13; endline = (*EndLine*)41; endcol = (*EndCol*)25 }); (173, { line = (*Line*)62; col = (*Col*)17; endline = (*EndLine*)62; endcol = (*EndCol*)18 }); (191, { line = (*Line*)65; col = (*Col*)10; endline = (*EndLine*)65; endcol = (*EndCol*)16 }); (83, { line = (*Line*)37; col = (*Col*)13; endline = (*EndLine*)37; endcol = (*EndCol*)18 }); (110, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)13 }); (104, { line = (*Line*)41; col = (*Col*)21; endline = (*EndLine*)41; endcol = (*EndCol*)25 }); (95, { line = (*Line*)37; col = (*Col*)40; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (131, { line = (*Line*)44; col = (*Col*)14; endline = (*EndLine*)44; endcol = (*EndCol*)16 }); (122, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)12 }); (194, { line = (*Line*)65; col = (*Col*)15; endline = (*EndLine*)65; endcol = (*EndCol*)16 }); (176, { line = (*Line*)63; col = (*Col*)4; endline = (*EndLine*)63; endcol = (*EndCol*)5 }); (86, { line = (*Line*)37; col = (*Col*)18; endline = (*EndLine*)37; endcol = (*EndCol*)18 }); (158, { line = (*Line*)57; col = (*Col*)14; endline = (*EndLine*)57; endcol = (*EndCol*)14 }); (185, { line = (*Line*)64; col = (*Col*)10; endline = (*EndLine*)64; endcol = (*EndCol*)11 }); (113, { line = (*Line*)42; col = (*Col*)18; endline = (*EndLine*)42; endcol = (*EndCol*)29 }); (41, { line = (*Line*)23; col = (*Col*)7; endline = (*EndLine*)23; endcol = (*EndCol*)7 }); (140, { line = (*Line*)46; col = (*Col*)12; endline = (*EndLine*)46; endcol = (*EndCol*)14 }); (44, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)12 }); (125, { line = (*Line*)43; col = (*Col*)9; endline = (*EndLine*)43; endcol = (*EndCol*)11 }); (80, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)19 }); (89, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (116, { line = (*Line*)42; col = (*Col*)26; endline = (*EndLine*)42; endcol = (*EndCol*)29 }); (98, { line = (*Line*)38; col = (*Col*)3; endline = (*EndLine*)38; endcol = (*EndCol*)3 }); (71, { line = (*Line*)34; col = (*Col*)16; endline = (*EndLine*)34; endcol = (*EndCol*)17 }); (74, { line = (*Line*)36; col = (*Col*)7; endline = (*EndLine*)36; endcol = (*EndCol*)7 }); (47, { line = (*Line*)25; col = (*Col*)18; endline = (*EndLine*)25; endcol = (*EndCol*)21 }); (193, { line = (*Line*)65; col = (*Col*)10; endline = (*EndLine*)65; endcol = (*EndCol*)11 }); (184, { line = (*Line*)64; col = (*Col*)10; endline = (*EndLine*)64; endcol = (*EndCol*)15 }); (211, { line = (*Line*)69; col = (*Col*)11; endline = (*EndLine*)69; endcol = (*EndCol*)11 }); (142, { line = (*Line*)46; col = (*Col*)19; endline = (*EndLine*)46; endcol = (*EndCol*)19 }); (151, { line = (*Line*)49; col = (*Col*)14; endline = (*EndLine*)49; endcol = (*EndCol*)16 }); (124, { line = (*Line*)43; col = (*Col*)9; endline = (*EndLine*)43; endcol = (*EndCol*)11 }); (205, { line = (*Line*)68; col = (*Col*)4; endline = (*EndLine*)68; endcol = (*EndCol*)4 }); (133, { line = (*Line*)44; col = (*Col*)20; endline = (*EndLine*)44; endcol = (*EndCol*)20 }); (214, { line = (*Line*)69; col = (*Col*)17; endline = (*EndLine*)69; endcol = (*EndCol*)17 }); (178, { line = (*Line*)63; col = (*Col*)10; endline = (*EndLine*)63; endcol = (*EndCol*)11 }); (115, { line = (*Line*)42; col = (*Col*)18; endline = (*EndLine*)42; endcol = (*EndCol*)22 }); (187, { line = (*Line*)64; col = (*Col*)15; endline = (*EndLine*)64; endcol = (*EndCol*)15 }); (172, { line = (*Line*)62; col = (*Col*)17; endline = (*EndLine*)62; endcol = (*EndCol*)18 }); (118, { line = (*Line*)42; col = (*Col*)34; endline = (*EndLine*)42; endcol = (*EndCol*)34 }); (127, { line = (*Line*)43; col = (*Col*)16; endline = (*EndLine*)43; endcol = (*EndCol*)16 }); (199, { line = (*Line*)67; col = (*Col*)4; endline = (*EndLine*)67; endcol = (*EndCol*)4 }); (136, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)15 }); (109, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)34 }); (91, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)36 }); (82, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)10 }); (190, { line = (*Line*)65; col = (*Col*)4; endline = (*EndLine*)65; endcol = (*EndCol*)5 }); (145, { line = (*Line*)47; col = (*Col*)18; endline = (*EndLine*)47; endcol = (*EndCol*)24 }); (154, { line = (*Line*)56; col = (*Col*)14; endline = (*EndLine*)56; endcol = (*EndCol*)14 }); (94, { line = (*Line*)37; col = (*Col*)31; endline = (*EndLine*)37; endcol = (*EndCol*)35 }); (67, { line = (*Line*)33; col = (*Col*)16; endline = (*EndLine*)33; endcol = (*EndCol*)16 }); (85, { line = (*Line*)37; col = (*Col*)13; endline = (*EndLine*)37; endcol = (*EndCol*)16 }); (139, { line = (*Line*)46; col = (*Col*)12; endline = (*EndLine*)46; endcol = (*EndCol*)14 }); (130, { line = (*Line*)44; col = (*Col*)14; endline = (*EndLine*)44; endcol = (*EndCol*)20 }); (121, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)12 }); (148, { line = (*Line*)47; col = (*Col*)24; endline = (*EndLine*)47; endcol = (*EndCol*)24 }); (103, { line = (*Line*)41; col = (*Col*)13; endline = (*EndLine*)41; endcol = (*EndCol*)16 }); (112, { line = (*Line*)42; col = (*Col*)17; endline = (*EndLine*)42; endcol = (*EndCol*)34 }); (79, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)23 }); (88, { line = (*Line*)37; col = (*Col*)23; endline = (*EndLine*)37; endcol = (*EndCol*)23 }); (70, { line = (*Line*)34; col = (*Col*)7; endline = (*EndLine*)34; endcol = (*EndCol*)11 }); (43, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)12 }); (180, { line = (*Line*)63; col = (*Col*)15; endline = (*EndLine*)63; endcol = (*EndCol*)15 }); (207, { line = (*Line*)68; col = (*Col*)12; endline = (*EndLine*)68; endcol = (*EndCol*)13 }); (198, { line = (*Line*)67; col = (*Col*)4; endline = (*EndLine*)67; endcol = (*EndCol*)7 }); (147, { line = (*Line*)47; col = (*Col*)18; endline = (*EndLine*)47; endcol = (*EndCol*)20 }); (183, { line = (*Line*)64; col = (*Col*)4; endline = (*EndLine*)64; endcol = (*EndCol*)5 }); (129, { line = (*Line*)44; col = (*Col*)6; endline = (*EndLine*)44; endcol = (*EndCol*)9 }); (210, { line = (*Line*)69; col = (*Col*)11; endline = (*EndLine*)69; endcol = (*EndCol*)11 }); (138, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)9 }); (120, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)16 }); (165, { line = (*Line*)59; col = (*Col*)14; endline = (*EndLine*)59; endcol = (*EndCol*)14 }); (192, { line = (*Line*)65; col = (*Col*)10; endline = (*EndLine*)65; endcol = (*EndCol*)11 }); (201, { line = (*Line*)67; col = (*Col*)12; endline = (*EndLine*)67; endcol = (*EndCol*)12 }); (213, { line = (*Line*)69; col = (*Col*)14; endline = (*EndLine*)69; endcol = (*EndCol*)14 }); (186, { line = (*Line*)64; col = (*Col*)10; endline = (*EndLine*)64; endcol = (*EndCol*)11 }); (87, { line = (*Line*)37; col = (*Col*)23; endline = (*EndLine*)37; endcol = (*EndCol*)23 }); (96, { line = (*Line*)37; col = (*Col*)40; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (177, { line = (*Line*)63; col = (*Col*)10; endline = (*EndLine*)63; endcol = (*EndCol*)15 }); (132, { line = (*Line*)44; col = (*Col*)14; endline = (*EndLine*)44; endcol = (*EndCol*)16 }); (150, { line = (*Line*)49; col = (*Col*)9; endline = (*EndLine*)49; endcol = (*EndCol*)9 }); (141, { line = (*Line*)46; col = (*Col*)19; endline = (*EndLine*)46; endcol = (*EndCol*)19 }); (105, { line = (*Line*)41; col = (*Col*)21; endline = (*EndLine*)41; endcol = (*EndCol*)25 }); (114, { line = (*Line*)42; col = (*Col*)18; endline = (*EndLine*)42; endcol = (*EndCol*)22 }); (123, { line = (*Line*)43; col = (*Col*)6; endline = (*EndLine*)43; endcol = (*EndCol*)6 }); (204, { line = (*Line*)68; col = (*Col*)4; endline = (*EndLine*)68; endcol = (*EndCol*)7 }); (195, { line = (*Line*)65; col = (*Col*)15; endline = (*EndLine*)65; endcol = (*EndCol*)16 }); (78, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)40 }); (99, { line = (*Line*)38; col = (*Col*)8; endline = (*EndLine*)38; endcol = (*EndCol*)8 }); (90, { line = (*Line*)37; col = (*Col*)28; endline = (*EndLine*)37; endcol = (*EndCol*)36 }); (45, { line = (*Line*)23; col = (*Col*)16; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (171, { line = (*Line*)62; col = (*Col*)13; endline = (*EndLine*)62; endcol = (*EndCol*)14 }); (81, { line = (*Line*)37; col = (*Col*)10; endline = (*EndLine*)37; endcol = (*EndCol*)19 }); (144, { line = (*Line*)47; col = (*Col*)9; endline = (*EndLine*)47; endcol = (*EndCol*)13 }); (126, { line = (*Line*)43; col = (*Col*)16; endline = (*EndLine*)43; endcol = (*EndCol*)16 }); (162, { line = (*Line*)58; col = (*Col*)14; endline = (*EndLine*)58; endcol = (*EndCol*)14 }); (108, { line = (*Line*)42; col = (*Col*)3; endline = (*EndLine*)42; endcol = (*EndCol*)5 }); (135, { line = (*Line*)46; col = (*Col*)9; endline = (*EndLine*)46; endcol = (*EndCol*)19 }); (117, { line = (*Line*)42; col = (*Col*)26; endline = (*EndLine*)42; endcol = (*EndCol*)29 }); (84, { line = (*Line*)37; col = (*Col*)13; endline = (*EndLine*)37; endcol = (*EndCol*)16 }); (102, { line = (*Line*)41; col = (*Col*)13; endline = (*EndLine*)41; endcol = (*EndCol*)16 }); (93, { line = (*Line*)37; col = (*Col*)31; endline = (*EndLine*)37; endcol = (*EndCol*)35 }); (75, { line = (*Line*)36; col = (*Col*)12; endline = (*EndLine*)36; endcol = (*EndCol*)12 }); (111, { line = (*Line*)42; col = (*Col*)10; endline = (*EndLine*)42; endcol = (*EndCol*)13 }); (66, { line = (*Line*)33; col = (*Col*)7; endline = (*EndLine*)33; endcol = (*EndCol*)10 }); (42, { line = (*Line*)23; col = (*Col*)12; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (212, { line = (*Line*)69; col = (*Col*)14; endline = (*EndLine*)69; endcol = (*EndCol*)14 }); (152, { line = (*Line*)49; col = (*Col*)14; endline = (*EndLine*)49; endcol = (*EndCol*)16 }); (179, { line = (*Line*)63; col = (*Col*)10; endline = (*EndLine*)63; endcol = (*EndCol*)11 }); (215, { line = (*Line*)69; col = (*Col*)17; endline = (*EndLine*)69; endcol = (*EndCol*)17 }); (206, { line = (*Line*)68; col = (*Col*)6; endline = (*EndLine*)68; endcol = (*EndCol*)6 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(23, ("A", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/A+28:22")); (32, ("X4", "ada://variable/Binary_Search_Test+1:11/X4+59:4")); (17, ("Y", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/Y+21:36")); (26, ("Left", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Left+29:7")); (29, ("X1", "ada://variable/Binary_Search_Test+1:11/X1+56:4")); (2, ("I", "ada://parameter/Binary_Search_Test+1:11/I+1:31")); (14, ("Y", "ada://component/Binary_Search_Test+1:11/RT+16:9/Y+18:7")); (13, ("X", "ada://component/Binary_Search_Test+1:11/RT+16:9/X+17:7")); (31, ("X3", "ada://variable/Binary_Search_Test+1:11/X3+58:4")); (7, ("R", "ada://variable/Binary_Search_Test+1:11/R+9:4")); (16, ("X", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/X+21:24")); (25, ("R", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/R+28:43")); (28, ("Med", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Med+31:7")); (27, ("Right", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Right+30:7")); (21, ("B", "ada://variable/Binary_Search_Test+1:11/B+25:4")); (30, ("X2", "ada://variable/Binary_Search_Test+1:11/X2+57:4")); (6, ("A", "ada://variable/Binary_Search_Test+1:11/A+8:4")); (24, ("I", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/I+28:30"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(22, ("Search", "ada://procedure_body/Binary_Search_Test+1:11/Search+28:14")); (1, ("Binary_Search_Test", "ada://procedure_body/Binary_Search_Test+1:11")); (15, ("increase", "ada://procedure_body/Binary_Search_Test+1:11/increase+21:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(8, ("T1", "ada://ordinary_type/Binary_Search_Test+1:11/T1+12:9")); (11, ("T4", "ada://subtype/Binary_Search_Test+1:11/T4+15:12")); (5, ("Ar", "ada://ordinary_type/Binary_Search_Test+1:11/Ar+6:9")); (4, ("U", "ada://subtype/Binary_Search_Test+1:11/U+4:12")); (10, ("T3", "ada://subtype/Binary_Search_Test+1:11/T3+14:12")); (9, ("T2", "ada://ordinary_type/Binary_Search_Test+1:11/T2+13:9")); (12, ("RT", "ada://ordinary_type/Binary_Search_Test+1:11/RT+16:9")); (3, ("T", "ada://ordinary_type/Binary_Search_Test+1:11/T+3:9"))]
})
}


