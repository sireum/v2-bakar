Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Test_for_Coq*) 1)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 3
  (ObjDecl 5 (mkobjDecl 6 ((*N*) 3) Integer (Some ((Literal 4 (Integer_Literal 25) ))))) 
  (SeqDecl 7
  (ObjDecl 8 (mkobjDecl 9 ((*Result*) 4) Boolean None)) 
  (SeqDecl 10
  (ObjDecl 11 (mkobjDecl 12 ((*I*) 5) Integer None)) 
  (ObjDecl 13 (mkobjDecl 14 ((*X*) 6) Integer None))))))
    (* = = = Procedure Body = = = *)
      (Seq 15
      (Assign 16 (Identifier 17 ((*Result*) 4) ) (Literal 18 (Boolean_Literal true) )) 
      (Seq 19
      (If 20 (BinOp 21 Less_Than_Or_Equal (Name 22 (Identifier 23 ((*N*) 3) )) (Literal 24 (Integer_Literal 1) ) )
        (Assign 25 (Identifier 26 ((*Result*) 4) ) (Literal 27 (Boolean_Literal false) ))
        Null
      ) 
      (Seq 28
      (Assign 29 (Identifier 30 ((*I*) 5) ) (Literal 31 (Integer_Literal 2) )) 
      (While 32 (BinOp 33 Less_Than_Or_Equal (BinOp 34 Multiply (Name 35 (Identifier 36 ((*I*) 5) )) (Name 37 (Identifier 38 ((*I*) 5) )) ) (Name 39 (Identifier 40 ((*N*) 3) )) )
        (Seq 41
        (Assign 42 (Identifier 43 ((*X*) 6) ) (BinOp 44 Divide (Name 45 (Identifier 46 ((*N*) 3) )) (Name 47 (Identifier 48 ((*I*) 5) )) )) 
        (Seq 49
        (If 50 (BinOp 51 Equal (Name 52 (Identifier 53 ((*N*) 3) )) (BinOp 54 Multiply (Name 55 (Identifier 56 ((*X*) 6) )) (Name 57 (Identifier 58 ((*I*) 5) )) ) )
          (Assign 59 (Identifier 60 ((*Result*) 4) ) (Literal 61 (Boolean_Literal false) ))
          Null
        ) 
        (Assign 62 (Identifier 63 ((*I*) 5) ) (BinOp 64 Plus (Name 65 (Identifier 66 ((*I*) 5) )) (Literal 67 (Integer_Literal 1) ) ))))
      ))))
  )
)
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 5), (In_Out, Integer)) :: (((*X*) 6), (In_Out, Integer)) :: (((*Result*) 4), (In_Out, Boolean)) :: (((*N*) 3), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test_for_Coq*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Test_for_Coq*) 1)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 3
(ObjDecl 5 (mkobjDecl 6 ((*N*) 3) Integer (Some ((Literal 4 (Integer_Literal 25) ))))) 
(SeqDecl 7
(ObjDecl 8 (mkobjDecl 9 ((*Result*) 4) Boolean None)) 
(SeqDecl 10
(ObjDecl 11 (mkobjDecl 12 ((*I*) 5) Integer None)) 
(ObjDecl 13 (mkobjDecl 14 ((*X*) 6) Integer None))))))
  (* = = = Procedure Body = = = *)
    (Seq 15
    (Assign 16 (Identifier 17 ((*Result*) 4) ) (Literal 18 (Boolean_Literal true) )) 
    (Seq 19
    (If 20 (BinOp 21 Less_Than_Or_Equal (Name 22 (Identifier 23 ((*N*) 3) )) (Literal 24 (Integer_Literal 1) ) )
      (Assign 25 (Identifier 26 ((*Result*) 4) ) (Literal 27 (Boolean_Literal false) ))
      Null
    ) 
    (Seq 28
    (Assign 29 (Identifier 30 ((*I*) 5) ) (Literal 31 (Integer_Literal 2) )) 
    (While 32 (BinOp 33 Less_Than_Or_Equal (BinOp 34 Multiply (Name 35 (Identifier 36 ((*I*) 5) )) (Name 37 (Identifier 38 ((*I*) 5) )) ) (Name 39 (Identifier 40 ((*N*) 3) )) )
      (Seq 41
      (Assign 42 (Identifier 43 ((*X*) 6) ) (BinOp 44 Divide (Name 45 (Identifier 46 ((*N*) 3) )) (Name 47 (Identifier 48 ((*I*) 5) )) )) 
      (Seq 49
      (If 50 (BinOp 51 Equal (Name 52 (Identifier 53 ((*N*) 3) )) (BinOp 54 Multiply (Name 55 (Identifier 56 ((*X*) 6) )) (Name 57 (Identifier 58 ((*I*) 5) )) ) )
        (Assign 59 (Identifier 60 ((*Result*) 4) ) (Literal 61 (Boolean_Literal false) ))
        Null
      ) 
      (Assign 62 (Identifier 63 ((*I*) 5) ) (BinOp 64 Plus (Name 65 (Identifier 66 ((*I*) 5) )) (Literal 67 (Integer_Literal 1) ) ))))
    ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (53, Integer) :: (17, Boolean) :: (35, Integer) :: (44, Integer) :: (26, Boolean) :: (56, Integer) :: (38, Integer) :: (47, Integer) :: (65, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (67, Integer) :: (58, Integer) :: (40, Integer) :: (4, Integer) :: (31, Integer) :: (22, Integer) :: (52, Integer) :: (43, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Integer) :: (60, Boolean) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (27, Boolean) :: (18, Boolean) :: (36, Integer) :: (57, Integer) :: (21, Boolean) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (66, Integer) :: (51, Boolean) :: (33, Boolean) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (53, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (17, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)9)) :: (35, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (44, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (56, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (38, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (47, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (65, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (46, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (64, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)16)) :: (55, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (67, (sloc (*Line*)24 (*Col*)16 (*EndLine*)24 (*EndCol*)16)) :: (58, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (40, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (4, (sloc (*Line*)6 (*Col*)18 (*EndLine*)6 (*EndCol*)19)) :: (31, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)9)) :: (22, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (52, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (43, (sloc (*Line*)20 (*Col*)7 (*EndLine*)20 (*EndCol*)7)) :: (34, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)24)) :: (37, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (60, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (63, (sloc (*Line*)24 (*Col*)7 (*EndLine*)24 (*EndCol*)7)) :: (54, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)18)) :: (45, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (27, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (18, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)17)) :: (36, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (57, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (21, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)12)) :: (48, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (30, (sloc (*Line*)18 (*Col*)4 (*EndLine*)18 (*EndCol*)4)) :: (39, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (66, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (51, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)18)) :: (33, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)17)) :: (24, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((5, ("I", "ada://variable/Test_for_Coq+4:11/I+8:4")) :: (4, ("Result", "ada://variable/Test_for_Coq+4:11/Result+7:4")) :: (3, ("N", "ada://variable/Test_for_Coq+4:11/N+6:4")) :: (6, ("X", "ada://variable/Test_for_Coq+4:11/X+9:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Test_for_Coq", "ada://procedure_body/Test_for_Coq+4:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Test_for_Coq*) 1)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 3
  (ObjDeclRT 5 (mkobjDeclRT 6 ((*N*) 3) Integer (Some ((LiteralRT 4 (Integer_Literal 25) (nil) nil))))) 
  (SeqDeclRT 7
  (ObjDeclRT 8 (mkobjDeclRT 9 ((*Result*) 4) Boolean None)) 
  (SeqDeclRT 10
  (ObjDeclRT 11 (mkobjDeclRT 12 ((*I*) 5) Integer None)) 
  (ObjDeclRT 13 (mkobjDeclRT 14 ((*X*) 6) Integer None))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 15
      (AssignRT 16 (IdentifierRT 17 ((*Result*) 4) (nil)) (LiteralRT 18 (Boolean_Literal true) (nil) nil)) 
      (SeqRT 19
      (IfRT 20 (BinOpRT 21 Less_Than_Or_Equal (NameRT 22 (IdentifierRT 23 ((*N*) 3) (nil))) (LiteralRT 24 (Integer_Literal 1) (nil) nil) (nil) nil)
        (AssignRT 25 (IdentifierRT 26 ((*Result*) 4) (nil)) (LiteralRT 27 (Boolean_Literal false) (nil) nil))
        NullRT
      ) 
      (SeqRT 28
      (AssignRT 29 (IdentifierRT 30 ((*I*) 5) (nil)) (LiteralRT 31 (Integer_Literal 2) (nil) nil)) 
      (WhileRT 32 (BinOpRT 33 Less_Than_Or_Equal (BinOpRT 34 Multiply (NameRT 35 (IdentifierRT 36 ((*I*) 5) (nil))) (NameRT 37 (IdentifierRT 38 ((*I*) 5) (nil))) (OverflowCheck :: nil) nil) (NameRT 39 (IdentifierRT 40 ((*N*) 3) (nil))) (nil) nil)
        (SeqRT 41
        (AssignRT 42 (IdentifierRT 43 ((*X*) 6) (nil)) (BinOpRT 44 Divide (NameRT 45 (IdentifierRT 46 ((*N*) 3) (nil))) (NameRT 47 (IdentifierRT 48 ((*I*) 5) (nil))) (DivCheck :: OverflowCheck :: nil) nil)) 
        (SeqRT 49
        (IfRT 50 (BinOpRT 51 Equal (NameRT 52 (IdentifierRT 53 ((*N*) 3) (nil))) (BinOpRT 54 Multiply (NameRT 55 (IdentifierRT 56 ((*X*) 6) (nil))) (NameRT 57 (IdentifierRT 58 ((*I*) 5) (nil))) (OverflowCheck :: nil) nil) (nil) nil)
          (AssignRT 59 (IdentifierRT 60 ((*Result*) 4) (nil)) (LiteralRT 61 (Boolean_Literal false) (nil) nil))
          NullRT
        ) 
        (AssignRT 62 (IdentifierRT 63 ((*I*) 5) (nil)) (BinOpRT 64 Plus (NameRT 65 (IdentifierRT 66 ((*I*) 5) (nil))) (LiteralRT 67 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))))
      ))))
  )
)
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 5), (In_Out, Integer)) :: (((*X*) 6), (In_Out, Integer)) :: (((*Result*) 4), (In_Out, Boolean)) :: (((*N*) 3), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test_for_Coq*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Test_for_Coq*) 1)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 3
(ObjDeclRT 5 (mkobjDeclRT 6 ((*N*) 3) Integer (Some ((LiteralRT 4 (Integer_Literal 25) (nil) nil))))) 
(SeqDeclRT 7
(ObjDeclRT 8 (mkobjDeclRT 9 ((*Result*) 4) Boolean None)) 
(SeqDeclRT 10
(ObjDeclRT 11 (mkobjDeclRT 12 ((*I*) 5) Integer None)) 
(ObjDeclRT 13 (mkobjDeclRT 14 ((*X*) 6) Integer None))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 15
    (AssignRT 16 (IdentifierRT 17 ((*Result*) 4) (nil)) (LiteralRT 18 (Boolean_Literal true) (nil) nil)) 
    (SeqRT 19
    (IfRT 20 (BinOpRT 21 Less_Than_Or_Equal (NameRT 22 (IdentifierRT 23 ((*N*) 3) (nil))) (LiteralRT 24 (Integer_Literal 1) (nil) nil) (nil) nil)
      (AssignRT 25 (IdentifierRT 26 ((*Result*) 4) (nil)) (LiteralRT 27 (Boolean_Literal false) (nil) nil))
      NullRT
    ) 
    (SeqRT 28
    (AssignRT 29 (IdentifierRT 30 ((*I*) 5) (nil)) (LiteralRT 31 (Integer_Literal 2) (nil) nil)) 
    (WhileRT 32 (BinOpRT 33 Less_Than_Or_Equal (BinOpRT 34 Multiply (NameRT 35 (IdentifierRT 36 ((*I*) 5) (nil))) (NameRT 37 (IdentifierRT 38 ((*I*) 5) (nil))) (OverflowCheck :: nil) nil) (NameRT 39 (IdentifierRT 40 ((*N*) 3) (nil))) (nil) nil)
      (SeqRT 41
      (AssignRT 42 (IdentifierRT 43 ((*X*) 6) (nil)) (BinOpRT 44 Divide (NameRT 45 (IdentifierRT 46 ((*N*) 3) (nil))) (NameRT 47 (IdentifierRT 48 ((*I*) 5) (nil))) (DivCheck :: OverflowCheck :: nil) nil)) 
      (SeqRT 49
      (IfRT 50 (BinOpRT 51 Equal (NameRT 52 (IdentifierRT 53 ((*N*) 3) (nil))) (BinOpRT 54 Multiply (NameRT 55 (IdentifierRT 56 ((*X*) 6) (nil))) (NameRT 57 (IdentifierRT 58 ((*I*) 5) (nil))) (OverflowCheck :: nil) nil) (nil) nil)
        (AssignRT 59 (IdentifierRT 60 ((*Result*) 4) (nil)) (LiteralRT 61 (Boolean_Literal false) (nil) nil))
        NullRT
      ) 
      (AssignRT 62 (IdentifierRT 63 ((*I*) 5) (nil)) (BinOpRT 64 Plus (NameRT 65 (IdentifierRT 66 ((*I*) 5) (nil))) (LiteralRT 67 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))))
    ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (53, Integer) :: (17, Boolean) :: (35, Integer) :: (44, Integer) :: (26, Boolean) :: (56, Integer) :: (38, Integer) :: (47, Integer) :: (65, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (67, Integer) :: (58, Integer) :: (40, Integer) :: (4, Integer) :: (31, Integer) :: (22, Integer) :: (52, Integer) :: (43, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Integer) :: (60, Boolean) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (27, Boolean) :: (18, Boolean) :: (36, Integer) :: (57, Integer) :: (21, Boolean) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (66, Integer) :: (51, Boolean) :: (33, Boolean) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (53, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (17, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)9)) :: (35, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (44, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (56, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (38, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (47, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (65, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (46, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (64, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)16)) :: (55, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (67, (sloc (*Line*)24 (*Col*)16 (*EndLine*)24 (*EndCol*)16)) :: (58, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (40, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (4, (sloc (*Line*)6 (*Col*)18 (*EndLine*)6 (*EndCol*)19)) :: (31, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)9)) :: (22, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (52, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (43, (sloc (*Line*)20 (*Col*)7 (*EndLine*)20 (*EndCol*)7)) :: (34, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)24)) :: (37, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (60, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (63, (sloc (*Line*)24 (*Col*)7 (*EndLine*)24 (*EndCol*)7)) :: (54, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)18)) :: (45, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (27, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (18, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)17)) :: (36, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (57, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (21, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)12)) :: (48, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (30, (sloc (*Line*)18 (*Col*)4 (*EndLine*)18 (*EndCol*)4)) :: (39, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (66, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (51, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)18)) :: (33, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)17)) :: (24, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((5, ("I", "ada://variable/Test_for_Coq+4:11/I+8:4")) :: (4, ("Result", "ada://variable/Test_for_Coq+4:11/Result+7:4")) :: (3, ("N", "ada://variable/Test_for_Coq+4:11/N+6:4")) :: (6, ("X", "ada://variable/Test_for_Coq+4:11/X+9:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Test_for_Coq", "ada://procedure_body/Test_for_Coq+4:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

