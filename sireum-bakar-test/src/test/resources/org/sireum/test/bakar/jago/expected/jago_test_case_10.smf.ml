

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Test_Case_10*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*I1*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*I2*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 5; parameter_name = ((*I3*) 4); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 6; parameter_name = ((*O1*) 5); parameter_subtype_mark = Integer; parameter_mode = Out }; 
  { parameter_astnum = 7; parameter_name = ((*O2*) 6); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (8,
  (ObjDecl (9, { declaration_astnum = 10; object_name = ((*L1*) 7); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (11, { declaration_astnum = 12; object_name = ((*L2*) 8); object_nominal_subtype = Integer; initialization_exp = None }))))],
    (* = = = Procedure Body = = = *)
    (Seq (13,
    (Assign (14, (Identifier (15, ((*L2*) 8) )), (Literal (16, (Integer_Literal 5) )))),
    (Seq (17,
    (Assign (18, (Identifier (19, ((*L1*) 7) )), (Name (20, (Identifier (21, ((*I3*) 4) )))))),
    (Seq (22,
    (Assign (23, (Identifier (24, ((*O2*) 6) )), (Name (25, (Identifier (26, ((*L1*) 7) )))))),
    (Seq (27,
    (Assign (28, (Identifier (29, ((*L1*) 7) )), (Name (30, (Identifier (31, ((*I2*) 3) )))))),
    (Seq (32,
    (Assign (33, (Identifier (34, ((*L1*) 7) )), (BinOp (35, Plus, (Name (36, (Identifier (37, ((*I1*) 2) )))), (Name (38, (Identifier (39, ((*I2*) 3) )))) )))),
    (Seq (40,
    (If (41, (BinOp (42, Greater_Than, (Name (43, (Identifier (44, ((*L1*) 7) )))), (Literal (45, (Integer_Literal 5) )) )),
      (If (46, (BinOp (47, Less_Than, (Name (48, (Identifier (49, ((*I1*) 2) )))), (Literal (50, (Integer_Literal 0) )) )),
        (Assign (51, (Identifier (52, ((*L2*) 8) )), (Literal (53, (Integer_Literal 8) )))),
        Null)
      ),
      Null)
    ),
    (Assign (54, (Identifier (55, ((*O1*) 5) )), (Name (56, (Identifier (57, ((*L2*) 8) ))))))))))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*L2*) 8), (In_Out, Integer)); (((*O1*) 5), (Out, Integer)); (((*L1*) 7), (In_Out, Integer)); (((*I3*) 4), (In, Integer)); (((*I2*) 3), (In, Integer)); (((*I1*) 2), (In, Integer)); (((*O2*) 6), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test_Case_10*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Test_Case_10*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*I1*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*I2*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 5; parameter_name = ((*I3*) 4); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 6; parameter_name = ((*O1*) 5); parameter_subtype_mark = Integer; parameter_mode = Out }; 
{ parameter_astnum = 7; parameter_name = ((*O2*) 6); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (8,
(ObjDecl (9, { declaration_astnum = 10; object_name = ((*L1*) 7); object_nominal_subtype = Integer; initialization_exp = None })),
(ObjDecl (11, { declaration_astnum = 12; object_name = ((*L2*) 8); object_nominal_subtype = Integer; initialization_exp = None }))))],
  (* = = = Procedure Body = = = *)
  (Seq (13,
  (Assign (14, (Identifier (15, ((*L2*) 8) )), (Literal (16, (Integer_Literal 5) )))),
  (Seq (17,
  (Assign (18, (Identifier (19, ((*L1*) 7) )), (Name (20, (Identifier (21, ((*I3*) 4) )))))),
  (Seq (22,
  (Assign (23, (Identifier (24, ((*O2*) 6) )), (Name (25, (Identifier (26, ((*L1*) 7) )))))),
  (Seq (27,
  (Assign (28, (Identifier (29, ((*L1*) 7) )), (Name (30, (Identifier (31, ((*I2*) 3) )))))),
  (Seq (32,
  (Assign (33, (Identifier (34, ((*L1*) 7) )), (BinOp (35, Plus, (Name (36, (Identifier (37, ((*I1*) 2) )))), (Name (38, (Identifier (39, ((*I2*) 3) )))) )))),
  (Seq (40,
  (If (41, (BinOp (42, Greater_Than, (Name (43, (Identifier (44, ((*L1*) 7) )))), (Literal (45, (Integer_Literal 5) )) )),
    (If (46, (BinOp (47, Less_Than, (Name (48, (Identifier (49, ((*I1*) 2) )))), (Literal (50, (Integer_Literal 0) )) )),
      (Assign (51, (Identifier (52, ((*L2*) 8) )), (Literal (53, (Integer_Literal 8) )))),
      Null)
    ),
    Null)
  ),
  (Assign (54, (Identifier (55, ((*O1*) 5) )), (Name (56, (Identifier (57, ((*L2*) 8) ))))))))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(50, Integer); (53, Integer); (35, Integer); (44, Integer); (26, Integer); (56, Integer); (29, Integer); (38, Integer); (47, Boolean); (20, Integer); (55, Integer); (49, Integer); (31, Integer); (16, Integer); (52, Integer); (43, Integer); (34, Integer); (25, Integer); (37, Integer); (19, Integer); (45, Integer); (36, Integer); (57, Integer); (21, Integer); (48, Integer); (30, Integer); (39, Integer); (15, Integer); (42, Boolean); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(50, { line = (*Line*)13; col = (*Col*)21; endline = (*EndLine*)13; endcol = (*EndCol*)21 }); (53, { line = (*Line*)15; col = (*Col*)23; endline = (*EndLine*)15; endcol = (*EndCol*)23 }); (35, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)21 }); (44, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (26, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (56, { line = (*Line*)19; col = (*Col*)15; endline = (*EndLine*)19; endcol = (*EndCol*)16 }); (29, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)10 }); (38, { line = (*Line*)10; col = (*Col*)20; endline = (*EndLine*)10; endcol = (*EndCol*)21 }); (47, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)21 }); (20, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (55, { line = (*Line*)19; col = (*Col*)9; endline = (*EndLine*)19; endcol = (*EndCol*)10 }); (49, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)17 }); (31, { line = (*Line*)9; col = (*Col*)15; endline = (*EndLine*)9; endcol = (*EndCol*)16 }); (16, { line = (*Line*)6; col = (*Col*)15; endline = (*EndLine*)6; endcol = (*EndCol*)15 }); (52, { line = (*Line*)15; col = (*Col*)17; endline = (*EndLine*)15; endcol = (*EndCol*)18 }); (43, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (34, { line = (*Line*)10; col = (*Col*)9; endline = (*EndLine*)10; endcol = (*EndCol*)10 }); (25, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (37, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (19, { line = (*Line*)7; col = (*Col*)9; endline = (*EndLine*)7; endcol = (*EndCol*)10 }); (45, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (36, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (57, { line = (*Line*)19; col = (*Col*)15; endline = (*EndLine*)19; endcol = (*EndCol*)16 }); (21, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (48, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)17 }); (30, { line = (*Line*)9; col = (*Col*)15; endline = (*EndLine*)9; endcol = (*EndCol*)16 }); (39, { line = (*Line*)10; col = (*Col*)20; endline = (*EndLine*)10; endcol = (*EndCol*)21 }); (15, { line = (*Line*)6; col = (*Col*)9; endline = (*EndLine*)6; endcol = (*EndCol*)10 }); (42, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (24, { line = (*Line*)8; col = (*Col*)9; endline = (*EndLine*)8; endcol = (*EndCol*)10 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("L2", "ada://variable/Test_Case_10+1:15/L2+4:8")); (2, ("I1", "ada://parameter/Test_Case_10+1:15/I1+1:29")); (5, ("O1", "ada://parameter/Test_Case_10+1:15/O1+1:78")); (4, ("I3", "ada://parameter/Test_Case_10+1:15/I3+1:61")); (7, ("L1", "ada://variable/Test_Case_10+1:15/L1+3:8")); (3, ("I2", "ada://parameter/Test_Case_10+1:15/I2+1:45")); (6, ("O2", "ada://parameter/Test_Case_10+1:15/O2+1:95"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Test_Case_10", "ada://procedure_body/Test_Case_10+1:15"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Test_Case_10*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*I1*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*I2*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 5; parameter_nameRT = ((*I3*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 6; parameter_nameRT = ((*O1*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = Out }; 
  { parameter_astnumRT = 7; parameter_nameRT = ((*O2*) 6); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (8,
  (ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*L1*) 7); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*L2*) 8); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (13,
    (AssignRT (14, (IdentifierRT (15, ((*L2*) 8) , [])), (LiteralRT (16, (Integer_Literal 5) , [], [])))),
    (SeqRT (17,
    (AssignRT (18, (IdentifierRT (19, ((*L1*) 7) , [])), (NameRT (20, (IdentifierRT (21, ((*I3*) 4) , [])))))),
    (SeqRT (22,
    (AssignRT (23, (IdentifierRT (24, ((*O2*) 6) , [])), (NameRT (25, (IdentifierRT (26, ((*L1*) 7) , [])))))),
    (SeqRT (27,
    (AssignRT (28, (IdentifierRT (29, ((*L1*) 7) , [])), (NameRT (30, (IdentifierRT (31, ((*I2*) 3) , [])))))),
    (SeqRT (32,
    (AssignRT (33, (IdentifierRT (34, ((*L1*) 7) , [])), (BinOpRT (35, Plus, (NameRT (36, (IdentifierRT (37, ((*I1*) 2) , [])))), (NameRT (38, (IdentifierRT (39, ((*I2*) 3) , [])))) , [OverflowCheck], [])))),
    (SeqRT (40,
    (IfRT (41, (BinOpRT (42, Greater_Than, (NameRT (43, (IdentifierRT (44, ((*L1*) 7) , [])))), (LiteralRT (45, (Integer_Literal 5) , [], [])) , [], [])),
      (IfRT (46, (BinOpRT (47, Less_Than, (NameRT (48, (IdentifierRT (49, ((*I1*) 2) , [])))), (LiteralRT (50, (Integer_Literal 0) , [], [])) , [], [])),
        (AssignRT (51, (IdentifierRT (52, ((*L2*) 8) , [])), (LiteralRT (53, (Integer_Literal 8) , [], [])))),
        NullRT)
      ),
      NullRT)
    ),
    (AssignRT (54, (IdentifierRT (55, ((*O1*) 5) , [])), (NameRT (56, (IdentifierRT (57, ((*L2*) 8) , []))))))))))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*L2*) 8), (In_Out, Integer)); (((*O1*) 5), (Out, Integer)); (((*L1*) 7), (In_Out, Integer)); (((*I3*) 4), (In, Integer)); (((*I2*) 3), (In, Integer)); (((*I1*) 2), (In, Integer)); (((*O2*) 6), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test_Case_10*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Test_Case_10*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*I1*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*I2*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 5; parameter_nameRT = ((*I3*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 6; parameter_nameRT = ((*O1*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = Out }; 
{ parameter_astnumRT = 7; parameter_nameRT = ((*O2*) 6); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (8,
(ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*L1*) 7); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*L2*) 8); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (13,
  (AssignRT (14, (IdentifierRT (15, ((*L2*) 8) , [])), (LiteralRT (16, (Integer_Literal 5) , [], [])))),
  (SeqRT (17,
  (AssignRT (18, (IdentifierRT (19, ((*L1*) 7) , [])), (NameRT (20, (IdentifierRT (21, ((*I3*) 4) , [])))))),
  (SeqRT (22,
  (AssignRT (23, (IdentifierRT (24, ((*O2*) 6) , [])), (NameRT (25, (IdentifierRT (26, ((*L1*) 7) , [])))))),
  (SeqRT (27,
  (AssignRT (28, (IdentifierRT (29, ((*L1*) 7) , [])), (NameRT (30, (IdentifierRT (31, ((*I2*) 3) , [])))))),
  (SeqRT (32,
  (AssignRT (33, (IdentifierRT (34, ((*L1*) 7) , [])), (BinOpRT (35, Plus, (NameRT (36, (IdentifierRT (37, ((*I1*) 2) , [])))), (NameRT (38, (IdentifierRT (39, ((*I2*) 3) , [])))) , [OverflowCheck], [])))),
  (SeqRT (40,
  (IfRT (41, (BinOpRT (42, Greater_Than, (NameRT (43, (IdentifierRT (44, ((*L1*) 7) , [])))), (LiteralRT (45, (Integer_Literal 5) , [], [])) , [], [])),
    (IfRT (46, (BinOpRT (47, Less_Than, (NameRT (48, (IdentifierRT (49, ((*I1*) 2) , [])))), (LiteralRT (50, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (51, (IdentifierRT (52, ((*L2*) 8) , [])), (LiteralRT (53, (Integer_Literal 8) , [], [])))),
      NullRT)
    ),
    NullRT)
  ),
  (AssignRT (54, (IdentifierRT (55, ((*O1*) 5) , [])), (NameRT (56, (IdentifierRT (57, ((*L2*) 8) , []))))))))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(50, Integer); (53, Integer); (35, Integer); (44, Integer); (26, Integer); (56, Integer); (29, Integer); (38, Integer); (47, Boolean); (20, Integer); (55, Integer); (49, Integer); (31, Integer); (16, Integer); (52, Integer); (43, Integer); (34, Integer); (25, Integer); (37, Integer); (19, Integer); (45, Integer); (36, Integer); (57, Integer); (21, Integer); (48, Integer); (30, Integer); (39, Integer); (15, Integer); (42, Boolean); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(50, { line = (*Line*)13; col = (*Col*)21; endline = (*EndLine*)13; endcol = (*EndCol*)21 }); (53, { line = (*Line*)15; col = (*Col*)23; endline = (*EndLine*)15; endcol = (*EndCol*)23 }); (35, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)21 }); (44, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (26, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (56, { line = (*Line*)19; col = (*Col*)15; endline = (*EndLine*)19; endcol = (*EndCol*)16 }); (29, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)10 }); (38, { line = (*Line*)10; col = (*Col*)20; endline = (*EndLine*)10; endcol = (*EndCol*)21 }); (47, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)21 }); (20, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (55, { line = (*Line*)19; col = (*Col*)9; endline = (*EndLine*)19; endcol = (*EndCol*)10 }); (49, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)17 }); (31, { line = (*Line*)9; col = (*Col*)15; endline = (*EndLine*)9; endcol = (*EndCol*)16 }); (16, { line = (*Line*)6; col = (*Col*)15; endline = (*EndLine*)6; endcol = (*EndCol*)15 }); (52, { line = (*Line*)15; col = (*Col*)17; endline = (*EndLine*)15; endcol = (*EndCol*)18 }); (43, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (34, { line = (*Line*)10; col = (*Col*)9; endline = (*EndLine*)10; endcol = (*EndCol*)10 }); (25, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (37, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (19, { line = (*Line*)7; col = (*Col*)9; endline = (*EndLine*)7; endcol = (*EndCol*)10 }); (45, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (36, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (57, { line = (*Line*)19; col = (*Col*)15; endline = (*EndLine*)19; endcol = (*EndCol*)16 }); (21, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (48, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)17 }); (30, { line = (*Line*)9; col = (*Col*)15; endline = (*EndLine*)9; endcol = (*EndCol*)16 }); (39, { line = (*Line*)10; col = (*Col*)20; endline = (*EndLine*)10; endcol = (*EndCol*)21 }); (15, { line = (*Line*)6; col = (*Col*)9; endline = (*EndLine*)6; endcol = (*EndCol*)10 }); (42, { line = (*Line*)11; col = (*Col*)12; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (24, { line = (*Line*)8; col = (*Col*)9; endline = (*EndLine*)8; endcol = (*EndCol*)10 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("L2", "ada://variable/Test_Case_10+1:15/L2+4:8")); (2, ("I1", "ada://parameter/Test_Case_10+1:15/I1+1:29")); (5, ("O1", "ada://parameter/Test_Case_10+1:15/O1+1:78")); (4, ("I3", "ada://parameter/Test_Case_10+1:15/I3+1:61")); (7, ("L1", "ada://variable/Test_Case_10+1:15/L1+3:8")); (3, ("I2", "ada://parameter/Test_Case_10+1:15/I2+1:45")); (6, ("O2", "ada://parameter/Test_Case_10+1:15/O2+1:95"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Test_Case_10", "ada://procedure_body/Test_Case_10+1:15"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


