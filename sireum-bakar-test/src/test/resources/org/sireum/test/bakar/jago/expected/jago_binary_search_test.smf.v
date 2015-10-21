Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Procedure_Body 1 
  (mkprocedure_body 2
    (* = = = Procedure Name = = = *)
    ((*Binary_Search_Test*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 3 ((*I*) 2) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 4
  (D_Type_Declaration 5 (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) 
  (D_Seq_Declaration 7
  (D_Type_Declaration 8 (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
  (D_Seq_Declaration 10
  (D_Type_Declaration 11 (Array_Type_Declaration 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (D_Seq_Declaration 13
  (D_Object_Declaration 14 (mkobject_declaration 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
  (D_Seq_Declaration 16
  (D_Object_Declaration 17 (mkobject_declaration 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
  (D_Seq_Declaration 19
  (D_Type_Declaration 20 (Derived_Type_Declaration 21 ((*T1*) 8) Integer (Range 1 10))) 
  (D_Seq_Declaration 22
  (D_Type_Declaration 23 (Derived_Type_Declaration 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range 2 5))) 
  (D_Seq_Declaration 25
  (D_Type_Declaration 26 (Subtype_Declaration 27 ((*T3*) 10) Integer (Range 1 10))) 
  (D_Seq_Declaration 28
  (D_Type_Declaration 29 (Subtype_Declaration 30 ((*T4*) 11) Integer (Range 5 10))) 
  (D_Seq_Declaration 31
  (D_Type_Declaration 32 (Record_Type_Declaration 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
  (D_Seq_Declaration 35
  (D_Procedure_Body 36 
    (mkprocedure_body 37
      (* = = = Procedure Name = = = *)
      ((*increase*) 15)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 38 ((*X*) 16) Integer In) :: 
      (mkparameter_specification 39 ((*Y*) 17) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration)
      (* = = = Procedure Body = = = *)
        (S_Assignment 40 (E_Identifier 41 ((*Y*) 17) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 16) )) (E_Literal 45 (Integer_Literal 1) ) ))
    )
  ) 
  (D_Seq_Declaration 46
  (D_Object_Declaration 48 (mkobject_declaration 49 ((*B*) 21) Boolean (Some ((E_Literal 47 (Boolean_Literal true) ))))) 
  (D_Seq_Declaration 50
  (D_Procedure_Body 51 
    (mkprocedure_body 52
      (* = = = Procedure Name = = = *)
      ((*Search*) 22)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
      (mkparameter_specification 54 ((*I*) 24) Integer In) :: 
      (mkparameter_specification 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
      (* = = = Object Declarations = = = *)
      ((D_Seq_Declaration 56
    (D_Object_Declaration 57 (mkobject_declaration 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
    (D_Seq_Declaration 59
    (D_Object_Declaration 60 (mkobject_declaration 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
    (D_Object_Declaration 62 (mkobject_declaration 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
      (* = = = Procedure Body = = = *)
        (S_Sequence 64
        (S_Assignment 65 (E_Identifier 66 ((*Left*) 26) ) (E_Literal 67 (Integer_Literal 0) )) 
        (S_Sequence 68
        (S_Assignment 69 (E_Identifier 70 ((*Right*) 27) ) (E_Literal 71 (Integer_Literal 10) )) 
        (S_Sequence 72
        (S_Assignment 73 (E_Identifier 74 ((*R*) 25) ) (E_Literal 75 (Integer_Literal 0) )) 
        (S_Sequence 76
        (S_If 77 (E_Binary_Operation 78 Or (E_Binary_Operation 79 Greater_Than (E_Name 80 (E_Indexed_Component 81 (E_Identifier 82 ((*A*) 23) ) (E_Binary_Operation 83 Plus (E_Name 84 (E_Identifier 85 ((*Left*) 26) )) (E_Literal 86 (Integer_Literal 1) ) ) )) (E_Name 87 (E_Identifier 88 ((*I*) 24) )) ) (E_Binary_Operation 89 Less_Than (E_Name 90 (E_Indexed_Component 91 (E_Identifier 92 ((*A*) 23) ) (E_Name 93 (E_Identifier 94 ((*Right*) 27) )) )) (E_Name 95 (E_Identifier 96 ((*I*) 24) )) ) )
          (S_Assignment 97 (E_Identifier 98 ((*R*) 25) ) (E_Literal 99 (Integer_Literal 0) ))
          S_Null
        ) 
        (S_While_Loop 100 (E_Binary_Operation 101 Less_Than_Or_Equal (E_Name 102 (E_Identifier 103 ((*Left*) 26) )) (E_Name 104 (E_Identifier 105 ((*Right*) 27) )) )
          (S_Sequence 106
          (S_Assignment 107 (E_Identifier 108 ((*Med*) 28) ) (E_Binary_Operation 109 Plus (E_Name 110 (E_Identifier 111 ((*Left*) 26) )) (E_Binary_Operation 112 Divide (E_Binary_Operation 113 Minus (E_Name 114 (E_Identifier 115 ((*Right*) 27) )) (E_Name 116 (E_Identifier 117 ((*Left*) 26) )) ) (E_Literal 118 (Integer_Literal 2) ) ) )) 
          (S_If 119 (E_Binary_Operation 120 Less_Than (E_Name 121 (E_Indexed_Component 122 (E_Identifier 123 ((*A*) 23) ) (E_Name 124 (E_Identifier 125 ((*Med*) 28) )) )) (E_Name 126 (E_Identifier 127 ((*I*) 24) )) )
            (S_Assignment 128 (E_Identifier 129 ((*Left*) 26) ) (E_Binary_Operation 130 Plus (E_Name 131 (E_Identifier 132 ((*Med*) 28) )) (E_Literal 133 (Integer_Literal 1) ) ))
            (S_If 134 (E_Binary_Operation 135 Greater_Than (E_Name 136 (E_Indexed_Component 137 (E_Identifier 138 ((*A*) 23) ) (E_Name 139 (E_Identifier 140 ((*Med*) 28) )) )) (E_Name 141 (E_Identifier 142 ((*I*) 24) )) )
              (S_Assignment 143 (E_Identifier 144 ((*Right*) 27) ) (E_Binary_Operation 145 Minus (E_Name 146 (E_Identifier 147 ((*Med*) 28) )) (E_Literal 148 (Integer_Literal 1) ) ))
              (S_Assignment 149 (E_Identifier 150 ((*R*) 25) ) (E_Name 151 (E_Identifier 152 ((*Med*) 28) )))
            )
          ))
        )))))
    )
  ) 
  (D_Seq_Declaration 153
  (D_Object_Declaration 155 (mkobject_declaration 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((E_Literal 154 (Integer_Literal 2) ))))) 
  (D_Seq_Declaration 157
  (D_Object_Declaration 159 (mkobject_declaration 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((E_Literal 158 (Integer_Literal 3) ))))) 
  (D_Seq_Declaration 161
  (D_Object_Declaration 163 (mkobject_declaration 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((E_Literal 162 (Integer_Literal 4) ))))) 
  (D_Object_Declaration 166 (mkobject_declaration 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((E_Literal 165 (Integer_Literal 6) ))))))))))))))))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 168
      (S_Procedure_Call 169 170 ((*increase*) 15) 
        ((E_Literal 171 (Integer_Literal 10) ) :: (E_Name 172 (E_Identifier 173 ((*X4*) 32) )) :: nil)
      ) 
      (S_Sequence 174
      (S_Assignment 175 (E_Identifier 176 ((*X1*) 29) ) (E_Binary_Operation 177 Plus (E_Name 178 (E_Identifier 179 ((*X1*) 29) )) (E_Literal 180 (Integer_Literal 1) ) )) 
      (S_Sequence 181
      (S_Assignment 182 (E_Identifier 183 ((*X2*) 30) ) (E_Binary_Operation 184 Plus (E_Name 185 (E_Identifier 186 ((*X2*) 30) )) (E_Literal 187 (Integer_Literal 2) ) )) 
      (S_Sequence 188
      (S_Assignment 189 (E_Identifier 190 ((*X4*) 32) ) (E_Binary_Operation 191 Plus (E_Name 192 (E_Identifier 193 ((*X3*) 31) )) (E_Name 194 (E_Identifier 195 ((*X4*) 32) )) )) 
      (S_Sequence 196
      (S_Assignment 197 (E_Indexed_Component 198 (E_Identifier 199 ((*A*) 6) ) (E_Literal 200 (Integer_Literal 0) ) ) (E_Literal 201 (Integer_Literal 0) )) 
      (S_Sequence 202
      (S_Assignment 203 (E_Indexed_Component 204 (E_Identifier 205 ((*A*) 6) ) (E_Literal 206 (Integer_Literal 1) ) ) (E_Literal 207 (Integer_Literal 10) )) 
      (S_Procedure_Call 208 209 ((*Search*) 22) 
        ((E_Name 210 (E_Identifier 211 ((*A*) 6) )) :: (E_Name 212 (E_Identifier 213 ((*I*) 2) )) :: (E_Name 214 (E_Identifier 215 ((*R*) 7) )) :: nil)
      )))))))
  )
).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X3*) 31), (In_Out, (Subtype ((*T3*) 10)))) :: (((*R*) 25), (Out, (Integer_Type ((*T*) 3)))) :: (((*R*) 7), (In_Out, (Integer_Type ((*T*) 3)))) :: (((*X1*) 29), (In_Out, (Derived_Type ((*T1*) 8)))) :: (((*I*) 24), (In, Integer)) :: (((*X*) 16), (In, Integer)) :: (((*B*) 21), (In_Out, Boolean)) :: (((*X4*) 32), (In_Out, (Subtype ((*T4*) 11)))) :: (((*I*) 2), (In, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: (((*Left*) 26), (In_Out, (Subtype ((*U*) 4)))) :: (((*Right*) 27), (In_Out, (Subtype ((*U*) 4)))) :: (((*Med*) 28), (In_Out, (Subtype ((*U*) 4)))) :: (((*X2*) 30), (In_Out, (Derived_Type ((*T2*) 9)))) :: (((*Y*) 17), (Out, Integer)) :: (((*A*) 23), (In, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 22), (1, (mkprocedure_body 52
  (* = = = Procedure Name = = = *)
  ((*Search*) 22)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
  (mkparameter_specification 54 ((*I*) 24) Integer In) :: 
  (mkparameter_specification 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 56
(D_Object_Declaration 57 (mkobject_declaration 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
(D_Seq_Declaration 59
(D_Object_Declaration 60 (mkobject_declaration 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
(D_Object_Declaration 62 (mkobject_declaration 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 64
    (S_Assignment 65 (E_Identifier 66 ((*Left*) 26) ) (E_Literal 67 (Integer_Literal 0) )) 
    (S_Sequence 68
    (S_Assignment 69 (E_Identifier 70 ((*Right*) 27) ) (E_Literal 71 (Integer_Literal 10) )) 
    (S_Sequence 72
    (S_Assignment 73 (E_Identifier 74 ((*R*) 25) ) (E_Literal 75 (Integer_Literal 0) )) 
    (S_Sequence 76
    (S_If 77 (E_Binary_Operation 78 Or (E_Binary_Operation 79 Greater_Than (E_Name 80 (E_Indexed_Component 81 (E_Identifier 82 ((*A*) 23) ) (E_Binary_Operation 83 Plus (E_Name 84 (E_Identifier 85 ((*Left*) 26) )) (E_Literal 86 (Integer_Literal 1) ) ) )) (E_Name 87 (E_Identifier 88 ((*I*) 24) )) ) (E_Binary_Operation 89 Less_Than (E_Name 90 (E_Indexed_Component 91 (E_Identifier 92 ((*A*) 23) ) (E_Name 93 (E_Identifier 94 ((*Right*) 27) )) )) (E_Name 95 (E_Identifier 96 ((*I*) 24) )) ) )
      (S_Assignment 97 (E_Identifier 98 ((*R*) 25) ) (E_Literal 99 (Integer_Literal 0) ))
      S_Null
    ) 
    (S_While_Loop 100 (E_Binary_Operation 101 Less_Than_Or_Equal (E_Name 102 (E_Identifier 103 ((*Left*) 26) )) (E_Name 104 (E_Identifier 105 ((*Right*) 27) )) )
      (S_Sequence 106
      (S_Assignment 107 (E_Identifier 108 ((*Med*) 28) ) (E_Binary_Operation 109 Plus (E_Name 110 (E_Identifier 111 ((*Left*) 26) )) (E_Binary_Operation 112 Divide (E_Binary_Operation 113 Minus (E_Name 114 (E_Identifier 115 ((*Right*) 27) )) (E_Name 116 (E_Identifier 117 ((*Left*) 26) )) ) (E_Literal 118 (Integer_Literal 2) ) ) )) 
      (S_If 119 (E_Binary_Operation 120 Less_Than (E_Name 121 (E_Indexed_Component 122 (E_Identifier 123 ((*A*) 23) ) (E_Name 124 (E_Identifier 125 ((*Med*) 28) )) )) (E_Name 126 (E_Identifier 127 ((*I*) 24) )) )
        (S_Assignment 128 (E_Identifier 129 ((*Left*) 26) ) (E_Binary_Operation 130 Plus (E_Name 131 (E_Identifier 132 ((*Med*) 28) )) (E_Literal 133 (Integer_Literal 1) ) ))
        (S_If 134 (E_Binary_Operation 135 Greater_Than (E_Name 136 (E_Indexed_Component 137 (E_Identifier 138 ((*A*) 23) ) (E_Name 139 (E_Identifier 140 ((*Med*) 28) )) )) (E_Name 141 (E_Identifier 142 ((*I*) 24) )) )
          (S_Assignment 143 (E_Identifier 144 ((*Right*) 27) ) (E_Binary_Operation 145 Minus (E_Name 146 (E_Identifier 147 ((*Med*) 28) )) (E_Literal 148 (Integer_Literal 1) ) ))
          (S_Assignment 149 (E_Identifier 150 ((*R*) 25) ) (E_Name 151 (E_Identifier 152 ((*Med*) 28) )))
        )
      ))
    )))))
))) :: (((*Binary_Search_Test*) 1), (0, (mkprocedure_body 2
  (* = = = Procedure Name = = = *)
  ((*Binary_Search_Test*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 3 ((*I*) 2) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 4
(D_Type_Declaration 5 (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) 
(D_Seq_Declaration 7
(D_Type_Declaration 8 (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
(D_Seq_Declaration 10
(D_Type_Declaration 11 (Array_Type_Declaration 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(D_Seq_Declaration 13
(D_Object_Declaration 14 (mkobject_declaration 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
(D_Seq_Declaration 16
(D_Object_Declaration 17 (mkobject_declaration 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
(D_Seq_Declaration 19
(D_Type_Declaration 20 (Derived_Type_Declaration 21 ((*T1*) 8) Integer (Range 1 10))) 
(D_Seq_Declaration 22
(D_Type_Declaration 23 (Derived_Type_Declaration 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range 2 5))) 
(D_Seq_Declaration 25
(D_Type_Declaration 26 (Subtype_Declaration 27 ((*T3*) 10) Integer (Range 1 10))) 
(D_Seq_Declaration 28
(D_Type_Declaration 29 (Subtype_Declaration 30 ((*T4*) 11) Integer (Range 5 10))) 
(D_Seq_Declaration 31
(D_Type_Declaration 32 (Record_Type_Declaration 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
(D_Seq_Declaration 35
(D_Procedure_Body 36 
  (mkprocedure_body 37
    (* = = = Procedure Name = = = *)
    ((*increase*) 15)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 38 ((*X*) 16) Integer In) :: 
    (mkparameter_specification 39 ((*Y*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 40 (E_Identifier 41 ((*Y*) 17) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 16) )) (E_Literal 45 (Integer_Literal 1) ) ))
  )
) 
(D_Seq_Declaration 46
(D_Object_Declaration 48 (mkobject_declaration 49 ((*B*) 21) Boolean (Some ((E_Literal 47 (Boolean_Literal true) ))))) 
(D_Seq_Declaration 50
(D_Procedure_Body 51 
  (mkprocedure_body 52
    (* = = = Procedure Name = = = *)
    ((*Search*) 22)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
    (mkparameter_specification 54 ((*I*) 24) Integer In) :: 
    (mkparameter_specification 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 56
  (D_Object_Declaration 57 (mkobject_declaration 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
  (D_Seq_Declaration 59
  (D_Object_Declaration 60 (mkobject_declaration 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
  (D_Object_Declaration 62 (mkobject_declaration 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 64
      (S_Assignment 65 (E_Identifier 66 ((*Left*) 26) ) (E_Literal 67 (Integer_Literal 0) )) 
      (S_Sequence 68
      (S_Assignment 69 (E_Identifier 70 ((*Right*) 27) ) (E_Literal 71 (Integer_Literal 10) )) 
      (S_Sequence 72
      (S_Assignment 73 (E_Identifier 74 ((*R*) 25) ) (E_Literal 75 (Integer_Literal 0) )) 
      (S_Sequence 76
      (S_If 77 (E_Binary_Operation 78 Or (E_Binary_Operation 79 Greater_Than (E_Name 80 (E_Indexed_Component 81 (E_Identifier 82 ((*A*) 23) ) (E_Binary_Operation 83 Plus (E_Name 84 (E_Identifier 85 ((*Left*) 26) )) (E_Literal 86 (Integer_Literal 1) ) ) )) (E_Name 87 (E_Identifier 88 ((*I*) 24) )) ) (E_Binary_Operation 89 Less_Than (E_Name 90 (E_Indexed_Component 91 (E_Identifier 92 ((*A*) 23) ) (E_Name 93 (E_Identifier 94 ((*Right*) 27) )) )) (E_Name 95 (E_Identifier 96 ((*I*) 24) )) ) )
        (S_Assignment 97 (E_Identifier 98 ((*R*) 25) ) (E_Literal 99 (Integer_Literal 0) ))
        S_Null
      ) 
      (S_While_Loop 100 (E_Binary_Operation 101 Less_Than_Or_Equal (E_Name 102 (E_Identifier 103 ((*Left*) 26) )) (E_Name 104 (E_Identifier 105 ((*Right*) 27) )) )
        (S_Sequence 106
        (S_Assignment 107 (E_Identifier 108 ((*Med*) 28) ) (E_Binary_Operation 109 Plus (E_Name 110 (E_Identifier 111 ((*Left*) 26) )) (E_Binary_Operation 112 Divide (E_Binary_Operation 113 Minus (E_Name 114 (E_Identifier 115 ((*Right*) 27) )) (E_Name 116 (E_Identifier 117 ((*Left*) 26) )) ) (E_Literal 118 (Integer_Literal 2) ) ) )) 
        (S_If 119 (E_Binary_Operation 120 Less_Than (E_Name 121 (E_Indexed_Component 122 (E_Identifier 123 ((*A*) 23) ) (E_Name 124 (E_Identifier 125 ((*Med*) 28) )) )) (E_Name 126 (E_Identifier 127 ((*I*) 24) )) )
          (S_Assignment 128 (E_Identifier 129 ((*Left*) 26) ) (E_Binary_Operation 130 Plus (E_Name 131 (E_Identifier 132 ((*Med*) 28) )) (E_Literal 133 (Integer_Literal 1) ) ))
          (S_If 134 (E_Binary_Operation 135 Greater_Than (E_Name 136 (E_Indexed_Component 137 (E_Identifier 138 ((*A*) 23) ) (E_Name 139 (E_Identifier 140 ((*Med*) 28) )) )) (E_Name 141 (E_Identifier 142 ((*I*) 24) )) )
            (S_Assignment 143 (E_Identifier 144 ((*Right*) 27) ) (E_Binary_Operation 145 Minus (E_Name 146 (E_Identifier 147 ((*Med*) 28) )) (E_Literal 148 (Integer_Literal 1) ) ))
            (S_Assignment 149 (E_Identifier 150 ((*R*) 25) ) (E_Name 151 (E_Identifier 152 ((*Med*) 28) )))
          )
        ))
      )))))
  )
) 
(D_Seq_Declaration 153
(D_Object_Declaration 155 (mkobject_declaration 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((E_Literal 154 (Integer_Literal 2) ))))) 
(D_Seq_Declaration 157
(D_Object_Declaration 159 (mkobject_declaration 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((E_Literal 158 (Integer_Literal 3) ))))) 
(D_Seq_Declaration 161
(D_Object_Declaration 163 (mkobject_declaration 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((E_Literal 162 (Integer_Literal 4) ))))) 
(D_Object_Declaration 166 (mkobject_declaration 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((E_Literal 165 (Integer_Literal 6) ))))))))))))))))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 168
    (S_Procedure_Call 169 170 ((*increase*) 15) 
      ((E_Literal 171 (Integer_Literal 10) ) :: (E_Name 172 (E_Identifier 173 ((*X4*) 32) )) :: nil)
    ) 
    (S_Sequence 174
    (S_Assignment 175 (E_Identifier 176 ((*X1*) 29) ) (E_Binary_Operation 177 Plus (E_Name 178 (E_Identifier 179 ((*X1*) 29) )) (E_Literal 180 (Integer_Literal 1) ) )) 
    (S_Sequence 181
    (S_Assignment 182 (E_Identifier 183 ((*X2*) 30) ) (E_Binary_Operation 184 Plus (E_Name 185 (E_Identifier 186 ((*X2*) 30) )) (E_Literal 187 (Integer_Literal 2) ) )) 
    (S_Sequence 188
    (S_Assignment 189 (E_Identifier 190 ((*X4*) 32) ) (E_Binary_Operation 191 Plus (E_Name 192 (E_Identifier 193 ((*X3*) 31) )) (E_Name 194 (E_Identifier 195 ((*X4*) 32) )) )) 
    (S_Sequence 196
    (S_Assignment 197 (E_Indexed_Component 198 (E_Identifier 199 ((*A*) 6) ) (E_Literal 200 (Integer_Literal 0) ) ) (E_Literal 201 (Integer_Literal 0) )) 
    (S_Sequence 202
    (S_Assignment 203 (E_Indexed_Component 204 (E_Identifier 205 ((*A*) 6) ) (E_Literal 206 (Integer_Literal 1) ) ) (E_Literal 207 (Integer_Literal 10) )) 
    (S_Procedure_Call 208 209 ((*Search*) 22) 
      ((E_Name 210 (E_Identifier 211 ((*A*) 6) )) :: (E_Name 212 (E_Identifier 213 ((*I*) 2) )) :: (E_Name 214 (E_Identifier 215 ((*R*) 7) )) :: nil)
    )))))))
))) :: (((*increase*) 15), (1, (mkprocedure_body 37
  (* = = = Procedure Name = = = *)
  ((*increase*) 15)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 38 ((*X*) 16) Integer In) :: 
  (mkparameter_specification 39 ((*Y*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 40 (E_Identifier 41 ((*Y*) 17) ) (E_Binary_Operation 42 Plus (E_Name 43 (E_Identifier 44 ((*X*) 16) )) (E_Literal 45 (Integer_Literal 1) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*RT*) 12), (Record_Type_Declaration 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) :: (((*T3*) 10), (Subtype_Declaration 27 ((*T3*) 10) Integer (Range 1 10))) :: (((*Ar*) 5), (Array_Type_Declaration 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*T4*) 11), (Subtype_Declaration 30 ((*T4*) 11) Integer (Range 5 10))) :: (((*T2*) 9), (Derived_Type_Declaration 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range 2 5))) :: (((*T1*) 8), (Derived_Type_Declaration 21 ((*T1*) 8) Integer (Range 1 10))) :: (((*U*) 4), (Subtype_Declaration 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) :: (((*T*) 3), (Integer_Type_Declaration 6 ((*T*) 3) (Range 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((137, Integer) :: (146, (Subtype ((*U*) 4))) :: (92, (Array_Type ((*Ar*) 5))) :: (200, Integer) :: (101, Boolean) :: (173, (Subtype ((*T4*) 11))) :: (191, Integer) :: (83, (Integer_Type ((*T*) 3))) :: (110, (Subtype ((*U*) 4))) :: (104, (Subtype ((*U*) 4))) :: (95, Integer) :: (131, (Subtype ((*U*) 4))) :: (122, Integer) :: (194, (Subtype ((*T4*) 11))) :: (176, (Derived_Type ((*T1*) 8))) :: (86, Integer) :: (158, Integer) :: (185, (Derived_Type ((*T2*) 9))) :: (113, (Integer_Type ((*T*) 3))) :: (41, Integer) :: (140, (Subtype ((*U*) 4))) :: (44, Integer) :: (125, (Subtype ((*U*) 4))) :: (80, Integer) :: (89, Boolean) :: (116, (Subtype ((*U*) 4))) :: (98, (Integer_Type ((*T*) 3))) :: (71, Integer) :: (74, (Integer_Type ((*T*) 3))) :: (47, Boolean) :: (193, (Subtype ((*T3*) 10))) :: (184, (Derived_Type ((*T2*) 9))) :: (211, (Array_Type ((*Ar*) 5))) :: (142, Integer) :: (151, (Subtype ((*U*) 4))) :: (124, (Subtype ((*U*) 4))) :: (205, (Array_Type ((*Ar*) 5))) :: (133, Integer) :: (214, (Integer_Type ((*T*) 3))) :: (178, (Derived_Type ((*T1*) 8))) :: (115, (Subtype ((*U*) 4))) :: (187, Integer) :: (172, (Subtype ((*T4*) 11))) :: (118, Integer) :: (127, Integer) :: (199, (Array_Type ((*Ar*) 5))) :: (136, Integer) :: (109, (Integer_Type ((*T*) 3))) :: (91, Integer) :: (82, (Array_Type ((*Ar*) 5))) :: (190, (Subtype ((*T4*) 11))) :: (145, (Integer_Type ((*T*) 3))) :: (154, Integer) :: (94, (Subtype ((*U*) 4))) :: (67, Integer) :: (85, (Subtype ((*U*) 4))) :: (139, (Subtype ((*U*) 4))) :: (130, (Integer_Type ((*T*) 3))) :: (121, Integer) :: (148, Integer) :: (103, (Subtype ((*U*) 4))) :: (112, (Integer_Type ((*T*) 3))) :: (79, Boolean) :: (88, Integer) :: (70, (Subtype ((*U*) 4))) :: (43, Integer) :: (180, Integer) :: (207, Integer) :: (198, Integer) :: (147, (Subtype ((*U*) 4))) :: (183, (Derived_Type ((*T2*) 9))) :: (129, (Subtype ((*U*) 4))) :: (210, (Array_Type ((*Ar*) 5))) :: (138, (Array_Type ((*Ar*) 5))) :: (120, Boolean) :: (165, Integer) :: (192, (Subtype ((*T3*) 10))) :: (201, Integer) :: (213, Integer) :: (186, (Derived_Type ((*T2*) 9))) :: (87, Integer) :: (96, Integer) :: (177, (Derived_Type ((*T1*) 8))) :: (132, (Subtype ((*U*) 4))) :: (150, (Integer_Type ((*T*) 3))) :: (141, Integer) :: (105, (Subtype ((*U*) 4))) :: (114, (Subtype ((*U*) 4))) :: (123, (Array_Type ((*Ar*) 5))) :: (204, Integer) :: (195, (Subtype ((*T4*) 11))) :: (78, Boolean) :: (99, Integer) :: (90, Integer) :: (45, Integer) :: (171, Integer) :: (81, Integer) :: (144, (Subtype ((*U*) 4))) :: (126, Integer) :: (162, Integer) :: (108, (Subtype ((*U*) 4))) :: (135, Boolean) :: (117, (Subtype ((*U*) 4))) :: (84, (Subtype ((*U*) 4))) :: (102, (Subtype ((*U*) 4))) :: (93, (Subtype ((*U*) 4))) :: (75, Integer) :: (111, (Subtype ((*U*) 4))) :: (66, (Subtype ((*U*) 4))) :: (42, Integer) :: (212, Integer) :: (152, (Subtype ((*U*) 4))) :: (179, (Derived_Type ((*T1*) 8))) :: (215, (Integer_Type ((*T*) 3))) :: (206, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((137, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)15)) :: (146, (sloc (*Line*)47 (*Col*)18 (*EndLine*)47 (*EndCol*)20)) :: (92, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)28)) :: (200, (sloc (*Line*)67 (*Col*)6 (*EndLine*)67 (*EndCol*)6)) :: (101, (sloc (*Line*)41 (*Col*)13 (*EndLine*)41 (*EndCol*)25)) :: (173, (sloc (*Line*)62 (*Col*)17 (*EndLine*)62 (*EndCol*)18)) :: (191, (sloc (*Line*)65 (*Col*)10 (*EndLine*)65 (*EndCol*)16)) :: (83, (sloc (*Line*)37 (*Col*)13 (*EndLine*)37 (*EndCol*)18)) :: (110, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)13)) :: (104, (sloc (*Line*)41 (*Col*)21 (*EndLine*)41 (*EndCol*)25)) :: (95, (sloc (*Line*)37 (*Col*)40 (*EndLine*)37 (*EndCol*)40)) :: (131, (sloc (*Line*)44 (*Col*)14 (*EndLine*)44 (*EndCol*)16)) :: (122, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)12)) :: (194, (sloc (*Line*)65 (*Col*)15 (*EndLine*)65 (*EndCol*)16)) :: (176, (sloc (*Line*)63 (*Col*)4 (*EndLine*)63 (*EndCol*)5)) :: (86, (sloc (*Line*)37 (*Col*)18 (*EndLine*)37 (*EndCol*)18)) :: (158, (sloc (*Line*)57 (*Col*)14 (*EndLine*)57 (*EndCol*)14)) :: (185, (sloc (*Line*)64 (*Col*)10 (*EndLine*)64 (*EndCol*)11)) :: (113, (sloc (*Line*)42 (*Col*)18 (*EndLine*)42 (*EndCol*)29)) :: (41, (sloc (*Line*)23 (*Col*)7 (*EndLine*)23 (*EndCol*)7)) :: (140, (sloc (*Line*)46 (*Col*)12 (*EndLine*)46 (*EndCol*)14)) :: (44, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)12)) :: (125, (sloc (*Line*)43 (*Col*)9 (*EndLine*)43 (*EndCol*)11)) :: (80, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)19)) :: (89, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)40)) :: (116, (sloc (*Line*)42 (*Col*)26 (*EndLine*)42 (*EndCol*)29)) :: (98, (sloc (*Line*)38 (*Col*)3 (*EndLine*)38 (*EndCol*)3)) :: (71, (sloc (*Line*)34 (*Col*)16 (*EndLine*)34 (*EndCol*)17)) :: (74, (sloc (*Line*)36 (*Col*)7 (*EndLine*)36 (*EndCol*)7)) :: (47, (sloc (*Line*)25 (*Col*)18 (*EndLine*)25 (*EndCol*)21)) :: (193, (sloc (*Line*)65 (*Col*)10 (*EndLine*)65 (*EndCol*)11)) :: (184, (sloc (*Line*)64 (*Col*)10 (*EndLine*)64 (*EndCol*)15)) :: (211, (sloc (*Line*)69 (*Col*)11 (*EndLine*)69 (*EndCol*)11)) :: (142, (sloc (*Line*)46 (*Col*)19 (*EndLine*)46 (*EndCol*)19)) :: (151, (sloc (*Line*)49 (*Col*)14 (*EndLine*)49 (*EndCol*)16)) :: (124, (sloc (*Line*)43 (*Col*)9 (*EndLine*)43 (*EndCol*)11)) :: (205, (sloc (*Line*)68 (*Col*)4 (*EndLine*)68 (*EndCol*)4)) :: (133, (sloc (*Line*)44 (*Col*)20 (*EndLine*)44 (*EndCol*)20)) :: (214, (sloc (*Line*)69 (*Col*)17 (*EndLine*)69 (*EndCol*)17)) :: (178, (sloc (*Line*)63 (*Col*)10 (*EndLine*)63 (*EndCol*)11)) :: (115, (sloc (*Line*)42 (*Col*)18 (*EndLine*)42 (*EndCol*)22)) :: (187, (sloc (*Line*)64 (*Col*)15 (*EndLine*)64 (*EndCol*)15)) :: (172, (sloc (*Line*)62 (*Col*)17 (*EndLine*)62 (*EndCol*)18)) :: (118, (sloc (*Line*)42 (*Col*)34 (*EndLine*)42 (*EndCol*)34)) :: (127, (sloc (*Line*)43 (*Col*)16 (*EndLine*)43 (*EndCol*)16)) :: (199, (sloc (*Line*)67 (*Col*)4 (*EndLine*)67 (*EndCol*)4)) :: (136, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)15)) :: (109, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)34)) :: (91, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)36)) :: (82, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)10)) :: (190, (sloc (*Line*)65 (*Col*)4 (*EndLine*)65 (*EndCol*)5)) :: (145, (sloc (*Line*)47 (*Col*)18 (*EndLine*)47 (*EndCol*)24)) :: (154, (sloc (*Line*)56 (*Col*)14 (*EndLine*)56 (*EndCol*)14)) :: (94, (sloc (*Line*)37 (*Col*)31 (*EndLine*)37 (*EndCol*)35)) :: (67, (sloc (*Line*)33 (*Col*)16 (*EndLine*)33 (*EndCol*)16)) :: (85, (sloc (*Line*)37 (*Col*)13 (*EndLine*)37 (*EndCol*)16)) :: (139, (sloc (*Line*)46 (*Col*)12 (*EndLine*)46 (*EndCol*)14)) :: (130, (sloc (*Line*)44 (*Col*)14 (*EndLine*)44 (*EndCol*)20)) :: (121, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)12)) :: (148, (sloc (*Line*)47 (*Col*)24 (*EndLine*)47 (*EndCol*)24)) :: (103, (sloc (*Line*)41 (*Col*)13 (*EndLine*)41 (*EndCol*)16)) :: (112, (sloc (*Line*)42 (*Col*)17 (*EndLine*)42 (*EndCol*)34)) :: (79, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)23)) :: (88, (sloc (*Line*)37 (*Col*)23 (*EndLine*)37 (*EndCol*)23)) :: (70, (sloc (*Line*)34 (*Col*)7 (*EndLine*)34 (*EndCol*)11)) :: (43, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)12)) :: (180, (sloc (*Line*)63 (*Col*)15 (*EndLine*)63 (*EndCol*)15)) :: (207, (sloc (*Line*)68 (*Col*)12 (*EndLine*)68 (*EndCol*)13)) :: (198, (sloc (*Line*)67 (*Col*)4 (*EndLine*)67 (*EndCol*)7)) :: (147, (sloc (*Line*)47 (*Col*)18 (*EndLine*)47 (*EndCol*)20)) :: (183, (sloc (*Line*)64 (*Col*)4 (*EndLine*)64 (*EndCol*)5)) :: (129, (sloc (*Line*)44 (*Col*)6 (*EndLine*)44 (*EndCol*)9)) :: (210, (sloc (*Line*)69 (*Col*)11 (*EndLine*)69 (*EndCol*)11)) :: (138, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)9)) :: (120, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)16)) :: (165, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)14)) :: (192, (sloc (*Line*)65 (*Col*)10 (*EndLine*)65 (*EndCol*)11)) :: (201, (sloc (*Line*)67 (*Col*)12 (*EndLine*)67 (*EndCol*)12)) :: (213, (sloc (*Line*)69 (*Col*)14 (*EndLine*)69 (*EndCol*)14)) :: (186, (sloc (*Line*)64 (*Col*)10 (*EndLine*)64 (*EndCol*)11)) :: (87, (sloc (*Line*)37 (*Col*)23 (*EndLine*)37 (*EndCol*)23)) :: (96, (sloc (*Line*)37 (*Col*)40 (*EndLine*)37 (*EndCol*)40)) :: (177, (sloc (*Line*)63 (*Col*)10 (*EndLine*)63 (*EndCol*)15)) :: (132, (sloc (*Line*)44 (*Col*)14 (*EndLine*)44 (*EndCol*)16)) :: (150, (sloc (*Line*)49 (*Col*)9 (*EndLine*)49 (*EndCol*)9)) :: (141, (sloc (*Line*)46 (*Col*)19 (*EndLine*)46 (*EndCol*)19)) :: (105, (sloc (*Line*)41 (*Col*)21 (*EndLine*)41 (*EndCol*)25)) :: (114, (sloc (*Line*)42 (*Col*)18 (*EndLine*)42 (*EndCol*)22)) :: (123, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)6)) :: (204, (sloc (*Line*)68 (*Col*)4 (*EndLine*)68 (*EndCol*)7)) :: (195, (sloc (*Line*)65 (*Col*)15 (*EndLine*)65 (*EndCol*)16)) :: (78, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)40)) :: (99, (sloc (*Line*)38 (*Col*)8 (*EndLine*)38 (*EndCol*)8)) :: (90, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)36)) :: (45, (sloc (*Line*)23 (*Col*)16 (*EndLine*)23 (*EndCol*)16)) :: (171, (sloc (*Line*)62 (*Col*)13 (*EndLine*)62 (*EndCol*)14)) :: (81, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)19)) :: (144, (sloc (*Line*)47 (*Col*)9 (*EndLine*)47 (*EndCol*)13)) :: (126, (sloc (*Line*)43 (*Col*)16 (*EndLine*)43 (*EndCol*)16)) :: (162, (sloc (*Line*)58 (*Col*)14 (*EndLine*)58 (*EndCol*)14)) :: (108, (sloc (*Line*)42 (*Col*)3 (*EndLine*)42 (*EndCol*)5)) :: (135, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)19)) :: (117, (sloc (*Line*)42 (*Col*)26 (*EndLine*)42 (*EndCol*)29)) :: (84, (sloc (*Line*)37 (*Col*)13 (*EndLine*)37 (*EndCol*)16)) :: (102, (sloc (*Line*)41 (*Col*)13 (*EndLine*)41 (*EndCol*)16)) :: (93, (sloc (*Line*)37 (*Col*)31 (*EndLine*)37 (*EndCol*)35)) :: (75, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)12)) :: (111, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)13)) :: (66, (sloc (*Line*)33 (*Col*)7 (*EndLine*)33 (*EndCol*)10)) :: (42, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)16)) :: (212, (sloc (*Line*)69 (*Col*)14 (*EndLine*)69 (*EndCol*)14)) :: (152, (sloc (*Line*)49 (*Col*)14 (*EndLine*)49 (*EndCol*)16)) :: (179, (sloc (*Line*)63 (*Col*)10 (*EndLine*)63 (*EndCol*)11)) :: (215, (sloc (*Line*)69 (*Col*)17 (*EndLine*)69 (*EndCol*)17)) :: (206, (sloc (*Line*)68 (*Col*)6 (*EndLine*)68 (*EndCol*)6)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("A", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/A+28:22")) :: (32, ("X4", "ada://variable/Binary_Search_Test+1:11/X4+59:4")) :: (17, ("Y", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/Y+21:36")) :: (26, ("Left", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Left+29:7")) :: (29, ("X1", "ada://variable/Binary_Search_Test+1:11/X1+56:4")) :: (2, ("I", "ada://parameter/Binary_Search_Test+1:11/I+1:31")) :: (14, ("Y", "ada://component/Binary_Search_Test+1:11/RT+16:9/Y+18:7")) :: (13, ("X", "ada://component/Binary_Search_Test+1:11/RT+16:9/X+17:7")) :: (31, ("X3", "ada://variable/Binary_Search_Test+1:11/X3+58:4")) :: (7, ("R", "ada://variable/Binary_Search_Test+1:11/R+9:4")) :: (16, ("X", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/X+21:24")) :: (25, ("R", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/R+28:43")) :: (28, ("Med", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Med+31:7")) :: (27, ("Right", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Right+30:7")) :: (21, ("B", "ada://variable/Binary_Search_Test+1:11/B+25:4")) :: (30, ("X2", "ada://variable/Binary_Search_Test+1:11/X2+57:4")) :: (6, ("A", "ada://variable/Binary_Search_Test+1:11/A+8:4")) :: (24, ("I", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/I+28:30")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((22, ("Search", "ada://procedure_body/Binary_Search_Test+1:11/Search+28:14")) :: (1, ("Binary_Search_Test", "ada://procedure_body/Binary_Search_Test+1:11")) :: (15, ("increase", "ada://procedure_body/Binary_Search_Test+1:11/increase+21:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((8, ("T1", "ada://ordinary_type/Binary_Search_Test+1:11/T1+12:9")) :: (11, ("T4", "ada://subtype/Binary_Search_Test+1:11/T4+15:12")) :: (5, ("Ar", "ada://ordinary_type/Binary_Search_Test+1:11/Ar+6:9")) :: (4, ("U", "ada://subtype/Binary_Search_Test+1:11/U+4:12")) :: (10, ("T3", "ada://subtype/Binary_Search_Test+1:11/T3+14:12")) :: (9, ("T2", "ada://ordinary_type/Binary_Search_Test+1:11/T2+13:9")) :: (12, ("RT", "ada://ordinary_type/Binary_Search_Test+1:11/RT+16:9")) :: (3, ("T", "ada://ordinary_type/Binary_Search_Test+1:11/T+3:9")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Procedure_Body_X 1 
  (mkprocedure_body_x 2
    (* = = = Procedure Name = = = *)
    ((*Binary_Search_Test*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 3 ((*I*) 2) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 4
  (D_Type_Declaration_X 5 (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) 
  (D_Seq_Declaration_X 7
  (D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) 
  (D_Seq_Declaration_X 10
  (D_Type_Declaration_X 11 (Array_Type_Declaration_X 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (D_Seq_Declaration_X 13
  (D_Object_Declaration_X 14 (mkobject_declaration_x 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
  (D_Seq_Declaration_X 16
  (D_Object_Declaration_X 17 (mkobject_declaration_x 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
  (D_Seq_Declaration_X 19
  (D_Type_Declaration_X 20 (Derived_Type_Declaration_X 21 ((*T1*) 8) Integer (Range_X 1 10))) 
  (D_Seq_Declaration_X 22
  (D_Type_Declaration_X 23 (Derived_Type_Declaration_X 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range_X 2 5))) 
  (D_Seq_Declaration_X 25
  (D_Type_Declaration_X 26 (Subtype_Declaration_X 27 ((*T3*) 10) Integer (Range_X 1 10))) 
  (D_Seq_Declaration_X 28
  (D_Type_Declaration_X 29 (Subtype_Declaration_X 30 ((*T4*) 11) Integer (Range_X 5 10))) 
  (D_Seq_Declaration_X 31
  (D_Type_Declaration_X 32 (Record_Type_Declaration_X 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
  (D_Seq_Declaration_X 35
  (D_Procedure_Body_X 36 
    (mkprocedure_body_x 37
      (* = = = Procedure Name = = = *)
      ((*increase*) 15)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 38 ((*X*) 16) Integer In) :: 
      (mkparameter_specification_x 39 ((*Y*) 17) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (D_Null_Declaration_X)
      (* = = = Procedure Body = = = *)
        (S_Assignment_X 40 (E_Identifier_X 41 ((*Y*) 17) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 16) (nil))) (E_Literal_X 45 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
    )
  ) 
  (D_Seq_Declaration_X 46
  (D_Object_Declaration_X 48 (mkobject_declaration_x 49 ((*B*) 21) Boolean (Some ((E_Literal_X 47 (Boolean_Literal true) (nil) nil))))) 
  (D_Seq_Declaration_X 50
  (D_Procedure_Body_X 51 
    (mkprocedure_body_x 52
      (* = = = Procedure Name = = = *)
      ((*Search*) 22)
      (* = = = Formal Parameters = = = *)
      (
      (mkparameter_specification_x 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
      (mkparameter_specification_x 54 ((*I*) 24) Integer In) :: 
      (mkparameter_specification_x 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
      (* = = = Object Declarations = = = *)
      ((D_Seq_Declaration_X 56
    (D_Object_Declaration_X 57 (mkobject_declaration_x 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
    (D_Seq_Declaration_X 59
    (D_Object_Declaration_X 60 (mkobject_declaration_x 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
    (D_Object_Declaration_X 62 (mkobject_declaration_x 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
      (* = = = Procedure Body = = = *)
        (S_Sequence_X 64
        (S_Assignment_X 65 (E_Identifier_X 66 ((*Left*) 26) (nil)) (E_Literal_X 67 (Integer_Literal 0) (nil) nil)) 
        (S_Sequence_X 68
        (S_Assignment_X 69 (E_Identifier_X 70 ((*Right*) 27) (nil)) (E_Literal_X 71 (Integer_Literal 10) (nil) nil)) 
        (S_Sequence_X 72
        (S_Assignment_X 73 (E_Identifier_X 74 ((*R*) 25) (nil)) (E_Literal_X 75 (Integer_Literal 0) (nil) nil)) 
        (S_Sequence_X 76
        (S_If_X 77 (E_Binary_Operation_X 78 Or (E_Binary_Operation_X 79 Greater_Than (E_Name_X 80 (E_Indexed_Component_X 81 (E_Identifier_X 82 ((*A*) 23) (nil)) (E_Binary_Operation_X 83 Plus (E_Name_X 84 (E_Identifier_X 85 ((*Left*) 26) (nil))) (E_Literal_X 86 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil))) (E_Name_X 87 (E_Identifier_X 88 ((*I*) 24) (nil))) (nil) nil) (E_Binary_Operation_X 89 Less_Than (E_Name_X 90 (E_Indexed_Component_X 91 (E_Identifier_X 92 ((*A*) 23) (nil)) (E_Name_X 93 (E_Identifier_X 94 ((*Right*) 27) (nil))) (nil))) (E_Name_X 95 (E_Identifier_X 96 ((*I*) 24) (nil))) (nil) nil) (nil) nil)
          (S_Assignment_X 97 (E_Identifier_X 98 ((*R*) 25) (nil)) (E_Literal_X 99 (Integer_Literal 0) (nil) nil))
          S_Null_X
        ) 
        (S_While_Loop_X 100 (E_Binary_Operation_X 101 Less_Than_Or_Equal (E_Name_X 102 (E_Identifier_X 103 ((*Left*) 26) (nil))) (E_Name_X 104 (E_Identifier_X 105 ((*Right*) 27) (nil))) (nil) nil)
          (S_Sequence_X 106
          (S_Assignment_X 107 (E_Identifier_X 108 ((*Med*) 28) (nil)) (E_Binary_Operation_X 109 Plus (E_Name_X 110 (E_Identifier_X 111 ((*Left*) 26) (nil))) (E_Binary_Operation_X 112 Divide (E_Binary_Operation_X 113 Minus (E_Name_X 114 (E_Identifier_X 115 ((*Right*) 27) (nil))) (E_Name_X 116 (E_Identifier_X 117 ((*Left*) 26) (nil))) (nil) nil) (E_Literal_X 118 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil) (Do_Range_Check :: nil) nil)) 
          (S_If_X 119 (E_Binary_Operation_X 120 Less_Than (E_Name_X 121 (E_Indexed_Component_X 122 (E_Identifier_X 123 ((*A*) 23) (nil)) (E_Name_X 124 (E_Identifier_X 125 ((*Med*) 28) (nil))) (nil))) (E_Name_X 126 (E_Identifier_X 127 ((*I*) 24) (nil))) (nil) nil)
            (S_Assignment_X 128 (E_Identifier_X 129 ((*Left*) 26) (nil)) (E_Binary_Operation_X 130 Plus (E_Name_X 131 (E_Identifier_X 132 ((*Med*) 28) (nil))) (E_Literal_X 133 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
            (S_If_X 134 (E_Binary_Operation_X 135 Greater_Than (E_Name_X 136 (E_Indexed_Component_X 137 (E_Identifier_X 138 ((*A*) 23) (nil)) (E_Name_X 139 (E_Identifier_X 140 ((*Med*) 28) (nil))) (nil))) (E_Name_X 141 (E_Identifier_X 142 ((*I*) 24) (nil))) (nil) nil)
              (S_Assignment_X 143 (E_Identifier_X 144 ((*Right*) 27) (nil)) (E_Binary_Operation_X 145 Minus (E_Name_X 146 (E_Identifier_X 147 ((*Med*) 28) (nil))) (E_Literal_X 148 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
              (S_Assignment_X 149 (E_Identifier_X 150 ((*R*) 25) (nil)) (E_Name_X 151 (E_Identifier_X 152 ((*Med*) 28) (nil))))
            )
          ))
        )))))
    )
  ) 
  (D_Seq_Declaration_X 153
  (D_Object_Declaration_X 155 (mkobject_declaration_x 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((E_Literal_X 154 (Integer_Literal 2) (nil) nil))))) 
  (D_Seq_Declaration_X 157
  (D_Object_Declaration_X 159 (mkobject_declaration_x 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((E_Literal_X 158 (Integer_Literal 3) (nil) nil))))) 
  (D_Seq_Declaration_X 161
  (D_Object_Declaration_X 163 (mkobject_declaration_x 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((E_Literal_X 162 (Integer_Literal 4) (nil) nil))))) 
  (D_Object_Declaration_X 166 (mkobject_declaration_x 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((E_Literal_X 165 (Integer_Literal 6) (nil) nil))))))))))))))))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 168
      (S_Procedure_Call_X 169 170 ((*increase*) 15) 
        ((E_Literal_X 171 (Integer_Literal 10) (nil) nil) :: (E_Name_X 172 (E_Identifier_X 173 ((*X4*) 32) (Do_Range_Check :: nil))) :: nil)
      ) 
      (S_Sequence_X 174
      (S_Assignment_X 175 (E_Identifier_X 176 ((*X1*) 29) (nil)) (E_Binary_Operation_X 177 Plus (E_Name_X 178 (E_Identifier_X 179 ((*X1*) 29) (nil))) (E_Literal_X 180 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_Sequence_X 181
      (S_Assignment_X 182 (E_Identifier_X 183 ((*X2*) 30) (nil)) (E_Binary_Operation_X 184 Plus (E_Name_X 185 (E_Identifier_X 186 ((*X2*) 30) (nil))) (E_Literal_X 187 (Integer_Literal 2) (nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_Sequence_X 188
      (S_Assignment_X 189 (E_Identifier_X 190 ((*X4*) 32) (nil)) (E_Binary_Operation_X 191 Plus (E_Name_X 192 (E_Identifier_X 193 ((*X3*) 31) (nil))) (E_Name_X 194 (E_Identifier_X 195 ((*X4*) 32) (nil))) (Do_Range_Check :: nil) nil)) 
      (S_Sequence_X 196
      (S_Assignment_X 197 (E_Indexed_Component_X 198 (E_Identifier_X 199 ((*A*) 6) (nil)) (E_Literal_X 200 (Integer_Literal 0) (nil) nil) (nil)) (E_Literal_X 201 (Integer_Literal 0) (nil) nil)) 
      (S_Sequence_X 202
      (S_Assignment_X 203 (E_Indexed_Component_X 204 (E_Identifier_X 205 ((*A*) 6) (nil)) (E_Literal_X 206 (Integer_Literal 1) (nil) nil) (nil)) (E_Literal_X 207 (Integer_Literal 10) (nil) nil)) 
      (S_Procedure_Call_X 208 209 ((*Search*) 22) 
        ((E_Name_X 210 (E_Identifier_X 211 ((*A*) 6) (nil))) :: (E_Name_X 212 (E_Identifier_X 213 ((*I*) 2) (nil))) :: (E_Name_X 214 (E_Identifier_X 215 ((*R*) 7) (nil))) :: nil)
      )))))))
  )
).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*X3*) 31), (In_Out, (Subtype ((*T3*) 10)))) :: (((*R*) 25), (Out, (Integer_Type ((*T*) 3)))) :: (((*R*) 7), (In_Out, (Integer_Type ((*T*) 3)))) :: (((*X1*) 29), (In_Out, (Derived_Type ((*T1*) 8)))) :: (((*I*) 24), (In, Integer)) :: (((*X*) 16), (In, Integer)) :: (((*B*) 21), (In_Out, Boolean)) :: (((*X4*) 32), (In_Out, (Subtype ((*T4*) 11)))) :: (((*I*) 2), (In, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: (((*Left*) 26), (In_Out, (Subtype ((*U*) 4)))) :: (((*Right*) 27), (In_Out, (Subtype ((*U*) 4)))) :: (((*Med*) 28), (In_Out, (Subtype ((*U*) 4)))) :: (((*X2*) 30), (In_Out, (Derived_Type ((*T2*) 9)))) :: (((*Y*) 17), (Out, Integer)) :: (((*A*) 23), (In, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 22), (1, (mkprocedure_body_x 52
  (* = = = Procedure Name = = = *)
  ((*Search*) 22)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
  (mkparameter_specification_x 54 ((*I*) 24) Integer In) :: 
  (mkparameter_specification_x 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 56
(D_Object_Declaration_X 57 (mkobject_declaration_x 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
(D_Seq_Declaration_X 59
(D_Object_Declaration_X 60 (mkobject_declaration_x 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
(D_Object_Declaration_X 62 (mkobject_declaration_x 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 64
    (S_Assignment_X 65 (E_Identifier_X 66 ((*Left*) 26) (nil)) (E_Literal_X 67 (Integer_Literal 0) (nil) nil)) 
    (S_Sequence_X 68
    (S_Assignment_X 69 (E_Identifier_X 70 ((*Right*) 27) (nil)) (E_Literal_X 71 (Integer_Literal 10) (nil) nil)) 
    (S_Sequence_X 72
    (S_Assignment_X 73 (E_Identifier_X 74 ((*R*) 25) (nil)) (E_Literal_X 75 (Integer_Literal 0) (nil) nil)) 
    (S_Sequence_X 76
    (S_If_X 77 (E_Binary_Operation_X 78 Or (E_Binary_Operation_X 79 Greater_Than (E_Name_X 80 (E_Indexed_Component_X 81 (E_Identifier_X 82 ((*A*) 23) (nil)) (E_Binary_Operation_X 83 Plus (E_Name_X 84 (E_Identifier_X 85 ((*Left*) 26) (nil))) (E_Literal_X 86 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil))) (E_Name_X 87 (E_Identifier_X 88 ((*I*) 24) (nil))) (nil) nil) (E_Binary_Operation_X 89 Less_Than (E_Name_X 90 (E_Indexed_Component_X 91 (E_Identifier_X 92 ((*A*) 23) (nil)) (E_Name_X 93 (E_Identifier_X 94 ((*Right*) 27) (nil))) (nil))) (E_Name_X 95 (E_Identifier_X 96 ((*I*) 24) (nil))) (nil) nil) (nil) nil)
      (S_Assignment_X 97 (E_Identifier_X 98 ((*R*) 25) (nil)) (E_Literal_X 99 (Integer_Literal 0) (nil) nil))
      S_Null_X
    ) 
    (S_While_Loop_X 100 (E_Binary_Operation_X 101 Less_Than_Or_Equal (E_Name_X 102 (E_Identifier_X 103 ((*Left*) 26) (nil))) (E_Name_X 104 (E_Identifier_X 105 ((*Right*) 27) (nil))) (nil) nil)
      (S_Sequence_X 106
      (S_Assignment_X 107 (E_Identifier_X 108 ((*Med*) 28) (nil)) (E_Binary_Operation_X 109 Plus (E_Name_X 110 (E_Identifier_X 111 ((*Left*) 26) (nil))) (E_Binary_Operation_X 112 Divide (E_Binary_Operation_X 113 Minus (E_Name_X 114 (E_Identifier_X 115 ((*Right*) 27) (nil))) (E_Name_X 116 (E_Identifier_X 117 ((*Left*) 26) (nil))) (nil) nil) (E_Literal_X 118 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil) (Do_Range_Check :: nil) nil)) 
      (S_If_X 119 (E_Binary_Operation_X 120 Less_Than (E_Name_X 121 (E_Indexed_Component_X 122 (E_Identifier_X 123 ((*A*) 23) (nil)) (E_Name_X 124 (E_Identifier_X 125 ((*Med*) 28) (nil))) (nil))) (E_Name_X 126 (E_Identifier_X 127 ((*I*) 24) (nil))) (nil) nil)
        (S_Assignment_X 128 (E_Identifier_X 129 ((*Left*) 26) (nil)) (E_Binary_Operation_X 130 Plus (E_Name_X 131 (E_Identifier_X 132 ((*Med*) 28) (nil))) (E_Literal_X 133 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
        (S_If_X 134 (E_Binary_Operation_X 135 Greater_Than (E_Name_X 136 (E_Indexed_Component_X 137 (E_Identifier_X 138 ((*A*) 23) (nil)) (E_Name_X 139 (E_Identifier_X 140 ((*Med*) 28) (nil))) (nil))) (E_Name_X 141 (E_Identifier_X 142 ((*I*) 24) (nil))) (nil) nil)
          (S_Assignment_X 143 (E_Identifier_X 144 ((*Right*) 27) (nil)) (E_Binary_Operation_X 145 Minus (E_Name_X 146 (E_Identifier_X 147 ((*Med*) 28) (nil))) (E_Literal_X 148 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
          (S_Assignment_X 149 (E_Identifier_X 150 ((*R*) 25) (nil)) (E_Name_X 151 (E_Identifier_X 152 ((*Med*) 28) (nil))))
        )
      ))
    )))))
))) :: (((*Binary_Search_Test*) 1), (0, (mkprocedure_body_x 2
  (* = = = Procedure Name = = = *)
  ((*Binary_Search_Test*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 3 ((*I*) 2) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 4
(D_Type_Declaration_X 5 (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) 
(D_Seq_Declaration_X 7
(D_Type_Declaration_X 8 (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) 
(D_Seq_Declaration_X 10
(D_Type_Declaration_X 11 (Array_Type_Declaration_X 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(D_Seq_Declaration_X 13
(D_Object_Declaration_X 14 (mkobject_declaration_x 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
(D_Seq_Declaration_X 16
(D_Object_Declaration_X 17 (mkobject_declaration_x 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
(D_Seq_Declaration_X 19
(D_Type_Declaration_X 20 (Derived_Type_Declaration_X 21 ((*T1*) 8) Integer (Range_X 1 10))) 
(D_Seq_Declaration_X 22
(D_Type_Declaration_X 23 (Derived_Type_Declaration_X 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range_X 2 5))) 
(D_Seq_Declaration_X 25
(D_Type_Declaration_X 26 (Subtype_Declaration_X 27 ((*T3*) 10) Integer (Range_X 1 10))) 
(D_Seq_Declaration_X 28
(D_Type_Declaration_X 29 (Subtype_Declaration_X 30 ((*T4*) 11) Integer (Range_X 5 10))) 
(D_Seq_Declaration_X 31
(D_Type_Declaration_X 32 (Record_Type_Declaration_X 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
(D_Seq_Declaration_X 35
(D_Procedure_Body_X 36 
  (mkprocedure_body_x 37
    (* = = = Procedure Name = = = *)
    ((*increase*) 15)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 38 ((*X*) 16) Integer In) :: 
    (mkparameter_specification_x 39 ((*Y*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 40 (E_Identifier_X 41 ((*Y*) 17) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 16) (nil))) (E_Literal_X 45 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
  )
) 
(D_Seq_Declaration_X 46
(D_Object_Declaration_X 48 (mkobject_declaration_x 49 ((*B*) 21) Boolean (Some ((E_Literal_X 47 (Boolean_Literal true) (nil) nil))))) 
(D_Seq_Declaration_X 50
(D_Procedure_Body_X 51 
  (mkprocedure_body_x 52
    (* = = = Procedure Name = = = *)
    ((*Search*) 22)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
    (mkparameter_specification_x 54 ((*I*) 24) Integer In) :: 
    (mkparameter_specification_x 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 56
  (D_Object_Declaration_X 57 (mkobject_declaration_x 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
  (D_Seq_Declaration_X 59
  (D_Object_Declaration_X 60 (mkobject_declaration_x 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
  (D_Object_Declaration_X 62 (mkobject_declaration_x 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 64
      (S_Assignment_X 65 (E_Identifier_X 66 ((*Left*) 26) (nil)) (E_Literal_X 67 (Integer_Literal 0) (nil) nil)) 
      (S_Sequence_X 68
      (S_Assignment_X 69 (E_Identifier_X 70 ((*Right*) 27) (nil)) (E_Literal_X 71 (Integer_Literal 10) (nil) nil)) 
      (S_Sequence_X 72
      (S_Assignment_X 73 (E_Identifier_X 74 ((*R*) 25) (nil)) (E_Literal_X 75 (Integer_Literal 0) (nil) nil)) 
      (S_Sequence_X 76
      (S_If_X 77 (E_Binary_Operation_X 78 Or (E_Binary_Operation_X 79 Greater_Than (E_Name_X 80 (E_Indexed_Component_X 81 (E_Identifier_X 82 ((*A*) 23) (nil)) (E_Binary_Operation_X 83 Plus (E_Name_X 84 (E_Identifier_X 85 ((*Left*) 26) (nil))) (E_Literal_X 86 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil))) (E_Name_X 87 (E_Identifier_X 88 ((*I*) 24) (nil))) (nil) nil) (E_Binary_Operation_X 89 Less_Than (E_Name_X 90 (E_Indexed_Component_X 91 (E_Identifier_X 92 ((*A*) 23) (nil)) (E_Name_X 93 (E_Identifier_X 94 ((*Right*) 27) (nil))) (nil))) (E_Name_X 95 (E_Identifier_X 96 ((*I*) 24) (nil))) (nil) nil) (nil) nil)
        (S_Assignment_X 97 (E_Identifier_X 98 ((*R*) 25) (nil)) (E_Literal_X 99 (Integer_Literal 0) (nil) nil))
        S_Null_X
      ) 
      (S_While_Loop_X 100 (E_Binary_Operation_X 101 Less_Than_Or_Equal (E_Name_X 102 (E_Identifier_X 103 ((*Left*) 26) (nil))) (E_Name_X 104 (E_Identifier_X 105 ((*Right*) 27) (nil))) (nil) nil)
        (S_Sequence_X 106
        (S_Assignment_X 107 (E_Identifier_X 108 ((*Med*) 28) (nil)) (E_Binary_Operation_X 109 Plus (E_Name_X 110 (E_Identifier_X 111 ((*Left*) 26) (nil))) (E_Binary_Operation_X 112 Divide (E_Binary_Operation_X 113 Minus (E_Name_X 114 (E_Identifier_X 115 ((*Right*) 27) (nil))) (E_Name_X 116 (E_Identifier_X 117 ((*Left*) 26) (nil))) (nil) nil) (E_Literal_X 118 (Integer_Literal 2) (nil) nil) (Do_Division_Check :: nil) nil) (Do_Range_Check :: nil) nil)) 
        (S_If_X 119 (E_Binary_Operation_X 120 Less_Than (E_Name_X 121 (E_Indexed_Component_X 122 (E_Identifier_X 123 ((*A*) 23) (nil)) (E_Name_X 124 (E_Identifier_X 125 ((*Med*) 28) (nil))) (nil))) (E_Name_X 126 (E_Identifier_X 127 ((*I*) 24) (nil))) (nil) nil)
          (S_Assignment_X 128 (E_Identifier_X 129 ((*Left*) 26) (nil)) (E_Binary_Operation_X 130 Plus (E_Name_X 131 (E_Identifier_X 132 ((*Med*) 28) (nil))) (E_Literal_X 133 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
          (S_If_X 134 (E_Binary_Operation_X 135 Greater_Than (E_Name_X 136 (E_Indexed_Component_X 137 (E_Identifier_X 138 ((*A*) 23) (nil)) (E_Name_X 139 (E_Identifier_X 140 ((*Med*) 28) (nil))) (nil))) (E_Name_X 141 (E_Identifier_X 142 ((*I*) 24) (nil))) (nil) nil)
            (S_Assignment_X 143 (E_Identifier_X 144 ((*Right*) 27) (nil)) (E_Binary_Operation_X 145 Minus (E_Name_X 146 (E_Identifier_X 147 ((*Med*) 28) (nil))) (E_Literal_X 148 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
            (S_Assignment_X 149 (E_Identifier_X 150 ((*R*) 25) (nil)) (E_Name_X 151 (E_Identifier_X 152 ((*Med*) 28) (nil))))
          )
        ))
      )))))
  )
) 
(D_Seq_Declaration_X 153
(D_Object_Declaration_X 155 (mkobject_declaration_x 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((E_Literal_X 154 (Integer_Literal 2) (nil) nil))))) 
(D_Seq_Declaration_X 157
(D_Object_Declaration_X 159 (mkobject_declaration_x 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((E_Literal_X 158 (Integer_Literal 3) (nil) nil))))) 
(D_Seq_Declaration_X 161
(D_Object_Declaration_X 163 (mkobject_declaration_x 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((E_Literal_X 162 (Integer_Literal 4) (nil) nil))))) 
(D_Object_Declaration_X 166 (mkobject_declaration_x 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((E_Literal_X 165 (Integer_Literal 6) (nil) nil))))))))))))))))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 168
    (S_Procedure_Call_X 169 170 ((*increase*) 15) 
      ((E_Literal_X 171 (Integer_Literal 10) (nil) nil) :: (E_Name_X 172 (E_Identifier_X 173 ((*X4*) 32) (Do_Range_Check :: nil))) :: nil)
    ) 
    (S_Sequence_X 174
    (S_Assignment_X 175 (E_Identifier_X 176 ((*X1*) 29) (nil)) (E_Binary_Operation_X 177 Plus (E_Name_X 178 (E_Identifier_X 179 ((*X1*) 29) (nil))) (E_Literal_X 180 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)) 
    (S_Sequence_X 181
    (S_Assignment_X 182 (E_Identifier_X 183 ((*X2*) 30) (nil)) (E_Binary_Operation_X 184 Plus (E_Name_X 185 (E_Identifier_X 186 ((*X2*) 30) (nil))) (E_Literal_X 187 (Integer_Literal 2) (nil) nil) (Do_Range_Check :: nil) nil)) 
    (S_Sequence_X 188
    (S_Assignment_X 189 (E_Identifier_X 190 ((*X4*) 32) (nil)) (E_Binary_Operation_X 191 Plus (E_Name_X 192 (E_Identifier_X 193 ((*X3*) 31) (nil))) (E_Name_X 194 (E_Identifier_X 195 ((*X4*) 32) (nil))) (Do_Range_Check :: nil) nil)) 
    (S_Sequence_X 196
    (S_Assignment_X 197 (E_Indexed_Component_X 198 (E_Identifier_X 199 ((*A*) 6) (nil)) (E_Literal_X 200 (Integer_Literal 0) (nil) nil) (nil)) (E_Literal_X 201 (Integer_Literal 0) (nil) nil)) 
    (S_Sequence_X 202
    (S_Assignment_X 203 (E_Indexed_Component_X 204 (E_Identifier_X 205 ((*A*) 6) (nil)) (E_Literal_X 206 (Integer_Literal 1) (nil) nil) (nil)) (E_Literal_X 207 (Integer_Literal 10) (nil) nil)) 
    (S_Procedure_Call_X 208 209 ((*Search*) 22) 
      ((E_Name_X 210 (E_Identifier_X 211 ((*A*) 6) (nil))) :: (E_Name_X 212 (E_Identifier_X 213 ((*I*) 2) (nil))) :: (E_Name_X 214 (E_Identifier_X 215 ((*R*) 7) (nil))) :: nil)
    )))))))
))) :: (((*increase*) 15), (1, (mkprocedure_body_x 37
  (* = = = Procedure Name = = = *)
  ((*increase*) 15)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 38 ((*X*) 16) Integer In) :: 
  (mkparameter_specification_x 39 ((*Y*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 40 (E_Identifier_X 41 ((*Y*) 17) (nil)) (E_Binary_Operation_X 42 Plus (E_Name_X 43 (E_Identifier_X 44 ((*X*) 16) (nil))) (E_Literal_X 45 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*RT*) 12), (Record_Type_Declaration_X 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) :: (((*T3*) 10), (Subtype_Declaration_X 27 ((*T3*) 10) Integer (Range_X 1 10))) :: (((*Ar*) 5), (Array_Type_Declaration_X 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*T4*) 11), (Subtype_Declaration_X 30 ((*T4*) 11) Integer (Range_X 5 10))) :: (((*T2*) 9), (Derived_Type_Declaration_X 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range_X 2 5))) :: (((*T1*) 8), (Derived_Type_Declaration_X 21 ((*T1*) 8) Integer (Range_X 1 10))) :: (((*U*) 4), (Subtype_Declaration_X 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range_X 1 10))) :: (((*T*) 3), (Integer_Type_Declaration_X 6 ((*T*) 3) (Range_X 0 10))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((137, Integer) :: (146, (Subtype ((*U*) 4))) :: (92, (Array_Type ((*Ar*) 5))) :: (200, Integer) :: (101, Boolean) :: (173, (Subtype ((*T4*) 11))) :: (191, Integer) :: (83, (Integer_Type ((*T*) 3))) :: (110, (Subtype ((*U*) 4))) :: (104, (Subtype ((*U*) 4))) :: (95, Integer) :: (131, (Subtype ((*U*) 4))) :: (122, Integer) :: (194, (Subtype ((*T4*) 11))) :: (176, (Derived_Type ((*T1*) 8))) :: (86, Integer) :: (158, Integer) :: (185, (Derived_Type ((*T2*) 9))) :: (113, (Integer_Type ((*T*) 3))) :: (41, Integer) :: (140, (Subtype ((*U*) 4))) :: (44, Integer) :: (125, (Subtype ((*U*) 4))) :: (80, Integer) :: (89, Boolean) :: (116, (Subtype ((*U*) 4))) :: (98, (Integer_Type ((*T*) 3))) :: (71, Integer) :: (74, (Integer_Type ((*T*) 3))) :: (47, Boolean) :: (193, (Subtype ((*T3*) 10))) :: (184, (Derived_Type ((*T2*) 9))) :: (211, (Array_Type ((*Ar*) 5))) :: (142, Integer) :: (151, (Subtype ((*U*) 4))) :: (124, (Subtype ((*U*) 4))) :: (205, (Array_Type ((*Ar*) 5))) :: (133, Integer) :: (214, (Integer_Type ((*T*) 3))) :: (178, (Derived_Type ((*T1*) 8))) :: (115, (Subtype ((*U*) 4))) :: (187, Integer) :: (172, (Subtype ((*T4*) 11))) :: (118, Integer) :: (127, Integer) :: (199, (Array_Type ((*Ar*) 5))) :: (136, Integer) :: (109, (Integer_Type ((*T*) 3))) :: (91, Integer) :: (82, (Array_Type ((*Ar*) 5))) :: (190, (Subtype ((*T4*) 11))) :: (145, (Integer_Type ((*T*) 3))) :: (154, Integer) :: (94, (Subtype ((*U*) 4))) :: (67, Integer) :: (85, (Subtype ((*U*) 4))) :: (139, (Subtype ((*U*) 4))) :: (130, (Integer_Type ((*T*) 3))) :: (121, Integer) :: (148, Integer) :: (103, (Subtype ((*U*) 4))) :: (112, (Integer_Type ((*T*) 3))) :: (79, Boolean) :: (88, Integer) :: (70, (Subtype ((*U*) 4))) :: (43, Integer) :: (180, Integer) :: (207, Integer) :: (198, Integer) :: (147, (Subtype ((*U*) 4))) :: (183, (Derived_Type ((*T2*) 9))) :: (129, (Subtype ((*U*) 4))) :: (210, (Array_Type ((*Ar*) 5))) :: (138, (Array_Type ((*Ar*) 5))) :: (120, Boolean) :: (165, Integer) :: (192, (Subtype ((*T3*) 10))) :: (201, Integer) :: (213, Integer) :: (186, (Derived_Type ((*T2*) 9))) :: (87, Integer) :: (96, Integer) :: (177, (Derived_Type ((*T1*) 8))) :: (132, (Subtype ((*U*) 4))) :: (150, (Integer_Type ((*T*) 3))) :: (141, Integer) :: (105, (Subtype ((*U*) 4))) :: (114, (Subtype ((*U*) 4))) :: (123, (Array_Type ((*Ar*) 5))) :: (204, Integer) :: (195, (Subtype ((*T4*) 11))) :: (78, Boolean) :: (99, Integer) :: (90, Integer) :: (45, Integer) :: (171, Integer) :: (81, Integer) :: (144, (Subtype ((*U*) 4))) :: (126, Integer) :: (162, Integer) :: (108, (Subtype ((*U*) 4))) :: (135, Boolean) :: (117, (Subtype ((*U*) 4))) :: (84, (Subtype ((*U*) 4))) :: (102, (Subtype ((*U*) 4))) :: (93, (Subtype ((*U*) 4))) :: (75, Integer) :: (111, (Subtype ((*U*) 4))) :: (66, (Subtype ((*U*) 4))) :: (42, Integer) :: (212, Integer) :: (152, (Subtype ((*U*) 4))) :: (179, (Derived_Type ((*T1*) 8))) :: (215, (Integer_Type ((*T*) 3))) :: (206, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((137, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)15)) :: (146, (sloc (*Line*)47 (*Col*)18 (*EndLine*)47 (*EndCol*)20)) :: (92, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)28)) :: (200, (sloc (*Line*)67 (*Col*)6 (*EndLine*)67 (*EndCol*)6)) :: (101, (sloc (*Line*)41 (*Col*)13 (*EndLine*)41 (*EndCol*)25)) :: (173, (sloc (*Line*)62 (*Col*)17 (*EndLine*)62 (*EndCol*)18)) :: (191, (sloc (*Line*)65 (*Col*)10 (*EndLine*)65 (*EndCol*)16)) :: (83, (sloc (*Line*)37 (*Col*)13 (*EndLine*)37 (*EndCol*)18)) :: (110, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)13)) :: (104, (sloc (*Line*)41 (*Col*)21 (*EndLine*)41 (*EndCol*)25)) :: (95, (sloc (*Line*)37 (*Col*)40 (*EndLine*)37 (*EndCol*)40)) :: (131, (sloc (*Line*)44 (*Col*)14 (*EndLine*)44 (*EndCol*)16)) :: (122, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)12)) :: (194, (sloc (*Line*)65 (*Col*)15 (*EndLine*)65 (*EndCol*)16)) :: (176, (sloc (*Line*)63 (*Col*)4 (*EndLine*)63 (*EndCol*)5)) :: (86, (sloc (*Line*)37 (*Col*)18 (*EndLine*)37 (*EndCol*)18)) :: (158, (sloc (*Line*)57 (*Col*)14 (*EndLine*)57 (*EndCol*)14)) :: (185, (sloc (*Line*)64 (*Col*)10 (*EndLine*)64 (*EndCol*)11)) :: (113, (sloc (*Line*)42 (*Col*)18 (*EndLine*)42 (*EndCol*)29)) :: (41, (sloc (*Line*)23 (*Col*)7 (*EndLine*)23 (*EndCol*)7)) :: (140, (sloc (*Line*)46 (*Col*)12 (*EndLine*)46 (*EndCol*)14)) :: (44, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)12)) :: (125, (sloc (*Line*)43 (*Col*)9 (*EndLine*)43 (*EndCol*)11)) :: (80, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)19)) :: (89, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)40)) :: (116, (sloc (*Line*)42 (*Col*)26 (*EndLine*)42 (*EndCol*)29)) :: (98, (sloc (*Line*)38 (*Col*)3 (*EndLine*)38 (*EndCol*)3)) :: (71, (sloc (*Line*)34 (*Col*)16 (*EndLine*)34 (*EndCol*)17)) :: (74, (sloc (*Line*)36 (*Col*)7 (*EndLine*)36 (*EndCol*)7)) :: (47, (sloc (*Line*)25 (*Col*)18 (*EndLine*)25 (*EndCol*)21)) :: (193, (sloc (*Line*)65 (*Col*)10 (*EndLine*)65 (*EndCol*)11)) :: (184, (sloc (*Line*)64 (*Col*)10 (*EndLine*)64 (*EndCol*)15)) :: (211, (sloc (*Line*)69 (*Col*)11 (*EndLine*)69 (*EndCol*)11)) :: (142, (sloc (*Line*)46 (*Col*)19 (*EndLine*)46 (*EndCol*)19)) :: (151, (sloc (*Line*)49 (*Col*)14 (*EndLine*)49 (*EndCol*)16)) :: (124, (sloc (*Line*)43 (*Col*)9 (*EndLine*)43 (*EndCol*)11)) :: (205, (sloc (*Line*)68 (*Col*)4 (*EndLine*)68 (*EndCol*)4)) :: (133, (sloc (*Line*)44 (*Col*)20 (*EndLine*)44 (*EndCol*)20)) :: (214, (sloc (*Line*)69 (*Col*)17 (*EndLine*)69 (*EndCol*)17)) :: (178, (sloc (*Line*)63 (*Col*)10 (*EndLine*)63 (*EndCol*)11)) :: (115, (sloc (*Line*)42 (*Col*)18 (*EndLine*)42 (*EndCol*)22)) :: (187, (sloc (*Line*)64 (*Col*)15 (*EndLine*)64 (*EndCol*)15)) :: (172, (sloc (*Line*)62 (*Col*)17 (*EndLine*)62 (*EndCol*)18)) :: (118, (sloc (*Line*)42 (*Col*)34 (*EndLine*)42 (*EndCol*)34)) :: (127, (sloc (*Line*)43 (*Col*)16 (*EndLine*)43 (*EndCol*)16)) :: (199, (sloc (*Line*)67 (*Col*)4 (*EndLine*)67 (*EndCol*)4)) :: (136, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)15)) :: (109, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)34)) :: (91, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)36)) :: (82, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)10)) :: (190, (sloc (*Line*)65 (*Col*)4 (*EndLine*)65 (*EndCol*)5)) :: (145, (sloc (*Line*)47 (*Col*)18 (*EndLine*)47 (*EndCol*)24)) :: (154, (sloc (*Line*)56 (*Col*)14 (*EndLine*)56 (*EndCol*)14)) :: (94, (sloc (*Line*)37 (*Col*)31 (*EndLine*)37 (*EndCol*)35)) :: (67, (sloc (*Line*)33 (*Col*)16 (*EndLine*)33 (*EndCol*)16)) :: (85, (sloc (*Line*)37 (*Col*)13 (*EndLine*)37 (*EndCol*)16)) :: (139, (sloc (*Line*)46 (*Col*)12 (*EndLine*)46 (*EndCol*)14)) :: (130, (sloc (*Line*)44 (*Col*)14 (*EndLine*)44 (*EndCol*)20)) :: (121, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)12)) :: (148, (sloc (*Line*)47 (*Col*)24 (*EndLine*)47 (*EndCol*)24)) :: (103, (sloc (*Line*)41 (*Col*)13 (*EndLine*)41 (*EndCol*)16)) :: (112, (sloc (*Line*)42 (*Col*)17 (*EndLine*)42 (*EndCol*)34)) :: (79, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)23)) :: (88, (sloc (*Line*)37 (*Col*)23 (*EndLine*)37 (*EndCol*)23)) :: (70, (sloc (*Line*)34 (*Col*)7 (*EndLine*)34 (*EndCol*)11)) :: (43, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)12)) :: (180, (sloc (*Line*)63 (*Col*)15 (*EndLine*)63 (*EndCol*)15)) :: (207, (sloc (*Line*)68 (*Col*)12 (*EndLine*)68 (*EndCol*)13)) :: (198, (sloc (*Line*)67 (*Col*)4 (*EndLine*)67 (*EndCol*)7)) :: (147, (sloc (*Line*)47 (*Col*)18 (*EndLine*)47 (*EndCol*)20)) :: (183, (sloc (*Line*)64 (*Col*)4 (*EndLine*)64 (*EndCol*)5)) :: (129, (sloc (*Line*)44 (*Col*)6 (*EndLine*)44 (*EndCol*)9)) :: (210, (sloc (*Line*)69 (*Col*)11 (*EndLine*)69 (*EndCol*)11)) :: (138, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)9)) :: (120, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)16)) :: (165, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)14)) :: (192, (sloc (*Line*)65 (*Col*)10 (*EndLine*)65 (*EndCol*)11)) :: (201, (sloc (*Line*)67 (*Col*)12 (*EndLine*)67 (*EndCol*)12)) :: (213, (sloc (*Line*)69 (*Col*)14 (*EndLine*)69 (*EndCol*)14)) :: (186, (sloc (*Line*)64 (*Col*)10 (*EndLine*)64 (*EndCol*)11)) :: (87, (sloc (*Line*)37 (*Col*)23 (*EndLine*)37 (*EndCol*)23)) :: (96, (sloc (*Line*)37 (*Col*)40 (*EndLine*)37 (*EndCol*)40)) :: (177, (sloc (*Line*)63 (*Col*)10 (*EndLine*)63 (*EndCol*)15)) :: (132, (sloc (*Line*)44 (*Col*)14 (*EndLine*)44 (*EndCol*)16)) :: (150, (sloc (*Line*)49 (*Col*)9 (*EndLine*)49 (*EndCol*)9)) :: (141, (sloc (*Line*)46 (*Col*)19 (*EndLine*)46 (*EndCol*)19)) :: (105, (sloc (*Line*)41 (*Col*)21 (*EndLine*)41 (*EndCol*)25)) :: (114, (sloc (*Line*)42 (*Col*)18 (*EndLine*)42 (*EndCol*)22)) :: (123, (sloc (*Line*)43 (*Col*)6 (*EndLine*)43 (*EndCol*)6)) :: (204, (sloc (*Line*)68 (*Col*)4 (*EndLine*)68 (*EndCol*)7)) :: (195, (sloc (*Line*)65 (*Col*)15 (*EndLine*)65 (*EndCol*)16)) :: (78, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)40)) :: (99, (sloc (*Line*)38 (*Col*)8 (*EndLine*)38 (*EndCol*)8)) :: (90, (sloc (*Line*)37 (*Col*)28 (*EndLine*)37 (*EndCol*)36)) :: (45, (sloc (*Line*)23 (*Col*)16 (*EndLine*)23 (*EndCol*)16)) :: (171, (sloc (*Line*)62 (*Col*)13 (*EndLine*)62 (*EndCol*)14)) :: (81, (sloc (*Line*)37 (*Col*)10 (*EndLine*)37 (*EndCol*)19)) :: (144, (sloc (*Line*)47 (*Col*)9 (*EndLine*)47 (*EndCol*)13)) :: (126, (sloc (*Line*)43 (*Col*)16 (*EndLine*)43 (*EndCol*)16)) :: (162, (sloc (*Line*)58 (*Col*)14 (*EndLine*)58 (*EndCol*)14)) :: (108, (sloc (*Line*)42 (*Col*)3 (*EndLine*)42 (*EndCol*)5)) :: (135, (sloc (*Line*)46 (*Col*)9 (*EndLine*)46 (*EndCol*)19)) :: (117, (sloc (*Line*)42 (*Col*)26 (*EndLine*)42 (*EndCol*)29)) :: (84, (sloc (*Line*)37 (*Col*)13 (*EndLine*)37 (*EndCol*)16)) :: (102, (sloc (*Line*)41 (*Col*)13 (*EndLine*)41 (*EndCol*)16)) :: (93, (sloc (*Line*)37 (*Col*)31 (*EndLine*)37 (*EndCol*)35)) :: (75, (sloc (*Line*)36 (*Col*)12 (*EndLine*)36 (*EndCol*)12)) :: (111, (sloc (*Line*)42 (*Col*)10 (*EndLine*)42 (*EndCol*)13)) :: (66, (sloc (*Line*)33 (*Col*)7 (*EndLine*)33 (*EndCol*)10)) :: (42, (sloc (*Line*)23 (*Col*)12 (*EndLine*)23 (*EndCol*)16)) :: (212, (sloc (*Line*)69 (*Col*)14 (*EndLine*)69 (*EndCol*)14)) :: (152, (sloc (*Line*)49 (*Col*)14 (*EndLine*)49 (*EndCol*)16)) :: (179, (sloc (*Line*)63 (*Col*)10 (*EndLine*)63 (*EndCol*)11)) :: (215, (sloc (*Line*)69 (*Col*)17 (*EndLine*)69 (*EndCol*)17)) :: (206, (sloc (*Line*)68 (*Col*)6 (*EndLine*)68 (*EndCol*)6)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("A", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/A+28:22")) :: (32, ("X4", "ada://variable/Binary_Search_Test+1:11/X4+59:4")) :: (17, ("Y", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/Y+21:36")) :: (26, ("Left", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Left+29:7")) :: (29, ("X1", "ada://variable/Binary_Search_Test+1:11/X1+56:4")) :: (2, ("I", "ada://parameter/Binary_Search_Test+1:11/I+1:31")) :: (14, ("Y", "ada://component/Binary_Search_Test+1:11/RT+16:9/Y+18:7")) :: (13, ("X", "ada://component/Binary_Search_Test+1:11/RT+16:9/X+17:7")) :: (31, ("X3", "ada://variable/Binary_Search_Test+1:11/X3+58:4")) :: (7, ("R", "ada://variable/Binary_Search_Test+1:11/R+9:4")) :: (16, ("X", "ada://parameter/Binary_Search_Test+1:11/increase+21:14/X+21:24")) :: (25, ("R", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/R+28:43")) :: (28, ("Med", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Med+31:7")) :: (27, ("Right", "ada://variable/Binary_Search_Test+1:11/Search+28:14/Right+30:7")) :: (21, ("B", "ada://variable/Binary_Search_Test+1:11/B+25:4")) :: (30, ("X2", "ada://variable/Binary_Search_Test+1:11/X2+57:4")) :: (6, ("A", "ada://variable/Binary_Search_Test+1:11/A+8:4")) :: (24, ("I", "ada://parameter/Binary_Search_Test+1:11/Search+28:14/I+28:30")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((22, ("Search", "ada://procedure_body/Binary_Search_Test+1:11/Search+28:14")) :: (1, ("Binary_Search_Test", "ada://procedure_body/Binary_Search_Test+1:11")) :: (15, ("increase", "ada://procedure_body/Binary_Search_Test+1:11/increase+21:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((8, ("T1", "ada://ordinary_type/Binary_Search_Test+1:11/T1+12:9")) :: (11, ("T4", "ada://subtype/Binary_Search_Test+1:11/T4+15:12")) :: (5, ("Ar", "ada://ordinary_type/Binary_Search_Test+1:11/Ar+6:9")) :: (4, ("U", "ada://subtype/Binary_Search_Test+1:11/U+4:12")) :: (10, ("T3", "ada://subtype/Binary_Search_Test+1:11/T3+14:12")) :: (9, ("T2", "ada://ordinary_type/Binary_Search_Test+1:11/T2+13:9")) :: (12, ("RT", "ada://ordinary_type/Binary_Search_Test+1:11/RT+16:9")) :: (3, ("T", "ada://ordinary_type/Binary_Search_Test+1:11/T+3:9")) :: nil)
))
).

