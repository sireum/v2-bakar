Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Max*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*X*) 2) Integer In) :: 
    (mkparamSpec 4 ((*Y*) 3) Integer In) :: 
    (mkparamSpec 5 ((*R*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 6 (mkobjDecl 7 ((*Result*) 5) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 8
      (Assign 9 (Identifier 10 ((*Result*) 5) ) (Name 11 (Identifier 12 ((*Y*) 3) ))) 
      (Seq 13
      (If 14 (BinOp 15 Greater_Than (Name 16 (Identifier 17 ((*X*) 2) )) (Name 18 (Identifier 19 ((*Y*) 3) )) )
        (Assign 20 (Identifier 21 ((*Result*) 5) ) (Name 22 (Identifier 23 ((*X*) 2) )))
        Null
      ) 
      (Assign 24 (Identifier 25 ((*R*) 4) ) (Name 26 (Identifier 27 ((*Result*) 5) )))))
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
  ((((*X*) 2), (In, Integer)) :: (((*R*) 4), (Out, Integer)) :: (((*Result*) 5), (In_Out, Integer)) :: (((*Y*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Max*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Max*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*X*) 2) Integer In) :: 
  (mkparamSpec 4 ((*Y*) 3) Integer In) :: 
  (mkparamSpec 5 ((*R*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 6 (mkobjDecl 7 ((*Result*) 5) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 8
    (Assign 9 (Identifier 10 ((*Result*) 5) ) (Name 11 (Identifier 12 ((*Y*) 3) ))) 
    (Seq 13
    (If 14 (BinOp 15 Greater_Than (Name 16 (Identifier 17 ((*X*) 2) )) (Name 18 (Identifier 19 ((*Y*) 3) )) )
      (Assign 20 (Identifier 21 ((*Result*) 5) ) (Name 22 (Identifier 23 ((*X*) 2) )))
      Null
    ) 
    (Assign 24 (Identifier 25 ((*R*) 4) ) (Name 26 (Identifier 27 ((*Result*) 5) )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (17, Integer) :: (26, Integer) :: (11, Integer) :: (22, Integer) :: (16, Integer) :: (25, Integer) :: (10, Integer) :: (19, Integer) :: (27, Integer) :: (18, Integer) :: (12, Integer) :: (21, Integer) :: (15, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)17 (*EndLine*)8 (*EndCol*)17)) :: (17, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: (26, (sloc (*Line*)10 (*Col*)9 (*EndLine*)10 (*EndCol*)14)) :: (11, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (22, (sloc (*Line*)8 (*Col*)17 (*EndLine*)8 (*EndCol*)17)) :: (16, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: (25, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)4)) :: (10, (sloc (*Line*)6 (*Col*)4 (*EndLine*)6 (*EndCol*)9)) :: (19, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (27, (sloc (*Line*)10 (*Col*)9 (*EndLine*)10 (*EndCol*)14)) :: (18, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (12, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (21, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)12)) :: (15, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Max+1:11/X+1:16")) :: (5, ("Result", "ada://variable/Max+1:11/Result+3:4")) :: (4, ("R", "ada://parameter/Max+1:11/R+1:42")) :: (3, ("Y", "ada://parameter/Max+1:11/Y+1:29")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Max", "ada://procedure_body/Max+1:11")) :: nil)
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
    ((*Max*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*X*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*Y*) 3) Integer In) :: 
    (mkparamSpecRT 5 ((*R*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 6 (mkobjDeclRT 7 ((*Result*) 5) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 8
      (AssignRT 9 (IdentifierRT 10 ((*Result*) 5) (nil)) (NameRT 11 (IdentifierRT 12 ((*Y*) 3) (nil)))) 
      (SeqRT 13
      (IfRT 14 (BinOpRT 15 Greater_Than (NameRT 16 (IdentifierRT 17 ((*X*) 2) (nil))) (NameRT 18 (IdentifierRT 19 ((*Y*) 3) (nil))) (nil) nil)
        (AssignRT 20 (IdentifierRT 21 ((*Result*) 5) (nil)) (NameRT 22 (IdentifierRT 23 ((*X*) 2) (nil))))
        NullRT
      ) 
      (AssignRT 24 (IdentifierRT 25 ((*R*) 4) (nil)) (NameRT 26 (IdentifierRT 27 ((*Result*) 5) (nil))))))
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
  ((((*X*) 2), (In, Integer)) :: (((*R*) 4), (Out, Integer)) :: (((*Result*) 5), (In_Out, Integer)) :: (((*Y*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Max*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Max*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*X*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*Y*) 3) Integer In) :: 
  (mkparamSpecRT 5 ((*R*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 6 (mkobjDeclRT 7 ((*Result*) 5) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 8
    (AssignRT 9 (IdentifierRT 10 ((*Result*) 5) (nil)) (NameRT 11 (IdentifierRT 12 ((*Y*) 3) (nil)))) 
    (SeqRT 13
    (IfRT 14 (BinOpRT 15 Greater_Than (NameRT 16 (IdentifierRT 17 ((*X*) 2) (nil))) (NameRT 18 (IdentifierRT 19 ((*Y*) 3) (nil))) (nil) nil)
      (AssignRT 20 (IdentifierRT 21 ((*Result*) 5) (nil)) (NameRT 22 (IdentifierRT 23 ((*X*) 2) (nil))))
      NullRT
    ) 
    (AssignRT 24 (IdentifierRT 25 ((*R*) 4) (nil)) (NameRT 26 (IdentifierRT 27 ((*Result*) 5) (nil))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (17, Integer) :: (26, Integer) :: (11, Integer) :: (22, Integer) :: (16, Integer) :: (25, Integer) :: (10, Integer) :: (19, Integer) :: (27, Integer) :: (18, Integer) :: (12, Integer) :: (21, Integer) :: (15, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)17 (*EndLine*)8 (*EndCol*)17)) :: (17, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: (26, (sloc (*Line*)10 (*Col*)9 (*EndLine*)10 (*EndCol*)14)) :: (11, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (22, (sloc (*Line*)8 (*Col*)17 (*EndLine*)8 (*EndCol*)17)) :: (16, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: (25, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)4)) :: (10, (sloc (*Line*)6 (*Col*)4 (*EndLine*)6 (*EndCol*)9)) :: (19, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (27, (sloc (*Line*)10 (*Col*)9 (*EndLine*)10 (*EndCol*)14)) :: (18, (sloc (*Line*)7 (*Col*)11 (*EndLine*)7 (*EndCol*)11)) :: (12, (sloc (*Line*)6 (*Col*)14 (*EndLine*)6 (*EndCol*)14)) :: (21, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)12)) :: (15, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Max+1:11/X+1:16")) :: (5, ("Result", "ada://variable/Max+1:11/Result+3:4")) :: (4, ("R", "ada://parameter/Max+1:11/R+1:42")) :: (3, ("Y", "ada://parameter/Max+1:11/Y+1:29")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Max", "ada://procedure_body/Max+1:11")) :: nil)
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

