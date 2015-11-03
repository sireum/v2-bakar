Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Record_Type_Declaration 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) 
(D_Seq_Declaration 6
(D_Type_Declaration 7 (Record_Type_Declaration 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) 
(D_Seq_Declaration 10
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 11
(D_Object_Declaration 12 (mkobject_declaration 13 ((*aNestedObject*) 7) (Record_Type ((*NestedObject*) 4)) None)) 
(D_Object_Declaration 14 (mkobject_declaration 15 ((*anObject*) 8) (Record_Type ((*Object*) 1)) None)))))) 
(D_Seq_Declaration 16
(D_Procedure_Body 17 
  (mkprocedure_body 18
    (* = = = Procedure Name = = = *)
    ((*Test01*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 20 (mkobject_declaration 21 ((*T*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 22
      (S_Assignment 23 (E_Identifier 24 ((*T*) 11) ) (E_Name 25 (E_Selected_Component 26 (E_Identifier 27 ((*Q*) 10) ) ((*X*) 2) ))) 
      (S_Sequence 29
      (S_Assignment 30 (E_Selected_Component 31 (E_Identifier 32 ((*Q*) 10) ) ((*X*) 2) ) (E_Name 34 (E_Selected_Component 35 (E_Identifier 36 ((*Q*) 10) ) ((*Y*) 3) ))) 
      (S_Assignment 38 (E_Selected_Component 39 (E_Identifier 40 ((*Q*) 10) ) ((*Y*) 3) ) (E_Name 42 (E_Identifier 43 ((*T*) 11) )))))
  )
) 
(D_Procedure_Body 44 
  (mkprocedure_body 45
    (* = = = Procedure Name = = = *)
    ((*Test02*) 13)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 46 ((*I1*) 14) Integer In) :: (mkparameter_specification 47 ((*I2*) 15) Integer In) :: 
    (mkparameter_specification 48 ((*O1*) 16) Integer Out) :: (mkparameter_specification 49 ((*O2*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 50 (mkobject_declaration 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence 52
      (S_Assignment 53 (E_Selected_Component 54 (E_Selected_Component 55 (E_Identifier 56 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ) (E_Name 59 (E_Identifier 60 ((*I1*) 14) ))) 
      (S_Sequence 61
      (S_Assignment 62 (E_Selected_Component 63 (E_Selected_Component 64 (E_Identifier 65 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ) (E_Name 68 (E_Identifier 69 ((*I2*) 15) ))) 
      (S_Sequence 70
      (S_Assignment 71 (E_Identifier 72 ((*O1*) 16) ) (E_Name 73 (E_Selected_Component 74 (E_Selected_Component 75 (E_Identifier 76 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ))) 
      (S_Assignment 79 (E_Identifier 80 ((*O2*) 17) ) (E_Name 81 (E_Selected_Component 82 (E_Selected_Component 83 (E_Identifier 84 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ))))))
  )
))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I2*) 15), (In, Integer)) :: (((*T*) 11), (In_Out, Integer)) :: (((*anObject*) 8), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 10), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 18), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: (((*O1*) 16), (Out, Integer)) :: (((*I1*) 14), (In, Integer)) :: (((*O2*) 17), (Out, Integer)) :: (((*aNestedObject*) 7), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test01*) 6), (0, (mkprocedure_body 18
  (* = = = Procedure Name = = = *)
  ((*Test01*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 20 (mkobject_declaration 21 ((*T*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 22
    (S_Assignment 23 (E_Identifier 24 ((*T*) 11) ) (E_Name 25 (E_Selected_Component 26 (E_Identifier 27 ((*Q*) 10) ) ((*X*) 2) ))) 
    (S_Sequence 29
    (S_Assignment 30 (E_Selected_Component 31 (E_Identifier 32 ((*Q*) 10) ) ((*X*) 2) ) (E_Name 34 (E_Selected_Component 35 (E_Identifier 36 ((*Q*) 10) ) ((*Y*) 3) ))) 
    (S_Assignment 38 (E_Selected_Component 39 (E_Identifier 40 ((*Q*) 10) ) ((*Y*) 3) ) (E_Name 42 (E_Identifier 43 ((*T*) 11) )))))
))) :: (((*Test02*) 13), (0, (mkprocedure_body 45
  (* = = = Procedure Name = = = *)
  ((*Test02*) 13)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 46 ((*I1*) 14) Integer In) :: (mkparameter_specification 47 ((*I2*) 15) Integer In) :: 
  (mkparameter_specification 48 ((*O1*) 16) Integer Out) :: (mkparameter_specification 49 ((*O2*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 50 (mkobject_declaration 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence 52
    (S_Assignment 53 (E_Selected_Component 54 (E_Selected_Component 55 (E_Identifier 56 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ) (E_Name 59 (E_Identifier 60 ((*I1*) 14) ))) 
    (S_Sequence 61
    (S_Assignment 62 (E_Selected_Component 63 (E_Selected_Component 64 (E_Identifier 65 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ) (E_Name 68 (E_Identifier 69 ((*I2*) 15) ))) 
    (S_Sequence 70
    (S_Assignment 71 (E_Identifier 72 ((*O1*) 16) ) (E_Name 73 (E_Selected_Component 74 (E_Selected_Component 75 (E_Identifier 76 ((*Q*) 18) ) ((*O*) 5) ) ((*X*) 2) ))) 
    (S_Assignment 79 (E_Identifier 80 ((*O2*) 17) ) (E_Name 81 (E_Selected_Component 82 (E_Selected_Component 83 (E_Identifier 84 ((*Q*) 18) ) ((*O*) 5) ) ((*Y*) 3) ))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*NestedObject*) 4), (Record_Type_Declaration 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) :: (((*Object*) 1), (Record_Type_Declaration 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) :: nil)
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

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Record_Type_Declaration_X 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) 
(D_Seq_Declaration_X 6
(D_Type_Declaration_X 7 (Record_Type_Declaration_X 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) 
(D_Seq_Declaration_X 10
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 11
(D_Object_Declaration_X 12 (mkobject_declaration_x 13 ((*aNestedObject*) 7) (Record_Type ((*NestedObject*) 4)) None)) 
(D_Object_Declaration_X 14 (mkobject_declaration_x 15 ((*anObject*) 8) (Record_Type ((*Object*) 1)) None)))))) 
(D_Seq_Declaration_X 16
(D_Procedure_Body_X 17 
  (mkprocedure_body_x 18
    (* = = = Procedure Name = = = *)
    ((*Test01*) 6)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 20 (mkobject_declaration_x 21 ((*T*) 11) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 22
      (S_Assignment_X 23 (E_Identifier_X 24 ((*T*) 11) (nil)) (E_Name_X 25 (E_Selected_Component_X 26 (E_Identifier_X 27 ((*Q*) 10) (nil)) ((*X*) 2) (nil)))) 
      (S_Sequence_X 29
      (S_Assignment_X 30 (E_Selected_Component_X 31 (E_Identifier_X 32 ((*Q*) 10) (nil)) ((*X*) 2) (nil)) (E_Name_X 34 (E_Selected_Component_X 35 (E_Identifier_X 36 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)))) 
      (S_Assignment_X 38 (E_Selected_Component_X 39 (E_Identifier_X 40 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)) (E_Name_X 42 (E_Identifier_X 43 ((*T*) 11) (nil))))))
  )
) 
(D_Procedure_Body_X 44 
  (mkprocedure_body_x 45
    (* = = = Procedure Name = = = *)
    ((*Test02*) 13)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 46 ((*I1*) 14) Integer In) :: (mkparameter_specification_x 47 ((*I2*) 15) Integer In) :: 
    (mkparameter_specification_x 48 ((*O1*) 16) Integer Out) :: (mkparameter_specification_x 49 ((*O2*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 50 (mkobject_declaration_x 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 52
      (S_Assignment_X 53 (E_Selected_Component_X 54 (E_Selected_Component_X 55 (E_Identifier_X 56 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)) (E_Name_X 59 (E_Identifier_X 60 ((*I1*) 14) (nil)))) 
      (S_Sequence_X 61
      (S_Assignment_X 62 (E_Selected_Component_X 63 (E_Selected_Component_X 64 (E_Identifier_X 65 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)) (E_Name_X 68 (E_Identifier_X 69 ((*I2*) 15) (nil)))) 
      (S_Sequence_X 70
      (S_Assignment_X 71 (E_Identifier_X 72 ((*O1*) 16) (nil)) (E_Name_X 73 (E_Selected_Component_X 74 (E_Selected_Component_X 75 (E_Identifier_X 76 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)))) 
      (S_Assignment_X 79 (E_Identifier_X 80 ((*O2*) 17) (nil)) (E_Name_X 81 (E_Selected_Component_X 82 (E_Selected_Component_X 83 (E_Identifier_X 84 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)))))))
  )
))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I2*) 15), (In, Integer)) :: (((*T*) 11), (In_Out, Integer)) :: (((*anObject*) 8), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 10), (In_Out, (Record_Type ((*Object*) 1)))) :: (((*Q*) 18), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: (((*O1*) 16), (Out, Integer)) :: (((*I1*) 14), (In, Integer)) :: (((*O2*) 17), (Out, Integer)) :: (((*aNestedObject*) 7), (In_Out, (Record_Type ((*NestedObject*) 4)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test01*) 6), (0, (mkprocedure_body_x 18
  (* = = = Procedure Name = = = *)
  ((*Test01*) 6)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 19 ((*Q*) 10) (Record_Type ((*Object*) 1)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 20 (mkobject_declaration_x 21 ((*T*) 11) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 22
    (S_Assignment_X 23 (E_Identifier_X 24 ((*T*) 11) (nil)) (E_Name_X 25 (E_Selected_Component_X 26 (E_Identifier_X 27 ((*Q*) 10) (nil)) ((*X*) 2) (nil)))) 
    (S_Sequence_X 29
    (S_Assignment_X 30 (E_Selected_Component_X 31 (E_Identifier_X 32 ((*Q*) 10) (nil)) ((*X*) 2) (nil)) (E_Name_X 34 (E_Selected_Component_X 35 (E_Identifier_X 36 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)))) 
    (S_Assignment_X 38 (E_Selected_Component_X 39 (E_Identifier_X 40 ((*Q*) 10) (nil)) ((*Y*) 3) (nil)) (E_Name_X 42 (E_Identifier_X 43 ((*T*) 11) (nil))))))
))) :: (((*Test02*) 13), (0, (mkprocedure_body_x 45
  (* = = = Procedure Name = = = *)
  ((*Test02*) 13)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 46 ((*I1*) 14) Integer In) :: (mkparameter_specification_x 47 ((*I2*) 15) Integer In) :: 
  (mkparameter_specification_x 48 ((*O1*) 16) Integer Out) :: (mkparameter_specification_x 49 ((*O2*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 50 (mkobject_declaration_x 51 ((*Q*) 18) (Record_Type ((*NestedObject*) 4)) None)))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 52
    (S_Assignment_X 53 (E_Selected_Component_X 54 (E_Selected_Component_X 55 (E_Identifier_X 56 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)) (E_Name_X 59 (E_Identifier_X 60 ((*I1*) 14) (nil)))) 
    (S_Sequence_X 61
    (S_Assignment_X 62 (E_Selected_Component_X 63 (E_Selected_Component_X 64 (E_Identifier_X 65 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)) (E_Name_X 68 (E_Identifier_X 69 ((*I2*) 15) (nil)))) 
    (S_Sequence_X 70
    (S_Assignment_X 71 (E_Identifier_X 72 ((*O1*) 16) (nil)) (E_Name_X 73 (E_Selected_Component_X 74 (E_Selected_Component_X 75 (E_Identifier_X 76 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*X*) 2) (nil)))) 
    (S_Assignment_X 79 (E_Identifier_X 80 ((*O2*) 17) (nil)) (E_Name_X 81 (E_Selected_Component_X 82 (E_Selected_Component_X 83 (E_Identifier_X 84 ((*Q*) 18) (nil)) ((*O*) 5) (nil)) ((*Y*) 3) (nil)))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*NestedObject*) 4), (Record_Type_Declaration_X 8 ((*NestedObject*) 4) ((((*O*) 5), (Record_Type ((*Object*) 1))) :: nil))) :: (((*Object*) 1), (Record_Type_Declaration_X 4 ((*Object*) 1) ((((*X*) 2), Integer) :: (((*Y*) 3), Integer) :: nil))) :: nil)
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

