Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 2
(TypeDecl 3 (SubtypeDecl 4 ((*Index_Type*) 3) Integer (Range 1 3))) 
(SeqDecl 5
(TypeDecl 6 (ArrayTypeDecl 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) 
(SeqDecl 8
(ProcBodyDecl 9 
  (mkprocBodyDecl 10
    (* = = = Procedure Name = = = *)
    ((*Dummy*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 11 ((*X*) 5) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 12 (Identifier 13 ((*X*) 5) ) (BinOp 14 Plus (Name 15 (Identifier 16 ((*X*) 5) )) (Literal 17 (Integer_Literal 1) ) ))
  )
) 
(ProcBodyDecl 18 
  (mkprocBodyDecl 19
    (* = = = Procedure Name = = = *)
    ((*SelectionSort*) 8)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 21
  (ObjDecl 22 (mkobjDecl 23 ((*Min*) 10) Integer None)) 
  (SeqDecl 24
  (ObjDecl 25 (mkobjDecl 26 ((*Temp*) 11) Integer None)) 
  (SeqDecl 27
  (ObjDecl 28 (mkobjDecl 29 ((*Pos*) 12) Integer None)) 
  (ObjDecl 30 (mkobjDecl 31 ((*I*) 13) Integer None))))))
    (* = = = Procedure Body = = = *)
      (Seq 32
      (Assign 33 (Identifier 34 ((*Pos*) 12) ) (Literal 35 (Integer_Literal 1) )) 
      (While 36 (BinOp 37 And (BinOp 38 Greater_Than_Or_Equal (Name 39 (Identifier 40 ((*Pos*) 12) )) (Literal 41 (Integer_Literal 1) ) ) (BinOp 42 Less_Than_Or_Equal (Name 43 (Identifier 44 ((*Pos*) 12) )) (Literal 45 (Integer_Literal 3) ) ) )
        (Seq 46
        (Assign 47 (Identifier 48 ((*Min*) 10) ) (Name 49 (Identifier 50 ((*Pos*) 12) ))) 
        (Seq 51
        (Assign 52 (Identifier 53 ((*I*) 13) ) (BinOp 54 Plus (Name 55 (Identifier 56 ((*Pos*) 12) )) (Literal 57 (Integer_Literal 1) ) )) 
        (Seq 58
        (While 59 (BinOp 60 And (BinOp 61 Greater_Than_Or_Equal (Name 62 (Identifier 63 ((*I*) 13) )) (BinOp 64 Plus (Name 65 (Identifier 66 ((*Pos*) 12) )) (Literal 67 (Integer_Literal 1) ) ) ) (BinOp 68 Less_Than_Or_Equal (Name 69 (Identifier 70 ((*I*) 13) )) (Literal 71 (Integer_Literal 3) ) ) )
          (Seq 72
          (If 73 (BinOp 74 Less_Than (Name 75 (IndexedComponent 76 (Identifier 77 ((*A*) 9) ) (Name 78 (Identifier 79 ((*I*) 13) )) )) (Name 80 (IndexedComponent 81 (Identifier 82 ((*A*) 9) ) (Name 83 (Identifier 84 ((*Min*) 10) )) )) )
            (Assign 85 (Identifier 86 ((*Min*) 10) ) (Name 87 (Identifier 88 ((*I*) 13) )))
            Null
          ) 
          (Assign 89 (Identifier 90 ((*I*) 13) ) (BinOp 91 Plus (Name 92 (Identifier 93 ((*I*) 13) )) (Literal 94 (Integer_Literal 1) ) )))
        ) 
        (Seq 95
        (If 96 (BinOp 97 Not_Equal (Name 98 (Identifier 99 ((*Pos*) 12) )) (Name 100 (Identifier 101 ((*Min*) 10) )) )
          (Seq 102
          (Assign 103 (Identifier 104 ((*Temp*) 11) ) (Name 105 (IndexedComponent 106 (Identifier 107 ((*A*) 9) ) (Name 108 (Identifier 109 ((*Pos*) 12) )) ))) 
          (Seq 110
          (Assign 111 (IndexedComponent 112 (Identifier 113 ((*A*) 9) ) (Name 114 (Identifier 115 ((*Pos*) 12) )) ) (Name 116 (IndexedComponent 117 (Identifier 118 ((*A*) 9) ) (Name 119 (Identifier 120 ((*Min*) 10) )) ))) 
          (Assign 121 (IndexedComponent 122 (Identifier 123 ((*A*) 9) ) (Name 124 (Identifier 125 ((*Min*) 10) )) ) (Name 126 (Identifier 127 ((*Temp*) 11) )))))
          Null
        ) 
        (Assign 128 (Identifier 129 ((*Pos*) 12) ) (BinOp 130 Plus (Name 131 (Identifier 132 ((*Pos*) 12) )) (Literal 133 (Integer_Literal 1) ) ))))))
      ))
  )
)))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 5), (In_Out, Integer)) :: (((*Pos*) 12), (In_Out, Integer)) :: (((*A*) 9), (In_Out, (Array_Type ((*Vector*) 4)))) :: (((*I*) 13), (In_Out, Integer)) :: (((*Temp*) 11), (In_Out, Integer)) :: (((*Min*) 10), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*SelectionSort*) 8), (0, (mkprocBodyDecl 19
  (* = = = Procedure Name = = = *)
  ((*SelectionSort*) 8)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 21
(ObjDecl 22 (mkobjDecl 23 ((*Min*) 10) Integer None)) 
(SeqDecl 24
(ObjDecl 25 (mkobjDecl 26 ((*Temp*) 11) Integer None)) 
(SeqDecl 27
(ObjDecl 28 (mkobjDecl 29 ((*Pos*) 12) Integer None)) 
(ObjDecl 30 (mkobjDecl 31 ((*I*) 13) Integer None))))))
  (* = = = Procedure Body = = = *)
    (Seq 32
    (Assign 33 (Identifier 34 ((*Pos*) 12) ) (Literal 35 (Integer_Literal 1) )) 
    (While 36 (BinOp 37 And (BinOp 38 Greater_Than_Or_Equal (Name 39 (Identifier 40 ((*Pos*) 12) )) (Literal 41 (Integer_Literal 1) ) ) (BinOp 42 Less_Than_Or_Equal (Name 43 (Identifier 44 ((*Pos*) 12) )) (Literal 45 (Integer_Literal 3) ) ) )
      (Seq 46
      (Assign 47 (Identifier 48 ((*Min*) 10) ) (Name 49 (Identifier 50 ((*Pos*) 12) ))) 
      (Seq 51
      (Assign 52 (Identifier 53 ((*I*) 13) ) (BinOp 54 Plus (Name 55 (Identifier 56 ((*Pos*) 12) )) (Literal 57 (Integer_Literal 1) ) )) 
      (Seq 58
      (While 59 (BinOp 60 And (BinOp 61 Greater_Than_Or_Equal (Name 62 (Identifier 63 ((*I*) 13) )) (BinOp 64 Plus (Name 65 (Identifier 66 ((*Pos*) 12) )) (Literal 67 (Integer_Literal 1) ) ) ) (BinOp 68 Less_Than_Or_Equal (Name 69 (Identifier 70 ((*I*) 13) )) (Literal 71 (Integer_Literal 3) ) ) )
        (Seq 72
        (If 73 (BinOp 74 Less_Than (Name 75 (IndexedComponent 76 (Identifier 77 ((*A*) 9) ) (Name 78 (Identifier 79 ((*I*) 13) )) )) (Name 80 (IndexedComponent 81 (Identifier 82 ((*A*) 9) ) (Name 83 (Identifier 84 ((*Min*) 10) )) )) )
          (Assign 85 (Identifier 86 ((*Min*) 10) ) (Name 87 (Identifier 88 ((*I*) 13) )))
          Null
        ) 
        (Assign 89 (Identifier 90 ((*I*) 13) ) (BinOp 91 Plus (Name 92 (Identifier 93 ((*I*) 13) )) (Literal 94 (Integer_Literal 1) ) )))
      ) 
      (Seq 95
      (If 96 (BinOp 97 Not_Equal (Name 98 (Identifier 99 ((*Pos*) 12) )) (Name 100 (Identifier 101 ((*Min*) 10) )) )
        (Seq 102
        (Assign 103 (Identifier 104 ((*Temp*) 11) ) (Name 105 (IndexedComponent 106 (Identifier 107 ((*A*) 9) ) (Name 108 (Identifier 109 ((*Pos*) 12) )) ))) 
        (Seq 110
        (Assign 111 (IndexedComponent 112 (Identifier 113 ((*A*) 9) ) (Name 114 (Identifier 115 ((*Pos*) 12) )) ) (Name 116 (IndexedComponent 117 (Identifier 118 ((*A*) 9) ) (Name 119 (Identifier 120 ((*Min*) 10) )) ))) 
        (Assign 121 (IndexedComponent 122 (Identifier 123 ((*A*) 9) ) (Name 124 (Identifier 125 ((*Min*) 10) )) ) (Name 126 (Identifier 127 ((*Temp*) 11) )))))
        Null
      ) 
      (Assign 128 (Identifier 129 ((*Pos*) 12) ) (BinOp 130 Plus (Name 131 (Identifier 132 ((*Pos*) 12) )) (Literal 133 (Integer_Literal 1) ) ))))))
    ))
))) :: (((*Dummy*) 1), (0, (mkprocBodyDecl 10
  (* = = = Procedure Name = = = *)
  ((*Dummy*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 11 ((*X*) 5) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 12 (Identifier 13 ((*X*) 5) ) (BinOp 14 Plus (Name 15 (Identifier 16 ((*X*) 5) )) (Literal 17 (Integer_Literal 1) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Type*) 3), (SubtypeDecl 4 ((*Index_Type*) 3) Integer (Range 1 3))) :: (((*Vector*) 4), (ArrayTypeDecl 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, Integer) :: (101, Integer) :: (83, Integer) :: (119, Integer) :: (104, Integer) :: (131, Integer) :: (122, Integer) :: (77, (Array_Type ((*Vector*) 4))) :: (86, Integer) :: (113, (Array_Type ((*Vector*) 4))) :: (50, Integer) :: (41, Integer) :: (68, Boolean) :: (53, Integer) :: (62, Integer) :: (44, Integer) :: (17, Integer) :: (35, Integer) :: (125, Integer) :: (80, Integer) :: (116, Integer) :: (98, Integer) :: (71, Integer) :: (107, (Array_Type ((*Vector*) 4))) :: (74, Boolean) :: (56, Integer) :: (38, Boolean) :: (65, Integer) :: (14, Integer) :: (124, Integer) :: (133, Integer) :: (106, Integer) :: (115, Integer) :: (127, Integer) :: (118, (Array_Type ((*Vector*) 4))) :: (100, Integer) :: (109, Integer) :: (91, Integer) :: (82, (Array_Type ((*Vector*) 4))) :: (55, Integer) :: (64, Integer) :: (94, Integer) :: (67, Integer) :: (49, Integer) :: (40, Integer) :: (130, Integer) :: (13, Integer) :: (76, Integer) :: (112, Integer) :: (97, Boolean) :: (16, Integer) :: (79, Integer) :: (88, Integer) :: (43, Integer) :: (70, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Boolean) :: (129, Integer) :: (120, Integer) :: (60, Boolean) :: (87, Integer) :: (132, Integer) :: (105, Integer) :: (123, (Array_Type ((*Vector*) 4))) :: (114, Integer) :: (69, Integer) :: (78, Integer) :: (99, Integer) :: (90, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (126, Integer) :: (81, Integer) :: (108, Integer) :: (117, Integer) :: (57, Integer) :: (48, Integer) :: (84, Integer) :: (93, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (101, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (83, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (119, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (104, (sloc (*Line*)34 (*Col*)10 (*EndLine*)34 (*EndCol*)13)) :: (131, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (122, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)15)) :: (77, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)13)) :: (86, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)14)) :: (113, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (50, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (41, (sloc (*Line*)23 (*Col*)19 (*EndLine*)23 (*EndCol*)19)) :: (68, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)37)) :: (53, (sloc (*Line*)25 (*Col*)8 (*EndLine*)25 (*EndCol*)8)) :: (62, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (44, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (17, (sloc (*Line*)11 (*Col*)16 (*EndLine*)11 (*EndCol*)16)) :: (35, (sloc (*Line*)22 (*Col*)13 (*EndLine*)22 (*EndCol*)13)) :: (125, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (80, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (116, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (98, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (71, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (107, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)18)) :: (74, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)25)) :: (56, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (38, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)19)) :: (65, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)16)) :: (124, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (133, (sloc (*Line*)39 (*Col*)21 (*EndLine*)39 (*EndCol*)21)) :: (106, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (115, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (127, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (118, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)20)) :: (100, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (109, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (91, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)19)) :: (82, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)20)) :: (55, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (64, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)26)) :: (94, (sloc (*Line*)30 (*Col*)19 (*EndLine*)30 (*EndCol*)19)) :: (67, (sloc (*Line*)26 (*Col*)26 (*EndLine*)26 (*EndCol*)26)) :: (49, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (40, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (130, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)21)) :: (13, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (76, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (112, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)15)) :: (97, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)20)) :: (16, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (79, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (88, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (43, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (70, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (34, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)8)) :: (61, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)26)) :: (37, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)32)) :: (129, (sloc (*Line*)39 (*Col*)8 (*EndLine*)39 (*EndCol*)10)) :: (120, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (60, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)37)) :: (87, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (132, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (105, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (123, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)10)) :: (114, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (69, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (78, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (99, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (90, (sloc (*Line*)30 (*Col*)10 (*EndLine*)30 (*EndCol*)10)) :: (63, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (54, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)19)) :: (45, (sloc (*Line*)23 (*Col*)32 (*EndLine*)23 (*EndCol*)32)) :: (126, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (81, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (108, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (117, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (57, (sloc (*Line*)25 (*Col*)19 (*EndLine*)25 (*EndCol*)19)) :: (48, (sloc (*Line*)24 (*Col*)8 (*EndLine*)24 (*EndCol*)10)) :: (84, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (93, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (75, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (39, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (66, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (15, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (42, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)32)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("Temp", "ada://variable/Sort-1:9/SelectionSort+14:14/Temp+18:6")) :: (5, ("X", "ada://parameter/Sort-1:9/Dummy-3:14/X-3:20")) :: (13, ("I", "ada://variable/Sort-1:9/SelectionSort+14:14/I+20:6")) :: (10, ("Min", "ada://variable/Sort-1:9/SelectionSort+14:14/Min+17:6")) :: (9, ("A", "ada://parameter/Sort-1:9/SelectionSort+14:14/A+14:29")) :: (12, ("Pos", "ada://variable/Sort-1:9/SelectionSort+14:14/Pos+19:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((8, ("SelectionSort", "ada://procedure_body/Sort-1:9/SelectionSort+14:14")) :: (1, ("Dummy", "ada://procedure_body/Sort-1:9/Dummy-3:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("Sort", "ada://package_body/Sort-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("Vector", "ada://ordinary_type/Sort-1:9/Vector+4:9")) :: (3, ("Index_Type", "ada://subtype/Sort-1:9/Index_Type+3:12")) :: nil)
))
).

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 2
(TypeDeclRT 3 (SubtypeDeclRT 4 ((*Index_Type*) 3) Integer (RangeRT 1 3))) 
(SeqDeclRT 5
(TypeDeclRT 6 (ArrayTypeDeclRT 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) 
(SeqDeclRT 8
(ProcBodyDeclRT 9 
  (mkprocBodyDeclRT 10
    (* = = = Procedure Name = = = *)
    ((*Dummy*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 11 ((*X*) 5) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 12 (IdentifierRT 13 ((*X*) 5) (nil)) (BinOpRT 14 Plus (NameRT 15 (IdentifierRT 16 ((*X*) 5) (nil))) (LiteralRT 17 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
  )
) 
(ProcBodyDeclRT 18 
  (mkprocBodyDeclRT 19
    (* = = = Procedure Name = = = *)
    ((*SelectionSort*) 8)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 21
  (ObjDeclRT 22 (mkobjDeclRT 23 ((*Min*) 10) Integer None)) 
  (SeqDeclRT 24
  (ObjDeclRT 25 (mkobjDeclRT 26 ((*Temp*) 11) Integer None)) 
  (SeqDeclRT 27
  (ObjDeclRT 28 (mkobjDeclRT 29 ((*Pos*) 12) Integer None)) 
  (ObjDeclRT 30 (mkobjDeclRT 31 ((*I*) 13) Integer None))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 32
      (AssignRT 33 (IdentifierRT 34 ((*Pos*) 12) (nil)) (LiteralRT 35 (Integer_Literal 1) (nil) nil)) 
      (WhileRT 36 (BinOpRT 37 And (BinOpRT 38 Greater_Than_Or_Equal (NameRT 39 (IdentifierRT 40 ((*Pos*) 12) (nil))) (LiteralRT 41 (Integer_Literal 1) (nil) nil) (nil) nil) (BinOpRT 42 Less_Than_Or_Equal (NameRT 43 (IdentifierRT 44 ((*Pos*) 12) (nil))) (LiteralRT 45 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
        (SeqRT 46
        (AssignRT 47 (IdentifierRT 48 ((*Min*) 10) (nil)) (NameRT 49 (IdentifierRT 50 ((*Pos*) 12) (nil)))) 
        (SeqRT 51
        (AssignRT 52 (IdentifierRT 53 ((*I*) 13) (nil)) (BinOpRT 54 Plus (NameRT 55 (IdentifierRT 56 ((*Pos*) 12) (nil))) (LiteralRT 57 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
        (SeqRT 58
        (WhileRT 59 (BinOpRT 60 And (BinOpRT 61 Greater_Than_Or_Equal (NameRT 62 (IdentifierRT 63 ((*I*) 13) (nil))) (BinOpRT 64 Plus (NameRT 65 (IdentifierRT 66 ((*Pos*) 12) (nil))) (LiteralRT 67 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil) (nil) nil) (BinOpRT 68 Less_Than_Or_Equal (NameRT 69 (IdentifierRT 70 ((*I*) 13) (nil))) (LiteralRT 71 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
          (SeqRT 72
          (IfRT 73 (BinOpRT 74 Less_Than (NameRT 75 (IndexedComponentRT 76 (IdentifierRT 77 ((*A*) 9) (nil)) (NameRT 78 (IdentifierRT 79 ((*I*) 13) (RangeCheck :: nil))) (nil))) (NameRT 80 (IndexedComponentRT 81 (IdentifierRT 82 ((*A*) 9) (nil)) (NameRT 83 (IdentifierRT 84 ((*Min*) 10) (RangeCheck :: nil))) (nil))) (nil) nil)
            (AssignRT 85 (IdentifierRT 86 ((*Min*) 10) (nil)) (NameRT 87 (IdentifierRT 88 ((*I*) 13) (nil))))
            NullRT
          ) 
          (AssignRT 89 (IdentifierRT 90 ((*I*) 13) (nil)) (BinOpRT 91 Plus (NameRT 92 (IdentifierRT 93 ((*I*) 13) (nil))) (LiteralRT 94 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
        ) 
        (SeqRT 95
        (IfRT 96 (BinOpRT 97 Not_Equal (NameRT 98 (IdentifierRT 99 ((*Pos*) 12) (nil))) (NameRT 100 (IdentifierRT 101 ((*Min*) 10) (nil))) (nil) nil)
          (SeqRT 102
          (AssignRT 103 (IdentifierRT 104 ((*Temp*) 11) (nil)) (NameRT 105 (IndexedComponentRT 106 (IdentifierRT 107 ((*A*) 9) (nil)) (NameRT 108 (IdentifierRT 109 ((*Pos*) 12) (RangeCheck :: nil))) (nil)))) 
          (SeqRT 110
          (AssignRT 111 (IndexedComponentRT 112 (IdentifierRT 113 ((*A*) 9) (nil)) (NameRT 114 (IdentifierRT 115 ((*Pos*) 12) (RangeCheck :: nil))) (nil)) (NameRT 116 (IndexedComponentRT 117 (IdentifierRT 118 ((*A*) 9) (nil)) (NameRT 119 (IdentifierRT 120 ((*Min*) 10) (RangeCheck :: nil))) (nil)))) 
          (AssignRT 121 (IndexedComponentRT 122 (IdentifierRT 123 ((*A*) 9) (nil)) (NameRT 124 (IdentifierRT 125 ((*Min*) 10) (RangeCheck :: nil))) (nil)) (NameRT 126 (IdentifierRT 127 ((*Temp*) 11) (nil))))))
          NullRT
        ) 
        (AssignRT 128 (IdentifierRT 129 ((*Pos*) 12) (nil)) (BinOpRT 130 Plus (NameRT 131 (IdentifierRT 132 ((*Pos*) 12) (nil))) (LiteralRT 133 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))))))
      ))
  )
)))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X*) 5), (In_Out, Integer)) :: (((*Pos*) 12), (In_Out, Integer)) :: (((*A*) 9), (In_Out, (Array_Type ((*Vector*) 4)))) :: (((*I*) 13), (In_Out, Integer)) :: (((*Temp*) 11), (In_Out, Integer)) :: (((*Min*) 10), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*SelectionSort*) 8), (0, (mkprocBodyDeclRT 19
  (* = = = Procedure Name = = = *)
  ((*SelectionSort*) 8)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 20 ((*A*) 9) (Array_Type ((*Vector*) 4)) In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 21
(ObjDeclRT 22 (mkobjDeclRT 23 ((*Min*) 10) Integer None)) 
(SeqDeclRT 24
(ObjDeclRT 25 (mkobjDeclRT 26 ((*Temp*) 11) Integer None)) 
(SeqDeclRT 27
(ObjDeclRT 28 (mkobjDeclRT 29 ((*Pos*) 12) Integer None)) 
(ObjDeclRT 30 (mkobjDeclRT 31 ((*I*) 13) Integer None))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 32
    (AssignRT 33 (IdentifierRT 34 ((*Pos*) 12) (nil)) (LiteralRT 35 (Integer_Literal 1) (nil) nil)) 
    (WhileRT 36 (BinOpRT 37 And (BinOpRT 38 Greater_Than_Or_Equal (NameRT 39 (IdentifierRT 40 ((*Pos*) 12) (nil))) (LiteralRT 41 (Integer_Literal 1) (nil) nil) (nil) nil) (BinOpRT 42 Less_Than_Or_Equal (NameRT 43 (IdentifierRT 44 ((*Pos*) 12) (nil))) (LiteralRT 45 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
      (SeqRT 46
      (AssignRT 47 (IdentifierRT 48 ((*Min*) 10) (nil)) (NameRT 49 (IdentifierRT 50 ((*Pos*) 12) (nil)))) 
      (SeqRT 51
      (AssignRT 52 (IdentifierRT 53 ((*I*) 13) (nil)) (BinOpRT 54 Plus (NameRT 55 (IdentifierRT 56 ((*Pos*) 12) (nil))) (LiteralRT 57 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)) 
      (SeqRT 58
      (WhileRT 59 (BinOpRT 60 And (BinOpRT 61 Greater_Than_Or_Equal (NameRT 62 (IdentifierRT 63 ((*I*) 13) (nil))) (BinOpRT 64 Plus (NameRT 65 (IdentifierRT 66 ((*Pos*) 12) (nil))) (LiteralRT 67 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil) (nil) nil) (BinOpRT 68 Less_Than_Or_Equal (NameRT 69 (IdentifierRT 70 ((*I*) 13) (nil))) (LiteralRT 71 (Integer_Literal 3) (nil) nil) (nil) nil) (nil) nil)
        (SeqRT 72
        (IfRT 73 (BinOpRT 74 Less_Than (NameRT 75 (IndexedComponentRT 76 (IdentifierRT 77 ((*A*) 9) (nil)) (NameRT 78 (IdentifierRT 79 ((*I*) 13) (RangeCheck :: nil))) (nil))) (NameRT 80 (IndexedComponentRT 81 (IdentifierRT 82 ((*A*) 9) (nil)) (NameRT 83 (IdentifierRT 84 ((*Min*) 10) (RangeCheck :: nil))) (nil))) (nil) nil)
          (AssignRT 85 (IdentifierRT 86 ((*Min*) 10) (nil)) (NameRT 87 (IdentifierRT 88 ((*I*) 13) (nil))))
          NullRT
        ) 
        (AssignRT 89 (IdentifierRT 90 ((*I*) 13) (nil)) (BinOpRT 91 Plus (NameRT 92 (IdentifierRT 93 ((*I*) 13) (nil))) (LiteralRT 94 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil)))
      ) 
      (SeqRT 95
      (IfRT 96 (BinOpRT 97 Not_Equal (NameRT 98 (IdentifierRT 99 ((*Pos*) 12) (nil))) (NameRT 100 (IdentifierRT 101 ((*Min*) 10) (nil))) (nil) nil)
        (SeqRT 102
        (AssignRT 103 (IdentifierRT 104 ((*Temp*) 11) (nil)) (NameRT 105 (IndexedComponentRT 106 (IdentifierRT 107 ((*A*) 9) (nil)) (NameRT 108 (IdentifierRT 109 ((*Pos*) 12) (RangeCheck :: nil))) (nil)))) 
        (SeqRT 110
        (AssignRT 111 (IndexedComponentRT 112 (IdentifierRT 113 ((*A*) 9) (nil)) (NameRT 114 (IdentifierRT 115 ((*Pos*) 12) (RangeCheck :: nil))) (nil)) (NameRT 116 (IndexedComponentRT 117 (IdentifierRT 118 ((*A*) 9) (nil)) (NameRT 119 (IdentifierRT 120 ((*Min*) 10) (RangeCheck :: nil))) (nil)))) 
        (AssignRT 121 (IndexedComponentRT 122 (IdentifierRT 123 ((*A*) 9) (nil)) (NameRT 124 (IdentifierRT 125 ((*Min*) 10) (RangeCheck :: nil))) (nil)) (NameRT 126 (IdentifierRT 127 ((*Temp*) 11) (nil))))))
        NullRT
      ) 
      (AssignRT 128 (IdentifierRT 129 ((*Pos*) 12) (nil)) (BinOpRT 130 Plus (NameRT 131 (IdentifierRT 132 ((*Pos*) 12) (nil))) (LiteralRT 133 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))))))
    ))
))) :: (((*Dummy*) 1), (0, (mkprocBodyDeclRT 10
  (* = = = Procedure Name = = = *)
  ((*Dummy*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 11 ((*X*) 5) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 12 (IdentifierRT 13 ((*X*) 5) (nil)) (BinOpRT 14 Plus (NameRT 15 (IdentifierRT 16 ((*X*) 5) (nil))) (LiteralRT 17 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Index_Type*) 3), (SubtypeDeclRT 4 ((*Index_Type*) 3) Integer (RangeRT 1 3))) :: (((*Vector*) 4), (ArrayTypeDeclRT 7 ((*Vector*) 4) ((*index subtype mark*) (Subtype ((*Index_Type*) 3))) ((*component type*) Integer))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, Integer) :: (101, Integer) :: (83, Integer) :: (119, Integer) :: (104, Integer) :: (131, Integer) :: (122, Integer) :: (77, (Array_Type ((*Vector*) 4))) :: (86, Integer) :: (113, (Array_Type ((*Vector*) 4))) :: (50, Integer) :: (41, Integer) :: (68, Boolean) :: (53, Integer) :: (62, Integer) :: (44, Integer) :: (17, Integer) :: (35, Integer) :: (125, Integer) :: (80, Integer) :: (116, Integer) :: (98, Integer) :: (71, Integer) :: (107, (Array_Type ((*Vector*) 4))) :: (74, Boolean) :: (56, Integer) :: (38, Boolean) :: (65, Integer) :: (14, Integer) :: (124, Integer) :: (133, Integer) :: (106, Integer) :: (115, Integer) :: (127, Integer) :: (118, (Array_Type ((*Vector*) 4))) :: (100, Integer) :: (109, Integer) :: (91, Integer) :: (82, (Array_Type ((*Vector*) 4))) :: (55, Integer) :: (64, Integer) :: (94, Integer) :: (67, Integer) :: (49, Integer) :: (40, Integer) :: (130, Integer) :: (13, Integer) :: (76, Integer) :: (112, Integer) :: (97, Boolean) :: (16, Integer) :: (79, Integer) :: (88, Integer) :: (43, Integer) :: (70, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Boolean) :: (129, Integer) :: (120, Integer) :: (60, Boolean) :: (87, Integer) :: (132, Integer) :: (105, Integer) :: (123, (Array_Type ((*Vector*) 4))) :: (114, Integer) :: (69, Integer) :: (78, Integer) :: (99, Integer) :: (90, Integer) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (126, Integer) :: (81, Integer) :: (108, Integer) :: (117, Integer) :: (57, Integer) :: (48, Integer) :: (84, Integer) :: (93, Integer) :: (75, Integer) :: (39, Integer) :: (66, Integer) :: (15, Integer) :: (42, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (101, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (83, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (119, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (104, (sloc (*Line*)34 (*Col*)10 (*EndLine*)34 (*EndCol*)13)) :: (131, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (122, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)15)) :: (77, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)13)) :: (86, (sloc (*Line*)28 (*Col*)12 (*EndLine*)28 (*EndCol*)14)) :: (113, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)10)) :: (50, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (41, (sloc (*Line*)23 (*Col*)19 (*EndLine*)23 (*EndCol*)19)) :: (68, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)37)) :: (53, (sloc (*Line*)25 (*Col*)8 (*EndLine*)25 (*EndCol*)8)) :: (62, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (44, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (17, (sloc (*Line*)11 (*Col*)16 (*EndLine*)11 (*EndCol*)16)) :: (35, (sloc (*Line*)22 (*Col*)13 (*EndLine*)22 (*EndCol*)13)) :: (125, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (80, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (116, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (98, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (71, (sloc (*Line*)26 (*Col*)37 (*EndLine*)26 (*EndCol*)37)) :: (107, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)18)) :: (74, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)25)) :: (56, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (38, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)19)) :: (65, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (14, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)16)) :: (124, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)14)) :: (133, (sloc (*Line*)39 (*Col*)21 (*EndLine*)39 (*EndCol*)21)) :: (106, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (115, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (127, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (118, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)20)) :: (100, (sloc (*Line*)33 (*Col*)18 (*EndLine*)33 (*EndCol*)20)) :: (109, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (91, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)19)) :: (82, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)20)) :: (55, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)15)) :: (64, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)26)) :: (94, (sloc (*Line*)30 (*Col*)19 (*EndLine*)30 (*EndCol*)19)) :: (67, (sloc (*Line*)26 (*Col*)26 (*EndLine*)26 (*EndCol*)26)) :: (49, (sloc (*Line*)24 (*Col*)15 (*EndLine*)24 (*EndCol*)17)) :: (40, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (130, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)21)) :: (13, (sloc (*Line*)11 (*Col*)7 (*EndLine*)11 (*EndCol*)7)) :: (76, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (112, (sloc (*Line*)35 (*Col*)10 (*EndLine*)35 (*EndCol*)15)) :: (97, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)20)) :: (16, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (79, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (88, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (43, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)27)) :: (70, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (34, (sloc (*Line*)22 (*Col*)6 (*EndLine*)22 (*EndCol*)8)) :: (61, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)26)) :: (37, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)32)) :: (129, (sloc (*Line*)39 (*Col*)8 (*EndLine*)39 (*EndCol*)10)) :: (120, (sloc (*Line*)35 (*Col*)22 (*EndLine*)35 (*EndCol*)24)) :: (60, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)37)) :: (87, (sloc (*Line*)28 (*Col*)19 (*EndLine*)28 (*EndCol*)19)) :: (132, (sloc (*Line*)39 (*Col*)15 (*EndLine*)39 (*EndCol*)17)) :: (105, (sloc (*Line*)34 (*Col*)18 (*EndLine*)34 (*EndCol*)23)) :: (123, (sloc (*Line*)36 (*Col*)10 (*EndLine*)36 (*EndCol*)10)) :: (114, (sloc (*Line*)35 (*Col*)12 (*EndLine*)35 (*EndCol*)14)) :: (69, (sloc (*Line*)26 (*Col*)32 (*EndLine*)26 (*EndCol*)32)) :: (78, (sloc (*Line*)27 (*Col*)15 (*EndLine*)27 (*EndCol*)15)) :: (99, (sloc (*Line*)33 (*Col*)11 (*EndLine*)33 (*EndCol*)13)) :: (90, (sloc (*Line*)30 (*Col*)10 (*EndLine*)30 (*EndCol*)10)) :: (63, (sloc (*Line*)26 (*Col*)15 (*EndLine*)26 (*EndCol*)15)) :: (54, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)19)) :: (45, (sloc (*Line*)23 (*Col*)32 (*EndLine*)23 (*EndCol*)32)) :: (126, (sloc (*Line*)36 (*Col*)20 (*EndLine*)36 (*EndCol*)23)) :: (81, (sloc (*Line*)27 (*Col*)20 (*EndLine*)27 (*EndCol*)25)) :: (108, (sloc (*Line*)34 (*Col*)20 (*EndLine*)34 (*EndCol*)22)) :: (117, (sloc (*Line*)35 (*Col*)20 (*EndLine*)35 (*EndCol*)25)) :: (57, (sloc (*Line*)25 (*Col*)19 (*EndLine*)25 (*EndCol*)19)) :: (48, (sloc (*Line*)24 (*Col*)8 (*EndLine*)24 (*EndCol*)10)) :: (84, (sloc (*Line*)27 (*Col*)22 (*EndLine*)27 (*EndCol*)24)) :: (93, (sloc (*Line*)30 (*Col*)15 (*EndLine*)30 (*EndCol*)15)) :: (75, (sloc (*Line*)27 (*Col*)13 (*EndLine*)27 (*EndCol*)16)) :: (39, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)14)) :: (66, (sloc (*Line*)26 (*Col*)20 (*EndLine*)26 (*EndCol*)22)) :: (15, (sloc (*Line*)11 (*Col*)12 (*EndLine*)11 (*EndCol*)12)) :: (42, (sloc (*Line*)23 (*Col*)25 (*EndLine*)23 (*EndCol*)32)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((11, ("Temp", "ada://variable/Sort-1:9/SelectionSort+14:14/Temp+18:6")) :: (5, ("X", "ada://parameter/Sort-1:9/Dummy-3:14/X-3:20")) :: (13, ("I", "ada://variable/Sort-1:9/SelectionSort+14:14/I+20:6")) :: (10, ("Min", "ada://variable/Sort-1:9/SelectionSort+14:14/Min+17:6")) :: (9, ("A", "ada://parameter/Sort-1:9/SelectionSort+14:14/A+14:29")) :: (12, ("Pos", "ada://variable/Sort-1:9/SelectionSort+14:14/Pos+19:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((8, ("SelectionSort", "ada://procedure_body/Sort-1:9/SelectionSort+14:14")) :: (1, ("Dummy", "ada://procedure_body/Sort-1:9/Dummy-3:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((2, ("Sort", "ada://package_body/Sort-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((4, ("Vector", "ada://ordinary_type/Sort-1:9/Vector+4:9")) :: (3, ("Index_Type", "ada://subtype/Sort-1:9/Index_Type+3:12")) :: nil)
))
).

