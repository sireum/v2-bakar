Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Linear_Div*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*Dividend*) 2) Integer In) :: 
    (mkparamSpec 4 ((*Divisor*) 3) Integer In) :: 
    (mkparamSpec 5 ((*Quotient*) 4) Integer Out) :: 
    (mkparamSpec 6 ((*Remainder*) 5) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 7
      (Assign 8 (Identifier 9 ((*Quotient*) 4) ) (Literal 10 (Integer_Literal 0) )) 
      (Seq 11
      (Assign 12 (Identifier 13 ((*Remainder*) 5) ) (Name 14 (Identifier 15 ((*Dividend*) 2) ))) 
      (While 16 (BinOp 17 Greater_Than_Or_Equal (Name 18 (Identifier 19 ((*Remainder*) 5) )) (Name 20 (Identifier 21 ((*Divisor*) 3) )) )
        (Seq 22
        (Assign 23 (Identifier 24 ((*Quotient*) 4) ) (BinOp 25 Plus (Name 26 (Identifier 27 ((*Quotient*) 4) )) (Literal 28 (Integer_Literal 1) ) )) 
        (Seq 29
        (Assign 30 (Identifier 31 ((*Quotient*) 4) ) (BinOp 32 Plus (Name 33 (Identifier 34 ((*Quotient*) 4) )) (Literal 35 (Integer_Literal 1) ) )) 
        (Assign 36 (Identifier 37 ((*Remainder*) 5) ) (BinOp 38 Minus (Name 39 (Identifier 40 ((*Remainder*) 5) )) (Name 41 (Identifier 42 ((*Divisor*) 3) )) ))))
      )))
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
  ((((*Quotient*) 4), (Out, Integer)) :: (((*Dividend*) 2), (In, Integer)) :: (((*Remainder*) 5), (Out, Integer)) :: (((*Divisor*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Linear_Div*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Linear_Div*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*Dividend*) 2) Integer In) :: 
  (mkparamSpec 4 ((*Divisor*) 3) Integer In) :: 
  (mkparamSpec 5 ((*Quotient*) 4) Integer Out) :: 
  (mkparamSpec 6 ((*Remainder*) 5) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 7
    (Assign 8 (Identifier 9 ((*Quotient*) 4) ) (Literal 10 (Integer_Literal 0) )) 
    (Seq 11
    (Assign 12 (Identifier 13 ((*Remainder*) 5) ) (Name 14 (Identifier 15 ((*Dividend*) 2) ))) 
    (While 16 (BinOp 17 Greater_Than_Or_Equal (Name 18 (Identifier 19 ((*Remainder*) 5) )) (Name 20 (Identifier 21 ((*Divisor*) 3) )) )
      (Seq 22
      (Assign 23 (Identifier 24 ((*Quotient*) 4) ) (BinOp 25 Plus (Name 26 (Identifier 27 ((*Quotient*) 4) )) (Literal 28 (Integer_Literal 1) ) )) 
      (Seq 29
      (Assign 30 (Identifier 31 ((*Quotient*) 4) ) (BinOp 32 Plus (Name 33 (Identifier 34 ((*Quotient*) 4) )) (Literal 35 (Integer_Literal 1) ) )) 
      (Assign 36 (Identifier 37 ((*Remainder*) 5) ) (BinOp 38 Minus (Name 39 (Identifier 40 ((*Remainder*) 5) )) (Name 41 (Identifier 42 ((*Divisor*) 3) )) ))))
    )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (41, Integer) :: (17, Boolean) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (40, Integer) :: (13, Integer) :: (31, Integer) :: (25, Integer) :: (34, Integer) :: (10, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Integer) :: (9, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (15, Integer) :: (24, Integer) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)30)) :: (41, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (17, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)29)) :: (35, (sloc (*Line*)18 (*Col*)30 (*EndLine*)18 (*EndCol*)30)) :: (26, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (38, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)38)) :: (20, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (14, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (40, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (13, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)12)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)14)) :: (25, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)30)) :: (34, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: (10, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (37, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)15)) :: (19, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (28, (sloc (*Line*)17 (*Col*)30 (*EndLine*)17 (*EndCol*)30)) :: (18, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (9, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)11)) :: (27, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (21, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (39, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (42, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)14)) :: (33, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("Dividend", "ada://parameter/Linear_Div+1:11/Dividend+1:23")) :: (5, ("Remainder", "ada://parameter/Linear_Div+1:11/Remainder+2:66")) :: (4, ("Quotient", "ada://parameter/Linear_Div+1:11/Quotient+2:42")) :: (3, ("Divisor", "ada://parameter/Linear_Div+1:11/Divisor+2:23")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Linear_Div", "ada://procedure_body/Linear_Div+1:11")) :: nil)
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
    ((*Linear_Div*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*Dividend*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*Divisor*) 3) Integer In) :: 
    (mkparamSpecRT 5 ((*Quotient*) 4) Integer Out) :: 
    (mkparamSpecRT 6 ((*Remainder*) 5) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 7
      (AssignRT 8 (IdentifierRT 9 ((*Quotient*) 4) (nil)) (LiteralRT 10 (Integer_Literal 0) (nil) nil)) 
      (SeqRT 11
      (AssignRT 12 (IdentifierRT 13 ((*Remainder*) 5) (nil)) (NameRT 14 (IdentifierRT 15 ((*Dividend*) 2) (nil)))) 
      (WhileRT 16 (BinOpRT 17 Greater_Than_Or_Equal (NameRT 18 (IdentifierRT 19 ((*Remainder*) 5) (nil))) (NameRT 20 (IdentifierRT 21 ((*Divisor*) 3) (nil))) (nil) nil)
        (SeqRT 22
        (AssignRT 23 (IdentifierRT 24 ((*Quotient*) 4) (nil)) (BinOpRT 25 Plus (NameRT 26 (IdentifierRT 27 ((*Quotient*) 4) (nil))) (LiteralRT 28 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
        (SeqRT 29
        (AssignRT 30 (IdentifierRT 31 ((*Quotient*) 4) (nil)) (BinOpRT 32 Plus (NameRT 33 (IdentifierRT 34 ((*Quotient*) 4) (nil))) (LiteralRT 35 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
        (AssignRT 36 (IdentifierRT 37 ((*Remainder*) 5) (nil)) (BinOpRT 38 Minus (NameRT 39 (IdentifierRT 40 ((*Remainder*) 5) (nil))) (NameRT 41 (IdentifierRT 42 ((*Divisor*) 3) (nil))) (OverflowCheck :: nil) nil))))
      )))
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
  ((((*Quotient*) 4), (Out, Integer)) :: (((*Dividend*) 2), (In, Integer)) :: (((*Remainder*) 5), (Out, Integer)) :: (((*Divisor*) 3), (In, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Linear_Div*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Linear_Div*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*Dividend*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*Divisor*) 3) Integer In) :: 
  (mkparamSpecRT 5 ((*Quotient*) 4) Integer Out) :: 
  (mkparamSpecRT 6 ((*Remainder*) 5) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 7
    (AssignRT 8 (IdentifierRT 9 ((*Quotient*) 4) (nil)) (LiteralRT 10 (Integer_Literal 0) (nil) nil)) 
    (SeqRT 11
    (AssignRT 12 (IdentifierRT 13 ((*Remainder*) 5) (nil)) (NameRT 14 (IdentifierRT 15 ((*Dividend*) 2) (nil)))) 
    (WhileRT 16 (BinOpRT 17 Greater_Than_Or_Equal (NameRT 18 (IdentifierRT 19 ((*Remainder*) 5) (nil))) (NameRT 20 (IdentifierRT 21 ((*Divisor*) 3) (nil))) (nil) nil)
      (SeqRT 22
      (AssignRT 23 (IdentifierRT 24 ((*Quotient*) 4) (nil)) (BinOpRT 25 Plus (NameRT 26 (IdentifierRT 27 ((*Quotient*) 4) (nil))) (LiteralRT 28 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
      (SeqRT 29
      (AssignRT 30 (IdentifierRT 31 ((*Quotient*) 4) (nil)) (BinOpRT 32 Plus (NameRT 33 (IdentifierRT 34 ((*Quotient*) 4) (nil))) (LiteralRT 35 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
      (AssignRT 36 (IdentifierRT 37 ((*Remainder*) 5) (nil)) (BinOpRT 38 Minus (NameRT 39 (IdentifierRT 40 ((*Remainder*) 5) (nil))) (NameRT 41 (IdentifierRT 42 ((*Divisor*) 3) (nil))) (OverflowCheck :: nil) nil))))
    )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((32, Integer) :: (41, Integer) :: (17, Boolean) :: (35, Integer) :: (26, Integer) :: (38, Integer) :: (20, Integer) :: (14, Integer) :: (40, Integer) :: (13, Integer) :: (31, Integer) :: (25, Integer) :: (34, Integer) :: (10, Integer) :: (37, Integer) :: (19, Integer) :: (28, Integer) :: (18, Integer) :: (9, Integer) :: (27, Integer) :: (21, Integer) :: (39, Integer) :: (42, Integer) :: (15, Integer) :: (24, Integer) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((32, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)30)) :: (41, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (17, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)29)) :: (35, (sloc (*Line*)18 (*Col*)30 (*EndLine*)18 (*EndCol*)30)) :: (26, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (38, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)38)) :: (20, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (14, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (40, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (13, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)12)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)14)) :: (25, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)30)) :: (34, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: (10, (sloc (*Line*)10 (*Col*)16 (*EndLine*)10 (*EndCol*)16)) :: (37, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)15)) :: (19, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (28, (sloc (*Line*)17 (*Col*)30 (*EndLine*)17 (*EndCol*)30)) :: (18, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)18)) :: (9, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)11)) :: (27, (sloc (*Line*)17 (*Col*)19 (*EndLine*)17 (*EndCol*)26)) :: (21, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)29)) :: (39, (sloc (*Line*)19 (*Col*)20 (*EndLine*)19 (*EndCol*)28)) :: (42, (sloc (*Line*)19 (*Col*)32 (*EndLine*)19 (*EndCol*)38)) :: (15, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)14)) :: (33, (sloc (*Line*)18 (*Col*)19 (*EndLine*)18 (*EndCol*)26)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("Dividend", "ada://parameter/Linear_Div+1:11/Dividend+1:23")) :: (5, ("Remainder", "ada://parameter/Linear_Div+1:11/Remainder+2:66")) :: (4, ("Quotient", "ada://parameter/Linear_Div+1:11/Quotient+2:42")) :: (3, ("Divisor", "ada://parameter/Linear_Div+1:11/Divisor+2:23")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Linear_Div", "ada://procedure_body/Linear_Div+1:11")) :: nil)
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

