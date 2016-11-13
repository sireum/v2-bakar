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
    ((*increasebyone*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 6 ((*X*) 4) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 7
      (Assign 8 (Identifier 9 ((*X*) 4) ) (BinOp 10 Plus (Name 11 (Identifier 12 ((*X*) 4) )) (Literal 13 (Integer_Literal 1) ) )) 
      (Call 14 15 ((*addup*) 2) 
        ((Name 16 (Identifier 17 ((*X*) 4) )) :: nil)
      ))
  )
) 
(ProcBodyDecl 18 
  (mkprocBodyDecl 19
    (* = = = Procedure Name = = = *)
    ((*addup*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 20 ((*X*) 7) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 21 (mkobjDecl 22 ((*Y*) 8) Integer None)))
    (* = = = Procedure Body = = = *)
      (If 23 (BinOp 24 Greater_Than (Name 25 (Identifier 26 ((*X*) 7) )) (Literal 27 (Integer_Literal 0) ) )
        (Seq 28
        (Assign 29 (Identifier 30 ((*Y*) 8) ) (BinOp 31 Minus (Name 32 (Identifier 33 ((*X*) 7) )) (Literal 34 (Integer_Literal 1) ) )) 
        (Seq 35
        (Call 36 37 ((*addup*) 2) 
          ((Name 38 (Identifier 39 ((*Y*) 8) )) :: nil)
        ) 
        (Assign 40 (Identifier 41 ((*X*) 7) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 7) )) (Name 45 (Identifier 46 ((*Y*) 8) )) ))))
        Null
      )
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
  ((((*Y*) 8), (In_Out, Integer)) :: (((*X*) 7), (In_Out, Integer)) :: (((*X*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*addup*) 2), (0, (mkprocBodyDecl 19
  (* = = = Procedure Name = = = *)
  ((*addup*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 20 ((*X*) 7) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 21 (mkobjDecl 22 ((*Y*) 8) Integer None)))
  (* = = = Procedure Body = = = *)
    (If 23 (BinOp 24 Greater_Than (Name 25 (Identifier 26 ((*X*) 7) )) (Literal 27 (Integer_Literal 0) ) )
      (Seq 28
      (Assign 29 (Identifier 30 ((*Y*) 8) ) (BinOp 31 Minus (Name 32 (Identifier 33 ((*X*) 7) )) (Literal 34 (Integer_Literal 1) ) )) 
      (Seq 35
      (Call 36 37 ((*addup*) 2) 
        ((Name 38 (Identifier 39 ((*Y*) 8) )) :: nil)
      ) 
      (Assign 40 (Identifier 41 ((*X*) 7) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 7) )) (Name 45 (Identifier 46 ((*Y*) 8) )) ))))
      Null
    )
))) :: (((*increasebyone*) 1), (0, (mkprocBodyDecl 5
  (* = = = Procedure Name = = = *)
  ((*increasebyone*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 6 ((*X*) 4) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 7
    (Assign 8 (Identifier 9 ((*X*) 4) ) (BinOp 10 Plus (Name 11 (Identifier 12 ((*X*) 4) )) (Literal 13 (Integer_Literal 1) ) )) 
    (Call 14 15 ((*addup*) 2) 
      ((Name 16 (Identifier 17 ((*X*) 4) )) :: nil)
    ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((41, Integer) :: (32, Integer) :: (44, Integer) :: (17, Integer) :: (26, Integer) :: (38, Integer) :: (11, Integer) :: (46, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (10, Integer) :: (45, Integer) :: (9, Integer) :: (27, Integer) :: (12, Integer) :: (39, Integer) :: (30, Integer) :: (42, Integer) :: (33, Integer) :: (24, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((41, (sloc (*Line*)15 (*Col*)3 (*EndLine*)15 (*EndCol*)3)) :: (32, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (44, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (17, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (26, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (38, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (11, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (46, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (13, (sloc (*Line*)5 (*Col*)16 (*EndLine*)5 (*EndCol*)16)) :: (31, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)12)) :: (43, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (16, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (34, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (25, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (10, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)16)) :: (45, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (9, (sloc (*Line*)5 (*Col*)7 (*EndLine*)5 (*EndCol*)7)) :: (27, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)14)) :: (12, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (39, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (30, (sloc (*Line*)13 (*Col*)3 (*EndLine*)13 (*EndCol*)3)) :: (42, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (33, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (24, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Y", "ada://variable/Recursive_Proc_Pkg-1:9/addup-5:14/Y+10:7")) :: (4, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/increasebyone-4:14/X-4:28")) :: (7, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/addup-5:14/X-5:21")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("addup", "ada://procedure/Recursive_Proc_Pkg-1:9/addup-5:14")) :: (1, ("increasebyone", "ada://procedure_body/Recursive_Proc_Pkg-1:9/increasebyone-4:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Recursive_Proc_Pkg", "ada://package_body/Recursive_Proc_Pkg-1:9")) :: nil)
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
    ((*increasebyone*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 6 ((*X*) 4) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 7
      (AssignRT 8 (IdentifierRT 9 ((*X*) 4) (nil)) (BinOpRT 10 Plus (NameRT 11 (IdentifierRT 12 ((*X*) 4) (nil))) (LiteralRT 13 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
      (CallRT 14 15 ((*addup*) 2) 
        ((NameRT 16 (IdentifierRT 17 ((*X*) 4) (nil))) :: nil)
      ))
  )
) 
(ProcBodyDeclRT 18 
  (mkprocBodyDeclRT 19
    (* = = = Procedure Name = = = *)
    ((*addup*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 20 ((*X*) 7) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 21 (mkobjDeclRT 22 ((*Y*) 8) Integer None)))
    (* = = = Procedure Body = = = *)
      (IfRT 23 (BinOpRT 24 Greater_Than (NameRT 25 (IdentifierRT 26 ((*X*) 7) (nil))) (LiteralRT 27 (Integer_Literal 0) (nil) nil) (nil) nil)
        (SeqRT 28
        (AssignRT 29 (IdentifierRT 30 ((*Y*) 8) (nil)) (BinOpRT 31 Minus (NameRT 32 (IdentifierRT 33 ((*X*) 7) (nil))) (LiteralRT 34 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
        (SeqRT 35
        (CallRT 36 37 ((*addup*) 2) 
          ((NameRT 38 (IdentifierRT 39 ((*Y*) 8) (nil))) :: nil)
        ) 
        (AssignRT 40 (IdentifierRT 41 ((*X*) 7) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 7) (nil))) (NameRT 45 (IdentifierRT 46 ((*Y*) 8) (nil))) (OverflowCheck :: nil) nil))))
        NullRT
      )
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
  ((((*Y*) 8), (In_Out, Integer)) :: (((*X*) 7), (In_Out, Integer)) :: (((*X*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*addup*) 2), (0, (mkprocBodyDeclRT 19
  (* = = = Procedure Name = = = *)
  ((*addup*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 20 ((*X*) 7) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 21 (mkobjDeclRT 22 ((*Y*) 8) Integer None)))
  (* = = = Procedure Body = = = *)
    (IfRT 23 (BinOpRT 24 Greater_Than (NameRT 25 (IdentifierRT 26 ((*X*) 7) (nil))) (LiteralRT 27 (Integer_Literal 0) (nil) nil) (nil) nil)
      (SeqRT 28
      (AssignRT 29 (IdentifierRT 30 ((*Y*) 8) (nil)) (BinOpRT 31 Minus (NameRT 32 (IdentifierRT 33 ((*X*) 7) (nil))) (LiteralRT 34 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
      (SeqRT 35
      (CallRT 36 37 ((*addup*) 2) 
        ((NameRT 38 (IdentifierRT 39 ((*Y*) 8) (nil))) :: nil)
      ) 
      (AssignRT 40 (IdentifierRT 41 ((*X*) 7) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 7) (nil))) (NameRT 45 (IdentifierRT 46 ((*Y*) 8) (nil))) (OverflowCheck :: nil) nil))))
      NullRT
    )
))) :: (((*increasebyone*) 1), (0, (mkprocBodyDeclRT 5
  (* = = = Procedure Name = = = *)
  ((*increasebyone*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 6 ((*X*) 4) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 7
    (AssignRT 8 (IdentifierRT 9 ((*X*) 4) (nil)) (BinOpRT 10 Plus (NameRT 11 (IdentifierRT 12 ((*X*) 4) (nil))) (LiteralRT 13 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
    (CallRT 14 15 ((*addup*) 2) 
      ((NameRT 16 (IdentifierRT 17 ((*X*) 4) (nil))) :: nil)
    ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((41, Integer) :: (32, Integer) :: (44, Integer) :: (17, Integer) :: (26, Integer) :: (38, Integer) :: (11, Integer) :: (46, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (10, Integer) :: (45, Integer) :: (9, Integer) :: (27, Integer) :: (12, Integer) :: (39, Integer) :: (30, Integer) :: (42, Integer) :: (33, Integer) :: (24, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((41, (sloc (*Line*)15 (*Col*)3 (*EndLine*)15 (*EndCol*)3)) :: (32, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (44, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (17, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (26, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (38, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (11, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (46, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (13, (sloc (*Line*)5 (*Col*)16 (*EndLine*)5 (*EndCol*)16)) :: (31, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)12)) :: (43, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (16, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (34, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (25, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (10, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)16)) :: (45, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (9, (sloc (*Line*)5 (*Col*)7 (*EndLine*)5 (*EndCol*)7)) :: (27, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)14)) :: (12, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (39, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (30, (sloc (*Line*)13 (*Col*)3 (*EndLine*)13 (*EndCol*)3)) :: (42, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (33, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (24, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Y", "ada://variable/Recursive_Proc_Pkg-1:9/addup-5:14/Y+10:7")) :: (4, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/increasebyone-4:14/X-4:28")) :: (7, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/addup-5:14/X-5:21")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("addup", "ada://procedure/Recursive_Proc_Pkg-1:9/addup-5:14")) :: (1, ("increasebyone", "ada://procedure_body/Recursive_Proc_Pkg-1:9/increasebyone-4:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Recursive_Proc_Pkg", "ada://package_body/Recursive_Proc_Pkg-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

