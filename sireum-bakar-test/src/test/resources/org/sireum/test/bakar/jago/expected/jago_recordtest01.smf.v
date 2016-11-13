Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (RecordTypeDecl 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) 
(SeqDecl 6
(TypeDecl 7 (RecordTypeDecl 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) 
(SeqDecl 10
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 11
(ObjDecl 12 (mkobjDecl 13 ((*aNestedObject*) 7) (Record_Type ((*NestedObject*) 4)) None)) 
(ObjDecl 14 (mkobjDecl 15 ((*anObject*) 8) (Record_Type ((*Object*) 1)) None)))))) 
(SeqDecl 16
(ProcBodyDecl 17 
  (mkprocBodyDecl 18
    (* = = = Procedure Name = = = *)
    ((*Test01*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 20 (mkobjDecl 21 ((*T*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (Seq 22
      (Assign 23 (Identifier 24 ((*T*) 11) ) (Name 25 (SelectedComponent 26 (Identifier 27 ((*Q*) 10) ) ((*X*) 2) ))) 
      (Seq 29
      (Assign 30 (SelectedComponent 31 (Identifier 32 ((*Q*) 10) ) ((*X*) 2) ) (Name 34 (SelectedComponent 35 (Identifier 36 ((*Q*) 10) ) ((*Y*) 3) ))) 
      (Assign 38 (SelectedComponent 39 (Identifier 40 ((*Q*) 10) ) ((*Y*) 3) ) (Name 42 (Identifier 43 ((*T*) 11) )))))
  )
) 
(ProcBodyDecl 44 
  (mkprocBodyDecl 45
    (* = = = Procedure Name = = = *)
    ((*Test02*) 13)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 46 ((*I1*) 14) Integer In) :: (mkparamSpec 47 ((*I2*) 15) Integer In) :: 
    (mkparamSpec 48 ((*O1*) 16) Integer Out) :: (mkparamSpec 49 ((*O2*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDecl 50 (mkobjDecl 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
    (* = = = Procedure Body = = = *)
      (Seq 52
      (Assign 53 (SelectedComponent 54 (SelectedComponent 55 (Identifier 56 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ) (Name 59 (Identifier 60 ((*I1*) 14) ))) 
      (Seq 61
      (Assign 62 (SelectedComponent 63 (SelectedComponent 64 (Identifier 65 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ) (Name 68 (Identifier 69 ((*I2*) 15) ))) 
      (Seq 70
      (Assign 71 (Identifier 72 ((*O1*) 16) ) (Name 73 (SelectedComponent 74 (SelectedComponent 75 (Identifier 76 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ))) 
      (Assign 79 (Identifier 80 ((*O2*) 17) ) (Name 81 (SelectedComponent 82 (SelectedComponent 83 (Identifier 84 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ))))))
  )
)))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I2*) 15), (In, Integer)) :: (((*T*) 11), (In_Out, Integer)) :: (((*anObject*) 8), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 10), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 18), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: (((*O1*) 16), (Out, Integer)) :: (((*I1*) 14), (In, Integer)) :: (((*O2*) 17), (Out, Integer)) :: (((*aNestedObject*) 7), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test01*) 6), (0, (mkprocBodyDecl 18
  (* = = = Procedure Name = = = *)
  ((*Test01*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 20 (mkobjDecl 21 ((*T*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (Seq 22
    (Assign 23 (Identifier 24 ((*T*) 11) ) (Name 25 (SelectedComponent 26 (Identifier 27 ((*Q*) 10) ) ((*X*) 2) ))) 
    (Seq 29
    (Assign 30 (SelectedComponent 31 (Identifier 32 ((*Q*) 10) ) ((*X*) 2) ) (Name 34 (SelectedComponent 35 (Identifier 36 ((*Q*) 10) ) ((*Y*) 3) ))) 
    (Assign 38 (SelectedComponent 39 (Identifier 40 ((*Q*) 10) ) ((*Y*) 3) ) (Name 42 (Identifier 43 ((*T*) 11) )))))
))) :: (((*Test02*) 13), (0, (mkprocBodyDecl 45
  (* = = = Procedure Name = = = *)
  ((*Test02*) 13)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 46 ((*I1*) 14) Integer In) :: (mkparamSpec 47 ((*I2*) 15) Integer In) :: 
  (mkparamSpec 48 ((*O1*) 16) Integer Out) :: (mkparamSpec 49 ((*O2*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDecl 50 (mkobjDecl 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
  (* = = = Procedure Body = = = *)
    (Seq 52
    (Assign 53 (SelectedComponent 54 (SelectedComponent 55 (Identifier 56 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ) (Name 59 (Identifier 60 ((*I1*) 14) ))) 
    (Seq 61
    (Assign 62 (SelectedComponent 63 (SelectedComponent 64 (Identifier 65 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ) (Name 68 (Identifier 69 ((*I2*) 15) ))) 
    (Seq 70
    (Assign 71 (Identifier 72 ((*O1*) 16) ) (Name 73 (SelectedComponent 74 (SelectedComponent 75 (Identifier 76 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ))) 
    (Assign 79 (Identifier 80 ((*O2*) 17) ) (Name 81 (SelectedComponent 82 (SelectedComponent 83 (Identifier 84 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*NestedObject*) 4), (RecordTypeDecl 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) :: (((*Object*) 1), (RecordTypeDecl 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((83, (Record_Type ((*Object*) 1))) :: (86, Integer) :: (77, (Record_Type ((*Object*) 1))) :: (68, Integer) :: (32, (Record_Type ((*Object*) 1))) :: (41, Integer) :: (59, Integer) :: (35, Integer) :: (80, Integer) :: (26, Integer) :: (74, Integer) :: (56, (Record_Type ((*NestedObject*) 4))) :: (65, (Record_Type ((*NestedObject*) 4))) :: (82, Integer) :: (73, Integer) :: (64, (Record_Type ((*Object*) 1))) :: (55, (Record_Type ((*Object*) 1))) :: (85, (Record_Type ((*Object*) 1))) :: (67, Integer) :: (40, (Record_Type ((*Object*) 1))) :: (58, Integer) :: (76, (Record_Type ((*NestedObject*) 4))) :: (31, Integer) :: (43, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (28, Integer) :: (60, Integer) :: (78, Integer) :: (69, Integer) :: (54, Integer) :: (63, Integer) :: (81, Integer) :: (72, Integer) :: (36, (Record_Type ((*Object*) 1))) :: (27, (Record_Type ((*Object*) 1))) :: (84, (Record_Type ((*NestedObject*) 4))) :: (57, (Record_Type ((*Object*) 1))) :: (75, (Record_Type ((*Object*) 1))) :: (39, Integer) :: (66, (Record_Type ((*Object*) 1))) :: (42, Integer) :: (33, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((83, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)13)) :: (86, (sloc (*Line*)22 (*Col*)15 (*EndLine*)22 (*EndCol*)15)) :: (77, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)13)) :: (68, (sloc (*Line*)20 (*Col*)14 (*EndLine*)20 (*EndCol*)15)) :: (32, (sloc (*Line*)9 (*Col*)5 (*EndLine*)9 (*EndCol*)5)) :: (41, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (59, (sloc (*Line*)19 (*Col*)14 (*EndLine*)19 (*EndCol*)15)) :: (35, (sloc (*Line*)9 (*Col*)12 (*EndLine*)9 (*EndCol*)14)) :: (80, (sloc (*Line*)22 (*Col*)5 (*EndLine*)22 (*EndCol*)6)) :: (26, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)12)) :: (74, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)15)) :: (56, (sloc (*Line*)19 (*Col*)5 (*EndLine*)19 (*EndCol*)5)) :: (65, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)5)) :: (82, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)15)) :: (73, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)15)) :: (64, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)7)) :: (55, (sloc (*Line*)19 (*Col*)5 (*EndLine*)19 (*EndCol*)7)) :: (85, (sloc (*Line*)22 (*Col*)13 (*EndLine*)22 (*EndCol*)13)) :: (67, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)9)) :: (40, (sloc (*Line*)10 (*Col*)5 (*EndLine*)10 (*EndCol*)5)) :: (58, (sloc (*Line*)19 (*Col*)9 (*EndLine*)19 (*EndCol*)9)) :: (76, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)11)) :: (31, (sloc (*Line*)9 (*Col*)5 (*EndLine*)9 (*EndCol*)7)) :: (43, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (34, (sloc (*Line*)9 (*Col*)12 (*EndLine*)9 (*EndCol*)14)) :: (25, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)12)) :: (37, (sloc (*Line*)9 (*Col*)14 (*EndLine*)9 (*EndCol*)14)) :: (28, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (60, (sloc (*Line*)19 (*Col*)14 (*EndLine*)19 (*EndCol*)15)) :: (78, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (69, (sloc (*Line*)20 (*Col*)14 (*EndLine*)20 (*EndCol*)15)) :: (54, (sloc (*Line*)19 (*Col*)5 (*EndLine*)19 (*EndCol*)9)) :: (63, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)9)) :: (81, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)15)) :: (72, (sloc (*Line*)21 (*Col*)5 (*EndLine*)21 (*EndCol*)6)) :: (36, (sloc (*Line*)9 (*Col*)12 (*EndLine*)9 (*EndCol*)12)) :: (27, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (84, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)11)) :: (57, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)7)) :: (75, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)13)) :: (39, (sloc (*Line*)10 (*Col*)5 (*EndLine*)10 (*EndCol*)7)) :: (66, (sloc (*Line*)20 (*Col*)7 (*EndLine*)20 (*EndCol*)7)) :: (42, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (33, (sloc (*Line*)9 (*Col*)7 (*EndLine*)9 (*EndCol*)7)) :: (24, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)5)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("O2", "ada://parameter/RecordTest01-1:9/Test02+13:13/O2+13:45")) :: (8, ("anObject", "ada://variable/RecordTest01-1:9/anObject-21:3")) :: (11, ("T", "ada://variable/RecordTest01-1:9/Test01-16:13/T+6:5")) :: (2, ("X", "ada://component/RecordTest01-1:9/Object-6:8/X-8:5")) :: (14, ("I1", "ada://parameter/RecordTest01-1:9/Test02+13:13/I1+13:20")) :: (5, ("O", "ada://component/RecordTest01-1:9/NestedObject-11:8/O-13:5")) :: (16, ("O1", "ada://parameter/RecordTest01-1:9/Test02+13:13/O1+13:41")) :: (7, ("aNestedObject", "ada://variable/RecordTest01-1:9/aNestedObject-19:3")) :: (10, ("Q", "ada://parameter/RecordTest01-1:9/Test01-16:13/Q-16:20")) :: (18, ("Q", "ada://variable/RecordTest01-1:9/Test02+13:13/Q+17:5")) :: (3, ("Y", "ada://component/RecordTest01-1:9/Object-6:8/Y-8:8")) :: (15, ("I2", "ada://parameter/RecordTest01-1:9/Test02+13:13/I2+13:24")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((13, ("Test02", "ada://procedure_body/RecordTest01-1:9/Test02+13:13")) :: (6, ("Test01", "ada://procedure_body/RecordTest01-1:9/Test01-16:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((9, ("RecordTest01", "ada://package_body/RecordTest01-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("NestedObject", "ada://ordinary_type/RecordTest01-1:9/NestedObject-11:8")) :: (1, ("Object", "ada://ordinary_type/RecordTest01-1:9/Object-6:8")) :: nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (RecordTypeDeclRT 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) 
(SeqDeclRT 6
(TypeDeclRT 7 (RecordTypeDeclRT 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) 
(SeqDeclRT 10
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 11
(ObjDeclRT 12 (mkobjDeclRT 13 ((*aNestedObject*) 7) (Record_Type ((*NestedObject*) 4)) None)) 
(ObjDeclRT 14 (mkobjDeclRT 15 ((*anObject*) 8) (Record_Type ((*Object*) 1)) None)))))) 
(SeqDeclRT 16
(ProcBodyDeclRT 17 
  (mkprocBodyDeclRT 18
    (* = = = Procedure Name = = = *)
    ((*Test01*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 20 (mkobjDeclRT 21 ((*T*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 22
      (AssignRT 23 (IdentifierRT 24 ((*T*) 11) (nil)) (NameRT 25 (SelectedComponentRT 26 (IdentifierRT 27 ((*Q*) 10) (nil)) ((*X*) 2) (nil)))) 
      (SeqRT 29
      (AssignRT 30 (SelectedComponentRT 31 (IdentifierRT 32 ((*Q*) 10) (nil)) ((*X*) 2) (nil)) (NameRT 34 (SelectedComponentRT 35 (IdentifierRT 36 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)))) 
      (AssignRT 38 (SelectedComponentRT 39 (IdentifierRT 40 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)) (NameRT 42 (IdentifierRT 43 ((*T*) 11) (nil))))))
  )
) 
(ProcBodyDeclRT 44 
  (mkprocBodyDeclRT 45
    (* = = = Procedure Name = = = *)
    ((*Test02*) 13)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 46 ((*I1*) 14) Integer In) :: (mkparamSpecRT 47 ((*I2*) 15) Integer In) :: 
    (mkparamSpecRT 48 ((*O1*) 16) Integer Out) :: (mkparamSpecRT 49 ((*O2*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((ObjDeclRT 50 (mkobjDeclRT 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
    (* = = = Procedure Body = = = *)
      (SeqRT 52
      (AssignRT 53 (SelectedComponentRT 54 (SelectedComponentRT 55 (IdentifierRT 56 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)) (NameRT 59 (IdentifierRT 60 ((*I1*) 14) (nil)))) 
      (SeqRT 61
      (AssignRT 62 (SelectedComponentRT 63 (SelectedComponentRT 64 (IdentifierRT 65 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)) (NameRT 68 (IdentifierRT 69 ((*I2*) 15) (nil)))) 
      (SeqRT 70
      (AssignRT 71 (IdentifierRT 72 ((*O1*) 16) (nil)) (NameRT 73 (SelectedComponentRT 74 (SelectedComponentRT 75 (IdentifierRT 76 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)))) 
      (AssignRT 79 (IdentifierRT 80 ((*O2*) 17) (nil)) (NameRT 81 (SelectedComponentRT 82 (SelectedComponentRT 83 (IdentifierRT 84 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)))))))
  )
)))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I2*) 15), (In, Integer)) :: (((*T*) 11), (In_Out, Integer)) :: (((*anObject*) 8), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 10), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 18), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: (((*O1*) 16), (Out, Integer)) :: (((*I1*) 14), (In, Integer)) :: (((*O2*) 17), (Out, Integer)) :: (((*aNestedObject*) 7), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test01*) 6), (0, (mkprocBodyDeclRT 18
  (* = = = Procedure Name = = = *)
  ((*Test01*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 20 (mkobjDeclRT 21 ((*T*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 22
    (AssignRT 23 (IdentifierRT 24 ((*T*) 11) (nil)) (NameRT 25 (SelectedComponentRT 26 (IdentifierRT 27 ((*Q*) 10) (nil)) ((*X*) 2) (nil)))) 
    (SeqRT 29
    (AssignRT 30 (SelectedComponentRT 31 (IdentifierRT 32 ((*Q*) 10) (nil)) ((*X*) 2) (nil)) (NameRT 34 (SelectedComponentRT 35 (IdentifierRT 36 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)))) 
    (AssignRT 38 (SelectedComponentRT 39 (IdentifierRT 40 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)) (NameRT 42 (IdentifierRT 43 ((*T*) 11) (nil))))))
))) :: (((*Test02*) 13), (0, (mkprocBodyDeclRT 45
  (* = = = Procedure Name = = = *)
  ((*Test02*) 13)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 46 ((*I1*) 14) Integer In) :: (mkparamSpecRT 47 ((*I2*) 15) Integer In) :: 
  (mkparamSpecRT 48 ((*O1*) 16) Integer Out) :: (mkparamSpecRT 49 ((*O2*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((ObjDeclRT 50 (mkobjDeclRT 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
  (* = = = Procedure Body = = = *)
    (SeqRT 52
    (AssignRT 53 (SelectedComponentRT 54 (SelectedComponentRT 55 (IdentifierRT 56 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)) (NameRT 59 (IdentifierRT 60 ((*I1*) 14) (nil)))) 
    (SeqRT 61
    (AssignRT 62 (SelectedComponentRT 63 (SelectedComponentRT 64 (IdentifierRT 65 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)) (NameRT 68 (IdentifierRT 69 ((*I2*) 15) (nil)))) 
    (SeqRT 70
    (AssignRT 71 (IdentifierRT 72 ((*O1*) 16) (nil)) (NameRT 73 (SelectedComponentRT 74 (SelectedComponentRT 75 (IdentifierRT 76 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)))) 
    (AssignRT 79 (IdentifierRT 80 ((*O2*) 17) (nil)) (NameRT 81 (SelectedComponentRT 82 (SelectedComponentRT 83 (IdentifierRT 84 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*NestedObject*) 4), (RecordTypeDeclRT 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) :: (((*Object*) 1), (RecordTypeDeclRT 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((83, (Record_Type ((*Object*) 1))) :: (86, Integer) :: (77, (Record_Type ((*Object*) 1))) :: (68, Integer) :: (32, (Record_Type ((*Object*) 1))) :: (41, Integer) :: (59, Integer) :: (35, Integer) :: (80, Integer) :: (26, Integer) :: (74, Integer) :: (56, (Record_Type ((*NestedObject*) 4))) :: (65, (Record_Type ((*NestedObject*) 4))) :: (82, Integer) :: (73, Integer) :: (64, (Record_Type ((*Object*) 1))) :: (55, (Record_Type ((*Object*) 1))) :: (85, (Record_Type ((*Object*) 1))) :: (67, Integer) :: (40, (Record_Type ((*Object*) 1))) :: (58, Integer) :: (76, (Record_Type ((*NestedObject*) 4))) :: (31, Integer) :: (43, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (28, Integer) :: (60, Integer) :: (78, Integer) :: (69, Integer) :: (54, Integer) :: (63, Integer) :: (81, Integer) :: (72, Integer) :: (36, (Record_Type ((*Object*) 1))) :: (27, (Record_Type ((*Object*) 1))) :: (84, (Record_Type ((*NestedObject*) 4))) :: (57, (Record_Type ((*Object*) 1))) :: (75, (Record_Type ((*Object*) 1))) :: (39, Integer) :: (66, (Record_Type ((*Object*) 1))) :: (42, Integer) :: (33, Integer) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((83, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)13)) :: (86, (sloc (*Line*)22 (*Col*)15 (*EndLine*)22 (*EndCol*)15)) :: (77, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)13)) :: (68, (sloc (*Line*)20 (*Col*)14 (*EndLine*)20 (*EndCol*)15)) :: (32, (sloc (*Line*)9 (*Col*)5 (*EndLine*)9 (*EndCol*)5)) :: (41, (sloc (*Line*)10 (*Col*)7 (*EndLine*)10 (*EndCol*)7)) :: (59, (sloc (*Line*)19 (*Col*)14 (*EndLine*)19 (*EndCol*)15)) :: (35, (sloc (*Line*)9 (*Col*)12 (*EndLine*)9 (*EndCol*)14)) :: (80, (sloc (*Line*)22 (*Col*)5 (*EndLine*)22 (*EndCol*)6)) :: (26, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)12)) :: (74, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)15)) :: (56, (sloc (*Line*)19 (*Col*)5 (*EndLine*)19 (*EndCol*)5)) :: (65, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)5)) :: (82, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)15)) :: (73, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)15)) :: (64, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)7)) :: (55, (sloc (*Line*)19 (*Col*)5 (*EndLine*)19 (*EndCol*)7)) :: (85, (sloc (*Line*)22 (*Col*)13 (*EndLine*)22 (*EndCol*)13)) :: (67, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)9)) :: (40, (sloc (*Line*)10 (*Col*)5 (*EndLine*)10 (*EndCol*)5)) :: (58, (sloc (*Line*)19 (*Col*)9 (*EndLine*)19 (*EndCol*)9)) :: (76, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)11)) :: (31, (sloc (*Line*)9 (*Col*)5 (*EndLine*)9 (*EndCol*)7)) :: (43, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (34, (sloc (*Line*)9 (*Col*)12 (*EndLine*)9 (*EndCol*)14)) :: (25, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)12)) :: (37, (sloc (*Line*)9 (*Col*)14 (*EndLine*)9 (*EndCol*)14)) :: (28, (sloc (*Line*)8 (*Col*)12 (*EndLine*)8 (*EndCol*)12)) :: (60, (sloc (*Line*)19 (*Col*)14 (*EndLine*)19 (*EndCol*)15)) :: (78, (sloc (*Line*)21 (*Col*)15 (*EndLine*)21 (*EndCol*)15)) :: (69, (sloc (*Line*)20 (*Col*)14 (*EndLine*)20 (*EndCol*)15)) :: (54, (sloc (*Line*)19 (*Col*)5 (*EndLine*)19 (*EndCol*)9)) :: (63, (sloc (*Line*)20 (*Col*)5 (*EndLine*)20 (*EndCol*)9)) :: (81, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)15)) :: (72, (sloc (*Line*)21 (*Col*)5 (*EndLine*)21 (*EndCol*)6)) :: (36, (sloc (*Line*)9 (*Col*)12 (*EndLine*)9 (*EndCol*)12)) :: (27, (sloc (*Line*)8 (*Col*)10 (*EndLine*)8 (*EndCol*)10)) :: (84, (sloc (*Line*)22 (*Col*)11 (*EndLine*)22 (*EndCol*)11)) :: (57, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)7)) :: (75, (sloc (*Line*)21 (*Col*)11 (*EndLine*)21 (*EndCol*)13)) :: (39, (sloc (*Line*)10 (*Col*)5 (*EndLine*)10 (*EndCol*)7)) :: (66, (sloc (*Line*)20 (*Col*)7 (*EndLine*)20 (*EndCol*)7)) :: (42, (sloc (*Line*)10 (*Col*)12 (*EndLine*)10 (*EndCol*)12)) :: (33, (sloc (*Line*)9 (*Col*)7 (*EndLine*)9 (*EndCol*)7)) :: (24, (sloc (*Line*)8 (*Col*)5 (*EndLine*)8 (*EndCol*)5)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((17, ("O2", "ada://parameter/RecordTest01-1:9/Test02+13:13/O2+13:45")) :: (8, ("anObject", "ada://variable/RecordTest01-1:9/anObject-21:3")) :: (11, ("T", "ada://variable/RecordTest01-1:9/Test01-16:13/T+6:5")) :: (2, ("X", "ada://component/RecordTest01-1:9/Object-6:8/X-8:5")) :: (14, ("I1", "ada://parameter/RecordTest01-1:9/Test02+13:13/I1+13:20")) :: (5, ("O", "ada://component/RecordTest01-1:9/NestedObject-11:8/O-13:5")) :: (16, ("O1", "ada://parameter/RecordTest01-1:9/Test02+13:13/O1+13:41")) :: (7, ("aNestedObject", "ada://variable/RecordTest01-1:9/aNestedObject-19:3")) :: (10, ("Q", "ada://parameter/RecordTest01-1:9/Test01-16:13/Q-16:20")) :: (18, ("Q", "ada://variable/RecordTest01-1:9/Test02+13:13/Q+17:5")) :: (3, ("Y", "ada://component/RecordTest01-1:9/Object-6:8/Y-8:8")) :: (15, ("I2", "ada://parameter/RecordTest01-1:9/Test02+13:13/I2+13:24")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((13, ("Test02", "ada://procedure_body/RecordTest01-1:9/Test02+13:13")) :: (6, ("Test01", "ada://procedure_body/RecordTest01-1:9/Test01-16:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((9, ("RecordTest01", "ada://package_body/RecordTest01-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("NestedObject", "ada://ordinary_type/RecordTest01-1:9/NestedObject-11:8")) :: (1, ("Object", "ada://ordinary_type/RecordTest01-1:9/Object-6:8")) :: nil)
))
).

