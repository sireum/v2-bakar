

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Division_By_Non_Zero*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*X*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDecl (4,
  (TypeDecl (5, (SubtypeDecl (6, ((*T1*) 3), Integer, (Range (0, 10)))))),
  (SeqDecl (7,
  (ProcBodyDecl (8, 
    mkprocBodyDecl (
     9,
      (* = = = Procedure Name = = = *)
      ((*Divide*) 4),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnum = 10; parameter_name = ((*X*) 5); parameter_subtype_mark = Integer; parameter_mode = In }; 
    { parameter_astnum = 11; parameter_name = ((*Y*) 6); parameter_subtype_mark = (Subtype ((*T1*) 3)); parameter_mode = In }; 
    { parameter_astnum = 12; parameter_name = ((*Z*) 7); parameter_subtype_mark = Integer; parameter_mode = Out }],
      (* = = = Object Declarations = = = *)
      [NullDecl],
      (* = = = Procedure Body = = = *)
      (Assign (13, (Identifier (14, ((*Z*) 7) )), (BinOp (15, Divide, (Name (16, (Identifier (17, ((*X*) 5) )))), (BinOp (18, Plus, (Name (19, (Identifier (20, ((*Y*) 6) )))), (Literal (21, (Integer_Literal 1) )) )) ))))
    ))
  ),
  (ObjDecl (22, { declaration_astnum = 23; object_name = ((*Result*) 10); object_nominal_subtype = Integer; initialization_exp = None }))))))],
    (* = = = Procedure Body = = = *)
    (Call (24, 25, ((*Divide*) 4), 
      [(Name (26, (Identifier (27, ((*X*) 2) )))); (Literal (28, (Integer_Literal 8) )); (Name (29, (Identifier (30, ((*Result*) 10) ))))])
    )
  ))
);
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 5), (In, Integer)); (((*Result*) 10), (In_Out, Integer)); (((*X*) 2), (In_Out, Integer)); (((*Z*) 7), (Out, Integer)); (((*Y*) 6), (In, (Subtype ((*T1*) 3))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Division_By_Non_Zero*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Division_By_Non_Zero*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*X*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDecl (4,
(TypeDecl (5, (SubtypeDecl (6, ((*T1*) 3), Integer, (Range (0, 10)))))),
(SeqDecl (7,
(ProcBodyDecl (8, 
  mkprocBodyDecl (
   9,
    (* = = = Procedure Name = = = *)
    ((*Divide*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 10; parameter_name = ((*X*) 5); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 11; parameter_name = ((*Y*) 6); parameter_subtype_mark = (Subtype ((*T1*) 3)); parameter_mode = In }; 
  { parameter_astnum = 12; parameter_name = ((*Z*) 7); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [NullDecl],
    (* = = = Procedure Body = = = *)
    (Assign (13, (Identifier (14, ((*Z*) 7) )), (BinOp (15, Divide, (Name (16, (Identifier (17, ((*X*) 5) )))), (BinOp (18, Plus, (Name (19, (Identifier (20, ((*Y*) 6) )))), (Literal (21, (Integer_Literal 1) )) )) ))))
  ))
),
(ObjDecl (22, { declaration_astnum = 23; object_name = ((*Result*) 10); object_nominal_subtype = Integer; initialization_exp = None }))))))],
  (* = = = Procedure Body = = = *)
  (Call (24, 25, ((*Divide*) 4), 
    [(Name (26, (Identifier (27, ((*X*) 2) )))); (Literal (28, (Integer_Literal 8) )); (Name (29, (Identifier (30, ((*Result*) 10) ))))])
  )
))); (((*Divide*) 4), (1, mkprocBodyDecl (
 9,
  (* = = = Procedure Name = = = *)
  ((*Divide*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 10; parameter_name = ((*X*) 5); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 11; parameter_name = ((*Y*) 6); parameter_subtype_mark = (Subtype ((*T1*) 3)); parameter_mode = In }; 
{ parameter_astnum = 12; parameter_name = ((*Z*) 7); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [NullDecl],
  (* = = = Procedure Body = = = *)
  (Assign (13, (Identifier (14, ((*Z*) 7) )), (BinOp (15, Divide, (Name (16, (Identifier (17, ((*X*) 5) )))), (BinOp (18, Plus, (Name (19, (Identifier (20, ((*Y*) 6) )))), (Literal (21, (Integer_Literal 1) )) )) ))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*T1*) 3), (SubtypeDecl (6, ((*T1*) 3), Integer, (Range (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(17, Integer); (26, Integer); (29, Integer); (20, (Subtype ((*T1*) 3))); (14, Integer); (16, Integer); (19, (Subtype ((*T1*) 3))); (28, Integer); (18, Integer); (27, Integer); (21, Integer); (30, Integer); (15, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(17, { line = (*Line*)6; col = (*Col*)12; endline = (*EndLine*)6; endcol = (*EndCol*)12 }); (26, { line = (*Line*)11; col = (*Col*)11; endline = (*EndLine*)11; endcol = (*EndCol*)11 }); (29, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)22 }); (20, { line = (*Line*)6; col = (*Col*)17; endline = (*EndLine*)6; endcol = (*EndCol*)17 }); (14, { line = (*Line*)6; col = (*Col*)7; endline = (*EndLine*)6; endcol = (*EndCol*)7 }); (16, { line = (*Line*)6; col = (*Col*)12; endline = (*EndLine*)6; endcol = (*EndCol*)12 }); (19, { line = (*Line*)6; col = (*Col*)17; endline = (*EndLine*)6; endcol = (*EndCol*)17 }); (28, { line = (*Line*)11; col = (*Col*)14; endline = (*EndLine*)11; endcol = (*EndCol*)14 }); (18, { line = (*Line*)6; col = (*Col*)17; endline = (*EndLine*)6; endcol = (*EndCol*)21 }); (27, { line = (*Line*)11; col = (*Col*)11; endline = (*EndLine*)11; endcol = (*EndCol*)11 }); (21, { line = (*Line*)6; col = (*Col*)21; endline = (*EndLine*)6; endcol = (*EndCol*)21 }); (30, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)22 }); (15, { line = (*Line*)6; col = (*Col*)12; endline = (*EndLine*)6; endcol = (*EndCol*)22 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("X", "ada://parameter/Division_By_Non_Zero+1:11/X+1:33")); (5, ("X", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/X+4:22")); (7, ("Z", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Z+4:47")); (10, ("Result", "ada://variable/Division_By_Non_Zero+1:11/Result+9:4")); (6, ("Y", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Y+4:37"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(4, ("Divide", "ada://procedure_body/Division_By_Non_Zero+1:11/Divide+4:14")); (1, ("Division_By_Non_Zero", "ada://procedure_body/Division_By_Non_Zero+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(3, ("T1", "ada://subtype/Division_By_Non_Zero+1:11/T1+2:12"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Division_By_Non_Zero*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*X*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    [(SeqDeclRT (4,
  (TypeDeclRT (5, (SubtypeDeclRT (6, ((*T1*) 3), Integer, (RangeRT (0, 10)))))),
  (SeqDeclRT (7,
  (ProcBodyDeclRT (8, 
    mkprocBodyDeclRT (
     9,
      (* = = = Procedure Name = = = *)
      ((*Divide*) 4),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnumRT = 10; parameter_nameRT = ((*X*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
    { parameter_astnumRT = 11; parameter_nameRT = ((*Y*) 6); parameter_subtype_markRT = (Subtype ((*T1*) 3)); parameter_modeRT = In }; 
    { parameter_astnumRT = 12; parameter_nameRT = ((*Z*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
      (* = = = Object Declarations = = = *)
      [NullDeclRT],
      (* = = = Procedure Body = = = *)
      (AssignRT (13, (IdentifierRT (14, ((*Z*) 7) , [])), (BinOpRT (15, Divide, (NameRT (16, (IdentifierRT (17, ((*X*) 5) , [])))), (BinOpRT (18, Plus, (NameRT (19, (IdentifierRT (20, ((*Y*) 6) , [])))), (LiteralRT (21, (Integer_Literal 1) , [], [])) , [], [])) , [DivCheck], []))))
    ))
  ),
  (ObjDeclRT (22, { declaration_astnumRT = 23; object_nameRT = ((*Result*) 10); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))))],
    (* = = = Procedure Body = = = *)
    (CallRT (24, 25, ((*Divide*) 4), 
      [(NameRT (26, (IdentifierRT (27, ((*X*) 2) , [])))); (LiteralRT (28, (Integer_Literal 8) , [], [])); (NameRT (29, (IdentifierRT (30, ((*Result*) 10) , []))))])
    )
  ))
);
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 5), (In, Integer)); (((*Result*) 10), (In_Out, Integer)); (((*X*) 2), (In_Out, Integer)); (((*Z*) 7), (Out, Integer)); (((*Y*) 6), (In, (Subtype ((*T1*) 3))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Division_By_Non_Zero*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Division_By_Non_Zero*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*X*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  [(SeqDeclRT (4,
(TypeDeclRT (5, (SubtypeDeclRT (6, ((*T1*) 3), Integer, (RangeRT (0, 10)))))),
(SeqDeclRT (7,
(ProcBodyDeclRT (8, 
  mkprocBodyDeclRT (
   9,
    (* = = = Procedure Name = = = *)
    ((*Divide*) 4),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 10; parameter_nameRT = ((*X*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 11; parameter_nameRT = ((*Y*) 6); parameter_subtype_markRT = (Subtype ((*T1*) 3)); parameter_modeRT = In }; 
  { parameter_astnumRT = 12; parameter_nameRT = ((*Z*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [NullDeclRT],
    (* = = = Procedure Body = = = *)
    (AssignRT (13, (IdentifierRT (14, ((*Z*) 7) , [])), (BinOpRT (15, Divide, (NameRT (16, (IdentifierRT (17, ((*X*) 5) , [])))), (BinOpRT (18, Plus, (NameRT (19, (IdentifierRT (20, ((*Y*) 6) , [])))), (LiteralRT (21, (Integer_Literal 1) , [], [])) , [], [])) , [DivCheck], []))))
  ))
),
(ObjDeclRT (22, { declaration_astnumRT = 23; object_nameRT = ((*Result*) 10); object_nominal_subtypeRT = Integer; initialization_expRT = None }))))))],
  (* = = = Procedure Body = = = *)
  (CallRT (24, 25, ((*Divide*) 4), 
    [(NameRT (26, (IdentifierRT (27, ((*X*) 2) , [])))); (LiteralRT (28, (Integer_Literal 8) , [], [])); (NameRT (29, (IdentifierRT (30, ((*Result*) 10) , []))))])
  )
))); (((*Divide*) 4), (1, mkprocBodyDeclRT (
 9,
  (* = = = Procedure Name = = = *)
  ((*Divide*) 4),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 10; parameter_nameRT = ((*X*) 5); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 11; parameter_nameRT = ((*Y*) 6); parameter_subtype_markRT = (Subtype ((*T1*) 3)); parameter_modeRT = In }; 
{ parameter_astnumRT = 12; parameter_nameRT = ((*Z*) 7); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [NullDeclRT],
  (* = = = Procedure Body = = = *)
  (AssignRT (13, (IdentifierRT (14, ((*Z*) 7) , [])), (BinOpRT (15, Divide, (NameRT (16, (IdentifierRT (17, ((*X*) 5) , [])))), (BinOpRT (18, Plus, (NameRT (19, (IdentifierRT (20, ((*Y*) 6) , [])))), (LiteralRT (21, (Integer_Literal 1) , [], [])) , [], [])) , [DivCheck], []))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*T1*) 3), (SubtypeDeclRT (6, ((*T1*) 3), Integer, (RangeRT (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(17, Integer); (26, Integer); (29, Integer); (20, (Subtype ((*T1*) 3))); (14, Integer); (16, Integer); (19, (Subtype ((*T1*) 3))); (28, Integer); (18, Integer); (27, Integer); (21, Integer); (30, Integer); (15, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(17, { line = (*Line*)6; col = (*Col*)12; endline = (*EndLine*)6; endcol = (*EndCol*)12 }); (26, { line = (*Line*)11; col = (*Col*)11; endline = (*EndLine*)11; endcol = (*EndCol*)11 }); (29, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)22 }); (20, { line = (*Line*)6; col = (*Col*)17; endline = (*EndLine*)6; endcol = (*EndCol*)17 }); (14, { line = (*Line*)6; col = (*Col*)7; endline = (*EndLine*)6; endcol = (*EndCol*)7 }); (16, { line = (*Line*)6; col = (*Col*)12; endline = (*EndLine*)6; endcol = (*EndCol*)12 }); (19, { line = (*Line*)6; col = (*Col*)17; endline = (*EndLine*)6; endcol = (*EndCol*)17 }); (28, { line = (*Line*)11; col = (*Col*)14; endline = (*EndLine*)11; endcol = (*EndCol*)14 }); (18, { line = (*Line*)6; col = (*Col*)17; endline = (*EndLine*)6; endcol = (*EndCol*)21 }); (27, { line = (*Line*)11; col = (*Col*)11; endline = (*EndLine*)11; endcol = (*EndCol*)11 }); (21, { line = (*Line*)6; col = (*Col*)21; endline = (*EndLine*)6; endcol = (*EndCol*)21 }); (30, { line = (*Line*)11; col = (*Col*)17; endline = (*EndLine*)11; endcol = (*EndCol*)22 }); (15, { line = (*Line*)6; col = (*Col*)12; endline = (*EndLine*)6; endcol = (*EndCol*)22 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("X", "ada://parameter/Division_By_Non_Zero+1:11/X+1:33")); (5, ("X", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/X+4:22")); (7, ("Z", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Z+4:47")); (10, ("Result", "ada://variable/Division_By_Non_Zero+1:11/Result+9:4")); (6, ("Y", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Y+4:37"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(4, ("Divide", "ada://procedure_body/Division_By_Non_Zero+1:11/Divide+4:14")); (1, ("Division_By_Non_Zero", "ada://procedure_body/Division_By_Non_Zero+1:11"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(3, ("T1", "ada://subtype/Division_By_Non_Zero+1:11/T1+2:12"))]
})
}


