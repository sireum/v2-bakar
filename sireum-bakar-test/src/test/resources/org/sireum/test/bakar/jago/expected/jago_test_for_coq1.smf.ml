

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Test_for_Coq1*) 1),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    (SeqDecl (3,
    (ObjDecl (5, { declaration_astnum = 6; object_name = ((*N*) 3); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (4, (Integer_Literal 25) )))) })),
    (SeqDecl (7,
    (ObjDecl (8, { declaration_astnum = 9; object_name = ((*Result*) 4); object_nominal_subtype = Boolean; initialization_exp = None })),
    (SeqDecl (10,
    (ObjDecl (11, { declaration_astnum = 12; object_name = ((*I*) 5); object_nominal_subtype = Integer; initialization_exp = None })),
    (ObjDecl (13, { declaration_astnum = 14; object_name = ((*X*) 6); object_nominal_subtype = Integer; initialization_exp = None })))))))),
    (* = = = Procedure Body = = = *)
    (Seq (15,
    (Assign (16, (Identifier (17, ((*Result*) 4) )), (Literal (18, (Boolean_Literal true) )))),
    (Seq (19,
    (If (20, (BinOp (21, Less_Than_Or_Equal, (Name (22, (Identifier (23, ((*N*) 3) )))), (Literal (24, (Integer_Literal 1) )) )),
      (Assign (25, (Identifier (26, ((*Result*) 4) )), (Literal (27, (Boolean_Literal false) )))),
      Null)
    ),
    (Seq (28,
    (Assign (29, (Identifier (30, ((*I*) 5) )), (Literal (31, (Integer_Literal 0) )))),
    (While (32, (BinOp (33, Less_Than_Or_Equal, (BinOp (34, Multiply, (Name (35, (Identifier (36, ((*I*) 5) )))), (Name (37, (Identifier (38, ((*I*) 5) )))) )), (Name (39, (Identifier (40, ((*N*) 3) )))) )),
      (Seq (41,
      (Assign (42, (Identifier (43, ((*X*) 6) )), (BinOp (44, Divide, (Name (45, (Identifier (46, ((*N*) 3) )))), (Name (47, (Identifier (48, ((*I*) 5) )))) )))),
      (Seq (49,
      (If (50, (BinOp (51, Equal, (Name (52, (Identifier (53, ((*N*) 3) )))), (BinOp (54, Multiply, (Name (55, (Identifier (56, ((*X*) 6) )))), (Name (57, (Identifier (58, ((*I*) 5) )))) )) )),
        (Assign (59, (Identifier (60, ((*Result*) 4) )), (Literal (61, (Boolean_Literal false) )))),
        Null)
      ),
      (Assign (62, (Identifier (63, ((*I*) 5) )), (BinOp (64, Plus, (Name (65, (Identifier (66, ((*I*) 5) )))), (Literal (67, (Integer_Literal 1) )) )))))))))
    )))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 5), (In_Out, Integer)); (((*X*) 6), (In_Out, Integer)); (((*Result*) 4), (In_Out, Boolean)); (((*N*) 3), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test_for_Coq1*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Test_for_Coq1*) 1),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  (SeqDecl (3,
  (ObjDecl (5, { declaration_astnum = 6; object_name = ((*N*) 3); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (4, (Integer_Literal 25) )))) })),
  (SeqDecl (7,
  (ObjDecl (8, { declaration_astnum = 9; object_name = ((*Result*) 4); object_nominal_subtype = Boolean; initialization_exp = None })),
  (SeqDecl (10,
  (ObjDecl (11, { declaration_astnum = 12; object_name = ((*I*) 5); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (13, { declaration_astnum = 14; object_name = ((*X*) 6); object_nominal_subtype = Integer; initialization_exp = None })))))))),
  (* = = = Procedure Body = = = *)
  (Seq (15,
  (Assign (16, (Identifier (17, ((*Result*) 4) )), (Literal (18, (Boolean_Literal true) )))),
  (Seq (19,
  (If (20, (BinOp (21, Less_Than_Or_Equal, (Name (22, (Identifier (23, ((*N*) 3) )))), (Literal (24, (Integer_Literal 1) )) )),
    (Assign (25, (Identifier (26, ((*Result*) 4) )), (Literal (27, (Boolean_Literal false) )))),
    Null)
  ),
  (Seq (28,
  (Assign (29, (Identifier (30, ((*I*) 5) )), (Literal (31, (Integer_Literal 0) )))),
  (While (32, (BinOp (33, Less_Than_Or_Equal, (BinOp (34, Multiply, (Name (35, (Identifier (36, ((*I*) 5) )))), (Name (37, (Identifier (38, ((*I*) 5) )))) )), (Name (39, (Identifier (40, ((*N*) 3) )))) )),
    (Seq (41,
    (Assign (42, (Identifier (43, ((*X*) 6) )), (BinOp (44, Divide, (Name (45, (Identifier (46, ((*N*) 3) )))), (Name (47, (Identifier (48, ((*I*) 5) )))) )))),
    (Seq (49,
    (If (50, (BinOp (51, Equal, (Name (52, (Identifier (53, ((*N*) 3) )))), (BinOp (54, Multiply, (Name (55, (Identifier (56, ((*X*) 6) )))), (Name (57, (Identifier (58, ((*I*) 5) )))) )) )),
      (Assign (59, (Identifier (60, ((*Result*) 4) )), (Literal (61, (Boolean_Literal false) )))),
      Null)
    ),
    (Assign (62, (Identifier (63, ((*I*) 5) )), (BinOp (64, Plus, (Name (65, (Identifier (66, ((*I*) 5) )))), (Literal (67, (Integer_Literal 1) )) )))))))))
  )))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (53, Integer); (17, Boolean); (35, Integer); (44, Integer); (26, Boolean); (56, Integer); (38, Integer); (47, Integer); (65, Integer); (46, Integer); (64, Integer); (55, Integer); (67, Integer); (58, Integer); (40, Integer); (4, Integer); (31, Integer); (22, Integer); (52, Integer); (43, Integer); (34, Integer); (61, Boolean); (37, Integer); (60, Boolean); (63, Integer); (54, Integer); (45, Integer); (27, Boolean); (18, Boolean); (36, Integer); (57, Integer); (21, Boolean); (48, Integer); (30, Integer); (39, Integer); (66, Integer); (51, Boolean); (33, Boolean); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (53, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)10 }); (17, { line = (*Line*)12; col = (*Col*)4; endline = (*EndLine*)12; endcol = (*EndCol*)9 }); (35, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)10 }); (44, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)16 }); (26, { line = (*Line*)16; col = (*Col*)7; endline = (*EndLine*)16; endcol = (*EndCol*)12 }); (56, { line = (*Line*)21; col = (*Col*)14; endline = (*EndLine*)21; endcol = (*EndCol*)14 }); (38, { line = (*Line*)19; col = (*Col*)12; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (47, { line = (*Line*)20; col = (*Col*)16; endline = (*EndLine*)20; endcol = (*EndCol*)16 }); (65, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (46, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (64, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (55, { line = (*Line*)21; col = (*Col*)14; endline = (*EndLine*)21; endcol = (*EndCol*)14 }); (67, { line = (*Line*)24; col = (*Col*)16; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (58, { line = (*Line*)21; col = (*Col*)18; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (40, { line = (*Line*)19; col = (*Col*)17; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (4, { line = (*Line*)6; col = (*Col*)18; endline = (*EndLine*)6; endcol = (*EndCol*)19 }); (31, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)9 }); (22, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (52, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)10 }); (43, { line = (*Line*)20; col = (*Col*)7; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (34, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (61, { line = (*Line*)22; col = (*Col*)20; endline = (*EndLine*)22; endcol = (*EndCol*)24 }); (37, { line = (*Line*)19; col = (*Col*)12; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (60, { line = (*Line*)22; col = (*Col*)10; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (63, { line = (*Line*)24; col = (*Col*)7; endline = (*EndLine*)24; endcol = (*EndCol*)7 }); (54, { line = (*Line*)21; col = (*Col*)14; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (45, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (27, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)21 }); (18, { line = (*Line*)12; col = (*Col*)14; endline = (*EndLine*)12; endcol = (*EndCol*)17 }); (36, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)10 }); (57, { line = (*Line*)21; col = (*Col*)18; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (21, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (48, { line = (*Line*)20; col = (*Col*)16; endline = (*EndLine*)20; endcol = (*EndCol*)16 }); (30, { line = (*Line*)18; col = (*Col*)4; endline = (*EndLine*)18; endcol = (*EndCol*)4 }); (39, { line = (*Line*)19; col = (*Col*)17; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (66, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (51, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (33, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (24, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(5, ("I", "ada://variable/Test_for_Coq1+4:11/I+8:4")); (4, ("Result", "ada://variable/Test_for_Coq1+4:11/Result+7:4")); (3, ("N", "ada://variable/Test_for_Coq1+4:11/N+6:4")); (6, ("X", "ada://variable/Test_for_Coq1+4:11/X+9:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Test_for_Coq1", "ada://procedure_body/Test_for_Coq1+4:11"))];
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
    ((*Test_for_Coq1*) 1),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (3,
    (ObjDeclRT (5, { declaration_astnumRT = 6; object_nameRT = ((*N*) 3); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (4, (Integer_Literal 25) , [], [])))) })),
    (SeqDeclRT (7,
    (ObjDeclRT (8, { declaration_astnumRT = 9; object_nameRT = ((*Result*) 4); object_nominal_subtypeRT = Boolean; initialization_expRT = None })),
    (SeqDeclRT (10,
    (ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*I*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*X*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (15,
    (AssignRT (16, (IdentifierRT (17, ((*Result*) 4) , [])), (LiteralRT (18, (Boolean_Literal true) , [], [])))),
    (SeqRT (19,
    (IfRT (20, (BinOpRT (21, Less_Than_Or_Equal, (NameRT (22, (IdentifierRT (23, ((*N*) 3) , [])))), (LiteralRT (24, (Integer_Literal 1) , [], [])) , [], [])),
      (AssignRT (25, (IdentifierRT (26, ((*Result*) 4) , [])), (LiteralRT (27, (Boolean_Literal false) , [], [])))),
      NullRT)
    ),
    (SeqRT (28,
    (AssignRT (29, (IdentifierRT (30, ((*I*) 5) , [])), (LiteralRT (31, (Integer_Literal 0) , [], [])))),
    (WhileRT (32, (BinOpRT (33, Less_Than_Or_Equal, (BinOpRT (34, Multiply, (NameRT (35, (IdentifierRT (36, ((*I*) 5) , [])))), (NameRT (37, (IdentifierRT (38, ((*I*) 5) , [])))) , [OverflowCheck], [])), (NameRT (39, (IdentifierRT (40, ((*N*) 3) , [])))) , [], [])),
      (SeqRT (41,
      (AssignRT (42, (IdentifierRT (43, ((*X*) 6) , [])), (BinOpRT (44, Divide, (NameRT (45, (IdentifierRT (46, ((*N*) 3) , [])))), (NameRT (47, (IdentifierRT (48, ((*I*) 5) , [])))) , [DivCheck; OverflowCheck], [])))),
      (SeqRT (49,
      (IfRT (50, (BinOpRT (51, Equal, (NameRT (52, (IdentifierRT (53, ((*N*) 3) , [])))), (BinOpRT (54, Multiply, (NameRT (55, (IdentifierRT (56, ((*X*) 6) , [])))), (NameRT (57, (IdentifierRT (58, ((*I*) 5) , [])))) , [OverflowCheck], [])) , [], [])),
        (AssignRT (59, (IdentifierRT (60, ((*Result*) 4) , [])), (LiteralRT (61, (Boolean_Literal false) , [], [])))),
        NullRT)
      ),
      (AssignRT (62, (IdentifierRT (63, ((*I*) 5) , [])), (BinOpRT (64, Plus, (NameRT (65, (IdentifierRT (66, ((*I*) 5) , [])))), (LiteralRT (67, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))))
    )))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 5), (In_Out, Integer)); (((*X*) 6), (In_Out, Integer)); (((*Result*) 4), (In_Out, Boolean)); (((*N*) 3), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test_for_Coq1*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Test_for_Coq1*) 1),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (3,
  (ObjDeclRT (5, { declaration_astnumRT = 6; object_nameRT = ((*N*) 3); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (4, (Integer_Literal 25) , [], [])))) })),
  (SeqDeclRT (7,
  (ObjDeclRT (8, { declaration_astnumRT = 9; object_nameRT = ((*Result*) 4); object_nominal_subtypeRT = Boolean; initialization_expRT = None })),
  (SeqDeclRT (10,
  (ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*I*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*X*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (15,
  (AssignRT (16, (IdentifierRT (17, ((*Result*) 4) , [])), (LiteralRT (18, (Boolean_Literal true) , [], [])))),
  (SeqRT (19,
  (IfRT (20, (BinOpRT (21, Less_Than_Or_Equal, (NameRT (22, (IdentifierRT (23, ((*N*) 3) , [])))), (LiteralRT (24, (Integer_Literal 1) , [], [])) , [], [])),
    (AssignRT (25, (IdentifierRT (26, ((*Result*) 4) , [])), (LiteralRT (27, (Boolean_Literal false) , [], [])))),
    NullRT)
  ),
  (SeqRT (28,
  (AssignRT (29, (IdentifierRT (30, ((*I*) 5) , [])), (LiteralRT (31, (Integer_Literal 0) , [], [])))),
  (WhileRT (32, (BinOpRT (33, Less_Than_Or_Equal, (BinOpRT (34, Multiply, (NameRT (35, (IdentifierRT (36, ((*I*) 5) , [])))), (NameRT (37, (IdentifierRT (38, ((*I*) 5) , [])))) , [OverflowCheck], [])), (NameRT (39, (IdentifierRT (40, ((*N*) 3) , [])))) , [], [])),
    (SeqRT (41,
    (AssignRT (42, (IdentifierRT (43, ((*X*) 6) , [])), (BinOpRT (44, Divide, (NameRT (45, (IdentifierRT (46, ((*N*) 3) , [])))), (NameRT (47, (IdentifierRT (48, ((*I*) 5) , [])))) , [DivCheck; OverflowCheck], [])))),
    (SeqRT (49,
    (IfRT (50, (BinOpRT (51, Equal, (NameRT (52, (IdentifierRT (53, ((*N*) 3) , [])))), (BinOpRT (54, Multiply, (NameRT (55, (IdentifierRT (56, ((*X*) 6) , [])))), (NameRT (57, (IdentifierRT (58, ((*I*) 5) , [])))) , [OverflowCheck], [])) , [], [])),
      (AssignRT (59, (IdentifierRT (60, ((*Result*) 4) , [])), (LiteralRT (61, (Boolean_Literal false) , [], [])))),
      NullRT)
    ),
    (AssignRT (62, (IdentifierRT (63, ((*I*) 5) , [])), (BinOpRT (64, Plus, (NameRT (65, (IdentifierRT (66, ((*I*) 5) , [])))), (LiteralRT (67, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))))
  )))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (53, Integer); (17, Boolean); (35, Integer); (44, Integer); (26, Boolean); (56, Integer); (38, Integer); (47, Integer); (65, Integer); (46, Integer); (64, Integer); (55, Integer); (67, Integer); (58, Integer); (40, Integer); (4, Integer); (31, Integer); (22, Integer); (52, Integer); (43, Integer); (34, Integer); (61, Boolean); (37, Integer); (60, Boolean); (63, Integer); (54, Integer); (45, Integer); (27, Boolean); (18, Boolean); (36, Integer); (57, Integer); (21, Boolean); (48, Integer); (30, Integer); (39, Integer); (66, Integer); (51, Boolean); (33, Boolean); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (53, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)10 }); (17, { line = (*Line*)12; col = (*Col*)4; endline = (*EndLine*)12; endcol = (*EndCol*)9 }); (35, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)10 }); (44, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)16 }); (26, { line = (*Line*)16; col = (*Col*)7; endline = (*EndLine*)16; endcol = (*EndCol*)12 }); (56, { line = (*Line*)21; col = (*Col*)14; endline = (*EndLine*)21; endcol = (*EndCol*)14 }); (38, { line = (*Line*)19; col = (*Col*)12; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (47, { line = (*Line*)20; col = (*Col*)16; endline = (*EndLine*)20; endcol = (*EndCol*)16 }); (65, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (46, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (64, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (55, { line = (*Line*)21; col = (*Col*)14; endline = (*EndLine*)21; endcol = (*EndCol*)14 }); (67, { line = (*Line*)24; col = (*Col*)16; endline = (*EndLine*)24; endcol = (*EndCol*)16 }); (58, { line = (*Line*)21; col = (*Col*)18; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (40, { line = (*Line*)19; col = (*Col*)17; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (4, { line = (*Line*)6; col = (*Col*)18; endline = (*EndLine*)6; endcol = (*EndCol*)19 }); (31, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)9 }); (22, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (52, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)10 }); (43, { line = (*Line*)20; col = (*Col*)7; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (34, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (61, { line = (*Line*)22; col = (*Col*)20; endline = (*EndLine*)22; endcol = (*EndCol*)24 }); (37, { line = (*Line*)19; col = (*Col*)12; endline = (*EndLine*)19; endcol = (*EndCol*)12 }); (60, { line = (*Line*)22; col = (*Col*)10; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (63, { line = (*Line*)24; col = (*Col*)7; endline = (*EndLine*)24; endcol = (*EndCol*)7 }); (54, { line = (*Line*)21; col = (*Col*)14; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (45, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (27, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)21 }); (18, { line = (*Line*)12; col = (*Col*)14; endline = (*EndLine*)12; endcol = (*EndCol*)17 }); (36, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)10 }); (57, { line = (*Line*)21; col = (*Col*)18; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (21, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (48, { line = (*Line*)20; col = (*Col*)16; endline = (*EndLine*)20; endcol = (*EndCol*)16 }); (30, { line = (*Line*)18; col = (*Col*)4; endline = (*EndLine*)18; endcol = (*EndCol*)4 }); (39, { line = (*Line*)19; col = (*Col*)17; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (66, { line = (*Line*)24; col = (*Col*)12; endline = (*EndLine*)24; endcol = (*EndCol*)12 }); (51, { line = (*Line*)21; col = (*Col*)10; endline = (*EndLine*)21; endcol = (*EndCol*)18 }); (33, { line = (*Line*)19; col = (*Col*)10; endline = (*EndLine*)19; endcol = (*EndCol*)17 }); (24, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(5, ("I", "ada://variable/Test_for_Coq1+4:11/I+8:4")); (4, ("Result", "ada://variable/Test_for_Coq1+4:11/Result+7:4")); (3, ("N", "ada://variable/Test_for_Coq1+4:11/N+6:4")); (6, ("X", "ada://variable/Test_for_Coq1+4:11/X+9:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Test_for_Coq1", "ada://procedure_body/Test_for_Coq1+4:11"))];
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


