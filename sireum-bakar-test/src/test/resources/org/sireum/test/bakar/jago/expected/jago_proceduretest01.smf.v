Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 3
NullDecl (* Undefined Declarations ! *) 
NullDecl (* Undefined Declarations ! *))) 
(SeqDecl 4
(ProcBodyDecl 5 
  (mkprocBodyDecl 6
    (* = = = Procedure Name = = = *)
    ((*P*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 7 ((*a*) 5) Integer In) :: 
    (mkparamSpec 8 ((*b*) 6) Integer In_Out) :: 
    (mkparamSpec 9 ((*c*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 10
      (Assign 11 (Identifier 12 ((*b*) 6) ) (BinOp 13 Plus (Name 14 (Identifier 15 ((*a*) 5) )) (Name 16 (Identifier 17 ((*b*) 6) )) )) 
      (Assign 18 (Identifier 19 ((*c*) 7) ) (BinOp 20 Plus (Name 21 (Identifier 22 ((*a*) 5) )) (Name 23 (Identifier 24 ((*b*) 6) )) )))
  )
) 
(SeqDecl 25
(ProcBodyDecl 26 
  (mkprocBodyDecl 27
    (* = = = Procedure Name = = = *)
    ((*helper*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 28 ((*x*) 9) Integer In_Out) :: 
    (mkparamSpec 29 ((*y*) 10) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 30 (mkobjDecl 31 ((*arg0*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 32
      (Assign 33 (Identifier 34 ((*arg0*) 11) ) (Literal 35 (Integer_Literal 1) )) 
      (Call 36 37 ((*P*) 1) 
        ((Name 38 (Identifier 39 ((*arg0*) 11) )) :: (Name 40 (Identifier 41 ((*x*) 9) )) :: (Name 42 (Identifier 43 ((*y*) 10) )) :: nil)
      ))
  )
) 
(ProcBodyDecl 44 
  (mkprocBodyDecl 45
    (* = = = Procedure Name = = = *)
    ((*Q*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 46 ((*S*) 13) Integer In) :: 
    (mkparamSpec 47 ((*T*) 14) Integer Out) :: 
    (mkparamSpec 48 ((*R*) 15) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 49 (mkobjDecl 50 ((*L1*) 16) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 51
      (Assign 52 (Identifier 53 ((*L1*) 16) ) (Name 54 (Identifier 55 ((*S*) 13) ))) 
      (Seq 56
      (Call 57 58 ((*P*) 1) 
        ((Literal 59 (Integer_Literal 2) ) :: (Name 60 (Identifier 61 ((*L1*) 16) )) :: (Name 62 (Identifier 63 ((*T*) 14) )) :: nil)
      ) 
      (Seq 64
      (Assign 65 (Identifier 66 ((*R*) 15) ) (Literal 67 (Integer_Literal 5) )) 
      (Assign 68 (Identifier 69 ((*T*) 14) ) (BinOp 70 Plus (Name 71 (Identifier 72 ((*T*) 14) )) (Name 73 (Identifier 74 ((*L1*) 16) )) )))))
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
  ((((*T*) 14), (Out, Integer)) :: (((*c*) 7), (Out, Integer)) :: (((*L1*) 16), (In_Out, Integer)) :: (((*R*) 15), (Out, Integer)) :: (((*x*) 9), (In_Out, Integer)) :: (((*b*) 6), (In_Out, Integer)) :: (((*arg0*) 11), (In_Out, Integer)) :: (((*y*) 10), (Out, Integer)) :: (((*a*) 5), (In, Integer)) :: (((*S*) 13), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 3), (0, (mkprocBodyDecl 45
  (* = = = Procedure Name = = = *)
  ((*Q*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 46 ((*S*) 13) Integer In) :: 
  (mkparamSpec 47 ((*T*) 14) Integer Out) :: 
  (mkparamSpec 48 ((*R*) 15) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 49 (mkobjDecl 50 ((*L1*) 16) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 51
    (Assign 52 (Identifier 53 ((*L1*) 16) ) (Name 54 (Identifier 55 ((*S*) 13) ))) 
    (Seq 56
    (Call 57 58 ((*P*) 1) 
      ((Literal 59 (Integer_Literal 2) ) :: (Name 60 (Identifier 61 ((*L1*) 16) )) :: (Name 62 (Identifier 63 ((*T*) 14) )) :: nil)
    ) 
    (Seq 64
    (Assign 65 (Identifier 66 ((*R*) 15) ) (Literal 67 (Integer_Literal 5) )) 
    (Assign 68 (Identifier 69 ((*T*) 14) ) (BinOp 70 Plus (Name 71 (Identifier 72 ((*T*) 14) )) (Name 73 (Identifier 74 ((*L1*) 16) )) )))))
))) :: (((*helper*) 2), (0, (mkprocBodyDecl 27
  (* = = = Procedure Name = = = *)
  ((*helper*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 28 ((*x*) 9) Integer In_Out) :: 
  (mkparamSpec 29 ((*y*) 10) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 30 (mkobjDecl 31 ((*arg0*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 32
    (Assign 33 (Identifier 34 ((*arg0*) 11) ) (Literal 35 (Integer_Literal 1) )) 
    (Call 36 37 ((*P*) 1) 
      ((Name 38 (Identifier 39 ((*arg0*) 11) )) :: (Name 40 (Identifier 41 ((*x*) 9) )) :: (Name 42 (Identifier 43 ((*y*) 10) )) :: nil)
    ))
))) :: (((*P*) 1), (0, (mkprocBodyDecl 6
  (* = = = Procedure Name = = = *)
  ((*P*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 7 ((*a*) 5) Integer In) :: 
  (mkparamSpec 8 ((*b*) 6) Integer In_Out) :: 
  (mkparamSpec 9 ((*c*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 10
    (Assign 11 (Identifier 12 ((*b*) 6) ) (BinOp 13 Plus (Name 14 (Identifier 15 ((*a*) 5) )) (Name 16 (Identifier 17 ((*b*) 6) )) )) 
    (Assign 18 (Identifier 19 ((*c*) 7) ) (BinOp 20 Plus (Name 21 (Identifier 22 ((*a*) 5) )) (Name 23 (Identifier 24 ((*b*) 6) )) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (59, Integer) :: (62, Integer) :: (17, Integer) :: (35, Integer) :: (53, Integer) :: (71, Integer) :: (74, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (73, Integer) :: (55, Integer) :: (67, Integer) :: (40, Integer) :: (13, Integer) :: (22, Integer) :: (16, Integer) :: (70, Integer) :: (43, Integer) :: (34, Integer) :: (61, Integer) :: (19, Integer) :: (60, Integer) :: (69, Integer) :: (63, Integer) :: (54, Integer) :: (72, Integer) :: (21, Integer) :: (12, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: (41, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (59, (sloc (*Line*)21 (*Col*)8 (*EndLine*)21 (*EndCol*)8)) :: (62, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (17, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (35, (sloc (*Line*)13 (*Col*)17 (*EndLine*)13 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)6 (*EndLine*)20 (*EndCol*)7)) :: (71, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (74, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (38, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (20, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)14)) :: (14, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (73, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (55, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (67, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)11)) :: (40, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (13, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)14)) :: (22, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (16, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (70, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)16)) :: (43, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (34, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)12)) :: (61, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (19, (sloc (*Line*)7 (*Col*)5 (*EndLine*)7 (*EndCol*)5)) :: (60, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (69, (sloc (*Line*)23 (*Col*)6 (*EndLine*)23 (*EndCol*)6)) :: (63, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (54, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (72, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (21, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (12, (sloc (*Line*)6 (*Col*)5 (*EndLine*)6 (*EndCol*)5)) :: (39, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (66, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)6)) :: (15, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (24, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("arg0", "ada://variable/ProcedureTest01-1:9/helper-7:13/arg0+11:5")) :: (14, ("T", "ada://parameter/ProcedureTest01-1:9/Q-11:13/T-11:30")) :: (5, ("a", "ada://parameter/ProcedureTest01-1:9/P-3:13/a-3:15")) :: (13, ("S", "ada://parameter/ProcedureTest01-1:9/Q-11:13/S-11:15")) :: (16, ("L1", "ada://variable/ProcedureTest01-1:9/Q-11:13/L1+18:6")) :: (7, ("c", "ada://parameter/ProcedureTest01-1:9/P-3:13/c-3:49")) :: (10, ("y", "ada://parameter/ProcedureTest01-1:9/helper-7:13/y-7:39")) :: (9, ("x", "ada://parameter/ProcedureTest01-1:9/helper-7:13/x-7:20")) :: (15, ("R", "ada://parameter/ProcedureTest01-1:9/Q-11:13/R-11:46")) :: (6, ("b", "ada://parameter/ProcedureTest01-1:9/P-3:13/b-3:30")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("helper", "ada://procedure_body/ProcedureTest01-1:9/helper-7:13")) :: (1, ("P", "ada://procedure/ProcedureTest01-1:9/P-3:13")) :: (3, ("Q", "ada://procedure_body/ProcedureTest01-1:9/Q-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((4, ("ProcedureTest01", "ada://package_body/ProcedureTest01-1:9")) :: nil)
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
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 3
NullDeclRT (* Undefined Declarations ! *) 
NullDeclRT (* Undefined Declarations ! *))) 
(SeqDeclRT 4
(ProcBodyDeclRT 5 
  (mkprocBodyDeclRT 6
    (* = = = Procedure Name = = = *)
    ((*P*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 7 ((*a*) 5) Integer In) :: 
    (mkparamSpecRT 8 ((*b*) 6) Integer In_Out) :: 
    (mkparamSpecRT 9 ((*c*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 10
      (AssignRT 11 (IdentifierRT 12 ((*b*) 6) (nil)) (BinOpRT 13 Plus (NameRT 14 (IdentifierRT 15 ((*a*) 5) (nil))) (NameRT 16 (IdentifierRT 17 ((*b*) 6) (nil))) (OverflowCheck :: nil) nil)) 
      (AssignRT 18 (IdentifierRT 19 ((*c*) 7) (nil)) (BinOpRT 20 Plus (NameRT 21 (IdentifierRT 22 ((*a*) 5) (nil))) (NameRT 23 (IdentifierRT 24 ((*b*) 6) (nil))) (OverflowCheck :: nil) nil)))
  )
) 
(SeqDeclRT 25
(ProcBodyDeclRT 26 
  (mkprocBodyDeclRT 27
    (* = = = Procedure Name = = = *)
    ((*helper*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 28 ((*x*) 9) Integer In_Out) :: 
    (mkparamSpecRT 29 ((*y*) 10) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 30 (mkobjDeclRT 31 ((*arg0*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 32
      (AssignRT 33 (IdentifierRT 34 ((*arg0*) 11) (nil)) (LiteralRT 35 (Integer_Literal 1) (nil) nil)) 
      (CallRT 36 37 ((*P*) 1) 
        ((NameRT 38 (IdentifierRT 39 ((*arg0*) 11) (nil))) :: (NameRT 40 (IdentifierRT 41 ((*x*) 9) (nil))) :: (NameRT 42 (IdentifierRT 43 ((*y*) 10) (nil))) :: nil)
      ))
  )
) 
(ProcBodyDeclRT 44 
  (mkprocBodyDeclRT 45
    (* = = = Procedure Name = = = *)
    ((*Q*) 3)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 46 ((*S*) 13) Integer In) :: 
    (mkparamSpecRT 47 ((*T*) 14) Integer Out) :: 
    (mkparamSpecRT 48 ((*R*) 15) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 49 (mkobjDeclRT 50 ((*L1*) 16) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 51
      (AssignRT 52 (IdentifierRT 53 ((*L1*) 16) (nil)) (NameRT 54 (IdentifierRT 55 ((*S*) 13) (nil)))) 
      (SeqRT 56
      (CallRT 57 58 ((*P*) 1) 
        ((LiteralRT 59 (Integer_Literal 2) (nil) nil) :: (NameRT 60 (IdentifierRT 61 ((*L1*) 16) (nil))) :: (NameRT 62 (IdentifierRT 63 ((*T*) 14) (nil))) :: nil)
      ) 
      (SeqRT 64
      (AssignRT 65 (IdentifierRT 66 ((*R*) 15) (nil)) (LiteralRT 67 (Integer_Literal 5) (nil) nil)) 
      (AssignRT 68 (IdentifierRT 69 ((*T*) 14) (nil)) (BinOpRT 70 Plus (NameRT 71 (IdentifierRT 72 ((*T*) 14) (nil))) (NameRT 73 (IdentifierRT 74 ((*L1*) 16) (nil))) (OverflowCheck :: nil) nil)))))
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
  ((((*T*) 14), (Out, Integer)) :: (((*c*) 7), (Out, Integer)) :: (((*L1*) 16), (In_Out, Integer)) :: (((*R*) 15), (Out, Integer)) :: (((*x*) 9), (In_Out, Integer)) :: (((*b*) 6), (In_Out, Integer)) :: (((*arg0*) 11), (In_Out, Integer)) :: (((*y*) 10), (Out, Integer)) :: (((*a*) 5), (In, Integer)) :: (((*S*) 13), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 3), (0, (mkprocBodyDeclRT 45
  (* = = = Procedure Name = = = *)
  ((*Q*) 3)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 46 ((*S*) 13) Integer In) :: 
  (mkparamSpecRT 47 ((*T*) 14) Integer Out) :: 
  (mkparamSpecRT 48 ((*R*) 15) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 49 (mkobjDeclRT 50 ((*L1*) 16) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 51
    (AssignRT 52 (IdentifierRT 53 ((*L1*) 16) (nil)) (NameRT 54 (IdentifierRT 55 ((*S*) 13) (nil)))) 
    (SeqRT 56
    (CallRT 57 58 ((*P*) 1) 
      ((LiteralRT 59 (Integer_Literal 2) (nil) nil) :: (NameRT 60 (IdentifierRT 61 ((*L1*) 16) (nil))) :: (NameRT 62 (IdentifierRT 63 ((*T*) 14) (nil))) :: nil)
    ) 
    (SeqRT 64
    (AssignRT 65 (IdentifierRT 66 ((*R*) 15) (nil)) (LiteralRT 67 (Integer_Literal 5) (nil) nil)) 
    (AssignRT 68 (IdentifierRT 69 ((*T*) 14) (nil)) (BinOpRT 70 Plus (NameRT 71 (IdentifierRT 72 ((*T*) 14) (nil))) (NameRT 73 (IdentifierRT 74 ((*L1*) 16) (nil))) (OverflowCheck :: nil) nil)))))
))) :: (((*helper*) 2), (0, (mkprocBodyDeclRT 27
  (* = = = Procedure Name = = = *)
  ((*helper*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 28 ((*x*) 9) Integer In_Out) :: 
  (mkparamSpecRT 29 ((*y*) 10) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 30 (mkobjDeclRT 31 ((*arg0*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 32
    (AssignRT 33 (IdentifierRT 34 ((*arg0*) 11) (nil)) (LiteralRT 35 (Integer_Literal 1) (nil) nil)) 
    (CallRT 36 37 ((*P*) 1) 
      ((NameRT 38 (IdentifierRT 39 ((*arg0*) 11) (nil))) :: (NameRT 40 (IdentifierRT 41 ((*x*) 9) (nil))) :: (NameRT 42 (IdentifierRT 43 ((*y*) 10) (nil))) :: nil)
    ))
))) :: (((*P*) 1), (0, (mkprocBodyDeclRT 6
  (* = = = Procedure Name = = = *)
  ((*P*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 7 ((*a*) 5) Integer In) :: 
  (mkparamSpecRT 8 ((*b*) 6) Integer In_Out) :: 
  (mkparamSpecRT 9 ((*c*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 10
    (AssignRT 11 (IdentifierRT 12 ((*b*) 6) (nil)) (BinOpRT 13 Plus (NameRT 14 (IdentifierRT 15 ((*a*) 5) (nil))) (NameRT 16 (IdentifierRT 17 ((*b*) 6) (nil))) (OverflowCheck :: nil) nil)) 
    (AssignRT 18 (IdentifierRT 19 ((*c*) 7) (nil)) (BinOpRT 20 Plus (NameRT 21 (IdentifierRT 22 ((*a*) 5) (nil))) (NameRT 23 (IdentifierRT 24 ((*b*) 6) (nil))) (OverflowCheck :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (41, Integer) :: (59, Integer) :: (62, Integer) :: (17, Integer) :: (35, Integer) :: (53, Integer) :: (71, Integer) :: (74, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (73, Integer) :: (55, Integer) :: (67, Integer) :: (40, Integer) :: (13, Integer) :: (22, Integer) :: (16, Integer) :: (70, Integer) :: (43, Integer) :: (34, Integer) :: (61, Integer) :: (19, Integer) :: (60, Integer) :: (69, Integer) :: (63, Integer) :: (54, Integer) :: (72, Integer) :: (21, Integer) :: (12, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: (41, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (59, (sloc (*Line*)21 (*Col*)8 (*EndLine*)21 (*EndCol*)8)) :: (62, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (17, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (35, (sloc (*Line*)13 (*Col*)17 (*EndLine*)13 (*EndCol*)17)) :: (53, (sloc (*Line*)20 (*Col*)6 (*EndLine*)20 (*EndCol*)7)) :: (71, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (74, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (38, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (20, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)14)) :: (14, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (73, (sloc (*Line*)23 (*Col*)15 (*EndLine*)23 (*EndCol*)16)) :: (55, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (67, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)11)) :: (40, (sloc (*Line*)14 (*Col*)17 (*EndLine*)14 (*EndCol*)17)) :: (13, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)14)) :: (22, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (16, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (70, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)16)) :: (43, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (34, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)12)) :: (61, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (19, (sloc (*Line*)7 (*Col*)5 (*EndLine*)7 (*EndCol*)5)) :: (60, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)12)) :: (69, (sloc (*Line*)23 (*Col*)6 (*EndLine*)23 (*EndCol*)6)) :: (63, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (54, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (72, (sloc (*Line*)23 (*Col*)11 (*EndLine*)23 (*EndCol*)11)) :: (21, (sloc (*Line*)7 (*Col*)10 (*EndLine*)7 (*EndCol*)10)) :: (12, (sloc (*Line*)6 (*Col*)5 (*EndLine*)6 (*EndCol*)5)) :: (39, (sloc (*Line*)14 (*Col*)11 (*EndLine*)14 (*EndCol*)14)) :: (66, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)6)) :: (15, (sloc (*Line*)6 (*Col*)10 (*EndLine*)6 (*EndCol*)10)) :: (42, (sloc (*Line*)14 (*Col*)20 (*EndLine*)14 (*EndCol*)20)) :: (24, (sloc (*Line*)7 (*Col*)14 (*EndLine*)7 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("arg0", "ada://variable/ProcedureTest01-1:9/helper-7:13/arg0+11:5")) :: (14, ("T", "ada://parameter/ProcedureTest01-1:9/Q-11:13/T-11:30")) :: (5, ("a", "ada://parameter/ProcedureTest01-1:9/P-3:13/a-3:15")) :: (13, ("S", "ada://parameter/ProcedureTest01-1:9/Q-11:13/S-11:15")) :: (16, ("L1", "ada://variable/ProcedureTest01-1:9/Q-11:13/L1+18:6")) :: (7, ("c", "ada://parameter/ProcedureTest01-1:9/P-3:13/c-3:49")) :: (10, ("y", "ada://parameter/ProcedureTest01-1:9/helper-7:13/y-7:39")) :: (9, ("x", "ada://parameter/ProcedureTest01-1:9/helper-7:13/x-7:20")) :: (15, ("R", "ada://parameter/ProcedureTest01-1:9/Q-11:13/R-11:46")) :: (6, ("b", "ada://parameter/ProcedureTest01-1:9/P-3:13/b-3:30")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("helper", "ada://procedure_body/ProcedureTest01-1:9/helper-7:13")) :: (1, ("P", "ada://procedure/ProcedureTest01-1:9/P-3:13")) :: (3, ("Q", "ada://procedure_body/ProcedureTest01-1:9/Q-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((4, ("ProcedureTest01", "ada://package_body/ProcedureTest01-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

