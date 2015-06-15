Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Test_for_Coq1*) 1)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 3
  (D_Object_Declaration 5 (mkobject_declaration 6 ((*N*) 3) Integer (Some ((E_Literal 4 (Integer_Literal 25) ))))) 
  (D_Seq_Declaration 7
  (D_Object_Declaration 8 (mkobject_declaration 9 ((*Result*) 4) Boolean None)) 
  (D_Seq_Declaration 10
  (D_Object_Declaration 11 (mkobject_declaration 12 ((*I*) 5) Integer None)) 
  (D_Object_Declaration 13 (mkobject_declaration 14 ((*X*) 6) Integer None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 15
      (S_Assignment 16 (E_Identifier 17 ((*Result*) 4) ) (E_Literal 18 (Boolean_Literal true) )) 
      (S_Sequence 19
      (S_If 20 (E_Binary_Operation 21 Less_Than_Or_Equal (E_Name 22 (E_Identifier 23 ((*N*) 3) )) (E_Literal 24 (Integer_Literal 1) ) )
        (S_Assignment 25 (E_Identifier 26 ((*Result*) 4) ) (E_Literal 27 (Boolean_Literal false) ))
        S_Null
      ) 
      (S_Sequence 28
      (S_Assignment 29 (E_Identifier 30 ((*I*) 5) ) (E_Literal 31 (Integer_Literal 0) )) 
      (S_While_Loop 32 (E_Binary_Operation 33 Less_Than_Or_Equal (E_Binary_Operation 34 Multiply (E_Name 35 (E_Identifier 36 ((*I*) 5) )) (E_Name 37 (E_Identifier 38 ((*I*) 5) )) ) (E_Name 39 (E_Identifier 40 ((*N*) 3) )) )
        (S_Sequence 41
        (S_Assignment 42 (E_Identifier 43 ((*X*) 6) ) (E_Binary_Operation 44 Divide (E_Name 45 (E_Identifier 46 ((*N*) 3) )) (E_Name 47 (E_Identifier 48 ((*I*) 5) )) )) 
        (S_Sequence 49
        (S_If 50 (E_Binary_Operation 51 Equal (E_Name 52 (E_Identifier 53 ((*N*) 3) )) (E_Binary_Operation 54 Multiply (E_Name 55 (E_Identifier 56 ((*X*) 6) )) (E_Name 57 (E_Identifier 58 ((*I*) 5) )) ) )
          (S_Assignment 59 (E_Identifier 60 ((*Result*) 4) ) (E_Literal 61 (Boolean_Literal false) ))
          S_Null
        ) 
        (S_Assignment 62 (E_Identifier 63 ((*I*) 5) ) (E_Binary_Operation 64 Plus (E_Name 65 (E_Identifier 66 ((*I*) 5) )) (E_Literal 67 (Integer_Literal 1) ) ))))
      ))))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 5), (In_Out, Integer)) :: (((*X*) 6), (In_Out, Integer)) :: (((*Result*) 4), (In_Out, Boolean)) :: (((*N*) 3), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test_for_Coq1*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Test_for_Coq1*) 1)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 3
