

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (RecordTypeDecl (4, ((*Object*) 1), [(((*X*) 2), Integer); (((*Y*) 3), Integer)])))),
(SeqDecl (6,
(TypeDecl (7, (RecordTypeDecl (8, ((*NestedObject*) 4), [(((*O*) 5), (Record_Type ((*Object*) 1)))])))),
(SeqDecl (10,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (11,
(ObjDecl (12, { declaration_astnum = 13; object_name = ((*aNestedObject*) 7); object_nominal_subtype = (Record_Type ((*NestedObject*) 4)); initialization_exp = None })),
(ObjDecl (14, { declaration_astnum = 15; object_name = ((*anObject*) 8); object_nominal_subtype = (Record_Type ((*Object*) 1)); initialization_exp = None })))))))))),
(SeqDecl (16,
(ProcBodyDecl (17, 
  mkprocBodyDecl (
   18,
    (* = = = Procedure Name = = = *)
    ((*Test01*) 6),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 19; parameter_name = ((*Q*) 10); parameter_subtype_mark = (Record_Type ((*Object*) 1)); parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (20, { declaration_astnum = 21; object_name = ((*T*) 11); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (22,
    (Assign (23, (Identifier (24, ((*T*) 11) )), (Name (25, (SelectedComponent (26, (Identifier (27, ((*Q*) 10) )), ((*X*) 2) )))))),
    (Seq (29,
    (Assign (30, (SelectedComponent (31, (Identifier (32, ((*Q*) 10) )), ((*X*) 2) )), (Name (34, (SelectedComponent (35, (Identifier (36, ((*Q*) 10) )), ((*Y*) 3) )))))),
    (Assign (38, (SelectedComponent (39, (Identifier (40, ((*Q*) 10) )), ((*Y*) 3) )), (Name (42, (Identifier (43, ((*T*) 11) ))))))))))
  ))
),
(ProcBodyDecl (44, 
  mkprocBodyDecl (
   45,
    (* = = = Procedure Name = = = *)
    ((*Test02*) 13),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 46; parameter_name = ((*I1*) 14); parameter_subtype_mark = Integer; parameter_mode = In } :: { parameter_astnum = 47; parameter_name = ((*I2*) 15); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 48; parameter_name = ((*O1*) 16); parameter_subtype_mark = Integer; parameter_mode = Out } :: { parameter_astnum = 49; parameter_name = ((*O2*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (50, { declaration_astnum = 51; object_name = ((*Q*) 18); object_nominal_subtype = (Record_Type ((*NestedObject*) 4)); initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (52,
    (Assign (53, (SelectedComponent (54, (SelectedComponent (55, (Identifier (56, ((*Q*) 18) )), ((*O*) 5) )), ((*X*) 2) )), (Name (59, (Identifier (60, ((*I1*) 14) )))))),
    (Seq (61,
    (Assign (62, (SelectedComponent (63, (SelectedComponent (64, (Identifier (65, ((*Q*) 18) )), ((*O*) 5) )), ((*Y*) 3) )), (Name (68, (Identifier (69, ((*I2*) 15) )))))),
    (Seq (70,
    (Assign (71, (Identifier (72, ((*O1*) 16) )), (Name (73, (SelectedComponent (74, (SelectedComponent (75, (Identifier (76, ((*Q*) 18) )), ((*O*) 5) )), ((*X*) 2) )))))),
    (Assign (79, (Identifier (80, ((*O2*) 17) )), (Name (81, (SelectedComponent (82, (SelectedComponent (83, (Identifier (84, ((*Q*) 18) )), ((*O*) 5) )), ((*Y*) 3) ))))))))))))
  ))
)))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I2*) 15), (In, Integer)); (((*T*) 11), (In_Out, Integer)); (((*anObject*) 8), (In_Out, (Record_Type ((*Object*) 1)))); (((*Q*) 10), (In_Out, (Record_Type ((*Object*) 1)))); (((*Q*) 18), (In_Out, (Record_Type ((*NestedObject*) 4)))); (((*O1*) 16), (Out, Integer)); (((*I1*) 14), (In, Integer)); (((*O2*) 17), (Out, Integer)); (((*aNestedObject*) 7), (In_Out, (Record_Type ((*NestedObject*) 4))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test01*) 6), (0, mkprocBodyDecl (
 18,
  (* = = = Procedure Name = = = *)
  ((*Test01*) 6),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 19; parameter_name = ((*Q*) 10); parameter_subtype_mark = (Record_Type ((*Object*) 1)); parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (20, { declaration_astnum = 21; object_name = ((*T*) 11); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (22,
  (Assign (23, (Identifier (24, ((*T*) 11) )), (Name (25, (SelectedComponent (26, (Identifier (27, ((*Q*) 10) )), ((*X*) 2) )))))),
  (Seq (29,
  (Assign (30, (SelectedComponent (31, (Identifier (32, ((*Q*) 10) )), ((*X*) 2) )), (Name (34, (SelectedComponent (35, (Identifier (36, ((*Q*) 10) )), ((*Y*) 3) )))))),
  (Assign (38, (SelectedComponent (39, (Identifier (40, ((*Q*) 10) )), ((*Y*) 3) )), (Name (42, (Identifier (43, ((*T*) 11) ))))))))))
))); (((*Test02*) 13), (0, mkprocBodyDecl (
 45,
  (* = = = Procedure Name = = = *)
  ((*Test02*) 13),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 46; parameter_name = ((*I1*) 14); parameter_subtype_mark = Integer; parameter_mode = In } :: { parameter_astnum = 47; parameter_name = ((*I2*) 15); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 48; parameter_name = ((*O1*) 16); parameter_subtype_mark = Integer; parameter_mode = Out } :: { parameter_astnum = 49; parameter_name = ((*O2*) 17); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (50, { declaration_astnum = 51; object_name = ((*Q*) 18); object_nominal_subtype = (Record_Type ((*NestedObject*) 4)); initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (52,
  (Assign (53, (SelectedComponent (54, (SelectedComponent (55, (Identifier (56, ((*Q*) 18) )), ((*O*) 5) )), ((*X*) 2) )), (Name (59, (Identifier (60, ((*I1*) 14) )))))),
  (Seq (61,
  (Assign (62, (SelectedComponent (63, (SelectedComponent (64, (Identifier (65, ((*Q*) 18) )), ((*O*) 5) )), ((*Y*) 3) )), (Name (68, (Identifier (69, ((*I2*) 15) )))))),
  (Seq (70,
  (Assign (71, (Identifier (72, ((*O1*) 16) )), (Name (73, (SelectedComponent (74, (SelectedComponent (75, (Identifier (76, ((*Q*) 18) )), ((*O*) 5) )), ((*X*) 2) )))))),
  (Assign (79, (Identifier (80, ((*O2*) 17) )), (Name (81, (SelectedComponent (82, (SelectedComponent (83, (Identifier (84, ((*Q*) 18) )), ((*O*) 5) )), ((*Y*) 3) ))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*NestedObject*) 4), (RecordTypeDecl (8, ((*NestedObject*) 4), [(((*O*) 5), (Record_Type ((*Object*) 1)))]))); (((*Object*) 1), (RecordTypeDecl (4, ((*Object*) 1), [(((*X*) 2), Integer); (((*Y*) 3), Integer)])))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(83, (Record_Type ((*Object*) 1))); (86, Integer); (77, (Record_Type ((*Object*) 1))); (68, Integer); (32, (Record_Type ((*Object*) 1))); (41, Integer); (59, Integer); (35, Integer); (80, Integer); (26, Integer); (74, Integer); (56, (Record_Type ((*NestedObject*) 4))); (65, (Record_Type ((*NestedObject*) 4))); (82, Integer); (73, Integer); (64, (Record_Type ((*Object*) 1))); (55, (Record_Type ((*Object*) 1))); (85, (Record_Type ((*Object*) 1))); (67, Integer); (40, (Record_Type ((*Object*) 1))); (58, Integer); (76, (Record_Type ((*NestedObject*) 4))); (31, Integer); (43, Integer); (34, Integer); (25, Integer); (37, Integer); (28, Integer); (60, Integer); (78, Integer); (69, Integer); (54, Integer); (63, Integer); (81, Integer); (72, Integer); (36, (Record_Type ((*Object*) 1))); (27, (Record_Type ((*Object*) 1))); (84, (Record_Type ((*NestedObject*) 4))); (57, (Record_Type ((*Object*) 1))); (75, (Record_Type ((*Object*) 1))); (39, Integer); (66, (Record_Type ((*Object*) 1))); (42, Integer); (33, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(83, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)13 }); (86, { line = (*Line*)22; col = (*Col*)15; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (77, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)13 }); (68, { line = (*Line*)20; col = (*Col*)14; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (32, { line = (*Line*)9; col = (*Col*)5; endline = (*EndLine*)9; endcol = (*EndCol*)5 }); (41, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (59, { line = (*Line*)19; col = (*Col*)14; endline = (*EndLine*)19; endcol = (*EndCol*)15 }); (35, { line = (*Line*)9; col = (*Col*)12; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (80, { line = (*Line*)22; col = (*Col*)5; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (26, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (74, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (56, { line = (*Line*)19; col = (*Col*)5; endline = (*EndLine*)19; endcol = (*EndCol*)5 }); (65, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)5 }); (82, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (73, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (64, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (55, { line = (*Line*)19; col = (*Col*)5; endline = (*EndLine*)19; endcol = (*EndCol*)7 }); (85, { line = (*Line*)22; col = (*Col*)13; endline = (*EndLine*)22; endcol = (*EndCol*)13 }); (67, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)9 }); (40, { line = (*Line*)10; col = (*Col*)5; endline = (*EndLine*)10; endcol = (*EndCol*)5 }); (58, { line = (*Line*)19; col = (*Col*)9; endline = (*EndLine*)19; endcol = (*EndCol*)9 }); (76, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)11 }); (31, { line = (*Line*)9; col = (*Col*)5; endline = (*EndLine*)9; endcol = (*EndCol*)7 }); (43, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (34, { line = (*Line*)9; col = (*Col*)12; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (25, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (37, { line = (*Line*)9; col = (*Col*)14; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (28, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (60, { line = (*Line*)19; col = (*Col*)14; endline = (*EndLine*)19; endcol = (*EndCol*)15 }); (78, { line = (*Line*)21; col = (*Col*)15; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (69, { line = (*Line*)20; col = (*Col*)14; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (54, { line = (*Line*)19; col = (*Col*)5; endline = (*EndLine*)19; endcol = (*EndCol*)9 }); (63, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)9 }); (81, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (72, { line = (*Line*)21; col = (*Col*)5; endline = (*EndLine*)21; endcol = (*EndCol*)6 }); (36, { line = (*Line*)9; col = (*Col*)12; endline = (*EndLine*)9; endcol = (*EndCol*)12 }); (27, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)10 }); (84, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)11 }); (57, { line = (*Line*)19; col = (*Col*)7; endline = (*EndLine*)19; endcol = (*EndCol*)7 }); (75, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)13 }); (39, { line = (*Line*)10; col = (*Col*)5; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (66, { line = (*Line*)20; col = (*Col*)7; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (42, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (33, { line = (*Line*)9; col = (*Col*)7; endline = (*EndLine*)9; endcol = (*EndCol*)7 }); (24, { line = (*Line*)8; col = (*Col*)5; endline = (*EndLine*)8; endcol = (*EndCol*)5 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("O2", "ada://parameter/RecordTest01-1:9/Test02+13:13/O2+13:45")); (8, ("anObject", "ada://variable/RecordTest01-1:9/anObject-21:3")); (11, ("T", "ada://variable/RecordTest01-1:9/Test01-16:13/T+6:5")); (2, ("X", "ada://component/RecordTest01-1:9/Object-6:8/X-8:5")); (14, ("I1", "ada://parameter/RecordTest01-1:9/Test02+13:13/I1+13:20")); (5, ("O", "ada://component/RecordTest01-1:9/NestedObject-11:8/O-13:5")); (16, ("O1", "ada://parameter/RecordTest01-1:9/Test02+13:13/O1+13:41")); (7, ("aNestedObject", "ada://variable/RecordTest01-1:9/aNestedObject-19:3")); (10, ("Q", "ada://parameter/RecordTest01-1:9/Test01-16:13/Q-16:20")); (18, ("Q", "ada://variable/RecordTest01-1:9/Test02+13:13/Q+17:5")); (3, ("Y", "ada://component/RecordTest01-1:9/Object-6:8/Y-8:8")); (15, ("I2", "ada://parameter/RecordTest01-1:9/Test02+13:13/I2+13:24"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(13, ("Test02", "ada://procedure_body/RecordTest01-1:9/Test02+13:13")); (6, ("Test01", "ada://procedure_body/RecordTest01-1:9/Test01-16:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(9, ("RecordTest01", "ada://package_body/RecordTest01-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("NestedObject", "ada://ordinary_type/RecordTest01-1:9/NestedObject-11:8")); (1, ("Object", "ada://ordinary_type/RecordTest01-1:9/Object-6:8"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (RecordTypeDeclRT (4, ((*Object*) 1), [(((*X*) 2), Integer); (((*Y*) 3), Integer)])))),
(SeqDeclRT (6,
(TypeDeclRT (7, (RecordTypeDeclRT (8, ((*NestedObject*) 4), [(((*O*) 5), (Record_Type ((*Object*) 1)))])))),
(SeqDeclRT (10,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (11,
(ObjDeclRT (12, { declaration_astnumRT = 13; object_nameRT = ((*aNestedObject*) 7); object_nominal_subtypeRT = (Record_Type ((*NestedObject*) 4)); initialization_expRT = None })),
(ObjDeclRT (14, { declaration_astnumRT = 15; object_nameRT = ((*anObject*) 8); object_nominal_subtypeRT = (Record_Type ((*Object*) 1)); initialization_expRT = None })))))))))),
(SeqDeclRT (16,
(ProcBodyDeclRT (17, 
  mkprocBodyDeclRT (
   18,
    (* = = = Procedure Name = = = *)
    ((*Test01*) 6),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 19; parameter_nameRT = ((*Q*) 10); parameter_subtype_markRT = (Record_Type ((*Object*) 1)); parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (20, { declaration_astnumRT = 21; object_nameRT = ((*T*) 11); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (22,
    (AssignRT (23, (IdentifierRT (24, ((*T*) 11) , [])), (NameRT (25, (SelectedComponentRT (26, (IdentifierRT (27, ((*Q*) 10) , [])), ((*X*) 2) , [])))))),
    (SeqRT (29,
    (AssignRT (30, (SelectedComponentRT (31, (IdentifierRT (32, ((*Q*) 10) , [])), ((*X*) 2) , [])), (NameRT (34, (SelectedComponentRT (35, (IdentifierRT (36, ((*Q*) 10) , [])), ((*Y*) 3) , [])))))),
    (AssignRT (38, (SelectedComponentRT (39, (IdentifierRT (40, ((*Q*) 10) , [])), ((*Y*) 3) , [])), (NameRT (42, (IdentifierRT (43, ((*T*) 11) , []))))))))))
  ))
),
(ProcBodyDeclRT (44, 
  mkprocBodyDeclRT (
   45,
    (* = = = Procedure Name = = = *)
    ((*Test02*) 13),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 46; parameter_nameRT = ((*I1*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = In } :: { parameter_astnumRT = 47; parameter_nameRT = ((*I2*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 48; parameter_nameRT = ((*O1*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = Out } :: { parameter_astnumRT = 49; parameter_nameRT = ((*O2*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (50, { declaration_astnumRT = 51; object_nameRT = ((*Q*) 18); object_nominal_subtypeRT = (Record_Type ((*NestedObject*) 4)); initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (52,
    (AssignRT (53, (SelectedComponentRT (54, (SelectedComponentRT (55, (IdentifierRT (56, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*X*) 2) , [])), (NameRT (59, (IdentifierRT (60, ((*I1*) 14) , [])))))),
    (SeqRT (61,
    (AssignRT (62, (SelectedComponentRT (63, (SelectedComponentRT (64, (IdentifierRT (65, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*Y*) 3) , [])), (NameRT (68, (IdentifierRT (69, ((*I2*) 15) , [])))))),
    (SeqRT (70,
    (AssignRT (71, (IdentifierRT (72, ((*O1*) 16) , [])), (NameRT (73, (SelectedComponentRT (74, (SelectedComponentRT (75, (IdentifierRT (76, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*X*) 2) , [])))))),
    (AssignRT (79, (IdentifierRT (80, ((*O2*) 17) , [])), (NameRT (81, (SelectedComponentRT (82, (SelectedComponentRT (83, (IdentifierRT (84, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*Y*) 3) , []))))))))))))
  ))
)))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I2*) 15), (In, Integer)); (((*T*) 11), (In_Out, Integer)); (((*anObject*) 8), (In_Out, (Record_Type ((*Object*) 1)))); (((*Q*) 10), (In_Out, (Record_Type ((*Object*) 1)))); (((*Q*) 18), (In_Out, (Record_Type ((*NestedObject*) 4)))); (((*O1*) 16), (Out, Integer)); (((*I1*) 14), (In, Integer)); (((*O2*) 17), (Out, Integer)); (((*aNestedObject*) 7), (In_Out, (Record_Type ((*NestedObject*) 4))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test01*) 6), (0, mkprocBodyDeclRT (
 18,
  (* = = = Procedure Name = = = *)
  ((*Test01*) 6),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 19; parameter_nameRT = ((*Q*) 10); parameter_subtype_markRT = (Record_Type ((*Object*) 1)); parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (20, { declaration_astnumRT = 21; object_nameRT = ((*T*) 11); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (22,
  (AssignRT (23, (IdentifierRT (24, ((*T*) 11) , [])), (NameRT (25, (SelectedComponentRT (26, (IdentifierRT (27, ((*Q*) 10) , [])), ((*X*) 2) , [])))))),
  (SeqRT (29,
  (AssignRT (30, (SelectedComponentRT (31, (IdentifierRT (32, ((*Q*) 10) , [])), ((*X*) 2) , [])), (NameRT (34, (SelectedComponentRT (35, (IdentifierRT (36, ((*Q*) 10) , [])), ((*Y*) 3) , [])))))),
  (AssignRT (38, (SelectedComponentRT (39, (IdentifierRT (40, ((*Q*) 10) , [])), ((*Y*) 3) , [])), (NameRT (42, (IdentifierRT (43, ((*T*) 11) , []))))))))))
))); (((*Test02*) 13), (0, mkprocBodyDeclRT (
 45,
  (* = = = Procedure Name = = = *)
  ((*Test02*) 13),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 46; parameter_nameRT = ((*I1*) 14); parameter_subtype_markRT = Integer; parameter_modeRT = In } :: { parameter_astnumRT = 47; parameter_nameRT = ((*I2*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 48; parameter_nameRT = ((*O1*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = Out } :: { parameter_astnumRT = 49; parameter_nameRT = ((*O2*) 17); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (50, { declaration_astnumRT = 51; object_nameRT = ((*Q*) 18); object_nominal_subtypeRT = (Record_Type ((*NestedObject*) 4)); initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (52,
  (AssignRT (53, (SelectedComponentRT (54, (SelectedComponentRT (55, (IdentifierRT (56, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*X*) 2) , [])), (NameRT (59, (IdentifierRT (60, ((*I1*) 14) , [])))))),
  (SeqRT (61,
  (AssignRT (62, (SelectedComponentRT (63, (SelectedComponentRT (64, (IdentifierRT (65, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*Y*) 3) , [])), (NameRT (68, (IdentifierRT (69, ((*I2*) 15) , [])))))),
  (SeqRT (70,
  (AssignRT (71, (IdentifierRT (72, ((*O1*) 16) , [])), (NameRT (73, (SelectedComponentRT (74, (SelectedComponentRT (75, (IdentifierRT (76, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*X*) 2) , [])))))),
  (AssignRT (79, (IdentifierRT (80, ((*O2*) 17) , [])), (NameRT (81, (SelectedComponentRT (82, (SelectedComponentRT (83, (IdentifierRT (84, ((*Q*) 18) , [])), ((*O*) 5) , [])), ((*Y*) 3) , []))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*NestedObject*) 4), (RecordTypeDeclRT (8, ((*NestedObject*) 4), [(((*O*) 5), (Record_Type ((*Object*) 1)))]))); (((*Object*) 1), (RecordTypeDeclRT (4, ((*Object*) 1), [(((*X*) 2), Integer); (((*Y*) 3), Integer)])))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(83, (Record_Type ((*Object*) 1))); (86, Integer); (77, (Record_Type ((*Object*) 1))); (68, Integer); (32, (Record_Type ((*Object*) 1))); (41, Integer); (59, Integer); (35, Integer); (80, Integer); (26, Integer); (74, Integer); (56, (Record_Type ((*NestedObject*) 4))); (65, (Record_Type ((*NestedObject*) 4))); (82, Integer); (73, Integer); (64, (Record_Type ((*Object*) 1))); (55, (Record_Type ((*Object*) 1))); (85, (Record_Type ((*Object*) 1))); (67, Integer); (40, (Record_Type ((*Object*) 1))); (58, Integer); (76, (Record_Type ((*NestedObject*) 4))); (31, Integer); (43, Integer); (34, Integer); (25, Integer); (37, Integer); (28, Integer); (60, Integer); (78, Integer); (69, Integer); (54, Integer); (63, Integer); (81, Integer); (72, Integer); (36, (Record_Type ((*Object*) 1))); (27, (Record_Type ((*Object*) 1))); (84, (Record_Type ((*NestedObject*) 4))); (57, (Record_Type ((*Object*) 1))); (75, (Record_Type ((*Object*) 1))); (39, Integer); (66, (Record_Type ((*Object*) 1))); (42, Integer); (33, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(83, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)13 }); (86, { line = (*Line*)22; col = (*Col*)15; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (77, { line = (*Line*)21; col = (*Col*)13; endline = (*EndLine*)21; endcol = (*EndCol*)13 }); (68, { line = (*Line*)20; col = (*Col*)14; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (32, { line = (*Line*)9; col = (*Col*)5; endline = (*EndLine*)9; endcol = (*EndCol*)5 }); (41, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (59, { line = (*Line*)19; col = (*Col*)14; endline = (*EndLine*)19; endcol = (*EndCol*)15 }); (35, { line = (*Line*)9; col = (*Col*)12; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (80, { line = (*Line*)22; col = (*Col*)5; endline = (*EndLine*)22; endcol = (*EndCol*)6 }); (26, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (74, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (56, { line = (*Line*)19; col = (*Col*)5; endline = (*EndLine*)19; endcol = (*EndCol*)5 }); (65, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)5 }); (82, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (73, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (64, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (55, { line = (*Line*)19; col = (*Col*)5; endline = (*EndLine*)19; endcol = (*EndCol*)7 }); (85, { line = (*Line*)22; col = (*Col*)13; endline = (*EndLine*)22; endcol = (*EndCol*)13 }); (67, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)9 }); (40, { line = (*Line*)10; col = (*Col*)5; endline = (*EndLine*)10; endcol = (*EndCol*)5 }); (58, { line = (*Line*)19; col = (*Col*)9; endline = (*EndLine*)19; endcol = (*EndCol*)9 }); (76, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)11 }); (31, { line = (*Line*)9; col = (*Col*)5; endline = (*EndLine*)9; endcol = (*EndCol*)7 }); (43, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (34, { line = (*Line*)9; col = (*Col*)12; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (25, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (37, { line = (*Line*)9; col = (*Col*)14; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (28, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (60, { line = (*Line*)19; col = (*Col*)14; endline = (*EndLine*)19; endcol = (*EndCol*)15 }); (78, { line = (*Line*)21; col = (*Col*)15; endline = (*EndLine*)21; endcol = (*EndCol*)15 }); (69, { line = (*Line*)20; col = (*Col*)14; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (54, { line = (*Line*)19; col = (*Col*)5; endline = (*EndLine*)19; endcol = (*EndCol*)9 }); (63, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)9 }); (81, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)15 }); (72, { line = (*Line*)21; col = (*Col*)5; endline = (*EndLine*)21; endcol = (*EndCol*)6 }); (36, { line = (*Line*)9; col = (*Col*)12; endline = (*EndLine*)9; endcol = (*EndCol*)12 }); (27, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)10 }); (84, { line = (*Line*)22; col = (*Col*)11; endline = (*EndLine*)22; endcol = (*EndCol*)11 }); (57, { line = (*Line*)19; col = (*Col*)7; endline = (*EndLine*)19; endcol = (*EndCol*)7 }); (75, { line = (*Line*)21; col = (*Col*)11; endline = (*EndLine*)21; endcol = (*EndCol*)13 }); (39, { line = (*Line*)10; col = (*Col*)5; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (66, { line = (*Line*)20; col = (*Col*)7; endline = (*EndLine*)20; endcol = (*EndCol*)7 }); (42, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (33, { line = (*Line*)9; col = (*Col*)7; endline = (*EndLine*)9; endcol = (*EndCol*)7 }); (24, { line = (*Line*)8; col = (*Col*)5; endline = (*EndLine*)8; endcol = (*EndCol*)5 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("O2", "ada://parameter/RecordTest01-1:9/Test02+13:13/O2+13:45")); (8, ("anObject", "ada://variable/RecordTest01-1:9/anObject-21:3")); (11, ("T", "ada://variable/RecordTest01-1:9/Test01-16:13/T+6:5")); (2, ("X", "ada://component/RecordTest01-1:9/Object-6:8/X-8:5")); (14, ("I1", "ada://parameter/RecordTest01-1:9/Test02+13:13/I1+13:20")); (5, ("O", "ada://component/RecordTest01-1:9/NestedObject-11:8/O-13:5")); (16, ("O1", "ada://parameter/RecordTest01-1:9/Test02+13:13/O1+13:41")); (7, ("aNestedObject", "ada://variable/RecordTest01-1:9/aNestedObject-19:3")); (10, ("Q", "ada://parameter/RecordTest01-1:9/Test01-16:13/Q-16:20")); (18, ("Q", "ada://variable/RecordTest01-1:9/Test02+13:13/Q+17:5")); (3, ("Y", "ada://component/RecordTest01-1:9/Object-6:8/Y-8:8")); (15, ("I2", "ada://parameter/RecordTest01-1:9/Test02+13:13/I2+13:24"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(13, ("Test02", "ada://procedure_body/RecordTest01-1:9/Test02+13:13")); (6, ("Test01", "ada://procedure_body/RecordTest01-1:9/Test01-16:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(9, ("RecordTest01", "ada://package_body/RecordTest01-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("NestedObject", "ada://ordinary_type/RecordTest01-1:9/NestedObject-11:8")); (1, ("Object", "ada://ordinary_type/RecordTest01-1:9/Object-6:8"))]
})
}


