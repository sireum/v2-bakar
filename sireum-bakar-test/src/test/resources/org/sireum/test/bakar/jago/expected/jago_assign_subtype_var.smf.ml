

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Assign_Subtype_Var*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*I*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (4,
  (TypeDecl (5, (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))),
  (SeqDecl (7,
  (TypeDecl (8, (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10)))))),
  (ObjDecl (10, { declaration_astnum = 11; object_name = ((*Left*) 5); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None }))))))],
    (* = = = Procedure Body = = = *)
    (Seq (12,
    (Assign (13, (Identifier (14, ((*Left*) 5) )), (Literal (15, (Integer_Literal 0) )))),
    (Assign (16, (Identifier (17, ((*I*) 2) )), (BinOp (18, Plus, (Name (19, (Identifier (20, ((*I*) 2) )))), (Literal (21, (Integer_Literal 1) )) ))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 2), (In_Out, Integer)); (((*Left*) 5), (In_Out, (Subtype ((*U*) 4))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Assign_Subtype_Var*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Assign_Subtype_Var*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*I*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (4,
(TypeDecl (5, (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))),
(SeqDecl (7,
(TypeDecl (8, (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10)))))),
(ObjDecl (10, { declaration_astnum = 11; object_name = ((*Left*) 5); object_nominal_subtype = (Subtype ((*U*) 4)); initialization_exp = None }))))))],
  (* = = = Procedure Body = = = *)
  (Seq (12,
  (Assign (13, (Identifier (14, ((*Left*) 5) )), (Literal (15, (Integer_Literal 0) )))),
  (Assign (16, (Identifier (17, ((*I*) 2) )), (BinOp (18, Plus, (Name (19, (Identifier (20, ((*I*) 2) )))), (Literal (21, (Integer_Literal 1) )) ))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*U*) 4), (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10))))); (((*T*) 3), (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(17, Integer); (20, Integer); (14, (Subtype ((*U*) 4))); (19, Integer); (18, Integer); (21, Integer); (15, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(17, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)4 }); (20, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (14, { line = (*Line*)8; col = (*Col*)4; endline = (*EndLine*)8; endcol = (*EndCol*)7 }); (19, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (18, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (21, { line = (*Line*)9; col = (*Col*)13; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (15, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)13 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("I", "ada://parameter/Assign_Subtype_Var+1:11/I+1:31")); (5, ("Left", "ada://variable/Assign_Subtype_Var+1:11/Left+5:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Assign_Subtype_Var", "ada://procedure_body/Assign_Subtype_Var+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("U", "ada://subtype/Assign_Subtype_Var+1:11/U+4:12")); (3, ("T", "ada://ordinary_type/Assign_Subtype_Var+1:11/T+3:9"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Assign_Subtype_Var*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*I*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (4,
  (TypeDeclRT (5, (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))),
  (SeqDeclRT (7,
  (TypeDeclRT (8, (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10)))))),
  (ObjDeclRT (10, { declaration_astnumRT = 11; object_nameRT = ((*Left*) 5); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None }))))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (12,
    (AssignRT (13, (IdentifierRT (14, ((*Left*) 5) , [])), (LiteralRT (15, (Integer_Literal 0) , [], [])))),
    (AssignRT (16, (IdentifierRT (17, ((*I*) 2) , [])), (BinOpRT (18, Plus, (NameRT (19, (IdentifierRT (20, ((*I*) 2) , [])))), (LiteralRT (21, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 2), (In_Out, Integer)); (((*Left*) 5), (In_Out, (Subtype ((*U*) 4))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Assign_Subtype_Var*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Assign_Subtype_Var*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*I*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (4,
(TypeDeclRT (5, (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))),
(SeqDeclRT (7,
(TypeDeclRT (8, (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10)))))),
(ObjDeclRT (10, { declaration_astnumRT = 11; object_nameRT = ((*Left*) 5); object_nominal_subtypeRT = (Subtype ((*U*) 4)); initialization_expRT = None }))))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (12,
  (AssignRT (13, (IdentifierRT (14, ((*Left*) 5) , [])), (LiteralRT (15, (Integer_Literal 0) , [], [])))),
  (AssignRT (16, (IdentifierRT (17, ((*I*) 2) , [])), (BinOpRT (18, Plus, (NameRT (19, (IdentifierRT (20, ((*I*) 2) , [])))), (LiteralRT (21, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*U*) 4), (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10))))); (((*T*) 3), (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(17, Integer); (20, Integer); (14, (Subtype ((*U*) 4))); (19, Integer); (18, Integer); (21, Integer); (15, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(17, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)4 }); (20, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (14, { line = (*Line*)8; col = (*Col*)4; endline = (*EndLine*)8; endcol = (*EndCol*)7 }); (19, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (18, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (21, { line = (*Line*)9; col = (*Col*)13; endline = (*EndLine*)9; endcol = (*EndCol*)13 }); (15, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)13 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("I", "ada://parameter/Assign_Subtype_Var+1:11/I+1:31")); (5, ("Left", "ada://variable/Assign_Subtype_Var+1:11/Left+5:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Assign_Subtype_Var", "ada://procedure_body/Assign_Subtype_Var+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("U", "ada://subtype/Assign_Subtype_Var+1:11/U+4:12")); (3, ("T", "ada://ordinary_type/Assign_Subtype_Var+1:11/T+3:9"))]
})
}


