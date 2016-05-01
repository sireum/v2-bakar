

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Gcd*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*M*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*N*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 5; parameter_name = ((*Y*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (6,
  (ObjDecl (7, { declaration_astnum = 8; object_name = ((*C*) 5); object_nominal_subtype = Integer; initialization_exp = None })),
  (SeqDecl (9,
  (ObjDecl (10, { declaration_astnum = 11; object_name = ((*D*) 6); object_nominal_subtype = Integer; initialization_exp = None })),
  (SeqDecl (12,
  (ObjDecl (13, { declaration_astnum = 14; object_name = ((*T*) 7); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (15, { declaration_astnum = 16; object_name = ((*R*) 8); object_nominal_subtype = Integer; initialization_exp = None }))))))))],
    (* = = = Procedure Body = = = *)
    (Seq (17,
    (Assign (18, (Identifier (19, ((*C*) 5) )), (Name (20, (Identifier (21, ((*M*) 2) )))))),
    (Seq (22,
    (Assign (23, (Identifier (24, ((*D*) 6) )), (Name (25, (Identifier (26, ((*N*) 3) )))))),
    (Seq (27,
    (While (28, (BinOp (29, Not_Equal, (Name (30, (Identifier (31, ((*D*) 6) )))), (Literal (32, (Integer_Literal 0) )) )),
      (Seq (33,
      (Assign (34, (Identifier (35, ((*T*) 7) )), (BinOp (36, Divide, (Name (37, (Identifier (38, ((*C*) 5) )))), (Name (39, (Identifier (40, ((*D*) 6) )))) )))),
      (Seq (41,
      (Assign (42, (Identifier (43, ((*R*) 8) )), (BinOp (44, Minus, (Name (45, (Identifier (46, ((*C*) 5) )))), (BinOp (47, Multiply, (Name (48, (Identifier (49, ((*T*) 7) )))), (Name (50, (Identifier (51, ((*D*) 6) )))) )) )))),
      (Seq (52,
      (Assign (53, (Identifier (54, ((*C*) 5) )), (Name (55, (Identifier (56, ((*D*) 6) )))))),
      (Assign (57, (Identifier (58, ((*D*) 6) )), (Name (59, (Identifier (60, ((*R*) 8) )))))))))))))
    ),
    (Assign (61, (Identifier (62, ((*Y*) 4) )), (Name (63, (Identifier (64, ((*C*) 5) ))))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*C*) 5), (In_Out, Integer)); (((*M*) 2), (In, Integer)); (((*T*) 7), (In_Out, Integer)); (((*Y*) 4), (Out, Integer)); (((*R*) 8), (In_Out, Integer)); (((*D*) 6), (In_Out, Integer)); (((*N*) 3), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Gcd*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Gcd*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*M*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*N*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 5; parameter_name = ((*Y*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (6,
(ObjDecl (7, { declaration_astnum = 8; object_name = ((*C*) 5); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (9,
(ObjDecl (10, { declaration_astnum = 11; object_name = ((*D*) 6); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (12,
(ObjDecl (13, { declaration_astnum = 14; object_name = ((*T*) 7); object_nominal_subtype = Integer; initialization_exp = None })),
(ObjDecl (15, { declaration_astnum = 16; object_name = ((*R*) 8); object_nominal_subtype = Integer; initialization_exp = None }))))))))],
  (* = = = Procedure Body = = = *)
  (Seq (17,
  (Assign (18, (Identifier (19, ((*C*) 5) )), (Name (20, (Identifier (21, ((*M*) 2) )))))),
  (Seq (22,
  (Assign (23, (Identifier (24, ((*D*) 6) )), (Name (25, (Identifier (26, ((*N*) 3) )))))),
  (Seq (27,
  (While (28, (BinOp (29, Not_Equal, (Name (30, (Identifier (31, ((*D*) 6) )))), (Literal (32, (Integer_Literal 0) )) )),
    (Seq (33,
    (Assign (34, (Identifier (35, ((*T*) 7) )), (BinOp (36, Divide, (Name (37, (Identifier (38, ((*C*) 5) )))), (Name (39, (Identifier (40, ((*D*) 6) )))) )))),
    (Seq (41,
    (Assign (42, (Identifier (43, ((*R*) 8) )), (BinOp (44, Minus, (Name (45, (Identifier (46, ((*C*) 5) )))), (BinOp (47, Multiply, (Name (48, (Identifier (49, ((*T*) 7) )))), (Name (50, (Identifier (51, ((*D*) 6) )))) )) )))),
    (Seq (52,
    (Assign (53, (Identifier (54, ((*C*) 5) )), (Name (55, (Identifier (56, ((*D*) 6) )))))),
    (Assign (57, (Identifier (58, ((*D*) 6) )), (Name (59, (Identifier (60, ((*R*) 8) )))))))))))))
  ),
  (Assign (61, (Identifier (62, ((*Y*) 4) )), (Name (63, (Identifier (64, ((*C*) 5) ))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(59, Integer); (32, Integer); (50, Integer); (62, Integer); (35, Integer); (44, Integer); (26, Integer); (56, Integer); (29, Boolean); (38, Integer); (47, Integer); (20, Integer); (46, Integer); (64, Integer); (55, Integer); (58, Integer); (40, Integer); (49, Integer); (31, Integer); (43, Integer); (25, Integer); (37, Integer); (19, Integer); (60, Integer); (63, Integer); (54, Integer); (45, Integer); (36, Integer); (21, Integer); (48, Integer); (30, Integer); (39, Integer); (24, Integer); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(59, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (32, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (50, { line = (*Line*)13; col = (*Col*)20; endline = (*EndLine*)13; endcol = (*EndCol*)20 }); (62, { line = (*Line*)17; col = (*Col*)4; endline = (*EndLine*)17; endcol = (*EndCol*)4 }); (35, { line = (*Line*)12; col = (*Col*)7; endline = (*EndLine*)12; endcol = (*EndCol*)7 }); (44, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)20 }); (26, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (56, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (29, { line = (*Line*)10; col = (*Col*)10; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (38, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)12 }); (47, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)20 }); (20, { line = (*Line*)8; col = (*Col*)9; endline = (*EndLine*)8; endcol = (*EndCol*)9 }); (46, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (64, { line = (*Line*)17; col = (*Col*)9; endline = (*EndLine*)17; endcol = (*EndCol*)9 }); (55, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (58, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (40, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (49, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)16 }); (31, { line = (*Line*)10; col = (*Col*)10; endline = (*EndLine*)10; endcol = (*EndCol*)10 }); (43, { line = (*Line*)13; col = (*Col*)7; endline = (*EndLine*)13; endcol = (*EndCol*)7 }); (25, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (37, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)12 }); (19, { line = (*Line*)8; col = (*Col*)4; endline = (*EndLine*)8; endcol = (*EndCol*)4 }); (60, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (63, { line = (*Line*)17; col = (*Col*)9; endline = (*EndLine*)17; endcol = (*EndCol*)9 }); (54, { line = (*Line*)14; col = (*Col*)7; endline = (*EndLine*)14; endcol = (*EndCol*)7 }); (45, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (36, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (21, { line = (*Line*)8; col = (*Col*)9; endline = (*EndLine*)8; endcol = (*EndCol*)9 }); (48, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)16 }); (30, { line = (*Line*)10; col = (*Col*)10; endline = (*EndLine*)10; endcol = (*EndCol*)10 }); (39, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (24, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)4 }); (51, { line = (*Line*)13; col = (*Col*)20; endline = (*EndLine*)13; endcol = (*EndCol*)20 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("R", "ada://variable/Gcd+1:11/R+6:4")); (2, ("M", "ada://parameter/Gcd+1:11/M+1:16")); (5, ("C", "ada://variable/Gcd+1:11/C+3:4")); (4, ("Y", "ada://parameter/Gcd+1:11/Y+1:42")); (7, ("T", "ada://variable/Gcd+1:11/T+5:4")); (3, ("N", "ada://parameter/Gcd+1:11/N+1:29")); (6, ("D", "ada://variable/Gcd+1:11/D+4:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Gcd", "ada://procedure_body/Gcd+1:11"))];
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
    ((*Gcd*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*M*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*N*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 5; parameter_nameRT = ((*Y*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (6,
  (ObjDeclRT (7, { declaration_astnumRT = 8; object_nameRT = ((*C*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (SeqDeclRT (9,
  (ObjDeclRT (10, { declaration_astnumRT = 11; object_nameRT = ((*D*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (SeqDeclRT (12,
  (ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*T*) 7); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (15, { declaration_astnumRT = 16; object_nameRT = ((*R*) 8); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (17,
    (AssignRT (18, (IdentifierRT (19, ((*C*) 5) , [])), (NameRT (20, (IdentifierRT (21, ((*M*) 2) , [])))))),
    (SeqRT (22,
    (AssignRT (23, (IdentifierRT (24, ((*D*) 6) , [])), (NameRT (25, (IdentifierRT (26, ((*N*) 3) , [])))))),
    (SeqRT (27,
    (WhileRT (28, (BinOpRT (29, Not_Equal, (NameRT (30, (IdentifierRT (31, ((*D*) 6) , [])))), (LiteralRT (32, (Integer_Literal 0) , [], [])) , [], [])),
      (SeqRT (33,
      (AssignRT (34, (IdentifierRT (35, ((*T*) 7) , [])), (BinOpRT (36, Divide, (NameRT (37, (IdentifierRT (38, ((*C*) 5) , [])))), (NameRT (39, (IdentifierRT (40, ((*D*) 6) , [])))) , [DivCheck; OverflowCheck], [])))),
      (SeqRT (41,
      (AssignRT (42, (IdentifierRT (43, ((*R*) 8) , [])), (BinOpRT (44, Minus, (NameRT (45, (IdentifierRT (46, ((*C*) 5) , [])))), (BinOpRT (47, Multiply, (NameRT (48, (IdentifierRT (49, ((*T*) 7) , [])))), (NameRT (50, (IdentifierRT (51, ((*D*) 6) , [])))) , [OverflowCheck], [])) , [OverflowCheck], [])))),
      (SeqRT (52,
      (AssignRT (53, (IdentifierRT (54, ((*C*) 5) , [])), (NameRT (55, (IdentifierRT (56, ((*D*) 6) , [])))))),
      (AssignRT (57, (IdentifierRT (58, ((*D*) 6) , [])), (NameRT (59, (IdentifierRT (60, ((*R*) 8) , [])))))))))))))
    ),
    (AssignRT (61, (IdentifierRT (62, ((*Y*) 4) , [])), (NameRT (63, (IdentifierRT (64, ((*C*) 5) , []))))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*C*) 5), (In_Out, Integer)); (((*M*) 2), (In, Integer)); (((*T*) 7), (In_Out, Integer)); (((*Y*) 4), (Out, Integer)); (((*R*) 8), (In_Out, Integer)); (((*D*) 6), (In_Out, Integer)); (((*N*) 3), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Gcd*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Gcd*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*M*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*N*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 5; parameter_nameRT = ((*Y*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (6,
(ObjDeclRT (7, { declaration_astnumRT = 8; object_nameRT = ((*C*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (9,
(ObjDeclRT (10, { declaration_astnumRT = 11; object_nameRT = ((*D*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (12,
(ObjDeclRT (13, { declaration_astnumRT = 14; object_nameRT = ((*T*) 7); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(ObjDeclRT (15, { declaration_astnumRT = 16; object_nameRT = ((*R*) 8); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (17,
  (AssignRT (18, (IdentifierRT (19, ((*C*) 5) , [])), (NameRT (20, (IdentifierRT (21, ((*M*) 2) , [])))))),
  (SeqRT (22,
  (AssignRT (23, (IdentifierRT (24, ((*D*) 6) , [])), (NameRT (25, (IdentifierRT (26, ((*N*) 3) , [])))))),
  (SeqRT (27,
  (WhileRT (28, (BinOpRT (29, Not_Equal, (NameRT (30, (IdentifierRT (31, ((*D*) 6) , [])))), (LiteralRT (32, (Integer_Literal 0) , [], [])) , [], [])),
    (SeqRT (33,
    (AssignRT (34, (IdentifierRT (35, ((*T*) 7) , [])), (BinOpRT (36, Divide, (NameRT (37, (IdentifierRT (38, ((*C*) 5) , [])))), (NameRT (39, (IdentifierRT (40, ((*D*) 6) , [])))) , [DivCheck; OverflowCheck], [])))),
    (SeqRT (41,
    (AssignRT (42, (IdentifierRT (43, ((*R*) 8) , [])), (BinOpRT (44, Minus, (NameRT (45, (IdentifierRT (46, ((*C*) 5) , [])))), (BinOpRT (47, Multiply, (NameRT (48, (IdentifierRT (49, ((*T*) 7) , [])))), (NameRT (50, (IdentifierRT (51, ((*D*) 6) , [])))) , [OverflowCheck], [])) , [OverflowCheck], [])))),
    (SeqRT (52,
    (AssignRT (53, (IdentifierRT (54, ((*C*) 5) , [])), (NameRT (55, (IdentifierRT (56, ((*D*) 6) , [])))))),
    (AssignRT (57, (IdentifierRT (58, ((*D*) 6) , [])), (NameRT (59, (IdentifierRT (60, ((*R*) 8) , [])))))))))))))
  ),
  (AssignRT (61, (IdentifierRT (62, ((*Y*) 4) , [])), (NameRT (63, (IdentifierRT (64, ((*C*) 5) , []))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(59, Integer); (32, Integer); (50, Integer); (62, Integer); (35, Integer); (44, Integer); (26, Integer); (56, Integer); (29, Boolean); (38, Integer); (47, Integer); (20, Integer); (46, Integer); (64, Integer); (55, Integer); (58, Integer); (40, Integer); (49, Integer); (31, Integer); (43, Integer); (25, Integer); (37, Integer); (19, Integer); (60, Integer); (63, Integer); (54, Integer); (45, Integer); (36, Integer); (21, Integer); (48, Integer); (30, Integer); (39, Integer); (24, Integer); (51, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(59, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (32, { line = (*Line*)10; col = (*Col*)15; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (50, { line = (*Line*)13; col = (*Col*)20; endline = (*EndLine*)13; endcol = (*EndCol*)20 }); (62, { line = (*Line*)17; col = (*Col*)4; endline = (*EndLine*)17; endcol = (*EndCol*)4 }); (35, { line = (*Line*)12; col = (*Col*)7; endline = (*EndLine*)12; endcol = (*EndCol*)7 }); (44, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)20 }); (26, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (56, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (29, { line = (*Line*)10; col = (*Col*)10; endline = (*EndLine*)10; endcol = (*EndCol*)15 }); (38, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)12 }); (47, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)20 }); (20, { line = (*Line*)8; col = (*Col*)9; endline = (*EndLine*)8; endcol = (*EndCol*)9 }); (46, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (64, { line = (*Line*)17; col = (*Col*)9; endline = (*EndLine*)17; endcol = (*EndCol*)9 }); (55, { line = (*Line*)14; col = (*Col*)12; endline = (*EndLine*)14; endcol = (*EndCol*)12 }); (58, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (40, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (49, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)16 }); (31, { line = (*Line*)10; col = (*Col*)10; endline = (*EndLine*)10; endcol = (*EndCol*)10 }); (43, { line = (*Line*)13; col = (*Col*)7; endline = (*EndLine*)13; endcol = (*EndCol*)7 }); (25, { line = (*Line*)9; col = (*Col*)9; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (37, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)12 }); (19, { line = (*Line*)8; col = (*Col*)4; endline = (*EndLine*)8; endcol = (*EndCol*)4 }); (60, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (63, { line = (*Line*)17; col = (*Col*)9; endline = (*EndLine*)17; endcol = (*EndCol*)9 }); (54, { line = (*Line*)14; col = (*Col*)7; endline = (*EndLine*)14; endcol = (*EndCol*)7 }); (45, { line = (*Line*)13; col = (*Col*)12; endline = (*EndLine*)13; endcol = (*EndCol*)12 }); (36, { line = (*Line*)12; col = (*Col*)12; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (21, { line = (*Line*)8; col = (*Col*)9; endline = (*EndLine*)8; endcol = (*EndCol*)9 }); (48, { line = (*Line*)13; col = (*Col*)16; endline = (*EndLine*)13; endcol = (*EndCol*)16 }); (30, { line = (*Line*)10; col = (*Col*)10; endline = (*EndLine*)10; endcol = (*EndCol*)10 }); (39, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (24, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)4 }); (51, { line = (*Line*)13; col = (*Col*)20; endline = (*EndLine*)13; endcol = (*EndCol*)20 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(8, ("R", "ada://variable/Gcd+1:11/R+6:4")); (2, ("M", "ada://parameter/Gcd+1:11/M+1:16")); (5, ("C", "ada://variable/Gcd+1:11/C+3:4")); (4, ("Y", "ada://parameter/Gcd+1:11/Y+1:42")); (7, ("T", "ada://variable/Gcd+1:11/T+5:4")); (3, ("N", "ada://parameter/Gcd+1:11/N+1:29")); (6, ("D", "ada://variable/Gcd+1:11/D+4:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Gcd", "ada://procedure_body/Gcd+1:11"))];
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


