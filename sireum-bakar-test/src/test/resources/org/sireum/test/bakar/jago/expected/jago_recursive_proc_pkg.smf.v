Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *)) 
(D_Seq_Declaration 3
(D_Procedure_Body 4 
  (mkprocedure_body 5
    (* = = = Procedure Name = = = *)
    ((*increasebyone*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 6 ((*X*) 4) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Sequence 7
      (S_Assignment 8 (E_Identifier 9 ((*X*) 4) ) (E_Binary_Operation 10 Plus (E_Name 11 (E_Identifier 12 ((*X*) 4) )) (E_Literal 13 (Integer_Literal 1) ) )) 
      (S_Procedure_Call 14 15 ((*addup*) 2) 
        ((E_Name 16 (E_Identifier 17 ((*X*) 4) )) :: nil)
      ))
  )
) 
(D_Procedure_Body 18 
  (mkprocedure_body 19
    (* = = = Procedure Name = = = *)
    ((*addup*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 20 ((*X*) 7) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration 21 (mkobject_declaration 22 ((*Y*) 8) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_If 23 (E_Binary_Operation 24 Greater_Than (E_Name 25 (E_Identifier 26 ((*X*) 7) )) (E_Literal 27 (Integer_Literal 0) ) )
        (S_Sequence 28
        (S_Assignment 29 (E_Identifier 30 ((*Y*) 8) ) (E_Binary_Operation 31 Minus (E_Name 32 (E_Identifier 33 ((*X*) 7) )) (E_Literal 34 (Integer_Literal 1) ) )) 
        (S_Sequence 35
        (S_Procedure_Call 36 37 ((*addup*) 2) 
          ((E_Name 38 (E_Identifier 39 ((*Y*) 8) )) :: nil)
        ) 
        (S_Assignment 40 (E_Identifier 41 ((*X*) 7) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 7) )) (E_Name 45 (E_Identifier 46 ((*Y*) 8) )) ))))
        S_Null
      )
  )
))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Y*) 8), (In_Out, Integer)) :: (((*X*) 7), (In_Out, Integer)) :: (((*X*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*addup*) 2), (0, (mkprocedure_body 19
  (* = = = Procedure Name = = = *)
  ((*addup*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 20 ((*X*) 7) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration 21 (mkobject_declaration 22 ((*Y*) 8) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_If 23 (E_Binary_Operation 24 Greater_Than (E_Name 25 (E_Identifier 26 ((*X*) 7) )) (E_Literal 27 (Integer_Literal 0) ) )
      (S_Sequence 28
      (S_Assignment 29 (E_Identifier 30 ((*Y*) 8) ) (E_Binary_Operation 31 Minus (E_Name 32 (E_Identifier 33 ((*X*) 7) )) (E_Literal 34 (Integer_Literal 1) ) )) 
      (S_Sequence 35
      (S_Procedure_Call 36 37 ((*addup*) 2) 
        ((E_Name 38 (E_Identifier 39 ((*Y*) 8) )) :: nil)
      ) 
      (S_Assignment 40 (E_Identifier 41 ((*X*) 7) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 7) )) (E_Name 45 (E_Identifier 46 ((*Y*) 8) )) ))))
      S_Null
    )
))) :: (((*increasebyone*) 1), (0, (mkprocedure_body 5
  (* = = = Procedure Name = = = *)
  ((*increasebyone*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 6 ((*X*) 4) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Sequence 7
    (S_Assignment 8 (E_Identifier 9 ((*X*) 4) ) (E_Binary_Operation 10 Plus (E_Name 11 (E_Identifier 12 ((*X*) 4) )) (E_Literal 13 (Integer_Literal 1) ) )) 
    (S_Procedure_Call 14 15 ((*addup*) 2) 
      ((E_Name 16 (E_Identifier 17 ((*X*) 4) )) :: nil)
    ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((41, Integer) :: (32, Integer) :: (44, Integer) :: (17, Integer) :: (26, Integer) :: (38, Integer) :: (11, Integer) :: (46, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (10, Integer) :: (45, Integer) :: (9, Integer) :: (27, Integer) :: (12, Integer) :: (39, Integer) :: (30, Integer) :: (42, Integer) :: (33, Integer) :: (24, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((41, (sloc (*Line*)15 (*Col*)3 (*EndLine*)15 (*EndCol*)3)) :: (32, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (44, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (17, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (26, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (38, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (11, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (46, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (13, (sloc (*Line*)5 (*Col*)16 (*EndLine*)5 (*EndCol*)16)) :: (31, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)12)) :: (43, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (16, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (34, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (25, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (10, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)16)) :: (45, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (9, (sloc (*Line*)5 (*Col*)7 (*EndLine*)5 (*EndCol*)7)) :: (27, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)14)) :: (12, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (39, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (30, (sloc (*Line*)13 (*Col*)3 (*EndLine*)13 (*EndCol*)3)) :: (42, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (33, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (24, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Y", "ada://variable/Recursive_Proc_Pkg-1:9/addup-5:14/Y+10:7")) :: (4, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/increasebyone-4:14/X-4:28")) :: (7, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/addup-5:14/X-5:21")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("addup", "ada://procedure/Recursive_Proc_Pkg-1:9/addup-5:14")) :: (1, ("increasebyone", "ada://procedure_body/Recursive_Proc_Pkg-1:9/increasebyone-4:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Recursive_Proc_Pkg", "ada://package_body/Recursive_Proc_Pkg-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *)) 
(D_Seq_Declaration_X 3
(D_Procedure_Body_X 4 
  (mkprocedure_body_x 5
    (* = = = Procedure Name = = = *)
    ((*increasebyone*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 6 ((*X*) 4) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 7
      (S_Assignment_X 8 (E_Identifier_X 9 ((*X*) 4) (nil)) (E_Binary_Operation_X 10 Plus (E_Name_X 11 (E_Identifier_X 12 ((*X*) 4) (nil))) (E_Literal_X 13 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Procedure_Call_X 14 15 ((*addup*) 2) 
        ((E_Name_X 16 (E_Identifier_X 17 ((*X*) 4) (nil))) :: nil)
      ))
  )
) 
(D_Procedure_Body_X 18 
  (mkprocedure_body_x 19
    (* = = = Procedure Name = = = *)
    ((*addup*) 2)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 20 ((*X*) 7) Integer In_Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Object_Declaration_X 21 (mkobject_declaration_x 22 ((*Y*) 8) Integer None)))
    (* = = = Procedure Body = = = *)
      (S_If_X 23 (E_Binary_Operation_X 24 Greater_Than (E_Name_X 25 (E_Identifier_X 26 ((*X*) 7) (nil))) (E_Literal_X 27 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Sequence_X 28
        (S_Assignment_X 29 (E_Identifier_X 30 ((*Y*) 8) (nil)) (E_Binary_Operation_X 31 Minus (E_Name_X 32 (E_Identifier_X 33 ((*X*) 7) (nil))) (E_Literal_X 34 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_Sequence_X 35
        (S_Procedure_Call_X 36 37 ((*addup*) 2) 
          ((E_Name_X 38 (E_Identifier_X 39 ((*Y*) 8) (nil))) :: nil)
        ) 
        (S_Assignment_X 40 (E_Identifier_X 41 ((*X*) 7) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 7) (nil))) (E_Name_X 45 (E_Identifier_X 46 ((*Y*) 8) (nil))) (Do_Overflow_Check :: nil) nil))))
        S_Null_X
      )
  )
))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*Y*) 8), (In_Out, Integer)) :: (((*X*) 7), (In_Out, Integer)) :: (((*X*) 4), (In_Out, Integer)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*addup*) 2), (0, (mkprocedure_body_x 19
  (* = = = Procedure Name = = = *)
  ((*addup*) 2)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 20 ((*X*) 7) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Object_Declaration_X 21 (mkobject_declaration_x 22 ((*Y*) 8) Integer None)))
  (* = = = Procedure Body = = = *)
    (S_If_X 23 (E_Binary_Operation_X 24 Greater_Than (E_Name_X 25 (E_Identifier_X 26 ((*X*) 7) (nil))) (E_Literal_X 27 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Sequence_X 28
      (S_Assignment_X 29 (E_Identifier_X 30 ((*Y*) 8) (nil)) (E_Binary_Operation_X 31 Minus (E_Name_X 32 (E_Identifier_X 33 ((*X*) 7) (nil))) (E_Literal_X 34 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
      (S_Sequence_X 35
      (S_Procedure_Call_X 36 37 ((*addup*) 2) 
        ((E_Name_X 38 (E_Identifier_X 39 ((*Y*) 8) (nil))) :: nil)
      ) 
      (S_Assignment_X 40 (E_Identifier_X 41 ((*X*) 7) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 7) (nil))) (E_Name_X 45 (E_Identifier_X 46 ((*Y*) 8) (nil))) (Do_Overflow_Check :: nil) nil))))
      S_Null_X
    )
))) :: (((*increasebyone*) 1), (0, (mkprocedure_body_x 5
  (* = = = Procedure Name = = = *)
  ((*increasebyone*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 6 ((*X*) 4) Integer In_Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 7
    (S_Assignment_X 8 (E_Identifier_X 9 ((*X*) 4) (nil)) (E_Binary_Operation_X 10 Plus (E_Name_X 11 (E_Identifier_X 12 ((*X*) 4) (nil))) (E_Literal_X 13 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
    (S_Procedure_Call_X 14 15 ((*addup*) 2) 
      ((E_Name_X 16 (E_Identifier_X 17 ((*X*) 4) (nil))) :: nil)
    ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((41, Integer) :: (32, Integer) :: (44, Integer) :: (17, Integer) :: (26, Integer) :: (38, Integer) :: (11, Integer) :: (46, Integer) :: (13, Integer) :: (31, Integer) :: (43, Integer) :: (16, Integer) :: (34, Integer) :: (25, Integer) :: (10, Integer) :: (45, Integer) :: (9, Integer) :: (27, Integer) :: (12, Integer) :: (39, Integer) :: (30, Integer) :: (42, Integer) :: (33, Integer) :: (24, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((41, (sloc (*Line*)15 (*Col*)3 (*EndLine*)15 (*EndCol*)3)) :: (32, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (44, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (17, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (26, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (38, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (11, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (46, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (13, (sloc (*Line*)5 (*Col*)16 (*EndLine*)5 (*EndCol*)16)) :: (31, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)12)) :: (43, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)8)) :: (16, (sloc (*Line*)6 (*Col*)13 (*EndLine*)6 (*EndCol*)13)) :: (34, (sloc (*Line*)13 (*Col*)12 (*EndLine*)13 (*EndCol*)12)) :: (25, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)10)) :: (10, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)16)) :: (45, (sloc (*Line*)15 (*Col*)12 (*EndLine*)15 (*EndCol*)12)) :: (9, (sloc (*Line*)5 (*Col*)7 (*EndLine*)5 (*EndCol*)7)) :: (27, (sloc (*Line*)12 (*Col*)14 (*EndLine*)12 (*EndCol*)14)) :: (12, (sloc (*Line*)5 (*Col*)12 (*EndLine*)5 (*EndCol*)12)) :: (39, (sloc (*Line*)14 (*Col*)9 (*EndLine*)14 (*EndCol*)9)) :: (30, (sloc (*Line*)13 (*Col*)3 (*EndLine*)13 (*EndCol*)3)) :: (42, (sloc (*Line*)15 (*Col*)8 (*EndLine*)15 (*EndCol*)12)) :: (33, (sloc (*Line*)13 (*Col*)8 (*EndLine*)13 (*EndCol*)8)) :: (24, (sloc (*Line*)12 (*Col*)10 (*EndLine*)12 (*EndCol*)14)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((8, ("Y", "ada://variable/Recursive_Proc_Pkg-1:9/addup-5:14/Y+10:7")) :: (4, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/increasebyone-4:14/X-4:28")) :: (7, ("X", "ada://parameter/Recursive_Proc_Pkg-1:9/addup-5:14/X-5:21")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((2, ("addup", "ada://procedure/Recursive_Proc_Pkg-1:9/addup-5:14")) :: (1, ("increasebyone", "ada://procedure_body/Recursive_Proc_Pkg-1:9/increasebyone-4:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((3, ("Recursive_Proc_Pkg", "ada://package_body/Recursive_Proc_Pkg-1:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  (nil)
))
).

