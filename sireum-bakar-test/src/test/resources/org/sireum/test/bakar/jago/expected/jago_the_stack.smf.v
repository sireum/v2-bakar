Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *)) 
(D_Seq_Declaration 3
(D_Type_Declaration 4 (Subtype_Declaration 5 ((*AuditCountType*) 4) Integer (Range 0 200))) 
(D_Seq_Declaration 6
(D_Type_Declaration 7 (Record_Type_Declaration 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) 
(D_Seq_Declaration 10
(D_Type_Declaration 11 (Integer_Type_Declaration 12 ((*Pointer_Range*) 8) (Range 0 100))) 
(D_Seq_Declaration 13
(D_Type_Declaration 14 (Subtype_Declaration 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (Range 1 100))) 
(D_Seq_Declaration 16
(D_Type_Declaration 17 (Array_Type_Declaration 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) 
(D_Seq_Declaration 19
(D_Object_Declaration 20 (mkobject_declaration 21 ((*S*) 11) (Array_Type ((*Vector*) 10)) None)) 
(D_Seq_Declaration 22
(D_Object_Declaration 23 (mkobject_declaration 24 ((*Pointer*) 12) (Integer_Type ((*Pointer_Range*) 8)) None)) 
(D_Seq_Declaration 25
(D_Object_Declaration 26 (mkobject_declaration 27 ((*AuditInfo*) 13) (Record_Type ((*AuditInfoType*) 5)) None)) 
(D_Seq_Declaration 28
(D_Procedure_Body 29 
  (mkprocedure_body 30
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 31 ((*X*) 14) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 32
      (S_Assignment 33 (E_Identifier 34 ((*Pointer*) 12) ) (E_Binary_Operation 35 Plus (E_Name 36 (E_Identifier 37 ((*Pointer*) 12) )) (E_Literal 38 (Integer_Literal 1) ) )) 
      (S_Sequence 39
      (S_Assignment 40 (E_Indexed_Component 41 (E_Identifier 42 ((*S*) 11) ) (E_Name 43 (E_Identifier 44 ((*Pointer*) 12) )) ) (E_Name 45 (E_Identifier 46 ((*X*) 14) ))) 
      (S_Assignment 47 (E_Selected_Component 48 (E_Identifier 49 ((*AuditInfo*) 13) ) ((*PushOps*) 6) ) (E_Binary_Operation 51 Plus (E_Name 52 (E_Selected_Component 53 (E_Identifier 54 ((*AuditInfo*) 13) ) ((*PushOps*) 6) )) (E_Literal 56 (Integer_Literal 1) ) ))))
  )
) 
(D_Procedure_Body 57 
  (mkprocedure_body 58
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 59 ((*X*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 60
      (S_Assignment 61 (E_Identifier 62 ((*X*) 17) ) (E_Name 63 (E_Indexed_Component 64 (E_Identifier 65 ((*S*) 11) ) (E_Name 66 (E_Identifier 67 ((*Pointer*) 12) )) ))) 
      (S_Sequence 68
      (S_Assignment 69 (E_Identifier 70 ((*Pointer*) 12) ) (E_Binary_Operation 71 Minus (E_Name 72 (E_Identifier 73 ((*Pointer*) 12) )) (E_Literal 74 (Integer_Literal 1) ) )) 
      (S_Assignment 75 (E_Selected_Component 76 (E_Identifier 77 ((*AuditInfo*) 13) ) ((*PopOps*) 7) ) (E_Binary_Operation 79 Plus (E_Name 80 (E_Selected_Component 81 (E_Identifier 82 ((*AuditInfo*) 13) ) ((*PopOps*) 7) )) (E_Literal 84 (Integer_Literal 1) ) ))))
  )
))))))))))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 14), (In, Integer)) :: (((*Pointer*) 12), (In_Out, (Integer_Type ((*Pointer_Range*) 8)))) :: (((*AuditInfo*) 13), (In_Out, (Record_Type ((*AuditInfoType*) 5)))) :: (((*S*) 11), (In_Out, (Array_Type ((*Vector*) 10)))) :: (((*X*) 17), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocedure_body 30
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 31 ((*X*) 14) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 32
    (S_Assignment 33 (E_Identifier 34 ((*Pointer*) 12) ) (E_Binary_Operation 35 Plus (E_Name 36 (E_Identifier 37 ((*Pointer*) 12) )) (E_Literal 38 (Integer_Literal 1) ) )) 
    (S_Sequence 39
    (S_Assignment 40 (E_Indexed_Component 41 (E_Identifier 42 ((*S*) 11) ) (E_Name 43 (E_Identifier 44 ((*Pointer*) 12) )) ) (E_Name 45 (E_Identifier 46 ((*X*) 14) ))) 
    (S_Assignment 47 (E_Selected_Component 48 (E_Identifier 49 ((*AuditInfo*) 13) ) ((*PushOps*) 6) ) (E_Binary_Operation 51 Plus (E_Name 52 (E_Selected_Component 53 (E_Identifier 54 ((*AuditInfo*) 13) ) ((*PushOps*) 6) )) (E_Literal 56 (Integer_Literal 1) ) ))))
))) :: (((*Pop*) 2), (0, (mkprocedure_body 58
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 59 ((*X*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 60
    (S_Assignment 61 (E_Identifier 62 ((*X*) 17) ) (E_Name 63 (E_Indexed_Component 64 (E_Identifier 65 ((*S*) 11) ) (E_Name 66 (E_Identifier 67 ((*Pointer*) 12) )) ))) 
    (S_Sequence 68
    (S_Assignment 69 (E_Identifier 70 ((*Pointer*) 12) ) (E_Binary_Operation 71 Minus (E_Name 72 (E_Identifier 73 ((*Pointer*) 12) )) (E_Literal 74 (Integer_Literal 1) ) )) 
    (S_Assignment 75 (E_Selected_Component 76 (E_Identifier 77 ((*AuditInfo*) 13) ) ((*PopOps*) 7) ) (E_Binary_Operation 79 Plus (E_Name 80 (E_Selected_Component 81 (E_Identifier 82 ((*AuditInfo*) 13) ) ((*PopOps*) 7) )) (E_Literal 84 (Integer_Literal 1) ) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*AuditInfoType*) 5), (Record_Type_Declaration 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) :: (((*Vector*) 10), (Array_Type_Declaration 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) :: (((*AuditCountType*) 4), (Subtype_Declaration 5 ((*AuditCountType*) 4) Integer (Range 0 200))) :: (((*Index_Range*) 9), (Subtype_Declaration 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (Range 1 100))) :: (((*Pointer_Range*) 8), (Integer_Type_Declaration 12 ((*Pointer_Range*) 8) (Range 0 100))) :: nil)
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

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *)) 
(D_Seq_Declaration_X 3
(D_Type_Declaration_X 4 (Subtype_Declaration_X 5 ((*AuditCountType*) 4) Integer (Range_X 0 200))) 
(D_Seq_Declaration_X 6
(D_Type_Declaration_X 7 (Record_Type_Declaration_X 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) 
(D_Seq_Declaration_X 10
(D_Type_Declaration_X 11 (Integer_Type_Declaration_X 12 ((*Pointer_Range*) 8) (Range_X 0 100))) 
(D_Seq_Declaration_X 13
(D_Type_Declaration_X 14 (Subtype_Declaration_X 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (Range_X 1 100))) 
(D_Seq_Declaration_X 16
(D_Type_Declaration_X 17 (Array_Type_Declaration_X 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) 
(D_Seq_Declaration_X 19
(D_Object_Declaration_X 20 (mkobject_declaration_x 21 ((*S*) 11) (Array_Type ((*Vector*) 10)) None)) 
(D_Seq_Declaration_X 22
(D_Object_Declaration_X 23 (mkobject_declaration_x 24 ((*Pointer*) 12) (Integer_Type ((*Pointer_Range*) 8)) None)) 
(D_Seq_Declaration_X 25
(D_Object_Declaration_X 26 (mkobject_declaration_x 27 ((*AuditInfo*) 13) (Record_Type ((*AuditInfoType*) 5)) None)) 
(D_Seq_Declaration_X 28
(D_Procedure_Body_X 29 
  (mkprocedure_body_x 30
    (* = = = Procedure Name = = = *)
    ((*Push*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 31 ((*X*) 14) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 32
      (S_Assignment_X 33 (E_Identifier_X 34 ((*Pointer*) 12) (nil)) (E_Binary_Operation_X 35 Plus (E_Name_X 36 (E_Identifier_X 37 ((*Pointer*) 12) (nil))) (E_Literal_X 38 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_Sequence_X 39
      (S_Assignment_X 40 (E_Indexed_Component_X 41 (E_Identifier_X 42 ((*S*) 11) (nil)) (E_Name_X 43 (E_Identifier_X 44 ((*Pointer*) 12) (Do_Range_Check :: nil))) (nil)) (E_Name_X 45 (E_Identifier_X 46 ((*X*) 14) (nil)))) 
      (S_Assignment_X 47 (E_Selected_Component_X 48 (E_Identifier_X 49 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil)) (E_Binary_Operation_X 51 Plus (E_Name_X 52 (E_Selected_Component_X 53 (E_Identifier_X 54 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil))) (E_Literal_X 56 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
  )
) 
(D_Procedure_Body_X 57 
  (mkprocedure_body_x 58
    (* = = = Procedure Name = = = *)
    ((*Pop*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 59 ((*X*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 60
      (S_Assignment_X 61 (E_Identifier_X 62 ((*X*) 17) (nil)) (E_Name_X 63 (E_Indexed_Component_X 64 (E_Identifier_X 65 ((*S*) 11) (nil)) (E_Name_X 66 (E_Identifier_X 67 ((*Pointer*) 12) (Do_Range_Check :: nil))) (nil)))) 
      (S_Sequence_X 68
      (S_Assignment_X 69 (E_Identifier_X 70 ((*Pointer*) 12) (nil)) (E_Binary_Operation_X 71 Minus (E_Name_X 72 (E_Identifier_X 73 ((*Pointer*) 12) (nil))) (E_Literal_X 74 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_Assignment_X 75 (E_Selected_Component_X 76 (E_Identifier_X 77 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil)) (E_Binary_Operation_X 79 Plus (E_Name_X 80 (E_Selected_Component_X 81 (E_Identifier_X 82 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil))) (E_Literal_X 84 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
  )
))))))))))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 14), (In, Integer)) :: (((*Pointer*) 12), (In_Out, (Integer_Type ((*Pointer_Range*) 8)))) :: (((*AuditInfo*) 13), (In_Out, (Record_Type ((*AuditInfoType*) 5)))) :: (((*S*) 11), (In_Out, (Array_Type ((*Vector*) 10)))) :: (((*X*) 17), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Push*) 1), (0, (mkprocedure_body_x 30
  (* = = = Procedure Name = = = *)
  ((*Push*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 31 ((*X*) 14) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 32
    (S_Assignment_X 33 (E_Identifier_X 34 ((*Pointer*) 12) (nil)) (E_Binary_Operation_X 35 Plus (E_Name_X 36 (E_Identifier_X 37 ((*Pointer*) 12) (nil))) (E_Literal_X 38 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
    (S_Sequence_X 39
    (S_Assignment_X 40 (E_Indexed_Component_X 41 (E_Identifier_X 42 ((*S*) 11) (nil)) (E_Name_X 43 (E_Identifier_X 44 ((*Pointer*) 12) (Do_Range_Check :: nil))) (nil)) (E_Name_X 45 (E_Identifier_X 46 ((*X*) 14) (nil)))) 
    (S_Assignment_X 47 (E_Selected_Component_X 48 (E_Identifier_X 49 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil)) (E_Binary_Operation_X 51 Plus (E_Name_X 52 (E_Selected_Component_X 53 (E_Identifier_X 54 ((*AuditInfo*) 13) (nil)) ((*PushOps*) 6) (nil))) (E_Literal_X 56 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
))) :: (((*Pop*) 2), (0, (mkprocedure_body_x 58
  (* = = = Procedure Name = = = *)
  ((*Pop*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 59 ((*X*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 60
    (S_Assignment_X 61 (E_Identifier_X 62 ((*X*) 17) (nil)) (E_Name_X 63 (E_Indexed_Component_X 64 (E_Identifier_X 65 ((*S*) 11) (nil)) (E_Name_X 66 (E_Identifier_X 67 ((*Pointer*) 12) (Do_Range_Check :: nil))) (nil)))) 
    (S_Sequence_X 68
    (S_Assignment_X 69 (E_Identifier_X 70 ((*Pointer*) 12) (nil)) (E_Binary_Operation_X 71 Minus (E_Name_X 72 (E_Identifier_X 73 ((*Pointer*) 12) (nil))) (E_Literal_X 74 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
    (S_Assignment_X 75 (E_Selected_Component_X 76 (E_Identifier_X 77 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil)) (E_Binary_Operation_X 79 Plus (E_Name_X 80 (E_Selected_Component_X 81 (E_Identifier_X 82 ((*AuditInfo*) 13) (nil)) ((*PopOps*) 7) (nil))) (E_Literal_X 84 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*AuditInfoType*) 5), (Record_Type_Declaration_X 8 ((*AuditInfoType*) 5) ((((*PushOps*) 6), (Subtype ((*AuditCountType*) 4))) :: (((*PopOps*) 7), (Subtype ((*AuditCountType*) 4))) :: nil))) :: (((*Vector*) 10), (Array_Type_Declaration_X 18 ((*Vector*) 10) ((*index subtype mark*) (Subtype ((*Index_Range*) 9))) ((*component type*) Integer))) :: (((*AuditCountType*) 4), (Subtype_Declaration_X 5 ((*AuditCountType*) 4) Integer (Range_X 0 200))) :: (((*Index_Range*) 9), (Subtype_Declaration_X 15 ((*Index_Range*) 9) (Integer_Type ((*Pointer_Range*) 8)) (Range_X 1 100))) :: (((*Pointer_Range*) 8), (Integer_Type_Declaration_X 12 ((*Pointer_Range*) 8) (Range_X 0 100))) :: nil)
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

