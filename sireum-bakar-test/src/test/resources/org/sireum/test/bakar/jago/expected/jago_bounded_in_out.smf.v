Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Bounded_In_Out*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*V*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 4
  (TypeDecl 5 (SubtypeDecl 6 ((*T1*) 3) Integer (Range 0 10))) 
  (SeqDecl 7
  (TypeDecl 8 (SubtypeDecl 9 ((*T2*) 4) Integer (Range 5 15))) 
  (SeqDecl 10
  (ProcBodyDecl 11 
    (mkprocBodyDecl 12
      (* = = = Procedure Name = = = *)
      ((*Decrease*) 5)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpec 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDecl)
      (* = = = Procedure Body = = = *)
        (Assign 14 (Identifier 15 ((*X*) 6) ) (BinOp 16 Minus (Name 17 (Identifier 18 ((*X*) 6) )) (Literal 19 (Integer_Literal 1) ) ))
    )
  ) 
  (ProcBodyDecl 20 
    (mkprocBodyDecl 21
      (* = = = Procedure Name = = = *)
      ((*Call_Decrease*) 9)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpec 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDecl)
      (* = = = Procedure Body = = = *)
        (Call 23 24 ((*Decrease*) 5) 
          ((Name 25 (Identifier 26 ((*X*) 10) )) :: nil)
        )
    )
  )))))
    (* = = = Procedure Body = = = *)
      (Call 27 28 ((*Call_Decrease*) 9) 
        ((Name 29 (Identifier 30 ((*V*) 2) )) :: nil)
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
  ((((*X*) 10), (In_Out, (Subtype ((*T2*) 4)))) :: (((*X*) 6), (In_Out, (Subtype ((*T1*) 3)))) :: (((*V*) 2), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Call_Decrease*) 9), (1, (mkprocBodyDecl 21
  (* = = = Procedure Name = = = *)
  ((*Call_Decrease*) 9)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Call 23 24 ((*Decrease*) 5) 
      ((Name 25 (Identifier 26 ((*X*) 10) )) :: nil)
    )
))) :: (((*Decrease*) 5), (1, (mkprocBodyDecl 12
  (* = = = Procedure Name = = = *)
  ((*Decrease*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 14 (Identifier 15 ((*X*) 6) ) (BinOp 16 Minus (Name 17 (Identifier 18 ((*X*) 6) )) (Literal 19 (Integer_Literal 1) ) ))
))) :: (((*Bounded_In_Out*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Bounded_In_Out*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*V*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 4
(TypeDecl 5 (SubtypeDecl 6 ((*T1*) 3) Integer (Range 0 10))) 
(SeqDecl 7
(TypeDecl 8 (SubtypeDecl 9 ((*T2*) 4) Integer (Range 5 15))) 
(SeqDecl 10
(ProcBodyDecl 11 
  (mkprocBodyDecl 12
    (* = = = Procedure Name = = = *)
    ((*Decrease*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 14 (Identifier 15 ((*X*) 6) ) (BinOp 16 Minus (Name 17 (Identifier 18 ((*X*) 6) )) (Literal 19 (Integer_Literal 1) ) ))
  )
) 
(ProcBodyDecl 20 
  (mkprocBodyDecl 21
    (* = = = Procedure Name = = = *)
    ((*Call_Decrease*) 9)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Call 23 24 ((*Decrease*) 5) 
        ((Name 25 (Identifier 26 ((*X*) 10) )) :: nil)
      )
  )
)))))
  (* = = = Procedure Body = = = *)
    (Call 27 28 ((*Call_Decrease*) 9) 
      ((Name 29 (Identifier 30 ((*V*) 2) )) :: nil)
    )
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T2*) 4), (SubtypeDecl 9 ((*T2*) 4) Integer (Range 5 15))) :: (((*T1*) 3), (SubtypeDecl 6 ((*T1*) 3) Integer (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((26, (Subtype ((*T2*) 4))) :: (17, (Subtype ((*T1*) 3))) :: (29, Integer) :: (25, (Subtype ((*T2*) 4))) :: (16, Integer) :: (19, Integer) :: (18, (Subtype ((*T1*) 3))) :: (30, Integer) :: (15, (Subtype ((*T1*) 3))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((26, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (17, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (29, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (25, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (16, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)16)) :: (19, (sloc (*Line*)7 (*Col*)16 (*EndLine*)7 (*EndCol*)16)) :: (18, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (30, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (15, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("V", "ada://parameter/Bounded_In_Out+1:11/V+1:27")) :: (10, ("X", "ada://parameter/Bounded_In_Out+1:11/Call_Decrease+10:14/X+10:29")) :: (6, ("X", "ada://parameter/Bounded_In_Out+1:11/Decrease+5:14/X+5:24")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Decrease+5:14")) :: (1, ("Bounded_In_Out", "ada://procedure_body/Bounded_In_Out+1:11")) :: (9, ("Call_Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Call_Decrease+10:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("T2", "ada://subtype/Bounded_In_Out+1:11/T2+3:12")) :: (3, ("T1", "ada://subtype/Bounded_In_Out+1:11/T1+2:12")) :: nil)
))
).

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Bounded_In_Out*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*V*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 4
  (TypeDeclRT 5 (SubtypeDeclRT 6 ((*T1*) 3) Integer (RangeRT 0 10))) 
  (SeqDeclRT 7
  (TypeDeclRT 8 (SubtypeDeclRT 9 ((*T2*) 4) Integer (RangeRT 5 15))) 
  (SeqDeclRT 10
  (ProcBodyDeclRT 11 
    (mkprocBodyDeclRT 12
      (* = = = Procedure Name = = = *)
      ((*Decrease*) 5)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpecRT 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDeclRT)
      (* = = = Procedure Body = = = *)
        (AssignRT 14 (IdentifierRT 15 ((*X*) 6) (nil)) (BinOpRT 16 Minus (NameRT 17 (IdentifierRT 18 ((*X*) 6) (nil))) (LiteralRT 19 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
    )
  ) 
  (ProcBodyDeclRT 20 
    (mkprocBodyDeclRT 21
      (* = = = Procedure Name = = = *)
      ((*Call_Decrease*) 9)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpecRT 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDeclRT)
      (* = = = Procedure Body = = = *)
        (CallRT 23 24 ((*Decrease*) 5) 
          ((NameRT 25 (IdentifierRT 26 ((*X*) 10) (RangeCheck :: nil))) :: nil)
        )
    )
  )))))
    (* = = = Procedure Body = = = *)
      (CallRT 27 28 ((*Call_Decrease*) 9) 
        ((NameRT 29 (IdentifierRT 30 ((*V*) 2) (RangeCheck :: nil))) :: nil)
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
  ((((*X*) 10), (In_Out, (Subtype ((*T2*) 4)))) :: (((*X*) 6), (In_Out, (Subtype ((*T1*) 3)))) :: (((*V*) 2), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Call_Decrease*) 9), (1, (mkprocBodyDeclRT 21
  (* = = = Procedure Name = = = *)
  ((*Call_Decrease*) 9)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (CallRT 23 24 ((*Decrease*) 5) 
      ((NameRT 25 (IdentifierRT 26 ((*X*) 10) (RangeCheck :: nil))) :: nil)
    )
))) :: (((*Decrease*) 5), (1, (mkprocBodyDeclRT 12
  (* = = = Procedure Name = = = *)
  ((*Decrease*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 14 (IdentifierRT 15 ((*X*) 6) (nil)) (BinOpRT 16 Minus (NameRT 17 (IdentifierRT 18 ((*X*) 6) (nil))) (LiteralRT 19 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
))) :: (((*Bounded_In_Out*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Bounded_In_Out*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*V*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 4
(TypeDeclRT 5 (SubtypeDeclRT 6 ((*T1*) 3) Integer (RangeRT 0 10))) 
(SeqDeclRT 7
(TypeDeclRT 8 (SubtypeDeclRT 9 ((*T2*) 4) Integer (RangeRT 5 15))) 
(SeqDeclRT 10
(ProcBodyDeclRT 11 
  (mkprocBodyDeclRT 12
    (* = = = Procedure Name = = = *)
    ((*Decrease*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 13 ((*X*) 6) (Subtype ((*T1*) 3)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 14 (IdentifierRT 15 ((*X*) 6) (nil)) (BinOpRT 16 Minus (NameRT 17 (IdentifierRT 18 ((*X*) 6) (nil))) (LiteralRT 19 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
  )
) 
(ProcBodyDeclRT 20 
  (mkprocBodyDeclRT 21
    (* = = = Procedure Name = = = *)
    ((*Call_Decrease*) 9)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 22 ((*X*) 10) (Subtype ((*T2*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (CallRT 23 24 ((*Decrease*) 5) 
        ((NameRT 25 (IdentifierRT 26 ((*X*) 10) (RangeCheck :: nil))) :: nil)
      )
  )
)))))
  (* = = = Procedure Body = = = *)
    (CallRT 27 28 ((*Call_Decrease*) 9) 
      ((NameRT 29 (IdentifierRT 30 ((*V*) 2) (RangeCheck :: nil))) :: nil)
    )
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T2*) 4), (SubtypeDeclRT 9 ((*T2*) 4) Integer (RangeRT 5 15))) :: (((*T1*) 3), (SubtypeDeclRT 6 ((*T1*) 3) Integer (RangeRT 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((26, (Subtype ((*T2*) 4))) :: (17, (Subtype ((*T1*) 3))) :: (29, Integer) :: (25, (Subtype ((*T2*) 4))) :: (16, Integer) :: (19, Integer) :: (18, (Subtype ((*T1*) 3))) :: (30, Integer) :: (15, (Subtype ((*T1*) 3))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((26, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (17, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (29, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (25, (sloc (*Line*)12 (*Col*)16 (*EndLine*)12 (*EndCol*)16)) :: (16, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)16)) :: (19, (sloc (*Line*)7 (*Col*)16 (*EndLine*)7 (*EndCol*)16)) :: (18, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (30, (sloc (*Line*)16 (*Col*)18 (*EndLine*)16 (*EndCol*)18)) :: (15, (sloc (*Line*)7 (*Col*)7 (*EndLine*)7 (*EndCol*)7)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("V", "ada://parameter/Bounded_In_Out+1:11/V+1:27")) :: (10, ("X", "ada://parameter/Bounded_In_Out+1:11/Call_Decrease+10:14/X+10:29")) :: (6, ("X", "ada://parameter/Bounded_In_Out+1:11/Decrease+5:14/X+5:24")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Decrease+5:14")) :: (1, ("Bounded_In_Out", "ada://procedure_body/Bounded_In_Out+1:11")) :: (9, ("Call_Decrease", "ada://procedure_body/Bounded_In_Out+1:11/Call_Decrease+10:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("T2", "ada://subtype/Bounded_In_Out+1:11/T2+3:12")) :: (3, ("T1", "ada://subtype/Bounded_In_Out+1:11/T1+2:12")) :: nil)
))
).

