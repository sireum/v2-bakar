

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (3,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))))),
(SeqDecl (4,
(ProcBodyDecl (5, 
  mkprocBodyDecl (
   6,
    (* = = = Procedure Name = = = *)
    ((*P*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 7; parameter_name = ((*a*) 5); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 8; parameter_name = ((*b*) 6); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
  { parameter_astnum = 9; parameter_name = ((*c*) 7); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (10,
    (Assign (11, (Identifier (12, ((*b*) 6) )), (BinOp (13, Plus, (Name (14, (Identifier (15, ((*a*) 5) )))), (Name (16, (Identifier (17, ((*b*) 6) )))) )))),
    (Assign (18, (Identifier (19, ((*c*) 7) )), (BinOp (20, Plus, (Name (21, (Identifier (22, ((*a*) 5) )))), (Name (23, (Identifier (24, ((*b*) 6) )))) ))))))
  ))
),
(SeqDecl (25,
(ProcBodyDecl (26, 
  mkprocBodyDecl (
   27,
    (* = = = Procedure Name = = = *)
    ((*helper*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 28; parameter_name = ((*x*) 9); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
  { parameter_astnum = 29; parameter_name = ((*y*) 10); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (30, { declaration_astnum = 31; object_name = ((*arg0*) 11); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (32,
    (Assign (33, (Identifier (34, ((*arg0*) 11) )), (Literal (35, (Integer_Literal 1) )))),
    (Call (36, 37, ((*P*) 1), 
      [(Name (38, (Identifier (39, ((*arg0*) 11) )))); (Name (40, (Identifier (41, ((*x*) 9) )))); (Name (42, (Identifier (43, ((*y*) 10) ))))])
    )))
  ))
),
(ProcBodyDecl (44, 
  mkprocBodyDecl (
   45,
    (* = = = Procedure Name = = = *)
    ((*Q*) 3),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 46; parameter_name = ((*S*) 13); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 47; parameter_name = ((*T*) 14); parameter_subtype_mark = Integer; parameter_mode = Out }; 
  { parameter_astnum = 48; parameter_name = ((*R*) 15); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (49, { declaration_astnum = 50; object_name = ((*L1*) 16); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (51,
    (Assign (52, (Identifier (53, ((*L1*) 16) )), (Name (54, (Identifier (55, ((*S*) 13) )))))),
    (Seq (56,
    (Call (57, 58, ((*P*) 1), 
      [(Literal (59, (Integer_Literal 2) )); (Name (60, (Identifier (61, ((*L1*) 16) )))); (Name (62, (Identifier (63, ((*T*) 14) ))))])
    ),
    (Seq (64,
    (Assign (65, (Identifier (66, ((*R*) 15) )), (Literal (67, (Integer_Literal 5) )))),
    (Assign (68, (Identifier (69, ((*T*) 14) )), (BinOp (70, Plus, (Name (71, (Identifier (72, ((*T*) 14) )))), (Name (73, (Identifier (74, ((*L1*) 16) )))) ))))))))))
  ))
)))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*T*) 14), (Out, Integer)); (((*c*) 7), (Out, Integer)); (((*L1*) 16), (In_Out, Integer)); (((*R*) 15), (Out, Integer)); (((*x*) 9), (In_Out, Integer)); (((*b*) 6), (In_Out, Integer)); (((*arg0*) 11), (In_Out, Integer)); (((*y*) 10), (Out, Integer)); (((*a*) 5), (In, Integer)); (((*S*) 13), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Q*) 3), (0, mkprocBodyDecl (
 45,
  (* = = = Procedure Name = = = *)
  ((*Q*) 3),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 46; parameter_name = ((*S*) 13); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 47; parameter_name = ((*T*) 14); parameter_subtype_mark = Integer; parameter_mode = Out }; 
{ parameter_astnum = 48; parameter_name = ((*R*) 15); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (49, { declaration_astnum = 50; object_name = ((*L1*) 16); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (51,
  (Assign (52, (Identifier (53, ((*L1*) 16) )), (Name (54, (Identifier (55, ((*S*) 13) )))))),
  (Seq (56,
  (Call (57, 58, ((*P*) 1), 
    [(Literal (59, (Integer_Literal 2) )); (Name (60, (Identifier (61, ((*L1*) 16) )))); (Name (62, (Identifier (63, ((*T*) 14) ))))])
  ),
  (Seq (64,
  (Assign (65, (Identifier (66, ((*R*) 15) )), (Literal (67, (Integer_Literal 5) )))),
  (Assign (68, (Identifier (69, ((*T*) 14) )), (BinOp (70, Plus, (Name (71, (Identifier (72, ((*T*) 14) )))), (Name (73, (Identifier (74, ((*L1*) 16) )))) ))))))))))
))); (((*helper*) 2), (0, mkprocBodyDecl (
 27,
  (* = = = Procedure Name = = = *)
  ((*helper*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 28; parameter_name = ((*x*) 9); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
{ parameter_astnum = 29; parameter_name = ((*y*) 10); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (30, { declaration_astnum = 31; object_name = ((*arg0*) 11); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (32,
  (Assign (33, (Identifier (34, ((*arg0*) 11) )), (Literal (35, (Integer_Literal 1) )))),
  (Call (36, 37, ((*P*) 1), 
    [(Name (38, (Identifier (39, ((*arg0*) 11) )))); (Name (40, (Identifier (41, ((*x*) 9) )))); (Name (42, (Identifier (43, ((*y*) 10) ))))])
  )))
))); (((*P*) 1), (0, mkprocBodyDecl (
 6,
  (* = = = Procedure Name = = = *)
  ((*P*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 7; parameter_name = ((*a*) 5); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 8; parameter_name = ((*b*) 6); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
{ parameter_astnum = 9; parameter_name = ((*c*) 7); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (10,
  (Assign (11, (Identifier (12, ((*b*) 6) )), (BinOp (13, Plus, (Name (14, (Identifier (15, ((*a*) 5) )))), (Name (16, (Identifier (17, ((*b*) 6) )))) )))),
  (Assign (18, (Identifier (19, ((*c*) 7) )), (BinOp (20, Plus, (Name (21, (Identifier (22, ((*a*) 5) )))), (Name (23, (Identifier (24, ((*b*) 6) )))) ))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (41, Integer); (59, Integer); (62, Integer); (17, Integer); (35, Integer); (53, Integer); (71, Integer); (74, Integer); (38, Integer); (20, Integer); (14, Integer); (73, Integer); (55, Integer); (67, Integer); (40, Integer); (13, Integer); (22, Integer); (16, Integer); (70, Integer); (43, Integer); (34, Integer); (61, Integer); (19, Integer); (60, Integer); (69, Integer); (63, Integer); (54, Integer); (72, Integer); (21, Integer); (12, Integer); (39, Integer); (66, Integer); (15, Integer); (42, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)7; col = (*Col*)14; endline = (*EndLine*)7; endcol = (*EndCol*)14 }); (41, { line = (*Line*)14; col = (*Col*)17; endline = (*EndLine*)14; endcol = (*EndCol*)17 }); (59, { line = (*Line*)21; col = (*Col*)8; endline = (*EndLine*)21; endcol = (*EndCol*)8 }); (62, { line = (*Line*)21; col = (*Col*)15; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (17, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (35, { line = (*Line*)13; col = (*Col*)17; endline = (*EndLine*)13; endcol = (*EndCol*)17 }); (53, { line = (*Line*)20; col = (*Col*)6; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (71, { line = (*Line*)23; col = (*Col*)11; endline = (*EndLine*)23; endcol = (*EndCol*)11 }); (74, { line = (*Line*)23; col = (*Col*)15; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (38, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (20, { line = (*Line*)7; col = (*Col*)10; endline = (*EndLine*)7; endcol = (*EndCol*)14 }); (14, { line = (*Line*)6; col = (*Col*)10; endline = (*EndLine*)6; endcol = (*EndCol*)10 }); (73, { line = (*Line*)23; col = (*Col*)15; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (55, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (67, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)11 }); (40, { line = (*Line*)14; col = (*Col*)17; endline = (*EndLine*)14; endcol = (*EndCol*)17 }); (13, { line = (*Line*)6; col = (*Col*)10; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (22, { line = (*Line*)7; col = (*Col*)10; endline = (*EndLine*)7; endcol = (*EndCol*)10 }); (16, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (70, { line = (*Line*)23; col = (*Col*)11; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (43, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)20 }); (34, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (61, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)12 }); (19, { line = (*Line*)7; col = (*Col*)5; endline = (*EndLine*)7; endcol = (*EndCol*)5 }); (60, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)12 }); (69, { line = (*Line*)23; col = (*Col*)6; endline = (*EndLine*)23; endcol = (*EndCol*)6 }); (63, { line = (*Line*)21; col = (*Col*)15; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (54, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (72, { line = (*Line*)23; col = (*Col*)11; endline = (*EndLine*)23; endcol = (*EndCol*)11 }); (21, { line = (*Line*)7; col = (*Col*)10; endline = (*EndLine*)7; endcol = (*EndCol*)10 }); (12, { line = (*Line*)6; col = (*Col*)5; endline = (*EndLine*)6; endcol = (*EndCol*)5 }); (39, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (66, { line = (*Line*)22; col = (*Col*)6; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (15, { line = (*Line*)6; col = (*Col*)10; endline = (*EndLine*)6; endcol = (*EndCol*)10 }); (42, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)20 }); (24, { line = (*Line*)7; col = (*Col*)14; endline = (*EndLine*)7; endcol = (*EndCol*)14 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(11, ("arg0", "ada://variable/ProcedureTest01-1:9/helper-7:13/arg0+11:5")); (14, ("T", "ada://parameter/ProcedureTest01-1:9/Q-11:13/T-11:30")); (5, ("a", "ada://parameter/ProcedureTest01-1:9/P-3:13/a-3:15")); (13, ("S", "ada://parameter/ProcedureTest01-1:9/Q-11:13/S-11:15")); (16, ("L1", "ada://variable/ProcedureTest01-1:9/Q-11:13/L1+18:6")); (7, ("c", "ada://parameter/ProcedureTest01-1:9/P-3:13/c-3:49")); (10, ("y", "ada://parameter/ProcedureTest01-1:9/helper-7:13/y-7:39")); (9, ("x", "ada://parameter/ProcedureTest01-1:9/helper-7:13/x-7:20")); (15, ("R", "ada://parameter/ProcedureTest01-1:9/Q-11:13/R-11:46")); (6, ("b", "ada://parameter/ProcedureTest01-1:9/P-3:13/b-3:30"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("helper", "ada://procedure_body/ProcedureTest01-1:9/helper-7:13")); (1, ("P", "ada://procedure/ProcedureTest01-1:9/P-3:13")); (3, ("Q", "ada://procedure_body/ProcedureTest01-1:9/Q-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(4, ("ProcedureTest01", "ada://package_body/ProcedureTest01-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (3,
NullDeclRT (* Undefined Declarations ! *),
NullDeclRT (* Undefined Declarations ! *))))),
(SeqDeclRT (4,
(ProcBodyDeclRT (5, 
  mkprocBodyDeclRT (
   6,
    (* = = = Procedure Name = = = *)
    ((*P*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 7; parameter_nameRT = ((*a*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 8; parameter_nameRT = ((*b*) 6); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
  { parameter_astnumRT = 9; parameter_nameRT = ((*c*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (10,
    (AssignRT (11, (IdentifierRT (12, ((*b*) 6) , [])), (BinOpRT (13, Plus, (NameRT (14, (IdentifierRT (15, ((*a*) 5) , [])))), (NameRT (16, (IdentifierRT (17, ((*b*) 6) , [])))) , [OverflowCheck], [])))),
    (AssignRT (18, (IdentifierRT (19, ((*c*) 7) , [])), (BinOpRT (20, Plus, (NameRT (21, (IdentifierRT (22, ((*a*) 5) , [])))), (NameRT (23, (IdentifierRT (24, ((*b*) 6) , [])))) , [OverflowCheck], []))))))
  ))
),
(SeqDeclRT (25,
(ProcBodyDeclRT (26, 
  mkprocBodyDeclRT (
   27,
    (* = = = Procedure Name = = = *)
    ((*helper*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 28; parameter_nameRT = ((*x*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
  { parameter_astnumRT = 29; parameter_nameRT = ((*y*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (30, { declaration_astnumRT = 31; object_nameRT = ((*arg0*) 11); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (32,
    (AssignRT (33, (IdentifierRT (34, ((*arg0*) 11) , [])), (LiteralRT (35, (Integer_Literal 1) , [], [])))),
    (CallRT (36, 37, ((*P*) 1), 
      [(NameRT (38, (IdentifierRT (39, ((*arg0*) 11) , [])))); (NameRT (40, (IdentifierRT (41, ((*x*) 9) , [])))); (NameRT (42, (IdentifierRT (43, ((*y*) 10) , []))))])
    )))
  ))
),
(ProcBodyDeclRT (44, 
  mkprocBodyDeclRT (
   45,
    (* = = = Procedure Name = = = *)
    ((*Q*) 3),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 46; parameter_nameRT = ((*S*) 13); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 47; parameter_nameRT = ((*T*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = Out }; 
  { parameter_astnumRT = 48; parameter_nameRT = ((*R*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (49, { declaration_astnumRT = 50; object_nameRT = ((*L1*) 16); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (51,
    (AssignRT (52, (IdentifierRT (53, ((*L1*) 16) , [])), (NameRT (54, (IdentifierRT (55, ((*S*) 13) , [])))))),
    (SeqRT (56,
    (CallRT (57, 58, ((*P*) 1), 
      [(LiteralRT (59, (Integer_Literal 2) , [], [])); (NameRT (60, (IdentifierRT (61, ((*L1*) 16) , [])))); (NameRT (62, (IdentifierRT (63, ((*T*) 14) , []))))])
    ),
    (SeqRT (64,
    (AssignRT (65, (IdentifierRT (66, ((*R*) 15) , [])), (LiteralRT (67, (Integer_Literal 5) , [], [])))),
    (AssignRT (68, (IdentifierRT (69, ((*T*) 14) , [])), (BinOpRT (70, Plus, (NameRT (71, (IdentifierRT (72, ((*T*) 14) , [])))), (NameRT (73, (IdentifierRT (74, ((*L1*) 16) , [])))) , [OverflowCheck], []))))))))))
  ))
)))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*T*) 14), (Out, Integer)); (((*c*) 7), (Out, Integer)); (((*L1*) 16), (In_Out, Integer)); (((*R*) 15), (Out, Integer)); (((*x*) 9), (In_Out, Integer)); (((*b*) 6), (In_Out, Integer)); (((*arg0*) 11), (In_Out, Integer)); (((*y*) 10), (Out, Integer)); (((*a*) 5), (In, Integer)); (((*S*) 13), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Q*) 3), (0, mkprocBodyDeclRT (
 45,
  (* = = = Procedure Name = = = *)
  ((*Q*) 3),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 46; parameter_nameRT = ((*S*) 13); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 47; parameter_nameRT = ((*T*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = Out }; 
{ parameter_astnumRT = 48; parameter_nameRT = ((*R*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (49, { declaration_astnumRT = 50; object_nameRT = ((*L1*) 16); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (51,
  (AssignRT (52, (IdentifierRT (53, ((*L1*) 16) , [])), (NameRT (54, (IdentifierRT (55, ((*S*) 13) , [])))))),
  (SeqRT (56,
  (CallRT (57, 58, ((*P*) 1), 
    [(LiteralRT (59, (Integer_Literal 2) , [], [])); (NameRT (60, (IdentifierRT (61, ((*L1*) 16) , [])))); (NameRT (62, (IdentifierRT (63, ((*T*) 14) , []))))])
  ),
  (SeqRT (64,
  (AssignRT (65, (IdentifierRT (66, ((*R*) 15) , [])), (LiteralRT (67, (Integer_Literal 5) , [], [])))),
  (AssignRT (68, (IdentifierRT (69, ((*T*) 14) , [])), (BinOpRT (70, Plus, (NameRT (71, (IdentifierRT (72, ((*T*) 14) , [])))), (NameRT (73, (IdentifierRT (74, ((*L1*) 16) , [])))) , [OverflowCheck], []))))))))))
))); (((*helper*) 2), (0, mkprocBodyDeclRT (
 27,
  (* = = = Procedure Name = = = *)
  ((*helper*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 28; parameter_nameRT = ((*x*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
{ parameter_astnumRT = 29; parameter_nameRT = ((*y*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (30, { declaration_astnumRT = 31; object_nameRT = ((*arg0*) 11); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (32,
  (AssignRT (33, (IdentifierRT (34, ((*arg0*) 11) , [])), (LiteralRT (35, (Integer_Literal 1) , [], [])))),
  (CallRT (36, 37, ((*P*) 1), 
    [(NameRT (38, (IdentifierRT (39, ((*arg0*) 11) , [])))); (NameRT (40, (IdentifierRT (41, ((*x*) 9) , [])))); (NameRT (42, (IdentifierRT (43, ((*y*) 10) , []))))])
  )))
))); (((*P*) 1), (0, mkprocBodyDeclRT (
 6,
  (* = = = Procedure Name = = = *)
  ((*P*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 7; parameter_nameRT = ((*a*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 8; parameter_nameRT = ((*b*) 6); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
{ parameter_astnumRT = 9; parameter_nameRT = ((*c*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (10,
  (AssignRT (11, (IdentifierRT (12, ((*b*) 6) , [])), (BinOpRT (13, Plus, (NameRT (14, (IdentifierRT (15, ((*a*) 5) , [])))), (NameRT (16, (IdentifierRT (17, ((*b*) 6) , [])))) , [OverflowCheck], [])))),
  (AssignRT (18, (IdentifierRT (19, ((*c*) 7) , [])), (BinOpRT (20, Plus, (NameRT (21, (IdentifierRT (22, ((*a*) 5) , [])))), (NameRT (23, (IdentifierRT (24, ((*b*) 6) , [])))) , [OverflowCheck], []))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (41, Integer); (59, Integer); (62, Integer); (17, Integer); (35, Integer); (53, Integer); (71, Integer); (74, Integer); (38, Integer); (20, Integer); (14, Integer); (73, Integer); (55, Integer); (67, Integer); (40, Integer); (13, Integer); (22, Integer); (16, Integer); (70, Integer); (43, Integer); (34, Integer); (61, Integer); (19, Integer); (60, Integer); (69, Integer); (63, Integer); (54, Integer); (72, Integer); (21, Integer); (12, Integer); (39, Integer); (66, Integer); (15, Integer); (42, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)7; col = (*Col*)14; endline = (*EndLine*)7; endcol = (*EndCol*)14 }); (41, { line = (*Line*)14; col = (*Col*)17; endline = (*EndLine*)14; endcol = (*EndCol*)17 }); (59, { line = (*Line*)21; col = (*Col*)8; endline = (*EndLine*)21; endcol = (*EndCol*)8 }); (62, { line = (*Line*)21; col = (*Col*)15; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (17, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (35, { line = (*Line*)13; col = (*Col*)17; endline = (*EndLine*)13; endcol = (*EndCol*)17 }); (53, { line = (*Line*)20; col = (*Col*)6; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (71, { line = (*Line*)23; col = (*Col*)11; endline = (*EndLine*)23; endcol = (*EndCol*)11 }); (74, { line = (*Line*)23; col = (*Col*)15; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (38, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (20, { line = (*Line*)7; col = (*Col*)10; endline = (*EndLine*)7; endcol = (*EndCol*)14 }); (14, { line = (*Line*)6; col = (*Col*)10; endline = (*EndLine*)6; endcol = (*EndCol*)10 }); (73, { line = (*Line*)23; col = (*Col*)15; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (55, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (67, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)11 }); (40, { line = (*Line*)14; col = (*Col*)17; endline = (*EndLine*)14; endcol = (*EndCol*)17 }); (13, { line = (*Line*)6; col = (*Col*)10; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (22, { line = (*Line*)7; col = (*Col*)10; endline = (*EndLine*)7; endcol = (*EndCol*)10 }); (16, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (70, { line = (*Line*)23; col = (*Col*)11; endline = (*EndLine*)23; endcol = (*EndCol*)16 }); (43, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)20 }); (34, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (61, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)12 }); (19, { line = (*Line*)7; col = (*Col*)5; endline = (*EndLine*)7; endcol = (*EndCol*)5 }); (60, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)12 }); (69, { line = (*Line*)23; col = (*Col*)6; endline = (*EndLine*)23; endcol = (*EndCol*)6 }); (63, { line = (*Line*)21; col = (*Col*)15; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (54, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)12 }); (72, { line = (*Line*)23; col = (*Col*)11; endline = (*EndLine*)23; endcol = (*EndCol*)11 }); (21, { line = (*Line*)7; col = (*Col*)10; endline = (*EndLine*)7; endcol = (*EndCol*)10 }); (12, { line = (*Line*)6; col = (*Col*)5; endline = (*EndLine*)6; endcol = (*EndCol*)5 }); (39, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (66, { line = (*Line*)22; col = (*Col*)6; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (15, { line = (*Line*)6; col = (*Col*)10; endline = (*EndLine*)6; endcol = (*EndCol*)10 }); (42, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)20 }); (24, { line = (*Line*)7; col = (*Col*)14; endline = (*EndLine*)7; endcol = (*EndCol*)14 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(11, ("arg0", "ada://variable/ProcedureTest01-1:9/helper-7:13/arg0+11:5")); (14, ("T", "ada://parameter/ProcedureTest01-1:9/Q-11:13/T-11:30")); (5, ("a", "ada://parameter/ProcedureTest01-1:9/P-3:13/a-3:15")); (13, ("S", "ada://parameter/ProcedureTest01-1:9/Q-11:13/S-11:15")); (16, ("L1", "ada://variable/ProcedureTest01-1:9/Q-11:13/L1+18:6")); (7, ("c", "ada://parameter/ProcedureTest01-1:9/P-3:13/c-3:49")); (10, ("y", "ada://parameter/ProcedureTest01-1:9/helper-7:13/y-7:39")); (9, ("x", "ada://parameter/ProcedureTest01-1:9/helper-7:13/x-7:20")); (15, ("R", "ada://parameter/ProcedureTest01-1:9/Q-11:13/R-11:46")); (6, ("b", "ada://parameter/ProcedureTest01-1:9/P-3:13/b-3:30"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("helper", "ada://procedure_body/ProcedureTest01-1:9/helper-7:13")); (1, ("P", "ada://procedure/ProcedureTest01-1:9/P-3:13")); (3, ("Q", "ada://procedure_body/ProcedureTest01-1:9/Q-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(4, ("ProcedureTest01", "ada://package_body/ProcedureTest01-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


