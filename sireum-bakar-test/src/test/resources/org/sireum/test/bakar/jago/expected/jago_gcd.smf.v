Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Gcd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*M*) 2) Integer In) :: 
    (mkparamSpec 4 ((*N*) 3) Integer In) :: 
    (mkparamSpec 5 ((*Y*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 6
  (ObjDecl 7 (mkobjDecl 8 ((*C*) 5) Integer None)) 
  (SeqDecl 9
  (ObjDecl 10 (mkobjDecl 11 ((*D*) 6) Integer None)) 
  (SeqDecl 12
  (ObjDecl 13 (mkobjDecl 14 ((*T*) 7) Integer None)) 
  (ObjDecl 15 (mkobjDecl 16 ((*R*) 8) Integer None))))))
    (* = = = Procedure Body = = = *)
      (Seq 17
      (Assign 18 (Identifier 19 ((*C*) 5) ) (Name 20 (Identifier 21 ((*M*) 2) ))) 
      (Seq 22
      (Assign 23 (Identifier 24 ((*D*) 6) ) (Name 25 (Identifier 26 ((*N*) 3) ))) 
      (Seq 27
      (While 28 (BinOp 29 Not_Equal (Name 30 (Identifier 31 ((*D*) 6) )) (Literal 32 (Integer_Literal 0) ) )
        (Seq 33
        (Assign 34 (Identifier 35 ((*T*) 7) ) (BinOp 36 Divide (Name 37 (Identifier 38 ((*C*) 5) )) (Name 39 (Identifier 40 ((*D*) 6) )) )) 
        (Seq 41
        (Assign 42 (Identifier 43 ((*R*) 8) ) (BinOp 44 Minus (Name 45 (Identifier 46 ((*C*) 5) )) (BinOp 47 Multiply (Name 48 (Identifier 49 ((*T*) 7) )) (Name 50 (Identifier 51 ((*D*) 6) )) ) )) 
        (Seq 52
        (Assign 53 (Identifier 54 ((*C*) 5) ) (Name 55 (Identifier 56 ((*D*) 6) ))) 
        (Assign 57 (Identifier 58 ((*D*) 6) ) (Name 59 (Identifier 60 ((*R*) 8) ))))))
      ) 
      (Assign 61 (Identifier 62 ((*Y*) 4) ) (Name 63 (Identifier 64 ((*C*) 5) ))))))
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
  ((((*C*) 5), (In_Out, Integer)) :: (((*M*) 2), (In, Integer)) :: (((*T*) 7), (In_Out, Integer)) :: (((*Y*) 4), (Out, Integer)) :: (((*R*) 8), (In_Out, Integer)) :: (((*D*) 6), (In_Out, Integer)) :: (((*N*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Gcd*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Gcd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*M*) 2) Integer In) :: 
  (mkparamSpec 4 ((*N*) 3) Integer In) :: 
  (mkparamSpec 5 ((*Y*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 6
(ObjDecl 7 (mkobjDecl 8 ((*C*) 5) Integer None)) 
(SeqDecl 9
(ObjDecl 10 (mkobjDecl 11 ((*D*) 6) Integer None)) 
(SeqDecl 12
(ObjDecl 13 (mkobjDecl 14 ((*T*) 7) Integer None)) 
(ObjDecl 15 (mkobjDecl 16 ((*R*) 8) Integer None))))))
  (* = = = Procedure Body = = = *)
    (Seq 17
    (Assign 18 (Identifier 19 ((*C*) 5) ) (Name 20 (Identifier 21 ((*M*) 2) ))) 
    (Seq 22
    (Assign 23 (Identifier 24 ((*D*) 6) ) (Name 25 (Identifier 26 ((*N*) 3) ))) 
    (Seq 27
    (While 28 (BinOp 29 Not_Equal (Name 30 (Identifier 31 ((*D*) 6) )) (Literal 32 (Integer_Literal 0) ) )
      (Seq 33
      (Assign 34 (Identifier 35 ((*T*) 7) ) (BinOp 36 Divide (Name 37 (Identifier 38 ((*C*) 5) )) (Name 39 (Identifier 40 ((*D*) 6) )) )) 
      (Seq 41
      (Assign 42 (Identifier 43 ((*R*) 8) ) (BinOp 44 Minus (Name 45 (Identifier 46 ((*C*) 5) )) (BinOp 47 Multiply (Name 48 (Identifier 49 ((*T*) 7) )) (Name 50 (Identifier 51 ((*D*) 6) )) ) )) 
      (Seq 52
      (Assign 53 (Identifier 54 ((*C*) 5) ) (Name 55 (Identifier 56 ((*D*) 6) ))) 
      (Assign 57 (Identifier 58 ((*D*) 6) ) (Name 59 (Identifier 60 ((*R*) 8) ))))))
    ) 
    (Assign 61 (Identifier 62 ((*Y*) 4) ) (Name 63 (Identifier 64 ((*C*) 5) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((59, Integer) :: (32, Integer) :: (50, Integer) :: (62, Integer) :: (35, Integer) :: (44, Integer) :: (26, Integer) :: (56, Integer) :: (29, Boolean) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (58, Integer) :: (40, Integer) :: (49, Integer) :: (31, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (60, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (36, Integer) :: (21, Integer) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((59, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (32, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (50, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: (62, (sloc (*Line*)17 (*Col*)4 (*EndLine*)17 (*EndCol*)4)) :: (35, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (44, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)20)) :: (26, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (56, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (29, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)15)) :: (38, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (47, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)20)) :: (20, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (46, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (64, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (55, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (58, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (40, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (49, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (31, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (43, (sloc (*Line*)13 (*Col*)7 (*EndLine*)13 (*EndCol*)7)) :: (25, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (37, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (19, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)4)) :: (60, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (63, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (54, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (45, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (36, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (21, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (48, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (30, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (39, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (24, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (51, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("R", "ada://variable/Gcd+1:11/R+6:4")) :: (2, ("M", "ada://parameter/Gcd+1:11/M+1:16")) :: (5, ("C", "ada://variable/Gcd+1:11/C+3:4")) :: (4, ("Y", "ada://parameter/Gcd+1:11/Y+1:42")) :: (7, ("T", "ada://variable/Gcd+1:11/T+5:4")) :: (3, ("N", "ada://parameter/Gcd+1:11/N+1:29")) :: (6, ("D", "ada://variable/Gcd+1:11/D+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Gcd", "ada://procedure_body/Gcd+1:11")) :: nil)
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
    ((*Gcd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*M*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*N*) 3) Integer In) :: 
    (mkparamSpecRT 5 ((*Y*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 6
  (ObjDeclRT 7 (mkobjDeclRT 8 ((*C*) 5) Integer None)) 
  (SeqDeclRT 9
  (ObjDeclRT 10 (mkobjDeclRT 11 ((*D*) 6) Integer None)) 
  (SeqDeclRT 12
  (ObjDeclRT 13 (mkobjDeclRT 14 ((*T*) 7) Integer None)) 
  (ObjDeclRT 15 (mkobjDeclRT 16 ((*R*) 8) Integer None))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 17
      (AssignRT 18 (IdentifierRT 19 ((*C*) 5) (nil)) (NameRT 20 (IdentifierRT 21 ((*M*) 2) (nil)))) 
      (SeqRT 22
      (AssignRT 23 (IdentifierRT 24 ((*D*) 6) (nil)) (NameRT 25 (IdentifierRT 26 ((*N*) 3) (nil)))) 
      (SeqRT 27
      (WhileRT 28 (BinOpRT 29 Not_Equal (NameRT 30 (IdentifierRT 31 ((*D*) 6) (nil))) (LiteralRT 32 (Integer_Literal 0) (nil) nil) (nil) nil)
        (SeqRT 33
        (AssignRT 34 (IdentifierRT 35 ((*T*) 7) (nil)) (BinOpRT 36 Divide (NameRT 37 (IdentifierRT 38 ((*C*) 5) (nil))) (NameRT 39 (IdentifierRT 40 ((*D*) 6) (nil))) (DivCheck :: OverflowCheck :: nil) nil)) 
        (SeqRT 41
        (AssignRT 42 (IdentifierRT 43 ((*R*) 8) (nil)) (BinOpRT 44 Minus (NameRT 45 (IdentifierRT 46 ((*C*) 5) (nil))) (BinOpRT 47 Multiply (NameRT 48 (IdentifierRT 49 ((*T*) 7) (nil))) (NameRT 50 (IdentifierRT 51 ((*D*) 6) (nil))) (OverflowCheck :: nil) nil) (OverflowCheck :: nil) nil)) 
        (SeqRT 52
        (AssignRT 53 (IdentifierRT 54 ((*C*) 5) (nil)) (NameRT 55 (IdentifierRT 56 ((*D*) 6) (nil)))) 
        (AssignRT 57 (IdentifierRT 58 ((*D*) 6) (nil)) (NameRT 59 (IdentifierRT 60 ((*R*) 8) (nil)))))))
      ) 
      (AssignRT 61 (IdentifierRT 62 ((*Y*) 4) (nil)) (NameRT 63 (IdentifierRT 64 ((*C*) 5) (nil)))))))
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
  ((((*C*) 5), (In_Out, Integer)) :: (((*M*) 2), (In, Integer)) :: (((*T*) 7), (In_Out, Integer)) :: (((*Y*) 4), (Out, Integer)) :: (((*R*) 8), (In_Out, Integer)) :: (((*D*) 6), (In_Out, Integer)) :: (((*N*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Gcd*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Gcd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*M*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*N*) 3) Integer In) :: 
  (mkparamSpecRT 5 ((*Y*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 6
(ObjDeclRT 7 (mkobjDeclRT 8 ((*C*) 5) Integer None)) 
(SeqDeclRT 9
(ObjDeclRT 10 (mkobjDeclRT 11 ((*D*) 6) Integer None)) 
(SeqDeclRT 12
(ObjDeclRT 13 (mkobjDeclRT 14 ((*T*) 7) Integer None)) 
(ObjDeclRT 15 (mkobjDeclRT 16 ((*R*) 8) Integer None))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 17
    (AssignRT 18 (IdentifierRT 19 ((*C*) 5) (nil)) (NameRT 20 (IdentifierRT 21 ((*M*) 2) (nil)))) 
    (SeqRT 22
    (AssignRT 23 (IdentifierRT 24 ((*D*) 6) (nil)) (NameRT 25 (IdentifierRT 26 ((*N*) 3) (nil)))) 
    (SeqRT 27
    (WhileRT 28 (BinOpRT 29 Not_Equal (NameRT 30 (IdentifierRT 31 ((*D*) 6) (nil))) (LiteralRT 32 (Integer_Literal 0) (nil) nil) (nil) nil)
      (SeqRT 33
      (AssignRT 34 (IdentifierRT 35 ((*T*) 7) (nil)) (BinOpRT 36 Divide (NameRT 37 (IdentifierRT 38 ((*C*) 5) (nil))) (NameRT 39 (IdentifierRT 40 ((*D*) 6) (nil))) (DivCheck :: OverflowCheck :: nil) nil)) 
      (SeqRT 41
      (AssignRT 42 (IdentifierRT 43 ((*R*) 8) (nil)) (BinOpRT 44 Minus (NameRT 45 (IdentifierRT 46 ((*C*) 5) (nil))) (BinOpRT 47 Multiply (NameRT 48 (IdentifierRT 49 ((*T*) 7) (nil))) (NameRT 50 (IdentifierRT 51 ((*D*) 6) (nil))) (OverflowCheck :: nil) nil) (OverflowCheck :: nil) nil)) 
      (SeqRT 52
      (AssignRT 53 (IdentifierRT 54 ((*C*) 5) (nil)) (NameRT 55 (IdentifierRT 56 ((*D*) 6) (nil)))) 
      (AssignRT 57 (IdentifierRT 58 ((*D*) 6) (nil)) (NameRT 59 (IdentifierRT 60 ((*R*) 8) (nil)))))))
    ) 
    (AssignRT 61 (IdentifierRT 62 ((*Y*) 4) (nil)) (NameRT 63 (IdentifierRT 64 ((*C*) 5) (nil)))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((59, Integer) :: (32, Integer) :: (50, Integer) :: (62, Integer) :: (35, Integer) :: (44, Integer) :: (26, Integer) :: (56, Integer) :: (29, Boolean) :: (38, Integer) :: (47, Integer) :: (20, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (58, Integer) :: (40, Integer) :: (49, Integer) :: (31, Integer) :: (43, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (60, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (36, Integer) :: (21, Integer) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (24, Integer) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((59, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (32, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (50, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: (62, (sloc (*Line*)17 (*Col*)4 (*EndLine*)17 (*EndCol*)4)) :: (35, (sloc (*Line*)12 (*Col*)7 (*EndLine*)12 (*EndCol*)7)) :: (44, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)20)) :: (26, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (56, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (29, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)15)) :: (38, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (47, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)20)) :: (20, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (46, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (64, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (55, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)12)) :: (58, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (40, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (49, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (31, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (43, (sloc (*Line*)13 (*Col*)7 (*EndLine*)13 (*EndCol*)7)) :: (25, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (37, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)12)) :: (19, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)4)) :: (60, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (63, (sloc (*Line*)17 (*Col*)9 (*EndLine*)17 (*EndCol*)9)) :: (54, (sloc (*Line*)14 (*Col*)7 (*EndLine*)14 (*EndCol*)7)) :: (45, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (36, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)16)) :: (21, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)9)) :: (48, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)16)) :: (30, (sloc (*Line*)10 (*Col*)10 (*EndLine*)10 (*EndCol*)10)) :: (39, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (24, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (51, (sloc (*Line*)13 (*Col*)20 (*EndLine*)13 (*EndCol*)20)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("R", "ada://variable/Gcd+1:11/R+6:4")) :: (2, ("M", "ada://parameter/Gcd+1:11/M+1:16")) :: (5, ("C", "ada://variable/Gcd+1:11/C+3:4")) :: (4, ("Y", "ada://parameter/Gcd+1:11/Y+1:42")) :: (7, ("T", "ada://variable/Gcd+1:11/T+5:4")) :: (3, ("N", "ada://parameter/Gcd+1:11/N+1:29")) :: (6, ("D", "ada://variable/Gcd+1:11/D+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Gcd", "ada://procedure_body/Gcd+1:11")) :: nil)
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

