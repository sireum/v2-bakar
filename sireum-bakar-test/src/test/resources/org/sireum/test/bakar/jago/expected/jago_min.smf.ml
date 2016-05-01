

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Min*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*X*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*Y*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 5; parameter_name = ((*R*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(ObjDecl (6, { declaration_astnum = 7; object_name = ((*Result*) 5); object_nominal_subtype = Integer; initialization_exp = None }))],
    (* = = = Procedure Body = = = *)
    (Seq (8,
    (Assign (9, (Identifier (10, ((*Result*) 5) )), (Name (11, (Identifier (12, ((*X*) 2) )))))),
    (Seq (13,
    (If (14, (BinOp (15, Greater_Than, (Name (16, (Identifier (17, ((*X*) 2) )))), (Name (18, (Identifier (19, ((*Y*) 3) )))) )),
      (Assign (20, (Identifier (21, ((*Result*) 5) )), (Name (22, (Identifier (23, ((*Y*) 3) )))))),
      Null)
    ),
    (Assign (24, (Identifier (25, ((*R*) 4) )), (Name (26, (Identifier (27, ((*Result*) 5) ))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 2), (In, Integer)); (((*R*) 4), (Out, Integer)); (((*Result*) 5), (In_Out, Integer)); (((*Y*) 3), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Min*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Min*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*X*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*Y*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 5; parameter_name = ((*R*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(ObjDecl (6, { declaration_astnum = 7; object_name = ((*Result*) 5); object_nominal_subtype = Integer; initialization_exp = None }))],
  (* = = = Procedure Body = = = *)
  (Seq (8,
  (Assign (9, (Identifier (10, ((*Result*) 5) )), (Name (11, (Identifier (12, ((*X*) 2) )))))),
  (Seq (13,
  (If (14, (BinOp (15, Greater_Than, (Name (16, (Identifier (17, ((*X*) 2) )))), (Name (18, (Identifier (19, ((*Y*) 3) )))) )),
    (Assign (20, (Identifier (21, ((*Result*) 5) )), (Name (22, (Identifier (23, ((*Y*) 3) )))))),
    Null)
  ),
  (Assign (24, (Identifier (25, ((*R*) 4) )), (Name (26, (Identifier (27, ((*Result*) 5) ))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (17, Integer); (26, Integer); (11, Integer); (22, Integer); (16, Integer); (25, Integer); (10, Integer); (19, Integer); (27, Integer); (18, Integer); (12, Integer); (21, Integer); (15, Boolean)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)8; col = (*Col*)17; endline = (*EndLine*)8; endcol = (*EndCol*)17 }); (17, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)7 }); (26, { line = (*Line*)10; col = (*Col*)9; endline = (*EndLine*)10; endcol = (*EndCol*)14 }); (11, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (22, { line = (*Line*)8; col = (*Col*)17; endline = (*EndLine*)8; endcol = (*EndCol*)17 }); (16, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)7 }); (25, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)4 }); (10, { line = (*Line*)6; col = (*Col*)4; endline = (*EndLine*)6; endcol = (*EndCol*)9 }); (19, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (27, { line = (*Line*)10; col = (*Col*)9; endline = (*EndLine*)10; endcol = (*EndCol*)14 }); (18, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (12, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (21, { line = (*Line*)8; col = (*Col*)7; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (15, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)11 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("X", "ada://parameter/Min+1:11/X+1:16")); (5, ("Result", "ada://variable/Min+1:11/Result+3:4")); (4, ("R", "ada://parameter/Min+1:11/R+1:42")); (3, ("Y", "ada://parameter/Min+1:11/Y+1:29"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Min", "ada://procedure_body/Min+1:11"))];
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
    ((*Min*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*X*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*Y*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 5; parameter_nameRT = ((*R*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(ObjDeclRT (6, { declaration_astnumRT = 7; object_nameRT = ((*Result*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None }))],
    (* = = = Procedure Body = = = *)
    (SeqRT (8,
    (AssignRT (9, (IdentifierRT (10, ((*Result*) 5) , [])), (NameRT (11, (IdentifierRT (12, ((*X*) 2) , [])))))),
    (SeqRT (13,
    (IfRT (14, (BinOpRT (15, Greater_Than, (NameRT (16, (IdentifierRT (17, ((*X*) 2) , [])))), (NameRT (18, (IdentifierRT (19, ((*Y*) 3) , [])))) , [], [])),
      (AssignRT (20, (IdentifierRT (21, ((*Result*) 5) , [])), (NameRT (22, (IdentifierRT (23, ((*Y*) 3) , [])))))),
      NullRT)
    ),
    (AssignRT (24, (IdentifierRT (25, ((*R*) 4) , [])), (NameRT (26, (IdentifierRT (27, ((*Result*) 5) , []))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 2), (In, Integer)); (((*R*) 4), (Out, Integer)); (((*Result*) 5), (In_Out, Integer)); (((*Y*) 3), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Min*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Min*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*X*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*Y*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 5; parameter_nameRT = ((*R*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(ObjDeclRT (6, { declaration_astnumRT = 7; object_nameRT = ((*Result*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None }))],
  (* = = = Procedure Body = = = *)
  (SeqRT (8,
  (AssignRT (9, (IdentifierRT (10, ((*Result*) 5) , [])), (NameRT (11, (IdentifierRT (12, ((*X*) 2) , [])))))),
  (SeqRT (13,
  (IfRT (14, (BinOpRT (15, Greater_Than, (NameRT (16, (IdentifierRT (17, ((*X*) 2) , [])))), (NameRT (18, (IdentifierRT (19, ((*Y*) 3) , [])))) , [], [])),
    (AssignRT (20, (IdentifierRT (21, ((*Result*) 5) , [])), (NameRT (22, (IdentifierRT (23, ((*Y*) 3) , [])))))),
    NullRT)
  ),
  (AssignRT (24, (IdentifierRT (25, ((*R*) 4) , [])), (NameRT (26, (IdentifierRT (27, ((*Result*) 5) , []))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (17, Integer); (26, Integer); (11, Integer); (22, Integer); (16, Integer); (25, Integer); (10, Integer); (19, Integer); (27, Integer); (18, Integer); (12, Integer); (21, Integer); (15, Boolean)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)8; col = (*Col*)17; endline = (*EndLine*)8; endcol = (*EndCol*)17 }); (17, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)7 }); (26, { line = (*Line*)10; col = (*Col*)9; endline = (*EndLine*)10; endcol = (*EndCol*)14 }); (11, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (22, { line = (*Line*)8; col = (*Col*)17; endline = (*EndLine*)8; endcol = (*EndCol*)17 }); (16, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)7 }); (25, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)4 }); (10, { line = (*Line*)6; col = (*Col*)4; endline = (*EndLine*)6; endcol = (*EndCol*)9 }); (19, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (27, { line = (*Line*)10; col = (*Col*)9; endline = (*EndLine*)10; endcol = (*EndCol*)14 }); (18, { line = (*Line*)7; col = (*Col*)11; endline = (*EndLine*)7; endcol = (*EndCol*)11 }); (12, { line = (*Line*)6; col = (*Col*)14; endline = (*EndLine*)6; endcol = (*EndCol*)14 }); (21, { line = (*Line*)8; col = (*Col*)7; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (15, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)11 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("X", "ada://parameter/Min+1:11/X+1:16")); (5, ("Result", "ada://variable/Min+1:11/Result+3:4")); (4, ("R", "ada://parameter/Min+1:11/R+1:42")); (3, ("Y", "ada://parameter/Min+1:11/Y+1:29"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Min", "ada://procedure_body/Min+1:11"))];
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


