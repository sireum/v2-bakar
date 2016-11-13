Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Test_Case_10*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*I1*) 2) Integer In) :: 
    (mkparamSpec 4 ((*I2*) 3) Integer In) :: 
    (mkparamSpec 5 ((*I3*) 4) Integer In) :: 
    (mkparamSpec 6 ((*O1*) 5) Integer Out) :: 
    (mkparamSpec 7 ((*O2*) 6) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 8
  (ObjDecl 9 (mkobjDecl 10 ((*L1*) 7) Integer None)) 
  (ObjDecl 11 (mkobjDecl 12 ((*L2*) 8) Integer None))))
    (* = = = Procedure Body = = = *)
      (Seq 13
      (Assign 14 (Identifier 15 ((*L2*) 8) ) (Literal 16 (Integer_Literal 5) )) 
      (Seq 17
      (Assign 18 (Identifier 19 ((*L1*) 7) ) (Name 20 (Identifier 21 ((*I3*) 4) ))) 
      (Seq 22
      (Assign 23 (Identifier 24 ((*O2*) 6) ) (Name 25 (Identifier 26 ((*L1*) 7) ))) 
      (Seq 27
      (Assign 28 (Identifier 29 ((*L1*) 7) ) (Name 30 (Identifier 31 ((*I2*) 3) ))) 
      (Seq 32
      (Assign 33 (Identifier 34 ((*L1*) 7) ) (BinOp 35 Plus (Name 36 (Identifier 37 ((*I1*) 2) )) (Name 38 (Identifier 39 ((*I2*) 3) )) )) 
      (Seq 40
      (If 41 (BinOp 42 Greater_Than (Name 43 (Identifier 44 ((*L1*) 7) )) (Literal 45 (Integer_Literal 5) ) )
        (If 46 (BinOp 47 Less_Than (Name 48 (Identifier 49 ((*I1*) 2) )) (Literal 50 (Integer_Literal 0) ) )
          (Assign 51 (Identifier 52 ((*L2*) 8) ) (Literal 53 (Integer_Literal 8) ))
          Null
        )
        Null
      ) 
      (Assign 54 (Identifier 55 ((*O1*) 5) ) (Name 56 (Identifier 57 ((*L2*) 8) )))))))))
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
  ((((*L2*) 8), (In_Out, Integer)) :: (((*O1*) 5), (Out, Integer)) :: (((*L1*) 7), (In_Out, Integer)) :: (((*I3*) 4), (In, Integer)) :: (((*I2*) 3), (In, Integer)) :: (((*I1*) 2), (In, Integer)) :: (((*O2*) 6), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test_Case_10*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Test_Case_10*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*I1*) 2) Integer In) :: 
  (mkparamSpec 4 ((*I2*) 3) Integer In) :: 
  (mkparamSpec 5 ((*I3*) 4) Integer In) :: 
  (mkparamSpec 6 ((*O1*) 5) Integer Out) :: 
  (mkparamSpec 7 ((*O2*) 6) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 8
(ObjDecl 9 (mkobjDecl 10 ((*L1*) 7) Integer None)) 
(ObjDecl 11 (mkobjDecl 12 ((*L2*) 8) Integer None))))
  (* = = = Procedure Body = = = *)
    (Seq 13
    (Assign 14 (Identifier 15 ((*L2*) 8) ) (Literal 16 (Integer_Literal 5) )) 
    (Seq 17
    (Assign 18 (Identifier 19 ((*L1*) 7) ) (Name 20 (Identifier 21 ((*I3*) 4) ))) 
    (Seq 22
    (Assign 23 (Identifier 24 ((*O2*) 6) ) (Name 25 (Identifier 26 ((*L1*) 7) ))) 
    (Seq 27
    (Assign 28 (Identifier 29 ((*L1*) 7) ) (Name 30 (Identifier 31 ((*I2*) 3) ))) 
    (Seq 32
    (Assign 33 (Identifier 34 ((*L1*) 7) ) (BinOp 35 Plus (Name 36 (Identifier 37 ((*I1*) 2) )) (Name 38 (Identifier 39 ((*I2*) 3) )) )) 
    (Seq 40
    (If 41 (BinOp 42 Greater_Than (Name 43 (Identifier 44 ((*L1*) 7) )) (Literal 45 (Integer_Literal 5) ) )
      (If 46 (BinOp 47 Less_Than (Name 48 (Identifier 49 ((*I1*) 2) )) (Literal 50 (Integer_Literal 0) ) )
        (Assign 51 (Identifier 52 ((*L2*) 8) ) (Literal 53 (Integer_Literal 8) ))
        Null
      )
      Null
    ) 
    (Assign 54 (Identifier 55 ((*O1*) 5) ) (Name 56 (Identifier 57 ((*L2*) 8) )))))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((50, Integer) :: (53, Integer) :: (35, Integer) :: (44, Integer) :: (26, Integer) :: (56, Integer) :: (29, Integer) :: (38, Integer) :: (47, Boolean) :: (20, Integer) :: (55, Integer) :: (49, Integer) :: (31, Integer) :: (16, Integer) :: (52, Integer) :: (43, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (45, Integer) :: (36, Integer) :: (57, Integer) :: (21, Integer) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (15, Integer) :: (42, Boolean) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((50, (sloc (*Line*)13 (*Col*)21 (*EndLine*)13 (*EndCol*)21)) :: (53, (sloc (*Line*)15 (*Col*)23 (*EndLine*)15 (*EndCol*)23)) :: (35, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)21)) :: (44, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)13)) :: (26, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)16)) :: (56, (sloc (*Line*)19 (*Col*)15 (*EndLine*)19 (*EndCol*)16)) :: (29, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)10)) :: (38, (sloc (*Line*)10 (*Col*)20 (*EndLine*)10 (*EndCol*)21)) :: (47, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)21)) :: (20, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)16)) :: (55, (sloc (*Line*)19 (*Col*)9 (*EndLine*)19 (*EndCol*)10)) :: (49, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)17)) :: (31, (sloc (*Line*)9 (*Col*)15 (*EndLine*)9 (*EndCol*)16)) :: (16, (sloc (*Line*)6 (*Col*)15 (*EndLine*)6 (*EndCol*)15)) :: (52, (sloc (*Line*)15 (*Col*)17 (*EndLine*)15 (*EndCol*)18)) :: (43, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)13)) :: (34, (sloc (*Line*)10 (*Col*)9 (*EndLine*)10 (*EndCol*)10)) :: (25, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)16)) :: (37, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)16)) :: (19, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)10)) :: (45, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (36, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)16)) :: (57, (sloc (*Line*)19 (*Col*)15 (*EndLine*)19 (*EndCol*)16)) :: (21, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)16)) :: (48, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)17)) :: (30, (sloc (*Line*)9 (*Col*)15 (*EndLine*)9 (*EndCol*)16)) :: (39, (sloc (*Line*)10 (*Col*)20 (*EndLine*)10 (*EndCol*)21)) :: (15, (sloc (*Line*)6 (*Col*)9 (*EndLine*)6 (*EndCol*)10)) :: (42, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)17)) :: (24, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)10)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("L2", "ada://variable/Test_Case_10+1:15/L2+4:8")) :: (2, ("I1", "ada://parameter/Test_Case_10+1:15/I1+1:29")) :: (5, ("O1", "ada://parameter/Test_Case_10+1:15/O1+1:78")) :: (4, ("I3", "ada://parameter/Test_Case_10+1:15/I3+1:61")) :: (7, ("L1", "ada://variable/Test_Case_10+1:15/L1+3:8")) :: (3, ("I2", "ada://parameter/Test_Case_10+1:15/I2+1:45")) :: (6, ("O2", "ada://parameter/Test_Case_10+1:15/O2+1:95")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Test_Case_10", "ada://procedure_body/Test_Case_10+1:15")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Test_Case_10*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*I1*) 2) Integer In) :: 
    (mkparamSpecRT 4 ((*I2*) 3) Integer In) :: 
    (mkparamSpecRT 5 ((*I3*) 4) Integer In) :: 
    (mkparamSpecRT 6 ((*O1*) 5) Integer Out) :: 
    (mkparamSpecRT 7 ((*O2*) 6) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 8
  (ObjDeclRT 9 (mkobjDeclRT 10 ((*L1*) 7) Integer None)) 
  (ObjDeclRT 11 (mkobjDeclRT 12 ((*L2*) 8) Integer None))))
    (* = = = Procedure Body = = = *)
      (SeqRT 13
      (AssignRT 14 (IdentifierRT 15 ((*L2*) 8) (nil)) (LiteralRT 16 (Integer_Literal 5) (nil) nil)) 
      (SeqRT 17
      (AssignRT 18 (IdentifierRT 19 ((*L1*) 7) (nil)) (NameRT 20 (IdentifierRT 21 ((*I3*) 4) (nil)))) 
      (SeqRT 22
      (AssignRT 23 (IdentifierRT 24 ((*O2*) 6) (nil)) (NameRT 25 (IdentifierRT 26 ((*L1*) 7) (nil)))) 
      (SeqRT 27
      (AssignRT 28 (IdentifierRT 29 ((*L1*) 7) (nil)) (NameRT 30 (IdentifierRT 31 ((*I2*) 3) (nil)))) 
      (SeqRT 32
      (AssignRT 33 (IdentifierRT 34 ((*L1*) 7) (nil)) (BinOpRT 35 Plus (NameRT 36 (IdentifierRT 37 ((*I1*) 2) (nil))) (NameRT 38 (IdentifierRT 39 ((*I2*) 3) (nil))) (OverflowCheck :: nil) nil)) 
      (SeqRT 40
      (IfRT 41 (BinOpRT 42 Greater_Than (NameRT 43 (IdentifierRT 44 ((*L1*) 7) (nil))) (LiteralRT 45 (Integer_Literal 5) (nil) nil) (nil) nil)
        (IfRT 46 (BinOpRT 47 Less_Than (NameRT 48 (IdentifierRT 49 ((*I1*) 2) (nil))) (LiteralRT 50 (Integer_Literal 0) (nil) nil) (nil) nil)
          (AssignRT 51 (IdentifierRT 52 ((*L2*) 8) (nil)) (LiteralRT 53 (Integer_Literal 8) (nil) nil))
          NullRT
        )
        NullRT
      ) 
      (AssignRT 54 (IdentifierRT 55 ((*O1*) 5) (nil)) (NameRT 56 (IdentifierRT 57 ((*L2*) 8) (nil))))))))))
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
  ((((*L2*) 8), (In_Out, Integer)) :: (((*O1*) 5), (Out, Integer)) :: (((*L1*) 7), (In_Out, Integer)) :: (((*I3*) 4), (In, Integer)) :: (((*I2*) 3), (In, Integer)) :: (((*I1*) 2), (In, Integer)) :: (((*O2*) 6), (Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test_Case_10*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Test_Case_10*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*I1*) 2) Integer In) :: 
  (mkparamSpecRT 4 ((*I2*) 3) Integer In) :: 
  (mkparamSpecRT 5 ((*I3*) 4) Integer In) :: 
  (mkparamSpecRT 6 ((*O1*) 5) Integer Out) :: 
  (mkparamSpecRT 7 ((*O2*) 6) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 8
(ObjDeclRT 9 (mkobjDeclRT 10 ((*L1*) 7) Integer None)) 
(ObjDeclRT 11 (mkobjDeclRT 12 ((*L2*) 8) Integer None))))
  (* = = = Procedure Body = = = *)
    (SeqRT 13
    (AssignRT 14 (IdentifierRT 15 ((*L2*) 8) (nil)) (LiteralRT 16 (Integer_Literal 5) (nil) nil)) 
    (SeqRT 17
    (AssignRT 18 (IdentifierRT 19 ((*L1*) 7) (nil)) (NameRT 20 (IdentifierRT 21 ((*I3*) 4) (nil)))) 
    (SeqRT 22
    (AssignRT 23 (IdentifierRT 24 ((*O2*) 6) (nil)) (NameRT 25 (IdentifierRT 26 ((*L1*) 7) (nil)))) 
    (SeqRT 27
    (AssignRT 28 (IdentifierRT 29 ((*L1*) 7) (nil)) (NameRT 30 (IdentifierRT 31 ((*I2*) 3) (nil)))) 
    (SeqRT 32
    (AssignRT 33 (IdentifierRT 34 ((*L1*) 7) (nil)) (BinOpRT 35 Plus (NameRT 36 (IdentifierRT 37 ((*I1*) 2) (nil))) (NameRT 38 (IdentifierRT 39 ((*I2*) 3) (nil))) (OverflowCheck :: nil) nil)) 
    (SeqRT 40
    (IfRT 41 (BinOpRT 42 Greater_Than (NameRT 43 (IdentifierRT 44 ((*L1*) 7) (nil))) (LiteralRT 45 (Integer_Literal 5) (nil) nil) (nil) nil)
      (IfRT 46 (BinOpRT 47 Less_Than (NameRT 48 (IdentifierRT 49 ((*I1*) 2) (nil))) (LiteralRT 50 (Integer_Literal 0) (nil) nil) (nil) nil)
        (AssignRT 51 (IdentifierRT 52 ((*L2*) 8) (nil)) (LiteralRT 53 (Integer_Literal 8) (nil) nil))
        NullRT
      )
      NullRT
    ) 
    (AssignRT 54 (IdentifierRT 55 ((*O1*) 5) (nil)) (NameRT 56 (IdentifierRT 57 ((*L2*) 8) (nil))))))))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((50, Integer) :: (53, Integer) :: (35, Integer) :: (44, Integer) :: (26, Integer) :: (56, Integer) :: (29, Integer) :: (38, Integer) :: (47, Boolean) :: (20, Integer) :: (55, Integer) :: (49, Integer) :: (31, Integer) :: (16, Integer) :: (52, Integer) :: (43, Integer) :: (34, Integer) :: (25, Integer) :: (37, Integer) :: (19, Integer) :: (45, Integer) :: (36, Integer) :: (57, Integer) :: (21, Integer) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (15, Integer) :: (42, Boolean) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((50, (sloc (*Line*)13 (*Col*)21 (*EndLine*)13 (*EndCol*)21)) :: (53, (sloc (*Line*)15 (*Col*)23 (*EndLine*)15 (*EndCol*)23)) :: (35, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)21)) :: (44, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)13)) :: (26, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)16)) :: (56, (sloc (*Line*)19 (*Col*)15 (*EndLine*)19 (*EndCol*)16)) :: (29, (sloc (*Line*)9 (*Col*)9 (*EndLine*)9 (*EndCol*)10)) :: (38, (sloc (*Line*)10 (*Col*)20 (*EndLine*)10 (*EndCol*)21)) :: (47, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)21)) :: (20, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)16)) :: (55, (sloc (*Line*)19 (*Col*)9 (*EndLine*)19 (*EndCol*)10)) :: (49, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)17)) :: (31, (sloc (*Line*)9 (*Col*)15 (*EndLine*)9 (*EndCol*)16)) :: (16, (sloc (*Line*)6 (*Col*)15 (*EndLine*)6 (*EndCol*)15)) :: (52, (sloc (*Line*)15 (*Col*)17 (*EndLine*)15 (*EndCol*)18)) :: (43, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)13)) :: (34, (sloc (*Line*)10 (*Col*)9 (*EndLine*)10 (*EndCol*)10)) :: (25, (sloc (*Line*)8 (*Col*)15 (*EndLine*)8 (*EndCol*)16)) :: (37, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)16)) :: (19, (sloc (*Line*)7 (*Col*)9 (*EndLine*)7 (*EndCol*)10)) :: (45, (sloc (*Line*)11 (*Col*)17 (*EndLine*)11 (*EndCol*)17)) :: (36, (sloc (*Line*)10 (*Col*)15 (*EndLine*)10 (*EndCol*)16)) :: (57, (sloc (*Line*)19 (*Col*)15 (*EndLine*)19 (*EndCol*)16)) :: (21, (sloc (*Line*)7 (*Col*)15 (*EndLine*)7 (*EndCol*)16)) :: (48, (sloc (*Line*)13 (*Col*)16 (*EndLine*)13 (*EndCol*)17)) :: (30, (sloc (*Line*)9 (*Col*)15 (*EndLine*)9 (*EndCol*)16)) :: (39, (sloc (*Line*)10 (*Col*)20 (*EndLine*)10 (*EndCol*)21)) :: (15, (sloc (*Line*)6 (*Col*)9 (*EndLine*)6 (*EndCol*)10)) :: (42, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)17)) :: (24, (sloc (*Line*)8 (*Col*)9 (*EndLine*)8 (*EndCol*)10)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("L2", "ada://variable/Test_Case_10+1:15/L2+4:8")) :: (2, ("I1", "ada://parameter/Test_Case_10+1:15/I1+1:29")) :: (5, ("O1", "ada://parameter/Test_Case_10+1:15/O1+1:78")) :: (4, ("I3", "ada://parameter/Test_Case_10+1:15/I3+1:61")) :: (7, ("L1", "ada://variable/Test_Case_10+1:15/L1+3:8")) :: (3, ("I2", "ada://parameter/Test_Case_10+1:15/I2+1:45")) :: (6, ("O2", "ada://parameter/Test_Case_10+1:15/O2+1:95")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Test_Case_10", "ada://procedure_body/Test_Case_10+1:15")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

