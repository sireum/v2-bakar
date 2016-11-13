

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (IntegerTypeDecl (4, ((*T*) 1), (Range (0, 10)))))),
(SeqDecl (5,
(TypeDecl (6, (SubtypeDecl (7, ((*U*) 2), (Integer_Type ((*T*) 1)), (Range (1, 10)))))),
(SeqDecl (8,
(TypeDecl (9, (ArrayTypeDecl (10, ((*Ar*) 3), ((*index subtype mark*) (Subtype ((*U*) 2))), ((*component type*) Integer))))),
NullDecl (* Undefined Declarations ! *))))))),
(ProcBodyDecl (11, 
  mkprocBodyDecl (
   12,
    (* = = = Procedure Name = = = *)
    ((*Search*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 13; parameter_name = ((*A*) 6); parameter_subtype_mark = (Array_Type ((*Ar*) 3)); parameter_mode = In }; 
  { parameter_astnum = 14; parameter_name = ((*I*) 7); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 15; parameter_name = ((*Result*) 8); parameter_subtype_mark = (Integer_Type ((*T*) 1)); parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDecl (16,
    (ObjDecl (17, { declaration_astnum = 18; object_name = ((*Left*) 9); object_nominal_subtype = (Subtype ((*U*) 2)); initialization_exp = None })),
    (SeqDecl (19,
    (ObjDecl (20, { declaration_astnum = 21; object_name = ((*Right*) 10); object_nominal_subtype = (Subtype ((*U*) 2)); initialization_exp = None })),
    (ObjDecl (22, { declaration_astnum = 23; object_name = ((*Med*) 11); object_nominal_subtype = (Subtype ((*U*) 2)); initialization_exp = None })))))),
    (* = = = Procedure Body = = = *)
    (Seq (24,
    (Assign (25, (Identifier (26, ((*Left*) 9) )), (Literal (27, (Integer_Literal 1) )))),
    (Seq (28,
    (Assign (29, (Identifier (30, ((*Right*) 10) )), (Literal (31, (Integer_Literal 10) )))),
    (Seq (32,
    (Assign (33, (Identifier (34, ((*Result*) 8) )), (Literal (35, (Integer_Literal 0) )))),
    (Seq (36,
    (If (37, (BinOp (38, Or, (BinOp (39, Greater_Than, (Name (40, (IndexedComponent (41, (Identifier (42, ((*A*) 6) )), (BinOp (43, Plus, (Name (44, (Identifier (45, ((*Left*) 9) )))), (Literal (46, (Integer_Literal 1) )) )) )))), (Name (47, (Identifier (48, ((*I*) 7) )))) )), (BinOp (49, Less_Than, (Name (50, (IndexedComponent (51, (Identifier (52, ((*A*) 6) )), (Name (53, (Identifier (54, ((*Right*) 10) )))) )))), (Name (55, (Identifier (56, ((*I*) 7) )))) )) )),
      (Assign (57, (Identifier (58, ((*Result*) 8) )), (Literal (59, (Integer_Literal 0) )))),
      Null)
    ),
    (While (60, (BinOp (61, Less_Than_Or_Equal, (Name (62, (Identifier (63, ((*Left*) 9) )))), (Name (64, (Identifier (65, ((*Right*) 10) )))) )),
      (Seq (66,
      (Assign (67, (Identifier (68, ((*Med*) 11) )), (BinOp (69, Plus, (Name (70, (Identifier (71, ((*Left*) 9) )))), (BinOp (72, Divide, (BinOp (73, Minus, (Name (74, (Identifier (75, ((*Right*) 10) )))), (Name (76, (Identifier (77, ((*Left*) 9) )))) )), (Literal (78, (Integer_Literal 2) )) )) )))),
      (If (79, (BinOp (80, Less_Than, (Name (81, (IndexedComponent (82, (Identifier (83, ((*A*) 6) )), (Name (84, (Identifier (85, ((*Med*) 11) )))) )))), (Name (86, (Identifier (87, ((*I*) 7) )))) )),
        (Assign (88, (Identifier (89, ((*Left*) 9) )), (BinOp (90, Plus, (Name (91, (Identifier (92, ((*Med*) 11) )))), (Literal (93, (Integer_Literal 1) )) )))),
        (If (94, (BinOp (95, Greater_Than, (Name (96, (IndexedComponent (97, (Identifier (98, ((*A*) 6) )), (Name (99, (Identifier (100, ((*Med*) 11) )))) )))), (Name (101, (Identifier (102, ((*I*) 7) )))) )),
          (Assign (103, (Identifier (104, ((*Right*) 10) )), (BinOp (105, Minus, (Name (106, (Identifier (107, ((*Med*) 11) )))), (Literal (108, (Integer_Literal 1) )) )))),
          (Assign (109, (Identifier (110, ((*Result*) 8) )), (Name (111, (Identifier (112, ((*Med*) 11) )))))))
        ))
      ))))
    )))))))))
  ))
)));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Result*) 8), (Out, (Integer_Type ((*T*) 1)))); (((*Left*) 9), (In_Out, (Subtype ((*U*) 2)))); (((*I*) 7), (In, Integer)); (((*A*) 6), (In, (Array_Type ((*Ar*) 3)))); (((*Right*) 10), (In_Out, (Subtype ((*U*) 2)))); (((*Med*) 11), (In_Out, (Subtype ((*U*) 2))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Search*) 4), (0, mkprocBodyDecl (
 12,
  (* = = = Procedure Name = = = *)
  ((*Search*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 13; parameter_name = ((*A*) 6); parameter_subtype_mark = (Array_Type ((*Ar*) 3)); parameter_mode = In }; 
{ parameter_astnum = 14; parameter_name = ((*I*) 7); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 15; parameter_name = ((*Result*) 8); parameter_subtype_mark = (Integer_Type ((*T*) 1)); parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDecl (16,
  (ObjDecl (17, { declaration_astnum = 18; object_name = ((*Left*) 9); object_nominal_subtype = (Subtype ((*U*) 2)); initialization_exp = None })),
  (SeqDecl (19,
  (ObjDecl (20, { declaration_astnum = 21; object_name = ((*Right*) 10); object_nominal_subtype = (Subtype ((*U*) 2)); initialization_exp = None })),
  (ObjDecl (22, { declaration_astnum = 23; object_name = ((*Med*) 11); object_nominal_subtype = (Subtype ((*U*) 2)); initialization_exp = None })))))),
  (* = = = Procedure Body = = = *)
  (Seq (24,
  (Assign (25, (Identifier (26, ((*Left*) 9) )), (Literal (27, (Integer_Literal 1) )))),
  (Seq (28,
  (Assign (29, (Identifier (30, ((*Right*) 10) )), (Literal (31, (Integer_Literal 10) )))),
  (Seq (32,
  (Assign (33, (Identifier (34, ((*Result*) 8) )), (Literal (35, (Integer_Literal 0) )))),
  (Seq (36,
  (If (37, (BinOp (38, Or, (BinOp (39, Greater_Than, (Name (40, (IndexedComponent (41, (Identifier (42, ((*A*) 6) )), (BinOp (43, Plus, (Name (44, (Identifier (45, ((*Left*) 9) )))), (Literal (46, (Integer_Literal 1) )) )) )))), (Name (47, (Identifier (48, ((*I*) 7) )))) )), (BinOp (49, Less_Than, (Name (50, (IndexedComponent (51, (Identifier (52, ((*A*) 6) )), (Name (53, (Identifier (54, ((*Right*) 10) )))) )))), (Name (55, (Identifier (56, ((*I*) 7) )))) )) )),
    (Assign (57, (Identifier (58, ((*Result*) 8) )), (Literal (59, (Integer_Literal 0) )))),
    Null)
  ),
  (While (60, (BinOp (61, Less_Than_Or_Equal, (Name (62, (Identifier (63, ((*Left*) 9) )))), (Name (64, (Identifier (65, ((*Right*) 10) )))) )),
    (Seq (66,
    (Assign (67, (Identifier (68, ((*Med*) 11) )), (BinOp (69, Plus, (Name (70, (Identifier (71, ((*Left*) 9) )))), (BinOp (72, Divide, (BinOp (73, Minus, (Name (74, (Identifier (75, ((*Right*) 10) )))), (Name (76, (Identifier (77, ((*Left*) 9) )))) )), (Literal (78, (Integer_Literal 2) )) )) )))),
    (If (79, (BinOp (80, Less_Than, (Name (81, (IndexedComponent (82, (Identifier (83, ((*A*) 6) )), (Name (84, (Identifier (85, ((*Med*) 11) )))) )))), (Name (86, (Identifier (87, ((*I*) 7) )))) )),
      (Assign (88, (Identifier (89, ((*Left*) 9) )), (BinOp (90, Plus, (Name (91, (Identifier (92, ((*Med*) 11) )))), (Literal (93, (Integer_Literal 1) )) )))),
      (If (94, (BinOp (95, Greater_Than, (Name (96, (IndexedComponent (97, (Identifier (98, ((*A*) 6) )), (Name (99, (Identifier (100, ((*Med*) 11) )))) )))), (Name (101, (Identifier (102, ((*I*) 7) )))) )),
        (Assign (103, (Identifier (104, ((*Right*) 10) )), (BinOp (105, Minus, (Name (106, (Identifier (107, ((*Med*) 11) )))), (Literal (108, (Integer_Literal 1) )) )))),
        (Assign (109, (Identifier (110, ((*Result*) 8) )), (Name (111, (Identifier (112, ((*Med*) 11) )))))))
      ))
    ))))
  )))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Ar*) 3), (ArrayTypeDecl (10, ((*Ar*) 3), ((*index subtype mark*) (Subtype ((*U*) 2))), ((*component type*) Integer)))); (((*U*) 2), (SubtypeDecl (7, ((*U*) 2), (Integer_Type ((*T*) 1)), (Range (1, 10))))); (((*T*) 1), (IntegerTypeDecl (4, ((*T*) 1), (Range (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(92, (Subtype ((*U*) 2))); (101, Integer); (83, (Array_Type ((*Ar*) 3))); (110, (Integer_Type ((*T*) 1))); (104, (Subtype ((*U*) 2))); (95, Boolean); (86, Integer); (77, (Subtype ((*U*) 2))); (50, Integer); (41, Integer); (59, Integer); (68, (Subtype ((*U*) 2))); (53, (Subtype ((*U*) 2))); (62, (Subtype ((*U*) 2))); (35, Integer); (44, (Subtype ((*U*) 2))); (26, (Subtype ((*U*) 2))); (89, (Subtype ((*U*) 2))); (80, Boolean); (98, (Array_Type ((*Ar*) 3))); (71, (Subtype ((*U*) 2))); (107, (Subtype ((*U*) 2))); (74, (Subtype ((*U*) 2))); (56, Integer); (47, Integer); (38, Boolean); (65, (Subtype ((*U*) 2))); (106, (Subtype ((*U*) 2))); (46, Integer); (100, (Subtype ((*U*) 2))); (91, (Subtype ((*U*) 2))); (82, Integer); (55, Integer); (64, (Subtype ((*U*) 2))); (73, (Integer_Type ((*T*) 1))); (58, (Integer_Type ((*T*) 1))); (85, (Subtype ((*U*) 2))); (49, Boolean); (40, Integer); (31, Integer); (76, (Subtype ((*U*) 2))); (112, (Subtype ((*U*) 2))); (97, Integer); (52, (Array_Type ((*Ar*) 3))); (43, (Integer_Type ((*T*) 1))); (70, (Subtype ((*U*) 2))); (34, (Integer_Type ((*T*) 1))); (61, Boolean); (87, Integer); (96, Integer); (105, (Integer_Type ((*T*) 1))); (69, (Integer_Type ((*T*) 1))); (78, Integer); (99, (Subtype ((*U*) 2))); (90, (Integer_Type ((*T*) 1))); (63, (Subtype ((*U*) 2))); (54, (Subtype ((*U*) 2))); (45, (Subtype ((*U*) 2))); (72, (Integer_Type ((*T*) 1))); (81, Integer); (108, Integer); (27, Integer); (48, Integer); (84, (Subtype ((*U*) 2))); (102, Integer); (93, Integer); (75, (Subtype ((*U*) 2))); (30, (Subtype ((*U*) 2))); (111, (Subtype ((*U*) 2))); (39, Boolean); (42, (Array_Type ((*Ar*) 3))); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(92, { line = (*Line*)29; col = (*Col*)21; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (101, { line = (*Line*)31; col = (*Col*)24; endline = (*EndLine*)31; endcol = (*EndCol*)24 }); (83, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)13 }); (110, { line = (*Line*)34; col = (*Col*)15; endline = (*EndLine*)34; endcol = (*EndCol*)20 }); (104, { line = (*Line*)32; col = (*Col*)15; endline = (*EndLine*)32; endcol = (*EndCol*)19 }); (95, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)24 }); (86, { line = (*Line*)28; col = (*Col*)23; endline = (*EndLine*)28; endcol = (*EndCol*)23 }); (77, { line = (*Line*)26; col = (*Col*)33; endline = (*EndLine*)26; endcol = (*EndCol*)36 }); (50, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)41 }); (41, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)19 }); (59, { line = (*Line*)22; col = (*Col*)20; endline = (*EndLine*)22; endcol = (*EndCol*)20 }); (68, { line = (*Line*)26; col = (*Col*)10; endline = (*EndLine*)26; endcol = (*EndCol*)12 }); (53, { line = (*Line*)21; col = (*Col*)36; endline = (*EndLine*)21; endcol = (*EndCol*)40 }); (62, { line = (*Line*)25; col = (*Col*)13; endline = (*EndLine*)25; endcol = (*EndCol*)16 }); (35, { line = (*Line*)19; col = (*Col*)17; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (44, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)16 }); (26, { line = (*Line*)16; col = (*Col*)7; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (89, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)16 }); (80, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)23 }); (98, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)14 }); (71, { line = (*Line*)26; col = (*Col*)17; endline = (*EndLine*)26; endcol = (*EndCol*)20 }); (107, { line = (*Line*)32; col = (*Col*)24; endline = (*EndLine*)32; endcol = (*EndCol*)26 }); (74, { line = (*Line*)26; col = (*Col*)25; endline = (*EndLine*)26; endcol = (*EndCol*)29 }); (56, { line = (*Line*)21; col = (*Col*)45; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (47, { line = (*Line*)21; col = (*Col*)23; endline = (*EndLine*)21; endcol = (*EndCol*)23 }); (38, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (65, { line = (*Line*)25; col = (*Col*)21; endline = (*EndLine*)25; endcol = (*EndCol*)25 }); (106, { line = (*Line*)32; col = (*Col*)24; endline = (*EndLine*)32; endcol = (*EndCol*)26 }); (46, { line = (*Line*)21; col = (*Col*)18; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (100, { line = (*Line*)31; col = (*Col*)17; endline = (*EndLine*)31; endcol = (*EndCol*)19 }); (91, { line = (*Line*)29; col = (*Col*)21; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (82, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)19 }); (55, { line = (*Line*)21; col = (*Col*)45; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (64, { line = (*Line*)25; col = (*Col*)21; endline = (*EndLine*)25; endcol = (*EndCol*)25 }); (73, { line = (*Line*)26; col = (*Col*)25; endline = (*EndLine*)26; endcol = (*EndCol*)36 }); (58, { line = (*Line*)22; col = (*Col*)10; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (85, { line = (*Line*)28; col = (*Col*)16; endline = (*EndLine*)28; endcol = (*EndCol*)18 }); (49, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (40, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)19 }); (31, { line = (*Line*)17; col = (*Col*)16; endline = (*EndLine*)17; endcol = (*EndCol*)17 }); (76, { line = (*Line*)26; col = (*Col*)33; endline = (*EndLine*)26; endcol = (*EndCol*)36 }); (112, { line = (*Line*)34; col = (*Col*)25; endline = (*EndLine*)34; endcol = (*EndCol*)27 }); (97, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)20 }); (52, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)33 }); (43, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (70, { line = (*Line*)26; col = (*Col*)17; endline = (*EndLine*)26; endcol = (*EndCol*)20 }); (34, { line = (*Line*)19; col = (*Col*)7; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (61, { line = (*Line*)25; col = (*Col*)13; endline = (*EndLine*)25; endcol = (*EndCol*)25 }); (87, { line = (*Line*)28; col = (*Col*)23; endline = (*EndLine*)28; endcol = (*EndCol*)23 }); (96, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)20 }); (105, { line = (*Line*)32; col = (*Col*)24; endline = (*EndLine*)32; endcol = (*EndCol*)30 }); (69, { line = (*Line*)26; col = (*Col*)17; endline = (*EndLine*)26; endcol = (*EndCol*)41 }); (78, { line = (*Line*)26; col = (*Col*)41; endline = (*EndLine*)26; endcol = (*EndCol*)41 }); (99, { line = (*Line*)31; col = (*Col*)17; endline = (*EndLine*)31; endcol = (*EndCol*)19 }); (90, { line = (*Line*)29; col = (*Col*)21; endline = (*EndLine*)29; endcol = (*EndCol*)27 }); (63, { line = (*Line*)25; col = (*Col*)13; endline = (*EndLine*)25; endcol = (*EndCol*)16 }); (54, { line = (*Line*)21; col = (*Col*)36; endline = (*EndLine*)21; endcol = (*EndCol*)40 }); (45, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)16 }); (72, { line = (*Line*)26; col = (*Col*)24; endline = (*EndLine*)26; endcol = (*EndCol*)41 }); (81, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)19 }); (108, { line = (*Line*)32; col = (*Col*)30; endline = (*EndLine*)32; endcol = (*EndCol*)30 }); (27, { line = (*Line*)16; col = (*Col*)16; endline = (*EndLine*)16; endcol = (*EndCol*)16 }); (48, { line = (*Line*)21; col = (*Col*)23; endline = (*EndLine*)21; endcol = (*EndCol*)23 }); (84, { line = (*Line*)28; col = (*Col*)16; endline = (*EndLine*)28; endcol = (*EndCol*)18 }); (102, { line = (*Line*)31; col = (*Col*)24; endline = (*EndLine*)31; endcol = (*EndCol*)24 }); (93, { line = (*Line*)29; col = (*Col*)27; endline = (*EndLine*)29; endcol = (*EndCol*)27 }); (75, { line = (*Line*)26; col = (*Col*)25; endline = (*EndLine*)26; endcol = (*EndCol*)29 }); (30, { line = (*Line*)17; col = (*Col*)7; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (111, { line = (*Line*)34; col = (*Col*)25; endline = (*EndLine*)34; endcol = (*EndCol*)27 }); (39, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)23 }); (42, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)10 }); (51, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)41 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Result", "ada://parameter/Binary_Search-1:9/Search-16:14/Result-16:43")); (11, ("Med", "ada://variable/Binary_Search-1:9/Search-16:14/Med+14:7")); (7, ("I", "ada://parameter/Binary_Search-1:9/Search-16:14/I-16:30")); (10, ("Right", "ada://variable/Binary_Search-1:9/Search-16:14/Right+13:7")); (9, ("Left", "ada://variable/Binary_Search-1:9/Search-16:14/Left+12:7")); (6, ("A", "ada://parameter/Binary_Search-1:9/Search-16:14/A-16:22"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(4, ("Search", "ada://procedure_body/Binary_Search-1:9/Search-16:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(5, ("Binary_Search", "ada://package_body/Binary_Search-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(2, ("U", "ada://subtype/Binary_Search-1:9/U-12:12")); (1, ("T", "ada://ordinary_type/Binary_Search-1:9/T-11:9")); (3, ("Ar", "ada://ordinary_type/Binary_Search-1:9/Ar-14:9"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (IntegerTypeDeclRT (4, ((*T*) 1), (RangeRT (0, 10)))))),
