Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
NullDecl (* Undefined Declarations ! *) 
(ProcBodyDecl 2 
  (mkprocBodyDecl 3
    (* = = = Procedure Name = = = *)
    ((*Q*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 4 ((*X*) 3) Integer In) :: 
    (mkparamSpec 5 ((*Z*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 6 (Identifier 7 ((*Z*) 4) ) (BinOp 8 Plus (Name 9 (Identifier 10 ((*X*) 3) )) (Literal 11 (Integer_Literal 2) ) ))
  )
))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 3), (In, Integer)) :: (((*Z*) 4), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 1), (0, (mkprocBodyDecl 3
  (* = = = Procedure Name = = = *)
  ((*Q*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 4 ((*X*) 3) Integer In) :: 
  (mkparamSpec 5 ((*Z*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 6 (Identifier 7 ((*Z*) 4) ) (BinOp 8 Plus (Name 9 (Identifier 10 ((*X*) 3) )) (Literal 11 (Integer_Literal 2) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((8, Integer) :: (11, Integer) :: (7, Integer) :: (10, Integer) :: (9, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((8, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)15)) :: (11, (sloc (*Line*)5 (*Col*)15 (*EndLine*)5 (*EndCol*)15)) :: (7, (sloc (*Line*)5 (*Col*)6 (*EndLine*)5 (*EndCol*)6)) :: (10, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: (9, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((4, ("Z", "ada://parameter/PackageDemo_A-1:9/Q-2:13/Z-2:30")) :: (3, ("X", "ada://parameter/PackageDemo_A-1:9/Q-2:13/X-2:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Q", "ada://procedure_body/PackageDemo_A-1:9/Q-2:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("PackageDemo_A", "ada://package_body/PackageDemo_A-1:9")) :: nil)
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
NullDeclRT (* Undefined Declarations ! *) 
(ProcBodyDeclRT 2 
  (mkprocBodyDeclRT 3
    (* = = = Procedure Name = = = *)
    ((*Q*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 4 ((*X*) 3) Integer In) :: 
    (mkparamSpecRT 5 ((*Z*) 4) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 6 (IdentifierRT 7 ((*Z*) 4) (nil)) (BinOpRT 8 Plus (NameRT 9 (IdentifierRT 10 ((*X*) 3) (nil))) (LiteralRT 11 (Integer_Literal 2) (nil) nil) (OverflowCheck :: nil) nil))
  )
))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 3), (In, Integer)) :: (((*Z*) 4), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Q*) 1), (0, (mkprocBodyDeclRT 3
  (* = = = Procedure Name = = = *)
  ((*Q*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 4 ((*X*) 3) Integer In) :: 
  (mkparamSpecRT 5 ((*Z*) 4) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 6 (IdentifierRT 7 ((*Z*) 4) (nil)) (BinOpRT 8 Plus (NameRT 9 (IdentifierRT 10 ((*X*) 3) (nil))) (LiteralRT 11 (Integer_Literal 2) (nil) nil) (OverflowCheck :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((8, Integer) :: (11, Integer) :: (7, Integer) :: (10, Integer) :: (9, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((8, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)15)) :: (11, (sloc (*Line*)5 (*Col*)15 (*EndLine*)5 (*EndCol*)15)) :: (7, (sloc (*Line*)5 (*Col*)6 (*EndLine*)5 (*EndCol*)6)) :: (10, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: (9, (sloc (*Line*)5 (*Col*)11 (*EndLine*)5 (*EndCol*)11)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((4, ("Z", "ada://parameter/PackageDemo_A-1:9/Q-2:13/Z-2:30")) :: (3, ("X", "ada://parameter/PackageDemo_A-1:9/Q-2:13/X-2:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Q", "ada://procedure_body/PackageDemo_A-1:9/Q-2:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("PackageDemo_A", "ada://package_body/PackageDemo_A-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

