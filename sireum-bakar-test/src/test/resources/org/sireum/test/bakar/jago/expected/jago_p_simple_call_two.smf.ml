

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(ObjDecl (3, { declaration_astnum = 4; object_name = ((*Y*) 1); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (5,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (6,
NullDecl (* Undefined Declarations ! *),
(ObjDecl (7, { declaration_astnum = 8; object_name = ((*C*) 4); object_nominal_subtype = Integer; initialization_exp = None })))))))),
(SeqDecl (9,
(ObjDecl (10, { declaration_astnum = 11; object_name = ((*B*) 6); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (12,
(ProcBodyDecl (13, 
  mkprocBodyDecl (
   14,
    (* = = = Procedure Name = = = *)
    ((*R*) 3),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 15; parameter_name = ((*X*) 7); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 16; parameter_name = ((*Z*) 8); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (17, (Identifier (18, ((*Z*) 8) )), (BinOp (19, Plus, (BinOp (20, Plus, (BinOp (21, Plus, (Name (22, (Identifier (23, ((*X*) 7) )))), (Name (24, (Identifier (25, ((*Y*) 1) )))) )), (Name (26, (Identifier (27, ((*B*) 6) )))) )), (Name (28, (Identifier (29, ((*C*) 4) )))) ))))
  ))
),
(ProcBodyDecl (30, 
  mkprocBodyDecl (
   31,
    (* = = = Procedure Name = = = *)
    ((*Q*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 32; parameter_name = ((*X*) 10); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 33; parameter_name = ((*Z*) 11); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (34,
    (Call (35, 36, ((*R*) 3), 
      [(Name (37, (Identifier (38, ((*X*) 10) )))); (Name (39, (Identifier (40, ((*Z*) 11) ))))])
    ),
    (Assign (41, (Identifier (42, ((*Z*) 11) )), (BinOp (43, Plus, (Name (44, (Identifier (45, ((*Z*) 11) )))), (Name (46, (Identifier (47, ((*X*) 10) )))) ))))))
  ))
)))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 7), (In, Integer)); (((*Z*) 8), (Out, Integer)); (((*C*) 4), (In_Out, Integer)); (((*X*) 10), (In, Integer)); (((*Z*) 11), (Out, Integer)); (((*B*) 6), (In_Out, Integer)); (((*Y*) 1), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*R*) 3), (0, mkprocBodyDecl (
 14,
  (* = = = Procedure Name = = = *)
  ((*R*) 3),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 15; parameter_name = ((*X*) 7); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 16; parameter_name = ((*Z*) 8); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (17, (Identifier (18, ((*Z*) 8) )), (BinOp (19, Plus, (BinOp (20, Plus, (BinOp (21, Plus, (Name (22, (Identifier (23, ((*X*) 7) )))), (Name (24, (Identifier (25, ((*Y*) 1) )))) )), (Name (26, (Identifier (27, ((*B*) 6) )))) )), (Name (28, (Identifier (29, ((*C*) 4) )))) ))))
))); (((*Q*) 2), (0, mkprocBodyDecl (
 31,
  (* = = = Procedure Name = = = *)
  ((*Q*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 32; parameter_name = ((*X*) 10); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 33; parameter_name = ((*Z*) 11); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (34,
  (Call (35, 36, ((*R*) 3), 
    [(Name (37, (Identifier (38, ((*X*) 10) )))); (Name (39, (Identifier (40, ((*Z*) 11) ))))])
  ),
  (Assign (41, (Identifier (42, ((*Z*) 11) )), (BinOp (43, Plus, (Name (44, (Identifier (45, ((*Z*) 11) )))), (Name (46, (Identifier (47, ((*X*) 10) )))) ))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (44, Integer); (26, Integer); (47, Integer); (38, Integer); (29, Integer); (20, Integer); (46, Integer); (40, Integer); (22, Integer); (43, Integer); (25, Integer); (37, Integer); (19, Integer); (28, Integer); (45, Integer); (18, Integer); (27, Integer); (21, Integer); (39, Integer); (42, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)7; col = (*Col*)13; endline = (*EndLine*)7; endcol = (*EndCol*)13 }); (44, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)11 }); (26, { line = (*Line*)7; col = (*Col*)22; endline = (*EndLine*)7; endcol = (*EndCol*)22 }); (47, { line = (*Line*)14; col = (*Col*)15; endline = (*EndLine*)14; endcol = (*EndCol*)15 }); (38, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (29, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (20, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)22 }); (46, { line = (*Line*)14; col = (*Col*)15; endline = (*EndLine*)14; endcol = (*EndCol*)15 }); (40, { line = (*Line*)13; col = (*Col*)10; endline = (*EndLine*)13; endcol = (*EndCol*)10 }); (22, { line = (*Line*)7; col = (*Col*)13; endline = (*EndLine*)7; endcol = (*EndCol*)13 }); (43, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)15 }); (25, { line = (*Line*)7; col = (*Col*)17; endline = (*EndLine*)7; endcol = (*EndCol*)17 }); (37, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (19, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (28, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (45, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)11 }); (18, { line = (*Line*)7; col = (*Col*)6; endline = (*EndLine*)7; endcol = (*EndCol*)6 }); (27, { line = (*Line*)7; col = (*Col*)22; endline = (*EndLine*)7; endcol = (*EndCol*)22 }); (21, { line = (*Line*)7; col = (*Col*)13; endline = (*EndLine*)7; endcol = (*EndCol*)17 }); (39, { line = (*Line*)13; col = (*Col*)10; endline = (*EndLine*)13; endcol = (*EndCol*)10 }); (42, { line = (*Line*)14; col = (*Col*)6; endline = (*EndLine*)14; endcol = (*EndCol*)6 }); (24, { line = (*Line*)7; col = (*Col*)17; endline = (*EndLine*)7; endcol = (*EndCol*)17 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/Z-11:30")); (11, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/Z-7:30")); (4, ("C", "ada://variable/P_Simple_Call_Two-1:9/C-16:4")); (7, ("X", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/X-11:15")); (10, ("X", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/X-7:15")); (1, ("Y", "ada://variable/P_Simple_Call_Two-1:9/Y-6:3")); (6, ("B", "ada://variable/P_Simple_Call_Two-1:9/B+3:3"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Q", "ada://procedure_body/P_Simple_Call_Two-1:9/Q-7:13")); (3, ("R", "ada://procedure/P_Simple_Call_Two-1:9/R-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(5, ("P_Simple_Call_Two", "ada://package_body/P_Simple_Call_Two-1:9"))];
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
(ObjDeclRT (3, { declaration_astnumRT = 4; object_nameRT = ((*Y*) 1); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (5,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (6,
NullDeclRT (* Undefined Declarations ! *),
(ObjDeclRT (7, { declaration_astnumRT = 8; object_nameRT = ((*C*) 4); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))),
(SeqDeclRT (9,
(ObjDeclRT (10, { declaration_astnumRT = 11; object_nameRT = ((*B*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (12,
(ProcBodyDeclRT (13, 
  mkprocBodyDeclRT (
   14,
    (* = = = Procedure Name = = = *)
    ((*R*) 3),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 15; parameter_nameRT = ((*X*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 16; parameter_nameRT = ((*Z*) 8); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (17, (IdentifierRT (18, ((*Z*) 8) , [])), (BinOpRT (19, Plus, (BinOpRT (20, Plus, (BinOpRT (21, Plus, (NameRT (22, (IdentifierRT (23, ((*X*) 7) , [])))), (NameRT (24, (IdentifierRT (25, ((*Y*) 1) , [])))) , [OverflowCheck], [])), (NameRT (26, (IdentifierRT (27, ((*B*) 6) , [])))) , [OverflowCheck], [])), (NameRT (28, (IdentifierRT (29, ((*C*) 4) , [])))) , [OverflowCheck], []))))
  ))
),
(ProcBodyDeclRT (30, 
  mkprocBodyDeclRT (
   31,
    (* = = = Procedure Name = = = *)
    ((*Q*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 32; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 33; parameter_nameRT = ((*Z*) 11); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (34,
    (CallRT (35, 36, ((*R*) 3), 
      [(NameRT (37, (IdentifierRT (38, ((*X*) 10) , [])))); (NameRT (39, (IdentifierRT (40, ((*Z*) 11) , []))))])
    ),
    (AssignRT (41, (IdentifierRT (42, ((*Z*) 11) , [])), (BinOpRT (43, Plus, (NameRT (44, (IdentifierRT (45, ((*Z*) 11) , [])))), (NameRT (46, (IdentifierRT (47, ((*X*) 10) , [])))) , [OverflowCheck], []))))))
  ))
)))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 7), (In, Integer)); (((*Z*) 8), (Out, Integer)); (((*C*) 4), (In_Out, Integer)); (((*X*) 10), (In, Integer)); (((*Z*) 11), (Out, Integer)); (((*B*) 6), (In_Out, Integer)); (((*Y*) 1), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*R*) 3), (0, mkprocBodyDeclRT (
 14,
  (* = = = Procedure Name = = = *)
  ((*R*) 3),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 15; parameter_nameRT = ((*X*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 16; parameter_nameRT = ((*Z*) 8); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (17, (IdentifierRT (18, ((*Z*) 8) , [])), (BinOpRT (19, Plus, (BinOpRT (20, Plus, (BinOpRT (21, Plus, (NameRT (22, (IdentifierRT (23, ((*X*) 7) , [])))), (NameRT (24, (IdentifierRT (25, ((*Y*) 1) , [])))) , [OverflowCheck], [])), (NameRT (26, (IdentifierRT (27, ((*B*) 6) , [])))) , [OverflowCheck], [])), (NameRT (28, (IdentifierRT (29, ((*C*) 4) , [])))) , [OverflowCheck], []))))
))); (((*Q*) 2), (0, mkprocBodyDeclRT (
 31,
  (* = = = Procedure Name = = = *)
  ((*Q*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 32; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 33; parameter_nameRT = ((*Z*) 11); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (34,
  (CallRT (35, 36, ((*R*) 3), 
    [(NameRT (37, (IdentifierRT (38, ((*X*) 10) , [])))); (NameRT (39, (IdentifierRT (40, ((*Z*) 11) , []))))])
  ),
  (AssignRT (41, (IdentifierRT (42, ((*Z*) 11) , [])), (BinOpRT (43, Plus, (NameRT (44, (IdentifierRT (45, ((*Z*) 11) , [])))), (NameRT (46, (IdentifierRT (47, ((*X*) 10) , [])))) , [OverflowCheck], []))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (44, Integer); (26, Integer); (47, Integer); (38, Integer); (29, Integer); (20, Integer); (46, Integer); (40, Integer); (22, Integer); (43, Integer); (25, Integer); (37, Integer); (19, Integer); (28, Integer); (45, Integer); (18, Integer); (27, Integer); (21, Integer); (39, Integer); (42, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)7; col = (*Col*)13; endline = (*EndLine*)7; endcol = (*EndCol*)13 }); (44, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)11 }); (26, { line = (*Line*)7; col = (*Col*)22; endline = (*EndLine*)7; endcol = (*EndCol*)22 }); (47, { line = (*Line*)14; col = (*Col*)15; endline = (*EndLine*)14; endcol = (*EndCol*)15 }); (38, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (29, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (20, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)22 }); (46, { line = (*Line*)14; col = (*Col*)15; endline = (*EndLine*)14; endcol = (*EndCol*)15 }); (40, { line = (*Line*)13; col = (*Col*)10; endline = (*EndLine*)13; endcol = (*EndCol*)10 }); (22, { line = (*Line*)7; col = (*Col*)13; endline = (*EndLine*)7; endcol = (*EndCol*)13 }); (43, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)15 }); (25, { line = (*Line*)7; col = (*Col*)17; endline = (*EndLine*)7; endcol = (*EndCol*)17 }); (37, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (19, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (28, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (45, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)11 }); (18, { line = (*Line*)7; col = (*Col*)6; endline = (*EndLine*)7; endcol = (*EndCol*)6 }); (27, { line = (*Line*)7; col = (*Col*)22; endline = (*EndLine*)7; endcol = (*EndCol*)22 }); (21, { line = (*Line*)7; col = (*Col*)13; endline = (*EndLine*)7; endcol = (*EndCol*)17 }); (39, { line = (*Line*)13; col = (*Col*)10; endline = (*EndLine*)13; endcol = (*EndCol*)10 }); (42, { line = (*Line*)14; col = (*Col*)6; endline = (*EndLine*)14; endcol = (*EndCol*)6 }); (24, { line = (*Line*)7; col = (*Col*)17; endline = (*EndLine*)7; endcol = (*EndCol*)17 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/Z-11:30")); (11, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/Z-7:30")); (4, ("C", "ada://variable/P_Simple_Call_Two-1:9/C-16:4")); (7, ("X", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/X-11:15")); (10, ("X", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/X-7:15")); (1, ("Y", "ada://variable/P_Simple_Call_Two-1:9/Y-6:3")); (6, ("B", "ada://variable/P_Simple_Call_Two-1:9/B+3:3"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Q", "ada://procedure_body/P_Simple_Call_Two-1:9/Q-7:13")); (3, ("R", "ada://procedure/P_Simple_Call_Two-1:9/R-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(5, ("P_Simple_Call_Two", "ada://package_body/P_Simple_Call_Two-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


