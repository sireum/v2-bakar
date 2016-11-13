Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
NullDecl (* Undefined Declarations ! *) 
NullDecl (* Undefined Declarations ! *)) 
(SeqDecl 3
(ProcBodyDecl 4 
  (mkprocBodyDecl 5
    (* = = = Procedure Name = = = *)
    ((*add*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 6 ((*x*) 4) Integer In_Out) :: 
    (mkparamSpec 7 ((*y*) 5) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 8 (Identifier 9 ((*x*) 4) ) (BinOp 10 Plus (Name 11 (Identifier 12 ((*x*) 4) )) (Name 13 (Identifier 14 ((*y*) 5) )) ))
  )
) 
(ProcBodyDecl 15 
  (mkprocBodyDecl 16
    (* = = = Procedure Name = = = *)
    ((*foo*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 17 ((*A*) 7) Integer In_Out) :: 
    (mkparamSpec 18 ((*B*) 8) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 19 (mkobjDecl 20 ((*M*) 9) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 21
      (Assign 22 (Identifier 23 ((*M*) 9) ) (Literal 24 (Integer_Literal 3) )) 
      (Seq 25
      (Call 26 27 ((*add*) 1) 
        ((Name 28 (Identifier 29 ((*A*) 7) )) :: (Name 30 (Identifier 31 ((*M*) 9) )) :: nil)
      ) 
      (Seq 32
      (Call 33 34 ((*add*) 1) 
        ((Name 35 (Identifier 36 ((*B*) 8) )) :: (Literal 37 (Integer_Literal 5) ) :: nil)
      ) 
      (Seq 38
      (Assign 39 (Identifier 40 ((*A*) 7) ) (BinOp 41 Plus (Name 42 (Identifier 43 ((*A*) 7) )) (Literal 44 (Integer_Literal 2) ) )) 
      (Assign 45 (Identifier 46 ((*B*) 8) ) (BinOp 47 Plus (Name 48 (Identifier 49 ((*B*) 8) )) (Literal 50 (Integer_Literal 5) ) ))))))
  )
)))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*y*) 5), (In, Integer)) :: (((*A*) 7), (In_Out, Integer)) :: (((*x*) 4), (In_Out, Integer)) :: (((*M*) 9), (In_Out, Integer)) :: (((*B*) 8), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*add*) 1), (0, (mkprocBodyDecl 5
  (* = = = Procedure Name = = = *)
  ((*add*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 6 ((*x*) 4) Integer In_Out) :: 
  (mkparamSpec 7 ((*y*) 5) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 8 (Identifier 9 ((*x*) 4) ) (BinOp 10 Plus (Name 11 (Identifier 12 ((*x*) 4) )) (Name 13 (Identifier 14 ((*y*) 5) )) ))
))) :: (((*foo*) 2), (0, (mkprocBodyDecl 16
  (* = = = Procedure Name = = = *)
  ((*foo*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 17 ((*A*) 7) Integer In_Out) :: 
  (mkparamSpec 18 ((*B*) 8) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 19 (mkobjDecl 20 ((*M*) 9) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 21
    (Assign 22 (Identifier 23 ((*M*) 9) ) (Literal 24 (Integer_Literal 3) )) 
    (Seq 25
    (Call 26 27 ((*add*) 1) 
      ((Name 28 (Identifier 29 ((*A*) 7) )) :: (Name 30 (Identifier 31 ((*M*) 9) )) :: nil)
    ) 
    (Seq 32
    (Call 33 34 ((*add*) 1) 
      ((Name 35 (Identifier 36 ((*B*) 8) )) :: (Literal 37 (Integer_Literal 5) ) :: nil)
    ) 
    (Seq 38
    (Assign 39 (Identifier 40 ((*A*) 7) ) (BinOp 41 Plus (Name 42 (Identifier 43 ((*A*) 7) )) (Literal 44 (Integer_Literal 2) ) )) 
    (Assign 45 (Identifier 46 ((*B*) 8) ) (BinOp 47 Plus (Name 48 (Identifier 49 ((*B*) 8) )) (Literal 50 (Integer_Literal 5) ) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (50, Integer) :: (35, Integer) :: (44, Integer) :: (11, Integer) :: (29, Integer) :: (47, Integer) :: (14, Integer) :: (46, Integer) :: (40, Integer) :: (49, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (10, Integer) :: (37, Integer) :: (28, Integer) :: (9, Integer) :: (36, Integer) :: (12, Integer) :: (48, Integer) :: (30, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (41, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)15)) :: (50, (sloc (*Line*)18 (*Col*)15 (*EndLine*)18 (*EndCol*)15)) :: (35, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (44, (sloc (*Line*)17 (*Col*)15 (*EndLine*)17 (*EndCol*)15)) :: (11, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (29, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (47, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)15)) :: (14, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (46, (sloc (*Line*)18 (*Col*)6 (*EndLine*)18 (*EndCol*)6)) :: (40, (sloc (*Line*)17 (*Col*)6 (*EndLine*)17 (*EndCol*)6)) :: (49, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (13, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (31, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (43, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (10, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)15)) :: (37, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)12)) :: (28, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (9, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (36, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (12, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (48, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (30, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (42, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (24, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("B", "ada://parameter/Example-1:9/foo-5:15/B-5:41")) :: (5, ("y", "ada://parameter/Example-1:9/add-2:15/y-2:41")) :: (4, ("x", "ada://parameter/Example-1:9/add-2:15/x-2:21")) :: (7, ("A", "ada://parameter/Example-1:9/foo-5:15/A-5:21")) :: (9, ("M", "ada://variable/Example-1:9/foo-5:15/M+12:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("foo", "ada://procedure_body/Example-1:9/foo-5:15")) :: (1, ("add", "ada://procedure/Example-1:9/add-2:15")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Example", "ada://package_body/Example-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
NullDeclRT (* Undefined Declarations ! *) 
NullDeclRT (* Undefined Declarations ! *)) 
(SeqDeclRT 3
(ProcBodyDeclRT 4 
  (mkprocBodyDeclRT 5
    (* = = = Procedure Name = = = *)
    ((*add*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 6 ((*x*) 4) Integer In_Out) :: 
    (mkparamSpecRT 7 ((*y*) 5) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 8 (IdentifierRT 9 ((*x*) 4) (nil)) (BinOpRT 10 Plus (NameRT 11 (IdentifierRT 12 ((*x*) 4) (nil))) (NameRT 13 (IdentifierRT 14 ((*y*) 5) (nil))) (OverflowCheck :: nil) nil))
  )
) 
(ProcBodyDeclRT 15 
  (mkprocBodyDeclRT 16
    (* = = = Procedure Name = = = *)
    ((*foo*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 17 ((*A*) 7) Integer In_Out) :: 
    (mkparamSpecRT 18 ((*B*) 8) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 19 (mkobjDeclRT 20 ((*M*) 9) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 21
      (AssignRT 22 (IdentifierRT 23 ((*M*) 9) (nil)) (LiteralRT 24 (Integer_Literal 3) (nil) nil)) 
      (SeqRT 25
      (CallRT 26 27 ((*add*) 1) 
        ((NameRT 28 (IdentifierRT 29 ((*A*) 7) (nil))) :: (NameRT 30 (IdentifierRT 31 ((*M*) 9) (nil))) :: nil)
      ) 
      (SeqRT 32
      (CallRT 33 34 ((*add*) 1) 
        ((NameRT 35 (IdentifierRT 36 ((*B*) 8) (nil))) :: (LiteralRT 37 (Integer_Literal 5) (nil) nil) :: nil)
      ) 
      (SeqRT 38
      (AssignRT 39 (IdentifierRT 40 ((*A*) 7) (nil)) (BinOpRT 41 Plus (NameRT 42 (IdentifierRT 43 ((*A*) 7) (nil))) (LiteralRT 44 (Integer_Literal 2) (nil) nil) (OverflowCheck :: nil) nil)) 
      (AssignRT 45 (IdentifierRT 46 ((*B*) 8) (nil)) (BinOpRT 47 Plus (NameRT 48 (IdentifierRT 49 ((*B*) 8) (nil))) (LiteralRT 50 (Integer_Literal 5) (nil) nil) (OverflowCheck :: nil) nil))))))
  )
)))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*y*) 5), (In, Integer)) :: (((*A*) 7), (In_Out, Integer)) :: (((*x*) 4), (In_Out, Integer)) :: (((*M*) 9), (In_Out, Integer)) :: (((*B*) 8), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*add*) 1), (0, (mkprocBodyDeclRT 5
  (* = = = Procedure Name = = = *)
  ((*add*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 6 ((*x*) 4) Integer In_Out) :: 
  (mkparamSpecRT 7 ((*y*) 5) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 8 (IdentifierRT 9 ((*x*) 4) (nil)) (BinOpRT 10 Plus (NameRT 11 (IdentifierRT 12 ((*x*) 4) (nil))) (NameRT 13 (IdentifierRT 14 ((*y*) 5) (nil))) (OverflowCheck :: nil) nil))
))) :: (((*foo*) 2), (0, (mkprocBodyDeclRT 16
  (* = = = Procedure Name = = = *)
  ((*foo*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 17 ((*A*) 7) Integer In_Out) :: 
  (mkparamSpecRT 18 ((*B*) 8) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 19 (mkobjDeclRT 20 ((*M*) 9) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 21
    (AssignRT 22 (IdentifierRT 23 ((*M*) 9) (nil)) (LiteralRT 24 (Integer_Literal 3) (nil) nil)) 
    (SeqRT 25
    (CallRT 26 27 ((*add*) 1) 
      ((NameRT 28 (IdentifierRT 29 ((*A*) 7) (nil))) :: (NameRT 30 (IdentifierRT 31 ((*M*) 9) (nil))) :: nil)
    ) 
    (SeqRT 32
    (CallRT 33 34 ((*add*) 1) 
      ((NameRT 35 (IdentifierRT 36 ((*B*) 8) (nil))) :: (LiteralRT 37 (Integer_Literal 5) (nil) nil) :: nil)
    ) 
    (SeqRT 38
    (AssignRT 39 (IdentifierRT 40 ((*A*) 7) (nil)) (BinOpRT 41 Plus (NameRT 42 (IdentifierRT 43 ((*A*) 7) (nil))) (LiteralRT 44 (Integer_Literal 2) (nil) nil) (OverflowCheck :: nil) nil)) 
    (AssignRT 45 (IdentifierRT 46 ((*B*) 8) (nil)) (BinOpRT 47 Plus (NameRT 48 (IdentifierRT 49 ((*B*) 8) (nil))) (LiteralRT 50 (Integer_Literal 5) (nil) nil) (OverflowCheck :: nil) nil))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (50, Integer) :: (35, Integer) :: (44, Integer) :: (11, Integer) :: (29, Integer) :: (47, Integer) :: (14, Integer) :: (46, Integer) :: (40, Integer) :: (49, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (10, Integer) :: (37, Integer) :: (28, Integer) :: (9, Integer) :: (36, Integer) :: (12, Integer) :: (48, Integer) :: (30, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)14 (*Col*)6 (*EndLine*)14 (*EndCol*)6)) :: (41, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)15)) :: (50, (sloc (*Line*)18 (*Col*)15 (*EndLine*)18 (*EndCol*)15)) :: (35, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (44, (sloc (*Line*)17 (*Col*)15 (*EndLine*)17 (*EndCol*)15)) :: (11, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (29, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (47, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)15)) :: (14, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (46, (sloc (*Line*)18 (*Col*)6 (*EndLine*)18 (*EndCol*)6)) :: (40, (sloc (*Line*)17 (*Col*)6 (*EndLine*)17 (*EndCol*)6)) :: (49, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (13, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)15)) :: (31, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (43, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (10, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)15)) :: (37, (sloc (*Line*)16 (*Col*)12 (*EndLine*)16 (*EndCol*)12)) :: (28, (sloc (*Line*)15 (*Col*)10 (*EndLine*)15 (*EndCol*)10)) :: (9, (sloc (*Line*)7 (*Col*)6 (*EndLine*)7 (*EndCol*)6)) :: (36, (sloc (*Line*)16 (*Col*)10 (*EndLine*)16 (*EndCol*)10)) :: (12, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (48, (sloc (*Line*)18 (*Col*)11 (*EndLine*)18 (*EndCol*)11)) :: (30, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (42, (sloc (*Line*)17 (*Col*)11 (*EndLine*)17 (*EndCol*)11)) :: (24, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("B", "ada://parameter/Example-1:9/foo-5:15/B-5:41")) :: (5, ("y", "ada://parameter/Example-1:9/add-2:15/y-2:41")) :: (4, ("x", "ada://parameter/Example-1:9/add-2:15/x-2:21")) :: (7, ("A", "ada://parameter/Example-1:9/foo-5:15/A-5:21")) :: (9, ("M", "ada://variable/Example-1:9/foo-5:15/M+12:3")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("foo", "ada://procedure_body/Example-1:9/foo-5:15")) :: (1, ("add", "ada://procedure/Example-1:9/add-2:15")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Example", "ada://package_body/Example-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

