

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Prime*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*N*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*R*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (5,
  (ObjDecl (6, { declaration_astnum = 7; object_name = ((*Result*) 4); object_nominal_subtype = Integer; initialization_exp = None })),
  (SeqDecl (8,
  (ObjDecl (9, { declaration_astnum = 10; object_name = ((*I*) 5); object_nominal_subtype = Integer; initialization_exp = None })),
  (ObjDecl (11, { declaration_astnum = 12; object_name = ((*T*) 6); object_nominal_subtype = Integer; initialization_exp = None }))))))],
    (* = = = Procedure Body = = = *)
    (Seq (13,
    (Assign (14, (Identifier (15, ((*Result*) 4) )), (Literal (16, (Integer_Literal 0) )))),
    (Seq (17,
    (If (18, (BinOp (19, Or, (BinOp (20, Equal, (Name (21, (Identifier (22, ((*N*) 2) )))), (Literal (23, (Integer_Literal 1) )) )), (BinOp (24, Equal, (Name (25, (Identifier (26, ((*N*) 2) )))), (Literal (27, (Integer_Literal 2) )) )) )),
      (Assign (28, (Identifier (29, ((*Result*) 4) )), (Literal (30, (Integer_Literal 1) )))),
      Null)
    ),
    (Seq (31,
    (Assign (32, (Identifier (33, ((*I*) 5) )), (Literal (34, (Integer_Literal 2) )))),
    (Seq (35,
    (While (36, (BinOp (37, And, (BinOp (38, Less_Than, (Name (39, (Identifier (40, ((*I*) 5) )))), (Name (41, (Identifier (42, ((*N*) 2) )))) )), (BinOp (43, Equal, (Name (44, (Identifier (45, ((*Result*) 4) )))), (Literal (46, (Integer_Literal 0) )) )) )),
      (Seq (47,
      (Assign (48, (Identifier (49, ((*T*) 6) )), (BinOp (50, Divide, (Name (51, (Identifier (52, ((*N*) 2) )))), (Name (53, (Identifier (54, ((*I*) 5) )))) )))),
      (If (55, (BinOp (56, Equal, (Name (57, (Identifier (58, ((*N*) 2) )))), (BinOp (59, Multiply, (Name (60, (Identifier (61, ((*T*) 6) )))), (Name (62, (Identifier (63, ((*I*) 5) )))) )) )),
        (Assign (64, (Identifier (65, ((*Result*) 4) )), (Literal (66, (Integer_Literal 1) )))),
        Null)
      ))))
    ),
    (Assign (67, (Identifier (68, ((*R*) 3) )), (Name (69, (Identifier (70, ((*Result*) 4) ))))))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 5), (In_Out, Integer)); (((*N*) 2), (In, Integer)); (((*R*) 3), (Out, Integer)); (((*Result*) 4), (In_Out, Integer)); (((*T*) 6), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Prime*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Prime*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*N*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*R*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (5,
(ObjDecl (6, { declaration_astnum = 7; object_name = ((*Result*) 4); object_nominal_subtype = Integer; initialization_exp = None })),
(SeqDecl (8,
(ObjDecl (9, { declaration_astnum = 10; object_name = ((*I*) 5); object_nominal_subtype = Integer; initialization_exp = None })),
(ObjDecl (11, { declaration_astnum = 12; object_name = ((*T*) 6); object_nominal_subtype = Integer; initialization_exp = None }))))))],
  (* = = = Procedure Body = = = *)
  (Seq (13,
  (Assign (14, (Identifier (15, ((*Result*) 4) )), (Literal (16, (Integer_Literal 0) )))),
  (Seq (17,
  (If (18, (BinOp (19, Or, (BinOp (20, Equal, (Name (21, (Identifier (22, ((*N*) 2) )))), (Literal (23, (Integer_Literal 1) )) )), (BinOp (24, Equal, (Name (25, (Identifier (26, ((*N*) 2) )))), (Literal (27, (Integer_Literal 2) )) )) )),
    (Assign (28, (Identifier (29, ((*Result*) 4) )), (Literal (30, (Integer_Literal 1) )))),
    Null)
  ),
  (Seq (31,
  (Assign (32, (Identifier (33, ((*I*) 5) )), (Literal (34, (Integer_Literal 2) )))),
  (Seq (35,
  (While (36, (BinOp (37, And, (BinOp (38, Less_Than, (Name (39, (Identifier (40, ((*I*) 5) )))), (Name (41, (Identifier (42, ((*N*) 2) )))) )), (BinOp (43, Equal, (Name (44, (Identifier (45, ((*Result*) 4) )))), (Literal (46, (Integer_Literal 0) )) )) )),
    (Seq (47,
    (Assign (48, (Identifier (49, ((*T*) 6) )), (BinOp (50, Divide, (Name (51, (Identifier (52, ((*N*) 2) )))), (Name (53, (Identifier (54, ((*I*) 5) )))) )))),
    (If (55, (BinOp (56, Equal, (Name (57, (Identifier (58, ((*N*) 2) )))), (BinOp (59, Multiply, (Name (60, (Identifier (61, ((*T*) 6) )))), (Name (62, (Identifier (63, ((*I*) 5) )))) )) )),
      (Assign (64, (Identifier (65, ((*Result*) 4) )), (Literal (66, (Integer_Literal 1) )))),
      Null)
    ))))
  ),
  (Assign (67, (Identifier (68, ((*R*) 3) )), (Name (69, (Identifier (70, ((*Result*) 4) ))))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (68, Integer); (59, Integer); (50, Integer); (41, Integer); (62, Integer); (53, Integer); (44, Integer); (26, Integer); (56, Boolean); (29, Integer); (38, Boolean); (20, Boolean); (65, Integer); (46, Integer); (58, Integer); (49, Integer); (40, Integer); (22, Integer); (16, Integer); (70, Integer); (52, Integer); (43, Boolean); (25, Integer); (34, Integer); (61, Integer); (37, Boolean); (19, Boolean); (60, Integer); (69, Integer); (63, Integer); (54, Integer); (45, Integer); (27, Integer); (57, Integer); (21, Integer); (30, Integer); (39, Integer); (66, Integer); (15, Integer); (42, Integer); (51, Integer); (24, Boolean); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (68, { line = (*Line*)20; col = (*Col*)4; endline = (*EndLine*)20; endcol = (*EndCol*)4 }); (59, { line = (*Line*)16; col = (*Col*)14; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (50, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)16 }); (41, { line = (*Line*)14; col = (*Col*)14; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (62, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (53, { line = (*Line*)15; col = (*Col*)16; endline = (*EndLine*)15; endcol = (*EndCol*)16 }); (44, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)25 }); (26, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (56, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (29, { line = (*Line*)11; col = (*Col*)7; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (38, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (20, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (65, { line = (*Line*)17; col = (*Col*)3; endline = (*EndLine*)17; endcol = (*EndCol*)8 }); (46, { line = (*Line*)14; col = (*Col*)29; endline = (*EndLine*)14; endcol = (*EndCol*)29 }); (58, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (49, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (40, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)10 }); (22, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (16, { line = (*Line*)9; col = (*Col*)14; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (70, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)14 }); (52, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (43, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)29 }); (25, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (34, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)9 }); (61, { line = (*Line*)16; col = (*Col*)14; endline = (*EndLine*)16; endcol = (*EndCol*)14 }); (37, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)29 }); (19, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)20 }); (60, { line = (*Line*)16; col = (*Col*)14; endline = (*EndLine*)16; endcol = (*EndCol*)14 }); (69, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)14 }); (63, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (54, { line = (*Line*)15; col = (*Col*)16; endline = (*EndLine*)15; endcol = (*EndCol*)16 }); (45, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)25 }); (27, { line = (*Line*)10; col = (*Col*)20; endline = (*EndLine*)10; endcol = (*EndCol*)20 }); (57, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (21, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (30, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (39, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)10 }); (66, { line = (*Line*)17; col = (*Col*)13; endline = (*EndLine*)17; endcol = (*EndCol*)13 }); (15, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (42, { line = (*Line*)14; col = (*Col*)14; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (51, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (24, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)20 }); (33, { line = (*Line*)13; col = (*Col*)4; endline = (*EndLine*)13; endcol = (*EndCol*)4 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("N", "ada://parameter/Prime+1:11/N+1:18")); (5, ("I", "ada://variable/Prime+1:11/I+4:4")); (4, ("Result", "ada://variable/Prime+1:11/Result+3:4")); (3, ("R", "ada://parameter/Prime+1:11/R+1:31")); (6, ("T", "ada://variable/Prime+1:11/T+5:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Prime", "ada://procedure_body/Prime+1:11"))];
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
    ((*Prime*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*N*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*R*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (5,
  (ObjDeclRT (6, { declaration_astnumRT = 7; object_nameRT = ((*Result*) 4); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (SeqDeclRT (8,
  (ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*I*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
  (ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*T*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (13,
    (AssignRT (14, (IdentifierRT (15, ((*Result*) 4) , [])), (LiteralRT (16, (Integer_Literal 0) , [], [])))),
    (SeqRT (17,
    (IfRT (18, (BinOpRT (19, Or, (BinOpRT (20, Equal, (NameRT (21, (IdentifierRT (22, ((*N*) 2) , [])))), (LiteralRT (23, (Integer_Literal 1) , [], [])) , [], [])), (BinOpRT (24, Equal, (NameRT (25, (IdentifierRT (26, ((*N*) 2) , [])))), (LiteralRT (27, (Integer_Literal 2) , [], [])) , [], [])) , [], [])),
      (AssignRT (28, (IdentifierRT (29, ((*Result*) 4) , [])), (LiteralRT (30, (Integer_Literal 1) , [], [])))),
      NullRT)
    ),
    (SeqRT (31,
    (AssignRT (32, (IdentifierRT (33, ((*I*) 5) , [])), (LiteralRT (34, (Integer_Literal 2) , [], [])))),
    (SeqRT (35,
    (WhileRT (36, (BinOpRT (37, And, (BinOpRT (38, Less_Than, (NameRT (39, (IdentifierRT (40, ((*I*) 5) , [])))), (NameRT (41, (IdentifierRT (42, ((*N*) 2) , [])))) , [], [])), (BinOpRT (43, Equal, (NameRT (44, (IdentifierRT (45, ((*Result*) 4) , [])))), (LiteralRT (46, (Integer_Literal 0) , [], [])) , [], [])) , [], [])),
      (SeqRT (47,
      (AssignRT (48, (IdentifierRT (49, ((*T*) 6) , [])), (BinOpRT (50, Divide, (NameRT (51, (IdentifierRT (52, ((*N*) 2) , [])))), (NameRT (53, (IdentifierRT (54, ((*I*) 5) , [])))) , [DivCheck; OverflowCheck], [])))),
      (IfRT (55, (BinOpRT (56, Equal, (NameRT (57, (IdentifierRT (58, ((*N*) 2) , [])))), (BinOpRT (59, Multiply, (NameRT (60, (IdentifierRT (61, ((*T*) 6) , [])))), (NameRT (62, (IdentifierRT (63, ((*I*) 5) , [])))) , [OverflowCheck], [])) , [], [])),
        (AssignRT (64, (IdentifierRT (65, ((*Result*) 4) , [])), (LiteralRT (66, (Integer_Literal 1) , [], [])))),
        NullRT)
      ))))
    ),
    (AssignRT (67, (IdentifierRT (68, ((*R*) 3) , [])), (NameRT (69, (IdentifierRT (70, ((*Result*) 4) , []))))))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*I*) 5), (In_Out, Integer)); (((*N*) 2), (In, Integer)); (((*R*) 3), (Out, Integer)); (((*Result*) 4), (In_Out, Integer)); (((*T*) 6), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Prime*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Prime*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*N*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*R*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (5,
(ObjDeclRT (6, { declaration_astnumRT = 7; object_nameRT = ((*Result*) 4); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(SeqDeclRT (8,
(ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*I*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = None })),
(ObjDeclRT (11, { declaration_astnumRT = 12; object_nameRT = ((*T*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (13,
  (AssignRT (14, (IdentifierRT (15, ((*Result*) 4) , [])), (LiteralRT (16, (Integer_Literal 0) , [], [])))),
  (SeqRT (17,
  (IfRT (18, (BinOpRT (19, Or, (BinOpRT (20, Equal, (NameRT (21, (IdentifierRT (22, ((*N*) 2) , [])))), (LiteralRT (23, (Integer_Literal 1) , [], [])) , [], [])), (BinOpRT (24, Equal, (NameRT (25, (IdentifierRT (26, ((*N*) 2) , [])))), (LiteralRT (27, (Integer_Literal 2) , [], [])) , [], [])) , [], [])),
    (AssignRT (28, (IdentifierRT (29, ((*Result*) 4) , [])), (LiteralRT (30, (Integer_Literal 1) , [], [])))),
    NullRT)
  ),
  (SeqRT (31,
  (AssignRT (32, (IdentifierRT (33, ((*I*) 5) , [])), (LiteralRT (34, (Integer_Literal 2) , [], [])))),
  (SeqRT (35,
  (WhileRT (36, (BinOpRT (37, And, (BinOpRT (38, Less_Than, (NameRT (39, (IdentifierRT (40, ((*I*) 5) , [])))), (NameRT (41, (IdentifierRT (42, ((*N*) 2) , [])))) , [], [])), (BinOpRT (43, Equal, (NameRT (44, (IdentifierRT (45, ((*Result*) 4) , [])))), (LiteralRT (46, (Integer_Literal 0) , [], [])) , [], [])) , [], [])),
    (SeqRT (47,
    (AssignRT (48, (IdentifierRT (49, ((*T*) 6) , [])), (BinOpRT (50, Divide, (NameRT (51, (IdentifierRT (52, ((*N*) 2) , [])))), (NameRT (53, (IdentifierRT (54, ((*I*) 5) , [])))) , [DivCheck; OverflowCheck], [])))),
    (IfRT (55, (BinOpRT (56, Equal, (NameRT (57, (IdentifierRT (58, ((*N*) 2) , [])))), (BinOpRT (59, Multiply, (NameRT (60, (IdentifierRT (61, ((*T*) 6) , [])))), (NameRT (62, (IdentifierRT (63, ((*I*) 5) , [])))) , [OverflowCheck], [])) , [], [])),
      (AssignRT (64, (IdentifierRT (65, ((*Result*) 4) , [])), (LiteralRT (66, (Integer_Literal 1) , [], [])))),
      NullRT)
    ))))
  ),
  (AssignRT (67, (IdentifierRT (68, ((*R*) 3) , [])), (NameRT (69, (IdentifierRT (70, ((*Result*) 4) , []))))))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(23, Integer); (68, Integer); (59, Integer); (50, Integer); (41, Integer); (62, Integer); (53, Integer); (44, Integer); (26, Integer); (56, Boolean); (29, Integer); (38, Boolean); (20, Boolean); (65, Integer); (46, Integer); (58, Integer); (49, Integer); (40, Integer); (22, Integer); (16, Integer); (70, Integer); (52, Integer); (43, Boolean); (25, Integer); (34, Integer); (61, Integer); (37, Boolean); (19, Boolean); (60, Integer); (69, Integer); (63, Integer); (54, Integer); (45, Integer); (27, Integer); (57, Integer); (21, Integer); (30, Integer); (39, Integer); (66, Integer); (15, Integer); (42, Integer); (51, Integer); (24, Boolean); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(23, { line = (*Line*)10; col = (*Col*)11; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (68, { line = (*Line*)20; col = (*Col*)4; endline = (*EndLine*)20; endcol = (*EndCol*)4 }); (59, { line = (*Line*)16; col = (*Col*)14; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (50, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)16 }); (41, { line = (*Line*)14; col = (*Col*)14; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (62, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (53, { line = (*Line*)15; col = (*Col*)16; endline = (*EndLine*)15; endcol = (*EndCol*)16 }); (44, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)25 }); (26, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (56, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (29, { line = (*Line*)11; col = (*Col*)7; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (38, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (20, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (65, { line = (*Line*)17; col = (*Col*)3; endline = (*EndLine*)17; endcol = (*EndCol*)8 }); (46, { line = (*Line*)14; col = (*Col*)29; endline = (*EndLine*)14; endcol = (*EndCol*)29 }); (58, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (49, { line = (*Line*)15; col = (*Col*)7; endline = (*EndLine*)15; endcol = (*EndCol*)7 }); (40, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)10 }); (22, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (16, { line = (*Line*)9; col = (*Col*)14; endline = (*EndLine*)9; endcol = (*EndCol*)14 }); (70, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)14 }); (52, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (43, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)29 }); (25, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (34, { line = (*Line*)13; col = (*Col*)9; endline = (*EndLine*)13; endcol = (*EndCol*)9 }); (61, { line = (*Line*)16; col = (*Col*)14; endline = (*EndLine*)16; endcol = (*EndCol*)14 }); (37, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)29 }); (19, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)20 }); (60, { line = (*Line*)16; col = (*Col*)14; endline = (*EndLine*)16; endcol = (*EndCol*)14 }); (69, { line = (*Line*)20; col = (*Col*)9; endline = (*EndLine*)20; endcol = (*EndCol*)14 }); (63, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (54, { line = (*Line*)15; col = (*Col*)16; endline = (*EndLine*)15; endcol = (*EndCol*)16 }); (45, { line = (*Line*)14; col = (*Col*)20; endline = (*EndLine*)14; endcol = (*EndCol*)25 }); (27, { line = (*Line*)10; col = (*Col*)20; endline = (*EndLine*)10; endcol = (*EndCol*)20 }); (57, { line = (*Line*)16; col = (*Col*)10; endline = (*EndLine*)16; endcol = (*EndCol*)10 }); (21, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (30, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)17 }); (39, { line = (*Line*)14; col = (*Col*)10; endline = (*EndLine*)14; endcol = (*EndCol*)10 }); (66, { line = (*Line*)17; col = (*Col*)13; endline = (*EndLine*)17; endcol = (*EndCol*)13 }); (15, { line = (*Line*)9; col = (*Col*)4; endline = (*EndLine*)9; endcol = (*EndCol*)9 }); (42, { line = (*Line*)14; col = (*Col*)14; endline = (*EndLine*)14; endcol = (*EndCol*)14 }); (51, { line = (*Line*)15; col = (*Col*)12; endline = (*EndLine*)15; endcol = (*EndCol*)12 }); (24, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)20 }); (33, { line = (*Line*)13; col = (*Col*)4; endline = (*EndLine*)13; endcol = (*EndCol*)4 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("N", "ada://parameter/Prime+1:11/N+1:18")); (5, ("I", "ada://variable/Prime+1:11/I+4:4")); (4, ("Result", "ada://variable/Prime+1:11/Result+3:4")); (3, ("R", "ada://parameter/Prime+1:11/R+1:31")); (6, ("T", "ada://variable/Prime+1:11/T+5:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Prime", "ada://procedure_body/Prime+1:11"))];
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