(SeqDeclRT (5,
(TypeDeclRT (6, (SubtypeDeclRT (7, ((*U*) 2), (Integer_Type ((*T*) 1)), (RangeRT (1, 10)))))),
(SeqDeclRT (8,
(TypeDeclRT (9, (ArrayTypeDeclRT (10, ((*Ar*) 3), ((*index subtype mark*) (Subtype ((*U*) 2))), ((*component type*) Integer))))),
NullDeclRT (* Undefined Declarations ! *))))))),
(ProcBodyDeclRT (11, 
  mkprocBodyDeclRT (
   12,
    (* = = = Procedure Name = = = *)
    ((*Search*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 13; parameter_nameRT = ((*A*) 6); parameter_subtype_markRT = (Array_Type ((*Ar*) 3)); parameter_modeRT = In }; 
  { parameter_astnumRT = 14; parameter_nameRT = ((*I*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 15; parameter_nameRT = ((*Result*) 8); parameter_subtype_markRT = (Integer_Type ((*T*) 1)); parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (16,
    (ObjDeclRT (17, { declaration_astnumRT = 18; object_nameRT = ((*Left*) 9); object_nominal_subtypeRT = (Subtype ((*U*) 2)); initialization_expRT = None })),
    (SeqDeclRT (19,
    (ObjDeclRT (20, { declaration_astnumRT = 21; object_nameRT = ((*Right*) 10); object_nominal_subtypeRT = (Subtype ((*U*) 2)); initialization_expRT = None })),
    (ObjDeclRT (22, { declaration_astnumRT = 23; object_nameRT = ((*Med*) 11); object_nominal_subtypeRT = (Subtype ((*U*) 2)); initialization_expRT = None })))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (24,
    (AssignRT (25, (IdentifierRT (26, ((*Left*) 9) , [])), (LiteralRT (27, (Integer_Literal 1) , [], [])))),
    (SeqRT (28,
    (AssignRT (29, (IdentifierRT (30, ((*Right*) 10) , [])), (LiteralRT (31, (Integer_Literal 10) , [], [])))),
    (SeqRT (32,
    (AssignRT (33, (IdentifierRT (34, ((*Result*) 8) , [])), (LiteralRT (35, (Integer_Literal 0) , [], [])))),
    (SeqRT (36,
    (IfRT (37, (BinOpRT (38, Or, (BinOpRT (39, Greater_Than, (NameRT (40, (IndexedComponentRT (41, (IdentifierRT (42, ((*A*) 6) , [])), (BinOpRT (43, Plus, (NameRT (44, (IdentifierRT (45, ((*Left*) 9) , [])))), (LiteralRT (46, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])))), (NameRT (47, (IdentifierRT (48, ((*I*) 7) , [])))) , [], [])), (BinOpRT (49, Less_Than, (NameRT (50, (IndexedComponentRT (51, (IdentifierRT (52, ((*A*) 6) , [])), (NameRT (53, (IdentifierRT (54, ((*Right*) 10) , [])))) , [])))), (NameRT (55, (IdentifierRT (56, ((*I*) 7) , [])))) , [], [])) , [], [])),
      (AssignRT (57, (IdentifierRT (58, ((*Result*) 8) , [])), (LiteralRT (59, (Integer_Literal 0) , [], [])))),
      NullRT)
    ),
    (WhileRT (60, (BinOpRT (61, Less_Than_Or_Equal, (NameRT (62, (IdentifierRT (63, ((*Left*) 9) , [])))), (NameRT (64, (IdentifierRT (65, ((*Right*) 10) , [])))) , [], [])),
      (SeqRT (66,
      (AssignRT (67, (IdentifierRT (68, ((*Med*) 11) , [])), (BinOpRT (69, Plus, (NameRT (70, (IdentifierRT (71, ((*Left*) 9) , [])))), (BinOpRT (72, Divide, (BinOpRT (73, Minus, (NameRT (74, (IdentifierRT (75, ((*Right*) 10) , [])))), (NameRT (76, (IdentifierRT (77, ((*Left*) 9) , [])))) , [], [])), (LiteralRT (78, (Integer_Literal 2) , [], [])) , [DivCheck], [])) , [RangeCheck], [])))),
      (IfRT (79, (BinOpRT (80, Less_Than, (NameRT (81, (IndexedComponentRT (82, (IdentifierRT (83, ((*A*) 6) , [])), (NameRT (84, (IdentifierRT (85, ((*Med*) 11) , [])))) , [])))), (NameRT (86, (IdentifierRT (87, ((*I*) 7) , [])))) , [], [])),
        (AssignRT (88, (IdentifierRT (89, ((*Left*) 9) , [])), (BinOpRT (90, Plus, (NameRT (91, (IdentifierRT (92, ((*Med*) 11) , [])))), (LiteralRT (93, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
        (IfRT (94, (BinOpRT (95, Greater_Than, (NameRT (96, (IndexedComponentRT (97, (IdentifierRT (98, ((*A*) 6) , [])), (NameRT (99, (IdentifierRT (100, ((*Med*) 11) , [])))) , [])))), (NameRT (101, (IdentifierRT (102, ((*I*) 7) , [])))) , [], [])),
          (AssignRT (103, (IdentifierRT (104, ((*Right*) 10) , [])), (BinOpRT (105, Minus, (NameRT (106, (IdentifierRT (107, ((*Med*) 11) , [])))), (LiteralRT (108, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
          (AssignRT (109, (IdentifierRT (110, ((*Result*) 8) , [])), (NameRT (111, (IdentifierRT (112, ((*Med*) 11) , [])))))))
        ))
      ))))
    )))))))))
  ))
)));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Result*) 8), (Out, (Integer_Type ((*T*) 1)))); (((*Left*) 9), (In_Out, (Subtype ((*U*) 2)))); (((*I*) 7), (In, Integer)); (((*A*) 6), (In, (Array_Type ((*Ar*) 3)))); (((*Right*) 10), (In_Out, (Subtype ((*U*) 2)))); (((*Med*) 11), (In_Out, (Subtype ((*U*) 2))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Search*) 4), (0, mkprocBodyDeclRT (
 12,
  (* = = = Procedure Name = = = *)
  ((*Search*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 13; parameter_nameRT = ((*A*) 6); parameter_subtype_markRT = (Array_Type ((*Ar*) 3)); parameter_modeRT = In }; 
{ parameter_astnumRT = 14; parameter_nameRT = ((*I*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 15; parameter_nameRT = ((*Result*) 8); parameter_subtype_markRT = (Integer_Type ((*T*) 1)); parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (16,
  (ObjDeclRT (17, { declaration_astnumRT = 18; object_nameRT = ((*Left*) 9); object_nominal_subtypeRT = (Subtype ((*U*) 2)); initialization_expRT = None })),
  (SeqDeclRT (19,
  (ObjDeclRT (20, { declaration_astnumRT = 21; object_nameRT = ((*Right*) 10); object_nominal_subtypeRT = (Subtype ((*U*) 2)); initialization_expRT = None })),
  (ObjDeclRT (22, { declaration_astnumRT = 23; object_nameRT = ((*Med*) 11); object_nominal_subtypeRT = (Subtype ((*U*) 2)); initialization_expRT = None })))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (24,
  (AssignRT (25, (IdentifierRT (26, ((*Left*) 9) , [])), (LiteralRT (27, (Integer_Literal 1) , [], [])))),
  (SeqRT (28,
  (AssignRT (29, (IdentifierRT (30, ((*Right*) 10) , [])), (LiteralRT (31, (Integer_Literal 10) , [], [])))),
  (SeqRT (32,
  (AssignRT (33, (IdentifierRT (34, ((*Result*) 8) , [])), (LiteralRT (35, (Integer_Literal 0) , [], [])))),
  (SeqRT (36,
  (IfRT (37, (BinOpRT (38, Or, (BinOpRT (39, Greater_Than, (NameRT (40, (IndexedComponentRT (41, (IdentifierRT (42, ((*A*) 6) , [])), (BinOpRT (43, Plus, (NameRT (44, (IdentifierRT (45, ((*Left*) 9) , [])))), (LiteralRT (46, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])))), (NameRT (47, (IdentifierRT (48, ((*I*) 7) , [])))) , [], [])), (BinOpRT (49, Less_Than, (NameRT (50, (IndexedComponentRT (51, (IdentifierRT (52, ((*A*) 6) , [])), (NameRT (53, (IdentifierRT (54, ((*Right*) 10) , [])))) , [])))), (NameRT (55, (IdentifierRT (56, ((*I*) 7) , [])))) , [], [])) , [], [])),
    (AssignRT (57, (IdentifierRT (58, ((*Result*) 8) , [])), (LiteralRT (59, (Integer_Literal 0) , [], [])))),
    NullRT)
  ),
  (WhileRT (60, (BinOpRT (61, Less_Than_Or_Equal, (NameRT (62, (IdentifierRT (63, ((*Left*) 9) , [])))), (NameRT (64, (IdentifierRT (65, ((*Right*) 10) , [])))) , [], [])),
    (SeqRT (66,
    (AssignRT (67, (IdentifierRT (68, ((*Med*) 11) , [])), (BinOpRT (69, Plus, (NameRT (70, (IdentifierRT (71, ((*Left*) 9) , [])))), (BinOpRT (72, Divide, (BinOpRT (73, Minus, (NameRT (74, (IdentifierRT (75, ((*Right*) 10) , [])))), (NameRT (76, (IdentifierRT (77, ((*Left*) 9) , [])))) , [], [])), (LiteralRT (78, (Integer_Literal 2) , [], [])) , [DivCheck], [])) , [RangeCheck], [])))),
    (IfRT (79, (BinOpRT (80, Less_Than, (NameRT (81, (IndexedComponentRT (82, (IdentifierRT (83, ((*A*) 6) , [])), (NameRT (84, (IdentifierRT (85, ((*Med*) 11) , [])))) , [])))), (NameRT (86, (IdentifierRT (87, ((*I*) 7) , [])))) , [], [])),
      (AssignRT (88, (IdentifierRT (89, ((*Left*) 9) , [])), (BinOpRT (90, Plus, (NameRT (91, (IdentifierRT (92, ((*Med*) 11) , [])))), (LiteralRT (93, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
      (IfRT (94, (BinOpRT (95, Greater_Than, (NameRT (96, (IndexedComponentRT (97, (IdentifierRT (98, ((*A*) 6) , [])), (NameRT (99, (IdentifierRT (100, ((*Med*) 11) , [])))) , [])))), (NameRT (101, (IdentifierRT (102, ((*I*) 7) , [])))) , [], [])),
        (AssignRT (103, (IdentifierRT (104, ((*Right*) 10) , [])), (BinOpRT (105, Minus, (NameRT (106, (IdentifierRT (107, ((*Med*) 11) , [])))), (LiteralRT (108, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
        (AssignRT (109, (IdentifierRT (110, ((*Result*) 8) , [])), (NameRT (111, (IdentifierRT (112, ((*Med*) 11) , [])))))))
      ))
    ))))
  )))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Ar*) 3), (ArrayTypeDeclRT (10, ((*Ar*) 3), ((*index subtype mark*) (Subtype ((*U*) 2))), ((*component type*) Integer)))); (((*U*) 2), (SubtypeDeclRT (7, ((*U*) 2), (Integer_Type ((*T*) 1)), (RangeRT (1, 10))))); (((*T*) 1), (IntegerTypeDeclRT (4, ((*T*) 1), (RangeRT (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(92, (Subtype ((*U*) 2))); (101, Integer); (83, (Array_Type ((*Ar*) 3))); (110, (Integer_Type ((*T*) 1))); (104, (Subtype ((*U*) 2))); (95, Boolean); (86, Integer); (77, (Subtype ((*U*) 2))); (50, Integer); (41, Integer); (59, Integer); (68, (Subtype ((*U*) 2))); (53, (Subtype ((*U*) 2))); (62, (Subtype ((*U*) 2))); (35, Integer); (44, (Subtype ((*U*) 2))); (26, (Subtype ((*U*) 2))); (89, (Subtype ((*U*) 2))); (80, Boolean); (98, (Array_Type ((*Ar*) 3))); (71, (Subtype ((*U*) 2))); (107, (Subtype ((*U*) 2))); (74, (Subtype ((*U*) 2))); (56, Integer); (47, Integer); (38, Boolean); (65, (Subtype ((*U*) 2))); (106, (Subtype ((*U*) 2))); (46, Integer); (100, (Subtype ((*U*) 2))); (91, (Subtype ((*U*) 2))); (82, Integer); (55, Integer); (64, (Subtype ((*U*) 2))); (73, (Integer_Type ((*T*) 1))); (58, (Integer_Type ((*T*) 1))); (85, (Subtype ((*U*) 2))); (49, Boolean); (40, Integer); (31, Integer); (76, (Subtype ((*U*) 2))); (112, (Subtype ((*U*) 2))); (97, Integer); (52, (Array_Type ((*Ar*) 3))); (43, (Integer_Type ((*T*) 1))); (70, (Subtype ((*U*) 2))); (34, (Integer_Type ((*T*) 1))); (61, Boolean); (87, Integer); (96, Integer); (105, (Integer_Type ((*T*) 1))); (69, (Integer_Type ((*T*) 1))); (78, Integer); (99, (Subtype ((*U*) 2))); (90, (Integer_Type ((*T*) 1))); (63, (Subtype ((*U*) 2))); (54, (Subtype ((*U*) 2))); (45, (Subtype ((*U*) 2))); (72, (Integer_Type ((*T*) 1))); (81, Integer); (108, Integer); (27, Integer); (48, Integer); (84, (Subtype ((*U*) 2))); (102, Integer); (93, Integer); (75, (Subtype ((*U*) 2))); (30, (Subtype ((*U*) 2))); (111, (Subtype ((*U*) 2))); (39, Boolean); (42, (Array_Type ((*Ar*) 3))); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(92, { line = (*Line*)29; col = (*Col*)21; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (101, { line = (*Line*)31; col = (*Col*)24; endline = (*EndLine*)31; endcol = (*EndCol*)24 }); (83, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)13 }); (110, { line = (*Line*)34; col = (*Col*)15; endline = (*EndLine*)34; endcol = (*EndCol*)20 }); (104, { line = (*Line*)32; col = (*Col*)15; endline = (*EndLine*)32; endcol = (*EndCol*)19 }); (95, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)24 }); (86, { line = (*Line*)28; col = (*Col*)23; endline = (*EndLine*)28; endcol = (*EndCol*)23 }); (77, { line = (*Line*)26; col = (*Col*)33; endline = (*EndLine*)26; endcol = (*EndCol*)36 }); (50, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)41 }); (41, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)19 }); (59, { line = (*Line*)22; col = (*Col*)20; endline = (*EndLine*)22; endcol = (*EndCol*)20 }); (68, { line = (*Line*)26; col = (*Col*)10; endline = (*EndLine*)26; endcol = (*EndCol*)12 }); (53, { line = (*Line*)21; col = (*Col*)36; endline = (*EndLine*)21; endcol = (*EndCol*)40 }); (62, { line = (*Line*)25; col = (*Col*)13; endline = (*EndLine*)25; endcol = (*EndCol*)16 }); (35, { line = (*Line*)19; col = (*Col*)17; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (44, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)16 }); (26, { line = (*Line*)16; col = (*Col*)7; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (89, { line = (*Line*)29; col = (*Col*)13; endline = (*EndLine*)29; endcol = (*EndCol*)16 }); (80, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)23 }); (98, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)14 }); (71, { line = (*Line*)26; col = (*Col*)17; endline = (*EndLine*)26; endcol = (*EndCol*)20 }); (107, { line = (*Line*)32; col = (*Col*)24; endline = (*EndLine*)32; endcol = (*EndCol*)26 }); (74, { line = (*Line*)26; col = (*Col*)25; endline = (*EndLine*)26; endcol = (*EndCol*)29 }); (56, { line = (*Line*)21; col = (*Col*)45; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (47, { line = (*Line*)21; col = (*Col*)23; endline = (*EndLine*)21; endcol = (*EndCol*)23 }); (38, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (65, { line = (*Line*)25; col = (*Col*)21; endline = (*EndLine*)25; endcol = (*EndCol*)25 }); (106, { line = (*Line*)32; col = (*Col*)24; endline = (*EndLine*)32; endcol = (*EndCol*)26 }); (46, { line = (*Line*)21; col = (*Col*)18; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (100, { line = (*Line*)31; col = (*Col*)17; endline = (*EndLine*)31; endcol = (*EndCol*)19 }); (91, { line = (*Line*)29; col = (*Col*)21; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (82, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)19 }); (55, { line = (*Line*)21; col = (*Col*)45; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (64, { line = (*Line*)25; col = (*Col*)21; endline = (*EndLine*)25; endcol = (*EndCol*)25 }); (73, { line = (*Line*)26; col = (*Col*)25; endline = (*EndLine*)26; endcol = (*EndCol*)36 }); (58, { line = (*Line*)22; col = (*Col*)10; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (85, { line = (*Line*)28; col = (*Col*)16; endline = (*EndLine*)28; endcol = (*EndCol*)18 }); (49, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)45 }); (40, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)19 }); (31, { line = (*Line*)17; col = (*Col*)16; endline = (*EndLine*)17; endcol = (*EndCol*)17 }); (76, { line = (*Line*)26; col = (*Col*)33; endline = (*EndLine*)26; endcol = (*EndCol*)36 }); (112, { line = (*Line*)34; col = (*Col*)25; endline = (*EndLine*)34; endcol = (*EndCol*)27 }); (97, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)20 }); (52, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)33 }); (43, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (70, { line = (*Line*)26; col = (*Col*)17; endline = (*EndLine*)26; endcol = (*EndCol*)20 }); (34, { line = (*Line*)19; col = (*Col*)7; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (61, { line = (*Line*)25; col = (*Col*)13; endline = (*EndLine*)25; endcol = (*EndCol*)25 }); (87, { line = (*Line*)28; col = (*Col*)23; endline = (*EndLine*)28; endcol = (*EndCol*)23 }); (96, { line = (*Line*)31; col = (*Col*)14; endline = (*EndLine*)31; endcol = (*EndCol*)20 }); (105, { line = (*Line*)32; col = (*Col*)24; endline = (*EndLine*)32; endcol = (*EndCol*)30 }); (69, { line = (*Line*)26; col = (*Col*)17; endline = (*EndLine*)26; endcol = (*EndCol*)41 }); (78, { line = (*Line*)26; col = (*Col*)41; endline = (*EndLine*)26; endcol = (*EndCol*)41 }); (99, { line = (*Line*)31; col = (*Col*)17; endline = (*EndLine*)31; endcol = (*EndCol*)19 }); (90, { line = (*Line*)29; col = (*Col*)21; endline = (*EndLine*)29; endcol = (*EndCol*)27 }); (63, { line = (*Line*)25; col = (*Col*)13; endline = (*EndLine*)25; endcol = (*EndCol*)16 }); (54, { line = (*Line*)21; col = (*Col*)36; endline = (*EndLine*)21; endcol = (*EndCol*)40 }); (45, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)16 }); (72, { line = (*Line*)26; col = (*Col*)24; endline = (*EndLine*)26; endcol = (*EndCol*)41 }); (81, { line = (*Line*)28; col = (*Col*)13; endline = (*EndLine*)28; endcol = (*EndCol*)19 }); (108, { line = (*Line*)32; col = (*Col*)30; endline = (*EndLine*)32; endcol = (*EndCol*)30 }); (27, { line = (*Line*)16; col = (*Col*)16; endline = (*EndLine*)16; endcol = (*EndCol*)16 }); (48, { line = (*Line*)21; col = (*Col*)23; endline = (*EndLine*)21; endcol = (*EndCol*)23 }); (84, { line = (*Line*)28; col = (*Col*)16; endline = (*EndLine*)28; endcol = (*EndCol*)18 }); (102, { line = (*Line*)31; col = (*Col*)24; endline = (*EndLine*)31; endcol = (*EndCol*)24 }); (93, { line = (*Line*)29; col = (*Col*)27; endline = (*EndLine*)29; endcol = (*EndCol*)27 }); (75, { line = (*Line*)26; col = (*Col*)25; endline = (*EndLine*)26; endcol = (*EndCol*)29 }); (30, { line = (*Line*)17; col = (*Col*)7; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (111, { line = (*Line*)34; col = (*Col*)25; endline = (*EndLine*)34; endcol = (*EndCol*)27 }); (39, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)23 }); (42, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)10 }); (51, { line = (*Line*)21; col = (*Col*)33; endline = (*EndLine*)21; endcol = (*EndCol*)41 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Result", "ada://parameter/Binary_Search-1:9/Search-16:14/Result-16:43")); (11, ("Med", "ada://variable/Binary_Search-1:9/Search-16:14/Med+14:7")); (7, ("I", "ada://parameter/Binary_Search-1:9/Search-16:14/I-16:30")); (10, ("Right", "ada://variable/Binary_Search-1:9/Search-16:14/Right+13:7")); (9, ("Left", "ada://variable/Binary_Search-1:9/Search-16:14/Left+12:7")); (6, ("A", "ada://parameter/Binary_Search-1:9/Search-16:14/A-16:22"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(4, ("Search", "ada://procedure_body/Binary_Search-1:9/Search-16:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(5, ("Binary_Search", "ada://package_body/Binary_Search-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(2, ("U", "ada://subtype/Binary_Search-1:9/U-12:12")); (1, ("T", "ada://ordinary_type/Binary_Search-1:9/T-11:9")); (3, ("Ar", "ada://ordinary_type/Binary_Search-1:9/Ar-14:9"))]
})
}


