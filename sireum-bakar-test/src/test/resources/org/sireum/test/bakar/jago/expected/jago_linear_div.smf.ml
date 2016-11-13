

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Linear_Div*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*Dividend*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 4; parameter_name = ((*Divisor*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 5; parameter_name = ((*Quotient*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }; 
  { parameter_astnum = 6; parameter_name = ((*Remainder*) 5); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Seq (7,
    (Assign (8, (Identifier (9, ((*Quotient*) 4) )), (Literal (10, (Integer_Literal 0) )))),
    (Seq (11,
    (Assign (12, (Identifier (13, ((*Remainder*) 5) )), (Name (14, (Identifier (15, ((*Dividend*) 2) )))))),
    (While (16, (BinOp (17, Greater_Than_Or_Equal, (Name (18, (Identifier (19, ((*Remainder*) 5) )))), (Name (20, (Identifier (21, ((*Divisor*) 3) )))) )),
      (Seq (22,
      (Assign (23, (Identifier (24, ((*Quotient*) 4) )), (BinOp (25, Plus, (Name (26, (Identifier (27, ((*Quotient*) 4) )))), (Literal (28, (Integer_Literal 1) )) )))),
      (Seq (29,
      (Assign (30, (Identifier (31, ((*Quotient*) 4) )), (BinOp (32, Plus, (Name (33, (Identifier (34, ((*Quotient*) 4) )))), (Literal (35, (Integer_Literal 1) )) )))),
      (Assign (36, (Identifier (37, ((*Remainder*) 5) )), (BinOp (38, Minus, (Name (39, (Identifier (40, ((*Remainder*) 5) )))), (Name (41, (Identifier (42, ((*Divisor*) 3) )))) )))))))))
    )))))
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Quotient*) 4), (Out, Integer)); (((*Dividend*) 2), (In, Integer)); (((*Remainder*) 5), (Out, Integer)); (((*Divisor*) 3), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Linear_Div*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Linear_Div*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*Dividend*) 2); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 4; parameter_name = ((*Divisor*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 5; parameter_name = ((*Quotient*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }; 
{ parameter_astnum = 6; parameter_name = ((*Remainder*) 5); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Seq (7,
  (Assign (8, (Identifier (9, ((*Quotient*) 4) )), (Literal (10, (Integer_Literal 0) )))),
  (Seq (11,
  (Assign (12, (Identifier (13, ((*Remainder*) 5) )), (Name (14, (Identifier (15, ((*Dividend*) 2) )))))),
  (While (16, (BinOp (17, Greater_Than_Or_Equal, (Name (18, (Identifier (19, ((*Remainder*) 5) )))), (Name (20, (Identifier (21, ((*Divisor*) 3) )))) )),
    (Seq (22,
    (Assign (23, (Identifier (24, ((*Quotient*) 4) )), (BinOp (25, Plus, (Name (26, (Identifier (27, ((*Quotient*) 4) )))), (Literal (28, (Integer_Literal 1) )) )))),
    (Seq (29,
    (Assign (30, (Identifier (31, ((*Quotient*) 4) )), (BinOp (32, Plus, (Name (33, (Identifier (34, ((*Quotient*) 4) )))), (Literal (35, (Integer_Literal 1) )) )))),
    (Assign (36, (Identifier (37, ((*Remainder*) 5) )), (BinOp (38, Minus, (Name (39, (Identifier (40, ((*Remainder*) 5) )))), (Name (41, (Identifier (42, ((*Divisor*) 3) )))) )))))))))
  )))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(32, Integer); (41, Integer); (17, Boolean); (35, Integer); (26, Integer); (38, Integer); (20, Integer); (14, Integer); (40, Integer); (13, Integer); (31, Integer); (25, Integer); (34, Integer); (10, Integer); (37, Integer); (19, Integer); (28, Integer); (18, Integer); (9, Integer); (27, Integer); (21, Integer); (39, Integer); (42, Integer); (15, Integer); (24, Integer); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(32, { line = (*Line*)18; col = (*Col*)19; endline = (*EndLine*)18; endcol = (*EndCol*)30 }); (41, { line = (*Line*)19; col = (*Col*)32; endline = (*EndLine*)19; endcol = (*EndCol*)38 }); (17, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)29 }); (35, { line = (*Line*)18; col = (*Col*)30; endline = (*EndLine*)18; endcol = (*EndCol*)30 }); (26, { line = (*Line*)17; col = (*Col*)19; endline = (*EndLine*)17; endcol = (*EndCol*)26 }); (38, { line = (*Line*)19; col = (*Col*)20; endline = (*EndLine*)19; endcol = (*EndCol*)38 }); (20, { line = (*Line*)12; col = (*Col*)23; endline = (*EndLine*)12; endcol = (*EndCol*)29 }); (14, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)24 }); (40, { line = (*Line*)19; col = (*Col*)20; endline = (*EndLine*)19; endcol = (*EndCol*)28 }); (13, { line = (*Line*)11; col = (*Col*)4; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (31, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)14 }); (25, { line = (*Line*)17; col = (*Col*)19; endline = (*EndLine*)17; endcol = (*EndCol*)30 }); (34, { line = (*Line*)18; col = (*Col*)19; endline = (*EndLine*)18; endcol = (*EndCol*)26 }); (10, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (37, { line = (*Line*)19; col = (*Col*)7; endline = (*EndLine*)19; endcol = (*EndCol*)15 }); (19, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (28, { line = (*Line*)17; col = (*Col*)30; endline = (*EndLine*)17; endcol = (*EndCol*)30 }); (18, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (9, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (27, { line = (*Line*)17; col = (*Col*)19; endline = (*EndLine*)17; endcol = (*EndCol*)26 }); (21, { line = (*Line*)12; col = (*Col*)23; endline = (*EndLine*)12; endcol = (*EndCol*)29 }); (39, { line = (*Line*)19; col = (*Col*)20; endline = (*EndLine*)19; endcol = (*EndCol*)28 }); (42, { line = (*Line*)19; col = (*Col*)32; endline = (*EndLine*)19; endcol = (*EndCol*)38 }); (15, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)24 }); (24, { line = (*Line*)17; col = (*Col*)7; endline = (*EndLine*)17; endcol = (*EndCol*)14 }); (33, { line = (*Line*)18; col = (*Col*)19; endline = (*EndLine*)18; endcol = (*EndCol*)26 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("Dividend", "ada://parameter/Linear_Div+1:11/Dividend+1:23")); (5, ("Remainder", "ada://parameter/Linear_Div+1:11/Remainder+2:66")); (4, ("Quotient", "ada://parameter/Linear_Div+1:11/Quotient+2:42")); (3, ("Divisor", "ada://parameter/Linear_Div+1:11/Divisor+2:23"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Linear_Div", "ada://procedure_body/Linear_Div+1:11"))];
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
    ((*Linear_Div*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*Dividend*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 4; parameter_nameRT = ((*Divisor*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 5; parameter_nameRT = ((*Quotient*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }; 
  { parameter_astnumRT = 6; parameter_nameRT = ((*Remainder*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (SeqRT (7,
    (AssignRT (8, (IdentifierRT (9, ((*Quotient*) 4) , [])), (LiteralRT (10, (Integer_Literal 0) , [], [])))),
    (SeqRT (11,
    (AssignRT (12, (IdentifierRT (13, ((*Remainder*) 5) , [])), (NameRT (14, (IdentifierRT (15, ((*Dividend*) 2) , [])))))),
    (WhileRT (16, (BinOpRT (17, Greater_Than_Or_Equal, (NameRT (18, (IdentifierRT (19, ((*Remainder*) 5) , [])))), (NameRT (20, (IdentifierRT (21, ((*Divisor*) 3) , [])))) , [], [])),
      (SeqRT (22,
      (AssignRT (23, (IdentifierRT (24, ((*Quotient*) 4) , [])), (BinOpRT (25, Plus, (NameRT (26, (IdentifierRT (27, ((*Quotient*) 4) , [])))), (LiteralRT (28, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
      (SeqRT (29,
      (AssignRT (30, (IdentifierRT (31, ((*Quotient*) 4) , [])), (BinOpRT (32, Plus, (NameRT (33, (IdentifierRT (34, ((*Quotient*) 4) , [])))), (LiteralRT (35, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
      (AssignRT (36, (IdentifierRT (37, ((*Remainder*) 5) , [])), (BinOpRT (38, Minus, (NameRT (39, (IdentifierRT (40, ((*Remainder*) 5) , [])))), (NameRT (41, (IdentifierRT (42, ((*Divisor*) 3) , [])))) , [OverflowCheck], [])))))))))
    )))))
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*Quotient*) 4), (Out, Integer)); (((*Dividend*) 2), (In, Integer)); (((*Remainder*) 5), (Out, Integer)); (((*Divisor*) 3), (In, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Linear_Div*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Linear_Div*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*Dividend*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 4; parameter_nameRT = ((*Divisor*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 5; parameter_nameRT = ((*Quotient*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }; 
{ parameter_astnumRT = 6; parameter_nameRT = ((*Remainder*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (SeqRT (7,
  (AssignRT (8, (IdentifierRT (9, ((*Quotient*) 4) , [])), (LiteralRT (10, (Integer_Literal 0) , [], [])))),
  (SeqRT (11,
  (AssignRT (12, (IdentifierRT (13, ((*Remainder*) 5) , [])), (NameRT (14, (IdentifierRT (15, ((*Dividend*) 2) , [])))))),
  (WhileRT (16, (BinOpRT (17, Greater_Than_Or_Equal, (NameRT (18, (IdentifierRT (19, ((*Remainder*) 5) , [])))), (NameRT (20, (IdentifierRT (21, ((*Divisor*) 3) , [])))) , [], [])),
    (SeqRT (22,
    (AssignRT (23, (IdentifierRT (24, ((*Quotient*) 4) , [])), (BinOpRT (25, Plus, (NameRT (26, (IdentifierRT (27, ((*Quotient*) 4) , [])))), (LiteralRT (28, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    (SeqRT (29,
    (AssignRT (30, (IdentifierRT (31, ((*Quotient*) 4) , [])), (BinOpRT (32, Plus, (NameRT (33, (IdentifierRT (34, ((*Quotient*) 4) , [])))), (LiteralRT (35, (Integer_Literal 1) , [], [])) , [OverflowCheck], [])))),
    (AssignRT (36, (IdentifierRT (37, ((*Remainder*) 5) , [])), (BinOpRT (38, Minus, (NameRT (39, (IdentifierRT (40, ((*Remainder*) 5) , [])))), (NameRT (41, (IdentifierRT (42, ((*Divisor*) 3) , [])))) , [OverflowCheck], [])))))))))
  )))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(32, Integer); (41, Integer); (17, Boolean); (35, Integer); (26, Integer); (38, Integer); (20, Integer); (14, Integer); (40, Integer); (13, Integer); (31, Integer); (25, Integer); (34, Integer); (10, Integer); (37, Integer); (19, Integer); (28, Integer); (18, Integer); (9, Integer); (27, Integer); (21, Integer); (39, Integer); (42, Integer); (15, Integer); (24, Integer); (33, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(32, { line = (*Line*)18; col = (*Col*)19; endline = (*EndLine*)18; endcol = (*EndCol*)30 }); (41, { line = (*Line*)19; col = (*Col*)32; endline = (*EndLine*)19; endcol = (*EndCol*)38 }); (17, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)29 }); (35, { line = (*Line*)18; col = (*Col*)30; endline = (*EndLine*)18; endcol = (*EndCol*)30 }); (26, { line = (*Line*)17; col = (*Col*)19; endline = (*EndLine*)17; endcol = (*EndCol*)26 }); (38, { line = (*Line*)19; col = (*Col*)20; endline = (*EndLine*)19; endcol = (*EndCol*)38 }); (20, { line = (*Line*)12; col = (*Col*)23; endline = (*EndLine*)12; endcol = (*EndCol*)29 }); (14, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)24 }); (40, { line = (*Line*)19; col = (*Col*)20; endline = (*EndLine*)19; endcol = (*EndCol*)28 }); (13, { line = (*Line*)11; col = (*Col*)4; endline = (*EndLine*)11; endcol = (*EndCol*)12 }); (31, { line = (*Line*)18; col = (*Col*)7; endline = (*EndLine*)18; endcol = (*EndCol*)14 }); (25, { line = (*Line*)17; col = (*Col*)19; endline = (*EndLine*)17; endcol = (*EndCol*)30 }); (34, { line = (*Line*)18; col = (*Col*)19; endline = (*EndLine*)18; endcol = (*EndCol*)26 }); (10, { line = (*Line*)10; col = (*Col*)16; endline = (*EndLine*)10; endcol = (*EndCol*)16 }); (37, { line = (*Line*)19; col = (*Col*)7; endline = (*EndLine*)19; endcol = (*EndCol*)15 }); (19, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (28, { line = (*Line*)17; col = (*Col*)30; endline = (*EndLine*)17; endcol = (*EndCol*)30 }); (18, { line = (*Line*)12; col = (*Col*)10; endline = (*EndLine*)12; endcol = (*EndCol*)18 }); (9, { line = (*Line*)10; col = (*Col*)4; endline = (*EndLine*)10; endcol = (*EndCol*)11 }); (27, { line = (*Line*)17; col = (*Col*)19; endline = (*EndLine*)17; endcol = (*EndCol*)26 }); (21, { line = (*Line*)12; col = (*Col*)23; endline = (*EndLine*)12; endcol = (*EndCol*)29 }); (39, { line = (*Line*)19; col = (*Col*)20; endline = (*EndLine*)19; endcol = (*EndCol*)28 }); (42, { line = (*Line*)19; col = (*Col*)32; endline = (*EndLine*)19; endcol = (*EndCol*)38 }); (15, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)24 }); (24, { line = (*Line*)17; col = (*Col*)7; endline = (*EndLine*)17; endcol = (*EndCol*)14 }); (33, { line = (*Line*)18; col = (*Col*)19; endline = (*EndLine*)18; endcol = (*EndCol*)26 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("Dividend", "ada://parameter/Linear_Div+1:11/Dividend+1:23")); (5, ("Remainder", "ada://parameter/Linear_Div+1:11/Remainder+2:66")); (4, ("Quotient", "ada://parameter/Linear_Div+1:11/Quotient+2:42")); (3, ("Divisor", "ada://parameter/Linear_Div+1:11/Divisor+2:23"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Linear_Div", "ada://procedure_body/Linear_Div+1:11"))];
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


