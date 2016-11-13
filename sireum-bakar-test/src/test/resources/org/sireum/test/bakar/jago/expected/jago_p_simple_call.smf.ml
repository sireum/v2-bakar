

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(ObjDecl (3, { declaration_astnum = 4; object_name = ((*Y*) 1); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (5,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (6,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (7,
NullDecl (* Undefined Declarations ! *),
(ObjDecl (8, { declaration_astnum = 9; object_name = ((*C*) 5); object_nominal_subtype = Integer; initialization_exp = None })))))))))),
(SeqDecl (10,
(ObjDecl (11, { declaration_astnum = 12; object_name = ((*B*) 7); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (13,
(ProcBodyDecl (14, 
  mkprocBodyDecl (
   15,
    (* = = = Procedure Name = = = *)
    ((*R*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 16; parameter_name = ((*X*) 8); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (17, (Identifier (18, ((*X*) 8) )), (BinOp (19, Plus, (BinOp (20, Plus, (Name (21, (Identifier (22, ((*Y*) 1) )))), (Name (23, (Identifier (24, ((*B*) 7) )))) )), (Name (25, (Identifier (26, ((*C*) 5) )))) ))))
  ))
),
(SeqDecl (27,
(ProcBodyDecl (28, 
  mkprocBodyDecl (
   29,
    (* = = = Procedure Name = = = *)
    ((*incX*) 3),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 30; parameter_name = ((*X*) 10); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 31; parameter_name = ((*Z*) 11); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (32, { declaration_astnum = 33; object_name = ((*result*) 12); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (34,
    (If (35, (BinOp (36, Equal, (Name (37, (Identifier (38, ((*X*) 10) )))), (Literal (39, (Integer_Literal 0) )) )),
      (Assign (40, (Identifier (41, ((*result*) 12) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 10) )))), (Literal (45, (Integer_Literal 1) )) )))),
      (Assign (46, (Identifier (47, ((*result*) 12) )), (BinOp (48, Minus, (Name (49, (Identifier (50, ((*X*) 10) )))), (Literal (51, (Integer_Literal 1) )) )))))
    ),
    (Assign (52, (Identifier (53, ((*Z*) 11) )), (Name (54, (Identifier (55, ((*result*) 12) ))))))))
  ))
),
(ProcBodyDecl (56, 
  mkprocBodyDecl (
   57,
    (* = = = Procedure Name = = = *)
    ((*Q*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 58; parameter_name = ((*X*) 15); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 59; parameter_name = ((*Z*) 16); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDecl (60, { declaration_astnum = 61; object_name = ((*V*) 17); object_nominal_subtype = Integer; initialization_exp = None })),
    (* = = = Procedure Body = = = *)
    (Seq (62,
    (Call (63, 64, ((*R*) 4), 
      [(Name (65, (Identifier (66, ((*Z*) 16) ))))])
    ),
    (Seq (67,
    (Call (68, 69, ((*incX*) 3), 
      [(Name (70, (Identifier (71, ((*X*) 15) )))); (Name (72, (Identifier (73, ((*V*) 17) ))))])
    ),
    (Assign (74, (Identifier (75, ((*Z*) 16) )), (BinOp (76, Plus, (Name (77, (Identifier (78, ((*Z*) 16) )))), (Name (79, (Identifier (80, ((*V*) 17) )))) ))))))))
  ))
)))))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*C*) 5), (In_Out, Integer)); (((*B*) 7), (In_Out, Integer)); (((*V*) 17), (In_Out, Integer)); (((*X*) 10), (In, Integer)); (((*Z*) 11), (Out, Integer)); (((*Z*) 16), (Out, Integer)); (((*Y*) 1), (In_Out, Integer)); (((*X*) 15), (In, Integer)); (((*result*) 12), (In_Out, Integer)); (((*X*) 8), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*R*) 4), (0, mkprocBodyDecl (
 15,
  (* = = = Procedure Name = = = *)
  ((*R*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 16; parameter_name = ((*X*) 8); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (17, (Identifier (18, ((*X*) 8) )), (BinOp (19, Plus, (BinOp (20, Plus, (Name (21, (Identifier (22, ((*Y*) 1) )))), (Name (23, (Identifier (24, ((*B*) 7) )))) )), (Name (25, (Identifier (26, ((*C*) 5) )))) ))))
))); (((*incX*) 3), (0, mkprocBodyDecl (
 29,
  (* = = = Procedure Name = = = *)
  ((*incX*) 3),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 30; parameter_name = ((*X*) 10); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 31; parameter_name = ((*Z*) 11); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (32, { declaration_astnum = 33; object_name = ((*result*) 12); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (34,
  (If (35, (BinOp (36, Equal, (Name (37, (Identifier (38, ((*X*) 10) )))), (Literal (39, (Integer_Literal 0) )) )),
    (Assign (40, (Identifier (41, ((*result*) 12) )), (BinOp (42, Plus, (Name (43, (Identifier (44, ((*X*) 10) )))), (Literal (45, (Integer_Literal 1) )) )))),
    (Assign (46, (Identifier (47, ((*result*) 12) )), (BinOp (48, Minus, (Name (49, (Identifier (50, ((*X*) 10) )))), (Literal (51, (Integer_Literal 1) )) )))))
  ),
  (Assign (52, (Identifier (53, ((*Z*) 11) )), (Name (54, (Identifier (55, ((*result*) 12) ))))))))
))); (((*Q*) 2), (0, mkprocBodyDecl (
 57,
  (* = = = Procedure Name = = = *)
  ((*Q*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 58; parameter_name = ((*X*) 15); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 59; parameter_name = ((*Z*) 16); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDecl (60, { declaration_astnum = 61; object_name = ((*V*) 17); object_nominal_subtype = Integer; initialization_exp = None })),
  (* = = = Procedure Body = = = *)
  (Seq (62,
  (Call (63, 64, ((*R*) 4), 
    [(Name (65, (Identifier (66, ((*Z*) 16) ))))])
  ),
  (Seq (67,
  (Call (68, 69, ((*incX*) 3), 
    [(Name (70, (Identifier (71, ((*X*) 15) )))); (Name (72, (Identifier (73, ((*V*) 17) ))))])
  ),
  (Assign (74, (Identifier (75, ((*Z*) 16) )), (BinOp (76, Plus, (Name (77, (Identifier (78, ((*Z*) 16) )))), (Name (79, (Identifier (80, ((*V*) 17) )))) ))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (77, Integer); (41, Integer); (50, Integer); (44, Integer); (53, Integer); (80, Integer); (26, Integer); (71, Integer); (38, Integer); (47, Integer); (20, Integer); (65, Integer); (73, Integer); (55, Integer); (49, Integer); (76, Integer); (22, Integer); (79, Integer); (70, Integer); (43, Integer); (25, Integer); (37, Integer); (19, Integer); (78, Integer); (45, Integer); (54, Integer); (72, Integer); (36, Boolean); (18, Integer); (21, Integer); (48, Integer); (75, Integer); (39, Integer); (66, Integer); (42, Integer); (24, Integer); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)8; col = (*Col*)16; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (77, { line = (*Line*)29; col = (*Col*)11; endline = (*EndLine*)29; endcol = (*EndCol*)11 }); (41, { line = (*Line*)16; col = (*Col*)7; endline = (*EndLine*)16; endcol = (*EndCol*)12 }); (50, { line = (*Line*)18; col = (*Col*)17; endline = (*EndLine*)18; endcol = (*EndCol*)17 }); (44, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)17 }); (53, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)5 }); (80, { line = (*Line*)29; col = (*Col*)15; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (26, { line = (*Line*)8; col = (*Col*)21; endline = (*EndLine*)8; endcol = (*EndCol*)21 }); (71, { line = (*Line*)28; col = (*Col*)11; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (38, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (47, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)12 }); (20, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (65, { line = (*Line*)27; col = (*Col*)8; endline = (*EndLine*)27; endcol = (*EndCol*)8 }); (73, { line = (*Line*)28; col = (*Col*)14; endline = (*EndLine*)28; endcol = (*EndCol*)14 }); (55, { line = (*Line*)20; col = (*Col*)10; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (49, { line = (*Line*)18; col = (*Col*)17; endline = (*EndLine*)18; endcol = (*EndCol*)17 }); (76, { line = (*Line*)29; col = (*Col*)11; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (22, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (79, { line = (*Line*)29; col = (*Col*)15; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (70, { line = (*Line*)28; col = (*Col*)11; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (43, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)17 }); (25, { line = (*Line*)8; col = (*Col*)21; endline = (*EndLine*)8; endcol = (*EndCol*)21 }); (37, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (19, { line = (*Line*)8; col = (*Col*)11; endline = (*EndLine*)8; endcol = (*EndCol*)21 }); (78, { line = (*Line*)29; col = (*Col*)11; endline = (*EndLine*)29; endcol = (*EndCol*)11 }); (45, { line = (*Line*)16; col = (*Col*)21; endline = (*EndLine*)16; endcol = (*EndCol*)21 }); (54, { line = (*Line*)20; col = (*Col*)10; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (72, { line = (*Line*)28; col = (*Col*)14; endline = (*EndLine*)28; endcol = (*EndCol*)14 }); (36, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (18, { line = (*Line*)8; col = (*Col*)6; endline = (*EndLine*)8; endcol = (*EndCol*)6 }); (21, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (48, { line = (*Line*)18; col = (*Col*)17; endline = (*EndLine*)18; endcol = (*EndCol*)21 }); (75, { line = (*Line*)29; col = (*Col*)6; endline = (*EndLine*)29; endcol = (*EndCol*)6 }); (39, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (66, { line = (*Line*)27; col = (*Col*)8; endline = (*EndLine*)27; endcol = (*EndCol*)8 }); (42, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)21 }); (24, { line = (*Line*)8; col = (*Col*)16; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (51, { line = (*Line*)18; col = (*Col*)21; endline = (*EndLine*)18; endcol = (*EndCol*)21 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("V", "ada://variable/P_Simple_Call-1:9/Q-7:13/V+25:6")); (8, ("X", "ada://parameter/P_Simple_Call-1:9/R-13:13/X-13:15")); (11, ("Z", "ada://parameter/P_Simple_Call-1:9/incX-11:13/Z-11:34")); (5, ("C", "ada://variable/P_Simple_Call-1:9/C-18:4")); (16, ("Z", "ada://parameter/P_Simple_Call-1:9/Q-7:13/Z-7:30")); (7, ("B", "ada://variable/P_Simple_Call-1:9/B+4:3")); (10, ("X", "ada://parameter/P_Simple_Call-1:9/incX-11:13/X-11:18")); (1, ("Y", "ada://variable/P_Simple_Call-1:9/Y-6:3")); (12, ("result", "ada://variable/P_Simple_Call-1:9/incX-11:13/result+13:5")); (15, ("X", "ada://parameter/P_Simple_Call-1:9/Q-7:13/X-7:15"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Q", "ada://procedure_body/P_Simple_Call-1:9/Q-7:13")); (4, ("R", "ada://procedure/P_Simple_Call-1:9/R-13:13")); (3, ("incX", "ada://procedure/P_Simple_Call-1:9/incX-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(6, ("P_Simple_Call", "ada://package_body/P_Simple_Call-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(ObjDeclRT (3, { declaration_astnumRT = 4; object_nameRT = ((*Y*) 1); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (5,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (6,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (7,
NullDeclRT (* Undefined Declarations ! *),
(ObjDeclRT (8, { declaration_astnumRT = 9; object_nameRT = ((*C*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })))))))))),
(SeqDeclRT (10,
(ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*B*) 7); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (13,
(ProcBodyDeclRT (14, 
  mkprocBodyDeclRT (
   15,
    (* = = = Procedure Name = = = *)
    ((*R*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 16; parameter_nameRT = ((*X*) 8); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (17, (IdentifierRT (18, ((*X*) 8) , [])), (BinOpRT (19, Plus, (BinOpRT (20, Plus, (NameRT (21, (IdentifierRT (22, ((*Y*) 1) , [])))), (NameRT (23, (IdentifierRT (24, ((*B*) 7) , [])))) , [OverflowCheck], [])), (NameRT (25, (IdentifierRT (26, ((*C*) 5) , [])))) , [OverflowCheck], []))))
  ))
),
(SeqDeclRT (27,
(ProcBodyDeclRT (28, 
  mkprocBodyDeclRT (
   29,
    (* = = = Procedure Name = = = *)
    ((*incX*) 3),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 30; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 31; parameter_nameRT = ((*Z*) 11); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (32, { declaration_astnumRT = 33; object_nameRT = ((*result*) 12); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (34,
    (IfRT (35, (BinOpRT (36, Equal, (NameRT (37, (IdentifierRT (38, ((*X*) 10) , [])))), (LiteralRT (39, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (40, (IdentifierRT (41, ((*result*) 12) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 10) , [])))), (LiteralRT (45, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
      (AssignRT (46, (IdentifierRT (47, ((*result*) 12) , [])), (BinOpRT (48, Minus, (NameRT (49, (IdentifierRT (50, ((*X*) 10) , [])))), (LiteralRT (51, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
    ),
    (AssignRT (52, (IdentifierRT (53, ((*Z*) 11) , [])), (NameRT (54, (IdentifierRT (55, ((*result*) 12) , []))))))))
  ))
),
(ProcBodyDeclRT (56, 
  mkprocBodyDeclRT (
   57,
    (* = = = Procedure Name = = = *)
    ((*Q*) 2),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 58; parameter_nameRT = ((*X*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 59; parameter_nameRT = ((*Z*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (ObjDeclRT (60, { declaration_astnumRT = 61; object_nameRT = ((*V*) 17); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
    (* = = = Procedure Body = = = *)
    (SeqRT (62,
    (CallRT (63, 64, ((*R*) 4), 
      [(NameRT (65, (IdentifierRT (66, ((*Z*) 16) , []))))])
    ),
    (SeqRT (67,
    (CallRT (68, 69, ((*incX*) 3), 
      [(NameRT (70, (IdentifierRT (71, ((*X*) 15) , [])))); (NameRT (72, (IdentifierRT (73, ((*V*) 17) , []))))])
    ),
    (AssignRT (74, (IdentifierRT (75, ((*Z*) 16) , [])), (BinOpRT (76, Plus, (NameRT (77, (IdentifierRT (78, ((*Z*) 16) , [])))), (NameRT (79, (IdentifierRT (80, ((*V*) 17) , [])))) , [OverflowCheck], []))))))))
  ))
)))))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*C*) 5), (In_Out, Integer)); (((*B*) 7), (In_Out, Integer)); (((*V*) 17), (In_Out, Integer)); (((*X*) 10), (In, Integer)); (((*Z*) 11), (Out, Integer)); (((*Z*) 16), (Out, Integer)); (((*Y*) 1), (In_Out, Integer)); (((*X*) 15), (In, Integer)); (((*result*) 12), (In_Out, Integer)); (((*X*) 8), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*R*) 4), (0, mkprocBodyDeclRT (
 15,
  (* = = = Procedure Name = = = *)
  ((*R*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 16; parameter_nameRT = ((*X*) 8); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (17, (IdentifierRT (18, ((*X*) 8) , [])), (BinOpRT (19, Plus, (BinOpRT (20, Plus, (NameRT (21, (IdentifierRT (22, ((*Y*) 1) , [])))), (NameRT (23, (IdentifierRT (24, ((*B*) 7) , [])))) , [OverflowCheck], [])), (NameRT (25, (IdentifierRT (26, ((*C*) 5) , [])))) , [OverflowCheck], []))))
))); (((*incX*) 3), (0, mkprocBodyDeclRT (
 29,
  (* = = = Procedure Name = = = *)
  ((*incX*) 3),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 30; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 31; parameter_nameRT = ((*Z*) 11); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (32, { declaration_astnumRT = 33; object_nameRT = ((*result*) 12); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (34,
  (IfRT (35, (BinOpRT (36, Equal, (NameRT (37, (IdentifierRT (38, ((*X*) 10) , [])))), (LiteralRT (39, (Integer_Literal 0) , [], [])) , [], [])),
    (AssignRT (40, (IdentifierRT (41, ((*result*) 12) , [])), (BinOpRT (42, Plus, (NameRT (43, (IdentifierRT (44, ((*X*) 10) , [])))), (LiteralRT (45, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    (AssignRT (46, (IdentifierRT (47, ((*result*) 12) , [])), (BinOpRT (48, Minus, (NameRT (49, (IdentifierRT (50, ((*X*) 10) , [])))), (LiteralRT (51, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))
  ),
  (AssignRT (52, (IdentifierRT (53, ((*Z*) 11) , [])), (NameRT (54, (IdentifierRT (55, ((*result*) 12) , []))))))))
))); (((*Q*) 2), (0, mkprocBodyDeclRT (
 57,
  (* = = = Procedure Name = = = *)
  ((*Q*) 2),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 58; parameter_nameRT = ((*X*) 15); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 59; parameter_nameRT = ((*Z*) 16); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (ObjDeclRT (60, { declaration_astnumRT = 61; object_nameRT = ((*V*) 17); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (* = = = Procedure Body = = = *)
  (SeqRT (62,
  (CallRT (63, 64, ((*R*) 4), 
    [(NameRT (65, (IdentifierRT (66, ((*Z*) 16) , []))))])
  ),
  (SeqRT (67,
  (CallRT (68, 69, ((*incX*) 3), 
    [(NameRT (70, (IdentifierRT (71, ((*X*) 15) , [])))); (NameRT (72, (IdentifierRT (73, ((*V*) 17) , []))))])
  ),
  (AssignRT (74, (IdentifierRT (75, ((*Z*) 16) , [])), (BinOpRT (76, Plus, (NameRT (77, (IdentifierRT (78, ((*Z*) 16) , [])))), (NameRT (79, (IdentifierRT (80, ((*V*) 17) , [])))) , [OverflowCheck], []))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (77, Integer); (41, Integer); (50, Integer); (44, Integer); (53, Integer); (80, Integer); (26, Integer); (71, Integer); (38, Integer); (47, Integer); (20, Integer); (65, Integer); (73, Integer); (55, Integer); (49, Integer); (76, Integer); (22, Integer); (79, Integer); (70, Integer); (43, Integer); (25, Integer); (37, Integer); (19, Integer); (78, Integer); (45, Integer); (54, Integer); (72, Integer); (36, Boolean); (18, Integer); (21, Integer); (48, Integer); (75, Integer); (39, Integer); (66, Integer); (42, Integer); (24, Integer); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)8; col = (*Col*)16; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (77, { line = (*Line*)29; col = (*Col*)11; endline = (*EndLine*)29; endcol = (*EndCol*)11 }); (41, { line = (*Line*)16; col = (*Col*)7; endline = (*EndLine*)16; endcol = (*EndCol*)12 }); (50, { line = (*Line*)18; col = (*Col*)17; endline = (*EndLine*)18; endcol = (*EndCol*)17 }); (44, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)17 }); (53, { line = (*Line*)20; col = (*Col*)5; endline = (*EndLine*)20; endcol = (*EndCol*)5 }); (80, { line = (*Line*)29; col = (*Col*)15; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (26, { line = (*Line*)8; col = (*Col*)21; endline = (*EndLine*)8; endcol = (*EndCol*)21 }); (71, { line = (*Line*)28; col = (*Col*)11; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (38, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (47, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)12 }); (20, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (65, { line = (*Line*)27; col = (*Col*)8; endline = (*EndLine*)27; endcol = (*EndCol*)8 }); (73, { line = (*Line*)28; col = (*Col*)14; endline = (*EndLine*)28; endcol = (*EndCol*)14 }); (55, { line = (*Line*)20; col = (*Col*)10; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (49, { line = (*Line*)18; col = (*Col*)17; endline = (*EndLine*)18; endcol = (*EndCol*)17 }); (76, { line = (*Line*)29; col = (*Col*)11; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (22, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (79, { line = (*Line*)29; col = (*Col*)15; endline = (*EndLine*)29; endcol = (*EndCol*)15 }); (70, { line = (*Line*)28; col = (*Col*)11; endline = (*EndLine*)28; endcol = (*EndCol*)11 }); (43, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)17 }); (25, { line = (*Line*)8; col = (*Col*)21; endline = (*EndLine*)8; endcol = (*EndCol*)21 }); (37, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)8 }); (19, { line = (*Line*)8; col = (*Col*)11; endline = (*EndLine*)8; endcol = (*EndCol*)21 }); (78, { line = (*Line*)29; col = (*Col*)11; endline = (*EndLine*)29; endcol = (*EndCol*)11 }); (45, { line = (*Line*)16; col = (*Col*)21; endline = (*EndLine*)16; endcol = (*EndCol*)21 }); (54, { line = (*Line*)20; col = (*Col*)10; endline = (*EndLine*)20; endcol = (*EndCol*)15 }); (72, { line = (*Line*)28; col = (*Col*)14; endline = (*EndLine*)28; endcol = (*EndCol*)14 }); (36, { line = (*Line*)15; col = (*Col*)8; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (18, { line = (*Line*)8; col = (*Col*)6; endline = (*EndLine*)8; endcol = (*EndCol*)6 }); (21, { line = (*Line*)8; col = (*Col*)12; endline = (*EndLine*)8; endcol = (*EndCol*)12 }); (48, { line = (*Line*)18; col = (*Col*)17; endline = (*EndLine*)18; endcol = (*EndCol*)21 }); (75, { line = (*Line*)29; col = (*Col*)6; endline = (*EndLine*)29; endcol = (*EndCol*)6 }); (39, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (66, { line = (*Line*)27; col = (*Col*)8; endline = (*EndLine*)27; endcol = (*EndCol*)8 }); (42, { line = (*Line*)16; col = (*Col*)17; endline = (*EndLine*)16; endcol = (*EndCol*)21 }); (24, { line = (*Line*)8; col = (*Col*)16; endline = (*EndLine*)8; endcol = (*EndCol*)16 }); (51, { line = (*Line*)18; col = (*Col*)21; endline = (*EndLine*)18; endcol = (*EndCol*)21 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(17, ("V", "ada://variable/P_Simple_Call-1:9/Q-7:13/V+25:6")); (8, ("X", "ada://parameter/P_Simple_Call-1:9/R-13:13/X-13:15")); (11, ("Z", "ada://parameter/P_Simple_Call-1:9/incX-11:13/Z-11:34")); (5, ("C", "ada://variable/P_Simple_Call-1:9/C-18:4")); (16, ("Z", "ada://parameter/P_Simple_Call-1:9/Q-7:13/Z-7:30")); (7, ("B", "ada://variable/P_Simple_Call-1:9/B+4:3")); (10, ("X", "ada://parameter/P_Simple_Call-1:9/incX-11:13/X-11:18")); (1, ("Y", "ada://variable/P_Simple_Call-1:9/Y-6:3")); (12, ("result", "ada://variable/P_Simple_Call-1:9/incX-11:13/result+13:5")); (15, ("X", "ada://parameter/P_Simple_Call-1:9/Q-7:13/X-7:15"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(2, ("Q", "ada://procedure_body/P_Simple_Call-1:9/Q-7:13")); (4, ("R", "ada://procedure/P_Simple_Call-1:9/R-13:13")); (3, ("incX", "ada://procedure/P_Simple_Call-1:9/incX-11:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(6, ("P_Simple_Call", "ada://package_body/P_Simple_Call-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


