Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (IntegerTypeDecl 4 ((*T*) 1) (Range 0 10))) 
(SeqDecl 5
(TypeDecl 6 (SubtypeDecl 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (Range 1 10))) 
(SeqDecl 8
(TypeDecl 9 (ArrayTypeDecl 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) 
NullDecl (* Undefined Declarations ! *)))) 
(ProcBodyDecl 11 
  (mkprocBodyDecl 12
    (* = = = Procedure Name = = = *)
    ((*Search*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
    (mkparamSpec 14 ((*I*) 7) Integer In) :: 
    (mkparamSpec 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 16
  (ObjDecl 17 (mkobjDecl 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
  (SeqDecl 19
  (ObjDecl 20 (mkobjDecl 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
  (ObjDecl 22 (mkobjDecl 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
    (* = = = Procedure Body = = = *)
      (Seq 24
      (Assign 25 (Identifier 26 ((*Left*) 9) ) (Literal 27 (Integer_Literal 1) )) 
      (Seq 28
      (Assign 29 (Identifier 30 ((*Right*) 10) ) (Literal 31 (Integer_Literal 10) )) 
      (Seq 32
      (Assign 33 (Identifier 34 ((*Result*) 8) ) (Literal 35 (Integer_Literal 0) )) 
      (Seq 36
      (If 37 (BinOp 38 Or (BinOp 39 Greater_Than (Name 40 (IndexedComponent 41 (Identifier 42 ((*A*) 6) ) (BinOp 43 Plus (Name 44 (Identifier 45 ((*Left*) 9) )) (Literal 46 (Integer_Literal 1) ) ) )) (Name 47 (Identifier 48 ((*I*) 7) )) ) (BinOp 49 Less_Than (Name 50 (IndexedComponent 51 (Identifier 52 ((*A*) 6) ) (Name 53 (Identifier 54 ((*Right*) 10) )) )) (Name 55 (Identifier 56 ((*I*) 7) )) ) )
        (Assign 57 (Identifier 58 ((*Result*) 8) ) (Literal 59 (Integer_Literal 0) ))
        Null
      ) 
      (While 60 (BinOp 61 Less_Than_Or_Equal (Name 62 (Identifier 63 ((*Left*) 9) )) (Name 64 (Identifier 65 ((*Right*) 10) )) )
        (Seq 66
        (Assign 67 (Identifier 68 ((*Med*) 11) ) (BinOp 69 Plus (Name 70 (Identifier 71 ((*Left*) 9) )) (BinOp 72 Divide (BinOp 73 Minus (Name 74 (Identifier 75 ((*Right*) 10) )) (Name 76 (Identifier 77 ((*Left*) 9) )) ) (Literal 78 (Integer_Literal 2) ) ) )) 
        (If 79 (BinOp 80 Less_Than (Name 81 (IndexedComponent 82 (Identifier 83 ((*A*) 6) ) (Name 84 (Identifier 85 ((*Med*) 11) )) )) (Name 86 (Identifier 87 ((*I*) 7) )) )
          (Assign 88 (Identifier 89 ((*Left*) 9) ) (BinOp 90 Plus (Name 91 (Identifier 92 ((*Med*) 11) )) (Literal 93 (Integer_Literal 1) ) ))
          (If 94 (BinOp 95 Greater_Than (Name 96 (IndexedComponent 97 (Identifier 98 ((*A*) 6) ) (Name 99 (Identifier 100 ((*Med*) 11) )) )) (Name 101 (Identifier 102 ((*I*) 7) )) )
            (Assign 103 (Identifier 104 ((*Right*) 10) ) (BinOp 105 Minus (Name 106 (Identifier 107 ((*Med*) 11) )) (Literal 108 (Integer_Literal 1) ) ))
            (Assign 109 (Identifier 110 ((*Result*) 8) ) (Name 111 (Identifier 112 ((*Med*) 11) )))
          )
        ))
      )))))
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
  ((((*Result*) 8), (Out, (Integer_Type ((*T*) 1)))) :: (((*Left*) 9), (In_Out, (Subtype ((*U*) 2)))) :: (((*I*) 7), (In, Integer)) :: (((*A*) 6), (In, (Array_Type ((*Ar*) 3)))) :: (((*Right*) 10), (In_Out, (Subtype ((*U*) 2)))) :: (((*Med*) 11), (In_Out, (Subtype ((*U*) 2)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 4), (0, (mkprocBodyDecl 12
  (* = = = Procedure Name = = = *)
  ((*Search*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
  (mkparamSpec 14 ((*I*) 7) Integer In) :: 
  (mkparamSpec 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 16
(ObjDecl 17 (mkobjDecl 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
(SeqDecl 19
(ObjDecl 20 (mkobjDecl 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
(ObjDecl 22 (mkobjDecl 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
  (* = = = Procedure Body = = = *)
    (Seq 24
    (Assign 25 (Identifier 26 ((*Left*) 9) ) (Literal 27 (Integer_Literal 1) )) 
    (Seq 28
    (Assign 29 (Identifier 30 ((*Right*) 10) ) (Literal 31 (Integer_Literal 10) )) 
    (Seq 32
    (Assign 33 (Identifier 34 ((*Result*) 8) ) (Literal 35 (Integer_Literal 0) )) 
    (Seq 36
    (If 37 (BinOp 38 Or (BinOp 39 Greater_Than (Name 40 (IndexedComponent 41 (Identifier 42 ((*A*) 6) ) (BinOp 43 Plus (Name 44 (Identifier 45 ((*Left*) 9) )) (Literal 46 (Integer_Literal 1) ) ) )) (Name 47 (Identifier 48 ((*I*) 7) )) ) (BinOp 49 Less_Than (Name 50 (IndexedComponent 51 (Identifier 52 ((*A*) 6) ) (Name 53 (Identifier 54 ((*Right*) 10) )) )) (Name 55 (Identifier 56 ((*I*) 7) )) ) )
      (Assign 57 (Identifier 58 ((*Result*) 8) ) (Literal 59 (Integer_Literal 0) ))
      Null
    ) 
    (While 60 (BinOp 61 Less_Than_Or_Equal (Name 62 (Identifier 63 ((*Left*) 9) )) (Name 64 (Identifier 65 ((*Right*) 10) )) )
      (Seq 66
      (Assign 67 (Identifier 68 ((*Med*) 11) ) (BinOp 69 Plus (Name 70 (Identifier 71 ((*Left*) 9) )) (BinOp 72 Divide (BinOp 73 Minus (Name 74 (Identifier 75 ((*Right*) 10) )) (Name 76 (Identifier 77 ((*Left*) 9) )) ) (Literal 78 (Integer_Literal 2) ) ) )) 
      (If 79 (BinOp 80 Less_Than (Name 81 (IndexedComponent 82 (Identifier 83 ((*A*) 6) ) (Name 84 (Identifier 85 ((*Med*) 11) )) )) (Name 86 (Identifier 87 ((*I*) 7) )) )
        (Assign 88 (Identifier 89 ((*Left*) 9) ) (BinOp 90 Plus (Name 91 (Identifier 92 ((*Med*) 11) )) (Literal 93 (Integer_Literal 1) ) ))
        (If 94 (BinOp 95 Greater_Than (Name 96 (IndexedComponent 97 (Identifier 98 ((*A*) 6) ) (Name 99 (Identifier 100 ((*Med*) 11) )) )) (Name 101 (Identifier 102 ((*I*) 7) )) )
          (Assign 103 (Identifier 104 ((*Right*) 10) ) (BinOp 105 Minus (Name 106 (Identifier 107 ((*Med*) 11) )) (Literal 108 (Integer_Literal 1) ) ))
          (Assign 109 (Identifier 110 ((*Result*) 8) ) (Name 111 (Identifier 112 ((*Med*) 11) )))
        )
      ))
    )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 3), (ArrayTypeDecl 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) :: (((*U*) 2), (SubtypeDecl 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (Range 1 10))) :: (((*T*) 1), (IntegerTypeDecl 4 ((*T*) 1) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, (Subtype ((*U*) 2))) :: (101, Integer) :: (83, (Array_Type ((*Ar*) 3))) :: (110, (Integer_Type ((*T*) 1))) :: (104, (Subtype ((*U*) 2))) :: (95, Boolean) :: (86, Integer) :: (77, (Subtype ((*U*) 2))) :: (50, Integer) :: (41, Integer) :: (59, Integer) :: (68, (Subtype ((*U*) 2))) :: (53, (Subtype ((*U*) 2))) :: (62, (Subtype ((*U*) 2))) :: (35, Integer) :: (44, (Subtype ((*U*) 2))) :: (26, (Subtype ((*U*) 2))) :: (89, (Subtype ((*U*) 2))) :: (80, Boolean) :: (98, (Array_Type ((*Ar*) 3))) :: (71, (Subtype ((*U*) 2))) :: (107, (Subtype ((*U*) 2))) :: (74, (Subtype ((*U*) 2))) :: (56, Integer) :: (47, Integer) :: (38, Boolean) :: (65, (Subtype ((*U*) 2))) :: (106, (Subtype ((*U*) 2))) :: (46, Integer) :: (100, (Subtype ((*U*) 2))) :: (91, (Subtype ((*U*) 2))) :: (82, Integer) :: (55, Integer) :: (64, (Subtype ((*U*) 2))) :: (73, (Integer_Type ((*T*) 1))) :: (58, (Integer_Type ((*T*) 1))) :: (85, (Subtype ((*U*) 2))) :: (49, Boolean) :: (40, Integer) :: (31, Integer) :: (76, (Subtype ((*U*) 2))) :: (112, (Subtype ((*U*) 2))) :: (97, Integer) :: (52, (Array_Type ((*Ar*) 3))) :: (43, (Integer_Type ((*T*) 1))) :: (70, (Subtype ((*U*) 2))) :: (34, (Integer_Type ((*T*) 1))) :: (61, Boolean) :: (87, Integer) :: (96, Integer) :: (105, (Integer_Type ((*T*) 1))) :: (69, (Integer_Type ((*T*) 1))) :: (78, Integer) :: (99, (Subtype ((*U*) 2))) :: (90, (Integer_Type ((*T*) 1))) :: (63, (Subtype ((*U*) 2))) :: (54, (Subtype ((*U*) 2))) :: (45, (Subtype ((*U*) 2))) :: (72, (Integer_Type ((*T*) 1))) :: (81, Integer) :: (108, Integer) :: (27, Integer) :: (48, Integer) :: (84, (Subtype ((*U*) 2))) :: (102, Integer) :: (93, Integer) :: (75, (Subtype ((*U*) 2))) :: (30, (Subtype ((*U*) 2))) :: (111, (Subtype ((*U*) 2))) :: (39, Boolean) :: (42, (Array_Type ((*Ar*) 3))) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (101, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (83, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)13)) :: (110, (sloc (*Line*)34 (*Col*)15 (*EndLine*)34 (*EndCol*)20)) :: (104, (sloc (*Line*)32 (*Col*)15 (*EndLine*)32 (*EndCol*)19)) :: (95, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)24)) :: (86, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (77, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (50, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: (41, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (59, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)20)) :: (68, (sloc (*Line*)26 (*Col*)10 (*EndLine*)26 (*EndCol*)12)) :: (53, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (62, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (35, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (44, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)10)) :: (89, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)16)) :: (80, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)23)) :: (98, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)14)) :: (71, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (107, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (74, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (56, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (47, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (38, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)45)) :: (65, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (106, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (46, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (100, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (91, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (82, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (55, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (64, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (73, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)36)) :: (58, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (85, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (49, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)45)) :: (40, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (31, (sloc (*Line*)17 (*Col*)16 (*EndLine*)17 (*EndCol*)17)) :: (76, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (112, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (97, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (52, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)33)) :: (43, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)18)) :: (70, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (34, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)25)) :: (87, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (96, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (105, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)30)) :: (69, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)41)) :: (78, (sloc (*Line*)26 (*Col*)41 (*EndLine*)26 (*EndCol*)41)) :: (99, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (90, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)27)) :: (63, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (54, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (45, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (72, (sloc (*Line*)26 (*Col*)24 (*EndLine*)26 (*EndCol*)41)) :: (81, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (108, (sloc (*Line*)32 (*Col*)30 (*EndLine*)32 (*EndCol*)30)) :: (27, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (48, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (84, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (102, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (93, (sloc (*Line*)29 (*Col*)27 (*EndLine*)29 (*EndCol*)27)) :: (75, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (30, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)11)) :: (111, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (39, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)23)) :: (42, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (51, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Result", "ada://parameter/Binary_Search-1:9/Search-16:14/Result-16:43")) :: (11, ("Med", "ada://variable/Binary_Search-1:9/Search-16:14/Med+14:7")) :: (7, ("I", "ada://parameter/Binary_Search-1:9/Search-16:14/I-16:30")) :: (10, ("Right", "ada://variable/Binary_Search-1:9/Search-16:14/Right+13:7")) :: (9, ("Left", "ada://variable/Binary_Search-1:9/Search-16:14/Left+12:7")) :: (6, ("A", "ada://parameter/Binary_Search-1:9/Search-16:14/A-16:22")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Search", "ada://procedure_body/Binary_Search-1:9/Search-16:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("Binary_Search", "ada://package_body/Binary_Search-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("U", "ada://subtype/Binary_Search-1:9/U-12:12")) :: (1, ("T", "ada://ordinary_type/Binary_Search-1:9/T-11:9")) :: (3, ("Ar", "ada://ordinary_type/Binary_Search-1:9/Ar-14:9")) :: nil)
))
).

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (IntegerTypeDeclRT 4 ((*T*) 1) (RangeRT 0 10))) 
(SeqDeclRT 5
(TypeDeclRT 6 (SubtypeDeclRT 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (RangeRT 1 10))) 
(SeqDeclRT 8
(TypeDeclRT 9 (ArrayTypeDeclRT 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) 
NullDeclRT (* Undefined Declarations ! *)))) 
(ProcBodyDeclRT 11 
  (mkprocBodyDeclRT 12
    (* = = = Procedure Name = = = *)
    ((*Search*) 4)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
    (mkparamSpecRT 14 ((*I*) 7) Integer In) :: 
    (mkparamSpecRT 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 16
  (ObjDeclRT 17 (mkobjDeclRT 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
  (SeqDeclRT 19
  (ObjDeclRT 20 (mkobjDeclRT 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
  (ObjDeclRT 22 (mkobjDeclRT 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
    (* = = = Procedure Body = = = *)
      (SeqRT 24
      (AssignRT 25 (IdentifierRT 26 ((*Left*) 9) (nil)) (LiteralRT 27 (Integer_Literal 1) (nil) nil)) 
      (SeqRT 28
      (AssignRT 29 (IdentifierRT 30 ((*Right*) 10) (nil)) (LiteralRT 31 (Integer_Literal 10) (nil) nil)) 
      (SeqRT 32
      (AssignRT 33 (IdentifierRT 34 ((*Result*) 8) (nil)) (LiteralRT 35 (Integer_Literal 0) (nil) nil)) 
      (SeqRT 36
      (IfRT 37 (BinOpRT 38 Or (BinOpRT 39 Greater_Than (NameRT 40 (IndexedComponentRT 41 (IdentifierRT 42 ((*A*) 6) (nil)) (BinOpRT 43 Plus (NameRT 44 (IdentifierRT 45 ((*Left*) 9) (nil))) (LiteralRT 46 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil))) (NameRT 47 (IdentifierRT 48 ((*I*) 7) (nil))) (nil) nil) (BinOpRT 49 Less_Than (NameRT 50 (IndexedComponentRT 51 (IdentifierRT 52 ((*A*) 6) (nil)) (NameRT 53 (IdentifierRT 54 ((*Right*) 10) (nil))) (nil))) (NameRT 55 (IdentifierRT 56 ((*I*) 7) (nil))) (nil) nil) (nil) nil)
        (AssignRT 57 (IdentifierRT 58 ((*Result*) 8) (nil)) (LiteralRT 59 (Integer_Literal 0) (nil) nil))
        NullRT
      ) 
      (WhileRT 60 (BinOpRT 61 Less_Than_Or_Equal (NameRT 62 (IdentifierRT 63 ((*Left*) 9) (nil))) (NameRT 64 (IdentifierRT 65 ((*Right*) 10) (nil))) (nil) nil)
        (SeqRT 66
        (AssignRT 67 (IdentifierRT 68 ((*Med*) 11) (nil)) (BinOpRT 69 Plus (NameRT 70 (IdentifierRT 71 ((*Left*) 9) (nil))) (BinOpRT 72 Divide (BinOpRT 73 Minus (NameRT 74 (IdentifierRT 75 ((*Right*) 10) (nil))) (NameRT 76 (IdentifierRT 77 ((*Left*) 9) (nil))) (nil) nil) (LiteralRT 78 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil) (RangeCheck :: nil) nil)) 
        (IfRT 79 (BinOpRT 80 Less_Than (NameRT 81 (IndexedComponentRT 82 (IdentifierRT 83 ((*A*) 6) (nil)) (NameRT 84 (IdentifierRT 85 ((*Med*) 11) (nil))) (nil))) (NameRT 86 (IdentifierRT 87 ((*I*) 7) (nil))) (nil) nil)
          (AssignRT 88 (IdentifierRT 89 ((*Left*) 9) (nil)) (BinOpRT 90 Plus (NameRT 91 (IdentifierRT 92 ((*Med*) 11) (nil))) (LiteralRT 93 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
          (IfRT 94 (BinOpRT 95 Greater_Than (NameRT 96 (IndexedComponentRT 97 (IdentifierRT 98 ((*A*) 6) (nil)) (NameRT 99 (IdentifierRT 100 ((*Med*) 11) (nil))) (nil))) (NameRT 101 (IdentifierRT 102 ((*I*) 7) (nil))) (nil) nil)
            (AssignRT 103 (IdentifierRT 104 ((*Right*) 10) (nil)) (BinOpRT 105 Minus (NameRT 106 (IdentifierRT 107 ((*Med*) 11) (nil))) (LiteralRT 108 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
            (AssignRT 109 (IdentifierRT 110 ((*Result*) 8) (nil)) (NameRT 111 (IdentifierRT 112 ((*Med*) 11) (nil))))
          )
        ))
      )))))
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
  ((((*Result*) 8), (Out, (Integer_Type ((*T*) 1)))) :: (((*Left*) 9), (In_Out, (Subtype ((*U*) 2)))) :: (((*I*) 7), (In, Integer)) :: (((*A*) 6), (In, (Array_Type ((*Ar*) 3)))) :: (((*Right*) 10), (In_Out, (Subtype ((*U*) 2)))) :: (((*Med*) 11), (In_Out, (Subtype ((*U*) 2)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 4), (0, (mkprocBodyDeclRT 12
  (* = = = Procedure Name = = = *)
  ((*Search*) 4)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 13 ((*A*) 6) (Array_Type ((*Ar*) 3)) In) :: 
  (mkparamSpecRT 14 ((*I*) 7) Integer In) :: 
  (mkparamSpecRT 15 ((*Result*) 8) (Integer_Type ((*T*) 1)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 16
(ObjDeclRT 17 (mkobjDeclRT 18 ((*Left*) 9) (Subtype ((*U*) 2)) None)) 
(SeqDeclRT 19
(ObjDeclRT 20 (mkobjDeclRT 21 ((*Right*) 10) (Subtype ((*U*) 2)) None)) 
(ObjDeclRT 22 (mkobjDeclRT 23 ((*Med*) 11) (Subtype ((*U*) 2)) None)))))
  (* = = = Procedure Body = = = *)
    (SeqRT 24
    (AssignRT 25 (IdentifierRT 26 ((*Left*) 9) (nil)) (LiteralRT 27 (Integer_Literal 1) (nil) nil)) 
    (SeqRT 28
    (AssignRT 29 (IdentifierRT 30 ((*Right*) 10) (nil)) (LiteralRT 31 (Integer_Literal 10) (nil) nil)) 
    (SeqRT 32
    (AssignRT 33 (IdentifierRT 34 ((*Result*) 8) (nil)) (LiteralRT 35 (Integer_Literal 0) (nil) nil)) 
    (SeqRT 36
    (IfRT 37 (BinOpRT 38 Or (BinOpRT 39 Greater_Than (NameRT 40 (IndexedComponentRT 41 (IdentifierRT 42 ((*A*) 6) (nil)) (BinOpRT 43 Plus (NameRT 44 (IdentifierRT 45 ((*Left*) 9) (nil))) (LiteralRT 46 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil))) (NameRT 47 (IdentifierRT 48 ((*I*) 7) (nil))) (nil) nil) (BinOpRT 49 Less_Than (NameRT 50 (IndexedComponentRT 51 (IdentifierRT 52 ((*A*) 6) (nil)) (NameRT 53 (IdentifierRT 54 ((*Right*) 10) (nil))) (nil))) (NameRT 55 (IdentifierRT 56 ((*I*) 7) (nil))) (nil) nil) (nil) nil)
      (AssignRT 57 (IdentifierRT 58 ((*Result*) 8) (nil)) (LiteralRT 59 (Integer_Literal 0) (nil) nil))
      NullRT
    ) 
    (WhileRT 60 (BinOpRT 61 Less_Than_Or_Equal (NameRT 62 (IdentifierRT 63 ((*Left*) 9) (nil))) (NameRT 64 (IdentifierRT 65 ((*Right*) 10) (nil))) (nil) nil)
      (SeqRT 66
      (AssignRT 67 (IdentifierRT 68 ((*Med*) 11) (nil)) (BinOpRT 69 Plus (NameRT 70 (IdentifierRT 71 ((*Left*) 9) (nil))) (BinOpRT 72 Divide (BinOpRT 73 Minus (NameRT 74 (IdentifierRT 75 ((*Right*) 10) (nil))) (NameRT 76 (IdentifierRT 77 ((*Left*) 9) (nil))) (nil) nil) (LiteralRT 78 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil) (RangeCheck :: nil) nil)) 
      (IfRT 79 (BinOpRT 80 Less_Than (NameRT 81 (IndexedComponentRT 82 (IdentifierRT 83 ((*A*) 6) (nil)) (NameRT 84 (IdentifierRT 85 ((*Med*) 11) (nil))) (nil))) (NameRT 86 (IdentifierRT 87 ((*I*) 7) (nil))) (nil) nil)
        (AssignRT 88 (IdentifierRT 89 ((*Left*) 9) (nil)) (BinOpRT 90 Plus (NameRT 91 (IdentifierRT 92 ((*Med*) 11) (nil))) (LiteralRT 93 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
        (IfRT 94 (BinOpRT 95 Greater_Than (NameRT 96 (IndexedComponentRT 97 (IdentifierRT 98 ((*A*) 6) (nil)) (NameRT 99 (IdentifierRT 100 ((*Med*) 11) (nil))) (nil))) (NameRT 101 (IdentifierRT 102 ((*I*) 7) (nil))) (nil) nil)
          (AssignRT 103 (IdentifierRT 104 ((*Right*) 10) (nil)) (BinOpRT 105 Minus (NameRT 106 (IdentifierRT 107 ((*Med*) 11) (nil))) (LiteralRT 108 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
          (AssignRT 109 (IdentifierRT 110 ((*Result*) 8) (nil)) (NameRT 111 (IdentifierRT 112 ((*Med*) 11) (nil))))
        )
      ))
    )))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Ar*) 3), (ArrayTypeDeclRT 10 ((*Ar*) 3) ((*index subtype mark*) (Subtype ((*U*) 2))) ((*component type*) Integer))) :: (((*U*) 2), (SubtypeDeclRT 7 ((*U*) 2) (Integer_Type ((*T*) 1)) (RangeRT 1 10))) :: (((*T*) 1), (IntegerTypeDeclRT 4 ((*T*) 1) (RangeRT 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((92, (Subtype ((*U*) 2))) :: (101, Integer) :: (83, (Array_Type ((*Ar*) 3))) :: (110, (Integer_Type ((*T*) 1))) :: (104, (Subtype ((*U*) 2))) :: (95, Boolean) :: (86, Integer) :: (77, (Subtype ((*U*) 2))) :: (50, Integer) :: (41, Integer) :: (59, Integer) :: (68, (Subtype ((*U*) 2))) :: (53, (Subtype ((*U*) 2))) :: (62, (Subtype ((*U*) 2))) :: (35, Integer) :: (44, (Subtype ((*U*) 2))) :: (26, (Subtype ((*U*) 2))) :: (89, (Subtype ((*U*) 2))) :: (80, Boolean) :: (98, (Array_Type ((*Ar*) 3))) :: (71, (Subtype ((*U*) 2))) :: (107, (Subtype ((*U*) 2))) :: (74, (Subtype ((*U*) 2))) :: (56, Integer) :: (47, Integer) :: (38, Boolean) :: (65, (Subtype ((*U*) 2))) :: (106, (Subtype ((*U*) 2))) :: (46, Integer) :: (100, (Subtype ((*U*) 2))) :: (91, (Subtype ((*U*) 2))) :: (82, Integer) :: (55, Integer) :: (64, (Subtype ((*U*) 2))) :: (73, (Integer_Type ((*T*) 1))) :: (58, (Integer_Type ((*T*) 1))) :: (85, (Subtype ((*U*) 2))) :: (49, Boolean) :: (40, Integer) :: (31, Integer) :: (76, (Subtype ((*U*) 2))) :: (112, (Subtype ((*U*) 2))) :: (97, Integer) :: (52, (Array_Type ((*Ar*) 3))) :: (43, (Integer_Type ((*T*) 1))) :: (70, (Subtype ((*U*) 2))) :: (34, (Integer_Type ((*T*) 1))) :: (61, Boolean) :: (87, Integer) :: (96, Integer) :: (105, (Integer_Type ((*T*) 1))) :: (69, (Integer_Type ((*T*) 1))) :: (78, Integer) :: (99, (Subtype ((*U*) 2))) :: (90, (Integer_Type ((*T*) 1))) :: (63, (Subtype ((*U*) 2))) :: (54, (Subtype ((*U*) 2))) :: (45, (Subtype ((*U*) 2))) :: (72, (Integer_Type ((*T*) 1))) :: (81, Integer) :: (108, Integer) :: (27, Integer) :: (48, Integer) :: (84, (Subtype ((*U*) 2))) :: (102, Integer) :: (93, Integer) :: (75, (Subtype ((*U*) 2))) :: (30, (Subtype ((*U*) 2))) :: (111, (Subtype ((*U*) 2))) :: (39, Boolean) :: (42, (Array_Type ((*Ar*) 3))) :: (51, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((92, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (101, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (83, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)13)) :: (110, (sloc (*Line*)34 (*Col*)15 (*EndLine*)34 (*EndCol*)20)) :: (104, (sloc (*Line*)32 (*Col*)15 (*EndLine*)32 (*EndCol*)19)) :: (95, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)24)) :: (86, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (77, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (50, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: (41, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (59, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)20)) :: (68, (sloc (*Line*)26 (*Col*)10 (*EndLine*)26 (*EndCol*)12)) :: (53, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (62, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (35, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (44, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)10)) :: (89, (sloc (*Line*)29 (*Col*)13 (*EndLine*)29 (*EndCol*)16)) :: (80, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)23)) :: (98, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)14)) :: (71, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (107, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (74, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (56, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (47, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (38, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)45)) :: (65, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (106, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)26)) :: (46, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (100, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (91, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)23)) :: (82, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (55, (sloc (*Line*)21 (*Col*)45 (*EndLine*)21 (*EndCol*)45)) :: (64, (sloc (*Line*)25 (*Col*)21 (*EndLine*)25 (*EndCol*)25)) :: (73, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)36)) :: (58, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (85, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (49, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)45)) :: (40, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)19)) :: (31, (sloc (*Line*)17 (*Col*)16 (*EndLine*)17 (*EndCol*)17)) :: (76, (sloc (*Line*)26 (*Col*)33 (*EndLine*)26 (*EndCol*)36)) :: (112, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (97, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (52, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)33)) :: (43, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)18)) :: (70, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)20)) :: (34, (sloc (*Line*)19 (*Col*)7 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)25)) :: (87, (sloc (*Line*)28 (*Col*)23 (*EndLine*)28 (*EndCol*)23)) :: (96, (sloc (*Line*)31 (*Col*)14 (*EndLine*)31 (*EndCol*)20)) :: (105, (sloc (*Line*)32 (*Col*)24 (*EndLine*)32 (*EndCol*)30)) :: (69, (sloc (*Line*)26 (*Col*)17 (*EndLine*)26 (*EndCol*)41)) :: (78, (sloc (*Line*)26 (*Col*)41 (*EndLine*)26 (*EndCol*)41)) :: (99, (sloc (*Line*)31 (*Col*)17 (*EndLine*)31 (*EndCol*)19)) :: (90, (sloc (*Line*)29 (*Col*)21 (*EndLine*)29 (*EndCol*)27)) :: (63, (sloc (*Line*)25 (*Col*)13 (*EndLine*)25 (*EndCol*)16)) :: (54, (sloc (*Line*)21 (*Col*)36 (*EndLine*)21 (*EndCol*)40)) :: (45, (sloc (*Line*)21 (*Col*)13 (*EndLine*)21 (*EndCol*)16)) :: (72, (sloc (*Line*)26 (*Col*)24 (*EndLine*)26 (*EndCol*)41)) :: (81, (sloc (*Line*)28 (*Col*)13 (*EndLine*)28 (*EndCol*)19)) :: (108, (sloc (*Line*)32 (*Col*)30 (*EndLine*)32 (*EndCol*)30)) :: (27, (sloc (*Line*)16 (*Col*)16 (*EndLine*)16 (*EndCol*)16)) :: (48, (sloc (*Line*)21 (*Col*)23 (*EndLine*)21 (*EndCol*)23)) :: (84, (sloc (*Line*)28 (*Col*)16 (*EndLine*)28 (*EndCol*)18)) :: (102, (sloc (*Line*)31 (*Col*)24 (*EndLine*)31 (*EndCol*)24)) :: (93, (sloc (*Line*)29 (*Col*)27 (*EndLine*)29 (*EndCol*)27)) :: (75, (sloc (*Line*)26 (*Col*)25 (*EndLine*)26 (*EndCol*)29)) :: (30, (sloc (*Line*)17 (*Col*)7 (*EndLine*)17 (*EndCol*)11)) :: (111, (sloc (*Line*)34 (*Col*)25 (*EndLine*)34 (*EndCol*)27)) :: (39, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)23)) :: (42, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (51, (sloc (*Line*)21 (*Col*)33 (*EndLine*)21 (*EndCol*)41)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Result", "ada://parameter/Binary_Search-1:9/Search-16:14/Result-16:43")) :: (11, ("Med", "ada://variable/Binary_Search-1:9/Search-16:14/Med+14:7")) :: (7, ("I", "ada://parameter/Binary_Search-1:9/Search-16:14/I-16:30")) :: (10, ("Right", "ada://variable/Binary_Search-1:9/Search-16:14/Right+13:7")) :: (9, ("Left", "ada://variable/Binary_Search-1:9/Search-16:14/Left+12:7")) :: (6, ("A", "ada://parameter/Binary_Search-1:9/Search-16:14/A-16:22")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((4, ("Search", "ada://procedure_body/Binary_Search-1:9/Search-16:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((5, ("Binary_Search", "ada://package_body/Binary_Search-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((2, ("U", "ada://subtype/Binary_Search-1:9/U-12:12")) :: (1, ("T", "ada://ordinary_type/Binary_Search-1:9/T-11:9")) :: (3, ("Ar", "ada://ordinary_type/Binary_Search-1:9/Ar-14:9")) :: nil)
))
).

