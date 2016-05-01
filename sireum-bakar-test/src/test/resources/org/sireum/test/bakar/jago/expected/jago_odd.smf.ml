

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Odd*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*X*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*R*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (5,
  (ObjDecl (6, { declaration_astnum = 7; object_name = ((*Result*) 4); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (8, { declaration_astnum = 9; object_name = ((*T*) 5); object_nominal_subtype = Integer; initialization_exp = None }))))],
    (* = = = Procedure Body = = = *)
    (Seq (10,
    (Assign (11, (Identifier (12, ((*Result*) 4) )), (Literal (13, (Integer_Literal 1) )))),
    (Seq (14,
    (Assign (15, (Identifier (16, ((*T*) 5) )), (BinOp (17, Divide, (Name (18, (Identifier (19, ((*X*) 2) )))), (Literal (20, (Integer_Literal 2) )) )))),
    (Seq (21,
    (If (22, (BinOp (23, Equal, (Name (24, (Identifier (25, ((*X*) 2) )))), (BinOp (26, Multiply, (Name (27, (Identifier (28, ((*T*) 5) )))), (Literal (29, (Integer_Literal 2) )) )) )),
      (Assign (30, (Identifier (31, ((*Result*) 4) )), (Literal (32, (Integer_Literal 0) )))),
      Null)
    ),
    (Assign (33, (Identifier (34, ((*R*) 3) )), (Name (35, (Identifier (36, ((*Result*) 4) ))))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 2), (In, Integer)); (((*T*) 5), (In_Out, Integer)); (((*R*) 3), (Out, Integer)); (((*Result*) 4), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Odd*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Odd*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*X*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*R*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (5,
(ObjDecl (6, { declaration_astnum = 7; object_name = ((*Result*) 4); object_nominal_subtype = Integer; initialization_exp = None })),
(ObjDecl (8, { declaration_astnum = 9; object_name = ((*T*) 5); object_nominal_subtype = Integer; initialization_exp = None }))))],
  (* = = = Procedure Body = = = *)
  (Seq (10,
  (Assign (11, (Identifier (12, ((*Result*) 4) )), (Literal (13, (Integer_Literal 1) )))),
  (Seq (14,
  (Assign (15, (Identifier (16, ((*T*) 5) )), (BinOp (17, Divide, (Name (18, (Identifier (19, ((*X*) 2) )))), (Literal (20, (Integer_Literal 2) )) )))),
  (Seq (21,
  (If (22, (BinOp (23, Equal, (Name (24, (Identifier (25, ((*X*) 2) )))), (BinOp (26, Multiply, (Name (27, (Identifier (28, ((*T*) 5) )))), (Literal (29, (Integer_Literal 2) )) )) )),
    (Assign (30, (Identifier (31, ((*Result*) 4) )), (Literal (32, (Integer_Literal 0) )))),
    Null)
  ),
  (Assign (33, (Identifier (34, ((*R*) 3) )), (Name (35, (Identifier (36, ((*Result*) 4) ))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Boolean); (32, Integer); (35, Integer); (17, Integer); (26, Integer); (29, Integer); (20, Integer); (13, Integer); (31, Integer); (16, Integer); (34, Integer); (25, Integer); (19, Integer); (28, Integer); (36, Integer); (18, Integer); (27, Integer); (12, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (32, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (35, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)14 }); (17, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (26, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (29, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (20, { line = (*Line*)9; col = (*Col*)13; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (13, { line = (*Line*)8; col = (*Col*)14; endline = (*EndLine*)8; endcol = (*EndCol*)14 }); (31, { line = (*Line*)11; col = (*Col*)7; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (16, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)4 }); (34, { line = (*Line*)13; col = (*Col*)4; endline = (*EndLine*)13; endcol = (*EndCol*)4 }); (25, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (19, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (28, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (36, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)14 }); (18, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (27, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (12, { line = (*Line*)8; col = (*Col*)4; endline = (*EndLine*)8; endcol = (*EndCol*)9 }); (24, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("X", "ada://parameter/Odd+1:11/X+1:16")); (5, ("T", "ada://variable/Odd+1:11/T+4:4")); (4, ("Result", "ada://variable/Odd+1:11/Result+3:4")); (3, ("R", "ada://parameter/Odd+1:11/R+1:32"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Odd", "ada://procedure_body/Odd+1:11"))];
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
    ((*Odd*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*X*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*R*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (5,
  (ObjDeclRT (6, { declaration_astnumRT = 7; object_nameRT = ((*Result*) 4); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (8, { declaration_astnumRT = 9; object_nameRT = ((*T*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (10,
    (AssignRT (11, (IdentifierRT (12, ((*Result*) 4) , [])), (LiteralRT (13, (Integer_Literal 1) , [], [])))),
    (SeqRT (14,
    (AssignRT (15, (IdentifierRT (16, ((*T*) 5) , [])), (BinOpRT (17, Divide, (NameRT (18, (IdentifierRT (19, ((*X*) 2) , [])))), (LiteralRT (20, (Integer_Literal 2) , [], [])) , [DivCheck], [])))),
    (SeqRT (21,
    (IfRT (22, (BinOpRT (23, Equal, (NameRT (24, (IdentifierRT (25, ((*X*) 2) , [])))), (BinOpRT (26, Multiply, (NameRT (27, (IdentifierRT (28, ((*T*) 5) , [])))), (LiteralRT (29, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])) , [], [])),
      (AssignRT (30, (IdentifierRT (31, ((*Result*) 4) , [])), (LiteralRT (32, (Integer_Literal 0) , [], [])))),
      NullRT)
    ),
    (AssignRT (33, (IdentifierRT (34, ((*R*) 3) , [])), (NameRT (35, (IdentifierRT (36, ((*Result*) 4) , []))))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 2), (In, Integer)); (((*T*) 5), (In_Out, Integer)); (((*R*) 3), (Out, Integer)); (((*Result*) 4), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Odd*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Odd*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*X*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*R*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (5,
(ObjDeclRT (6, { declaration_astnumRT = 7; object_nameRT = ((*Result*) 4); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(ObjDeclRT (8, { declaration_astnumRT = 9; object_nameRT = ((*T*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (10,
  (AssignRT (11, (IdentifierRT (12, ((*Result*) 4) , [])), (LiteralRT (13, (Integer_Literal 1) , [], [])))),
  (SeqRT (14,
  (AssignRT (15, (IdentifierRT (16, ((*T*) 5) , [])), (BinOpRT (17, Divide, (NameRT (18, (IdentifierRT (19, ((*X*) 2) , [])))), (LiteralRT (20, (Integer_Literal 2) , [], [])) , [DivCheck], [])))),
  (SeqRT (21,
  (IfRT (22, (BinOpRT (23, Equal, (NameRT (24, (IdentifierRT (25, ((*X*) 2) , [])))), (BinOpRT (26, Multiply, (NameRT (27, (IdentifierRT (28, ((*T*) 5) , [])))), (LiteralRT (29, (Integer_Literal 2) , [], [])) , [OverflowCheck], [])) , [], [])),
    (AssignRT (30, (IdentifierRT (31, ((*Result*) 4) , [])), (LiteralRT (32, (Integer_Literal 0) , [], [])))),
    NullRT)
  ),
  (AssignRT (33, (IdentifierRT (34, ((*R*) 3) , [])), (NameRT (35, (IdentifierRT (36, ((*Result*) 4) , []))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Boolean); (32, Integer); (35, Integer); (17, Integer); (26, Integer); (29, Integer); (20, Integer); (13, Integer); (31, Integer); (16, Integer); (34, Integer); (25, Integer); (19, Integer); (28, Integer); (36, Integer); (18, Integer); (27, Integer); (12, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (32, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (35, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)14 }); (17, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (26, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (29, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (20, { line = (*Line*)9; col = (*Col*)13; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (13, { line = (*Line*)8; col = (*Col*)14; endline = (*EndLine*)8; endcol = (*EndCol*)14 }); (31, { line = (*Line*)11; col = (*Col*)7; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (16, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)4 }); (34, { line = (*Line*)13; col = (*Col*)4; endline = (*EndLine*)13; endcol = (*EndCol*)4 }); (25, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (19, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (28, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (36, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)14 }); (18, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (27, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (12, { line = (*Line*)8; col = (*Col*)4; endline = (*EndLine*)8; endcol = (*EndCol*)9 }); (24, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("X", "ada://parameter/Odd+1:11/X+1:16")); (5, ("T", "ada://variable/Odd+1:11/T+4:4")); (4, ("Result", "ada://variable/Odd+1:11/Result+3:4")); (3, ("R", "ada://parameter/Odd+1:11/R+1:32"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Odd", "ada://procedure_body/Odd+1:11"))];
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


