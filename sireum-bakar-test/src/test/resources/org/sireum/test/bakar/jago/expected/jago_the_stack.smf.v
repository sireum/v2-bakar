Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
NullDecl (* Undefined Declarations ! *) 
NullDecl (* Undefined Declarations ! *)) 
(SeqDecl 3
(TypeDecl 4 (SubtypeDecl 5 ((*AuditCountType*) 4) Integer (Range 0 200))) 
(SeqDecl 6
(TypeDecl 7 (RecordTypeDecl 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) 
(SeqDecl 10
(TypeDecl 11 (IntegerTypeDecl 12 ((*Pointer_Range*) 8) (Range 0 100))) 
(SeqDecl 13
(TypeDecl 14 (SubtypeDecl 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (Range 1 100))) 
(SeqDecl 16
(TypeDecl 17 (ArrayTypeDecl 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) 
(SeqDecl 19
(ObjDecl 20 (mkobjDecl 21 ((*S*) 11) (Array_Type ((*Vector*) 10)) None)) 
(SeqDecl 22
(ObjDecl 23 (mkobjDecl 24 ((*Pointer*) 12) (Integer_Type ((*Pointer_Range*) 8)) None)) 
(SeqDecl 25
(ObjDecl 26 (mkobjDecl 27 ((*AuditInfo*) 13) (Record_Type ((*AuditInfoType*) 5)) None)) 
(SeqDecl 28
(ProcBodyDecl 29 
  (mkprocBodyDecl 30
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 31 ((*X*) 14) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 32
      (Assign 33 (Identifier 34 ((*Pointer*) 12) ) (BinOp 35 Plus (Name 36 (Identifier 37 ((*Pointer*) 12) )) (Literal 38 (Integer_Literal 1) ) )) 
      (Seq 39
      (Assign 40 (IndexedComponent 41 (Identifier 42 ((*S*) 11) ) (Name 43 (Identifier 44 ((*Pointer*) 12) )) ) (Name 45 (Identifier 46 ((*X*) 14) ))) 
      (Assign 47 (SelectedComponent 48 (Identifier 49 ((*AuditInfo*) 13) ) ((*PushOps*) 6) ) (BinOp 51 Plus (Name 52 (SelectedComponent 53 (Identifier 54 ((*AuditInfo*) 13) ) ((*PushOps*) 6) )) (Literal 56 (Integer_Literal 1) ) ))))
  )
) 
(ProcBodyDecl 57 
  (mkprocBodyDecl 58
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 59 ((*X*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 60
      (Assign 61 (Identifier 62 ((*X*) 17) ) (Name 63 (IndexedComponent 64 (Identifier 65 ((*S*) 11) ) (Name 66 (Identifier 67 ((*Pointer*) 12) )) ))) 
      (Seq 68
      (Assign 69 (Identifier 70 ((*Pointer*) 12) ) (BinOp 71 Minus (Name 72 (Identifier 73 ((*Pointer*) 12) )) (Literal 74 (Integer_Literal 1) ) )) 
      (Assign 75 (SelectedComponent 76 (Identifier 77 ((*AuditInfo*) 13) ) ((*PopOps*) 7) ) (BinOp 79 Plus (Name 80 (SelectedComponent 81 (Identifier 82 ((*AuditInfo*) 13) ) ((*PopOps*) 7) )) (Literal 84 (Integer_Literal 1) ) ))))
  )
)))))))))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 14), (In, Integer)) :: (((*Pointer*) 12), (In_Out, (Integer_Type ((*Pointer_Range*) 8)))) :: (((*AuditInfo*) 13), (In_Out, (Record_Type ((*AuditInfoType*) 5)))) :: (((*S*) 11), (In_Out, (Array_Type ((*Vector*) 10)))) :: (((*X*) 17), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocBodyDecl 30
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 31 ((*X*) 14) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 32
    (Assign 33 (Identifier 34 ((*Pointer*) 12) ) (BinOp 35 Plus (Name 36 (Identifier 37 ((*Pointer*) 12) )) (Literal 38 (Integer_Literal 1) ) )) 
    (Seq 39
    (Assign 40 (IndexedComponent 41 (Identifier 42 ((*S*) 11) ) (Name 43 (Identifier 44 ((*Pointer*) 12) )) ) (Name 45 (Identifier 46 ((*X*) 14) ))) 
    (Assign 47 (SelectedComponent 48 (Identifier 49 ((*AuditInfo*) 13) ) ((*PushOps*) 6) ) (BinOp 51 Plus (Name 52 (SelectedComponent 53 (Identifier 54 ((*AuditInfo*) 13) ) ((*PushOps*) 6) )) (Literal 56 (Integer_Literal 1) ) ))))
))) :: (((*Pop*) 2), (0, (mkprocBodyDecl 58
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 59 ((*X*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 60
    (Assign 61 (Identifier 62 ((*X*) 17) ) (Name 63 (IndexedComponent 64 (Identifier 65 ((*S*) 11) ) (Name 66 (Identifier 67 ((*Pointer*) 12) )) ))) 
    (Seq 68
    (Assign 69 (Identifier 70 ((*Pointer*) 12) ) (BinOp 71 Minus (Name 72 (Identifier 73 ((*Pointer*) 12) )) (Literal 74 (Integer_Literal 1) ) )) 
    (Assign 75 (SelectedComponent 76 (Identifier 77 ((*AuditInfo*) 13) ) ((*PopOps*) 7) ) (BinOp 79 Plus (Name 80 (SelectedComponent 81 (Identifier 82 ((*AuditInfo*) 13) ) ((*PopOps*) 7) )) (Literal 84 (Integer_Literal 1) ) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*AuditInfoType*) 5), (RecordTypeDecl 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) :: (((*Vector*) 10), (ArrayTypeDecl 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) :: (((*AuditCountType*) 4), (SubtypeDecl 5 ((*AuditCountType*) 4) Integer (Range 0 200))) :: (((*Index_Range*) 9), (SubtypeDecl 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (Range 1 100))) :: (((*Pointer_Range*) 8), (IntegerTypeDecl 12 ((*Pointer_Range*) 8) (Range 0 100))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((83, (Subtype ((*AuditCountType*) 4))) :: (77, (Record_Type ((*AuditInfoType*) 5))) :: (41, Integer) :: (50, (Subtype ((*AuditCountType*) 4))) :: (44, (Integer_Type ((*Pointer_Range*) 8))) :: (35, (Integer_Type ((*Pointer_Range*) 8))) :: (53, (Subtype ((*AuditCountType*) 4))) :: (62, Integer) :: (80, (Subtype ((*AuditCountType*) 4))) :: (71, (Integer_Type ((*Pointer_Range*) 8))) :: (74, Integer) :: (38, Integer) :: (56, Integer) :: (65, (Array_Type ((*Vector*) 10))) :: (46, Integer) :: (82, (Record_Type ((*AuditInfoType*) 5))) :: (73, (Integer_Type ((*Pointer_Range*) 8))) :: (55, (Subtype ((*AuditCountType*) 4))) :: (64, Integer) :: (67, (Integer_Type ((*Pointer_Range*) 8))) :: (49, (Record_Type ((*AuditInfoType*) 5))) :: (76, (Subtype ((*AuditCountType*) 4))) :: (79, Integer) :: (70, (Integer_Type ((*Pointer_Range*) 8))) :: (43, (Integer_Type ((*Pointer_Range*) 8))) :: (52, (Subtype ((*AuditCountType*) 4))) :: (34, (Integer_Type ((*Pointer_Range*) 8))) :: (37, (Integer_Type ((*Pointer_Range*) 8))) :: (78, (Subtype ((*AuditCountType*) 4))) :: (45, Integer) :: (54, (Record_Type ((*AuditInfoType*) 5))) :: (63, Integer) :: (81, (Subtype ((*AuditCountType*) 4))) :: (72, (Integer_Type ((*Pointer_Range*) 8))) :: (36, (Integer_Type ((*Pointer_Range*) 8))) :: (84, Integer) :: (48, (Subtype ((*AuditCountType*) 4))) :: (66, (Integer_Type ((*Pointer_Range*) 8))) :: (42, (Array_Type ((*Vector*) 10))) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((83, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)42)) :: (77, (sloc (*Line*)37 (*Col*)7 (*EndLine*)37 (*EndCol*)15)) :: (41, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)16)) :: (50, (sloc (*Line*)29 (*Col*)17 (*EndLine*)29 (*EndCol*)23)) :: (44, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)15)) :: (35, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)28)) :: (53, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)44)) :: (62, (sloc (*Line*)35 (*Col*)7 (*EndLine*)35 (*EndCol*)7)) :: (80, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)42)) :: (71, (sloc (*Line*)36 (*Col*)18 (*EndLine*)36 (*EndCol*)28)) :: (74, (sloc (*Line*)36 (*Col*)28 (*EndLine*)36 (*EndCol*)28)) :: (38, (sloc (*Line*)27 (*Col*)28 (*EndLine*)27 (*EndCol*)28)) :: (56, (sloc (*Line*)29 (*Col*)48 (*EndLine*)29 (*EndCol*)48)) :: (65, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)12)) :: (46, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (82, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)35)) :: (73, (sloc (*Line*)36 (*Col*)18 (*EndLine*)36 (*EndCol*)24)) :: (55, (sloc (*Line*)29 (*Col*)38 (*EndLine*)29 (*EndCol*)44)) :: (64, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)21)) :: (67, (sloc (*Line*)35 (*Col*)14 (*EndLine*)35 (*EndCol*)20)) :: (49, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)15)) :: (76, (sloc (*Line*)37 (*Col*)7 (*EndLine*)37 (*EndCol*)22)) :: (79, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)46)) :: (70, (sloc (*Line*)36 (*Col*)7 (*EndLine*)36 (*EndCol*)13)) :: (43, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)15)) :: (52, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)44)) :: (34, (sloc (*Line*)27 (*Col*)7 (*EndLine*)27 (*EndCol*)13)) :: (37, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)24)) :: (78, (sloc (*Line*)37 (*Col*)17 (*EndLine*)37 (*EndCol*)22)) :: (45, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (54, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)36)) :: (63, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)21)) :: (81, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)42)) :: (72, (sloc (*Line*)36 (*Col*)18 (*EndLine*)36 (*EndCol*)24)) :: (36, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)24)) :: (84, (sloc (*Line*)37 (*Col*)46 (*EndLine*)37 (*EndCol*)46)) :: (48, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)23)) :: (66, (sloc (*Line*)35 (*Col*)14 (*EndLine*)35 (*EndCol*)20)) :: (42, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (51, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)48)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("X", "ada://parameter/The_Stack-1:9/Pop-5:14/X-5:18")) :: (11, ("S", "ada://variable/The_Stack-1:9/S+19:4")) :: (14, ("X", "ada://parameter/The_Stack-1:9/Push-3:14/X-3:19")) :: (13, ("AuditInfo", "ada://variable/The_Stack-1:9/AuditInfo+22:4")) :: (7, ("PopOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PopOps+13:7")) :: (12, ("Pointer", "ada://variable/The_Stack-1:9/Pointer+20:4")) :: (6, ("PushOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PushOps+12:7")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Pop", "ada://procedure_body/The_Stack-1:9/Pop-5:14")) :: (1, ("Push", "ada://procedure_body/The_Stack-1:9/Push-3:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("The_Stack", "ada://package_body/The_Stack-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((8, ("Pointer_Range", "ada://ordinary_type/The_Stack-1:9/Pointer_Range+16:9")) :: (5, ("AuditInfoType", "ada://ordinary_type/The_Stack-1:9/AuditInfoType+11:9")) :: (4, ("AuditCountType", "ada://subtype/The_Stack-1:9/AuditCountType+6:12")) :: (10, ("Vector", "ada://ordinary_type/The_Stack-1:9/Vector+18:9")) :: (9, ("Index_Range", "ada://subtype/The_Stack-1:9/Index_Range+17:12")) :: nil)
))
).

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
NullDeclRT (* Undefined Declarations ! *) 
NullDeclRT (* Undefined Declarations ! *)) 
(SeqDeclRT 3
(TypeDeclRT 4 (SubtypeDeclRT 5 ((*AuditCountType*) 4) Integer (RangeRT 0 200))) 
(SeqDeclRT 6
(TypeDeclRT 7 (RecordTypeDeclRT 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) 
(SeqDeclRT 10
(TypeDeclRT 11 (IntegerTypeDeclRT 12 ((*Pointer_Range*) 8) (RangeRT 0 100))) 
(SeqDeclRT 13
(TypeDeclRT 14 (SubtypeDeclRT 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (RangeRT 1 100))) 
(SeqDeclRT 16
(TypeDeclRT 17 (ArrayTypeDeclRT 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) 
(SeqDeclRT 19
(ObjDeclRT 20 (mkobjDeclRT 21 ((*S*) 11) (Array_Type ((*Vector*) 10)) None)) 
(SeqDeclRT 22
(ObjDeclRT 23 (mkobjDeclRT 24 ((*Pointer*) 12) (Integer_Type ((*Pointer_Range*) 8)) None)) 
(SeqDeclRT 25
(ObjDeclRT 26 (mkobjDeclRT 27 ((*AuditInfo*) 13) (Record_Type ((*AuditInfoType*) 5)) None)) 
(SeqDeclRT 28
(ProcBodyDeclRT 29 
  (mkprocBodyDeclRT 30
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 31 ((*X*) 14) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 32
      (AssignRT 33 (IdentifierRT 34 ((*Pointer*) 12) (nil)) (BinOpRT 35 Plus (NameRT 36 (IdentifierRT 37 ((*Pointer*) 12) (nil))) (LiteralRT 38 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
      (SeqRT 39
      (AssignRT 40 (IndexedComponentRT 41 (IdentifierRT 42 ((*S*) 11) (nil)) (NameRT 43 (IdentifierRT 44 ((*Pointer*) 12) (RangeCheck :: nil))) (nil)) (NameRT 45 (IdentifierRT 46 ((*X*) 14) (nil)))) 
      (AssignRT 47 (SelectedComponentRT 48 (IdentifierRT 49 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil)) (BinOpRT 51 Plus (NameRT 52 (SelectedComponentRT 53 (IdentifierRT 54 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil))) (LiteralRT 56 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
  )
) 
(ProcBodyDeclRT 57 
  (mkprocBodyDeclRT 58
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 59 ((*X*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 60
      (AssignRT 61 (IdentifierRT 62 ((*X*) 17) (nil)) (NameRT 63 (IndexedComponentRT 64 (IdentifierRT 65 ((*S*) 11) (nil)) (NameRT 66 (IdentifierRT 67 ((*Pointer*) 12) (RangeCheck :: nil))) (nil)))) 
      (SeqRT 68
      (AssignRT 69 (IdentifierRT 70 ((*Pointer*) 12) (nil)) (BinOpRT 71 Minus (NameRT 72 (IdentifierRT 73 ((*Pointer*) 12) (nil))) (LiteralRT 74 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
      (AssignRT 75 (SelectedComponentRT 76 (IdentifierRT 77 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil)) (BinOpRT 79 Plus (NameRT 80 (SelectedComponentRT 81 (IdentifierRT 82 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil))) (LiteralRT 84 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
  )
)))))))))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 14), (In, Integer)) :: (((*Pointer*) 12), (In_Out, (Integer_Type ((*Pointer_Range*) 8)))) :: (((*AuditInfo*) 13), (In_Out, (Record_Type ((*AuditInfoType*) 5)))) :: (((*S*) 11), (In_Out, (Array_Type ((*Vector*) 10)))) :: (((*X*) 17), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocBodyDeclRT 30
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 31 ((*X*) 14) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 32
    (AssignRT 33 (IdentifierRT 34 ((*Pointer*) 12) (nil)) (BinOpRT 35 Plus (NameRT 36 (IdentifierRT 37 ((*Pointer*) 12) (nil))) (LiteralRT 38 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
    (SeqRT 39
    (AssignRT 40 (IndexedComponentRT 41 (IdentifierRT 42 ((*S*) 11) (nil)) (NameRT 43 (IdentifierRT 44 ((*Pointer*) 12) (RangeCheck :: nil))) (nil)) (NameRT 45 (IdentifierRT 46 ((*X*) 14) (nil)))) 
    (AssignRT 47 (SelectedComponentRT 48 (IdentifierRT 49 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil)) (BinOpRT 51 Plus (NameRT 52 (SelectedComponentRT 53 (IdentifierRT 54 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil))) (LiteralRT 56 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
))) :: (((*Pop*) 2), (0, (mkprocBodyDeclRT 58
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 59 ((*X*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 60
    (AssignRT 61 (IdentifierRT 62 ((*X*) 17) (nil)) (NameRT 63 (IndexedComponentRT 64 (IdentifierRT 65 ((*S*) 11) (nil)) (NameRT 66 (IdentifierRT 67 ((*Pointer*) 12) (RangeCheck :: nil))) (nil)))) 
    (SeqRT 68
    (AssignRT 69 (IdentifierRT 70 ((*Pointer*) 12) (nil)) (BinOpRT 71 Minus (NameRT 72 (IdentifierRT 73 ((*Pointer*) 12) (nil))) (LiteralRT 74 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
    (AssignRT 75 (SelectedComponentRT 76 (IdentifierRT 77 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil)) (BinOpRT 79 Plus (NameRT 80 (SelectedComponentRT 81 (IdentifierRT 82 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil))) (LiteralRT 84 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*AuditInfoType*) 5), (RecordTypeDeclRT 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) :: (((*Vector*) 10), (ArrayTypeDeclRT 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) :: (((*AuditCountType*) 4), (SubtypeDeclRT 5 ((*AuditCountType*) 4) Integer (RangeRT 0 200))) :: (((*Index_Range*) 9), (SubtypeDeclRT 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (RangeRT 1 100))) :: (((*Pointer_Range*) 8), (IntegerTypeDeclRT 12 ((*Pointer_Range*) 8) (RangeRT 0 100))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((83, (Subtype ((*AuditCountType*) 4))) :: (77, (Record_Type ((*AuditInfoType*) 5))) :: (41, Integer) :: (50, (Subtype ((*AuditCountType*) 4))) :: (44, (Integer_Type ((*Pointer_Range*) 8))) :: (35, (Integer_Type ((*Pointer_Range*) 8))) :: (53, (Subtype ((*AuditCountType*) 4))) :: (62, Integer) :: (80, (Subtype ((*AuditCountType*) 4))) :: (71, (Integer_Type ((*Pointer_Range*) 8))) :: (74, Integer) :: (38, Integer) :: (56, Integer) :: (65, (Array_Type ((*Vector*) 10))) :: (46, Integer) :: (82, (Record_Type ((*AuditInfoType*) 5))) :: (73, (Integer_Type ((*Pointer_Range*) 8))) :: (55, (Subtype ((*AuditCountType*) 4))) :: (64, Integer) :: (67, (Integer_Type ((*Pointer_Range*) 8))) :: (49, (Record_Type ((*AuditInfoType*) 5))) :: (76, (Subtype ((*AuditCountType*) 4))) :: (79, Integer) :: (70, (Integer_Type ((*Pointer_Range*) 8))) :: (43, (Integer_Type ((*Pointer_Range*) 8))) :: (52, (Subtype ((*AuditCountType*) 4))) :: (34, (Integer_Type ((*Pointer_Range*) 8))) :: (37, (Integer_Type ((*Pointer_Range*) 8))) :: (78, (Subtype ((*AuditCountType*) 4))) :: (45, Integer) :: (54, (Record_Type ((*AuditInfoType*) 5))) :: (63, Integer) :: (81, (Subtype ((*AuditCountType*) 4))) :: (72, (Integer_Type ((*Pointer_Range*) 8))) :: (36, (Integer_Type ((*Pointer_Range*) 8))) :: (84, Integer) :: (48, (Subtype ((*AuditCountType*) 4))) :: (66, (Integer_Type ((*Pointer_Range*) 8))) :: (42, (Array_Type ((*Vector*) 10))) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((83, (sloc (*Line*)37 (*Col*)37 (*EndLine*)37 (*EndCol*)42)) :: (77, (sloc (*Line*)37 (*Col*)7 (*EndLine*)37 (*EndCol*)15)) :: (41, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)16)) :: (50, (sloc (*Line*)29 (*Col*)17 (*EndLine*)29 (*EndCol*)23)) :: (44, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)15)) :: (35, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)28)) :: (53, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)44)) :: (62, (sloc (*Line*)35 (*Col*)7 (*EndLine*)35 (*EndCol*)7)) :: (80, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)42)) :: (71, (sloc (*Line*)36 (*Col*)18 (*EndLine*)36 (*EndCol*)28)) :: (74, (sloc (*Line*)36 (*Col*)28 (*EndLine*)36 (*EndCol*)28)) :: (38, (sloc (*Line*)27 (*Col*)28 (*EndLine*)27 (*EndCol*)28)) :: (56, (sloc (*Line*)29 (*Col*)48 (*EndLine*)29 (*EndCol*)48)) :: (65, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)12)) :: (46, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (82, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)35)) :: (73, (sloc (*Line*)36 (*Col*)18 (*EndLine*)36 (*EndCol*)24)) :: (55, (sloc (*Line*)29 (*Col*)38 (*EndLine*)29 (*EndCol*)44)) :: (64, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)21)) :: (67, (sloc (*Line*)35 (*Col*)14 (*EndLine*)35 (*EndCol*)20)) :: (49, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)15)) :: (76, (sloc (*Line*)37 (*Col*)7 (*EndLine*)37 (*EndCol*)22)) :: (79, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)46)) :: (70, (sloc (*Line*)36 (*Col*)7 (*EndLine*)36 (*EndCol*)13)) :: (43, (sloc (*Line*)28 (*Col*)9 (*EndLine*)28 (*EndCol*)15)) :: (52, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)44)) :: (34, (sloc (*Line*)27 (*Col*)7 (*EndLine*)27 (*EndCol*)13)) :: (37, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)24)) :: (78, (sloc (*Line*)37 (*Col*)17 (*EndLine*)37 (*EndCol*)22)) :: (45, (sloc (*Line*)28 (*Col*)21 (*EndLine*)28 (*EndCol*)21)) :: (54, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)36)) :: (63, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)21)) :: (81, (sloc (*Line*)37 (*Col*)27 (*EndLine*)37 (*EndCol*)42)) :: (72, (sloc (*Line*)36 (*Col*)18 (*EndLine*)36 (*EndCol*)24)) :: (36, (sloc (*Line*)27 (*Col*)18 (*EndLine*)27 (*EndCol*)24)) :: (84, (sloc (*Line*)37 (*Col*)46 (*EndLine*)37 (*EndCol*)46)) :: (48, (sloc (*Line*)29 (*Col*)7 (*EndLine*)29 (*EndCol*)23)) :: (66, (sloc (*Line*)35 (*Col*)14 (*EndLine*)35 (*EndCol*)20)) :: (42, (sloc (*Line*)28 (*Col*)7 (*EndLine*)28 (*EndCol*)7)) :: (51, (sloc (*Line*)29 (*Col*)28 (*EndLine*)29 (*EndCol*)48)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("X", "ada://parameter/The_Stack-1:9/Pop-5:14/X-5:18")) :: (11, ("S", "ada://variable/The_Stack-1:9/S+19:4")) :: (14, ("X", "ada://parameter/The_Stack-1:9/Push-3:14/X-3:19")) :: (13, ("AuditInfo", "ada://variable/The_Stack-1:9/AuditInfo+22:4")) :: (7, ("PopOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PopOps+13:7")) :: (12, ("Pointer", "ada://variable/The_Stack-1:9/Pointer+20:4")) :: (6, ("PushOps", "ada://component/The_Stack-1:9/AuditInfoType+11:9/PushOps+12:7")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("Pop", "ada://procedure_body/The_Stack-1:9/Pop-5:14")) :: (1, ("Push", "ada://procedure_body/The_Stack-1:9/Push-3:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("The_Stack", "ada://package_body/The_Stack-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((8, ("Pointer_Range", "ada://ordinary_type/The_Stack-1:9/Pointer_Range+16:9")) :: (5, ("AuditInfoType", "ada://ordinary_type/The_Stack-1:9/AuditInfoType+11:9")) :: (4, ("AuditCountType", "ada://subtype/The_Stack-1:9/AuditCountType+6:12")) :: (10, ("Vector", "ada://ordinary_type/The_Stack-1:9/Vector+18:9")) :: (9, ("Index_Range", "ada://subtype/The_Stack-1:9/Index_Range+17:12")) :: nil)
))
).

