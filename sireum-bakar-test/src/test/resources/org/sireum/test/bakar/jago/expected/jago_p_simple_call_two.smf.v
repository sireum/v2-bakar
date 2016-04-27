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
(ObjDecl 7 (mkobjDecl 8 ((*C*) 4) Integer None))))) 
(SeqDecl 9
(ObjDecl 10 (mkobjDecl 11 ((*B*) 6) Integer None)) 
(SeqDecl 12
(ProcBodyDecl 13 
  (mkprocBodyDecl 14
    (* = = = Procedure Name = = = *)
    ((*R*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 15 ((*X*) 7) Integer In) :: 
    (mkparamSpec 16 ((*Z*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 17 (Identifier 18 ((*Z*) 8) ) (BinOp 19 Plus (BinOp 20 Plus (BinOp 21 Plus (Name 22 (Identifier 23 ((*X*) 7) )) (Name 24 (Identifier 25 ((*Y*) 1) )) ) (Name 26 (Identifier 27 ((*B*) 6) )) ) (Name 28 (Identifier 29 ((*C*) 4) )) ))
  )
) 
(ProcBodyDecl 30 
  (mkprocBodyDecl 31
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 32 ((*X*) 10) Integer In) :: 
    (mkparamSpec 33 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 34
      (Call 35 36 ((*R*) 3) 
        ((Name 37 (Identifier 38 ((*X*) 10) )) :: (Name 39 (Identifier 40 ((*Z*) 11) )) :: nil)
      ) 
      (Assign 41 (Identifier 42 ((*Z*) 11) ) (BinOp 43 Plus (Name 44 (Identifier 45 ((*Z*) 11) )) (Name 46 (Identifier 47 ((*X*) 10) )) )))
  )
))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 7), (In, Integer)) :: (((*Z*) 8), (Out, Integer)) :: (((*C*) 4), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*B*) 6), (In_Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 3), (0, (mkprocBodyDecl 14
  (* = = = Procedure Name = = = *)
  ((*R*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 15 ((*X*) 7) Integer In) :: 
  (mkparamSpec 16 ((*Z*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 17 (Identifier 18 ((*Z*) 8) ) (BinOp 19 Plus (BinOp 20 Plus (BinOp 21 Plus (Name 22 (Identifier 23 ((*X*) 7) )) (Name 24 (Identifier 25 ((*Y*) 1) )) ) (Name 26 (Identifier 27 ((*B*) 6) )) ) (Name 28 (Identifier 29 ((*C*) 4) )) ))
))) :: (((*Q*) 2), (0, (mkprocBodyDecl 31
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 32 ((*X*) 10) Integer In) :: 
  (mkparamSpec 33 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 34
    (Call 35 36 ((*R*) 3) 
      ((Name 37 (Identifier 38 ((*X*) 10) )) :: (Name 39 (Identifier 40 ((*Z*) 11) )) :: nil)
    ) 
    (Assign 41 (Identifier 42 ((*Z*) 11) ) (BinOp 43 Plus (Name 44 (Identifier 45 ((*Z*) 11) )) (Name 46 (Identifier 47 ((*X*) 10) )) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (44, Integer) :: (26, Integer) :: (47, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (46, Integer) :: (40, Integer) :: (22, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (45, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (44, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (26, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (47, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (38, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (29, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (20, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)22)) :: (46, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (40, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (22, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (43, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)15)) :: (25, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: (37, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (19, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)27)) :: (28, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (45, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (18, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (21, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)17)) :: (39, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (24, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/Z-11:30")) :: (11, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/Z-7:30")) :: (4, ("C", "ada://variable/P_Simple_Call_Two-1:9/C-16:4")) :: (7, ("X", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/X-11:15")) :: (10, ("X", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/X-7:15")) :: (1, ("Y", "ada://variable/P_Simple_Call_Two-1:9/Y-6:3")) :: (6, ("B", "ada://variable/P_Simple_Call_Two-1:9/B+3:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call_Two-1:9/Q-7:13")) :: (3, ("R", "ada://procedure/P_Simple_Call_Two-1:9/R-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("P_Simple_Call_Two", "ada://package_body/P_Simple_Call_Two-1:9")) :: nil)
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
(ObjDeclRT 7 (mkobjDeclRT 8 ((*C*) 4) Integer None))))) 
(SeqDeclRT 9
(ObjDeclRT 10 (mkobjDeclRT 11 ((*B*) 6) Integer None)) 
(SeqDeclRT 12
(ProcBodyDeclRT 13 
  (mkprocBodyDeclRT 14
    (* = = = Procedure Name = = = *)
    ((*R*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 15 ((*X*) 7) Integer In) :: 
    (mkparamSpecRT 16 ((*Z*) 8) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 17 (IdentifierRT 18 ((*Z*) 8) (nil)) (BinOpRT 19 Plus (BinOpRT 20 Plus (BinOpRT 21 Plus (NameRT 22 (IdentifierRT 23 ((*X*) 7) (nil))) (NameRT 24 (IdentifierRT 25 ((*Y*) 1) (nil))) (OverflowCheck :: nil) nil) (NameRT 26 (IdentifierRT 27 ((*B*) 6) (nil))) (OverflowCheck :: nil) nil) (NameRT 28 (IdentifierRT 29 ((*C*) 4) (nil))) (OverflowCheck :: nil) nil))
  )
) 
(ProcBodyDeclRT 30 
  (mkprocBodyDeclRT 31
    (* = = = Procedure Name = = = *)
    ((*Q*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 32 ((*X*) 10) Integer In) :: 
    (mkparamSpecRT 33 ((*Z*) 11) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 34
      (CallRT 35 36 ((*R*) 3) 
        ((NameRT 37 (IdentifierRT 38 ((*X*) 10) (nil))) :: (NameRT 39 (IdentifierRT 40 ((*Z*) 11) (nil))) :: nil)
      ) 
      (AssignRT 41 (IdentifierRT 42 ((*Z*) 11) (nil)) (BinOpRT 43 Plus (NameRT 44 (IdentifierRT 45 ((*Z*) 11) (nil))) (NameRT 46 (IdentifierRT 47 ((*X*) 10) (nil))) (OverflowCheck :: nil) nil)))
  )
))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 7), (In, Integer)) :: (((*Z*) 8), (Out, Integer)) :: (((*C*) 4), (In_Out, Integer)) :: (((*X*) 10), (In, Integer)) :: (((*Z*) 11), (Out, Integer)) :: (((*B*) 6), (In_Out, Integer)) :: (((*Y*) 1), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*R*) 3), (0, (mkprocBodyDeclRT 14
  (* = = = Procedure Name = = = *)
  ((*R*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 15 ((*X*) 7) Integer In) :: 
  (mkparamSpecRT 16 ((*Z*) 8) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 17 (IdentifierRT 18 ((*Z*) 8) (nil)) (BinOpRT 19 Plus (BinOpRT 20 Plus (BinOpRT 21 Plus (NameRT 22 (IdentifierRT 23 ((*X*) 7) (nil))) (NameRT 24 (IdentifierRT 25 ((*Y*) 1) (nil))) (OverflowCheck :: nil) nil) (NameRT 26 (IdentifierRT 27 ((*B*) 6) (nil))) (OverflowCheck :: nil) nil) (NameRT 28 (IdentifierRT 29 ((*C*) 4) (nil))) (OverflowCheck :: nil) nil))
))) :: (((*Q*) 2), (0, (mkprocBodyDeclRT 31
  (* = = = Procedure Name = = = *)
  ((*Q*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 32 ((*X*) 10) Integer In) :: 
  (mkparamSpecRT 33 ((*Z*) 11) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 34
    (CallRT 35 36 ((*R*) 3) 
      ((NameRT 37 (IdentifierRT 38 ((*X*) 10) (nil))) :: (NameRT 39 (IdentifierRT 40 ((*Z*) 11) (nil))) :: nil)
    ) 
    (AssignRT 41 (IdentifierRT 42 ((*Z*) 11) (nil)) (BinOpRT 43 Plus (NameRT 44 (IdentifierRT 45 ((*Z*) 11) (nil))) (NameRT 46 (IdentifierRT 47 ((*X*) 10) (nil))) (OverflowCheck :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (44, Integer) :: (26, Integer) :: (47, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (46, Integer) :: (40, Integer) :: (22, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (45, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (44, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (26, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (47, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (38, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (29, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (20, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)22)) :: (46, (sloc (*Line*)14 (*Col*)15 (*EndLine*)14 (*EndCol*)15)) :: (40, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (22, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)13)) :: (43, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)15)) :: (25, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: (37, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (19, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)27)) :: (28, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (45, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: (18, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)22)) :: (21, (sloc (*Line*)7 (*Col*)13 (*EndLine*)7 (*EndCol*)17)) :: (39, (sloc (*Line*)13 (*Col*)10 (*EndLine*)13 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (24, (sloc (*Line*)7 (*Col*)17 (*EndLine*)7 (*EndCol*)17)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/Z-11:30")) :: (11, ("Z", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/Z-7:30")) :: (4, ("C", "ada://variable/P_Simple_Call_Two-1:9/C-16:4")) :: (7, ("X", "ada://parameter/P_Simple_Call_Two-1:9/R-11:13/X-11:15")) :: (10, ("X", "ada://parameter/P_Simple_Call_Two-1:9/Q-7:13/X-7:15")) :: (1, ("Y", "ada://variable/P_Simple_Call_Two-1:9/Y-6:3")) :: (6, ("B", "ada://variable/P_Simple_Call_Two-1:9/B+3:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Q", "ada://procedure_body/P_Simple_Call_Two-1:9/Q-7:13")) :: (3, ("R", "ada://procedure/P_Simple_Call_Two-1:9/R-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("P_Simple_Call_Two", "ada://package_body/P_Simple_Call_Two-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

