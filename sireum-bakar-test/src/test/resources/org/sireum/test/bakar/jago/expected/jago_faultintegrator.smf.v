Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (RecordTypeDecl 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) 
NullDecl (* Undefined Declarations ! *)) 
(ProcBodyDecl 6 
  (mkprocBodyDecl 7
    (* = = = Procedure Name = = = *)
    ((*Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
    (mkparamSpec 9 ((*CurrentEvent*) 8) Boolean In) :: 
    (mkparamSpec 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Seq 11
      (If 12 (Name 13 (Identifier 14 ((*CurrentEvent*) 8) ))
        (If 15 (BinOp 16 Equal (Name 17 (SelectedComponent 18 (Identifier 19 ((*FI*) 7) ) ((*Counter*) 3) )) (Name 21 (SelectedComponent 22 (Identifier 23 ((*FI*) 7) ) ((*Limit*) 2) )) )
          (Assign 25 (SelectedComponent 26 (Identifier 27 ((*FI*) 7) ) ((*Tripped*) 4) ) (Literal 29 (Boolean_Literal true) ))
          (Assign 30 (SelectedComponent 31 (Identifier 32 ((*FI*) 7) ) ((*Counter*) 3) ) (BinOp 34 Plus (Name 35 (SelectedComponent 36 (Identifier 37 ((*FI*) 7) ) ((*Counter*) 3) )) (Literal 39 (Integer_Literal 1) ) ))
        )
        (If 40 (BinOp 41 Equal (Name 42 (SelectedComponent 43 (Identifier 44 ((*FI*) 7) ) ((*Counter*) 3) )) (Literal 46 (Integer_Literal 0) ) )
          (Assign 47 (SelectedComponent 48 (Identifier 49 ((*FI*) 7) ) ((*Tripped*) 4) ) (Literal 51 (Boolean_Literal false) ))
          (Assign 52 (SelectedComponent 53 (Identifier 54 ((*FI*) 7) ) ((*Counter*) 3) ) (BinOp 56 Minus (Name 57 (SelectedComponent 58 (Identifier 59 ((*FI*) 7) ) ((*Counter*) 3) )) (Literal 61 (Integer_Literal 1) ) ))
        )
      ) 
      (Assign 62 (Identifier 63 ((*IntegratedEvent*) 9) ) (Name 64 (SelectedComponent 65 (Identifier 66 ((*FI*) 7) ) ((*Tripped*) 4) ))))
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
  ((((*FI*) 7), (In_Out, (Record_Type ((*T*) 1)))) :: (((*CurrentEvent*) 8), (In, Boolean)) :: (((*IntegratedEvent*) 9), (Out, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test*) 5), (0, (mkprocBodyDecl 7
  (* = = = Procedure Name = = = *)
  ((*Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
  (mkparamSpec 9 ((*CurrentEvent*) 8) Boolean In) :: 
  (mkparamSpec 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Seq 11
    (If 12 (Name 13 (Identifier 14 ((*CurrentEvent*) 8) ))
      (If 15 (BinOp 16 Equal (Name 17 (SelectedComponent 18 (Identifier 19 ((*FI*) 7) ) ((*Counter*) 3) )) (Name 21 (SelectedComponent 22 (Identifier 23 ((*FI*) 7) ) ((*Limit*) 2) )) )
        (Assign 25 (SelectedComponent 26 (Identifier 27 ((*FI*) 7) ) ((*Tripped*) 4) ) (Literal 29 (Boolean_Literal true) ))
        (Assign 30 (SelectedComponent 31 (Identifier 32 ((*FI*) 7) ) ((*Counter*) 3) ) (BinOp 34 Plus (Name 35 (SelectedComponent 36 (Identifier 37 ((*FI*) 7) ) ((*Counter*) 3) )) (Literal 39 (Integer_Literal 1) ) ))
      )
      (If 40 (BinOp 41 Equal (Name 42 (SelectedComponent 43 (Identifier 44 ((*FI*) 7) ) ((*Counter*) 3) )) (Literal 46 (Integer_Literal 0) ) )
        (Assign 47 (SelectedComponent 48 (Identifier 49 ((*FI*) 7) ) ((*Tripped*) 4) ) (Literal 51 (Boolean_Literal false) ))
        (Assign 52 (SelectedComponent 53 (Identifier 54 ((*FI*) 7) ) ((*Counter*) 3) ) (BinOp 56 Minus (Name 57 (SelectedComponent 58 (Identifier 59 ((*FI*) 7) ) ((*Counter*) 3) )) (Literal 61 (Integer_Literal 1) ) ))
      )
    ) 
    (Assign 62 (Identifier 63 ((*IntegratedEvent*) 9) ) (Name 64 (SelectedComponent 65 (Identifier 66 ((*FI*) 7) ) ((*Tripped*) 4) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T*) 1), (RecordTypeDecl 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) :: nil)
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

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (RecordTypeDeclRT 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) 
NullDeclRT (* Undefined Declarations ! *)) 
(ProcBodyDeclRT 6 
  (mkprocBodyDeclRT 7
    (* = = = Procedure Name = = = *)
    ((*Test*) 5)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
    (mkparamSpecRT 9 ((*CurrentEvent*) 8) Boolean In) :: 
    (mkparamSpecRT 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (SeqRT 11
      (IfRT 12 (NameRT 13 (IdentifierRT 14 ((*CurrentEvent*) 8) (nil)))
        (IfRT 15 (BinOpRT 16 Equal (NameRT 17 (SelectedComponentRT 18 (IdentifierRT 19 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (NameRT 21 (SelectedComponentRT 22 (IdentifierRT 23 ((*FI*) 7) (nil)) ((*Limit*) 2) (nil))) (nil) nil)
          (AssignRT 25 (SelectedComponentRT 26 (IdentifierRT 27 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (LiteralRT 29 (Boolean_Literal true) (nil) nil))
          (AssignRT 30 (SelectedComponentRT 31 (IdentifierRT 32 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (BinOpRT 34 Plus (NameRT 35 (SelectedComponentRT 36 (IdentifierRT 37 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (LiteralRT 39 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
        )
        (IfRT 40 (BinOpRT 41 Equal (NameRT 42 (SelectedComponentRT 43 (IdentifierRT 44 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (LiteralRT 46 (Integer_Literal 0) (nil) nil) (nil) nil)
          (AssignRT 47 (SelectedComponentRT 48 (IdentifierRT 49 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (LiteralRT 51 (Boolean_Literal false) (nil) nil))
          (AssignRT 52 (SelectedComponentRT 53 (IdentifierRT 54 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (BinOpRT 56 Minus (NameRT 57 (SelectedComponentRT 58 (IdentifierRT 59 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (LiteralRT 61 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
        )
      ) 
      (AssignRT 62 (IdentifierRT 63 ((*IntegratedEvent*) 9) (nil)) (NameRT 64 (SelectedComponentRT 65 (IdentifierRT 66 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)))))
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
  ((((*FI*) 7), (In_Out, (Record_Type ((*T*) 1)))) :: (((*CurrentEvent*) 8), (In, Boolean)) :: (((*IntegratedEvent*) 9), (Out, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test*) 5), (0, (mkprocBodyDeclRT 7
  (* = = = Procedure Name = = = *)
  ((*Test*) 5)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 8 ((*FI*) 7) (Record_Type ((*T*) 1)) In_Out) :: 
  (mkparamSpecRT 9 ((*CurrentEvent*) 8) Boolean In) :: 
  (mkparamSpecRT 10 ((*IntegratedEvent*) 9) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (SeqRT 11
    (IfRT 12 (NameRT 13 (IdentifierRT 14 ((*CurrentEvent*) 8) (nil)))
      (IfRT 15 (BinOpRT 16 Equal (NameRT 17 (SelectedComponentRT 18 (IdentifierRT 19 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (NameRT 21 (SelectedComponentRT 22 (IdentifierRT 23 ((*FI*) 7) (nil)) ((*Limit*) 2) (nil))) (nil) nil)
        (AssignRT 25 (SelectedComponentRT 26 (IdentifierRT 27 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (LiteralRT 29 (Boolean_Literal true) (nil) nil))
        (AssignRT 30 (SelectedComponentRT 31 (IdentifierRT 32 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (BinOpRT 34 Plus (NameRT 35 (SelectedComponentRT 36 (IdentifierRT 37 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (LiteralRT 39 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
      )
      (IfRT 40 (BinOpRT 41 Equal (NameRT 42 (SelectedComponentRT 43 (IdentifierRT 44 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (LiteralRT 46 (Integer_Literal 0) (nil) nil) (nil) nil)
        (AssignRT 47 (SelectedComponentRT 48 (IdentifierRT 49 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)) (LiteralRT 51 (Boolean_Literal false) (nil) nil))
        (AssignRT 52 (SelectedComponentRT 53 (IdentifierRT 54 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil)) (BinOpRT 56 Minus (NameRT 57 (SelectedComponentRT 58 (IdentifierRT 59 ((*FI*) 7) (nil)) ((*Counter*) 3) (nil))) (LiteralRT 61 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
      )
    ) 
    (AssignRT 62 (IdentifierRT 63 ((*IntegratedEvent*) 9) (nil)) (NameRT 64 (SelectedComponentRT 65 (IdentifierRT 66 ((*FI*) 7) (nil)) ((*Tripped*) 4) (nil)))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*T*) 1), (RecordTypeDeclRT 4 ((*T*) 1) ((((*Limit*) 2), Integer) :: (((*Counter*) 3), Integer) :: (((*Tripped*) 4), Boolean) :: nil))) :: nil)
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

