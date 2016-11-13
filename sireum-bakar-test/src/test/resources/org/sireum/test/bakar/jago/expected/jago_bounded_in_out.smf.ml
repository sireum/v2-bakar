

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (ProcBodyDecl (1, 
  mkprocBodyDecl (
   2,
    (* = = = Procedure Name = = = *)
    ((*Bounded_In_Out*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 3; parameter_name = ((*V*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
    (* = = = Object Declarations = = = *)
    (SeqDecl (4,
    (TypeDecl (5, (SubtypeDecl (6, ((*T1*) 3), Integer, (Range (0, 10)))))),
    (SeqDecl (7,
    (TypeDecl (8, (SubtypeDecl (9, ((*T2*) 4), Integer, (Range (5, 15)))))),
    (SeqDecl (10,
    (ProcBodyDecl (11, 
      mkprocBodyDecl (
       12,
        (* = = = Procedure Name = = = *)
        ((*Decrease*) 5),
        (* = = = Formal Parameters = = = *)
        [{ parameter_astnum = 13; parameter_name = ((*X*) 6); parameter_subtype_mark = (Subtype ((*T1*) 3)); parameter_mode = In_Out }],
        (* = = = Object Declarations = = = *)
        NullDecl,
        (* = = = Procedure Body = = = *)
        (Assign (14, (Identifier (15, ((*X*) 6) )), (BinOp (16, Minus, (Name (17, (Identifier (18, ((*X*) 6) )))), (Literal (19, (Integer_Literal 1) )) ))))
      ))
    ),
    (ProcBodyDecl (20, 
      mkprocBodyDecl (
       21,
        (* = = = Procedure Name = = = *)
        ((*Call_Decrease*) 9),
        (* = = = Formal Parameters = = = *)
        [{ parameter_astnum = 22; parameter_name = ((*X*) 10); parameter_subtype_mark = (Subtype ((*T2*) 4)); parameter_mode = In_Out }],
        (* = = = Object Declarations = = = *)
        NullDecl,
        (* = = = Procedure Body = = = *)
        (Call (23, 24, ((*Decrease*) 5), 
          [(Name (25, (Identifier (26, ((*X*) 10) ))))])
        )
      ))
    ))))))),
    (* = = = Procedure Body = = = *)
    (Call (27, 28, ((*Call_Decrease*) 9), 
      [(Name (29, (Identifier (30, ((*V*) 2) ))))])
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
  vars = [(((*X*) 10), (In_Out, (Subtype ((*T2*) 4)))); (((*X*) 6), (In_Out, (Subtype ((*T1*) 3)))); (((*V*) 2), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Call_Decrease*) 9), (1, mkprocBodyDecl (
 21,
  (* = = = Procedure Name = = = *)
  ((*Call_Decrease*) 9),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 22; parameter_name = ((*X*) 10); parameter_subtype_mark = (Subtype ((*T2*) 4)); parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Call (23, 24, ((*Decrease*) 5), 
    [(Name (25, (Identifier (26, ((*X*) 10) ))))])
  )
))); (((*Decrease*) 5), (1, mkprocBodyDecl (
 12,
  (* = = = Procedure Name = = = *)
  ((*Decrease*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 13; parameter_name = ((*X*) 6); parameter_subtype_mark = (Subtype ((*T1*) 3)); parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (14, (Identifier (15, ((*X*) 6) )), (BinOp (16, Minus, (Name (17, (Identifier (18, ((*X*) 6) )))), (Literal (19, (Integer_Literal 1) )) ))))
))); (((*Bounded_In_Out*) 1), (0, mkprocBodyDecl (
 2,
  (* = = = Procedure Name = = = *)
  ((*Bounded_In_Out*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 3; parameter_name = ((*V*) 2); parameter_subtype_mark = Integer; parameter_mode = In_Out }],
  (* = = = Object Declarations = = = *)
  (SeqDecl (4,
  (TypeDecl (5, (SubtypeDecl (6, ((*T1*) 3), Integer, (Range (0, 10)))))),
  (SeqDecl (7,
  (TypeDecl (8, (SubtypeDecl (9, ((*T2*) 4), Integer, (Range (5, 15)))))),
  (SeqDecl (10,
  (ProcBodyDecl (11, 
    mkprocBodyDecl (
     12,
      (* = = = Procedure Name = = = *)
      ((*Decrease*) 5),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnum = 13; parameter_name = ((*X*) 6); parameter_subtype_mark = (Subtype ((*T1*) 3)); parameter_mode = In_Out }],
      (* = = = Object Declarations = = = *)
      NullDecl,
      (* = = = Procedure Body = = = *)
      (Assign (14, (Identifier (15, ((*X*) 6) )), (BinOp (16, Minus, (Name (17, (Identifier (18, ((*X*) 6) )))), (Literal (19, (Integer_Literal 1) )) ))))
    ))
  ),
  (ProcBodyDecl (20, 
    mkprocBodyDecl (
     21,
      (* = = = Procedure Name = = = *)
      ((*Call_Decrease*) 9),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnum = 22; parameter_name = ((*X*) 10); parameter_subtype_mark = (Subtype ((*T2*) 4)); parameter_mode = In_Out }],
      (* = = = Object Declarations = = = *)
      NullDecl,
      (* = = = Procedure Body = = = *)
      (Call (23, 24, ((*Decrease*) 5), 
        [(Name (25, (Identifier (26, ((*X*) 10) ))))])
      )
    ))
  ))))))),
  (* = = = Procedure Body = = = *)
  (Call (27, 28, ((*Call_Decrease*) 9), 
    [(Name (29, (Identifier (30, ((*V*) 2) ))))])
  )
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*T2*) 4), (SubtypeDecl (9, ((*T2*) 4), Integer, (Range (5, 15))))); (((*T1*) 3), (SubtypeDecl (6, ((*T1*) 3), Integer, (Range (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(26, (Subtype ((*T2*) 4))); (17, (Subtype ((*T1*) 3))); (29, Integer); (25, (Subtype ((*T2*) 4))); (16, Integer); (19, Integer); (18, (Subtype ((*T1*) 3))); (30, Integer); (15, (Subtype ((*T1*) 3)))];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(26, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (17, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (29, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (25, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (16, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (19, { line = (*Line*)7; col = (*Col*)16; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (18, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (30, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (15, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)7 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("V", "ada://parameter/Bounded_In_Out+1:11/V+1:27")); (10, ("X", "ada://parameter/Bounded_In_Out+1:11/Call_Decrease+10:14/X+10:29")); (6, ("X", "ada://parameter/Bounded_In_Out+1:11/Decrease+5:14/X+5:24"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Decrease+5:14")); (1, ("Bounded_In_Out", "ada://procedure_body/Bounded_In_Out+1:11")); (9, ("Call_Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Call_Decrease+10:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("T2", "ada://subtype/Bounded_In_Out+1:11/T2+3:12")); (3, ("T1", "ada://subtype/Bounded_In_Out+1:11/T1+2:12"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (ProcBodyDeclRT (1, 
  mkprocBodyDeclRT (
   2,
    (* = = = Procedure Name = = = *)
    ((*Bounded_In_Out*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 3; parameter_nameRT = ((*V*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (4,
    (TypeDeclRT (5, (SubtypeDeclRT (6, ((*T1*) 3), Integer, (RangeRT (0, 10)))))),
    (SeqDeclRT (7,
    (TypeDeclRT (8, (SubtypeDeclRT (9, ((*T2*) 4), Integer, (RangeRT (5, 15)))))),
    (SeqDeclRT (10,
    (ProcBodyDeclRT (11, 
      mkprocBodyDeclRT (
       12,
        (* = = = Procedure Name = = = *)
        ((*Decrease*) 5),
        (* = = = Formal Parameters = = = *)
        [{ parameter_astnumRT = 13; parameter_nameRT = ((*X*) 6); parameter_subtype_markRT = (Subtype ((*T1*) 3)); parameter_modeRT = In_Out }],
        (* = = = Object Declarations = = = *)
        NullDeclRT,
        (* = = = Procedure Body = = = *)
        (AssignRT (14, (IdentifierRT (15, ((*X*) 6) , [])), (BinOpRT (16, Minus, (NameRT (17, (IdentifierRT (18, ((*X*) 6) , [])))), (LiteralRT (19, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))
      ))
    ),
    (ProcBodyDeclRT (20, 
      mkprocBodyDeclRT (
       21,
        (* = = = Procedure Name = = = *)
        ((*Call_Decrease*) 9),
        (* = = = Formal Parameters = = = *)
        [{ parameter_astnumRT = 22; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = (Subtype ((*T2*) 4)); parameter_modeRT = In_Out }],
        (* = = = Object Declarations = = = *)
        NullDeclRT,
        (* = = = Procedure Body = = = *)
        (CallRT (23, 24, ((*Decrease*) 5), 
          [(NameRT (25, (IdentifierRT (26, ((*X*) 10) , [RangeCheck]))))])
        )
      ))
    ))))))),
    (* = = = Procedure Body = = = *)
    (CallRT (27, 28, ((*Call_Decrease*) 9), 
      [(NameRT (29, (IdentifierRT (30, ((*V*) 2) , [RangeCheck]))))])
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
  vars = [(((*X*) 10), (In_Out, (Subtype ((*T2*) 4)))); (((*X*) 6), (In_Out, (Subtype ((*T1*) 3)))); (((*V*) 2), (In_Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Call_Decrease*) 9), (1, mkprocBodyDeclRT (
 21,
  (* = = = Procedure Name = = = *)
  ((*Call_Decrease*) 9),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 22; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = (Subtype ((*T2*) 4)); parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (CallRT (23, 24, ((*Decrease*) 5), 
    [(NameRT (25, (IdentifierRT (26, ((*X*) 10) , [RangeCheck]))))])
  )
))); (((*Decrease*) 5), (1, mkprocBodyDeclRT (
 12,
  (* = = = Procedure Name = = = *)
  ((*Decrease*) 5),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 13; parameter_nameRT = ((*X*) 6); parameter_subtype_markRT = (Subtype ((*T1*) 3)); parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (14, (IdentifierRT (15, ((*X*) 6) , [])), (BinOpRT (16, Minus, (NameRT (17, (IdentifierRT (18, ((*X*) 6) , [])))), (LiteralRT (19, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))
))); (((*Bounded_In_Out*) 1), (0, mkprocBodyDeclRT (
 2,
  (* = = = Procedure Name = = = *)
  ((*Bounded_In_Out*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 3; parameter_nameRT = ((*V*) 2); parameter_subtype_markRT = Integer; parameter_modeRT = In_Out }],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (4,
  (TypeDeclRT (5, (SubtypeDeclRT (6, ((*T1*) 3), Integer, (RangeRT (0, 10)))))),
  (SeqDeclRT (7,
  (TypeDeclRT (8, (SubtypeDeclRT (9, ((*T2*) 4), Integer, (RangeRT (5, 15)))))),
  (SeqDeclRT (10,
  (ProcBodyDeclRT (11, 
    mkprocBodyDeclRT (
     12,
      (* = = = Procedure Name = = = *)
      ((*Decrease*) 5),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnumRT = 13; parameter_nameRT = ((*X*) 6); parameter_subtype_markRT = (Subtype ((*T1*) 3)); parameter_modeRT = In_Out }],
      (* = = = Object Declarations = = = *)
      NullDeclRT,
      (* = = = Procedure Body = = = *)
      (AssignRT (14, (IdentifierRT (15, ((*X*) 6) , [])), (BinOpRT (16, Minus, (NameRT (17, (IdentifierRT (18, ((*X*) 6) , [])))), (LiteralRT (19, (Integer_Literal 1) , [], [])) , [RangeCheck], []))))
    ))
  ),
  (ProcBodyDeclRT (20, 
    mkprocBodyDeclRT (
     21,
      (* = = = Procedure Name = = = *)
      ((*Call_Decrease*) 9),
      (* = = = Formal Parameters = = = *)
      [{ parameter_astnumRT = 22; parameter_nameRT = ((*X*) 10); parameter_subtype_markRT = (Subtype ((*T2*) 4)); parameter_modeRT = In_Out }],
      (* = = = Object Declarations = = = *)
      NullDeclRT,
      (* = = = Procedure Body = = = *)
      (CallRT (23, 24, ((*Decrease*) 5), 
        [(NameRT (25, (IdentifierRT (26, ((*X*) 10) , [RangeCheck]))))])
      )
    ))
  ))))))),
  (* = = = Procedure Body = = = *)
  (CallRT (27, 28, ((*Call_Decrease*) 9), 
    [(NameRT (29, (IdentifierRT (30, ((*V*) 2) , [RangeCheck]))))])
  )
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*T2*) 4), (SubtypeDeclRT (9, ((*T2*) 4), Integer, (RangeRT (5, 15))))); (((*T1*) 3), (SubtypeDeclRT (6, ((*T1*) 3), Integer, (RangeRT (0, 10)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(26, (Subtype ((*T2*) 4))); (17, (Subtype ((*T1*) 3))); (29, Integer); (25, (Subtype ((*T2*) 4))); (16, Integer); (19, Integer); (18, (Subtype ((*T1*) 3))); (30, Integer); (15, (Subtype ((*T1*) 3)))];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(26, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (17, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (29, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (25, { line = (*Line*)12; col = (*Col*)16; endline = (*EndLine*)12; endcol = (*EndCol*)16 }); (16, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (19, { line = (*Line*)7; col = (*Col*)16; endline = (*EndLine*)7; endcol = (*EndCol*)16 }); (18, { line = (*Line*)7; col = (*Col*)12; endline = (*EndLine*)7; endcol = (*EndCol*)12 }); (30, { line = (*Line*)16; col = (*Col*)18; endline = (*EndLine*)16; endcol = (*EndCol*)18 }); (15, { line = (*Line*)7; col = (*Col*)7; endline = (*EndLine*)7; endcol = (*EndCol*)7 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(2, ("V", "ada://parameter/Bounded_In_Out+1:11/V+1:27")); (10, ("X", "ada://parameter/Bounded_In_Out+1:11/Call_Decrease+10:14/X+10:29")); (6, ("X", "ada://parameter/Bounded_In_Out+1:11/Decrease+5:14/X+5:24"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(5, ("Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Decrease+5:14")); (1, ("Bounded_In_Out", "ada://procedure_body/Bounded_In_Out+1:11")); (9, ("Call_Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Call_Decrease+10:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(4, ("T2", "ada://subtype/Bounded_In_Out+1:11/T2+3:12")); (3, ("T1", "ada://subtype/Bounded_In_Out+1:11/T1+2:12"))]
})
}


