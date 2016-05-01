

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Factorial*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*N*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*M*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (5,
  (ObjDecl (7, { declaration_astnum = 8; object_name = ((*Result*) 5); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (6, (Integer_Literal 1) )))) })),
  (ObjDecl (9, { declaration_astnum = 10; object_name = ((*T*) 6); object_nominal_subtype = Integer; initialization_exp = None }))))],
    (* = = = Procedure Body = = = *)
    (Seq (11,
    (Assign (12, (Identifier (13, ((*T*) 6) )), (Name (14, (Identifier (15, ((*N*) 2) )))))),
    (Seq (16,
    (While (17, (BinOp (18, Greater_Than, (Name (19, (Identifier (20, ((*T*) 6) )))), (Literal (21, (Integer_Literal 0) )) )),
      (Seq (22,
      (Assign (23, (Identifier (24, ((*Result*) 5) )), (BinOp (25, Multiply, (Name (26, (Identifier (27, ((*Result*) 5) )))), (Name (28, (Identifier (29, ((*T*) 6) )))) )))),
      (Assign (30, (Identifier (31, ((*T*) 6) )), (BinOp (32, Minus, (Name (33, (Identifier (34, ((*T*) 6) )))), (Literal (35, (Integer_Literal 1) )) )))))))
    ),
    (Assign (36, (Identifier (37, ((*M*) 3) )), (Name (38, (Identifier (39, ((*Result*) 5) ))))))))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*N*) 2), (In, Integer)); (((*Result*) 5), (In_Out, Integer)); (((*M*) 3), (Out, Integer)); (((*T*) 6), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Factorial*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Factorial*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*N*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*M*) 3); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (5,
(ObjDecl (7, { declaration_astnum = 8; object_name = ((*Result*) 5); object_nominal_subtype = Integer; initialization_exp = (Some ((Literal (6, (Integer_Literal 1) )))) })),
(ObjDecl (9, { declaration_astnum = 10; object_name = ((*T*) 6); object_nominal_subtype = Integer; initialization_exp = None }))))],
  (* = = = Procedure Body = = = *)
  (Seq (11,
  (Assign (12, (Identifier (13, ((*T*) 6) )), (Name (14, (Identifier (15, ((*N*) 2) )))))),
  (Seq (16,
  (While (17, (BinOp (18, Greater_Than, (Name (19, (Identifier (20, ((*T*) 6) )))), (Literal (21, (Integer_Literal 0) )) )),
    (Seq (22,
    (Assign (23, (Identifier (24, ((*Result*) 5) )), (BinOp (25, Multiply, (Name (26, (Identifier (27, ((*Result*) 5) )))), (Name (28, (Identifier (29, ((*T*) 6) )))) )))),
    (Assign (30, (Identifier (31, ((*T*) 6) )), (BinOp (32, Minus, (Name (33, (Identifier (34, ((*T*) 6) )))), (Literal (35, (Integer_Literal 1) )) )))))))
  ),
  (Assign (36, (Identifier (37, ((*M*) 3) )), (Name (38, (Identifier (39, ((*Result*) 5) ))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(32, Integer); (35, Integer); (26, Integer); (38, Integer); (29, Integer); (20, Integer); (14, Integer); (13, Integer); (31, Integer); (34, Integer); (25, Integer); (37, Integer); (19, Integer); (28, Integer); (18, Boolean); (27, Integer); (21, Integer); (39, Integer); (33, Integer); (6, Integer); (15, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(32, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (35, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (26, { line = (*Line*)9; col = (*Col*)17; endline = (*EndLine*)9; endcol = (*EndCol*)22 }); (38, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)14 }); (29, { line = (*Line*)9; col = (*Col*)26; endline = (*EndLine*)9; endcol = (*EndCol*)26 }); (20, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)10 }); (14, { line = (*Line*)7; col = (*Col*)9; endline = (*EndLine*)7; endcol = (*EndCol*)9 }); (13, { line = (*Line*)7; col = (*Col*)4; endline = (*EndLine*)7; endcol = (*EndCol*)4 }); (31, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (34, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (25, { line = (*Line*)9; col = (*Col*)17; endline = (*EndLine*)9; endcol = (*EndCol*)26 }); (37, { line = (*Line*)12; col = (*Col*)4; endline = (*EndLine*)12; endcol = (*EndCol*)4 }); (19, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)10 }); (28, { line = (*Line*)9; col = (*Col*)26; endline = (*EndLine*)9; endcol = (*EndCol*)26 }); (18, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)14 }); (27, { line = (*Line*)9; col = (*Col*)17; endline = (*EndLine*)9; endcol = (*EndCol*)22 }); (21, { line = (*Line*)8; col = (*Col*)14; endline = (*EndLine*)8; endcol = (*EndCol*)14 }); (39, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)14 }); (33, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (6, { line = (*Line*)3; col = (*Col*)23; endline = (*EndLine*)3; endcol = (*EndCol*)23 }); (15, { line = (*Line*)7; col = (*Col*)9; endline = (*EndLine*)7; endcol = (*EndCol*)9 }); (24, { line = (*Line*)9; col = (*Col*)7; endline = (*EndLine*)9; endcol = (*EndCol*)12 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("N", "ada://parameter/Factorial+1:11/N+1:22")); (5, ("Result", "ada://variable/Factorial+1:11/Result+3:4")); (3, ("M", "ada://parameter/Factorial+1:11/M+1:35")); (6, ("T", "ada://variable/Factorial+1:11/T+4:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Factorial", "ada://procedure_body/Factorial+1:11"))];
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
    ((*Factorial*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*N*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*M*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (5,
  (ObjDeclRT (7, { declaration_astnumRT = 8; object_nameRT = ((*Result*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (6, (Integer_Literal 1) , [], [])))) })),
  (ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*T*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))],
    (* = = = Procedure Body = = = *)
    (SeqRT (11,
    (AssignRT (12, (IdentifierRT (13, ((*T*) 6) , [])), (NameRT (14, (IdentifierRT (15, ((*N*) 2) , [])))))),
    (SeqRT (16,
    (WhileRT (17, (BinOpRT (18, Greater_Than, (NameRT (19, (IdentifierRT (20, ((*T*) 6) , [])))), (LiteralRT (21, (Integer_Literal 0) , [], [])) , [], [])),
      (SeqRT (22,
      (AssignRT (23, (IdentifierRT (24, ((*Result*) 5) , [])), (BinOpRT (25, Multiply, (NameRT (26, (IdentifierRT (27, ((*Result*) 5) , [])))), (NameRT (28, (IdentifierRT (29, ((*T*) 6) , [])))) , [OverflowCheck], [])))),
      (AssignRT (30, (IdentifierRT (31, ((*T*) 6) , [])), (BinOpRT (32, Minus, (NameRT (33, (IdentifierRT (34, ((*T*) 6) , [])))), (LiteralRT (35, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))
    ),
    (AssignRT (36, (IdentifierRT (37, ((*M*) 3) , [])), (NameRT (38, (IdentifierRT (39, ((*Result*) 5) , []))))))))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*N*) 2), (In, Integer)); (((*Result*) 5), (In_Out, Integer)); (((*M*) 3), (Out, Integer)); (((*T*) 6), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Factorial*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Factorial*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*N*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*M*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (5,
(ObjDeclRT (7, { declaration_astnumRT = 8; object_nameRT = ((*Result*) 5); object_nominal_subtypeRT = Integer; initialization_expRT = (Some ((LiteralRT (6, (Integer_Literal 1) , [], [])))) })),
(ObjDeclRT (9, { declaration_astnumRT = 10; object_nameRT = ((*T*) 6); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))],
  (* = = = Procedure Body = = = *)
  (SeqRT (11,
  (AssignRT (12, (IdentifierRT (13, ((*T*) 6) , [])), (NameRT (14, (IdentifierRT (15, ((*N*) 2) , [])))))),
  (SeqRT (16,
  (WhileRT (17, (BinOpRT (18, Greater_Than, (NameRT (19, (IdentifierRT (20, ((*T*) 6) , [])))), (LiteralRT (21, (Integer_Literal 0) , [], [])) , [], [])),
    (SeqRT (22,
    (AssignRT (23, (IdentifierRT (24, ((*Result*) 5) , [])), (BinOpRT (25, Multiply, (NameRT (26, (IdentifierRT (27, ((*Result*) 5) , [])))), (NameRT (28, (IdentifierRT (29, ((*T*) 6) , [])))) , [OverflowCheck], [])))),
    (AssignRT (30, (IdentifierRT (31, ((*T*) 6) , [])), (BinOpRT (32, Minus, (NameRT (33, (IdentifierRT (34, ((*T*) 6) , [])))), (LiteralRT (35, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))))))
  ),
  (AssignRT (36, (IdentifierRT (37, ((*M*) 3) , [])), (NameRT (38, (IdentifierRT (39, ((*Result*) 5) , []))))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(32, Integer); (35, Integer); (26, Integer); (38, Integer); (29, Integer); (20, Integer); (14, Integer); (13, Integer); (31, Integer); (34, Integer); (25, Integer); (37, Integer); (19, Integer); (28, Integer); (18, Boolean); (27, Integer); (21, Integer); (39, Integer); (33, Integer); (6, Integer); (15, Integer); (24, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(32, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (35, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (26, { line = (*Line*)9; col = (*Col*)17; endline = (*EndLine*)9; endcol = (*EndCol*)22 }); (38, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)14 }); (29, { line = (*Line*)9; col = (*Col*)26; endline = (*EndLine*)9; endcol = (*EndCol*)26 }); (20, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)10 }); (14, { line = (*Line*)7; col = (*Col*)9; endline = (*EndLine*)7; endcol = (*EndCol*)9 }); (13, { line = (*Line*)7; col = (*Col*)4; endline = (*EndLine*)7; endcol = (*EndCol*)4 }); (31, { line = (*Line*)10; col = (*Col*)7; endline = (*EndLine*)10; endcol = (*EndCol*)7 }); (34, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (25, { line = (*Line*)9; col = (*Col*)17; endline = (*EndLine*)9; endcol = (*EndCol*)26 }); (37, { line = (*Line*)12; col = (*Col*)4; endline = (*EndLine*)12; endcol = (*EndCol*)4 }); (19, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)10 }); (28, { line = (*Line*)9; col = (*Col*)26; endline = (*EndLine*)9; endcol = (*EndCol*)26 }); (18, { line = (*Line*)8; col = (*Col*)10; endline = (*EndLine*)8; endcol = (*EndCol*)14 }); (27, { line = (*Line*)9; col = (*Col*)17; endline = (*EndLine*)9; endcol = (*EndCol*)22 }); (21, { line = (*Line*)8; col = (*Col*)14; endline = (*EndLine*)8; endcol = (*EndCol*)14 }); (39, { line = (*Line*)12; col = (*Col*)9; endline = (*EndLine*)12; endcol = (*EndCol*)14 }); (33, { line = (*Line*)10; col = (*Col*)12; endline = (*EndLine*)10; endcol = (*EndCol*)12 }); (6, { line = (*Line*)3; col = (*Col*)23; endline = (*EndLine*)3; endcol = (*EndCol*)23 }); (15, { line = (*Line*)7; col = (*Col*)9; endline = (*EndLine*)7; endcol = (*EndCol*)9 }); (24, { line = (*Line*)9; col = (*Col*)7; endline = (*EndLine*)9; endcol = (*EndCol*)12 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("N", "ada://parameter/Factorial+1:11/N+1:22")); (5, ("Result", "ada://variable/Factorial+1:11/Result+3:4")); (3, ("M", "ada://parameter/Factorial+1:11/M+1:35")); (6, ("T", "ada://variable/Factorial+1:11/T+4:4"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Factorial", "ada://procedure_body/Factorial+1:11"))];
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


