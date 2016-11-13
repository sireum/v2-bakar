Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Assign_Subtype_Var*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 4
  (TypeDecl 5 (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) 
  (SeqDecl 7
  (TypeDecl 8 (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
  (ObjDecl 10 (mkobjDecl 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (Seq 12
      (Assign 13 (Identifier 14 ((*Left*) 5) ) (Literal 15 (Integer_Literal 0) )) 
      (Assign 16 (Identifier 17 ((*I*) 2) ) (BinOp 18 Plus (Name 19 (Identifier 20 ((*I*) 2) )) (Literal 21 (Integer_Literal 1) ) )))
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
  ((((*I*) 2), (In_Out, Integer)) :: (((*Left*) 5), (In_Out, (Subtype ((*U*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Assign_Subtype_Var*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Assign_Subtype_Var*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 4
(TypeDecl 5 (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) 
(SeqDecl 7
(TypeDecl 8 (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
(ObjDecl 10 (mkobjDecl 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (Seq 12
    (Assign 13 (Identifier 14 ((*Left*) 5) ) (Literal 15 (Integer_Literal 0) )) 
    (Assign 16 (Identifier 17 ((*I*) 2) ) (BinOp 18 Plus (Name 19 (Identifier 20 ((*I*) 2) )) (Literal 21 (Integer_Literal 1) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*U*) 4), (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) :: (((*T*) 3), (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (20, Integer) :: (14, (Subtype ((*U*) 4))) :: (19, Integer) :: (18, Integer) :: (21, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (20, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (14, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (21, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (15, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Assign_Subtype_Var+1:11/I+1:31")) :: (5, ("Left", "ada://variable/Assign_Subtype_Var+1:11/Left+5:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Assign_Subtype_Var", "ada://procedure_body/Assign_Subtype_Var+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("U", "ada://subtype/Assign_Subtype_Var+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Assign_Subtype_Var+1:11/T+3:9")) :: nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Assign_Subtype_Var*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 4
  (TypeDeclRT 5 (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) 
  (SeqDeclRT 7
  (TypeDeclRT 8 (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) 
  (ObjDeclRT 10 (mkobjDeclRT 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (SeqRT 12
      (AssignRT 13 (IdentifierRT 14 ((*Left*) 5) (nil)) (LiteralRT 15 (Integer_Literal 0) (nil) nil)) 
      (AssignRT 16 (IdentifierRT 17 ((*I*) 2) (nil)) (BinOpRT 18 Plus (NameRT 19 (IdentifierRT 20 ((*I*) 2) (nil))) (LiteralRT 21 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
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
  ((((*I*) 2), (In_Out, Integer)) :: (((*Left*) 5), (In_Out, (Subtype ((*U*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Assign_Subtype_Var*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Assign_Subtype_Var*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 4
(TypeDeclRT 5 (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) 
(SeqDeclRT 7
(TypeDeclRT 8 (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) 
(ObjDeclRT 10 (mkobjDeclRT 11 ((*Left*) 5) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (SeqRT 12
    (AssignRT 13 (IdentifierRT 14 ((*Left*) 5) (nil)) (LiteralRT 15 (Integer_Literal 0) (nil) nil)) 
    (AssignRT 16 (IdentifierRT 17 ((*I*) 2) (nil)) (BinOpRT 18 Plus (NameRT 19 (IdentifierRT 20 ((*I*) 2) (nil))) (LiteralRT 21 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*U*) 4), (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) :: (((*T*) 3), (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((17, Integer) :: (20, Integer) :: (14, (Subtype ((*U*) 4))) :: (19, Integer) :: (18, Integer) :: (21, Integer) :: (15, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((17, (sloc (*Line*)9 (*Col*)4 (*EndLine*)9 (*EndCol*)4)) :: (20, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (14, (sloc (*Line*)8 (*Col*)4 (*EndLine*)8 (*EndCol*)7)) :: (19, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)9)) :: (18, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)13)) :: (21, (sloc (*Line*)9 (*Col*)13 (*EndLine*)9 (*EndCol*)13)) :: (15, (sloc (*Line*)8 (*Col*)13 (*EndLine*)8 (*EndCol*)13)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Assign_Subtype_Var+1:11/I+1:31")) :: (5, ("Left", "ada://variable/Assign_Subtype_Var+1:11/Left+5:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Assign_Subtype_Var", "ada://procedure_body/Assign_Subtype_Var+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("U", "ada://subtype/Assign_Subtype_Var+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Assign_Subtype_Var+1:11/T+3:9")) :: nil)
))
).

