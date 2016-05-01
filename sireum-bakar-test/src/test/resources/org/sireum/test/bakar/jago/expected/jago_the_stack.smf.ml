

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))),
(SeqDecl (3,
(TypeDecl (4, (SubtypeDecl (5, ((*AuditCountType*) 4), Integer, (Range (0, 200)))))),
(SeqDecl (6,
(TypeDecl (7, (RecordTypeDecl (8, ((*AuditInfoType*) 5), [(((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))); (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4)))])))),
(SeqDecl (10,
(TypeDecl (11, (IntegerTypeDecl (12, ((*Pointer_Range*) 8), (Range (0, 100)))))),
(SeqDecl (13,
(TypeDecl (14, (SubtypeDecl (15, ((*Index_Range*) 9), (Integer_Type ((*Pointer_Range*) 8)), (Range (1, 100)))))),
(SeqDecl (16,
(TypeDecl (17, (ArrayTypeDecl (18, ((*Vector*) 10), ((*index subtype mark*) (Subtype ((*Index_Range*) 9))), ((*component type*) Integer))))),
(SeqDecl (19,
(ObjDecl (20, { declaration_astnum = 21; object_name = ((*S*) 11); object_nominal_subtype = (Array_Type ((*Vector*) 10)); initialization_exp = None })),
(SeqDecl (22,
(ObjDecl (23, { declaration_astnum = 24; object_name = ((*Pointer*) 12); object_nominal_subtype = (Integer_Type ((*Pointer_Range*) 8)); initialization_exp = None })),
(SeqDecl (25,
(ObjDecl (26, { declaration_astnum = 27; object_name = ((*AuditInfo*) 13); object_nominal_subtype = (Record_Type ((*AuditInfoType*) 5)); initialization_exp = None })),
(SeqDecl (28,
(ProcBodyDecl (29, 
  mkprocBodyDecl (
   30,
    (* = = = Procedure Name = = = *)
    ((*Push*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 31; parameter_name = ((*X*) 14); parameter_subtype_mark = Integer; parameter_mode = In }],
    (* = = = Object Declarations = = = *)
    [NullDecl],
    (* = = = Procedure Body = = = *)
    (Seq (32,
    (Assign (33, (Identifier (34, ((*Pointer*) 12) )), (BinOp (35, Plus, (Name (36, (Identifier (37, ((*Pointer*) 12) )))), (Literal (38, (Integer_Literal 1) )) )))),
    (Seq (39,
    (Assign (40, (IndexedComponent (41, (Identifier (42, ((*S*) 11) )), (Name (43, (Identifier (44, ((*Pointer*) 12) )))) )), (Name (45, (Identifier (46, ((*X*) 14) )))))),
    (Assign (47, (SelectedComponent (48, (Identifier (49, ((*AuditInfo*) 13) )), ((*PushOps*) 6) )), (BinOp (51, Plus, (Name (52, (SelectedComponent (53, (Identifier (54, ((*AuditInfo*) 13) )), ((*PushOps*) 6) )))), (Literal (56, (Integer_Literal 1) )) ))))))))
  ))
),
(ProcBodyDecl (57, 
  mkprocBodyDecl (
   58,
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 59; parameter_name = ((*X*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [NullDecl],
    (* = = = Procedure Body = = = *)
    (Seq (60,
    (Assign (61, (Identifier (62, ((*X*) 17) )), (Name (63, (IndexedComponent (64, (Identifier (65, ((*S*) 11) )), (Name (66, (Identifier (67, ((*Pointer*) 12) )))) )))))),
    (Seq (68,
    (Assign (69, (Identifier (70, ((*Pointer*) 12) )), (BinOp (71, Minus, (Name (72, (Identifier (73, ((*Pointer*) 12) )))), (Literal (74, (Integer_Literal 1) )) )))),
    (Assign (75, (SelectedComponent (76, (Identifier (77, ((*AuditInfo*) 13) )), ((*PopOps*) 7) )), (BinOp (79, Plus, (Name (80, (SelectedComponent (81, (Identifier (82, ((*AuditInfo*) 13) )), ((*PopOps*) 7) )))), (Literal (84, (Integer_Literal 1) )) ))))))))
  ))
)))))))))))))))))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 14), (In, Integer)); (((*Pointer*) 12), (In_Out, (Integer_Type ((*Pointer_Range*) 8)))); (((*AuditInfo*) 13), (In_Out, (Record_Type ((*AuditInfoType*) 5)))); (((*S*) 11), (In_Out, (Array_Type ((*Vector*) 10)))); (((*X*) 17), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Push*) 1), (0, mkprocBodyDecl (
 30,
  (* = = = Procedure Name = = = *)
  ((*Push*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 31; parameter_name = ((*X*) 14); parameter_subtype_mark = Integer; parameter_mode = In }],
  (* = = = Object Declarations = = = *)
  [NullDecl],
  (* = = = Procedure Body = = = *)
  (Seq (32,
  (Assign (33, (Identifier (34, ((*Pointer*) 12) )), (BinOp (35, Plus, (Name (36, (Identifier (37, ((*Pointer*) 12) )))), (Literal (38, (Integer_Literal 1) )) )))),
  (Seq (39,
  (Assign (40, (IndexedComponent (41, (Identifier (42, ((*S*) 11) )), (Name (43, (Identifier (44, ((*Pointer*) 12) )))) )), (Name (45, (Identifier (46, ((*X*) 14) )))))),
  (Assign (47, (SelectedComponent (48, (Identifier (49, ((*AuditInfo*) 13) )), ((*PushOps*) 6) )), (BinOp (51, Plus, (Name (52, (SelectedComponent (53, (Identifier (54, ((*AuditInfo*) 13) )), ((*PushOps*) 6) )))), (Literal (56, (Integer_Literal 1) )) ))))))))
))); (((*Pop*) 2), (0, mkprocBodyDecl (
 58,
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 59; parameter_name = ((*X*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [NullDecl],
  (* = = = Procedure Body = = = *)
  (Seq (60,
  (Assign (61, (Identifier (62, ((*X*) 17) )), (Name (63, (IndexedComponent (64, (Identifier (65, ((*S*) 11) )), (Name (66, (Identifier (67, ((*Pointer*) 12) )))) )))))),
  (Seq (68,
  (Assign (69, (Identifier (70, ((*Pointer*) 12) )), (BinOp (71, Minus, (Name (72, (Identifier (73, ((*Pointer*) 12) )))), (Literal (74, (Integer_Literal 1) )) )))),
  (Assign (75, (SelectedComponent (76, (Identifier (77, ((*AuditInfo*) 13) )), ((*PopOps*) 7) )), (BinOp (79, Plus, (Name (80, (SelectedComponent (81, (Identifier (82, ((*AuditInfo*) 13) )), ((*PopOps*) 7) )))), (Literal (84, (Integer_Literal 1) )) ))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*AuditInfoType*) 5), (RecordTypeDecl (8, ((*AuditInfoType*) 5), [(((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))); (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4)))]))); (((*Vector*) 10), (ArrayTypeDecl (18, ((*Vector*) 10), ((*index subtype mark*) (Subtype ((*Index_Range*) 9))), ((*component type*) Integer)))); (((*AuditCountType*) 4), (SubtypeDecl (5, ((*AuditCountType*) 4), Integer, (Range (0, 200))))); (((*Index_Range*) 9), (SubtypeDecl (15, ((*Index_Range*) 9), (Integer_Type ((*Pointer_Range*) 8)), (Range (1, 100))))); (((*Pointer_Range*) 8), (IntegerTypeDecl (12, ((*Pointer_Range*) 8), (Range (0, 100)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(83, (Subtype ((*AuditCountType*) 4))); (77, (Record_Type ((*AuditInfoType*) 5))); (41, Integer); (50, (Subtype ((*AuditCountType*) 4))); (44, (Integer_Type ((*Pointer_Range*) 8))); (35, (Integer_Type ((*Pointer_Range*) 8))); (53, (Subtype ((*AuditCountType*) 4))); (62, Integer); (80, (Subtype ((*AuditCountType*) 4))); (71, (Integer_Type ((*Pointer_Range*) 8))); (74, Integer); (38, Integer); (56, Integer); (65, (Array_Type ((*Vector*) 10))); (46, Integer); (82, (Record_Type ((*AuditInfoType*) 5))); (73, (Integer_Type ((*Pointer_Range*) 8))); (55, (Subtype ((*AuditCountType*) 4))); (64, Integer); (67, (Integer_Type ((*Pointer_Range*) 8))); (49, (Record_Type ((*AuditInfoType*) 5))); (76, (Subtype ((*AuditCountType*) 4))); (79, Integer); (70, (Integer_Type ((*Pointer_Range*) 8))); (43, (Integer_Type ((*Pointer_Range*) 8))); (52, (Subtype ((*AuditCountType*) 4))); (34, (Integer_Type ((*Pointer_Range*) 8))); (37, (Integer_Type ((*Pointer_Range*) 8))); (78, (Subtype ((*AuditCountType*) 4))); (45, Integer); (54, (Record_Type ((*AuditInfoType*) 5))); (63, Integer); (81, (Subtype ((*AuditCountType*) 4))); (72, (Integer_Type ((*Pointer_Range*) 8))); (36, (Integer_Type ((*Pointer_Range*) 8))); (84, Integer); (48, (Subtype ((*AuditCountType*) 4))); (66, (Integer_Type ((*Pointer_Range*) 8))); (42, (Array_Type ((*Vector*) 10))); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(83, { line = (*Line*)37; col = (*Col*)37; endline = (*EndLine*)37; endcol = (*EndCol*)42 }); (77, { line = (*Line*)37; col = (*Col*)7; endline = (*EndLine*)37; endcol = (*EndCol*)15 }); (41, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)16 }); (50, { line = (*Line*)29; col = (*Col*)17; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (44, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)15 }); (35, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)28 }); (53, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)44 }); (62, { line = (*Line*)35; col = (*Col*)7; endline = (*EndLine*)35; endcol = (*EndCol*)7 }); (80, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)42 }); (71, { line = (*Line*)36; col = (*Col*)18; endline = (*EndLine*)36; endcol = (*EndCol*)28 }); (74, { line = (*Line*)36; col = (*Col*)28; endline = (*EndLine*)36; endcol = (*EndCol*)28 }); (38, { line = (*Line*)27; col = (*Col*)28; endline = (*EndLine*)27; endcol = (*EndCol*)28 }); (56, { line = (*Line*)29; col = (*Col*)48; endline = (*EndLine*)29; endcol = (*EndCol*)48 }); (65, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)12 }); (46, { line = (*Line*)28; col = (*Col*)21; endline = (*EndLine*)28; endcol = (*EndCol*)21 }); (82, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)35 }); (73, { line = (*Line*)36; col = (*Col*)18; endline = (*EndLine*)36; endcol = (*EndCol*)24 }); (55, { line = (*Line*)29; col = (*Col*)38; endline = (*EndLine*)29; endcol = (*EndCol*)44 }); (64, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)21 }); (67, { line = (*Line*)35; col = (*Col*)14; endline = (*EndLine*)35; endcol = (*EndCol*)20 }); (49, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (76, { line = (*Line*)37; col = (*Col*)7; endline = (*EndLine*)37; endcol = (*EndCol*)22 }); (79, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)46 }); (70, { line = (*Line*)36; col = (*Col*)7; endline = (*EndLine*)36; endcol = (*EndCol*)13 }); (43, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)15 }); (52, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)44 }); (34, { line = (*Line*)27; col = (*Col*)7; endline = (*EndLine*)27; endcol = (*EndCol*)13 }); (37, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)24 }); (78, { line = (*Line*)37; col = (*Col*)17; endline = (*EndLine*)37; endcol = (*EndCol*)22 }); (45, { line = (*Line*)28; col = (*Col*)21; endline = (*EndLine*)28; endcol = (*EndCol*)21 }); (54, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)36 }); (63, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)21 }); (81, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)42 }); (72, { line = (*Line*)36; col = (*Col*)18; endline = (*EndLine*)36; endcol = (*EndCol*)24 }); (36, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)24 }); (84, { line = (*Line*)37; col = (*Col*)46; endline = (*EndLine*)37; endcol = (*EndCol*)46 }); (48, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (66, { line = (*Line*)35; col = (*Col*)14; endline = (*EndLine*)35; endcol = (*EndCol*)20 }); (42, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (51, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)48 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("X", "ada://parameter/The_Stack-1:9/Pop-5:14/X-5:18")); (11, ("S", "ada://variable/The_Stack-1:9/S+19:4")); (14, ("X", "ada://parameter/The_Stack-1:9/Push-3:14/X-3:19")); (13, ("AuditInfo", "ada://variable/The_Stack-1:9/AuditInfo+22:4")); (7, ("PopOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PopOps+13:7")); (12, ("Pointer", "ada://variable/The_Stack-1:9/Pointer+20:4")); (6, ("PushOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PushOps+12:7"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Pop", "ada://procedure_body/The_Stack-1:9/Pop-5:14")); (1, ("Push", "ada://procedure_body/The_Stack-1:9/Push-3:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("The_Stack", "ada://package_body/The_Stack-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(8, ("Pointer_Range", "ada://ordinary_type/The_Stack-1:9/Pointer_Range+16:9")); (5, ("AuditInfoType", "ada://ordinary_type/The_Stack-1:9/AuditInfoType+11:9")); (4, ("AuditCountType", "ada://subtype/The_Stack-1:9/AuditCountType+6:12")); (10, ("Vector", "ada://ordinary_type/The_Stack-1:9/Vector+18:9")); (9, ("Index_Range", "ada://subtype/The_Stack-1:9/Index_Range+17:12"))]
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
(TypeDeclRT (4, (SubtypeDeclRT (5, ((*AuditCountType*) 4), Integer, (RangeRT (0, 200)))))),
(SeqDeclRT (6,
(TypeDeclRT (7, (RecordTypeDeclRT (8, ((*AuditInfoType*) 5), [(((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))); (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4)))])))),
(SeqDeclRT (10,
(TypeDeclRT (11, (IntegerTypeDeclRT (12, ((*Pointer_Range*) 8), (RangeRT (0, 100)))))),
(SeqDeclRT (13,
(TypeDeclRT (14, (SubtypeDeclRT (15, ((*Index_Range*) 9), (Integer_Type ((*Pointer_Range*) 8)), (RangeRT (1, 100)))))),
(SeqDeclRT (16,
(TypeDeclRT (17, (ArrayTypeDeclRT (18, ((*Vector*) 10), ((*index subtype mark*) (Subtype ((*Index_Range*) 9))), ((*component type*) Integer))))),
(SeqDeclRT (19,
(ObjDeclRT (20, { declaration_astnumRT = 21; object_nameRT = ((*S*) 11); object_nominal_subtypeRT = (Array_Type ((*Vector*) 10)); initialization_expRT = None })),
(SeqDeclRT (22,
(ObjDeclRT (23, { declaration_astnumRT = 24; object_nameRT = ((*Pointer*) 12); object_nominal_subtypeRT = (Integer_Type ((*Pointer_Range*) 8)); initialization_expRT = None })),
(SeqDeclRT (25,
(ObjDeclRT (26, { declaration_astnumRT = 27; object_nameRT = ((*AuditInfo*) 13); object_nominal_subtypeRT = (Record_Type ((*AuditInfoType*) 5)); initialization_expRT = None })),
(SeqDeclRT (28,
(ProcBodyDeclRT (29, 
  mkprocBodyDeclRT (
   30,
    (* = = = Procedure Name = = = *)
    ((*Push*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 31; parameter_nameRT = ((*X*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
    (* = = = Object Declarations = = = *)
    [NullDeclRT],
    (* = = = Procedure Body = = = *)
    (SeqRT (32,
    (AssignRT (33, (IdentifierRT (34, ((*Pointer*) 12) , [])), (BinOpRT (35, Plus, (NameRT (36, (IdentifierRT (37, ((*Pointer*) 12) , [])))), (LiteralRT (38, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
    (SeqRT (39,
    (AssignRT (40, (IndexedComponentRT (41, (IdentifierRT (42, ((*S*) 11) , [])), (NameRT (43, (IdentifierRT (44, ((*Pointer*) 12) , [RangeCheck])))) , [])), (NameRT (45, (IdentifierRT (46, ((*X*) 14) , [])))))),
    (AssignRT (47, (SelectedComponentRT (48, (IdentifierRT (49, ((*AuditInfo*) 13) , [])), ((*PushOps*) 6) , [])), (BinOpRT (51, Plus, (NameRT (52, (SelectedComponentRT (53, (IdentifierRT (54, ((*AuditInfo*) 13) , [])), ((*PushOps*) 6) , [])))), (LiteralRT (56, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))))))
  ))
),
(ProcBodyDeclRT (57, 
  mkprocBodyDeclRT (
   58,
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 59; parameter_nameRT = ((*X*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [NullDeclRT],
    (* = = = Procedure Body = = = *)
    (SeqRT (60,
    (AssignRT (61, (IdentifierRT (62, ((*X*) 17) , [])), (NameRT (63, (IndexedComponentRT (64, (IdentifierRT (65, ((*S*) 11) , [])), (NameRT (66, (IdentifierRT (67, ((*Pointer*) 12) , [RangeCheck])))) , [])))))),
    (SeqRT (68,
    (AssignRT (69, (IdentifierRT (70, ((*Pointer*) 12) , [])), (BinOpRT (71, Minus, (NameRT (72, (IdentifierRT (73, ((*Pointer*) 12) , [])))), (LiteralRT (74, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
    (AssignRT (75, (SelectedComponentRT (76, (IdentifierRT (77, ((*AuditInfo*) 13) , [])), ((*PopOps*) 7) , [])), (BinOpRT (79, Plus, (NameRT (80, (SelectedComponentRT (81, (IdentifierRT (82, ((*AuditInfo*) 13) , [])), ((*PopOps*) 7) , [])))), (LiteralRT (84, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))))))
  ))
)))))))))))))))))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 14), (In, Integer)); (((*Pointer*) 12), (In_Out, (Integer_Type ((*Pointer_Range*) 8)))); (((*AuditInfo*) 13), (In_Out, (Record_Type ((*AuditInfoType*) 5)))); (((*S*) 11), (In_Out, (Array_Type ((*Vector*) 10)))); (((*X*) 17), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Push*) 1), (0, mkprocBodyDeclRT (
 30,
  (* = = = Procedure Name = = = *)
  ((*Push*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 31; parameter_nameRT = ((*X*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = In }],
  (* = = = Object Declarations = = = *)
  [NullDeclRT],
  (* = = = Procedure Body = = = *)
  (SeqRT (32,
  (AssignRT (33, (IdentifierRT (34, ((*Pointer*) 12) , [])), (BinOpRT (35, Plus, (NameRT (36, (IdentifierRT (37, ((*Pointer*) 12) , [])))), (LiteralRT (38, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
  (SeqRT (39,
  (AssignRT (40, (IndexedComponentRT (41, (IdentifierRT (42, ((*S*) 11) , [])), (NameRT (43, (IdentifierRT (44, ((*Pointer*) 12) , [RangeCheck])))) , [])), (NameRT (45, (IdentifierRT (46, ((*X*) 14) , [])))))),
  (AssignRT (47, (SelectedComponentRT (48, (IdentifierRT (49, ((*AuditInfo*) 13) , [])), ((*PushOps*) 6) , [])), (BinOpRT (51, Plus, (NameRT (52, (SelectedComponentRT (53, (IdentifierRT (54, ((*AuditInfo*) 13) , [])), ((*PushOps*) 6) , [])))), (LiteralRT (56, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))))))
))); (((*Pop*) 2), (0, mkprocBodyDeclRT (
 58,
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 59; parameter_nameRT = ((*X*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [NullDeclRT],
  (* = = = Procedure Body = = = *)
  (SeqRT (60,
  (AssignRT (61, (IdentifierRT (62, ((*X*) 17) , [])), (NameRT (63, (IndexedComponentRT (64, (IdentifierRT (65, ((*S*) 11) , [])), (NameRT (66, (IdentifierRT (67, ((*Pointer*) 12) , [RangeCheck])))) , [])))))),
  (SeqRT (68,
  (AssignRT (69, (IdentifierRT (70, ((*Pointer*) 12) , [])), (BinOpRT (71, Minus, (NameRT (72, (IdentifierRT (73, ((*Pointer*) 12) , [])))), (LiteralRT (74, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
  (AssignRT (75, (SelectedComponentRT (76, (IdentifierRT (77, ((*AuditInfo*) 13) , [])), ((*PopOps*) 7) , [])), (BinOpRT (79, Plus, (NameRT (80, (SelectedComponentRT (81, (IdentifierRT (82, ((*AuditInfo*) 13) , [])), ((*PopOps*) 7) , [])))), (LiteralRT (84, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*AuditInfoType*) 5), (RecordTypeDeclRT (8, ((*AuditInfoType*) 5), [(((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))); (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4)))]))); (((*Vector*) 10), (ArrayTypeDeclRT (18, ((*Vector*) 10), ((*index subtype mark*) (Subtype ((*Index_Range*) 9))), ((*component type*) Integer)))); (((*AuditCountType*) 4), (SubtypeDeclRT (5, ((*AuditCountType*) 4), Integer, (RangeRT (0, 200))))); (((*Index_Range*) 9), (SubtypeDeclRT (15, ((*Index_Range*) 9), (Integer_Type ((*Pointer_Range*) 8)), (RangeRT (1, 100))))); (((*Pointer_Range*) 8), (IntegerTypeDeclRT (12, ((*Pointer_Range*) 8), (RangeRT (0, 100)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(83, (Subtype ((*AuditCountType*) 4))); (77, (Record_Type ((*AuditInfoType*) 5))); (41, Integer); (50, (Subtype ((*AuditCountType*) 4))); (44, (Integer_Type ((*Pointer_Range*) 8))); (35, (Integer_Type ((*Pointer_Range*) 8))); (53, (Subtype ((*AuditCountType*) 4))); (62, Integer); (80, (Subtype ((*AuditCountType*) 4))); (71, (Integer_Type ((*Pointer_Range*) 8))); (74, Integer); (38, Integer); (56, Integer); (65, (Array_Type ((*Vector*) 10))); (46, Integer); (82, (Record_Type ((*AuditInfoType*) 5))); (73, (Integer_Type ((*Pointer_Range*) 8))); (55, (Subtype ((*AuditCountType*) 4))); (64, Integer); (67, (Integer_Type ((*Pointer_Range*) 8))); (49, (Record_Type ((*AuditInfoType*) 5))); (76, (Subtype ((*AuditCountType*) 4))); (79, Integer); (70, (Integer_Type ((*Pointer_Range*) 8))); (43, (Integer_Type ((*Pointer_Range*) 8))); (52, (Subtype ((*AuditCountType*) 4))); (34, (Integer_Type ((*Pointer_Range*) 8))); (37, (Integer_Type ((*Pointer_Range*) 8))); (78, (Subtype ((*AuditCountType*) 4))); (45, Integer); (54, (Record_Type ((*AuditInfoType*) 5))); (63, Integer); (81, (Subtype ((*AuditCountType*) 4))); (72, (Integer_Type ((*Pointer_Range*) 8))); (36, (Integer_Type ((*Pointer_Range*) 8))); (84, Integer); (48, (Subtype ((*AuditCountType*) 4))); (66, (Integer_Type ((*Pointer_Range*) 8))); (42, (Array_Type ((*Vector*) 10))); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(83, { line = (*Line*)37; col = (*Col*)37; endline = (*EndLine*)37; endcol = (*EndCol*)42 }); (77, { line = (*Line*)37; col = (*Col*)7; endline = (*EndLine*)37; endcol = (*EndCol*)15 }); (41, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)16 }); (50, { line = (*Line*)29; col = (*Col*)17; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (44, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)15 }); (35, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)28 }); (53, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)44 }); (62, { line = (*Line*)35; col = (*Col*)7; endline = (*EndLine*)35; endcol = (*EndCol*)7 }); (80, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)42 }); (71, { line = (*Line*)36; col = (*Col*)18; endline = (*EndLine*)36; endcol = (*EndCol*)28 }); (74, { line = (*Line*)36; col = (*Col*)28; endline = (*EndLine*)36; endcol = (*EndCol*)28 }); (38, { line = (*Line*)27; col = (*Col*)28; endline = (*EndLine*)27; endcol = (*EndCol*)28 }); (56, { line = (*Line*)29; col = (*Col*)48; endline = (*EndLine*)29; endcol = (*EndCol*)48 }); (65, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)12 }); (46, { line = (*Line*)28; col = (*Col*)21; endline = (*EndLine*)28; endcol = (*EndCol*)21 }); (82, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)35 }); (73, { line = (*Line*)36; col = (*Col*)18; endline = (*EndLine*)36; endcol = (*EndCol*)24 }); (55, { line = (*Line*)29; col = (*Col*)38; endline = (*EndLine*)29; endcol = (*EndCol*)44 }); (64, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)21 }); (67, { line = (*Line*)35; col = (*Col*)14; endline = (*EndLine*)35; endcol = (*EndCol*)20 }); (49, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (76, { line = (*Line*)37; col = (*Col*)7; endline = (*EndLine*)37; endcol = (*EndCol*)22 }); (79, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)46 }); (70, { line = (*Line*)36; col = (*Col*)7; endline = (*EndLine*)36; endcol = (*EndCol*)13 }); (43, { line = (*Line*)28; col = (*Col*)9; endline = (*EndLine*)28; endcol = (*EndCol*)15 }); (52, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)44 }); (34, { line = (*Line*)27; col = (*Col*)7; endline = (*EndLine*)27; endcol = (*EndCol*)13 }); (37, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)24 }); (78, { line = (*Line*)37; col = (*Col*)17; endline = (*EndLine*)37; endcol = (*EndCol*)22 }); (45, { line = (*Line*)28; col = (*Col*)21; endline = (*EndLine*)28; endcol = (*EndCol*)21 }); (54, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)36 }); (63, { line = (*Line*)35; col = (*Col*)12; endline = (*EndLine*)35; endcol = (*EndCol*)21 }); (81, { line = (*Line*)37; col = (*Col*)27; endline = (*EndLine*)37; endcol = (*EndCol*)42 }); (72, { line = (*Line*)36; col = (*Col*)18; endline = (*EndLine*)36; endcol = (*EndCol*)24 }); (36, { line = (*Line*)27; col = (*Col*)18; endline = (*EndLine*)27; endcol = (*EndCol*)24 }); (84, { line = (*Line*)37; col = (*Col*)46; endline = (*EndLine*)37; endcol = (*EndCol*)46 }); (48, { line = (*Line*)29; col = (*Col*)7; endline = (*EndLine*)29; endcol = (*EndCol*)23 }); (66, { line = (*Line*)35; col = (*Col*)14; endline = (*EndLine*)35; endcol = (*EndCol*)20 }); (42, { line = (*Line*)28; col = (*Col*)7; endline = (*EndLine*)28; endcol = (*EndCol*)7 }); (51, { line = (*Line*)29; col = (*Col*)28; endline = (*EndLine*)29; endcol = (*EndCol*)48 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("X", "ada://parameter/The_Stack-1:9/Pop-5:14/X-5:18")); (11, ("S", "ada://variable/The_Stack-1:9/S+19:4")); (14, ("X", "ada://parameter/The_Stack-1:9/Push-3:14/X-3:19")); (13, ("AuditInfo", "ada://variable/The_Stack-1:9/AuditInfo+22:4")); (7, ("PopOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PopOps+13:7")); (12, ("Pointer", "ada://variable/The_Stack-1:9/Pointer+20:4")); (6, ("PushOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PushOps+12:7"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Pop", "ada://procedure_body/The_Stack-1:9/Pop-5:14")); (1, ("Push", "ada://procedure_body/The_Stack-1:9/Push-3:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(3, ("The_Stack", "ada://package_body/The_Stack-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(8, ("Pointer_Range", "ada://ordinary_type/The_Stack-1:9/Pointer_Range+16:9")); (5, ("AuditInfoType", "ada://ordinary_type/The_Stack-1:9/AuditInfoType+11:9")); (4, ("AuditCountType", "ada://subtype/The_Stack-1:9/AuditCountType+6:12")); (10, ("Vector", "ada://ordinary_type/The_Stack-1:9/Vector+18:9")); (9, ("Index_Range", "ada://subtype/The_Stack-1:9/Index_Range+17:12"))]
})
}


