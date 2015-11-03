Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Record_Type_Declaration 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) 
D_Null_Declaration (* Undefined Declarations ! *)) 
(D_Procedure_Body 6 
  (mkprocedure_body 7
    (* = = = Procedure Name = = = *)
    ((*Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
    (mkparameter_specification 9 ((*CurrentEvent*) 8) Boolean In) :: 
    (mkparameter_specification 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 11
      (S_If 12 (E_Name 13 (E_Identifier 14 ((*CurrentEvent*) 8) ))
        (S_If 15 (E_Binary_Operation 16 Equal (E_Name 17 (E_Selected_Component 18 (E_Identifier 19 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Name 21 (E_Selected_Component 22 (E_Identifier 23 ((*FI*) 7) ) ((*Limit*) 2) )) )
          (S_Assignment 25 (E_Selected_Component 26 (E_Identifier 27 ((*FI*) 7) ) ((*Tripped*) 4) ) (E_Literal 29 (Boolean_Literal true) ))
          (S_Assignment 30 (E_Selected_Component 31 (E_Identifier 32 ((*FI*) 7) ) ((*Counter*) 3) ) (E_Binary_Operation 34 Plus (E_Name 35 (E_Selected_Component 36 (E_Identifier 37 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Literal 39 (Integer_Literal 1) ) ))
        )
        (S_If 40 (E_Binary_Operation 41 Equal (E_Name 42 (E_Selected_Component 43 (E_Identifier 44 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Literal 46 (Integer_Literal 0) ) )
          (S_Assignment 47 (E_Selected_Component 48 (E_Identifier 49 ((*FI*) 7) ) ((*Tripped*) 4) ) (E_Literal 51 (Boolean_Literal false) ))
          (S_Assignment 52 (E_Selected_Component 53 (E_Identifier 54 ((*FI*) 7) ) ((*Counter*) 3) ) (E_Binary_Operation 56 Minus (E_Name 57 (E_Selected_Component 58 (E_Identifier 59 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Literal 61 (Integer_Literal 1) ) ))
        )
      ) 
      (S_Assignment 62 (E_Identifier 63 ((*IntegratedEvent*) 9) ) (E_Name 64 (E_Selected_Component 65 (E_Identifier 66 ((*FI*) 7) ) ((*Tripped*) 4) ))))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*FI*) 7), (In_Out, (Record_Type ((*T*) 1)))) :: (((*CurrentEvent*) 8), (In, Boolean)) :: (((*IntegratedEvent*) 9), (Out, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test*) 5), (0, (mkprocedure_body 7
  (* = = = Procedure Name = = = *)
  ((*Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
  (mkparameter_specification 9 ((*CurrentEvent*) 8) Boolean In) :: 
  (mkparameter_specification 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 11
    (S_If 12 (E_Name 13 (E_Identifier 14 ((*CurrentEvent*) 8) ))
      (S_If 15 (E_Binary_Operation 16 Equal (E_Name 17 (E_Selected_Component 18 (E_Identifier 19 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Name 21 (E_Selected_Component 22 (E_Identifier 23 ((*FI*) 7) ) ((*Limit*) 2) )) )
        (S_Assignment 25 (E_Selected_Component 26 (E_Identifier 27 ((*FI*) 7) ) ((*Tripped*) 4) ) (E_Literal 29 (Boolean_Literal true) ))
        (S_Assignment 30 (E_Selected_Component 31 (E_Identifier 32 ((*FI*) 7) ) ((*Counter*) 3) ) (E_Binary_Operation 34 Plus (E_Name 35 (E_Selected_Component 36 (E_Identifier 37 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Literal 39 (Integer_Literal 1) ) ))
      )
      (S_If 40 (E_Binary_Operation 41 Equal (E_Name 42 (E_Selected_Component 43 (E_Identifier 44 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Literal 46 (Integer_Literal 0) ) )
        (S_Assignment 47 (E_Selected_Component 48 (E_Identifier 49 ((*FI*) 7) ) ((*Tripped*) 4) ) (E_Literal 51 (Boolean_Literal false) ))
        (S_Assignment 52 (E_Selected_Component 53 (E_Identifier 54 ((*FI*) 7) ) ((*Counter*) 3) ) (E_Binary_Operation 56 Minus (E_Name 57 (E_Selected_Component 58 (E_Identifier 59 ((*FI*) 7) ) ((*Counter*) 3) )) (E_Literal 61 (Integer_Literal 1) ) ))
      )
    ) 
    (S_Assignment 62 (E_Identifier 63 ((*IntegratedEvent*) 9) ) (E_Name 64 (E_Selected_Component 65 (E_Identifier 66 ((*FI*) 7) ) ((*Tripped*) 4) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T*) 1), (Record_Type_Declaration 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Record_Type ((*T*) 1))) :: (59, (Record_Type ((*T*) 1))) :: (50, Boolean) :: (32, (Record_Type ((*T*) 1))) :: (41, Boolean) :: (53, Integer) :: (44, (Record_Type ((*T*) 1))) :: (17, Integer) :: (35, Integer) :: (26, Boolean) :: (56, Integer) :: (29, Boolean) :: (38, Integer) :: (20, Integer) :: (65, Boolean) :: (14, Boolean) :: (46, Integer) :: (64, Boolean) :: (55, Integer) :: (67, Boolean) :: (58, Integer) :: (49, (Record_Type ((*T*) 1))) :: (13, Boolean) :: (22, Integer) :: (31, Integer) :: (16, Boolean) :: (43, Integer) :: (34, Integer) :: (61, Integer) :: (37, (Record_Type ((*T*) 1))) :: (19, (Record_Type ((*T*) 1))) :: (28, Boolean) :: (60, Integer) :: (63, Boolean) :: (54, (Record_Type ((*T*) 1))) :: (45, Integer) :: (27, (Record_Type ((*T*) 1))) :: (18, Integer) :: (36, Integer) :: (57, Integer) :: (48, Boolean) :: (21, Integer) :: (39, Integer) :: (66, (Record_Type ((*T*) 1))) :: (42, Integer) :: (51, Boolean) :: (24, Integer) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)11 (*Col*)23 (*EndLine*)11 (*EndCol*)24)) :: (59, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)24)) :: (50, (sloc (*Line*)18 (*Col*)12 (*EndLine*)18 (*EndCol*)18)) :: (32, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)10)) :: (41, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)23)) :: (53, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)18)) :: (44, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)11)) :: (17, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)19)) :: (35, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)32)) :: (26, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)18)) :: (56, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)36)) :: (29, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)26)) :: (38, (sloc (*Line*)14 (*Col*)26 (*EndLine*)14 (*EndCol*)32)) :: (20, (sloc (*Line*)11 (*Col*)13 (*EndLine*)11 (*EndCol*)19)) :: (65, (sloc (*Line*)23 (*Col*)24 (*EndLine*)23 (*EndCol*)33)) :: (14, (sloc (*Line*)10 (*Col*)8 (*EndLine*)10 (*EndCol*)19)) :: (46, (sloc (*Line*)17 (*Col*)23 (*EndLine*)17 (*EndCol*)23)) :: (64, (sloc (*Line*)23 (*Col*)24 (*EndLine*)23 (*EndCol*)33)) :: (55, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)18)) :: (67, (sloc (*Line*)23 (*Col*)27 (*EndLine*)23 (*EndCol*)33)) :: (58, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)32)) :: (49, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)10)) :: (13, (sloc (*Line*)10 (*Col*)8 (*EndLine*)10 (*EndCol*)19)) :: (22, (sloc (*Line*)11 (*Col*)23 (*EndLine*)11 (*EndCol*)30)) :: (31, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)18)) :: (16, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)30)) :: (43, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)19)) :: (34, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)36)) :: (61, (sloc (*Line*)20 (*Col*)36 (*EndLine*)20 (*EndCol*)36)) :: (37, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)24)) :: (19, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)11)) :: (28, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)18)) :: (60, (sloc (*Line*)20 (*Col*)26 (*EndLine*)20 (*EndCol*)32)) :: (63, (sloc (*Line*)23 (*Col*)5 (*EndLine*)23 (*EndCol*)19)) :: (54, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)10)) :: (45, (sloc (*Line*)17 (*Col*)13 (*EndLine*)17 (*EndCol*)19)) :: (27, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)10)) :: (18, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)19)) :: (36, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)32)) :: (57, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)32)) :: (48, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)18)) :: (21, (sloc (*Line*)11 (*Col*)23 (*EndLine*)11 (*EndCol*)30)) :: (39, (sloc (*Line*)14 (*Col*)36 (*EndLine*)14 (*EndCol*)36)) :: (66, (sloc (*Line*)23 (*Col*)24 (*EndLine*)23 (*EndCol*)25)) :: (42, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)19)) :: (51, (sloc (*Line*)18 (*Col*)23 (*EndLine*)18 (*EndCol*)27)) :: (24, (sloc (*Line*)11 (*Col*)26 (*EndLine*)11 (*EndCol*)30)) :: (33, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)18)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("CurrentEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/CurrentEvent-10:18")) :: (2, ("Limit", "ada://component/FaultIntegrator-1:9/T-3:8/Limit-4:15")) :: (4, ("Tripped", "ada://component/FaultIntegrator-1:9/T-3:8/Tripped-6:15")) :: (7, ("FI", "ada://parameter/FaultIntegrator-1:9/Test-9:13/FI-9:18")) :: (9, ("IntegratedEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/IntegratedEvent-11:18")) :: (3, ("Counter", "ada://component/FaultIntegrator-1:9/T-3:8/Counter-5:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Test", "ada://procedure_body/FaultIntegrator-1:9/Test-9:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("FaultIntegrator", "ada://package_body/FaultIntegrator-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((1, ("T", "ada://ordinary_type/FaultIntegrator-1:9/T-3:8")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Record_Type_Declaration_X 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) 
D_Null_Declaration_X (* Undefined Declarations ! *)) 
(D_Procedure_Body_X 6 
  (mkprocedure_body_x 7
    (* = = = Procedure Name = = = *)
    ((*Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
    (mkparameter_specification_x 9 ((*CurrentEvent*) 8) Boolean In) :: 
    (mkparameter_specification_x 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 11
      (S_If_X 12 (E_Name_X 13 (E_Identifier_X 14 ((*CurrentEvent*) 8) (nil)))
        (S_If_X 15 (E_Binary_Operation_X 16 Equal (E_Name_X 17 (E_Selected_Component_X 18 (E_Identifier_X 19 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Name_X 21 (E_Selected_Component_X 22 (E_Identifier_X 23 ((*FI*) 7) (nil)) ((*Limit*) 2) (nil))) (nil) nil)
          (S_Assignment_X 25 (E_Selected_Component_X 26 (E_Identifier_X 27 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (E_Literal_X 29 (Boolean_Literal true) (nil) nil))
          (S_Assignment_X 30 (E_Selected_Component_X 31 (E_Identifier_X 32 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (E_Binary_Operation_X 34 Plus (E_Name_X 35 (E_Selected_Component_X 36 (E_Identifier_X 37 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Literal_X 39 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
        )
        (S_If_X 40 (E_Binary_Operation_X 41 Equal (E_Name_X 42 (E_Selected_Component_X 43 (E_Identifier_X 44 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Literal_X 46 (Integer_Literal 0) (nil) nil) (nil) nil)
          (S_Assignment_X 47 (E_Selected_Component_X 48 (E_Identifier_X 49 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (E_Literal_X 51 (Boolean_Literal false) (nil) nil))
          (S_Assignment_X 52 (E_Selected_Component_X 53 (E_Identifier_X 54 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (E_Binary_Operation_X 56 Minus (E_Name_X 57 (E_Selected_Component_X 58 (E_Identifier_X 59 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Literal_X 61 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
        )
      ) 
      (S_Assignment_X 62 (E_Identifier_X 63 ((*IntegratedEvent*) 9) (nil)) (E_Name_X 64 (E_Selected_Component_X 65 (E_Identifier_X 66 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)))))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*FI*) 7), (In_Out, (Record_Type ((*T*) 1)))) :: (((*CurrentEvent*) 8), (In, Boolean)) :: (((*IntegratedEvent*) 9), (Out, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test*) 5), (0, (mkprocedure_body_x 7
  (* = = = Procedure Name = = = *)
  ((*Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
  (mkparameter_specification_x 9 ((*CurrentEvent*) 8) Boolean In) :: 
  (mkparameter_specification_x 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 11
    (S_If_X 12 (E_Name_X 13 (E_Identifier_X 14 ((*CurrentEvent*) 8) (nil)))
      (S_If_X 15 (E_Binary_Operation_X 16 Equal (E_Name_X 17 (E_Selected_Component_X 18 (E_Identifier_X 19 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Name_X 21 (E_Selected_Component_X 22 (E_Identifier_X 23 ((*FI*) 7) (nil)) ((*Limit*) 2) (nil))) (nil) nil)
        (S_Assignment_X 25 (E_Selected_Component_X 26 (E_Identifier_X 27 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (E_Literal_X 29 (Boolean_Literal true) (nil) nil))
        (S_Assignment_X 30 (E_Selected_Component_X 31 (E_Identifier_X 32 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (E_Binary_Operation_X 34 Plus (E_Name_X 35 (E_Selected_Component_X 36 (E_Identifier_X 37 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Literal_X 39 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      )
      (S_If_X 40 (E_Binary_Operation_X 41 Equal (E_Name_X 42 (E_Selected_Component_X 43 (E_Identifier_X 44 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Literal_X 46 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Assignment_X 47 (E_Selected_Component_X 48 (E_Identifier_X 49 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (E_Literal_X 51 (Boolean_Literal false) (nil) nil))
        (S_Assignment_X 52 (E_Selected_Component_X 53 (E_Identifier_X 54 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (E_Binary_Operation_X 56 Minus (E_Name_X 57 (E_Selected_Component_X 58 (E_Identifier_X 59 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (E_Literal_X 61 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
      )
    ) 
    (S_Assignment_X 62 (E_Identifier_X 63 ((*IntegratedEvent*) 9) (nil)) (E_Name_X 64 (E_Selected_Component_X 65 (E_Identifier_X 66 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T*) 1), (Record_Type_Declaration_X 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, (Record_Type ((*T*) 1))) :: (59, (Record_Type ((*T*) 1))) :: (50, Boolean) :: (32, (Record_Type ((*T*) 1))) :: (41, Boolean) :: (53, Integer) :: (44, (Record_Type ((*T*) 1))) :: (17, Integer) :: (35, Integer) :: (26, Boolean) :: (56, Integer) :: (29, Boolean) :: (38, Integer) :: (20, Integer) :: (65, Boolean) :: (14, Boolean) :: (46, Integer) :: (64, Boolean) :: (55, Integer) :: (67, Boolean) :: (58, Integer) :: (49, (Record_Type ((*T*) 1))) :: (13, Boolean) :: (22, Integer) :: (31, Integer) :: (16, Boolean) :: (43, Integer) :: (34, Integer) :: (61, Integer) :: (37, (Record_Type ((*T*) 1))) :: (19, (Record_Type ((*T*) 1))) :: (28, Boolean) :: (60, Integer) :: (63, Boolean) :: (54, (Record_Type ((*T*) 1))) :: (45, Integer) :: (27, (Record_Type ((*T*) 1))) :: (18, Integer) :: (36, Integer) :: (57, Integer) :: (48, Boolean) :: (21, Integer) :: (39, Integer) :: (66, (Record_Type ((*T*) 1))) :: (42, Integer) :: (51, Boolean) :: (24, Integer) :: (33, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)11 (*Col*)23 (*EndLine*)11 (*EndCol*)24)) :: (59, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)24)) :: (50, (sloc (*Line*)18 (*Col*)12 (*EndLine*)18 (*EndCol*)18)) :: (32, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)10)) :: (41, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)23)) :: (53, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)18)) :: (44, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)11)) :: (17, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)19)) :: (35, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)32)) :: (26, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)18)) :: (56, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)36)) :: (29, (sloc (*Line*)12 (*Col*)23 (*EndLine*)12 (*EndCol*)26)) :: (38, (sloc (*Line*)14 (*Col*)26 (*EndLine*)14 (*EndCol*)32)) :: (20, (sloc (*Line*)11 (*Col*)13 (*EndLine*)11 (*EndCol*)19)) :: (65, (sloc (*Line*)23 (*Col*)24 (*EndLine*)23 (*EndCol*)33)) :: (14, (sloc (*Line*)10 (*Col*)8 (*EndLine*)10 (*EndCol*)19)) :: (46, (sloc (*Line*)17 (*Col*)23 (*EndLine*)17 (*EndCol*)23)) :: (64, (sloc (*Line*)23 (*Col*)24 (*EndLine*)23 (*EndCol*)33)) :: (55, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)18)) :: (67, (sloc (*Line*)23 (*Col*)27 (*EndLine*)23 (*EndCol*)33)) :: (58, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)32)) :: (49, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)10)) :: (13, (sloc (*Line*)10 (*Col*)8 (*EndLine*)10 (*EndCol*)19)) :: (22, (sloc (*Line*)11 (*Col*)23 (*EndLine*)11 (*EndCol*)30)) :: (31, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)18)) :: (16, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)30)) :: (43, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)19)) :: (34, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)36)) :: (61, (sloc (*Line*)20 (*Col*)36 (*EndLine*)20 (*EndCol*)36)) :: (37, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)24)) :: (19, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)11)) :: (28, (sloc (*Line*)12 (*Col*)12 (*EndLine*)12 (*EndCol*)18)) :: (60, (sloc (*Line*)20 (*Col*)26 (*EndLine*)20 (*EndCol*)32)) :: (63, (sloc (*Line*)23 (*Col*)5 (*EndLine*)23 (*EndCol*)19)) :: (54, (sloc (*Line*)20 (*Col*)9 (*EndLine*)20 (*EndCol*)10)) :: (45, (sloc (*Line*)17 (*Col*)13 (*EndLine*)17 (*EndCol*)19)) :: (27, (sloc (*Line*)12 (*Col*)9 (*EndLine*)12 (*EndCol*)10)) :: (18, (sloc (*Line*)11 (*Col*)10 (*EndLine*)11 (*EndCol*)19)) :: (36, (sloc (*Line*)14 (*Col*)23 (*EndLine*)14 (*EndCol*)32)) :: (57, (sloc (*Line*)20 (*Col*)23 (*EndLine*)20 (*EndCol*)32)) :: (48, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)18)) :: (21, (sloc (*Line*)11 (*Col*)23 (*EndLine*)11 (*EndCol*)30)) :: (39, (sloc (*Line*)14 (*Col*)36 (*EndLine*)14 (*EndCol*)36)) :: (66, (sloc (*Line*)23 (*Col*)24 (*EndLine*)23 (*EndCol*)25)) :: (42, (sloc (*Line*)17 (*Col*)10 (*EndLine*)17 (*EndCol*)19)) :: (51, (sloc (*Line*)18 (*Col*)23 (*EndLine*)18 (*EndCol*)27)) :: (24, (sloc (*Line*)11 (*Col*)26 (*EndLine*)11 (*EndCol*)30)) :: (33, (sloc (*Line*)14 (*Col*)12 (*EndLine*)14 (*EndCol*)18)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("CurrentEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/CurrentEvent-10:18")) :: (2, ("Limit", "ada://component/FaultIntegrator-1:9/T-3:8/Limit-4:15")) :: (4, ("Tripped", "ada://component/FaultIntegrator-1:9/T-3:8/Tripped-6:15")) :: (7, ("FI", "ada://parameter/FaultIntegrator-1:9/Test-9:13/FI-9:18")) :: (9, ("IntegratedEvent", "ada://parameter/FaultIntegrator-1:9/Test-9:13/IntegratedEvent-11:18")) :: (3, ("Counter", "ada://component/FaultIntegrator-1:9/T-3:8/Counter-5:15")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((5, ("Test", "ada://procedure_body/FaultIntegrator-1:9/Test-9:13")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((6, ("FaultIntegrator", "ada://package_body/FaultIntegrator-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((1, ("T", "ada://ordinary_type/FaultIntegrator-1:9/T-3:8")) :: nil)
))
).

