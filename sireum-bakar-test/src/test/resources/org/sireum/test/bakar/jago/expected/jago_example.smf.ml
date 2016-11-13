

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))),
(SeqDecl (3,
(ProcBodyDecl (4, 
  mkprocBodyDecl (
   5,
    (* = = = Procedure Name = = = *)
    ((*add*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 6; parameter_name = ((*x*) 4); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
  { parameter_astnum = 7; parameter_name = ((*y*) 5); parameter_subtype_mark = Integer; parameter_mode = In }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (8, (Identifier (9, ((*x*) 4) )), (BinOp (10, Plus, (Name (11, (Identifier (12, ((*x*) 4) )))), (Name (13, (Identifier (14, ((*y*) 5) )))) ))))
  ))
),
(ProcBodyDecl (15, 
  mkprocBodyDecl (
   16,
    (* = = = Procedure Name = = = *)
    ((*foo*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 17; parameter_name = ((*A*) 7); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
  { parameter_astnum = 18; parameter_name = ((*B*) 8); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (19, { declaration_astnum = 20; object_name = ((*M*) 9); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (21,
    (Assign (22, (Identifier (23, ((*M*) 9) )), (Literal (24, (Integer_Literal 3) )))),
    (Seq (25,
    (Call (26, 27, ((*add*) 1), 
      [(Name (28, (Identifier (29, ((*A*) 7) )))); (Name (30, (Identifier (31, ((*M*) 9) ))))])
    ),
    (Seq (32,
    (Call (33, 34, ((*add*) 1), 
      [(Name (35, (Identifier (36, ((*B*) 8) )))); (Literal (37, (Integer_Literal 5) ))])
    ),
    (Seq (38,
    (Assign (39, (Identifier (40, ((*A*) 7) )), (BinOp (41, Plus, (Name (42, (Identifier (43, ((*A*) 7) )))), (Literal (44, (Integer_Literal 2) )) )))),
    (Assign (45, (Identifier (46, ((*B*) 8) )), (BinOp (47, Plus, (Name (48, (Identifier (49, ((*B*) 8) )))), (Literal (50, (Integer_Literal 5) )) ))))))))))))
  ))
)))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*y*) 5), (In, Integer)); (((*A*) 7), (In_Out, Integer)); (((*x*) 4), (In_Out, Integer)); (((*M*) 9), (In_Out, Integer)); (((*B*) 8), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*add*) 1), (0, mkprocBodyDecl (
 5,
  (* = = = Procedure Name = = = *)
  ((*add*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 6; parameter_name = ((*x*) 4); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
{ parameter_astnum = 7; parameter_name = ((*y*) 5); parameter_subtype_mark = Integer; parameter_mode = In }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (8, (Identifier (9, ((*x*) 4) )), (BinOp (10, Plus, (Name (11, (Identifier (12, ((*x*) 4) )))), (Name (13, (Identifier (14, ((*y*) 5) )))) ))))
))); (((*foo*) 2), (0, mkprocBodyDecl (
 16,
  (* = = = Procedure Name = = = *)
  ((*foo*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 17; parameter_name = ((*A*) 7); parameter_subtype_mark = Integer; parameter_mode = In_Out }; 
{ parameter_astnum = 18; parameter_name = ((*B*) 8); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (19, { declaration_astnum = 20; object_name = ((*M*) 9); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (21,
  (Assign (22, (Identifier (23, ((*M*) 9) )), (Literal (24, (Integer_Literal 3) )))),
  (Seq (25,
  (Call (26, 27, ((*add*) 1), 
    [(Name (28, (Identifier (29, ((*A*) 7) )))); (Name (30, (Identifier (31, ((*M*) 9) ))))])
  ),
  (Seq (32,
  (Call (33, 34, ((*add*) 1), 
    [(Name (35, (Identifier (36, ((*B*) 8) )))); (Literal (37, (Integer_Literal 5) ))])
  ),
  (Seq (38,
  (Assign (39, (Identifier (40, ((*A*) 7) )), (BinOp (41, Plus, (Name (42, (Identifier (43, ((*A*) 7) )))), (Literal (44, (Integer_Literal 2) )) )))),
  (Assign (45, (Identifier (46, ((*B*) 8) )), (BinOp (47, Plus, (Name (48, (Identifier (49, ((*B*) 8) )))), (Literal (50, (Integer_Literal 5) )) ))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (41, Integer); (50, Integer); (35, Integer); (44, Integer); (11, Integer); (29, Integer); (47, Integer); (14, Integer); (46, Integer); (40, Integer); (49, Integer); (13, Integer); (31, Integer); (43, Integer); (10, Integer); (37, Integer); (28, Integer); (9, Integer); (36, Integer); (12, Integer); (48, Integer); (30, Integer); (42, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)14; col = (*Col*)6; endline = (*EndLine*)14; endcol = (*EndCol*)6 }); (41, { line = (*Line*)17; col = (*Col*)11; endline = (*EndLine*)17; endcol = (*EndCol*)15 }); (50, { line = (*Line*)18; col = (*Col*)15; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (35, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (44, { line = (*Line*)17; col = (*Col*)15; endline = (*EndLine*)17; endcol = (*EndCol*)15 }); (11, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (29, { line = (*Line*)15; col = (*Col*)10; endline = (*EndLine*)15; endcol = (*EndCol*)10 }); (47, { line = (*Line*)18; col = (*Col*)11; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (14, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)15 }); (46, { line = (*Line*)18; col = (*Col*)6; endline = (*EndLine*)18; endcol = (*EndCol*)6 }); (40, { line = (*Line*)17; col = (*Col*)6; endline = (*EndLine*)17; endcol = (*EndCol*)6 }); (49, { line = (*Line*)18; col = (*Col*)11; endline = (*EndLine*)18; endcol = (*EndCol*)11 }); (13, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)15 }); (31, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (43, { line = (*Line*)17; col = (*Col*)11; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (10, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)15 }); (37, { line = (*Line*)16; col = (*Col*)12; endline = (*EndLine*)16; endcol = (*EndCol*)12 }); (28, { line = (*Line*)15; col = (*Col*)10; endline = (*EndLine*)15; endcol = (*EndCol*)10 }); (9, { line = (*Line*)7; col = (*Col*)6; endline = (*EndLine*)7; endcol = (*EndCol*)6 }); (36, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (12, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (48, { line = (*Line*)18; col = (*Col*)11; endline = (*EndLine*)18; endcol = (*EndCol*)11 }); (30, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (42, { line = (*Line*)17; col = (*Col*)11; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (24, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)11 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("B", "ada://parameter/Example-1:9/foo-5:15/B-5:41")); (5, ("y", "ada://parameter/Example-1:9/add-2:15/y-2:41")); (4, ("x", "ada://parameter/Example-1:9/add-2:15/x-2:21")); (7, ("A", "ada://parameter/Example-1:9/foo-5:15/A-5:21")); (9, ("M", "ada://variable/Example-1:9/foo-5:15/M+12:3"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("foo", "ada://procedure_body/Example-1:9/foo-5:15")); (1, ("add", "ada://procedure/Example-1:9/add-2:15"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("Example", "ada://package_body/Example-1:9"))];
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
NullDeclRT (* Undefined Declarations ! *))),
(SeqDeclRT (3,
(ProcBodyDeclRT (4, 
  mkprocBodyDeclRT (
   5,
    (* = = = Procedure Name = = = *)
    ((*add*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 6; parameter_nameRT = ((*x*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
  { parameter_astnumRT = 7; parameter_nameRT = ((*y*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (8, (IdentifierRT (9, ((*x*) 4) , [])), (BinOpRT (10, Plus, (NameRT (11, (IdentifierRT (12, ((*x*) 4) , [])))), (NameRT (13, (IdentifierRT (14, ((*y*) 5) , [])))) , [OverflowCheck], []))))
  ))
),
(ProcBodyDeclRT (15, 
  mkprocBodyDeclRT (
   16,
    (* = = = Procedure Name = = = *)
    ((*foo*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 17; parameter_nameRT = ((*A*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
  { parameter_astnumRT = 18; parameter_nameRT = ((*B*) 8); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (19, { declaration_astnumRT = 20; object_nameRT = ((*M*) 9); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (21,
    (AssignRT (22, (IdentifierRT (23, ((*M*) 9) , [])), (LiteralRT (24, (Integer_Literal 3) , [], [])))),
    (SeqRT (25,
    (CallRT (26, 27, ((*add*) 1), 
      [(NameRT (28, (IdentifierRT (29, ((*A*) 7) , [])))); (NameRT (30, (IdentifierRT (31, ((*M*) 9) , []))))])
    ),
    (SeqRT (32,
    (CallRT (33, 34, ((*add*) 1), 
      [(NameRT (35, (IdentifierRT (36, ((*B*) 8) , [])))); (LiteralRT (37, (Integer_Literal 5) , [], []))])
    ),
    (SeqRT (38,
    (AssignRT (39, (IdentifierRT (40, ((*A*) 7) , [])), (BinOpRT (41, Plus, (NameRT (42, (IdentifierRT (43, ((*A*) 7) , [])))), (LiteralRT (44, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])))),
    (AssignRT (45, (IdentifierRT (46, ((*B*) 8) , [])), (BinOpRT (47, Plus, (NameRT (48, (IdentifierRT (49, ((*B*) 8) , [])))), (LiteralRT (50, (Integer_Literal 5) , [], [])) , [OverflowCheck], []))))))))))))
  ))
)))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*y*) 5), (In, Integer)); (((*A*) 7), (In_Out, Integer)); (((*x*) 4), (In_Out, Integer)); (((*M*) 9), (In_Out, Integer)); (((*B*) 8), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*add*) 1), (0, mkprocBodyDeclRT (
 5,
  (* = = = Procedure Name = = = *)
  ((*add*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 6; parameter_nameRT = ((*x*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
{ parameter_astnumRT = 7; parameter_nameRT = ((*y*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (8, (IdentifierRT (9, ((*x*) 4) , [])), (BinOpRT (10, Plus, (NameRT (11, (IdentifierRT (12, ((*x*) 4) , [])))), (NameRT (13, (IdentifierRT (14, ((*y*) 5) , [])))) , [OverflowCheck], []))))
))); (((*foo*) 2), (0, mkprocBodyDeclRT (
 16,
  (* = = = Procedure Name = = = *)
  ((*foo*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 17; parameter_nameRT = ((*A*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }; 
{ parameter_astnumRT = 18; parameter_nameRT = ((*B*) 8); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (19, { declaration_astnumRT = 20; object_nameRT = ((*M*) 9); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (21,
  (AssignRT (22, (IdentifierRT (23, ((*M*) 9) , [])), (LiteralRT (24, (Integer_Literal 3) , [], [])))),
  (SeqRT (25,
  (CallRT (26, 27, ((*add*) 1), 
    [(NameRT (28, (IdentifierRT (29, ((*A*) 7) , [])))); (NameRT (30, (IdentifierRT (31, ((*M*) 9) , []))))])
  ),
  (SeqRT (32,
  (CallRT (33, 34, ((*add*) 1), 
    [(NameRT (35, (IdentifierRT (36, ((*B*) 8) , [])))); (LiteralRT (37, (Integer_Literal 5) , [], []))])
  ),
  (SeqRT (38,
  (AssignRT (39, (IdentifierRT (40, ((*A*) 7) , [])), (BinOpRT (41, Plus, (NameRT (42, (IdentifierRT (43, ((*A*) 7) , [])))), (LiteralRT (44, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])))),
  (AssignRT (45, (IdentifierRT (46, ((*B*) 8) , [])), (BinOpRT (47, Plus, (NameRT (48, (IdentifierRT (49, ((*B*) 8) , [])))), (LiteralRT (50, (Integer_Literal 5) , [], [])) , [OverflowCheck], []))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (41, Integer); (50, Integer); (35, Integer); (44, Integer); (11, Integer); (29, Integer); (47, Integer); (14, Integer); (46, Integer); (40, Integer); (49, Integer); (13, Integer); (31, Integer); (43, Integer); (10, Integer); (37, Integer); (28, Integer); (9, Integer); (36, Integer); (12, Integer); (48, Integer); (30, Integer); (42, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)14; col = (*Col*)6; endline = (*EndLine*)14; endcol = (*EndCol*)6 }); (41, { line = (*Line*)17; col = (*Col*)11; endline = (*EndLine*)17; endcol = (*EndCol*)15 }); (50, { line = (*Line*)18; col = (*Col*)15; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (35, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (44, { line = (*Line*)17; col = (*Col*)15; endline = (*EndLine*)17; endcol = (*EndCol*)15 }); (11, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (29, { line = (*Line*)15; col = (*Col*)10; endline = (*EndLine*)15; endcol = (*EndCol*)10 }); (47, { line = (*Line*)18; col = (*Col*)11; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (14, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)15 }); (46, { line = (*Line*)18; col = (*Col*)6; endline = (*EndLine*)18; endcol = (*EndCol*)6 }); (40, { line = (*Line*)17; col = (*Col*)6; endline = (*EndLine*)17; endcol = (*EndCol*)6 }); (49, { line = (*Line*)18; col = (*Col*)11; endline = (*EndLine*)18; endcol = (*EndCol*)11 }); (13, { line = (*Line*)7; col = (*Col*)15; endline = (*EndLine*)7; endcol = (*EndCol*)15 }); (31, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (43, { line = (*Line*)17; col = (*Col*)11; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (10, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)15 }); (37, { line = (*Line*)16; col = (*Col*)12; endline = (*EndLine*)16; endcol = (*EndCol*)12 }); (28, { line = (*Line*)15; col = (*Col*)10; endline = (*EndLine*)15; endcol = (*EndCol*)10 }); (9, { line = (*Line*)7; col = (*Col*)6; endline = (*EndLine*)7; endcol = (*EndCol*)6 }); (36, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (12, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (48, { line = (*Line*)18; col = (*Col*)11; endline = (*EndLine*)18; endcol = (*EndCol*)11 }); (30, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (42, { line = (*Line*)17; col = (*Col*)11; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (24, { line = (*Line*)14; col = (*Col*)11; endline = (*EndLine*)14; endcol = (*EndCol*)11 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("B", "ada://parameter/Example-1:9/foo-5:15/B-5:41")); (5, ("y", "ada://parameter/Example-1:9/add-2:15/y-2:41")); (4, ("x", "ada://parameter/Example-1:9/add-2:15/x-2:21")); (7, ("A", "ada://parameter/Example-1:9/foo-5:15/A-5:21")); (9, ("M", "ada://variable/Example-1:9/foo-5:15/M+12:3"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("foo", "ada://procedure_body/Example-1:9/foo-5:15")); (1, ("add", "ada://procedure/Example-1:9/add-2:15"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("Example", "ada://package_body/Example-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


