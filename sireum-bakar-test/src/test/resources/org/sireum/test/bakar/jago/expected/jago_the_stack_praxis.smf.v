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
(TypeDecl 4 (IntegerTypeDecl 5 ((*Pointer_Range*) 4) (Range 0 100))) 
(SeqDecl 6
(TypeDecl 7 (SubtypeDecl 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (Range 1 100))) 
(SeqDecl 9
(TypeDecl 10 (ArrayTypeDecl 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) 
(SeqDecl 12
(ObjDecl 13 (mkobjDecl 14 ((*S*) 7) (Array_Type ((*Vector*) 6)) None)) 
(SeqDecl 15
(ObjDecl 16 (mkobjDecl 17 ((*Pointer*) 8) (Integer_Type ((*Pointer_Range*) 4)) None)) 
(SeqDecl 18
(ProcBodyDecl 19 
  (mkprocBodyDecl 20
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 21 ((*X*) 9) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 22
      (Assign 23 (Identifier 24 ((*Pointer*) 8) ) (BinOp 25 Plus (Name 26 (Identifier 27 ((*Pointer*) 8) )) (Literal 28 (Integer_Literal 1) ) )) 
      (Assign 29 (IndexedComponent 30 (Identifier 31 ((*S*) 7) ) (Name 32 (Identifier 33 ((*Pointer*) 8) )) ) (Name 34 (Identifier 35 ((*X*) 9) ))))
  )
) 
(ProcBodyDecl 36 
  (mkprocBodyDecl 37
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 38 ((*X*) 12) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 39
      (Assign 40 (Identifier 41 ((*X*) 12) ) (Name 42 (IndexedComponent 43 (Identifier 44 ((*S*) 7) ) (Name 45 (Identifier 46 ((*Pointer*) 8) )) ))) 
      (Assign 47 (Identifier 48 ((*Pointer*) 8) ) (BinOp 49 Minus (Name 50 (Identifier 51 ((*Pointer*) 8) )) (Literal 52 (Integer_Literal 1) ) )))
  )
))))))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Pointer*) 8), (In_Out, (Integer_Type ((*Pointer_Range*) 4)))) :: (((*S*) 7), (In_Out, (Array_Type ((*Vector*) 6)))) :: (((*X*) 9), (In, Integer)) :: (((*X*) 12), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocBodyDecl 20
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 21 ((*X*) 9) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 22
    (Assign 23 (Identifier 24 ((*Pointer*) 8) ) (BinOp 25 Plus (Name 26 (Identifier 27 ((*Pointer*) 8) )) (Literal 28 (Integer_Literal 1) ) )) 
    (Assign 29 (IndexedComponent 30 (Identifier 31 ((*S*) 7) ) (Name 32 (Identifier 33 ((*Pointer*) 8) )) ) (Name 34 (Identifier 35 ((*X*) 9) ))))
))) :: (((*Pop*) 2), (0, (mkprocBodyDecl 37
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 38 ((*X*) 12) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 39
    (Assign 40 (Identifier 41 ((*X*) 12) ) (Name 42 (IndexedComponent 43 (Identifier 44 ((*S*) 7) ) (Name 45 (Identifier 46 ((*Pointer*) 8) )) ))) 
    (Assign 47 (Identifier 48 ((*Pointer*) 8) ) (BinOp 49 Minus (Name 50 (Identifier 51 ((*Pointer*) 8) )) (Literal 52 (Integer_Literal 1) ) )))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Range*) 5), (SubtypeDecl 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (Range 1 100))) :: (((*Pointer_Range*) 4), (IntegerTypeDecl 5 ((*Pointer_Range*) 4) (Range 0 100))) :: (((*Vector*) 6), (ArrayTypeDecl 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((50, (Integer_Type ((*Pointer_Range*) 4))) :: (32, (Integer_Type ((*Pointer_Range*) 4))) :: (41, Integer) :: (44, (Array_Type ((*Vector*) 6))) :: (26, (Integer_Type ((*Pointer_Range*) 4))) :: (35, Integer) :: (46, (Integer_Type ((*Pointer_Range*) 4))) :: (49, (Integer_Type ((*Pointer_Range*) 4))) :: (31, (Array_Type ((*Vector*) 6))) :: (52, Integer) :: (43, Integer) :: (25, (Integer_Type ((*Pointer_Range*) 4))) :: (34, Integer) :: (28, Integer) :: (45, (Integer_Type ((*Pointer_Range*) 4))) :: (27, (Integer_Type ((*Pointer_Range*) 4))) :: (48, (Integer_Type ((*Pointer_Range*) 4))) :: (30, Integer) :: (51, (Integer_Type ((*Pointer_Range*) 4))) :: (24, (Integer_Type ((*Pointer_Range*) 4))) :: (33, (Integer_Type ((*Pointer_Range*) 4))) :: (42, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((50, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (32, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (41, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (44, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)12)) :: (26, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (35, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (46, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (49, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)28)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)7)) :: (52, (sloc (*Line*)30 (*Col*)28 (*EndLine*)30 (*EndCol*)28)) :: (43, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (25, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)28)) :: (34, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (28, (sloc (*Line*)17 (*Col*)28 (*EndLine*)17 (*EndCol*)28)) :: (45, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (27, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (48, (sloc (*Line*)30 (*Col*)7 (*EndLine*)30 (*EndCol*)13)) :: (30, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)16)) :: (51, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)13)) :: (33, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (42, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Pointer", "ada://variable/The_Stack_Praxis-1:9/Pointer+9:4")) :: (7, ("S", "ada://variable/The_Stack_Praxis-1:9/S+8:4")) :: (9, ("X", "ada://parameter/The_Stack_Praxis-1:9/Push-5:14/X-5:19")) :: (12, ("X", "ada://parameter/The_Stack_Praxis-1:9/Pop-9:14/X-9:18")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Pop", "ada://procedure_body/The_Stack_Praxis-1:9/Pop-9:14")) :: (1, ("Push", "ada://procedure_body/The_Stack_Praxis-1:9/Push-5:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("The_Stack_Praxis", "ada://package_body/The_Stack_Praxis-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Index_Range", "ada://subtype/The_Stack_Praxis-1:9/Index_Range+6:12")) :: (4, ("Pointer_Range", "ada://ordinary_type/The_Stack_Praxis-1:9/Pointer_Range+5:9")) :: (6, ("Vector", "ada://ordinary_type/The_Stack_Praxis-1:9/Vector+7:9")) :: nil)
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
(TypeDeclRT 4 (IntegerTypeDeclRT 5 ((*Pointer_Range*) 4) (RangeRT 0 100))) 
(SeqDeclRT 6
(TypeDeclRT 7 (SubtypeDeclRT 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (RangeRT 1 100))) 
(SeqDeclRT 9
(TypeDeclRT 10 (ArrayTypeDeclRT 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) 
(SeqDeclRT 12
(ObjDeclRT 13 (mkobjDeclRT 14 ((*S*) 7) (Array_Type ((*Vector*) 6)) None)) 
(SeqDeclRT 15
(ObjDeclRT 16 (mkobjDeclRT 17 ((*Pointer*) 8) (Integer_Type ((*Pointer_Range*) 4)) None)) 
(SeqDeclRT 18
(ProcBodyDeclRT 19 
  (mkprocBodyDeclRT 20
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 21 ((*X*) 9) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 22
      (AssignRT 23 (IdentifierRT 24 ((*Pointer*) 8) (nil)) (BinOpRT 25 Plus (NameRT 26 (IdentifierRT 27 ((*Pointer*) 8) (nil))) (LiteralRT 28 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
      (AssignRT 29 (IndexedComponentRT 30 (IdentifierRT 31 ((*S*) 7) (nil)) (NameRT 32 (IdentifierRT 33 ((*Pointer*) 8) (RangeCheck :: nil))) (nil)) (NameRT 34 (IdentifierRT 35 ((*X*) 9) (nil)))))
  )
) 
(ProcBodyDeclRT 36 
  (mkprocBodyDeclRT 37
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 38 ((*X*) 12) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 39
      (AssignRT 40 (IdentifierRT 41 ((*X*) 12) (nil)) (NameRT 42 (IndexedComponentRT 43 (IdentifierRT 44 ((*S*) 7) (nil)) (NameRT 45 (IdentifierRT 46 ((*Pointer*) 8) (RangeCheck :: nil))) (nil)))) 
      (AssignRT 47 (IdentifierRT 48 ((*Pointer*) 8) (nil)) (BinOpRT 49 Minus (NameRT 50 (IdentifierRT 51 ((*Pointer*) 8) (nil))) (LiteralRT 52 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)))
  )
))))))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Pointer*) 8), (In_Out, (Integer_Type ((*Pointer_Range*) 4)))) :: (((*S*) 7), (In_Out, (Array_Type ((*Vector*) 6)))) :: (((*X*) 9), (In, Integer)) :: (((*X*) 12), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocBodyDeclRT 20
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 21 ((*X*) 9) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 22
    (AssignRT 23 (IdentifierRT 24 ((*Pointer*) 8) (nil)) (BinOpRT 25 Plus (NameRT 26 (IdentifierRT 27 ((*Pointer*) 8) (nil))) (LiteralRT 28 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
    (AssignRT 29 (IndexedComponentRT 30 (IdentifierRT 31 ((*S*) 7) (nil)) (NameRT 32 (IdentifierRT 33 ((*Pointer*) 8) (RangeCheck :: nil))) (nil)) (NameRT 34 (IdentifierRT 35 ((*X*) 9) (nil)))))
))) :: (((*Pop*) 2), (0, (mkprocBodyDeclRT 37
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 38 ((*X*) 12) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 39
    (AssignRT 40 (IdentifierRT 41 ((*X*) 12) (nil)) (NameRT 42 (IndexedComponentRT 43 (IdentifierRT 44 ((*S*) 7) (nil)) (NameRT 45 (IdentifierRT 46 ((*Pointer*) 8) (RangeCheck :: nil))) (nil)))) 
    (AssignRT 47 (IdentifierRT 48 ((*Pointer*) 8) (nil)) (BinOpRT 49 Minus (NameRT 50 (IdentifierRT 51 ((*Pointer*) 8) (nil))) (LiteralRT 52 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Range*) 5), (SubtypeDeclRT 8 ((*Index_Range*) 5) (Integer_Type ((*Pointer_Range*) 4)) (RangeRT 1 100))) :: (((*Pointer_Range*) 4), (IntegerTypeDeclRT 5 ((*Pointer_Range*) 4) (RangeRT 0 100))) :: (((*Vector*) 6), (ArrayTypeDeclRT 11 ((*Vector*) 6) ((*index subtype mark*) (Subtype ((*Index_Range*) 5))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((50, (Integer_Type ((*Pointer_Range*) 4))) :: (32, (Integer_Type ((*Pointer_Range*) 4))) :: (41, Integer) :: (44, (Array_Type ((*Vector*) 6))) :: (26, (Integer_Type ((*Pointer_Range*) 4))) :: (35, Integer) :: (46, (Integer_Type ((*Pointer_Range*) 4))) :: (49, (Integer_Type ((*Pointer_Range*) 4))) :: (31, (Array_Type ((*Vector*) 6))) :: (52, Integer) :: (43, Integer) :: (25, (Integer_Type ((*Pointer_Range*) 4))) :: (34, Integer) :: (28, Integer) :: (45, (Integer_Type ((*Pointer_Range*) 4))) :: (27, (Integer_Type ((*Pointer_Range*) 4))) :: (48, (Integer_Type ((*Pointer_Range*) 4))) :: (30, Integer) :: (51, (Integer_Type ((*Pointer_Range*) 4))) :: (24, (Integer_Type ((*Pointer_Range*) 4))) :: (33, (Integer_Type ((*Pointer_Range*) 4))) :: (42, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((50, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (32, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (41, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)7)) :: (44, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)12)) :: (26, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (35, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (46, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (49, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)28)) :: (31, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)7)) :: (52, (sloc (*Line*)30 (*Col*)28 (*EndLine*)30 (*EndCol*)28)) :: (43, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: (25, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)28)) :: (34, (sloc (*Line*)18 (*Col*)21 (*EndLine*)18 (*EndCol*)21)) :: (28, (sloc (*Line*)17 (*Col*)28 (*EndLine*)17 (*EndCol*)28)) :: (45, (sloc (*Line*)29 (*Col*)14 (*EndLine*)29 (*EndCol*)20)) :: (27, (sloc (*Line*)17 (*Col*)18 (*EndLine*)17 (*EndCol*)24)) :: (48, (sloc (*Line*)30 (*Col*)7 (*EndLine*)30 (*EndCol*)13)) :: (30, (sloc (*Line*)18 (*Col*)7 (*EndLine*)18 (*EndCol*)16)) :: (51, (sloc (*Line*)30 (*Col*)18 (*EndLine*)30 (*EndCol*)24)) :: (24, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)13)) :: (33, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)15)) :: (42, (sloc (*Line*)29 (*Col*)12 (*EndLine*)29 (*EndCol*)21)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Pointer", "ada://variable/The_Stack_Praxis-1:9/Pointer+9:4")) :: (7, ("S", "ada://variable/The_Stack_Praxis-1:9/S+8:4")) :: (9, ("X", "ada://parameter/The_Stack_Praxis-1:9/Push-5:14/X-5:19")) :: (12, ("X", "ada://parameter/The_Stack_Praxis-1:9/Pop-9:14/X-9:18")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Pop", "ada://procedure_body/The_Stack_Praxis-1:9/Pop-9:14")) :: (1, ("Push", "ada://procedure_body/The_Stack_Praxis-1:9/Push-5:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("The_Stack_Praxis", "ada://package_body/The_Stack_Praxis-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((5, ("Index_Range", "ada://subtype/The_Stack_Praxis-1:9/Index_Range+6:12")) :: (4, ("Pointer_Range", "ada://ordinary_type/The_Stack_Praxis-1:9/Pointer_Range+5:9")) :: (6, ("Vector", "ada://ordinary_type/The_Stack_Praxis-1:9/Vector+7:9")) :: nil)
))
).

