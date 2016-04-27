Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Odd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*X*) 2) Integer In) :: 
    (mkparamSpec 4 ((*R*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 5
  (ObjDecl 6 (mkobjDecl 7 ((*Result*) 4) Integer None)) 
  (ObjDecl 8 (mkobjDecl 9 ((*T*) 5) Integer None))))
    (* = = = Procedure Body = = = *)
      (Seq 10
      (Assign 11 (Identifier 12 ((*Result*) 4) ) (Literal 13 (Integer_Literal 1) )) 
      (Seq 14
      (Assign 15 (Identifier 16 ((*T*) 5) ) (BinOp 17 Divide (Name 18 (Identifier 19 ((*X*) 2) )) (Literal 20 (Integer_Literal 2) ) )) 
      (Seq 21
      (If 22 (BinOp 23 Equal (Name 24 (Identifier 25 ((*X*) 2) )) (BinOp 26 Multiply (Name 27 (Identifier 28 ((*T*) 5) )) (Literal 29 (Integer_Literal 2) ) ) )
        (Assign 30 (Identifier 31 ((*Result*) 4) ) (Literal 32 (Integer_Literal 0) ))
        Null
      ) 
      (Assign 33 (Identifier 34 ((*R*) 3) ) (Name 35 (Identifier 36 ((*Result*) 4) ))))))
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
  ((((*X*) 2), (In, Integer)) :: (((*T*) 5), (In_Out, Integer)) :: (((*R*) 3), (Out, Integer)) :: (((*Result*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Odd*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Odd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*X*) 2) Integer In) :: 
  (mkparamSpec 4 ((*R*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 5
(ObjDecl 6 (mkobjDecl 7 ((*Result*) 4) Integer None)) 
(ObjDecl 8 (mkobjDecl 9 ((*T*) 5) Integer None))))
  (* = = = Procedure Body = = = *)
    (Seq 10
    (Assign 11 (Identifier 12 ((*Result*) 4) ) (Literal 13 (Integer_Literal 1) )) 
    (Seq 14
    (Assign 15 (Identifier 16 ((*T*) 5) ) (BinOp 17 Divide (Name 18 (Identifier 19 ((*X*) 2) )) (Literal 20 (Integer_Literal 2) ) )) 
    (Seq 21
    (If 22 (BinOp 23 Equal (Name 24 (Identifier 25 ((*X*) 2) )) (BinOp 26 Multiply (Name 27 (Identifier 28 ((*T*) 5) )) (Literal 29 (Integer_Literal 2) ) ) )
      (Assign 30 (Identifier 31 ((*Result*) 4) ) (Literal 32 (Integer_Literal 0) ))
      Null
    ) 
    (Assign 33 (Identifier 34 ((*R*) 3) ) (Name 35 (Identifier 36 ((*Result*) 4) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Boolean) :: (32, Integer) :: (35, Integer) :: (17, Integer) :: (26, Integer) :: (29, Integer) :: (20, Integer) :: (13, Integer) :: (31, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (19, Integer) :: (28, Integer) :: (36, Integer) :: (18, Integer) :: (27, Integer) :: (12, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)15)) :: (32, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (35, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (17, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (26, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)15)) :: (29, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (20, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (13, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (31, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)12)) :: (16, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (34, (sloc (*Line*)13 (*Col*)4 (*EndLine*)13 (*EndCol*)4)) :: (25, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (28, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (36, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (27, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (12, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)9)) :: (24, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Odd+1:11/X+1:16")) :: (5, ("T", "ada://variable/Odd+1:11/T+4:4")) :: (4, ("Result", "ada://variable/Odd+1:11/Result+3:4")) :: (3, ("R", "ada://parameter/Odd+1:11/R+1:32")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Odd", "ada://procedure_body/Odd+1:11")) :: nil)
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
    ((*Odd*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*X*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*R*) 3) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 5
  (ObjDeclRT 6 (mkobjDeclRT 7 ((*Result*) 4) Integer None)) 
  (ObjDeclRT 8 (mkobjDeclRT 9 ((*T*) 5) Integer None))))
    (* = = = Procedure Body = = = *)
      (SeqRT 10
      (AssignRT 11 (IdentifierRT 12 ((*Result*) 4) (nil)) (LiteralRT 13 (Integer_Literal 1) (nil) nil)) 
      (SeqRT 14
      (AssignRT 15 (IdentifierRT 16 ((*T*) 5) (nil)) (BinOpRT 17 Divide (NameRT 18 (IdentifierRT 19 ((*X*) 2) (nil))) (LiteralRT 20 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil)) 
      (SeqRT 21
      (IfRT 22 (BinOpRT 23 Equal (NameRT 24 (IdentifierRT 25 ((*X*) 2) (nil))) (BinOpRT 26 Multiply (NameRT 27 (IdentifierRT 28 ((*T*) 5) (nil))) (LiteralRT 29 (Integer_Literal 2) (nil) nil) (OverflowCheck :: nil) nil) (nil) nil)
        (AssignRT 30 (IdentifierRT 31 ((*Result*) 4) (nil)) (LiteralRT 32 (Integer_Literal 0) (nil) nil))
        NullRT
      ) 
      (AssignRT 33 (IdentifierRT 34 ((*R*) 3) (nil)) (NameRT 35 (IdentifierRT 36 ((*Result*) 4) (nil)))))))
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
  ((((*X*) 2), (In, Integer)) :: (((*T*) 5), (In_Out, Integer)) :: (((*R*) 3), (Out, Integer)) :: (((*Result*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Odd*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Odd*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*X*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*R*) 3) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 5
(ObjDeclRT 6 (mkobjDeclRT 7 ((*Result*) 4) Integer None)) 
(ObjDeclRT 8 (mkobjDeclRT 9 ((*T*) 5) Integer None))))
  (* = = = Procedure Body = = = *)
    (SeqRT 10
    (AssignRT 11 (IdentifierRT 12 ((*Result*) 4) (nil)) (LiteralRT 13 (Integer_Literal 1) (nil) nil)) 
    (SeqRT 14
    (AssignRT 15 (IdentifierRT 16 ((*T*) 5) (nil)) (BinOpRT 17 Divide (NameRT 18 (IdentifierRT 19 ((*X*) 2) (nil))) (LiteralRT 20 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil)) 
    (SeqRT 21
    (IfRT 22 (BinOpRT 23 Equal (NameRT 24 (IdentifierRT 25 ((*X*) 2) (nil))) (BinOpRT 26 Multiply (NameRT 27 (IdentifierRT 28 ((*T*) 5) (nil))) (LiteralRT 29 (Integer_Literal 2) (nil) nil) (OverflowCheck :: nil) nil) (nil) nil)
      (AssignRT 30 (IdentifierRT 31 ((*Result*) 4) (nil)) (LiteralRT 32 (Integer_Literal 0) (nil) nil))
      NullRT
    ) 
    (AssignRT 33 (IdentifierRT 34 ((*R*) 3) (nil)) (NameRT 35 (IdentifierRT 36 ((*Result*) 4) (nil)))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Boolean) :: (32, Integer) :: (35, Integer) :: (17, Integer) :: (26, Integer) :: (29, Integer) :: (20, Integer) :: (13, Integer) :: (31, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (19, Integer) :: (28, Integer) :: (36, Integer) :: (18, Integer) :: (27, Integer) :: (12, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)15)) :: (32, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (35, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (17, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (26, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)15)) :: (29, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)15)) :: (20, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (13, (sloc (*Line*)8 (*Col*)14 (*EndLine*)8 (*EndCol*)14)) :: (31, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)12)) :: (16, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (34, (sloc (*Line*)13 (*Col*)4 (*EndLine*)13 (*EndCol*)4)) :: (25, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (28, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (36, (sloc (*Line*)13 (*Col*)9 (*EndLine*)13 (*EndCol*)14)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (27, (sloc (*Line*)10 (*Col*)11 (*EndLine*)10 (*EndCol*)11)) :: (12, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)9)) :: (24, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Odd+1:11/X+1:16")) :: (5, ("T", "ada://variable/Odd+1:11/T+4:4")) :: (4, ("Result", "ada://variable/Odd+1:11/Result+3:4")) :: (3, ("R", "ada://parameter/Odd+1:11/R+1:32")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Odd", "ada://procedure_body/Odd+1:11")) :: nil)
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

