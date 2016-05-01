

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (SubtypeDecl (4, ((*U64*) 1), Integer, (Range (0, 2147483647)))))),
(SeqDecl (5,
(TypeDecl (6, (SubtypeDecl (7, ((*Injection_Range*) 2), (Subtype ((*U64*) 1)), (Range (0, 7)))))),
(SeqDecl (8,
(TypeDecl (9, (SubtypeDecl (10, ((*I9*) 3), (Subtype ((*U64*) 1)), (Range (0, 8)))))),
(SeqDecl (11,
(TypeDecl (12, (ArrayTypeDecl (13, ((*U64_Seq_9*) 4), ((*index subtype mark*) (Subtype ((*I9*) 3))), ((*component type*) (Subtype ((*U64*) 1))))))),
NullDecl (* Undefined Declarations ! *))))))))),
(ProcBodyDecl (14, 
  mkprocBodyDecl (
   15,
    (* = = = Procedure Name = = = *)
    ((*Mod_Test*) 5),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 16; parameter_name = ((*R*) 7); parameter_subtype_mark = (Subtype ((*U64*) 1)); parameter_mode = In }; 
  { parameter_astnum = 17; parameter_name = ((*I*) 8); parameter_subtype_mark = (Subtype ((*Injection_Range*) 2)); parameter_mode = In }; 
  { parameter_astnum = 18; parameter_name = ((*KS*) 9); parameter_subtype_mark = (Array_Type ((*U64_Seq_9*) 4)); parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    [NullDecl],
    (* = = = Procedure Body = = = *)
    (Assign (19, (IndexedComponent (20, (Identifier (21, ((*KS*) 9) )), (Name (22, (Identifier (23, ((*I*) 8) )))) )), (Name (24, (IndexedComponent (25, (Identifier (26, ((*KS*) 9) )), (BinOp (27, Modulus, (BinOp (28, Plus, (Name (29, (Identifier (30, ((*R*) 7) )))), (Name (31, (Identifier (32, ((*I*) 8) )))) )), (BinOp (33, Plus, (Literal (34, (Integer_Literal 8) )), (Literal (35, (Integer_Literal 1) )) )) )) ))))))
  ))
)));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 8), (In, (Subtype ((*Injection_Range*) 2)))); (((*R*) 7), (In, (Subtype ((*U64*) 1)))); (((*KS*) 9), (In_Out, (Array_Type ((*U64_Seq_9*) 4))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Mod_Test*) 5), (0, mkprocBodyDecl (
 15,
  (* = = = Procedure Name = = = *)
  ((*Mod_Test*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 16; parameter_name = ((*R*) 7); parameter_subtype_mark = (Subtype ((*U64*) 1)); parameter_mode = In }; 
{ parameter_astnum = 17; parameter_name = ((*I*) 8); parameter_subtype_mark = (Subtype ((*Injection_Range*) 2)); parameter_mode = In }; 
{ parameter_astnum = 18; parameter_name = ((*KS*) 9); parameter_subtype_mark = (Array_Type ((*U64_Seq_9*) 4)); parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  [NullDecl],
  (* = = = Procedure Body = = = *)
  (Assign (19, (IndexedComponent (20, (Identifier (21, ((*KS*) 9) )), (Name (22, (Identifier (23, ((*I*) 8) )))) )), (Name (24, (IndexedComponent (25, (Identifier (26, ((*KS*) 9) )), (BinOp (27, Modulus, (BinOp (28, Plus, (Name (29, (Identifier (30, ((*R*) 7) )))), (Name (31, (Identifier (32, ((*I*) 8) )))) )), (BinOp (33, Plus, (Literal (34, (Integer_Literal 8) )), (Literal (35, (Integer_Literal 1) )) )) )) ))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Injection_Range*) 2), (SubtypeDecl (7, ((*Injection_Range*) 2), (Subtype ((*U64*) 1)), (Range (0, 7))))); (((*I9*) 3), (SubtypeDecl (10, ((*I9*) 3), (Subtype ((*U64*) 1)), (Range (0, 8))))); (((*U64_Seq_9*) 4), (ArrayTypeDecl (13, ((*U64_Seq_9*) 4), ((*index subtype mark*) (Subtype ((*I9*) 3))), ((*component type*) (Subtype ((*U64*) 1)))))); (((*U64*) 1), (SubtypeDecl (4, ((*U64*) 1), Integer, (Range (0, 2147483647)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, (Subtype ((*Injection_Range*) 2))); (32, (Subtype ((*Injection_Range*) 2))); (35, Integer); (26, (Array_Type ((*U64_Seq_9*) 4))); (29, (Subtype ((*U64*) 1))); (20, (Subtype ((*U64*) 1))); (22, (Subtype ((*Injection_Range*) 2))); (31, (Subtype ((*Injection_Range*) 2))); (34, Integer); (25, (Subtype ((*U64*) 1))); (28, Integer); (27, Integer); (21, (Array_Type ((*U64_Seq_9*) 4))); (30, (Subtype ((*U64*) 1))); (33, Integer); (24, (Subtype ((*U64*) 1)))];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (32, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (35, { line = (*Line*)7; col = (*Col*)39; endline = (*EndLine*)7; endcol = (*EndCol*)39 }); (26, { line = (*Line*)7; col = (*Col*)18; endline = (*EndLine*)7; endcol = (*EndCol*)19 }); (29, { line = (*Line*)7; col = (*Col*)23; endline = (*EndLine*)7; endcol = (*EndCol*)23 }); (20, { line = (*Line*)7; col = (*Col*)8; endline = (*EndLine*)7; endcol = (*EndCol*)13 }); (22, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (31, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (34, { line = (*Line*)7; col = (*Col*)35; endline = (*EndLine*)7; endcol = (*EndCol*)35 }); (25, { line = (*Line*)7; col = (*Col*)18; endline = (*EndLine*)7; endcol = (*EndCol*)41 }); (28, { line = (*Line*)7; col = (*Col*)23; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (27, { line = (*Line*)7; col = (*Col*)22; endline = (*EndLine*)7; endcol = (*EndCol*)40 }); (21, { line = (*Line*)7; col = (*Col*)8; endline = (*EndLine*)7; endcol = (*EndCol*)9 }); (30, { line = (*Line*)7; col = (*Col*)23; endline = (*EndLine*)7; endcol = (*EndCol*)23 }); (33, { line = (*Line*)7; col = (*Col*)35; endline = (*EndLine*)7; endcol = (*EndCol*)39 }); (24, { line = (*Line*)7; col = (*Col*)18; endline = (*EndLine*)7; endcol = (*EndCol*)41 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("I", "ada://parameter/Modulus-1:9/Mod_Test-9:14/I-9:36")); (7, ("R", "ada://parameter/Modulus-1:9/Mod_Test-9:14/R-9:24")); (9, ("KS", "ada://parameter/Modulus-1:9/Mod_Test-9:14/KS-9:57"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Mod_Test", "ada://procedure_body/Modulus-1:9/Mod_Test-9:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(6, ("Modulus", "ada://package_body/Modulus-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(2, ("Injection_Range", "ada://subtype/Modulus-1:9/Injection_Range-4:12")); (4, ("U64_Seq_9", "ada://ordinary_type/Modulus-1:9/U64_Seq_9-7:9")); (1, ("U64", "ada://subtype/Modulus-1:9/U64-3:12")); (3, ("I9", "ada://subtype/Modulus-1:9/I9-5:12"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (SubtypeDeclRT (4, ((*U64*) 1), Integer, (RangeRT (0, 2147483647)))))),
(SeqDeclRT (5,
(TypeDeclRT (6, (SubtypeDeclRT (7, ((*Injection_Range*) 2), (Subtype ((*U64*) 1)), (RangeRT (0, 7)))))),
(SeqDeclRT (8,
(TypeDeclRT (9, (SubtypeDeclRT (10, ((*I9*) 3), (Subtype ((*U64*) 1)), (RangeRT (0, 8)))))),
(SeqDeclRT (11,
(TypeDeclRT (12, (ArrayTypeDeclRT (13, ((*U64_Seq_9*) 4), ((*index subtype mark*) (Subtype ((*I9*) 3))), ((*component type*) (Subtype ((*U64*) 1))))))),
NullDeclRT (* Undefined Declarations ! *))))))))),
(ProcBodyDeclRT (14, 
  mkprocBodyDeclRT (
   15,
    (* = = = Procedure Name = = = *)
    ((*Mod_Test*) 5),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 16; parameter_nameRT = ((*R*) 7); parameter_subtype_markRT = (Subtype ((*U64*) 1)); parameter_modeRT = In }; 
  { parameter_astnumRT = 17; parameter_nameRT = ((*I*) 8); parameter_subtype_markRT = (Subtype ((*Injection_Range*) 2)); parameter_modeRT = In }; 
  { parameter_astnumRT = 18; parameter_nameRT = ((*KS*) 9); parameter_subtype_markRT = (Array_Type ((*U64_Seq_9*) 4)); parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    [NullDeclRT],
    (* = = = Procedure Body = = = *)
    (AssignRT (19, (IndexedComponentRT (20, (IdentifierRT (21, ((*KS*) 9) , [])), (NameRT (22, (IdentifierRT (23, ((*I*) 8) , [])))) , [])), (NameRT (24, (IndexedComponentRT (25, (IdentifierRT (26, ((*KS*) 9) , [])), (BinOpRT (27, Modulus, (BinOpRT (28, Plus, (NameRT (29, (IdentifierRT (30, ((*R*) 7) , [])))), (NameRT (31, (IdentifierRT (32, ((*I*) 8) , [])))) , [OverflowCheck], [])), (BinOpRT (33, Plus, (LiteralRT (34, (Integer_Literal 8) , [], [])), (LiteralRT (35, (Integer_Literal 1) , [], [])) , [], [])) , [DivCheck], [])) , []))))))
  ))
)));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 8), (In, (Subtype ((*Injection_Range*) 2)))); (((*R*) 7), (In, (Subtype ((*U64*) 1)))); (((*KS*) 9), (In_Out, (Array_Type ((*U64_Seq_9*) 4))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Mod_Test*) 5), (0, mkprocBodyDeclRT (
 15,
  (* = = = Procedure Name = = = *)
  ((*Mod_Test*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 16; parameter_nameRT = ((*R*) 7); parameter_subtype_markRT = (Subtype ((*U64*) 1)); parameter_modeRT = In }; 
{ parameter_astnumRT = 17; parameter_nameRT = ((*I*) 8); parameter_subtype_markRT = (Subtype ((*Injection_Range*) 2)); parameter_modeRT = In }; 
{ parameter_astnumRT = 18; parameter_nameRT = ((*KS*) 9); parameter_subtype_markRT = (Array_Type ((*U64_Seq_9*) 4)); parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  [NullDeclRT],
  (* = = = Procedure Body = = = *)
  (AssignRT (19, (IndexedComponentRT (20, (IdentifierRT (21, ((*KS*) 9) , [])), (NameRT (22, (IdentifierRT (23, ((*I*) 8) , [])))) , [])), (NameRT (24, (IndexedComponentRT (25, (IdentifierRT (26, ((*KS*) 9) , [])), (BinOpRT (27, Modulus, (BinOpRT (28, Plus, (NameRT (29, (IdentifierRT (30, ((*R*) 7) , [])))), (NameRT (31, (IdentifierRT (32, ((*I*) 8) , [])))) , [OverflowCheck], [])), (BinOpRT (33, Plus, (LiteralRT (34, (Integer_Literal 8) , [], [])), (LiteralRT (35, (Integer_Literal 1) , [], [])) , [], [])) , [DivCheck], [])) , []))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Injection_Range*) 2), (SubtypeDeclRT (7, ((*Injection_Range*) 2), (Subtype ((*U64*) 1)), (RangeRT (0, 7))))); (((*I9*) 3), (SubtypeDeclRT (10, ((*I9*) 3), (Subtype ((*U64*) 1)), (RangeRT (0, 8))))); (((*U64_Seq_9*) 4), (ArrayTypeDeclRT (13, ((*U64_Seq_9*) 4), ((*index subtype mark*) (Subtype ((*I9*) 3))), ((*component type*) (Subtype ((*U64*) 1)))))); (((*U64*) 1), (SubtypeDeclRT (4, ((*U64*) 1), Integer, (RangeRT (0, 2147483647)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, (Subtype ((*Injection_Range*) 2))); (32, (Subtype ((*Injection_Range*) 2))); (35, Integer); (26, (Array_Type ((*U64_Seq_9*) 4))); (29, (Subtype ((*U64*) 1))); (20, (Subtype ((*U64*) 1))); (22, (Subtype ((*Injection_Range*) 2))); (31, (Subtype ((*Injection_Range*) 2))); (34, Integer); (25, (Subtype ((*U64*) 1))); (28, Integer); (27, Integer); (21, (Array_Type ((*U64_Seq_9*) 4))); (30, (Subtype ((*U64*) 1))); (33, Integer); (24, (Subtype ((*U64*) 1)))];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (32, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (35, { line = (*Line*)7; col = (*Col*)39; endline = (*EndLine*)7; endcol = (*EndCol*)39 }); (26, { line = (*Line*)7; col = (*Col*)18; endline = (*EndLine*)7; endcol = (*EndCol*)19 }); (29, { line = (*Line*)7; col = (*Col*)23; endline = (*EndLine*)7; endcol = (*EndCol*)23 }); (20, { line = (*Line*)7; col = (*Col*)8; endline = (*EndLine*)7; endcol = (*EndCol*)13 }); (22, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (31, { line = (*Line*)7; col = (*Col*)27; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (34, { line = (*Line*)7; col = (*Col*)35; endline = (*EndLine*)7; endcol = (*EndCol*)35 }); (25, { line = (*Line*)7; col = (*Col*)18; endline = (*EndLine*)7; endcol = (*EndCol*)41 }); (28, { line = (*Line*)7; col = (*Col*)23; endline = (*EndLine*)7; endcol = (*EndCol*)27 }); (27, { line = (*Line*)7; col = (*Col*)22; endline = (*EndLine*)7; endcol = (*EndCol*)40 }); (21, { line = (*Line*)7; col = (*Col*)8; endline = (*EndLine*)7; endcol = (*EndCol*)9 }); (30, { line = (*Line*)7; col = (*Col*)23; endline = (*EndLine*)7; endcol = (*EndCol*)23 }); (33, { line = (*Line*)7; col = (*Col*)35; endline = (*EndLine*)7; endcol = (*EndCol*)39 }); (24, { line = (*Line*)7; col = (*Col*)18; endline = (*EndLine*)7; endcol = (*EndCol*)41 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("I", "ada://parameter/Modulus-1:9/Mod_Test-9:14/I-9:36")); (7, ("R", "ada://parameter/Modulus-1:9/Mod_Test-9:14/R-9:24")); (9, ("KS", "ada://parameter/Modulus-1:9/Mod_Test-9:14/KS-9:57"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Mod_Test", "ada://procedure_body/Modulus-1:9/Mod_Test-9:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(6, ("Modulus", "ada://package_body/Modulus-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(2, ("Injection_Range", "ada://subtype/Modulus-1:9/Injection_Range-4:12")); (4, ("U64_Seq_9", "ada://ordinary_type/Modulus-1:9/U64_Seq_9-7:9")); (1, ("U64", "ada://subtype/Modulus-1:9/U64-3:12")); (3, ("I9", "ada://subtype/Modulus-1:9/I9-5:12"))]
})
}


