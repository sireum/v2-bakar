Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Division_By_Non_Zero*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*X*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 4
  (TypeDecl 5 (SubtypeDecl 6 ((*T1*) 3) Integer (Range 0 10))) 
  (SeqDecl 7
  (ProcBodyDecl 8 
    (mkprocBodyDecl 9
      (* = = = Procedure Name = = = *)
      ((*Divide*) 4)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpec 10 ((*X*) 5) Integer In) :: 
      (mkparamSpec 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
      (mkparamSpec 12 ((*Z*) 7) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDecl)
      (* = = = Procedure Body = = = *)
        (Assign 13 (Identifier 14 ((*Z*) 7) ) (BinOp 15 Divide (Name 16 (Identifier 17 ((*X*) 5) )) (BinOp 18 Plus (Name 19 (Identifier 20 ((*Y*) 6) )) (Literal 21 (Integer_Literal 1) ) ) ))
    )
  ) 
  (ObjDecl 22 (mkobjDecl 23 ((*Result*) 10) Integer None)))))
    (* = = = Procedure Body = = = *)
      (Call 24 25 ((*Divide*) 4) 
        ((Name 26 (Identifier 27 ((*X*) 2) )) :: (Literal 28 (Integer_Literal 8) ) :: (Name 29 (Identifier 30 ((*Result*) 10) )) :: nil)
      )
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
  ((((*X*) 5), (In, Integer)) :: (((*Result*) 10), (In_Out, Integer)) :: (((*X*) 2), (In_Out, Integer)) :: (((*Z*) 7), (Out, Integer)) :: (((*Y*) 6), (In, (Subtype ((*T1*) 3)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Division_By_Non_Zero*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Division_By_Non_Zero*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*X*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 4
(TypeDecl 5 (SubtypeDecl 6 ((*T1*) 3) Integer (Range 0 10))) 
(SeqDecl 7
(ProcBodyDecl 8 
  (mkprocBodyDecl 9
    (* = = = Procedure Name = = = *)
    ((*Divide*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 10 ((*X*) 5) Integer In) :: 
    (mkparamSpec 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
    (mkparamSpec 12 ((*Z*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 13 (Identifier 14 ((*Z*) 7) ) (BinOp 15 Divide (Name 16 (Identifier 17 ((*X*) 5) )) (BinOp 18 Plus (Name 19 (Identifier 20 ((*Y*) 6) )) (Literal 21 (Integer_Literal 1) ) ) ))
  )
) 
(ObjDecl 22 (mkobjDecl 23 ((*Result*) 10) Integer None)))))
  (* = = = Procedure Body = = = *)
    (Call 24 25 ((*Divide*) 4) 
      ((Name 26 (Identifier 27 ((*X*) 2) )) :: (Literal 28 (Integer_Literal 8) ) :: (Name 29 (Identifier 30 ((*Result*) 10) )) :: nil)
    )
))) :: (((*Divide*) 4), (1, (mkprocBodyDecl 9
  (* = = = Procedure Name = = = *)
  ((*Divide*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 10 ((*X*) 5) Integer In) :: 
  (mkparamSpec 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
  (mkparamSpec 12 ((*Z*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 13 (Identifier 14 ((*Z*) 7) ) (BinOp 15 Divide (Name 16 (Identifier 17 ((*X*) 5) )) (BinOp 18 Plus (Name 19 (Identifier 20 ((*Y*) 6) )) (Literal 21 (Integer_Literal 1) ) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T1*) 3), (SubtypeDecl 6 ((*T1*) 3) Integer (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (26, Integer) :: (29, Integer) :: (20, (Subtype ((*T1*) 3))) :: (14, Integer) :: (16, Integer) :: (19, (Subtype ((*T1*) 3))) :: (28, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (30, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (26, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (29, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (20, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (14, (sloc (*Line*)6 (*Col*)7 (*EndLine*)6 (*EndCol*)7)) :: (16, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (19, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (28, (sloc (*Line*)11 (*Col*)14 (*EndLine*)11 (*EndCol*)14)) :: (18, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)21)) :: (27, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (21, (sloc (*Line*)6 (*Col*)21 (*EndLine*)6 (*EndCol*)21)) :: (30, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (15, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)22)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Division_By_Non_Zero+1:11/X+1:33")) :: (5, ("X", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/X+4:22")) :: (7, ("Z", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Z+4:47")) :: (10, ("Result", "ada://variable/Division_By_Non_Zero+1:11/Result+9:4")) :: (6, ("Y", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Y+4:37")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Divide", "ada://procedure_body/Division_By_Non_Zero+1:11/Divide+4:14")) :: (1, ("Division_By_Non_Zero", "ada://procedure_body/Division_By_Non_Zero+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((3, ("T1", "ada://subtype/Division_By_Non_Zero+1:11/T1+2:12")) :: nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Division_By_Non_Zero*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*X*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 4
  (TypeDeclRT 5 (SubtypeDeclRT 6 ((*T1*) 3) Integer (RangeRT 0 10))) 
  (SeqDeclRT 7
  (ProcBodyDeclRT 8 
    (mkprocBodyDeclRT 9
      (* = = = Procedure Name = = = *)
      ((*Divide*) 4)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpecRT 10 ((*X*) 5) Integer In) :: 
      (mkparamSpecRT 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
      (mkparamSpecRT 12 ((*Z*) 7) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDeclRT)
      (* = = = Procedure Body = = = *)
        (AssignRT 13 (IdentifierRT 14 ((*Z*) 7) (nil)) (BinOpRT 15 Divide (NameRT 16 (IdentifierRT 17 ((*X*) 5) (nil))) (BinOpRT 18 Plus (NameRT 19 (IdentifierRT 20 ((*Y*) 6) (nil))) (LiteralRT 21 (Integer_Literal 1) (nil) nil) (nil) nil) (DivCheck :: nil) nil))
    )
  ) 
  (ObjDeclRT 22 (mkobjDeclRT 23 ((*Result*) 10) Integer None)))))
    (* = = = Procedure Body = = = *)
      (CallRT 24 25 ((*Divide*) 4) 
        ((NameRT 26 (IdentifierRT 27 ((*X*) 2) (nil))) :: (LiteralRT 28 (Integer_Literal 8) (nil) nil) :: (NameRT 29 (IdentifierRT 30 ((*Result*) 10) (nil))) :: nil)
      )
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
  ((((*X*) 5), (In, Integer)) :: (((*Result*) 10), (In_Out, Integer)) :: (((*X*) 2), (In_Out, Integer)) :: (((*Z*) 7), (Out, Integer)) :: (((*Y*) 6), (In, (Subtype ((*T1*) 3)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Division_By_Non_Zero*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Division_By_Non_Zero*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*X*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 4
(TypeDeclRT 5 (SubtypeDeclRT 6 ((*T1*) 3) Integer (RangeRT 0 10))) 
(SeqDeclRT 7
(ProcBodyDeclRT 8 
  (mkprocBodyDeclRT 9
    (* = = = Procedure Name = = = *)
    ((*Divide*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 10 ((*X*) 5) Integer In) :: 
    (mkparamSpecRT 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
    (mkparamSpecRT 12 ((*Z*) 7) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 13 (IdentifierRT 14 ((*Z*) 7) (nil)) (BinOpRT 15 Divide (NameRT 16 (IdentifierRT 17 ((*X*) 5) (nil))) (BinOpRT 18 Plus (NameRT 19 (IdentifierRT 20 ((*Y*) 6) (nil))) (LiteralRT 21 (Integer_Literal 1) (nil) nil) (nil) nil) (DivCheck :: nil) nil))
  )
) 
(ObjDeclRT 22 (mkobjDeclRT 23 ((*Result*) 10) Integer None)))))
  (* = = = Procedure Body = = = *)
    (CallRT 24 25 ((*Divide*) 4) 
      ((NameRT 26 (IdentifierRT 27 ((*X*) 2) (nil))) :: (LiteralRT 28 (Integer_Literal 8) (nil) nil) :: (NameRT 29 (IdentifierRT 30 ((*Result*) 10) (nil))) :: nil)
    )
))) :: (((*Divide*) 4), (1, (mkprocBodyDeclRT 9
  (* = = = Procedure Name = = = *)
  ((*Divide*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 10 ((*X*) 5) Integer In) :: 
  (mkparamSpecRT 11 ((*Y*) 6) (Subtype ((*T1*) 3)) In) :: 
  (mkparamSpecRT 12 ((*Z*) 7) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 13 (IdentifierRT 14 ((*Z*) 7) (nil)) (BinOpRT 15 Divide (NameRT 16 (IdentifierRT 17 ((*X*) 5) (nil))) (BinOpRT 18 Plus (NameRT 19 (IdentifierRT 20 ((*Y*) 6) (nil))) (LiteralRT 21 (Integer_Literal 1) (nil) nil) (nil) nil) (DivCheck :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T1*) 3), (SubtypeDeclRT 6 ((*T1*) 3) Integer (RangeRT 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (26, Integer) :: (29, Integer) :: (20, (Subtype ((*T1*) 3))) :: (14, Integer) :: (16, Integer) :: (19, (Subtype ((*T1*) 3))) :: (28, Integer) :: (18, Integer) :: (27, Integer) :: (21, Integer) :: (30, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (26, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (29, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (20, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (14, (sloc (*Line*)6 (*Col*)7 (*EndLine*)6 (*EndCol*)7)) :: (16, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)12)) :: (19, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)17)) :: (28, (sloc (*Line*)11 (*Col*)14 (*EndLine*)11 (*EndCol*)14)) :: (18, (sloc (*Line*)6 (*Col*)17 (*EndLine*)6 (*EndCol*)21)) :: (27, (sloc (*Line*)11 (*Col*)11 (*EndLine*)11 (*EndCol*)11)) :: (21, (sloc (*Line*)6 (*Col*)21 (*EndLine*)6 (*EndCol*)21)) :: (30, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)22)) :: (15, (sloc (*Line*)6 (*Col*)12 (*EndLine*)6 (*EndCol*)22)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("X", "ada://parameter/Division_By_Non_Zero+1:11/X+1:33")) :: (5, ("X", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/X+4:22")) :: (7, ("Z", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Z+4:47")) :: (10, ("Result", "ada://variable/Division_By_Non_Zero+1:11/Result+9:4")) :: (6, ("Y", "ada://parameter/Division_By_Non_Zero+1:11/Divide+4:14/Y+4:37")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Divide", "ada://procedure_body/Division_By_Non_Zero+1:11/Divide+4:14")) :: (1, ("Division_By_Non_Zero", "ada://procedure_body/Division_By_Non_Zero+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((3, ("T1", "ada://subtype/Division_By_Non_Zero+1:11/T1+2:12")) :: nil)
))
).

