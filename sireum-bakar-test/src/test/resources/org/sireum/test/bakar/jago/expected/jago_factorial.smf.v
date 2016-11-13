Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Factorial*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*N*) 2) Integer In) :: 
    (mkparamSpec 4 ((*M*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 5
  (ObjDecl 7 (mkobjDecl 8 ((*Result*) 5) Integer (Some ((Literal 6 (Integer_Literal 1) ))))) 
  (ObjDecl 9 (mkobjDecl 10 ((*T*) 6) Integer None))))
    (* = = = Procedure Body = = = *)
      (Seq 11
      (Assign 12 (Identifier 13 ((*T*) 6) ) (Name 14 (Identifier 15 ((*N*) 2) ))) 
      (Seq 16
      (While 17 (BinOp 18 Greater_Than (Name 19 (Identifier 20 ((*T*) 6) )) (Literal 21 (Integer_Literal 0) ) )
        (Seq 22
        (Assign 23 (Identifier 24 ((*Result*) 5) ) (BinOp 25 Multiply (Name 26 (Identifier 27 ((*Result*) 5) )) (Name 28 (Identifier 29 ((*T*) 6) )) )) 
        (Assign 30 (Identifier 31 ((*T*) 6) ) (BinOp 32 Minus (Name 33 (Identifier 34 ((*T*) 6) )) (Literal 35 (Integer_Literal 1) ) )))
      ) 
      (Assign 36 (Identifier 37 ((*M*) 3) ) (Name 38 (Identifier 39 ((*Result*) 5) )))))
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
  ((((*N*) 2), (In, Integer)) :: (((*Result*) 5), (In_Out, Integer)) :: (((*M*) 3), (Out, Integer)) :: (((*T*) 6), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Factorial*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Factorial*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*N*) 2) Integer In) :: 
  (mkparamSpec 4 ((*M*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 5
(ObjDecl 7 (mkobjDecl 8 ((*Result*) 5) Integer (Some ((Literal 6 (Integer_Literal 1) ))))) 
(ObjDecl 9 (mkobjDecl 10 ((*T*) 6) Integer None))))
  (* = = = Procedure Body = = = *)
    (Seq 11
    (Assign 12 (Identifier 13 ((*T*) 6) ) (Name 14 (Identifier 15 ((*N*) 2) ))) 
    (Seq 16
    (While 17 (BinOp 18 Greater_Than (Name 19 (Identifier 20 ((*T*) 6) )) (Literal 21 (Integer_Literal 0) ) )
      (Seq 22
      (Assign 23 (Identifier 24 ((*Result*) 5) ) (BinOp 25 Multiply (Name 26 (Identifier 27 ((*Result*) 5) )) (Name 28 (Identifier 29 ((*T*) 6) )) )) 
      (Assign 30 (Identifier 31 ((*T*) 6) ) (BinOp 32 Minus (Name 33 (Identifier 34 ((*T*) 6) )) (Literal 35 (Integer_Literal 1) ) )))
    ) 
    (Assign 36 (Identifier 37 ((*M*) 3) ) (Name 38 (Identifier 39 ((*Result*) 5) )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (14, Integer) :: (13, Integer) :: (31, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Boolean) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (33, Integer) :: (6, Integer) :: (15, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)16)) :: (35, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (26, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (38, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (29, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (20, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (14, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (13, (sloc (*Line*)7 (*Col*)4 (*EndLine*)7 (*EndCol*)4)) :: (31, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (34, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (25, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)26)) :: (37, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)4)) :: (19, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (28, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (18, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)14)) :: (27, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (21, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (39, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (33, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (6, (sloc (*Line*)3 (*Col*)23 (*EndLine*)3 (*EndCol*)23)) :: (15, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (24, (sloc (*Line*)9 (*Col*)7 (*EndLine*)9 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("N", "ada://parameter/Factorial+1:11/N+1:22")) :: (5, ("Result", "ada://variable/Factorial+1:11/Result+3:4")) :: (3, ("M", "ada://parameter/Factorial+1:11/M+1:35")) :: (6, ("T", "ada://variable/Factorial+1:11/T+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Factorial", "ada://procedure_body/Factorial+1:11")) :: nil)
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
    ((*Factorial*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*N*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*M*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 5
  (ObjDeclRT 7 (mkobjDeclRT 8 ((*Result*) 5) Integer (Some ((LiteralRT 6 (Integer_Literal 1) (nil) nil))))) 
  (ObjDeclRT 9 (mkobjDeclRT 10 ((*T*) 6) Integer None))))
    (* = = = Procedure Body = = = *)
      (SeqRT 11
      (AssignRT 12 (IdentifierRT 13 ((*T*) 6) (nil)) (NameRT 14 (IdentifierRT 15 ((*N*) 2) (nil)))) 
      (SeqRT 16
      (WhileRT 17 (BinOpRT 18 Greater_Than (NameRT 19 (IdentifierRT 20 ((*T*) 6) (nil))) (LiteralRT 21 (Integer_Literal 0) (nil) nil) (nil) nil)
        (SeqRT 22
        (AssignRT 23 (IdentifierRT 24 ((*Result*) 5) (nil)) (BinOpRT 25 Multiply (NameRT 26 (IdentifierRT 27 ((*Result*) 5) (nil))) (NameRT 28 (IdentifierRT 29 ((*T*) 6) (nil))) (OverflowCheck :: nil) nil)) 
        (AssignRT 30 (IdentifierRT 31 ((*T*) 6) (nil)) (BinOpRT 32 Minus (NameRT 33 (IdentifierRT 34 ((*T*) 6) (nil))) (LiteralRT 35 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
      ) 
      (AssignRT 36 (IdentifierRT 37 ((*M*) 3) (nil)) (NameRT 38 (IdentifierRT 39 ((*Result*) 5) (nil))))))
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
  ((((*N*) 2), (In, Integer)) :: (((*Result*) 5), (In_Out, Integer)) :: (((*M*) 3), (Out, Integer)) :: (((*T*) 6), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Factorial*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Factorial*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*N*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*M*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 5
(ObjDeclRT 7 (mkobjDeclRT 8 ((*Result*) 5) Integer (Some ((LiteralRT 6 (Integer_Literal 1) (nil) nil))))) 
(ObjDeclRT 9 (mkobjDeclRT 10 ((*T*) 6) Integer None))))
  (* = = = Procedure Body = = = *)
    (SeqRT 11
    (AssignRT 12 (IdentifierRT 13 ((*T*) 6) (nil)) (NameRT 14 (IdentifierRT 15 ((*N*) 2) (nil)))) 
    (SeqRT 16
    (WhileRT 17 (BinOpRT 18 Greater_Than (NameRT 19 (IdentifierRT 20 ((*T*) 6) (nil))) (LiteralRT 21 (Integer_Literal 0) (nil) nil) (nil) nil)
      (SeqRT 22
      (AssignRT 23 (IdentifierRT 24 ((*Result*) 5) (nil)) (BinOpRT 25 Multiply (NameRT 26 (IdentifierRT 27 ((*Result*) 5) (nil))) (NameRT 28 (IdentifierRT 29 ((*T*) 6) (nil))) (OverflowCheck :: nil) nil)) 
      (AssignRT 30 (IdentifierRT 31 ((*T*) 6) (nil)) (BinOpRT 32 Minus (NameRT 33 (IdentifierRT 34 ((*T*) 6) (nil))) (LiteralRT 35 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
    ) 
    (AssignRT 36 (IdentifierRT 37 ((*M*) 3) (nil)) (NameRT 38 (IdentifierRT 39 ((*Result*) 5) (nil))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (29, Integer) :: (20, Integer) :: (14, Integer) :: (13, Integer) :: (31, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Boolean) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (33, Integer) :: (6, Integer) :: (15, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)16)) :: (35, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (26, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (38, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (29, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (20, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (14, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (13, (sloc (*Line*)7 (*Col*)4 (*EndLine*)7 (*EndCol*)4)) :: (31, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (34, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (25, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)26)) :: (37, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)4)) :: (19, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (28, (sloc (*Line*)9 (*Col*)26 (*EndLine*)9 (*EndCol*)26)) :: (18, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)14)) :: (27, (sloc (*Line*)9 (*Col*)17 (*EndLine*)9 (*EndCol*)22)) :: (21, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (39, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)14)) :: (33, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (6, (sloc (*Line*)3 (*Col*)23 (*EndLine*)3 (*EndCol*)23)) :: (15, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)9)) :: (24, (sloc (*Line*)9 (*Col*)7 (*EndLine*)9 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("N", "ada://parameter/Factorial+1:11/N+1:22")) :: (5, ("Result", "ada://variable/Factorial+1:11/Result+3:4")) :: (3, ("M", "ada://parameter/Factorial+1:11/M+1:35")) :: (6, ("T", "ada://variable/Factorial+1:11/T+4:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Factorial", "ada://procedure_body/Factorial+1:11")) :: nil)
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

