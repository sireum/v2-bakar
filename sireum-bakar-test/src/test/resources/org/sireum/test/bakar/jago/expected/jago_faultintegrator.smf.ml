

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (RecordTypeDecl (4, ((*T*) 1), [(((*Limit*) 2), Integer); (((*Counter*) 3), Integer); (((*Tripped*) 4), Boolean)])))),
NullDecl (* Undefined Declarations ! *))),
(ProcBodyDecl (6, 
  mkprocBodyDecl (
   7,
    (* = = = Procedure Name = = = *)
    ((*Test*) 5),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 8; parameter_name = ((*FI*) 7); parameter_subtype_mark = (Record_Type ((*T*) 1)); parameter_mode = In_Out }; 
  { parameter_astnum = 9; parameter_name = ((*CurrentEvent*) 8); parameter_subtype_mark = Boolean; parameter_mode = In }; 
  { parameter_astnum = 10; parameter_name = ((*IntegratedEvent*) 9); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (11,
    (If (12, (Name (13, (Identifier (14, ((*CurrentEvent*) 8) )))),
      (If (15, (BinOp (16, Equal, (Name (17, (SelectedComponent (18, (Identifier (19, ((*FI*) 7) )), ((*Counter*) 3) )))), (Name (21, (SelectedComponent (22, (Identifier (23, ((*FI*) 7) )), ((*Limit*) 2) )))) )),
        (Assign (25, (SelectedComponent (26, (Identifier (27, ((*FI*) 7) )), ((*Tripped*) 4) )), (Literal (29, (Boolean_Literal true) )))),
        (Assign (30, (SelectedComponent (31, (Identifier (32, ((*FI*) 7) )), ((*Counter*) 3) )), (BinOp (34, Plus, (Name (35, (SelectedComponent (36, (Identifier (37, ((*FI*) 7) )), ((*Counter*) 3) )))), (Literal (39, (Integer_Literal 1) )) )))))
      ),
      (If (40, (BinOp (41, Equal, (Name (42, (SelectedComponent (43, (Identifier (44, ((*FI*) 7) )), ((*Counter*) 3) )))), (Literal (46, (Integer_Literal 0) )) )),
        (Assign (47, (SelectedComponent (48, (Identifier (49, ((*FI*) 7) )), ((*Tripped*) 4) )), (Literal (51, (Boolean_Literal false) )))),
        (Assign (52, (SelectedComponent (53, (Identifier (54, ((*FI*) 7) )), ((*Counter*) 3) )), (BinOp (56, Minus, (Name (57, (SelectedComponent (58, (Identifier (59, ((*FI*) 7) )), ((*Counter*) 3) )))), (Literal (61, (Integer_Literal 1) )) )))))
      ))
    ),
    (Assign (62, (Identifier (63, ((*IntegratedEvent*) 9) )), (Name (64, (SelectedComponent (65, (Identifier (66, ((*FI*) 7) )), ((*Tripped*) 4) ))))))))
  ))
)));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*FI*) 7), (In_Out, (Record_Type ((*T*) 1)))); (((*CurrentEvent*) 8), (In, Boolean)); (((*IntegratedEvent*) 9), (Out, Boolean))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test*) 5), (0, mkprocBodyDecl (
 7,
  (* = = = Procedure Name = = = *)
  ((*Test*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 8; parameter_name = ((*FI*) 7); parameter_subtype_mark = (Record_Type ((*T*) 1)); parameter_mode = In_Out }; 
{ parameter_astnum = 9; parameter_name = ((*CurrentEvent*) 8); parameter_subtype_mark = Boolean; parameter_mode = In }; 
{ parameter_astnum = 10; parameter_name = ((*IntegratedEvent*) 9); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (11,
  (If (12, (Name (13, (Identifier (14, ((*CurrentEvent*) 8) )))),
    (If (15, (BinOp (16, Equal, (Name (17, (SelectedComponent (18, (Identifier (19, ((*FI*) 7) )), ((*Counter*) 3) )))), (Name (21, (SelectedComponent (22, (Identifier (23, ((*FI*) 7) )), ((*Limit*) 2) )))) )),
      (Assign (25, (SelectedComponent (26, (Identifier (27, ((*FI*) 7) )), ((*Tripped*) 4) )), (Literal (29, (Boolean_Literal true) )))),
      (Assign (30, (SelectedComponent (31, (Identifier (32, ((*FI*) 7) )), ((*Counter*) 3) )), (BinOp (34, Plus, (Name (35, (SelectedComponent (36, (Identifier (37, ((*FI*) 7) )), ((*Counter*) 3) )))), (Literal (39, (Integer_Literal 1) )) )))))
    ),
    (If (40, (BinOp (41, Equal, (Name (42, (SelectedComponent (43, (Identifier (44, ((*FI*) 7) )), ((*Counter*) 3) )))), (Literal (46, (Integer_Literal 0) )) )),
      (Assign (47, (SelectedComponent (48, (Identifier (49, ((*FI*) 7) )), ((*Tripped*) 4) )), (Literal (51, (Boolean_Literal false) )))),
      (Assign (52, (SelectedComponent (53, (Identifier (54, ((*FI*) 7) )), ((*Counter*) 3) )), (BinOp (56, Minus, (Name (57, (SelectedComponent (58, (Identifier (59, ((*FI*) 7) )), ((*Counter*) 3) )))), (Literal (61, (Integer_Literal 1) )) )))))
    ))
  ),
  (Assign (62, (Identifier (63, ((*IntegratedEvent*) 9) )), (Name (64, (SelectedComponent (65, (Identifier (66, ((*FI*) 7) )), ((*Tripped*) 4) ))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*T*) 1), (RecordTypeDecl (4, ((*T*) 1), [(((*Limit*) 2), Integer); (((*Counter*) 3), Integer); (((*Tripped*) 4), Boolean)])))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, (Record_Type ((*T*) 1))); (59, (Record_Type ((*T*) 1))); (50, Boolean); (32, (Record_Type ((*T*) 1))); (41, Boolean); (53, Integer); (44, (Record_Type ((*T*) 1))); (17, Integer); (35, Integer); (26, Boolean); (56, Integer); (29, Boolean); (38, Integer); (20, Integer); (65, Boolean); (14, Boolean); (46, Integer); (64, Boolean); (55, Integer); (67, Boolean); (58, Integer); (49, (Record_Type ((*T*) 1))); (13, Boolean); (22, Integer); (31, Integer); (16, Boolean); (43, Integer); (34, Integer); (61, Integer); (37, (Record_Type ((*T*) 1))); (19, (Record_Type ((*T*) 1))); (28, Boolean); (60, Integer); (63, Boolean); (54, (Record_Type ((*T*) 1))); (45, Integer); (27, (Record_Type ((*T*) 1))); (18, Integer); (36, Integer); (57, Integer); (48, Boolean); (21, Integer); (39, Integer); (66, (Record_Type ((*T*) 1))); (42, Integer); (51, Boolean); (24, Integer); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)11; col = (*Col*)23; endline = (*EndLine*)11; endcol = (*EndCol*)24 }); (59, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)24 }); (50, { line = (*Line*)18; col = (*Col*)12; endline = (*EndLine*)18; endcol = (*EndCol*)18 }); (32, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)10 }); (41, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)23 }); (53, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)18 }); (44, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (17, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)19 }); (35, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)32 }); (26, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (56, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)36 }); (29, { line = (*Line*)12; col = (*Col*)23; endline = (*EndLine*)12; endcol = (*EndCol*)26 }); (38, { line = (*Line*)14; col = (*Col*)26; endline = (*EndLine*)14; endcol = (*EndCol*)32 }); (20, { line = (*Line*)11; col = (*Col*)13; endline = (*EndLine*)11; endcol = (*EndCol*)19 }); (65, { line = (*Line*)23; col = (*Col*)24; endline = (*EndLine*)23; endcol = (*EndCol*)33 }); (14, { line = (*Line*)10; col = (*Col*)8; endline = (*EndLine*)10; endcol = (*EndCol*)19 }); (46, { line = (*Line*)17; col = (*Col*)23; endline = (*EndLine*)17; endcol = (*EndCol*)23 }); (64, { line = (*Line*)23; col = (*Col*)24; endline = (*EndLine*)23; endcol = (*EndCol*)33 }); (55, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)18 }); (67, { line = (*Line*)23; col = (*Col*)27; endline = (*EndLine*)23; endcol = (*EndCol*)33 }); (58, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)32 }); (49, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)10 }); (13, { line = (*Line*)10; col = (*Col*)8; endline = (*EndLine*)10; endcol = (*EndCol*)19 }); (22, { line = (*Line*)11; col = (*Col*)23; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (31, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)18 }); (16, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (43, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)19 }); (34, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)36 }); (61, { line = (*Line*)20; col = (*Col*)36; endline = (*EndLine*)20; endcol = (*EndCol*)36 }); (37, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)24 }); (19, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)11 }); (28, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (60, { line = (*Line*)20; col = (*Col*)26; endline = (*EndLine*)20; endcol = (*EndCol*)32 }); (63, { line = (*Line*)23; col = (*Col*)5; endline = (*EndLine*)23; endcol = (*EndCol*)19 }); (54, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)10 }); (45, { line = (*Line*)17; col = (*Col*)13; endline = (*EndLine*)17; endcol = (*EndCol*)19 }); (27, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)10 }); (18, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)19 }); (36, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)32 }); (57, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)32 }); (48, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)18 }); (21, { line = (*Line*)11; col = (*Col*)23; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (39, { line = (*Line*)14; col = (*Col*)36; endline = (*EndLine*)14; endcol = (*EndCol*)36 }); (66, { line = (*Line*)23; col = (*Col*)24; endline = (*EndLine*)23; endcol = (*EndCol*)25 }); (42, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)19 }); (51, { line = (*Line*)18; col = (*Col*)23; endline = (*EndLine*)18; endcol = (*EndCol*)27 }); (24, { line = (*Line*)11; col = (*Col*)26; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (33, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)18 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("CurrentEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/CurrentEvent-10:18")); (2, ("Limit", "ada://component/FaultIntegrator-1:9/T-3:8/Limit-4:15")); (4, ("Tripped", "ada://component/FaultIntegrator-1:9/T-3:8/Tripped-6:15")); (7, ("FI", "ada://parameter/FaultIntegrator-1:9/Test-9:13/FI-9:18")); (9, ("IntegratedEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/IntegratedEvent-11:18")); (3, ("Counter", "ada://component/FaultIntegrator-1:9/T-3:8/Counter-5:15"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Test", "ada://procedure_body/FaultIntegrator-1:9/Test-9:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(6, ("FaultIntegrator", "ada://package_body/FaultIntegrator-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(1, ("T", "ada://ordinary_type/FaultIntegrator-1:9/T-3:8"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (RecordTypeDeclRT (4, ((*T*) 1), [(((*Limit*) 2), Integer); (((*Counter*) 3), Integer); (((*Tripped*) 4), Boolean)])))),
NullDeclRT (* Undefined Declarations ! *))),
(ProcBodyDeclRT (6, 
  mkprocBodyDeclRT (
   7,
    (* = = = Procedure Name = = = *)
    ((*Test*) 5),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 8; parameter_nameRT = ((*FI*) 7); parameter_subtype_markRT = (Record_Type ((*T*) 1)); parameter_modeRT = In_Out }; 
  { parameter_astnumRT = 9; parameter_nameRT = ((*CurrentEvent*) 8); parameter_subtype_markRT = Boolean; parameter_modeRT = In }; 
  { parameter_astnumRT = 10; parameter_nameRT = ((*IntegratedEvent*) 9); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (11,
    (IfRT (12, (NameRT (13, (IdentifierRT (14, ((*CurrentEvent*) 8) , [])))),
      (IfRT (15, (BinOpRT (16, Equal, (NameRT (17, (SelectedComponentRT (18, (IdentifierRT (19, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (NameRT (21, (SelectedComponentRT (22, (IdentifierRT (23, ((*FI*) 7) , [])), ((*Limit*) 2) , [])))) , [], [])),
        (AssignRT (25, (SelectedComponentRT (26, (IdentifierRT (27, ((*FI*) 7) , [])), ((*Tripped*) 4) , [])), (LiteralRT (29, (Boolean_Literal true) , [], [])))),
        (AssignRT (30, (SelectedComponentRT (31, (IdentifierRT (32, ((*FI*) 7) , [])), ((*Counter*) 3) , [])), (BinOpRT (34, Plus, (NameRT (35, (SelectedComponentRT (36, (IdentifierRT (37, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (LiteralRT (39, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
      ),
      (IfRT (40, (BinOpRT (41, Equal, (NameRT (42, (SelectedComponentRT (43, (IdentifierRT (44, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (LiteralRT (46, (Integer_Literal 0) , [], [])) , [], [])),
        (AssignRT (47, (SelectedComponentRT (48, (IdentifierRT (49, ((*FI*) 7) , [])), ((*Tripped*) 4) , [])), (LiteralRT (51, (Boolean_Literal false) , [], [])))),
        (AssignRT (52, (SelectedComponentRT (53, (IdentifierRT (54, ((*FI*) 7) , [])), ((*Counter*) 3) , [])), (BinOpRT (56, Minus, (NameRT (57, (SelectedComponentRT (58, (IdentifierRT (59, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (LiteralRT (61, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
      ))
    ),
    (AssignRT (62, (IdentifierRT (63, ((*IntegratedEvent*) 9) , [])), (NameRT (64, (SelectedComponentRT (65, (IdentifierRT (66, ((*FI*) 7) , [])), ((*Tripped*) 4) , []))))))))
  ))
)));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*FI*) 7), (In_Out, (Record_Type ((*T*) 1)))); (((*CurrentEvent*) 8), (In, Boolean)); (((*IntegratedEvent*) 9), (Out, Boolean))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Test*) 5), (0, mkprocBodyDeclRT (
 7,
  (* = = = Procedure Name = = = *)
  ((*Test*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 8; parameter_nameRT = ((*FI*) 7); parameter_subtype_markRT = (Record_Type ((*T*) 1)); parameter_modeRT = In_Out }; 
{ parameter_astnumRT = 9; parameter_nameRT = ((*CurrentEvent*) 8); parameter_subtype_markRT = Boolean; parameter_modeRT = In }; 
{ parameter_astnumRT = 10; parameter_nameRT = ((*IntegratedEvent*) 9); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (11,
  (IfRT (12, (NameRT (13, (IdentifierRT (14, ((*CurrentEvent*) 8) , [])))),
    (IfRT (15, (BinOpRT (16, Equal, (NameRT (17, (SelectedComponentRT (18, (IdentifierRT (19, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (NameRT (21, (SelectedComponentRT (22, (IdentifierRT (23, ((*FI*) 7) , [])), ((*Limit*) 2) , [])))) , [], [])),
      (AssignRT (25, (SelectedComponentRT (26, (IdentifierRT (27, ((*FI*) 7) , [])), ((*Tripped*) 4) , [])), (LiteralRT (29, (Boolean_Literal true) , [], [])))),
      (AssignRT (30, (SelectedComponentRT (31, (IdentifierRT (32, ((*FI*) 7) , [])), ((*Counter*) 3) , [])), (BinOpRT (34, Plus, (NameRT (35, (SelectedComponentRT (36, (IdentifierRT (37, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (LiteralRT (39, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ),
    (IfRT (40, (BinOpRT (41, Equal, (NameRT (42, (SelectedComponentRT (43, (IdentifierRT (44, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (LiteralRT (46, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (47, (SelectedComponentRT (48, (IdentifierRT (49, ((*FI*) 7) , [])), ((*Tripped*) 4) , [])), (LiteralRT (51, (Boolean_Literal false) , [], [])))),
      (AssignRT (52, (SelectedComponentRT (53, (IdentifierRT (54, ((*FI*) 7) , [])), ((*Counter*) 3) , [])), (BinOpRT (56, Minus, (NameRT (57, (SelectedComponentRT (58, (IdentifierRT (59, ((*FI*) 7) , [])), ((*Counter*) 3) , [])))), (LiteralRT (61, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ))
  ),
  (AssignRT (62, (IdentifierRT (63, ((*IntegratedEvent*) 9) , [])), (NameRT (64, (SelectedComponentRT (65, (IdentifierRT (66, ((*FI*) 7) , [])), ((*Tripped*) 4) , []))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*T*) 1), (RecordTypeDeclRT (4, ((*T*) 1), [(((*Limit*) 2), Integer); (((*Counter*) 3), Integer); (((*Tripped*) 4), Boolean)])))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, (Record_Type ((*T*) 1))); (59, (Record_Type ((*T*) 1))); (50, Boolean); (32, (Record_Type ((*T*) 1))); (41, Boolean); (53, Integer); (44, (Record_Type ((*T*) 1))); (17, Integer); (35, Integer); (26, Boolean); (56, Integer); (29, Boolean); (38, Integer); (20, Integer); (65, Boolean); (14, Boolean); (46, Integer); (64, Boolean); (55, Integer); (67, Boolean); (58, Integer); (49, (Record_Type ((*T*) 1))); (13, Boolean); (22, Integer); (31, Integer); (16, Boolean); (43, Integer); (34, Integer); (61, Integer); (37, (Record_Type ((*T*) 1))); (19, (Record_Type ((*T*) 1))); (28, Boolean); (60, Integer); (63, Boolean); (54, (Record_Type ((*T*) 1))); (45, Integer); (27, (Record_Type ((*T*) 1))); (18, Integer); (36, Integer); (57, Integer); (48, Boolean); (21, Integer); (39, Integer); (66, (Record_Type ((*T*) 1))); (42, Integer); (51, Boolean); (24, Integer); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)11; col = (*Col*)23; endline = (*EndLine*)11; endcol = (*EndCol*)24 }); (59, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)24 }); (50, { line = (*Line*)18; col = (*Col*)12; endline = (*EndLine*)18; endcol = (*EndCol*)18 }); (32, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)10 }); (41, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)23 }); (53, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)18 }); (44, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)11 }); (17, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)19 }); (35, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)32 }); (26, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (56, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)36 }); (29, { line = (*Line*)12; col = (*Col*)23; endline = (*EndLine*)12; endcol = (*EndCol*)26 }); (38, { line = (*Line*)14; col = (*Col*)26; endline = (*EndLine*)14; endcol = (*EndCol*)32 }); (20, { line = (*Line*)11; col = (*Col*)13; endline = (*EndLine*)11; endcol = (*EndCol*)19 }); (65, { line = (*Line*)23; col = (*Col*)24; endline = (*EndLine*)23; endcol = (*EndCol*)33 }); (14, { line = (*Line*)10; col = (*Col*)8; endline = (*EndLine*)10; endcol = (*EndCol*)19 }); (46, { line = (*Line*)17; col = (*Col*)23; endline = (*EndLine*)17; endcol = (*EndCol*)23 }); (64, { line = (*Line*)23; col = (*Col*)24; endline = (*EndLine*)23; endcol = (*EndCol*)33 }); (55, { line = (*Line*)20; col = (*Col*)12; endline = (*EndLine*)20; endcol = (*EndCol*)18 }); (67, { line = (*Line*)23; col = (*Col*)27; endline = (*EndLine*)23; endcol = (*EndCol*)33 }); (58, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)32 }); (49, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)10 }); (13, { line = (*Line*)10; col = (*Col*)8; endline = (*EndLine*)10; endcol = (*EndCol*)19 }); (22, { line = (*Line*)11; col = (*Col*)23; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (31, { line = (*Line*)14; col = (*Col*)9; endline = (*EndLine*)14; endcol = (*EndCol*)18 }); (16, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (43, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)19 }); (34, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)36 }); (61, { line = (*Line*)20; col = (*Col*)36; endline = (*EndLine*)20; endcol = (*EndCol*)36 }); (37, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)24 }); (19, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)11 }); (28, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (60, { line = (*Line*)20; col = (*Col*)26; endline = (*EndLine*)20; endcol = (*EndCol*)32 }); (63, { line = (*Line*)23; col = (*Col*)5; endline = (*EndLine*)23; endcol = (*EndCol*)19 }); (54, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)10 }); (45, { line = (*Line*)17; col = (*Col*)13; endline = (*EndLine*)17; endcol = (*EndCol*)19 }); (27, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)10 }); (18, { line = (*Line*)11; col = (*Col*)10; endline = (*EndLine*)11; endcol = (*EndCol*)19 }); (36, { line = (*Line*)14; col = (*Col*)23; endline = (*EndLine*)14; endcol = (*EndCol*)32 }); (57, { line = (*Line*)20; col = (*Col*)23; endline = (*EndLine*)20; endcol = (*EndCol*)32 }); (48, { line = (*Line*)18; col = (*Col*)9; endline = (*EndLine*)18; endcol = (*EndCol*)18 }); (21, { line = (*Line*)11; col = (*Col*)23; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (39, { line = (*Line*)14; col = (*Col*)36; endline = (*EndLine*)14; endcol = (*EndCol*)36 }); (66, { line = (*Line*)23; col = (*Col*)24; endline = (*EndLine*)23; endcol = (*EndCol*)25 }); (42, { line = (*Line*)17; col = (*Col*)10; endline = (*EndLine*)17; endcol = (*EndCol*)19 }); (51, { line = (*Line*)18; col = (*Col*)23; endline = (*EndLine*)18; endcol = (*EndCol*)27 }); (24, { line = (*Line*)11; col = (*Col*)26; endline = (*EndLine*)11; endcol = (*EndCol*)30 }); (33, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)18 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("CurrentEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/CurrentEvent-10:18")); (2, ("Limit", "ada://component/FaultIntegrator-1:9/T-3:8/Limit-4:15")); (4, ("Tripped", "ada://component/FaultIntegrator-1:9/T-3:8/Tripped-6:15")); (7, ("FI", "ada://parameter/FaultIntegrator-1:9/Test-9:13/FI-9:18")); (9, ("IntegratedEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/IntegratedEvent-11:18")); (3, ("Counter", "ada://component/FaultIntegrator-1:9/T-3:8/Counter-5:15"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Test", "ada://procedure_body/FaultIntegrator-1:9/Test-9:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(6, ("FaultIntegrator", "ada://package_body/FaultIntegrator-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(1, ("T", "ada://ordinary_type/FaultIntegrator-1:9/T-3:8"))]
})
}


