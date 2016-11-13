

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Array_Subtype_Index*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*I*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    (SeqDecl (4,
    (TypeDecl (5, (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))),
    (SeqDecl (7,
    (TypeDecl (8, (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10)))))),
    (SeqDecl (10,
    (TypeDecl (11, (ArrayTypeDecl (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
    (ObjDecl (13, { declaration_astnum = 14; object_name = ((*A*) 6); object_nominal_subtype = (Array_Type ((*Ar*) 5)); initialization_exp = None })))))))),
    (* = = = Procedure Body = = = *)
    (Seq (15,
    (Assign (16, (IndexedComponent (17, (Identifier (18, ((*A*) 6) )), (Literal (19, (Integer_Literal 0) )) )), (Literal (20, (Integer_Literal 0) )))),
    (Assign (21, (Identifier (22, ((*I*) 2) )), (BinOp (23, Plus, (Name (24, (Identifier (25, ((*I*) 2) )))), (Literal (26, (Integer_Literal 1) )) ))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 2), (In_Out, Integer)); (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Array_Subtype_Index*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Array_Subtype_Index*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*I*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  (SeqDecl (4,
  (TypeDecl (5, (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))),
  (SeqDecl (7,
  (TypeDecl (8, (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10)))))),
  (SeqDecl (10,
  (TypeDecl (11, (ArrayTypeDecl (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
  (ObjDecl (13, { declaration_astnum = 14; object_name = ((*A*) 6); object_nominal_subtype = (Array_Type ((*Ar*) 5)); initialization_exp = None })))))))),
  (* = = = Procedure Body = = = *)
  (Seq (15,
  (Assign (16, (IndexedComponent (17, (Identifier (18, ((*A*) 6) )), (Literal (19, (Integer_Literal 0) )) )), (Literal (20, (Integer_Literal 0) )))),
  (Assign (21, (Identifier (22, ((*I*) 2) )), (BinOp (23, Plus, (Name (24, (Identifier (25, ((*I*) 2) )))), (Literal (26, (Integer_Literal 1) )) ))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Ar*) 5), (ArrayTypeDecl (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer)))); (((*U*) 4), (SubtypeDecl (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (Range (1, 10))))); (((*T*) 3), (IntegerTypeDecl (6, ((*T*) 3), (Range (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (26, Integer); (17, Integer); (20, Integer); (22, Integer); (25, Integer); (19, Integer); (18, (Array_Type ((*Ar*) 5))); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)11; col = (*Col*)9; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (26, { line = (*Line*)11; col = (*Col*)13; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (17, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (20, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (22, { line = (*Line*)11; col = (*Col*)4; endline = (*EndLine*)11; endcol = (*EndCol*)4 }); (25, { line = (*Line*)11; col = (*Col*)9; endline = (*EndLine*)11; endcol = (*EndCol*)9 }); (19, { line = (*Line*)10; col = (*Col*)6; endline = (*EndLine*)10; endcol = (*EndCol*)6 }); (18, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)4 }); (24, { line = (*Line*)11; col = (*Col*)9; endline = (*EndLine*)11; endcol = (*EndCol*)9 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("I", "ada://parameter/Array_Subtype_Index+1:11/I+1:32")); (6, ("A", "ada://variable/Array_Subtype_Index+1:11/A+8:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Array_Subtype_Index", "ada://procedure_body/Array_Subtype_Index+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(5, ("Ar", "ada://ordinary_type/Array_Subtype_Index+1:11/Ar+6:9")); (4, ("U", "ada://subtype/Array_Subtype_Index+1:11/U+4:12")); (3, ("T", "ada://ordinary_type/Array_Subtype_Index+1:11/T+3:9"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Array_Subtype_Index*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*I*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (4,
    (TypeDeclRT (5, (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))),
    (SeqDeclRT (7,
    (TypeDeclRT (8, (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10)))))),
    (SeqDeclRT (10,
    (TypeDeclRT (11, (ArrayTypeDeclRT (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
    (ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*A*) 6); object_nominal_subtypeRT = (Array_Type ((*Ar*) 5)); initialization_expRT = None })))))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (15,
    (AssignRT (16, (IndexedComponentRT (17, (IdentifierRT (18, ((*A*) 6) , [])), (LiteralRT (19, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (20, (Integer_Literal 0) , [], [])))),
    (AssignRT (21, (IdentifierRT (22, ((*I*) 2) , [])), (BinOpRT (23, Plus, (NameRT (24, (IdentifierRT (25, ((*I*) 2) , [])))), (LiteralRT (26, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 2), (In_Out, Integer)); (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Array_Subtype_Index*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Array_Subtype_Index*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*I*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (4,
  (TypeDeclRT (5, (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))),
  (SeqDeclRT (7,
  (TypeDeclRT (8, (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10)))))),
  (SeqDeclRT (10,
  (TypeDeclRT (11, (ArrayTypeDeclRT (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer))))),
  (ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*A*) 6); object_nominal_subtypeRT = (Array_Type ((*Ar*) 5)); initialization_expRT = None })))))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (15,
  (AssignRT (16, (IndexedComponentRT (17, (IdentifierRT (18, ((*A*) 6) , [])), (LiteralRT (19, (Integer_Literal 0) , [], [])) , [])), (LiteralRT (20, (Integer_Literal 0) , [], [])))),
  (AssignRT (21, (IdentifierRT (22, ((*I*) 2) , [])), (BinOpRT (23, Plus, (NameRT (24, (IdentifierRT (25, ((*I*) 2) , [])))), (LiteralRT (26, (Integer_Literal 1) , [], [])) , [OverflowCheck], []))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Ar*) 5), (ArrayTypeDeclRT (12, ((*Ar*) 5), ((*index subtype mark*) (Subtype ((*U*) 4))), ((*component type*) Integer)))); (((*U*) 4), (SubtypeDeclRT (9, ((*U*) 4), (Integer_Type ((*T*) 3)), (RangeRT (1, 10))))); (((*T*) 3), (IntegerTypeDeclRT (6, ((*T*) 3), (RangeRT (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (26, Integer); (17, Integer); (20, Integer); (22, Integer); (25, Integer); (19, Integer); (18, (Array_Type ((*Ar*) 5))); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)11; col = (*Col*)9; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (26, { line = (*Line*)11; col = (*Col*)13; endline = (*EndLine*)11; endcol = (*EndCol*)13 }); (17, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (20, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (22, { line = (*Line*)11; col = (*Col*)4; endline = (*EndLine*)11; endcol = (*EndCol*)4 }); (25, { line = (*Line*)11; col = (*Col*)9; endline = (*EndLine*)11; endcol = (*EndCol*)9 }); (19, { line = (*Line*)10; col = (*Col*)6; endline = (*EndLine*)10; endcol = (*EndCol*)6 }); (18, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)4 }); (24, { line = (*Line*)11; col = (*Col*)9; endline = (*EndLine*)11; endcol = (*EndCol*)9 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("I", "ada://parameter/Array_Subtype_Index+1:11/I+1:32")); (6, ("A", "ada://variable/Array_Subtype_Index+1:11/A+8:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Array_Subtype_Index", "ada://procedure_body/Array_Subtype_Index+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(5, ("Ar", "ada://ordinary_type/Array_Subtype_Index+1:11/Ar+6:9")); (4, ("U", "ada://subtype/Array_Subtype_Index+1:11/U+4:12")); (3, ("T", "ada://ordinary_type/Array_Subtype_Index+1:11/T+3:9"))]
})
}


