Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(ObjDecl 3 (mkobjDecl 4 ((*Y*) 1) Integer None)) 
(SeqDecl 5
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 6
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 7
NullDecl (* Undefined Declarations ! *) 
(ObjDecl 8 (mkobjDecl 9 ((*C*) 5) Integer None)))))) 
(SeqDecl 10
(ObjDecl 11 (mkobjDecl 12 ((*B*) 7) Integer None)) 
(SeqDecl 13
(ProcBodyDecl 14 
  (mkprocBodyDecl 15
    (* = = = Procedure Name = = = *)
    ((*R*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 16 ((*X*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 17 (Identifier 18 ((*X*) 8) ) (BinOp 19 Plus (BinOp 20 Plus (Name 21 (Identifier 22 ((*Y*) 1) )) (Name 23 (Identifier 24 ((*B*) 7) )) ) (Name 25 (Identifier 26 ((*C*) 5) )) ))
  )
) 
(SeqDecl 27
(ProcBodyDecl 28 
  (mkprocBodyDecl 29
    (* = = = Procedure Name = = = *)
    ((*incX*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 30 ((*X*) 10) Integer In) :: 
    (mkparamSpec 31 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 32 (mkobjDecl 33 ((*result*) 12) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 34
      (If 35 (BinOp 36 Equal (Name 37 (Identifier 38 ((*X*) 10) )) (Literal 39 (Integer_Literal 0) ) )
        (Assign 40 (Identifier 41 ((*result*) 12) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 10) )) (Literal 45 (Integer_Literal 1) ) ))
        (Assign 46 (Identifier 47 ((*result*) 12) ) (BinOp 48 Minus (Name 49 (Identifier 50 ((*X*) 10) )) (Literal 51 (Integer_Literal 1) ) ))
      ) 
      (Assign 52 (Identifier 53 ((*Z*) 11) ) (Name 54 (Identifier 55 ((*result*) 12) ))))
  )
) 
(ProcBodyDecl 56 
  (mkprocBodyDecl 57
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 58 ((*X*) 15) Integer In) :: 
    (mkparamSpec 59 ((*Z*) 16) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 60 (mkobjDecl 61 ((*V*) 17) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 62
      (Call 63 64 ((*R*) 4) 
        ((Name 65 (Identifier 66 ((*Z*) 16) )) :: nil)
      ) 
      (Seq 67
      (Call 68 69 ((*incX*) 3) 
        ((Name 70 (Identifier 71 ((*X*) 15) )) :: (Name 72 (Identifier 73 ((*V*) 17) )) :: nil)
      ) 
      (Assign 74 (Identifier 75 ((*Z*) 16) ) (BinOp 76 Plus (Name 77 (Identifier 78 ((*Z*) 16) )) (Name 79 (Identifier 80 ((*V*) 17) )) ))))
  )
)))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*C*) 5), (In_Out, Integer)) :: (((*B*) 7), (In_Out, Integer)) :: (((*V*) 17), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*Z*) 16), (Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: (((*X*) 15), (In, Integer)) :: (((*result*) 12), (In_Out, Integer)) :: (((*X*) 8), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 4), (0, (mkprocBodyDecl 15
  (* = = = Procedure Name = = = *)
  ((*R*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 16 ((*X*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 17 (Identifier 18 ((*X*) 8) ) (BinOp 19 Plus (BinOp 20 Plus (Name 21 (Identifier 22 ((*Y*) 1) )) (Name 23 (Identifier 24 ((*B*) 7) )) ) (Name 25 (Identifier 26 ((*C*) 5) )) ))
))) :: (((*incX*) 3), (0, (mkprocBodyDecl 29
  (* = = = Procedure Name = = = *)
  ((*incX*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 30 ((*X*) 10) Integer In) :: 
  (mkparamSpec 31 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 32 (mkobjDecl 33 ((*result*) 12) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 34
    (If 35 (BinOp 36 Equal (Name 37 (Identifier 38 ((*X*) 10) )) (Literal 39 (Integer_Literal 0) ) )
      (Assign 40 (Identifier 41 ((*result*) 12) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 10) )) (Literal 45 (Integer_Literal 1) ) ))
      (Assign 46 (Identifier 47 ((*result*) 12) ) (BinOp 48 Minus (Name 49 (Identifier 50 ((*X*) 10) )) (Literal 51 (Integer_Literal 1) ) ))
    ) 
    (Assign 52 (Identifier 53 ((*Z*) 11) ) (Name 54 (Identifier 55 ((*result*) 12) ))))
))) :: (((*Q*) 2), (0, (mkprocBodyDecl 57
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 58 ((*X*) 15) Integer In) :: 
  (mkparamSpec 59 ((*Z*) 16) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 60 (mkobjDecl 61 ((*V*) 17) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 62
    (Call 63 64 ((*R*) 4) 
      ((Name 65 (Identifier 66 ((*Z*) 16) )) :: nil)
    ) 
    (Seq 67
    (Call 68 69 ((*incX*) 3) 
      ((Name 70 (Identifier 71 ((*X*) 15) )) :: (Name 72 (Identifier 73 ((*V*) 17) )) :: nil)
    ) 
    (Assign 74 (Identifier 75 ((*Z*) 16) ) (BinOp 76 Plus (Name 77 (Identifier 78 ((*Z*) 16) )) (Name 79 (Identifier 80 ((*V*) 17) )) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (77, Integer) :: (41, Integer) :: (50, Integer) :: (44, Integer) :: (53, Integer) :: (80, Integer) :: (26, Integer) :: (71, Integer) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (65, Integer) :: (73, Integer) :: (55, Integer) :: (49, Integer) :: (76, Integer) :: (22, Integer) :: (79, Integer) :: (70, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (78, Integer) :: (45, Integer) :: (54, Integer) :: (72, Integer) :: (36, Boolean) :: (18, Integer) :: (21, Integer) :: (48, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (42, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (77, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (41, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (50, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (44, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)5)) :: (80, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (26, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (71, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (38, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (47, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)12)) :: (20, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)16)) :: (65, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (73, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (55, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (49, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (76, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)15)) :: (22, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (79, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (70, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (43, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (25, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (37, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (19, (sloc (*Line*)8 (*Col*)11 (*EndLine*)8 (*EndCol*)21)) :: (78, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (45, (sloc (*Line*)16 (*Col*)21 (*EndLine*)16 (*EndCol*)21)) :: (54, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (72, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (36, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (18, (sloc (*Line*)8 (*Col*)6 (*EndLine*)8 (*EndCol*)6)) :: (21, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (48, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)21)) :: (75, (sloc (*Line*)29 (*Col*)6 (*EndLine*)29 (*EndCol*)6)) :: (39, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (66, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (42, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (24, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (51, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("V", "ada://variable/P_Simple_Call-1:9/Q-7:13/V+25:6")) :: (8, ("X", "ada://parameter/P_Simple_Call-1:9/R-13:13/X-13:15")) :: (11, ("Z", "ada://parameter/P_Simple_Call-1:9/incX-11:13/Z-11:34")) :: (5, ("C", "ada://variable/P_Simple_Call-1:9/C-18:4")) :: (16, ("Z", "ada://parameter/P_Simple_Call-1:9/Q-7:13/Z-7:30")) :: (7, ("B", "ada://variable/P_Simple_Call-1:9/B+4:3")) :: (10, ("X", "ada://parameter/P_Simple_Call-1:9/incX-11:13/X-11:18")) :: (1, ("Y", "ada://variable/P_Simple_Call-1:9/Y-6:3")) :: (12, ("result", "ada://variable/P_Simple_Call-1:9/incX-11:13/result+13:5")) :: (15, ("X", "ada://parameter/P_Simple_Call-1:9/Q-7:13/X-7:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call-1:9/Q-7:13")) :: (4, ("R", "ada://procedure/P_Simple_Call-1:9/R-13:13")) :: (3, ("incX", "ada://procedure/P_Simple_Call-1:9/incX-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("P_Simple_Call", "ada://package_body/P_Simple_Call-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(ObjDeclRT 3 (mkobjDeclRT 4 ((*Y*) 1) Integer None)) 
(SeqDeclRT 5
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 6
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 7
NullDeclRT (* Undefined Declarations ! *) 
(ObjDeclRT 8 (mkobjDeclRT 9 ((*C*) 5) Integer None)))))) 
(SeqDeclRT 10
(ObjDeclRT 11 (mkobjDeclRT 12 ((*B*) 7) Integer None)) 
(SeqDeclRT 13
(ProcBodyDeclRT 14 
  (mkprocBodyDeclRT 15
    (* = = = Procedure Name = = = *)
    ((*R*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 16 ((*X*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 17 (IdentifierRT 18 ((*X*) 8) (nil)) (BinOpRT 19 Plus (BinOpRT 20 Plus (NameRT 21 (IdentifierRT 22 ((*Y*) 1) (nil))) (NameRT 23 (IdentifierRT 24 ((*B*) 7) (nil))) (OverflowCheck :: nil) nil) (NameRT 25 (IdentifierRT 26 ((*C*) 5) (nil))) (OverflowCheck :: nil) nil))
  )
) 
(SeqDeclRT 27
(ProcBodyDeclRT 28 
  (mkprocBodyDeclRT 29
    (* = = = Procedure Name = = = *)
    ((*incX*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 30 ((*X*) 10) Integer In) :: 
    (mkparamSpecRT 31 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 32 (mkobjDeclRT 33 ((*result*) 12) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 34
      (IfRT 35 (BinOpRT 36 Equal (NameRT 37 (IdentifierRT 38 ((*X*) 10) (nil))) (LiteralRT 39 (Integer_Literal 0) (nil) nil) (nil) nil)
        (AssignRT 40 (IdentifierRT 41 ((*result*) 12) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 10) (nil))) (LiteralRT 45 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
        (AssignRT 46 (IdentifierRT 47 ((*result*) 12) (nil)) (BinOpRT 48 Minus (NameRT 49 (IdentifierRT 50 ((*X*) 10) (nil))) (LiteralRT 51 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
      ) 
      (AssignRT 52 (IdentifierRT 53 ((*Z*) 11) (nil)) (NameRT 54 (IdentifierRT 55 ((*result*) 12) (nil)))))
  )
) 
(ProcBodyDeclRT 56 
  (mkprocBodyDeclRT 57
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 58 ((*X*) 15) Integer In) :: 
    (mkparamSpecRT 59 ((*Z*) 16) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 60 (mkobjDeclRT 61 ((*V*) 17) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 62
      (CallRT 63 64 ((*R*) 4) 
        ((NameRT 65 (IdentifierRT 66 ((*Z*) 16) (nil))) :: nil)
      ) 
      (SeqRT 67
      (CallRT 68 69 ((*incX*) 3) 
        ((NameRT 70 (IdentifierRT 71 ((*X*) 15) (nil))) :: (NameRT 72 (IdentifierRT 73 ((*V*) 17) (nil))) :: nil)
      ) 
      (AssignRT 74 (IdentifierRT 75 ((*Z*) 16) (nil)) (BinOpRT 76 Plus (NameRT 77 (IdentifierRT 78 ((*Z*) 16) (nil))) (NameRT 79 (IdentifierRT 80 ((*V*) 17) (nil))) (OverflowCheck :: nil) nil))))
  )
)))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*C*) 5), (In_Out, Integer)) :: (((*B*) 7), (In_Out, Integer)) :: (((*V*) 17), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*Z*) 16), (Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: (((*X*) 15), (In, Integer)) :: (((*result*) 12), (In_Out, Integer)) :: (((*X*) 8), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 4), (0, (mkprocBodyDeclRT 15
  (* = = = Procedure Name = = = *)
  ((*R*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 16 ((*X*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 17 (IdentifierRT 18 ((*X*) 8) (nil)) (BinOpRT 19 Plus (BinOpRT 20 Plus (NameRT 21 (IdentifierRT 22 ((*Y*) 1) (nil))) (NameRT 23 (IdentifierRT 24 ((*B*) 7) (nil))) (OverflowCheck :: nil) nil) (NameRT 25 (IdentifierRT 26 ((*C*) 5) (nil))) (OverflowCheck :: nil) nil))
))) :: (((*incX*) 3), (0, (mkprocBodyDeclRT 29
  (* = = = Procedure Name = = = *)
  ((*incX*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 30 ((*X*) 10) Integer In) :: 
  (mkparamSpecRT 31 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 32 (mkobjDeclRT 33 ((*result*) 12) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 34
    (IfRT 35 (BinOpRT 36 Equal (NameRT 37 (IdentifierRT 38 ((*X*) 10) (nil))) (LiteralRT 39 (Integer_Literal 0) (nil) nil) (nil) nil)
      (AssignRT 40 (IdentifierRT 41 ((*result*) 12) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 10) (nil))) (LiteralRT 45 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
      (AssignRT 46 (IdentifierRT 47 ((*result*) 12) (nil)) (BinOpRT 48 Minus (NameRT 49 (IdentifierRT 50 ((*X*) 10) (nil))) (LiteralRT 51 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
    ) 
    (AssignRT 52 (IdentifierRT 53 ((*Z*) 11) (nil)) (NameRT 54 (IdentifierRT 55 ((*result*) 12) (nil)))))
))) :: (((*Q*) 2), (0, (mkprocBodyDeclRT 57
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 58 ((*X*) 15) Integer In) :: 
  (mkparamSpecRT 59 ((*Z*) 16) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 60 (mkobjDeclRT 61 ((*V*) 17) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 62
    (CallRT 63 64 ((*R*) 4) 
      ((NameRT 65 (IdentifierRT 66 ((*Z*) 16) (nil))) :: nil)
    ) 
    (SeqRT 67
    (CallRT 68 69 ((*incX*) 3) 
      ((NameRT 70 (IdentifierRT 71 ((*X*) 15) (nil))) :: (NameRT 72 (IdentifierRT 73 ((*V*) 17) (nil))) :: nil)
    ) 
    (AssignRT 74 (IdentifierRT 75 ((*Z*) 16) (nil)) (BinOpRT 76 Plus (NameRT 77 (IdentifierRT 78 ((*Z*) 16) (nil))) (NameRT 79 (IdentifierRT 80 ((*V*) 17) (nil))) (OverflowCheck :: nil) nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (77, Integer) :: (41, Integer) :: (50, Integer) :: (44, Integer) :: (53, Integer) :: (80, Integer) :: (26, Integer) :: (71, Integer) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (65, Integer) :: (73, Integer) :: (55, Integer) :: (49, Integer) :: (76, Integer) :: (22, Integer) :: (79, Integer) :: (70, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (78, Integer) :: (45, Integer) :: (54, Integer) :: (72, Integer) :: (36, Boolean) :: (18, Integer) :: (21, Integer) :: (48, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (42, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (77, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (41, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (50, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (44, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)5)) :: (80, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (26, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (71, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (38, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (47, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)12)) :: (20, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)16)) :: (65, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (73, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (55, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (49, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)17)) :: (76, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)15)) :: (22, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (79, (sloc (*Line*)29 (*Col*)15 (*EndLine*)29 (*EndCol*)15)) :: (70, (sloc (*Line*)28 (*Col*)11 (*EndLine*)28 (*EndCol*)11)) :: (43, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)17)) :: (25, (sloc (*Line*)8 (*Col*)21 (*EndLine*)8 (*EndCol*)21)) :: (37, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (19, (sloc (*Line*)8 (*Col*)11 (*EndLine*)8 (*EndCol*)21)) :: (78, (sloc (*Line*)29 (*Col*)11 (*EndLine*)29 (*EndCol*)11)) :: (45, (sloc (*Line*)16 (*Col*)21 (*EndLine*)16 (*EndCol*)21)) :: (54, (sloc (*Line*)20 (*Col*)10 (*EndLine*)20 (*EndCol*)15)) :: (72, (sloc (*Line*)28 (*Col*)14 (*EndLine*)28 (*EndCol*)14)) :: (36, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (18, (sloc (*Line*)8 (*Col*)6 (*EndLine*)8 (*EndCol*)6)) :: (21, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (48, (sloc (*Line*)18 (*Col*)17 (*EndLine*)18 (*EndCol*)21)) :: (75, (sloc (*Line*)29 (*Col*)6 (*EndLine*)29 (*EndCol*)6)) :: (39, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (66, (sloc (*Line*)27 (*Col*)8 (*EndLine*)27 (*EndCol*)8)) :: (42, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (24, (sloc (*Line*)8 (*Col*)16 (*EndLine*)8 (*EndCol*)16)) :: (51, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("V", "ada://variable/P_Simple_Call-1:9/Q-7:13/V+25:6")) :: (8, ("X", "ada://parameter/P_Simple_Call-1:9/R-13:13/X-13:15")) :: (11, ("Z", "ada://parameter/P_Simple_Call-1:9/incX-11:13/Z-11:34")) :: (5, ("C", "ada://variable/P_Simple_Call-1:9/C-18:4")) :: (16, ("Z", "ada://parameter/P_Simple_Call-1:9/Q-7:13/Z-7:30")) :: (7, ("B", "ada://variable/P_Simple_Call-1:9/B+4:3")) :: (10, ("X", "ada://parameter/P_Simple_Call-1:9/incX-11:13/X-11:18")) :: (1, ("Y", "ada://variable/P_Simple_Call-1:9/Y-6:3")) :: (12, ("result", "ada://variable/P_Simple_Call-1:9/incX-11:13/result+13:5")) :: (15, ("X", "ada://parameter/P_Simple_Call-1:9/Q-7:13/X-7:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call-1:9/Q-7:13")) :: (4, ("R", "ada://procedure/P_Simple_Call-1:9/R-13:13")) :: (3, ("incX", "ada://procedure/P_Simple_Call-1:9/incX-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("P_Simple_Call", "ada://package_body/P_Simple_Call-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

