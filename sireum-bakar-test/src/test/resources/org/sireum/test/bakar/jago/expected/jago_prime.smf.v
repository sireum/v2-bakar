Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Prime*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*N*) 2) Integer In) :: 
    (mkparamSpec 4 ((*R*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 5
  (ObjDecl 6 (mkobjDecl 7 ((*Result*) 4) Integer None)) 
  (SeqDecl 8
  (ObjDecl 9 (mkobjDecl 10 ((*I*) 5) Integer None)) 
  (ObjDecl 11 (mkobjDecl 12 ((*T*) 6) Integer None)))))
    (* = = = Procedure Body = = = *)
      (Seq 13
      (Assign 14 (Identifier 15 ((*Result*) 4) ) (Literal 16 (Integer_Literal 0) )) 
      (Seq 17
      (If 18 (BinOp 19 Or (BinOp 20 Equal (Name 21 (Identifier 22 ((*N*) 2) )) (Literal 23 (Integer_Literal 1) ) ) (BinOp 24 Equal (Name 25 (Identifier 26 ((*N*) 2) )) (Literal 27 (Integer_Literal 2) ) ) )
        (Assign 28 (Identifier 29 ((*Result*) 4) ) (Literal 30 (Integer_Literal 1) ))
        Null
      ) 
      (Seq 31
      (Assign 32 (Identifier 33 ((*I*) 5) ) (Literal 34 (Integer_Literal 2) )) 
      (Seq 35
      (While 36 (BinOp 37 And (BinOp 38 Less_Than (Name 39 (Identifier 40 ((*I*) 5) )) (Name 41 (Identifier 42 ((*N*) 2) )) ) (BinOp 43 Equal (Name 44 (Identifier 45 ((*Result*) 4) )) (Literal 46 (Integer_Literal 0) ) ) )
        (Seq 47
        (Assign 48 (Identifier 49 ((*T*) 6) ) (BinOp 50 Divide (Name 51 (Identifier 52 ((*N*) 2) )) (Name 53 (Identifier 54 ((*I*) 5) )) )) 
        (If 55 (BinOp 56 Equal (Name 57 (Identifier 58 ((*N*) 2) )) (BinOp 59 Multiply (Name 60 (Identifier 61 ((*T*) 6) )) (Name 62 (Identifier 63 ((*I*) 5) )) ) )
          (Assign 64 (Identifier 65 ((*Result*) 4) ) (Literal 66 (Integer_Literal 1) ))
          Null
        ))
      ) 
      (Assign 67 (Identifier 68 ((*R*) 3) ) (Name 69 (Identifier 70 ((*Result*) 4) )))))))
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
  ((((*I*) 5), (In_Out, Integer)) :: (((*N*) 2), (In, Integer)) :: (((*R*) 3), (Out, Integer)) :: (((*Result*) 4), (In_Out, Integer)) :: (((*T*) 6), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Prime*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Prime*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*N*) 2) Integer In) :: 
  (mkparamSpec 4 ((*R*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 5
(ObjDecl 6 (mkobjDecl 7 ((*Result*) 4) Integer None)) 
(SeqDecl 8
(ObjDecl 9 (mkobjDecl 10 ((*I*) 5) Integer None)) 
(ObjDecl 11 (mkobjDecl 12 ((*T*) 6) Integer None)))))
  (* = = = Procedure Body = = = *)
    (Seq 13
    (Assign 14 (Identifier 15 ((*Result*) 4) ) (Literal 16 (Integer_Literal 0) )) 
    (Seq 17
    (If 18 (BinOp 19 Or (BinOp 20 Equal (Name 21 (Identifier 22 ((*N*) 2) )) (Literal 23 (Integer_Literal 1) ) ) (BinOp 24 Equal (Name 25 (Identifier 26 ((*N*) 2) )) (Literal 27 (Integer_Literal 2) ) ) )
      (Assign 28 (Identifier 29 ((*Result*) 4) ) (Literal 30 (Integer_Literal 1) ))
      Null
    ) 
    (Seq 31
    (Assign 32 (Identifier 33 ((*I*) 5) ) (Literal 34 (Integer_Literal 2) )) 
    (Seq 35
    (While 36 (BinOp 37 And (BinOp 38 Less_Than (Name 39 (Identifier 40 ((*I*) 5) )) (Name 41 (Identifier 42 ((*N*) 2) )) ) (BinOp 43 Equal (Name 44 (Identifier 45 ((*Result*) 4) )) (Literal 46 (Integer_Literal 0) ) ) )
      (Seq 47
      (Assign 48 (Identifier 49 ((*T*) 6) ) (BinOp 50 Divide (Name 51 (Identifier 52 ((*N*) 2) )) (Name 53 (Identifier 54 ((*I*) 5) )) )) 
      (If 55 (BinOp 56 Equal (Name 57 (Identifier 58 ((*N*) 2) )) (BinOp 59 Multiply (Name 60 (Identifier 61 ((*T*) 6) )) (Name 62 (Identifier 63 ((*I*) 5) )) ) )
        (Assign 64 (Identifier 65 ((*Result*) 4) ) (Literal 66 (Integer_Literal 1) ))
        Null
      ))
    ) 
    (Assign 67 (Identifier 68 ((*R*) 3) ) (Name 69 (Identifier 70 ((*Result*) 4) )))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (68, Integer) :: (59, Integer) :: (50, Integer) :: (41, Integer) :: (62, Integer) :: (53, Integer) :: (44, Integer) :: (26, Integer) :: (56, Boolean) :: (29, Integer) :: (38, Boolean) :: (20, Boolean) :: (65, Integer) :: (46, Integer) :: (58, Integer) :: (49, Integer) :: (40, Integer) :: (22, Integer) :: (16, Integer) :: (70, Integer) :: (52, Integer) :: (43, Boolean) :: (25, Integer) :: (34, Integer) :: (61, Integer) :: (37, Boolean) :: (19, Boolean) :: (60, Integer) :: (69, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (27, Integer) :: (57, Integer) :: (21, Integer) :: (30, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Integer) :: (51, Integer) :: (24, Boolean) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (68, (sloc (*Line*)20 (*Col*)4 (*EndLine*)20 (*EndCol*)4)) :: (59, (sloc (*Line*)16 (*Col*)14 (*EndLine*)16 (*EndCol*)18)) :: (50, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)16)) :: (41, (sloc (*Line*)14 (*Col*)14 (*EndLine*)14 (*EndCol*)14)) :: (62, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (53, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (44, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)25)) :: (26, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (56, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)18)) :: (29, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)12)) :: (38, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)14)) :: (20, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)11)) :: (65, (sloc (*Line*)17 (*Col*)3 (*EndLine*)17 (*EndCol*)8)) :: (46, (sloc (*Line*)14 (*Col*)29 (*EndLine*)14 (*EndCol*)29)) :: (58, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (49, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (40, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)10)) :: (22, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (16, (sloc (*Line*)9 (*Col*)14 (*EndLine*)9 (*EndCol*)14)) :: (70, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)14)) :: (52, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (43, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)29)) :: (25, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (34, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)9)) :: (61, (sloc (*Line*)16 (*Col*)14 (*EndLine*)16 (*EndCol*)14)) :: (37, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)29)) :: (19, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)20)) :: (60, (sloc (*Line*)16 (*Col*)14 (*EndLine*)16 (*EndCol*)14)) :: (69, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)14)) :: (63, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (54, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (45, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)25)) :: (27, (sloc (*Line*)10 (*Col*)20 (*EndLine*)10 (*EndCol*)20)) :: (57, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (21, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (30, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (39, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)10)) :: (66, (sloc (*Line*)17 (*Col*)13 (*EndLine*)17 (*EndCol*)13)) :: (15, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)9)) :: (42, (sloc (*Line*)14 (*Col*)14 (*EndLine*)14 (*EndCol*)14)) :: (51, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (24, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)20)) :: (33, (sloc (*Line*)13 (*Col*)4 (*EndLine*)13 (*EndCol*)4)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("N", "ada://parameter/Prime+1:11/N+1:18")) :: (5, ("I", "ada://variable/Prime+1:11/I+4:4")) :: (4, ("Result", "ada://variable/Prime+1:11/Result+3:4")) :: (3, ("R", "ada://parameter/Prime+1:11/R+1:31")) :: (6, ("T", "ada://variable/Prime+1:11/T+5:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Prime", "ada://procedure_body/Prime+1:11")) :: nil)
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

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Prime*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*N*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*R*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 5
  (ObjDeclRT 6 (mkobjDeclRT 7 ((*Result*) 4) Integer None)) 
  (SeqDeclRT 8
  (ObjDeclRT 9 (mkobjDeclRT 10 ((*I*) 5) Integer None)) 
  (ObjDeclRT 11 (mkobjDeclRT 12 ((*T*) 6) Integer None)))))
    (* = = = Procedure Body = = = *)
      (SeqRT 13
      (AssignRT 14 (IdentifierRT 15 ((*Result*) 4) (nil)) (LiteralRT 16 (Integer_Literal 0) (nil) nil)) 
      (SeqRT 17
      (IfRT 18 (BinOpRT 19 Or (BinOpRT 20 Equal (NameRT 21 (IdentifierRT 22 ((*N*) 2) (nil))) (LiteralRT 23 (Integer_Literal 1) (nil) nil) (nil) nil) (BinOpRT 24 Equal (NameRT 25 (IdentifierRT 26 ((*N*) 2) (nil))) (LiteralRT 27 (Integer_Literal 2) (nil) nil) (nil) nil) (nil) nil)
        (AssignRT 28 (IdentifierRT 29 ((*Result*) 4) (nil)) (LiteralRT 30 (Integer_Literal 1) (nil) nil))
        NullRT
      ) 
      (SeqRT 31
      (AssignRT 32 (IdentifierRT 33 ((*I*) 5) (nil)) (LiteralRT 34 (Integer_Literal 2) (nil) nil)) 
      (SeqRT 35
      (WhileRT 36 (BinOpRT 37 And (BinOpRT 38 Less_Than (NameRT 39 (IdentifierRT 40 ((*I*) 5) (nil))) (NameRT 41 (IdentifierRT 42 ((*N*) 2) (nil))) (nil) nil) (BinOpRT 43 Equal (NameRT 44 (IdentifierRT 45 ((*Result*) 4) (nil))) (LiteralRT 46 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
        (SeqRT 47
        (AssignRT 48 (IdentifierRT 49 ((*T*) 6) (nil)) (BinOpRT 50 Divide (NameRT 51 (IdentifierRT 52 ((*N*) 2) (nil))) (NameRT 53 (IdentifierRT 54 ((*I*) 5) (nil))) (DivCheck :: OverflowCheck :: nil) nil)) 
        (IfRT 55 (BinOpRT 56 Equal (NameRT 57 (IdentifierRT 58 ((*N*) 2) (nil))) (BinOpRT 59 Multiply (NameRT 60 (IdentifierRT 61 ((*T*) 6) (nil))) (NameRT 62 (IdentifierRT 63 ((*I*) 5) (nil))) (OverflowCheck :: nil) nil) (nil) nil)
          (AssignRT 64 (IdentifierRT 65 ((*Result*) 4) (nil)) (LiteralRT 66 (Integer_Literal 1) (nil) nil))
          NullRT
        ))
      ) 
      (AssignRT 67 (IdentifierRT 68 ((*R*) 3) (nil)) (NameRT 69 (IdentifierRT 70 ((*Result*) 4) (nil))))))))
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
  ((((*I*) 5), (In_Out, Integer)) :: (((*N*) 2), (In, Integer)) :: (((*R*) 3), (Out, Integer)) :: (((*Result*) 4), (In_Out, Integer)) :: (((*T*) 6), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Prime*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Prime*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*N*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*R*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 5
(ObjDeclRT 6 (mkobjDeclRT 7 ((*Result*) 4) Integer None)) 
(SeqDeclRT 8
(ObjDeclRT 9 (mkobjDeclRT 10 ((*I*) 5) Integer None)) 
(ObjDeclRT 11 (mkobjDeclRT 12 ((*T*) 6) Integer None)))))
  (* = = = Procedure Body = = = *)
    (SeqRT 13
    (AssignRT 14 (IdentifierRT 15 ((*Result*) 4) (nil)) (LiteralRT 16 (Integer_Literal 0) (nil) nil)) 
    (SeqRT 17
    (IfRT 18 (BinOpRT 19 Or (BinOpRT 20 Equal (NameRT 21 (IdentifierRT 22 ((*N*) 2) (nil))) (LiteralRT 23 (Integer_Literal 1) (nil) nil) (nil) nil) (BinOpRT 24 Equal (NameRT 25 (IdentifierRT 26 ((*N*) 2) (nil))) (LiteralRT 27 (Integer_Literal 2) (nil) nil) (nil) nil) (nil) nil)
      (AssignRT 28 (IdentifierRT 29 ((*Result*) 4) (nil)) (LiteralRT 30 (Integer_Literal 1) (nil) nil))
      NullRT
    ) 
    (SeqRT 31
    (AssignRT 32 (IdentifierRT 33 ((*I*) 5) (nil)) (LiteralRT 34 (Integer_Literal 2) (nil) nil)) 
    (SeqRT 35
    (WhileRT 36 (BinOpRT 37 And (BinOpRT 38 Less_Than (NameRT 39 (IdentifierRT 40 ((*I*) 5) (nil))) (NameRT 41 (IdentifierRT 42 ((*N*) 2) (nil))) (nil) nil) (BinOpRT 43 Equal (NameRT 44 (IdentifierRT 45 ((*Result*) 4) (nil))) (LiteralRT 46 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
      (SeqRT 47
      (AssignRT 48 (IdentifierRT 49 ((*T*) 6) (nil)) (BinOpRT 50 Divide (NameRT 51 (IdentifierRT 52 ((*N*) 2) (nil))) (NameRT 53 (IdentifierRT 54 ((*I*) 5) (nil))) (DivCheck :: OverflowCheck :: nil) nil)) 
      (IfRT 55 (BinOpRT 56 Equal (NameRT 57 (IdentifierRT 58 ((*N*) 2) (nil))) (BinOpRT 59 Multiply (NameRT 60 (IdentifierRT 61 ((*T*) 6) (nil))) (NameRT 62 (IdentifierRT 63 ((*I*) 5) (nil))) (OverflowCheck :: nil) nil) (nil) nil)
        (AssignRT 64 (IdentifierRT 65 ((*Result*) 4) (nil)) (LiteralRT 66 (Integer_Literal 1) (nil) nil))
        NullRT
      ))
    ) 
    (AssignRT 67 (IdentifierRT 68 ((*R*) 3) (nil)) (NameRT 69 (IdentifierRT 70 ((*Result*) 4) (nil))))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (68, Integer) :: (59, Integer) :: (50, Integer) :: (41, Integer) :: (62, Integer) :: (53, Integer) :: (44, Integer) :: (26, Integer) :: (56, Boolean) :: (29, Integer) :: (38, Boolean) :: (20, Boolean) :: (65, Integer) :: (46, Integer) :: (58, Integer) :: (49, Integer) :: (40, Integer) :: (22, Integer) :: (16, Integer) :: (70, Integer) :: (52, Integer) :: (43, Boolean) :: (25, Integer) :: (34, Integer) :: (61, Integer) :: (37, Boolean) :: (19, Boolean) :: (60, Integer) :: (69, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (27, Integer) :: (57, Integer) :: (21, Integer) :: (30, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Integer) :: (51, Integer) :: (24, Boolean) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (68, (sloc (*Line*)20 (*Col*)4 (*EndLine*)20 (*EndCol*)4)) :: (59, (sloc (*Line*)16 (*Col*)14 (*EndLine*)16 (*EndCol*)18)) :: (50, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)16)) :: (41, (sloc (*Line*)14 (*Col*)14 (*EndLine*)14 (*EndCol*)14)) :: (62, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (53, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (44, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)25)) :: (26, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (56, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)18)) :: (29, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)12)) :: (38, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)14)) :: (20, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)11)) :: (65, (sloc (*Line*)17 (*Col*)3 (*EndLine*)17 (*EndCol*)8)) :: (46, (sloc (*Line*)14 (*Col*)29 (*EndLine*)14 (*EndCol*)29)) :: (58, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (49, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (40, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)10)) :: (22, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (16, (sloc (*Line*)9 (*Col*)14 (*EndLine*)9 (*EndCol*)14)) :: (70, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)14)) :: (52, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (43, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)29)) :: (25, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (34, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)9)) :: (61, (sloc (*Line*)16 (*Col*)14 (*EndLine*)16 (*EndCol*)14)) :: (37, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)29)) :: (19, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)20)) :: (60, (sloc (*Line*)16 (*Col*)14 (*EndLine*)16 (*EndCol*)14)) :: (69, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)14)) :: (63, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (54, (sloc (*Line*)15 (*Col*)16 (*EndLine*)15 (*EndCol*)16)) :: (45, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)25)) :: (27, (sloc (*Line*)10 (*Col*)20 (*EndLine*)10 (*EndCol*)20)) :: (57, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (21, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (30, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (39, (sloc (*Line*)14 (*Col*)10 (*EndLine*)14 (*EndCol*)10)) :: (66, (sloc (*Line*)17 (*Col*)13 (*EndLine*)17 (*EndCol*)13)) :: (15, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)9)) :: (42, (sloc (*Line*)14 (*Col*)14 (*EndLine*)14 (*EndCol*)14)) :: (51, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (24, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)20)) :: (33, (sloc (*Line*)13 (*Col*)4 (*EndLine*)13 (*EndCol*)4)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("N", "ada://parameter/Prime+1:11/N+1:18")) :: (5, ("I", "ada://variable/Prime+1:11/I+4:4")) :: (4, ("Result", "ada://variable/Prime+1:11/Result+3:4")) :: (3, ("R", "ada://parameter/Prime+1:11/R+1:31")) :: (6, ("T", "ada://variable/Prime+1:11/T+5:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Prime", "ada://procedure_body/Prime+1:11")) :: nil)
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

