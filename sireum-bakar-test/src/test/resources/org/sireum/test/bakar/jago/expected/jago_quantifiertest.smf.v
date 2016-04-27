Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (IntegerTypeDecl 4 ((*Index*) 1) (Range 1 10))) 
(SeqDecl 5
(TypeDecl 6 (ArrayTypeDecl 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) 
(SeqDecl 8
(ObjDecl 9 (mkobjDecl 10 ((*V*) 3) (Array_Type ((*Vector*) 2)) None)) 
NullDecl (* Undefined Declarations ! *)))) 
(ProcBodyDecl 11 
  (mkprocBodyDecl 12
    (* = = = Procedure Name = = = *)
    ((*dummy*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 14 (IndexedComponent 15 (Identifier 16 ((*V*) 3) ) (Name 17 (Identifier 18 ((*I*) 6) )) ) (BinOp 19 Plus (Name 20 (IndexedComponent 21 (Identifier 22 ((*V*) 3) ) (Name 23 (Identifier 24 ((*I*) 6) )) )) (Literal 25 (Integer_Literal 3) ) ))
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
  ((((*V*) 3), (In_Out, (Array_Type ((*Vector*) 2)))) :: (((*I*) 6), (In, (Integer_Type ((*Index*) 1)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*dummy*) 4), (0, (mkprocBodyDecl 12
  (* = = = Procedure Name = = = *)
  ((*dummy*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 14 (IndexedComponent 15 (Identifier 16 ((*V*) 3) ) (Name 17 (Identifier 18 ((*I*) 6) )) ) (BinOp 19 Plus (Name 20 (IndexedComponent 21 (Identifier 22 ((*V*) 3) ) (Name 23 (Identifier 24 ((*I*) 6) )) )) (Literal 25 (Integer_Literal 3) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index*) 1), (IntegerTypeDecl 4 ((*Index*) 1) (Range 1 10))) :: (((*Vector*) 2), (ArrayTypeDecl 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Integer_Type ((*Index*) 1))) :: (17, (Integer_Type ((*Index*) 1))) :: (20, Integer) :: (22, (Array_Type ((*Vector*) 2))) :: (25, Integer) :: (16, (Array_Type ((*Vector*) 2))) :: (19, Integer) :: (18, (Integer_Type ((*Index*) 1))) :: (21, Integer) :: (24, (Integer_Type ((*Index*) 1))) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (17, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (20, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (22, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: (25, (sloc (*Line*)8 (*Col*)20 (*EndLine*)8 (*EndCol*)20)) :: (16, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)5)) :: (19, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)20)) :: (18, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (21, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (24, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (15, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)8)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((3, ("V", "ada://variable/QuantifierTest-1:9/V-9:3")) :: (6, ("I", "ada://parameter/QuantifierTest-1:9/dummy-11:13/I-11:19")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("dummy", "ada://procedure_body/QuantifierTest-1:9/dummy-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("QuantifierTest", "ada://package_body/QuantifierTest-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Vector", "ada://ordinary_type/QuantifierTest-1:9/Vector-7:8")) :: (1, ("Index", "ada://ordinary_type/QuantifierTest-1:9/Index-6:8")) :: nil)
))
).

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (IntegerTypeDeclRT 4 ((*Index*) 1) (RangeRT 1 10))) 
(SeqDeclRT 5
(TypeDeclRT 6 (ArrayTypeDeclRT 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) 
(SeqDeclRT 8
(ObjDeclRT 9 (mkobjDeclRT 10 ((*V*) 3) (Array_Type ((*Vector*) 2)) None)) 
NullDeclRT (* Undefined Declarations ! *)))) 
(ProcBodyDeclRT 11 
  (mkprocBodyDeclRT 12
    (* = = = Procedure Name = = = *)
    ((*dummy*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 14 (IndexedComponentRT 15 (IdentifierRT 16 ((*V*) 3) (nil)) (NameRT 17 (IdentifierRT 18 ((*I*) 6) (nil))) (nil)) (BinOpRT 19 Plus (NameRT 20 (IndexedComponentRT 21 (IdentifierRT 22 ((*V*) 3) (nil)) (NameRT 23 (IdentifierRT 24 ((*I*) 6) (nil))) (nil))) (LiteralRT 25 (Integer_Literal 3) (nil) nil) (OverflowCheck :: nil) nil))
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
  ((((*V*) 3), (In_Out, (Array_Type ((*Vector*) 2)))) :: (((*I*) 6), (In, (Integer_Type ((*Index*) 1)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*dummy*) 4), (0, (mkprocBodyDeclRT 12
  (* = = = Procedure Name = = = *)
  ((*dummy*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 13 ((*I*) 6) (Integer_Type ((*Index*) 1)) In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 14 (IndexedComponentRT 15 (IdentifierRT 16 ((*V*) 3) (nil)) (NameRT 17 (IdentifierRT 18 ((*I*) 6) (nil))) (nil)) (BinOpRT 19 Plus (NameRT 20 (IndexedComponentRT 21 (IdentifierRT 22 ((*V*) 3) (nil)) (NameRT 23 (IdentifierRT 24 ((*I*) 6) (nil))) (nil))) (LiteralRT 25 (Integer_Literal 3) (nil) nil) (OverflowCheck :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index*) 1), (IntegerTypeDeclRT 4 ((*Index*) 1) (RangeRT 1 10))) :: (((*Vector*) 2), (ArrayTypeDeclRT 7 ((*Vector*) 2) ((*index subtype mark*) (Integer_Type ((*Index*) 1))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Integer_Type ((*Index*) 1))) :: (17, (Integer_Type ((*Index*) 1))) :: (20, Integer) :: (22, (Array_Type ((*Vector*) 2))) :: (25, Integer) :: (16, (Array_Type ((*Vector*) 2))) :: (19, Integer) :: (18, (Integer_Type ((*Index*) 1))) :: (21, Integer) :: (24, (Integer_Type ((*Index*) 1))) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (17, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (20, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (22, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: (25, (sloc (*Line*)8 (*Col*)20 (*EndLine*)8 (*EndCol*)20)) :: (16, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)5)) :: (19, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)20)) :: (18, (sloc (*Line*)8 (*Col*)7 (*EndLine*)8 (*EndCol*)7)) :: (21, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)16)) :: (24, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)15)) :: (15, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)8)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((3, ("V", "ada://variable/QuantifierTest-1:9/V-9:3")) :: (6, ("I", "ada://parameter/QuantifierTest-1:9/dummy-11:13/I-11:19")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("dummy", "ada://procedure_body/QuantifierTest-1:9/dummy-11:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("QuantifierTest", "ada://package_body/QuantifierTest-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Vector", "ada://ordinary_type/QuantifierTest-1:9/Vector-7:8")) :: (1, ("Index", "ada://ordinary_type/QuantifierTest-1:9/Index-6:8")) :: nil)
))
).

