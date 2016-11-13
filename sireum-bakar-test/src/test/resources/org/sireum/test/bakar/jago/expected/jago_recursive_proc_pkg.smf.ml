

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
    ((*increasebyone*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 6; parameter_name = ((*X*) 4); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (7,
    (Assign (8, (Identifier (9, ((*X*) 4) )), (BinOp (10, Plus, (Name (11, (Identifier (12, ((*X*) 4) )))), (Literal (13, (Integer_Literal 1) )) )))),
    (Call (14, 15, ((*addup*) 2), 
      [(Name (16, (Identifier (17, ((*X*) 4) ))))])
    )))
  ))
),
(ProcBodyDecl (18, 
  mkprocBodyDecl (
   19,
    (* = = = Procedure Name = = = *)
    ((*addup*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 20; parameter_name = ((*X*) 7); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (21, { declaration_astnum = 22; object_name = ((*Y*) 8); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (If (23, (BinOp (24, Greater_Than, (Name (25, (Identifier (26, ((*X*) 7) )))), (Literal (27, (Integer_Literal 0) )) )),
      (Seq (28,
      (Assign (29, (Identifier (30, ((*Y*) 8) )), (BinOp (31, Minus, (Name (32, (Identifier (33, ((*X*) 7) )))), (Literal (34, (Integer_Literal 1) )) )))),
      (Seq (35,
      (Call (36, 37, ((*addup*) 2), 
        [(Name (38, (Identifier (39, ((*Y*) 8) ))))])
      ),
      (Assign (40, (Identifier (41, ((*X*) 7) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 7) )))), (Name (45, (Identifier (46, ((*Y*) 8) )))) )))))))),
      Null)
    )
  ))
)))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Y*) 8), (In_Out, Integer)); (((*X*) 7), (In_Out, Integer)); (((*X*) 4), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*addup*) 2), (0, mkprocBodyDecl (
 19,
  (* = = = Procedure Name = = = *)
  ((*addup*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 20; parameter_name = ((*X*) 7); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (21, { declaration_astnum = 22; object_name = ((*Y*) 8); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (If (23, (BinOp (24, Greater_Than, (Name (25, (Identifier (26, ((*X*) 7) )))), (Literal (27, (Integer_Literal 0) )) )),
    (Seq (28,
    (Assign (29, (Identifier (30, ((*Y*) 8) )), (BinOp (31, Minus, (Name (32, (Identifier (33, ((*X*) 7) )))), (Literal (34, (Integer_Literal 1) )) )))),
    (Seq (35,
    (Call (36, 37, ((*addup*) 2), 
      [(Name (38, (Identifier (39, ((*Y*) 8) ))))])
    ),
    (Assign (40, (Identifier (41, ((*X*) 7) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 7) )))), (Name (45, (Identifier (46, ((*Y*) 8) )))) )))))))),
    Null)
  )
))); (((*increasebyone*) 1), (0, mkprocBodyDecl (
 5,
  (* = = = Procedure Name = = = *)
  ((*increasebyone*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 6; parameter_name = ((*X*) 4); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (7,
  (Assign (8, (Identifier (9, ((*X*) 4) )), (BinOp (10, Plus, (Name (11, (Identifier (12, ((*X*) 4) )))), (Literal (13, (Integer_Literal 1) )) )))),
  (Call (14, 15, ((*addup*) 2), 
    [(Name (16, (Identifier (17, ((*X*) 4) ))))])
  )))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(41, Integer); (32, Integer); (44, Integer); (17, Integer); (26, Integer); (38, Integer); (11, Integer); (46, Integer); (13, Integer); (31, Integer); (43, Integer); (16, Integer); (34, Integer); (25, Integer); (10, Integer); (45, Integer); (9, Integer); (27, Integer); (12, Integer); (39, Integer); (30, Integer); (42, Integer); (33, Integer); (24, Boolean)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(41, { line = (*Line*)15; col = (*Col*)3; endline = (*EndLine*)15; endcol = (*EndCol*)3 }); (32, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (44, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (17, { line = (*Line*)6; col = (*Col*)13; endline = (*EndLine*)6; endcol = (*EndCol*)13 }); (26, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)10 }); (38, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)9 }); (11, { line = (*Line*)5; col = (*Col*)12; endline = (*EndLine*)5; endcol = (*EndCol*)12 }); (46, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (13, { line = (*Line*)5; col = (*Col*)16; endline = (*EndLine*)5; endcol = (*EndCol*)16 }); (31, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (43, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (16, { line = (*Line*)6; col = (*Col*)13; endline = (*EndLine*)6; endcol = (*EndCol*)13 }); (34, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (25, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)10 }); (10, { line = (*Line*)5; col = (*Col*)12; endline = (*EndLine*)5; endcol = (*EndCol*)16 }); (45, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (9, { line = (*Line*)5; col = (*Col*)7; endline = (*EndLine*)5; endcol = (*EndCol*)7 }); (27, { line = (*Line*)12; col = (*Col*)14; endline = (*EndLine*)12; endcol = (*EndCol*)14 }); (12, { line = (*Line*)5; col = (*Col*)12; endline = (*EndLine*)5; endcol = (*EndCol*)12 }); (39, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)9 }); (30, { line = (*Line*)13; col = (*Col*)3; endline = (*EndLine*)13; endcol = (*EndCol*)3 }); (42, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (33, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (24, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)14 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Y", "ada://variable/Recursive_Proc_Pkg-1:9/addup-5:14/Y+10:7")); (4, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/increasebyone-4:14/X-4:28")); (7, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/addup-5:14/X-5:21"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("addup", "ada://procedure/Recursive_Proc_Pkg-1:9/addup-5:14")); (1, ("increasebyone", "ada://procedure_body/Recursive_Proc_Pkg-1:9/increasebyone-4:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("Recursive_Proc_Pkg", "ada://package_body/Recursive_Proc_Pkg-1:9"))];
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
    ((*increasebyone*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 6; parameter_nameRT = ((*X*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (7,
    (AssignRT (8, (IdentifierRT (9, ((*X*) 4) , [])), (BinOpRT (10, Plus, (NameRT (11, (IdentifierRT (12, ((*X*) 4) , [])))), (LiteralRT (13, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    (CallRT (14, 15, ((*addup*) 2), 
      [(NameRT (16, (IdentifierRT (17, ((*X*) 4) , []))))])
    )))
  ))
),
(ProcBodyDeclRT (18, 
  mkprocBodyDeclRT (
   19,
    (* = = = Procedure Name = = = *)
    ((*addup*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 20; parameter_nameRT = ((*X*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (21, { declaration_astnumRT = 22; object_nameRT = ((*Y*) 8); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (IfRT (23, (BinOpRT (24, Greater_Than, (NameRT (25, (IdentifierRT (26, ((*X*) 7) , [])))), (LiteralRT (27, (Integer_Literal 0) , [], [])) , [], [])),
      (SeqRT (28,
      (AssignRT (29, (IdentifierRT (30, ((*Y*) 8) , [])), (BinOpRT (31, Minus, (NameRT (32, (IdentifierRT (33, ((*X*) 7) , [])))), (LiteralRT (34, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
      (SeqRT (35,
      (CallRT (36, 37, ((*addup*) 2), 
        [(NameRT (38, (IdentifierRT (39, ((*Y*) 8) , []))))])
      ),
      (AssignRT (40, (IdentifierRT (41, ((*X*) 7) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 7) , [])))), (NameRT (45, (IdentifierRT (46, ((*Y*) 8) , [])))) , [OverflowCheck], [])))))))),
      NullRT)
    )
  ))
)))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Y*) 8), (In_Out, Integer)); (((*X*) 7), (In_Out, Integer)); (((*X*) 4), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*addup*) 2), (0, mkprocBodyDeclRT (
 19,
  (* = = = Procedure Name = = = *)
  ((*addup*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 20; parameter_nameRT = ((*X*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (21, { declaration_astnumRT = 22; object_nameRT = ((*Y*) 8); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (IfRT (23, (BinOpRT (24, Greater_Than, (NameRT (25, (IdentifierRT (26, ((*X*) 7) , [])))), (LiteralRT (27, (Integer_Literal 0) , [], [])) , [], [])),
    (SeqRT (28,
    (AssignRT (29, (IdentifierRT (30, ((*Y*) 8) , [])), (BinOpRT (31, Minus, (NameRT (32, (IdentifierRT (33, ((*X*) 7) , [])))), (LiteralRT (34, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    (SeqRT (35,
    (CallRT (36, 37, ((*addup*) 2), 
      [(NameRT (38, (IdentifierRT (39, ((*Y*) 8) , []))))])
    ),
    (AssignRT (40, (IdentifierRT (41, ((*X*) 7) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 7) , [])))), (NameRT (45, (IdentifierRT (46, ((*Y*) 8) , [])))) , [OverflowCheck], [])))))))),
    NullRT)
  )
))); (((*increasebyone*) 1), (0, mkprocBodyDeclRT (
 5,
  (* = = = Procedure Name = = = *)
  ((*increasebyone*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 6; parameter_nameRT = ((*X*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (7,
  (AssignRT (8, (IdentifierRT (9, ((*X*) 4) , [])), (BinOpRT (10, Plus, (NameRT (11, (IdentifierRT (12, ((*X*) 4) , [])))), (LiteralRT (13, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
  (CallRT (14, 15, ((*addup*) 2), 
    [(NameRT (16, (IdentifierRT (17, ((*X*) 4) , []))))])
  )))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(41, Integer); (32, Integer); (44, Integer); (17, Integer); (26, Integer); (38, Integer); (11, Integer); (46, Integer); (13, Integer); (31, Integer); (43, Integer); (16, Integer); (34, Integer); (25, Integer); (10, Integer); (45, Integer); (9, Integer); (27, Integer); (12, Integer); (39, Integer); (30, Integer); (42, Integer); (33, Integer); (24, Boolean)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(41, { line = (*Line*)15; col = (*Col*)3; endline = (*EndLine*)15; endcol = (*EndCol*)3 }); (32, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (44, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (17, { line = (*Line*)6; col = (*Col*)13; endline = (*EndLine*)6; endcol = (*EndCol*)13 }); (26, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)10 }); (38, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)9 }); (11, { line = (*Line*)5; col = (*Col*)12; endline = (*EndLine*)5; endcol = (*EndCol*)12 }); (46, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (13, { line = (*Line*)5; col = (*Col*)16; endline = (*EndLine*)5; endcol = (*EndCol*)16 }); (31, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (43, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (16, { line = (*Line*)6; col = (*Col*)13; endline = (*EndLine*)6; endcol = (*EndCol*)13 }); (34, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (25, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)10 }); (10, { line = (*Line*)5; col = (*Col*)12; endline = (*EndLine*)5; endcol = (*EndCol*)16 }); (45, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (9, { line = (*Line*)5; col = (*Col*)7; endline = (*EndLine*)5; endcol = (*EndCol*)7 }); (27, { line = (*Line*)12; col = (*Col*)14; endline = (*EndLine*)12; endcol = (*EndCol*)14 }); (12, { line = (*Line*)5; col = (*Col*)12; endline = (*EndLine*)5; endcol = (*EndCol*)12 }); (39, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)9 }); (30, { line = (*Line*)13; col = (*Col*)3; endline = (*EndLine*)13; endcol = (*EndCol*)3 }); (42, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (33, { line = (*Line*)13; col = (*Col*)8; endline = (*EndLine*)13; endcol = (*EndCol*)8 }); (24, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)14 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Y", "ada://variable/Recursive_Proc_Pkg-1:9/addup-5:14/Y+10:7")); (4, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/increasebyone-4:14/X-4:28")); (7, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/addup-5:14/X-5:21"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("addup", "ada://procedure/Recursive_Proc_Pkg-1:9/addup-5:14")); (1, ("increasebyone", "ada://procedure_body/Recursive_Proc_Pkg-1:9/increasebyone-4:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("Recursive_Proc_Pkg", "ada://package_body/Recursive_Proc_Pkg-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


