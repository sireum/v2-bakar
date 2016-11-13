Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (SubtypeDecl 4 ((*U64*) 1) Integer (Range 0 2147483647))) 
(SeqDecl 5
(TypeDecl 6 (SubtypeDecl 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (Range 0 7))) 
(SeqDecl 8
(TypeDecl 9 (SubtypeDecl 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (Range 0 8))) 
(SeqDecl 11
(TypeDecl 12 (ArrayTypeDecl 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) 
NullDecl (* Undefined Declarations ! *))))) 
(ProcBodyDecl 14 
  (mkprocBodyDecl 15
    (* = = = Procedure Name = = = *)
    ((*Mod_Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
    (mkparamSpec 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
    (mkparamSpec 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 19 (IndexedComponent 20 (Identifier 21 ((*KS*) 9) ) (Name 22 (Identifier 23 ((*I*) 8) )) ) (Name 24 (IndexedComponent 25 (Identifier 26 ((*KS*) 9) ) (BinOp 27 Modulus (BinOp 28 Plus (Name 29 (Identifier 30 ((*R*) 7) )) (Name 31 (Identifier 32 ((*I*) 8) )) ) (BinOp 33 Plus (Literal 34 (Integer_Literal 8) ) (Literal 35 (Integer_Literal 1) ) ) ) )))
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
  ((((*I*) 8), (In, (Subtype ((*Injection_Range*) 2)))) :: (((*R*) 7), (In, (Subtype ((*U64*) 1)))) :: (((*KS*) 9), (In_Out, (Array_Type ((*U64_Seq_9*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Mod_Test*) 5), (0, (mkprocBodyDecl 15
  (* = = = Procedure Name = = = *)
  ((*Mod_Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
  (mkparamSpec 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
  (mkparamSpec 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 19 (IndexedComponent 20 (Identifier 21 ((*KS*) 9) ) (Name 22 (Identifier 23 ((*I*) 8) )) ) (Name 24 (IndexedComponent 25 (Identifier 26 ((*KS*) 9) ) (BinOp 27 Modulus (BinOp 28 Plus (Name 29 (Identifier 30 ((*R*) 7) )) (Name 31 (Identifier 32 ((*I*) 8) )) ) (BinOp 33 Plus (Literal 34 (Integer_Literal 8) ) (Literal 35 (Integer_Literal 1) ) ) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Injection_Range*) 2), (SubtypeDecl 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (Range 0 7))) :: (((*I9*) 3), (SubtypeDecl 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (Range 0 8))) :: (((*U64_Seq_9*) 4), (ArrayTypeDecl 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) :: (((*U64*) 1), (SubtypeDecl 4 ((*U64*) 1) Integer (Range 0 2147483647))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Subtype ((*Injection_Range*) 2))) :: (32, (Subtype ((*Injection_Range*) 2))) :: (35, Integer) :: (26, (Array_Type ((*U64_Seq_9*) 4))) :: (29, (Subtype ((*U64*) 1))) :: (20, (Subtype ((*U64*) 1))) :: (22, (Subtype ((*Injection_Range*) 2))) :: (31, (Subtype ((*Injection_Range*) 2))) :: (34, Integer) :: (25, (Subtype ((*U64*) 1))) :: (28, Integer) :: (27, Integer) :: (21, (Array_Type ((*U64_Seq_9*) 4))) :: (30, (Subtype ((*U64*) 1))) :: (33, Integer) :: (24, (Subtype ((*U64*) 1))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (32, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (35, (sloc (*Line*)7 (*Col*)39 (*EndLine*)7 (*EndCol*)39)) :: (26, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)19)) :: (29, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (20, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)13)) :: (22, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (31, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (34, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)35)) :: (25, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: (28, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)27)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)40)) :: (21, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)9)) :: (30, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (33, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)39)) :: (24, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("I", "ada://parameter/Modulus-1:9/Mod_Test-9:14/I-9:36")) :: (7, ("R", "ada://parameter/Modulus-1:9/Mod_Test-9:14/R-9:24")) :: (9, ("KS", "ada://parameter/Modulus-1:9/Mod_Test-9:14/KS-9:57")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Mod_Test", "ada://procedure_body/Modulus-1:9/Mod_Test-9:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("Modulus", "ada://package_body/Modulus-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Injection_Range", "ada://subtype/Modulus-1:9/Injection_Range-4:12")) :: (4, ("U64_Seq_9", "ada://ordinary_type/Modulus-1:9/U64_Seq_9-7:9")) :: (1, ("U64", "ada://subtype/Modulus-1:9/U64-3:12")) :: (3, ("I9", "ada://subtype/Modulus-1:9/I9-5:12")) :: nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (SubtypeDeclRT 4 ((*U64*) 1) Integer (RangeRT 0 2147483647))) 
(SeqDeclRT 5
(TypeDeclRT 6 (SubtypeDeclRT 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (RangeRT 0 7))) 
(SeqDeclRT 8
(TypeDeclRT 9 (SubtypeDeclRT 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (RangeRT 0 8))) 
(SeqDeclRT 11
(TypeDeclRT 12 (ArrayTypeDeclRT 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) 
NullDeclRT (* Undefined Declarations ! *))))) 
(ProcBodyDeclRT 14 
  (mkprocBodyDeclRT 15
    (* = = = Procedure Name = = = *)
    ((*Mod_Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
    (mkparamSpecRT 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
    (mkparamSpecRT 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 19 (IndexedComponentRT 20 (IdentifierRT 21 ((*KS*) 9) (nil)) (NameRT 22 (IdentifierRT 23 ((*I*) 8) (nil))) (nil)) (NameRT 24 (IndexedComponentRT 25 (IdentifierRT 26 ((*KS*) 9) (nil)) (BinOpRT 27 Modulus (BinOpRT 28 Plus (NameRT 29 (IdentifierRT 30 ((*R*) 7) (nil))) (NameRT 31 (IdentifierRT 32 ((*I*) 8) (nil))) (OverflowCheck :: nil) nil) (BinOpRT 33 Plus (LiteralRT 34 (Integer_Literal 8) (nil) nil) (LiteralRT 35 (Integer_Literal 1) (nil) nil) (nil) nil) (DivCheck :: nil) nil) (nil))))
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
  ((((*I*) 8), (In, (Subtype ((*Injection_Range*) 2)))) :: (((*R*) 7), (In, (Subtype ((*U64*) 1)))) :: (((*KS*) 9), (In_Out, (Array_Type ((*U64_Seq_9*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Mod_Test*) 5), (0, (mkprocBodyDeclRT 15
  (* = = = Procedure Name = = = *)
  ((*Mod_Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 16 ((*R*) 7) (Subtype ((*U64*) 1)) In) :: 
  (mkparamSpecRT 17 ((*I*) 8) (Subtype ((*Injection_Range*) 2)) In) :: 
  (mkparamSpecRT 18 ((*KS*) 9) (Array_Type ((*U64_Seq_9*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 19 (IndexedComponentRT 20 (IdentifierRT 21 ((*KS*) 9) (nil)) (NameRT 22 (IdentifierRT 23 ((*I*) 8) (nil))) (nil)) (NameRT 24 (IndexedComponentRT 25 (IdentifierRT 26 ((*KS*) 9) (nil)) (BinOpRT 27 Modulus (BinOpRT 28 Plus (NameRT 29 (IdentifierRT 30 ((*R*) 7) (nil))) (NameRT 31 (IdentifierRT 32 ((*I*) 8) (nil))) (OverflowCheck :: nil) nil) (BinOpRT 33 Plus (LiteralRT 34 (Integer_Literal 8) (nil) nil) (LiteralRT 35 (Integer_Literal 1) (nil) nil) (nil) nil) (DivCheck :: nil) nil) (nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Injection_Range*) 2), (SubtypeDeclRT 7 ((*Injection_Range*) 2) (Subtype ((*U64*) 1)) (RangeRT 0 7))) :: (((*I9*) 3), (SubtypeDeclRT 10 ((*I9*) 3) (Subtype ((*U64*) 1)) (RangeRT 0 8))) :: (((*U64_Seq_9*) 4), (ArrayTypeDeclRT 13 ((*U64_Seq_9*) 4) ((*index subtype mark*) (Subtype ((*I9*) 3))) ((*component type*) (Subtype ((*U64*) 1))))) :: (((*U64*) 1), (SubtypeDeclRT 4 ((*U64*) 1) Integer (RangeRT 0 2147483647))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Subtype ((*Injection_Range*) 2))) :: (32, (Subtype ((*Injection_Range*) 2))) :: (35, Integer) :: (26, (Array_Type ((*U64_Seq_9*) 4))) :: (29, (Subtype ((*U64*) 1))) :: (20, (Subtype ((*U64*) 1))) :: (22, (Subtype ((*Injection_Range*) 2))) :: (31, (Subtype ((*Injection_Range*) 2))) :: (34, Integer) :: (25, (Subtype ((*U64*) 1))) :: (28, Integer) :: (27, Integer) :: (21, (Array_Type ((*U64_Seq_9*) 4))) :: (30, (Subtype ((*U64*) 1))) :: (33, Integer) :: (24, (Subtype ((*U64*) 1))) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (32, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (35, (sloc (*Line*)7 (*Col*)39 (*EndLine*)7 (*EndCol*)39)) :: (26, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)19)) :: (29, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (20, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)13)) :: (22, (sloc (*Line*)7 (*Col*)12 (*EndLine*)7 (*EndCol*)12)) :: (31, (sloc (*Line*)7 (*Col*)27 (*EndLine*)7 (*EndCol*)27)) :: (34, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)35)) :: (25, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: (28, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)27)) :: (27, (sloc (*Line*)7 (*Col*)22 (*EndLine*)7 (*EndCol*)40)) :: (21, (sloc (*Line*)7 (*Col*)8 (*EndLine*)7 (*EndCol*)9)) :: (30, (sloc (*Line*)7 (*Col*)23 (*EndLine*)7 (*EndCol*)23)) :: (33, (sloc (*Line*)7 (*Col*)35 (*EndLine*)7 (*EndCol*)39)) :: (24, (sloc (*Line*)7 (*Col*)18 (*EndLine*)7 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("I", "ada://parameter/Modulus-1:9/Mod_Test-9:14/I-9:36")) :: (7, ("R", "ada://parameter/Modulus-1:9/Mod_Test-9:14/R-9:24")) :: (9, ("KS", "ada://parameter/Modulus-1:9/Mod_Test-9:14/KS-9:57")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Mod_Test", "ada://procedure_body/Modulus-1:9/Mod_Test-9:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("Modulus", "ada://package_body/Modulus-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("Injection_Range", "ada://subtype/Modulus-1:9/Injection_Range-4:12")) :: (4, ("U64_Seq_9", "ada://ordinary_type/Modulus-1:9/U64_Seq_9-7:9")) :: (1, ("U64", "ada://subtype/Modulus-1:9/U64-3:12")) :: (3, ("I9", "ada://subtype/Modulus-1:9/I9-5:12")) :: nil)
))
).

