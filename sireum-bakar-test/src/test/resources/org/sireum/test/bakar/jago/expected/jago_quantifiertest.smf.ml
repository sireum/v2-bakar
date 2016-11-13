

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (IntegerTypeDecl (4, ((*Index*) 1), (Range (1, 10)))))),
(SeqDecl (5,
(TypeDecl (6, (ArrayTypeDecl (7, ((*Vector*) 2), ((*index subtype mark*) (Integer_Type ((*Index*) 1))), ((*component type*) Integer))))),
(SeqDecl (8,
(ObjDecl (9, { declaration_astnum = 10; object_name = ((*V*) 3); object_nominal_subtype = (Array_Type ((*Vector*) 2)); initialization_exp = None })),
NullDecl (* Undefined Declarations ! *))))))),
(ProcBodyDecl (11, 
  mkprocBodyDecl (
   12,
    (* = = = Procedure Name = = = *)
    ((*dummy*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 13; parameter_name = ((*I*) 6); parameter_subtype_mark = (Integer_Type ((*Index*) 1)); parameter_mode = In }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (14, (IndexedComponent (15, (Identifier (16, ((*V*) 3) )), (Name (17, (Identifier (18, ((*I*) 6) )))) )), (BinOp (19, Plus, (Name (20, (IndexedComponent (21, (Identifier (22, ((*V*) 3) )), (Name (23, (Identifier (24, ((*I*) 6) )))) )))), (Literal (25, (Integer_Literal 3) )) ))))
  ))
)));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*V*) 3), (In_Out, (Array_Type ((*Vector*) 2)))); (((*I*) 6), (In, (Integer_Type ((*Index*) 1))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*dummy*) 4), (0, mkprocBodyDecl (
 12,
  (* = = = Procedure Name = = = *)
  ((*dummy*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 13; parameter_name = ((*I*) 6); parameter_subtype_mark = (Integer_Type ((*Index*) 1)); parameter_mode = In }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (14, (IndexedComponent (15, (Identifier (16, ((*V*) 3) )), (Name (17, (Identifier (18, ((*I*) 6) )))) )), (BinOp (19, Plus, (Name (20, (IndexedComponent (21, (Identifier (22, ((*V*) 3) )), (Name (23, (Identifier (24, ((*I*) 6) )))) )))), (Literal (25, (Integer_Literal 3) )) ))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Index*) 1), (IntegerTypeDecl (4, ((*Index*) 1), (Range (1, 10))))); (((*Vector*) 2), (ArrayTypeDecl (7, ((*Vector*) 2), ((*index subtype mark*) (Integer_Type ((*Index*) 1))), ((*component type*) Integer))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, (Integer_Type ((*Index*) 1))); (17, (Integer_Type ((*Index*) 1))); (20, Integer); (22, (Array_Type ((*Vector*) 2))); (25, Integer); (16, (Array_Type ((*Vector*) 2))); (19, Integer); (18, (Integer_Type ((*Index*) 1))); (21, Integer); (24, (Integer_Type ((*Index*) 1))); (15, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)15 }); (17, { line = (*Line*)8; col = (*Col*)7; endline = (*EndLine*)8; endcol = (*EndCol*)7 }); (20, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (22, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)13 }); (25, { line = (*Line*)8; col = (*Col*)20; endline = (*EndLine*)8; endcol = (*EndCol*)20 }); (16, { line = (*Line*)8; col = (*Col*)5; endline = (*EndLine*)8; endcol = (*EndCol*)5 }); (19, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)20 }); (18, { line = (*Line*)8; col = (*Col*)7; endline = (*EndLine*)8; endcol = (*EndCol*)7 }); (21, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (24, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)15 }); (15, { line = (*Line*)8; col = (*Col*)5; endline = (*EndLine*)8; endcol = (*EndCol*)8 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(3, ("V", "ada://variable/QuantifierTest-1:9/V-9:3")); (6, ("I", "ada://parameter/QuantifierTest-1:9/dummy-11:13/I-11:19"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(4, ("dummy", "ada://procedure_body/QuantifierTest-1:9/dummy-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(5, ("QuantifierTest", "ada://package_body/QuantifierTest-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(2, ("Vector", "ada://ordinary_type/QuantifierTest-1:9/Vector-7:8")); (1, ("Index", "ada://ordinary_type/QuantifierTest-1:9/Index-6:8"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (IntegerTypeDeclRT (4, ((*Index*) 1), (RangeRT (1, 10)))))),
(SeqDeclRT (5,
(TypeDeclRT (6, (ArrayTypeDeclRT (7, ((*Vector*) 2), ((*index subtype mark*) (Integer_Type ((*Index*) 1))), ((*component type*) Integer))))),
(SeqDeclRT (8,
(ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*V*) 3); object_nominal_subtypeRT = (Array_Type ((*Vector*) 2)); initialization_expRT = None })),
NullDeclRT (* Undefined Declarations ! *))))))),
(ProcBodyDeclRT (11, 
  mkprocBodyDeclRT (
   12,
    (* = = = Procedure Name = = = *)
    ((*dummy*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 13; parameter_nameRT = ((*I*) 6); parameter_subtype_markRT = (Integer_Type ((*Index*) 1)); parameter_modeRT = In }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (14, (IndexedComponentRT (15, (IdentifierRT (16, ((*V*) 3) , [])), (NameRT (17, (IdentifierRT (18, ((*I*) 6) , [])))) , [])), (BinOpRT (19, Plus, (NameRT (20, (IndexedComponentRT (21, (IdentifierRT (22, ((*V*) 3) , [])), (NameRT (23, (IdentifierRT (24, ((*I*) 6) , [])))) , [])))), (LiteralRT (25, (Integer_Literal 3) , [], [])) , [OverflowCheck], []))))
  ))
)));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*V*) 3), (In_Out, (Array_Type ((*Vector*) 2)))); (((*I*) 6), (In, (Integer_Type ((*Index*) 1))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*dummy*) 4), (0, mkprocBodyDeclRT (
 12,
  (* = = = Procedure Name = = = *)
  ((*dummy*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 13; parameter_nameRT = ((*I*) 6); parameter_subtype_markRT = (Integer_Type ((*Index*) 1)); parameter_modeRT = In }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (14, (IndexedComponentRT (15, (IdentifierRT (16, ((*V*) 3) , [])), (NameRT (17, (IdentifierRT (18, ((*I*) 6) , [])))) , [])), (BinOpRT (19, Plus, (NameRT (20, (IndexedComponentRT (21, (IdentifierRT (22, ((*V*) 3) , [])), (NameRT (23, (IdentifierRT (24, ((*I*) 6) , [])))) , [])))), (LiteralRT (25, (Integer_Literal 3) , [], [])) , [OverflowCheck], []))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Index*) 1), (IntegerTypeDeclRT (4, ((*Index*) 1), (RangeRT (1, 10))))); (((*Vector*) 2), (ArrayTypeDeclRT (7, ((*Vector*) 2), ((*index subtype mark*) (Integer_Type ((*Index*) 1))), ((*component type*) Integer))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, (Integer_Type ((*Index*) 1))); (17, (Integer_Type ((*Index*) 1))); (20, Integer); (22, (Array_Type ((*Vector*) 2))); (25, Integer); (16, (Array_Type ((*Vector*) 2))); (19, Integer); (18, (Integer_Type ((*Index*) 1))); (21, Integer); (24, (Integer_Type ((*Index*) 1))); (15, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)15 }); (17, { line = (*Line*)8; col = (*Col*)7; endline = (*EndLine*)8; endcol = (*EndCol*)7 }); (20, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (22, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)13 }); (25, { line = (*Line*)8; col = (*Col*)20; endline = (*EndLine*)8; endcol = (*EndCol*)20 }); (16, { line = (*Line*)8; col = (*Col*)5; endline = (*EndLine*)8; endcol = (*EndCol*)5 }); (19, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)20 }); (18, { line = (*Line*)8; col = (*Col*)7; endline = (*EndLine*)8; endcol = (*EndCol*)7 }); (21, { line = (*Line*)8; col = (*Col*)13; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (24, { line = (*Line*)8; col = (*Col*)15; endline = (*EndLine*)8; endcol = (*EndCol*)15 }); (15, { line = (*Line*)8; col = (*Col*)5; endline = (*EndLine*)8; endcol = (*EndCol*)8 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(3, ("V", "ada://variable/QuantifierTest-1:9/V-9:3")); (6, ("I", "ada://parameter/QuantifierTest-1:9/dummy-11:13/I-11:19"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(4, ("dummy", "ada://procedure_body/QuantifierTest-1:9/dummy-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(5, ("QuantifierTest", "ada://package_body/QuantifierTest-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(2, ("Vector", "ada://ordinary_type/QuantifierTest-1:9/Vector-7:8")); (1, ("Index", "ada://ordinary_type/QuantifierTest-1:9/Index-6:8"))]
})
}


