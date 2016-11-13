Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Array_Subtype_Index*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 4
  (TypeDecl 5 (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) 
  (SeqDecl 7
  (TypeDecl 8 (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
  (SeqDecl 10
  (TypeDecl 11 (ArrayTypeDecl 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (ObjDecl 13 (mkobjDecl 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
    (* = = = Procedure Body = = = *)
      (Seq 15
      (Assign 16 (IndexedComponent 17 (Identifier 18 ((*A*) 6) ) (Literal 19 (Integer_Literal 0) ) ) (Literal 20 (Integer_Literal 0) )) 
      (Assign 21 (Identifier 22 ((*I*) 2) ) (BinOp 23 Plus (Name 24 (Identifier 25 ((*I*) 2) )) (Literal 26 (Integer_Literal 1) ) )))
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
  ((((*I*) 2), (In_Out, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Array_Subtype_Index*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Array_Subtype_Index*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 4
(TypeDecl 5 (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) 
(SeqDecl 7
(TypeDecl 8 (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
(SeqDecl 10
(TypeDecl 11 (ArrayTypeDecl 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(ObjDecl 13 (mkobjDecl 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
  (* = = = Procedure Body = = = *)
    (Seq 15
    (Assign 16 (IndexedComponent 17 (Identifier 18 ((*A*) 6) ) (Literal 19 (Integer_Literal 0) ) ) (Literal 20 (Integer_Literal 0) )) 
    (Assign 21 (Identifier 22 ((*I*) 2) ) (BinOp 23 Plus (Name 24 (Identifier 25 ((*I*) 2) )) (Literal 26 (Integer_Literal 1) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 5), (ArrayTypeDecl 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*U*) 4), (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) :: (((*T*) 3), (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (26, Integer) :: (17, Integer) :: (20, Integer) :: (22, Integer) :: (25, Integer) :: (19, Integer) :: (18, (Array_Type ((*Ar*) 5))) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)13)) :: (26, (sloc (*Line*)11 (*Col*)13 (*EndLine*)11 (*EndCol*)13)) :: (17, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)7)) :: (20, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (22, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)4)) :: (25, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: (19, (sloc (*Line*)10 (*Col*)6 (*EndLine*)10 (*EndCol*)6)) :: (18, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)4)) :: (24, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Array_Subtype_Index+1:11/I+1:32")) :: (6, ("A", "ada://variable/Array_Subtype_Index+1:11/A+8:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Array_Subtype_Index", "ada://procedure_body/Array_Subtype_Index+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Ar", "ada://ordinary_type/Array_Subtype_Index+1:11/Ar+6:9")) :: (4, ("U", "ada://subtype/Array_Subtype_Index+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Array_Subtype_Index+1:11/T+3:9")) :: nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Array_Subtype_Index*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*I*) 2) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 4
  (TypeDeclRT 5 (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) 
  (SeqDeclRT 7
  (TypeDeclRT 8 (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) 
  (SeqDeclRT 10
  (TypeDeclRT 11 (ArrayTypeDeclRT 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (ObjDeclRT 13 (mkobjDeclRT 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 15
      (AssignRT 16 (IndexedComponentRT 17 (IdentifierRT 18 ((*A*) 6) (nil)) (LiteralRT 19 (Integer_Literal 0) (nil) nil) (nil)) (LiteralRT 20 (Integer_Literal 0) (nil) nil)) 
      (AssignRT 21 (IdentifierRT 22 ((*I*) 2) (nil)) (BinOpRT 23 Plus (NameRT 24 (IdentifierRT 25 ((*I*) 2) (nil))) (LiteralRT 26 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
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
  ((((*I*) 2), (In_Out, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Array_Subtype_Index*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Array_Subtype_Index*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*I*) 2) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 4
(TypeDeclRT 5 (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) 
(SeqDeclRT 7
(TypeDeclRT 8 (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) 
(SeqDeclRT 10
(TypeDeclRT 11 (ArrayTypeDeclRT 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(ObjDeclRT 13 (mkobjDeclRT 14 ((*A*) 6) (Array_Type ((*Ar*) 5)) None))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 15
    (AssignRT 16 (IndexedComponentRT 17 (IdentifierRT 18 ((*A*) 6) (nil)) (LiteralRT 19 (Integer_Literal 0) (nil) nil) (nil)) (LiteralRT 20 (Integer_Literal 0) (nil) nil)) 
    (AssignRT 21 (IdentifierRT 22 ((*I*) 2) (nil)) (BinOpRT 23 Plus (NameRT 24 (IdentifierRT 25 ((*I*) 2) (nil))) (LiteralRT 26 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 5), (ArrayTypeDeclRT 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*U*) 4), (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) :: (((*T*) 3), (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (26, Integer) :: (17, Integer) :: (20, Integer) :: (22, Integer) :: (25, Integer) :: (19, Integer) :: (18, (Array_Type ((*Ar*) 5))) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)13)) :: (26, (sloc (*Line*)11 (*Col*)13 (*EndLine*)11 (*EndCol*)13)) :: (17, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)7)) :: (20, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (22, (sloc (*Line*)11 (*Col*)4 (*EndLine*)11 (*EndCol*)4)) :: (25, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: (19, (sloc (*Line*)10 (*Col*)6 (*EndLine*)10 (*EndCol*)6)) :: (18, (sloc (*Line*)10 (*Col*)4 (*EndLine*)10 (*EndCol*)4)) :: (24, (sloc (*Line*)11 (*Col*)9 (*EndLine*)11 (*EndCol*)9)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((2, ("I", "ada://parameter/Array_Subtype_Index+1:11/I+1:32")) :: (6, ("A", "ada://variable/Array_Subtype_Index+1:11/A+8:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Array_Subtype_Index", "ada://procedure_body/Array_Subtype_Index+1:11")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Ar", "ada://ordinary_type/Array_Subtype_Index+1:11/Ar+6:9")) :: (4, ("U", "ada://subtype/Array_Subtype_Index+1:11/U+4:12")) :: (3, ("T", "ada://ordinary_type/Array_Subtype_Index+1:11/T+3:9")) :: nil)
))
).