(D_Object_Declaration 5 (mkobject_declaration 6 ((*N*) 3) Integer (Some ((E_Literal 4 (Integer_Literal 25) ))))) 
(D_Seq_Declaration 7
(D_Object_Declaration 8 (mkobject_declaration 9 ((*Result*) 4) Boolean None)) 
(D_Seq_Declaration 10
(D_Object_Declaration 11 (mkobject_declaration 12 ((*I*) 5) Integer None)) 
(D_Object_Declaration 13 (mkobject_declaration 14 ((*X*) 6) Integer None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 15
    (S_Assignment 16 (E_Identifier 17 ((*Result*) 4) ) (E_Literal 18 (Boolean_Literal true) )) 
    (S_Sequence 19
    (S_If 20 (E_Binary_Operation 21 Less_Than_Or_Equal (E_Name 22 (E_Identifier 23 ((*N*) 3) )) (E_Literal 24 (Integer_Literal 1) ) )
      (S_Assignment 25 (E_Identifier 26 ((*Result*) 4) ) (E_Literal 27 (Boolean_Literal false) ))
      S_Null
    ) 
    (S_Sequence 28
    (S_Assignment 29 (E_Identifier 30 ((*I*) 5) ) (E_Literal 31 (Integer_Literal 0) )) 
    (S_While_Loop 32 (E_Binary_Operation 33 Less_Than_Or_Equal (E_Binary_Operation 34 Multiply (E_Name 35 (E_Identifier 36 ((*I*) 5) )) (E_Name 37 (E_Identifier 38 ((*I*) 5) )) ) (E_Name 39 (E_Identifier 40 ((*N*) 3) )) )
      (S_Sequence 41
      (S_Assignment 42 (E_Identifier 43 ((*X*) 6) ) (E_Binary_Operation 44 Divide (E_Name 45 (E_Identifier 46 ((*N*) 3) )) (E_Name 47 (E_Identifier 48 ((*I*) 5) )) )) 
      (S_Sequence 49
      (S_If 50 (E_Binary_Operation 51 Equal (E_Name 52 (E_Identifier 53 ((*N*) 3) )) (E_Binary_Operation 54 Multiply (E_Name 55 (E_Identifier 56 ((*X*) 6) )) (E_Name 57 (E_Identifier 58 ((*I*) 5) )) ) )
        (S_Assignment 59 (E_Identifier 60 ((*Result*) 4) ) (E_Literal 61 (Boolean_Literal false) ))
        S_Null
      ) 
      (S_Assignment 62 (E_Identifier 63 ((*I*) 5) ) (E_Binary_Operation 64 Plus (E_Name 65 (E_Identifier 66 ((*I*) 5) )) (E_Literal 67 (Integer_Literal 1) ) ))))
    ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (53, Integer) :: (17, Boolean) :: (35, Integer) :: (44, Integer) :: (26, Boolean) :: (56, Integer) :: (38, Integer) :: (47, Integer) :: (65, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (67, Integer) :: (58, Integer) :: (40, Integer) :: (4, Integer) :: (31, Integer) :: (22, Integer) :: (52, Integer) :: (43, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Integer) :: (60, Boolean) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (27, Boolean) :: (18, Boolean) :: (36, Integer) :: (57, Integer) :: (21, Boolean) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (66, Integer) :: (51, Boolean) :: (33, Boolean) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (53, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (17, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)9)) :: (35, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (44, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (56, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (38, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (47, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (65, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (46, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (64, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)16)) :: (55, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (67, (sloc (*Line*)24 (*Col*)16 (*EndLine*)24 (*EndCol*)16)) :: (58, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (40, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (4, (sloc (*Line*)6 (*Col*)18 (*EndLine*)6 (*EndCol*)19)) :: (31, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)9)) :: (22, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (52, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (43, (sloc (*Line*)20 (*Col*)7 (*EndLine*)20 (*EndCol*)7)) :: (34, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)24)) :: (37, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (60, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (63, (sloc (*Line*)24 (*Col*)7 (*EndLine*)24 (*EndCol*)7)) :: (54, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)18)) :: (45, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (27, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (18, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)17)) :: (36, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (57, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (21, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)12)) :: (48, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (30, (sloc (*Line*)18 (*Col*)4 (*EndLine*)18 (*EndCol*)4)) :: (39, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (66, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (51, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)18)) :: (33, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)17)) :: (24, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((5, ("I", "ada://variable/Test_for_Coq1+4:11/I+8:4")) :: (4, ("Result", "ada://variable/Test_for_Coq1+4:11/Result+7:4")) :: (3, ("N", "ada://variable/Test_for_Coq1+4:11/N+6:4")) :: (6, ("X", "ada://variable/Test_for_Coq1+4:11/X+9:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Test_for_Coq1", "ada://procedure_body/Test_for_Coq1+4:11")) :: nil)
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

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Test_for_Coq1*) 1)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 3
  (D_Object_Declaration_X 5 (mkobject_declaration_x 6 ((*N*) 3) Integer (Some ((E_Literal_X 4 (Integer_Literal 25) (nil) nil))))) 
  (D_Seq_Declaration_X 7
  (D_Object_Declaration_X 8 (mkobject_declaration_x 9 ((*Result*) 4) Boolean None)) 
  (D_Seq_Declaration_X 10
  (D_Object_Declaration_X 11 (mkobject_declaration_x 12 ((*I*) 5) Integer None)) 
  (D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*X*) 6) Integer None))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 15
      (S_Assignment_X 16 (E_Identifier_X 17 ((*Result*) 4) (nil)) (E_Literal_X 18 (Boolean_Literal true) (nil) nil)) 
      (S_Sequence_X 19
      (S_If_X 20 (E_Binary_Operation_X 21 Less_Than_Or_Equal (E_Name_X 22 (E_Identifier_X 23 ((*N*) 3) (nil))) (E_Literal_X 24 (Integer_Literal 1) (nil) nil) (nil) nil)
        (S_Assignment_X 25 (E_Identifier_X 26 ((*Result*) 4) (nil)) (E_Literal_X 27 (Boolean_Literal false) (nil) nil))
        S_Null_X
      ) 
      (S_Sequence_X 28
      (S_Assignment_X 29 (E_Identifier_X 30 ((*I*) 5) (nil)) (E_Literal_X 31 (Integer_Literal 0) (nil) nil)) 
      (S_While_Loop_X 32 (E_Binary_Operation_X 33 Less_Than_Or_Equal (E_Binary_Operation_X 34 Multiply (E_Name_X 35 (E_Identifier_X 36 ((*I*) 5) (nil))) (E_Name_X 37 (E_Identifier_X 38 ((*I*) 5) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 39 (E_Identifier_X 40 ((*N*) 3) (nil))) (nil) nil)
        (S_Sequence_X 41
        (S_Assignment_X 42 (E_Identifier_X 43 ((*X*) 6) (nil)) (E_Binary_Operation_X 44 Divide (E_Name_X 45 (E_Identifier_X 46 ((*N*) 3) (nil))) (E_Name_X 47 (E_Identifier_X 48 ((*I*) 5) (nil))) (Do_Division_Check :: Do_Overflow_Check :: nil) nil)) 
        (S_Sequence_X 49
        (S_If_X 50 (E_Binary_Operation_X 51 Equal (E_Name_X 52 (E_Identifier_X 53 ((*N*) 3) (nil))) (E_Binary_Operation_X 54 Multiply (E_Name_X 55 (E_Identifier_X 56 ((*X*) 6) (nil))) (E_Name_X 57 (E_Identifier_X 58 ((*I*) 5) (nil))) (Do_Overflow_Check :: nil) nil) (nil) nil)
          (S_Assignment_X 59 (E_Identifier_X 60 ((*Result*) 4) (nil)) (E_Literal_X 61 (Boolean_Literal false) (nil) nil))
          S_Null_X
        ) 
        (S_Assignment_X 62 (E_Identifier_X 63 ((*I*) 5) (nil)) (E_Binary_Operation_X 64 Plus (E_Name_X 65 (E_Identifier_X 66 ((*I*) 5) (nil))) (E_Literal_X 67 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))))
      ))))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*I*) 5), (In_Out, Integer)) :: (((*X*) 6), (In_Out, Integer)) :: (((*Result*) 4), (In_Out, Boolean)) :: (((*N*) 3), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Test_for_Coq1*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Test_for_Coq1*) 1)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 3
(D_Object_Declaration_X 5 (mkobject_declaration_x 6 ((*N*) 3) Integer (Some ((E_Literal_X 4 (Integer_Literal 25) (nil) nil))))) 
(D_Seq_Declaration_X 7
(D_Object_Declaration_X 8 (mkobject_declaration_x 9 ((*Result*) 4) Boolean None)) 
(D_Seq_Declaration_X 10
(D_Object_Declaration_X 11 (mkobject_declaration_x 12 ((*I*) 5) Integer None)) 
(D_Object_Declaration_X 13 (mkobject_declaration_x 14 ((*X*) 6) Integer None))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 15
    (S_Assignment_X 16 (E_Identifier_X 17 ((*Result*) 4) (nil)) (E_Literal_X 18 (Boolean_Literal true) (nil) nil)) 
    (S_Sequence_X 19
    (S_If_X 20 (E_Binary_Operation_X 21 Less_Than_Or_Equal (E_Name_X 22 (E_Identifier_X 23 ((*N*) 3) (nil))) (E_Literal_X 24 (Integer_Literal 1) (nil) nil) (nil) nil)
      (S_Assignment_X 25 (E_Identifier_X 26 ((*Result*) 4) (nil)) (E_Literal_X 27 (Boolean_Literal false) (nil) nil))
      S_Null_X
    ) 
    (S_Sequence_X 28
    (S_Assignment_X 29 (E_Identifier_X 30 ((*I*) 5) (nil)) (E_Literal_X 31 (Integer_Literal 0) (nil) nil)) 
    (S_While_Loop_X 32 (E_Binary_Operation_X 33 Less_Than_Or_Equal (E_Binary_Operation_X 34 Multiply (E_Name_X 35 (E_Identifier_X 36 ((*I*) 5) (nil))) (E_Name_X 37 (E_Identifier_X 38 ((*I*) 5) (nil))) (Do_Overflow_Check :: nil) nil) (E_Name_X 39 (E_Identifier_X 40 ((*N*) 3) (nil))) (nil) nil)
      (S_Sequence_X 41
      (S_Assignment_X 42 (E_Identifier_X 43 ((*X*) 6) (nil)) (E_Binary_Operation_X 44 Divide (E_Name_X 45 (E_Identifier_X 46 ((*N*) 3) (nil))) (E_Name_X 47 (E_Identifier_X 48 ((*I*) 5) (nil))) (Do_Division_Check :: Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 49
      (S_If_X 50 (E_Binary_Operation_X 51 Equal (E_Name_X 52 (E_Identifier_X 53 ((*N*) 3) (nil))) (E_Binary_Operation_X 54 Multiply (E_Name_X 55 (E_Identifier_X 56 ((*X*) 6) (nil))) (E_Name_X 57 (E_Identifier_X 58 ((*I*) 5) (nil))) (Do_Overflow_Check :: nil) nil) (nil) nil)
        (S_Assignment_X 59 (E_Identifier_X 60 ((*Result*) 4) (nil)) (E_Literal_X 61 (Boolean_Literal false) (nil) nil))
        S_Null_X
      ) 
      (S_Assignment_X 62 (E_Identifier_X 63 ((*I*) 5) (nil)) (E_Binary_Operation_X 64 Plus (E_Name_X 65 (E_Identifier_X 66 ((*I*) 5) (nil))) (E_Literal_X 67 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))))
    ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((23, Integer) :: (53, Integer) :: (17, Boolean) :: (35, Integer) :: (44, Integer) :: (26, Boolean) :: (56, Integer) :: (38, Integer) :: (47, Integer) :: (65, Integer) :: (46, Integer) :: (64, Integer) :: (55, Integer) :: (67, Integer) :: (58, Integer) :: (40, Integer) :: (4, Integer) :: (31, Integer) :: (22, Integer) :: (52, Integer) :: (43, Integer) :: (34, Integer) :: (61, Boolean) :: (37, Integer) :: (60, Boolean) :: (63, Integer) :: (54, Integer) :: (45, Integer) :: (27, Boolean) :: (18, Boolean) :: (36, Integer) :: (57, Integer) :: (21, Boolean) :: (48, Integer) :: (30, Integer) :: (39, Integer) :: (66, Integer) :: (51, Boolean) :: (33, Boolean) :: (24, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((23, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (53, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (17, (sloc (*Line*)12 (*Col*)4 (*EndLine*)12 (*EndCol*)9)) :: (35, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (44, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)16)) :: (26, (sloc (*Line*)16 (*Col*)7 (*EndLine*)16 (*EndCol*)12)) :: (56, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (38, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (47, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (65, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (46, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (64, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)16)) :: (55, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)14)) :: (67, (sloc (*Line*)24 (*Col*)16 (*EndLine*)24 (*EndCol*)16)) :: (58, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (40, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (4, (sloc (*Line*)6 (*Col*)18 (*EndLine*)6 (*EndCol*)19)) :: (31, (sloc (*Line*)18 (*Col*)9 (*EndLine*)18 (*EndCol*)9)) :: (22, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)7)) :: (52, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)10)) :: (43, (sloc (*Line*)20 (*Col*)7 (*EndLine*)20 (*EndCol*)7)) :: (34, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)12)) :: (61, (sloc (*Line*)22 (*Col*)20 (*EndLine*)22 (*EndCol*)24)) :: (37, (sloc (*Line*)19 (*Col*)12 (*EndLine*)19 (*EndCol*)12)) :: (60, (sloc (*Line*)22 (*Col*)10 (*EndLine*)22 (*EndCol*)15)) :: (63, (sloc (*Line*)24 (*Col*)7 (*EndLine*)24 (*EndCol*)7)) :: (54, (sloc (*Line*)21 (*Col*)14 (*EndLine*)21 (*EndCol*)18)) :: (45, (sloc (*Line*)20 (*Col*)12 (*EndLine*)20 (*EndCol*)12)) :: (27, (sloc (*Line*)16 (*Col*)17 (*EndLine*)16 (*EndCol*)21)) :: (18, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)17)) :: (36, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)10)) :: (57, (sloc (*Line*)21 (*Col*)18 (*EndLine*)21 (*EndCol*)18)) :: (21, (sloc (*Line*)15 (*Col*)7 (*EndLine*)15 (*EndCol*)12)) :: (48, (sloc (*Line*)20 (*Col*)16 (*EndLine*)20 (*EndCol*)16)) :: (30, (sloc (*Line*)18 (*Col*)4 (*EndLine*)18 (*EndCol*)4)) :: (39, (sloc (*Line*)19 (*Col*)17 (*EndLine*)19 (*EndCol*)17)) :: (66, (sloc (*Line*)24 (*Col*)12 (*EndLine*)24 (*EndCol*)12)) :: (51, (sloc (*Line*)21 (*Col*)10 (*EndLine*)21 (*EndCol*)18)) :: (33, (sloc (*Line*)19 (*Col*)10 (*EndLine*)19 (*EndCol*)17)) :: (24, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((5, ("I", "ada://variable/Test_for_Coq1+4:11/I+8:4")) :: (4, ("Result", "ada://variable/Test_for_Coq1+4:11/Result+7:4")) :: (3, ("N", "ada://variable/Test_for_Coq1+4:11/N+6:4")) :: (6, ("X", "ada://variable/Test_for_Coq1+4:11/X+9:4")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((1, ("Test_for_Coq1", "ada://procedure_body/Test_for_Coq1+4:11")) :: nil)
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

