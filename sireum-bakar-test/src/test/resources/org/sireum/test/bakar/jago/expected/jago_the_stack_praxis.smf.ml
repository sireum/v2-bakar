

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))),
(SeqDecl (3,
(TypeDecl (4, (IntegerTypeDecl (5, ((*Pointer_Range*) 4), (Range (0, 100)))))),
(SeqDecl (6,
(TypeDecl (7, (SubtypeDecl (8, ((*Index_Range*) 5), (Integer_Type ((*Pointer_Range*) 4)), (Range (1, 100)))))),
(SeqDecl (9,
(TypeDecl (10, (ArrayTypeDecl (11, ((*Vector*) 6), ((*index subtype mark*) (Subtype ((*Index_Range*) 5))), ((*component type*) Integer))))),
(SeqDecl (12,
(ObjDecl (13, { declaration_astnum = 14; object_name = ((*S*) 7); object_nominal_subtype = (Array_Type ((*Vector*) 6)); initialization_exp = None })),
(SeqDecl (15,
(ObjDecl (16, { declaration_astnum = 17; object_name = ((*Pointer*) 8); object_nominal_subtype = (Integer_Type ((*Pointer_Range*) 4)); initialization_exp = None })),
(SeqDecl (18,
(ProcBodyDecl (19, 
  mkprocBodyDecl (
   20,
    (* = = = Procedure Name = = = *)
    ((*Push*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 21; parameter_name = ((*X*) 9); parameter_subtype_mark = Integer; parameter_mode = In }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (22,
    (Assign (23, (Identifier (24, ((*Pointer*) 8) )), (BinOp (25, Plus, (Name (26, (Identifier (27, ((*Pointer*) 8) )))), (Literal (28, (Integer_Literal 1) )) )))),
    (Assign (29, (IndexedComponent (30, (Identifier (31, ((*S*) 7) )), (Name (32, (Identifier (33, ((*Pointer*) 8) )))) )), (Name (34, (Identifier (35, ((*X*) 9) ))))))))
  ))
),
(ProcBodyDecl (36, 
  mkprocBodyDecl (
   37,
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 38; parameter_name = ((*X*) 12); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (39,
    (Assign (40, (Identifier (41, ((*X*) 12) )), (Name (42, (IndexedComponent (43, (Identifier (44, ((*S*) 7) )), (Name (45, (Identifier (46, ((*Pointer*) 8) )))) )))))),
    (Assign (47, (Identifier (48, ((*Pointer*) 8) )), (BinOp (49, Minus, (Name (50, (Identifier (51, ((*Pointer*) 8) )))), (Literal (52, (Integer_Literal 1) )) ))))))
  ))
)))))))))))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Pointer*) 8), (In_Out, (Integer_Type ((*Pointer_Range*) 4)))); (((*S*) 7), (In_Out, (Array_Type ((*Vector*) 6)))); (((*X*) 9), (In, Integer)); (((*X*) 12), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Push*) 1), (0, mkprocBodyDecl (
 20,
  (* = = = Procedure Name = = = *)
  ((*Push*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 21; parameter_name = ((*X*) 9); parameter_subtype_mark = Integer; parameter_mode = In }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (22,
  (Assign (23, (Identifier (24, ((*Pointer*) 8) )), (BinOp (25, Plus, (Name (26, (Identifier (27, ((*Pointer*) 8) )))), (Literal (28, (Integer_Literal 1) )) )))),
  (Assign (29, (IndexedComponent (30, (Identifier (31, ((*S*) 7) )), (Name (32, (Identifier (33, ((*Pointer*) 8) )))) )), (Name (34, (Identifier (35, ((*X*) 9) ))))))))
))); (((*Pop*) 2), (0, mkprocBodyDecl (
 37,
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 38; parameter_name = ((*X*) 12); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (39,
  (Assign (40, (Identifier (41, ((*X*) 12) )), (Name (42, (IndexedComponent (43, (Identifier (44, ((*S*) 7) )), (Name (45, (Identifier (46, ((*Pointer*) 8) )))) )))))),
  (Assign (47, (Identifier (48, ((*Pointer*) 8) )), (BinOp (49, Minus, (Name (50, (Identifier (51, ((*Pointer*) 8) )))), (Literal (52, (Integer_Literal 1) )) ))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Index_Range*) 5), (SubtypeDecl (8, ((*Index_Range*) 5), (Integer_Type ((*Pointer_Range*) 4)), (Range (1, 100))))); (((*Pointer_Range*) 4), (IntegerTypeDecl (5, ((*Pointer_Range*) 4), (Range (0, 100))))); (((*Vector*) 6), (ArrayTypeDecl (11, ((*Vector*) 6), ((*index subtype mark*) (Subtype ((*Index_Range*) 5))), ((*component type*) Integer))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(50, (Integer_Type ((*Pointer_Range*) 4))); (32, (Integer_Type ((*Pointer_Range*) 4))); (41, Integer); (44, (Array_Type ((*Vector*) 6))); (26, (Integer_Type ((*Pointer_Range*) 4))); (35, Integer); (46, (Integer_Type ((*Pointer_Range*) 4))); (49, (Integer_Type ((*Pointer_Range*) 4))); (31, (Array_Type ((*Vector*) 6))); (52, Integer); (43, Integer); (25, (Integer_Type ((*Pointer_Range*) 4))); (34, Integer); (28, Integer); (45, (Integer_Type ((*Pointer_Range*) 4))); (27, (Integer_Type ((*Pointer_Range*) 4))); (48, (Integer_Type ((*Pointer_Range*) 4))); (30, Integer); (51, (Integer_Type ((*Pointer_Range*) 4))); (24, (Integer_Type ((*Pointer_Range*) 4))); (33, (Integer_Type ((*Pointer_Range*) 4))); (42, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(50, { line = (*Line*)30; col = (*Col*)18; endline = (*EndLine*)30; endcol = (*EndCol*)24 }); (32, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (41, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)7 }); (44, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)12 }); (26, { line = (*Line*)17; col = (*Col*)18; endline = (*EndLine*)17; endcol = (*EndCol*)24 }); (35, { line = (*Line*)18; col = (*Col*)21; endline = (*EndLine*)18; endcol = (*EndCol*)21 }); (46, { line = (*Line*)29; col = (*Col*)14; endline = (*EndLine*)29; endcol = (*EndCol*)20 }); (49, { line = (*Line*)30; col = (*Col*)18; endline = (*EndLine*)30; endcol = (*EndCol*)28 }); (31, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)7 }); (52, { line = (*Line*)30; col = (*Col*)28; endline = (*EndLine*)30; endcol = (*EndCol*)28 }); (43, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)21 }); (25, { line = (*Line*)17; col = (*Col*)18; endline = (*EndLine*)17; endcol = (*EndCol*)28 }); (34, { line = (*Line*)18; col = (*Col*)21; endline = (*EndLine*)18; endcol = (*EndCol*)21 }); (28, { line = (*Line*)17; col = (*Col*)28; endline = (*EndLine*)17; endcol = (*EndCol*)28 }); (45, { line = (*Line*)29; col = (*Col*)14; endline = (*EndLine*)29; endcol = (*EndCol*)20 }); (27, { line = (*Line*)17; col = (*Col*)18; endline = (*EndLine*)17; endcol = (*EndCol*)24 }); (48, { line = (*Line*)30; col = (*Col*)7; endline = (*EndLine*)30; endcol = (*EndCol*)13 }); (30, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)16 }); (51, { line = (*Line*)30; col = (*Col*)18; endline = (*EndLine*)30; endcol = (*EndCol*)24 }); (24, { line = (*Line*)17; col = (*Col*)7; endline = (*EndLine*)17; endcol = (*EndCol*)13 }); (33, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (42, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)21 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Pointer", "ada://variable/The_Stack_Praxis-1:9/Pointer+9:4")); (7, ("S", "ada://variable/The_Stack_Praxis-1:9/S+8:4")); (9, ("X", "ada://parameter/The_Stack_Praxis-1:9/Push-5:14/X-5:19")); (12, ("X", "ada://parameter/The_Stack_Praxis-1:9/Pop-9:14/X-9:18"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Pop", "ada://procedure_body/The_Stack_Praxis-1:9/Pop-9:14")); (1, ("Push", "ada://procedure_body/The_Stack_Praxis-1:9/Push-5:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("The_Stack_Praxis", "ada://package_body/The_Stack_Praxis-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(5, ("Index_Range", "ada://subtype/The_Stack_Praxis-1:9/Index_Range+6:12")); (4, ("Pointer_Range", "ada://ordinary_type/The_Stack_Praxis-1:9/Pointer_Range+5:9")); (6, ("Vector", "ada://ordinary_type/The_Stack_Praxis-1:9/Vector+7:9"))]
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
(TypeDeclRT (4, (IntegerTypeDeclRT (5, ((*Pointer_Range*) 4), (RangeRT (0, 100)))))),
(SeqDeclRT (6,
(TypeDeclRT (7, (SubtypeDeclRT (8, ((*Index_Range*) 5), (Integer_Type ((*Pointer_Range*) 4)), (RangeRT (1, 100)))))),
(SeqDeclRT (9,
(TypeDeclRT (10, (ArrayTypeDeclRT (11, ((*Vector*) 6), ((*index subtype mark*) (Subtype ((*Index_Range*) 5))), ((*component type*) Integer))))),
(SeqDeclRT (12,
(ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*S*) 7); object_nominal_subtypeRT = (Array_Type ((*Vector*) 6)); initialization_expRT = None })),
(SeqDeclRT (15,
(ObjDeclRT (16, { declaration_astnumRT = 17; object_nameRT = ((*Pointer*) 8); object_nominal_subtypeRT = (Integer_Type ((*Pointer_Range*) 4)); initialization_expRT = None })),
(SeqDeclRT (18,
(ProcBodyDeclRT (19, 
  mkprocBodyDeclRT (
   20,
    (* = = = Procedure Name = = = *)
    ((*Push*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 21; parameter_nameRT = ((*X*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (22,
    (AssignRT (23, (IdentifierRT (24, ((*Pointer*) 8) , [])), (BinOpRT (25, Plus, (NameRT (26, (IdentifierRT (27, ((*Pointer*) 8) , [])))), (LiteralRT (28, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
    (AssignRT (29, (IndexedComponentRT (30, (IdentifierRT (31, ((*S*) 7) , [])), (NameRT (32, (IdentifierRT (33, ((*Pointer*) 8) , [RangeCheck])))) , [])), (NameRT (34, (IdentifierRT (35, ((*X*) 9) , []))))))))
  ))
),
(ProcBodyDeclRT (36, 
  mkprocBodyDeclRT (
   37,
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 38; parameter_nameRT = ((*X*) 12); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (39,
    (AssignRT (40, (IdentifierRT (41, ((*X*) 12) , [])), (NameRT (42, (IndexedComponentRT (43, (IdentifierRT (44, ((*S*) 7) , [])), (NameRT (45, (IdentifierRT (46, ((*Pointer*) 8) , [RangeCheck])))) , [])))))),
    (AssignRT (47, (IdentifierRT (48, ((*Pointer*) 8) , [])), (BinOpRT (49, Minus, (NameRT (50, (IdentifierRT (51, ((*Pointer*) 8) , [])))), (LiteralRT (52, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))))
  ))
)))))))))))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Pointer*) 8), (In_Out, (Integer_Type ((*Pointer_Range*) 4)))); (((*S*) 7), (In_Out, (Array_Type ((*Vector*) 6)))); (((*X*) 9), (In, Integer)); (((*X*) 12), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Push*) 1), (0, mkprocBodyDeclRT (
 20,
  (* = = = Procedure Name = = = *)
  ((*Push*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 21; parameter_nameRT = ((*X*) 9); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (22,
  (AssignRT (23, (IdentifierRT (24, ((*Pointer*) 8) , [])), (BinOpRT (25, Plus, (NameRT (26, (IdentifierRT (27, ((*Pointer*) 8) , [])))), (LiteralRT (28, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
  (AssignRT (29, (IndexedComponentRT (30, (IdentifierRT (31, ((*S*) 7) , [])), (NameRT (32, (IdentifierRT (33, ((*Pointer*) 8) , [RangeCheck])))) , [])), (NameRT (34, (IdentifierRT (35, ((*X*) 9) , []))))))))
))); (((*Pop*) 2), (0, mkprocBodyDeclRT (
 37,
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 38; parameter_nameRT = ((*X*) 12); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (39,
  (AssignRT (40, (IdentifierRT (41, ((*X*) 12) , [])), (NameRT (42, (IndexedComponentRT (43, (IdentifierRT (44, ((*S*) 7) , [])), (NameRT (45, (IdentifierRT (46, ((*Pointer*) 8) , [RangeCheck])))) , [])))))),
  (AssignRT (47, (IdentifierRT (48, ((*Pointer*) 8) , [])), (BinOpRT (49, Minus, (NameRT (50, (IdentifierRT (51, ((*Pointer*) 8) , [])))), (LiteralRT (52, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Index_Range*) 5), (SubtypeDeclRT (8, ((*Index_Range*) 5), (Integer_Type ((*Pointer_Range*) 4)), (RangeRT (1, 100))))); (((*Pointer_Range*) 4), (IntegerTypeDeclRT (5, ((*Pointer_Range*) 4), (RangeRT (0, 100))))); (((*Vector*) 6), (ArrayTypeDeclRT (11, ((*Vector*) 6), ((*index subtype mark*) (Subtype ((*Index_Range*) 5))), ((*component type*) Integer))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(50, (Integer_Type ((*Pointer_Range*) 4))); (32, (Integer_Type ((*Pointer_Range*) 4))); (41, Integer); (44, (Array_Type ((*Vector*) 6))); (26, (Integer_Type ((*Pointer_Range*) 4))); (35, Integer); (46, (Integer_Type ((*Pointer_Range*) 4))); (49, (Integer_Type ((*Pointer_Range*) 4))); (31, (Array_Type ((*Vector*) 6))); (52, Integer); (43, Integer); (25, (Integer_Type ((*Pointer_Range*) 4))); (34, Integer); (28, Integer); (45, (Integer_Type ((*Pointer_Range*) 4))); (27, (Integer_Type ((*Pointer_Range*) 4))); (48, (Integer_Type ((*Pointer_Range*) 4))); (30, Integer); (51, (Integer_Type ((*Pointer_Range*) 4))); (24, (Integer_Type ((*Pointer_Range*) 4))); (33, (Integer_Type ((*Pointer_Range*) 4))); (42, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(50, { line = (*Line*)30; col = (*Col*)18; endline = (*EndLine*)30; endcol = (*EndCol*)24 }); (32, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (41, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)7 }); (44, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)12 }); (26, { line = (*Line*)17; col = (*Col*)18; endline = (*EndLine*)17; endcol = (*EndCol*)24 }); (35, { line = (*Line*)18; col = (*Col*)21; endline = (*EndLine*)18; endcol = (*EndCol*)21 }); (46, { line = (*Line*)29; col = (*Col*)14; endline = (*EndLine*)29; endcol = (*EndCol*)20 }); (49, { line = (*Line*)30; col = (*Col*)18; endline = (*EndLine*)30; endcol = (*EndCol*)28 }); (31, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)7 }); (52, { line = (*Line*)30; col = (*Col*)28; endline = (*EndLine*)30; endcol = (*EndCol*)28 }); (43, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)21 }); (25, { line = (*Line*)17; col = (*Col*)18; endline = (*EndLine*)17; endcol = (*EndCol*)28 }); (34, { line = (*Line*)18; col = (*Col*)21; endline = (*EndLine*)18; endcol = (*EndCol*)21 }); (28, { line = (*Line*)17; col = (*Col*)28; endline = (*EndLine*)17; endcol = (*EndCol*)28 }); (45, { line = (*Line*)29; col = (*Col*)14; endline = (*EndLine*)29; endcol = (*EndCol*)20 }); (27, { line = (*Line*)17; col = (*Col*)18; endline = (*EndLine*)17; endcol = (*EndCol*)24 }); (48, { line = (*Line*)30; col = (*Col*)7; endline = (*EndLine*)30; endcol = (*EndCol*)13 }); (30, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)16 }); (51, { line = (*Line*)30; col = (*Col*)18; endline = (*EndLine*)30; endcol = (*EndCol*)24 }); (24, { line = (*Line*)17; col = (*Col*)7; endline = (*EndLine*)17; endcol = (*EndCol*)13 }); (33, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)15 }); (42, { line = (*Line*)29; col = (*Col*)12; endline = (*EndLine*)29; endcol = (*EndCol*)21 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("Pointer", "ada://variable/The_Stack_Praxis-1:9/Pointer+9:4")); (7, ("S", "ada://variable/The_Stack_Praxis-1:9/S+8:4")); (9, ("X", "ada://parameter/The_Stack_Praxis-1:9/Push-5:14/X-5:19")); (12, ("X", "ada://parameter/The_Stack_Praxis-1:9/Pop-9:14/X-9:18"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Pop", "ada://procedure_body/The_Stack_Praxis-1:9/Pop-9:14")); (1, ("Push", "ada://procedure_body/The_Stack_Praxis-1:9/Push-5:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("The_Stack_Praxis", "ada://package_body/The_Stack_Praxis-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(5, ("Index_Range", "ada://subtype/The_Stack_Praxis-1:9/Index_Range+6:12")); (4, ("Pointer_Range", "ada://ordinary_type/The_Stack_Praxis-1:9/Pointer_Range+5:9")); (6, ("Vector", "ada://ordinary_type/The_Stack_Praxis-1:9/Vector+7:9"))]
})
}


