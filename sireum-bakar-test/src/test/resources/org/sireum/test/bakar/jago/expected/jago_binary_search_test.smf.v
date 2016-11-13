Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(ProcBodyDecl 1 
  (mkprocBodyDecl 2
    (* = = = Procedure Name = = = *)
    ((*Binary_Search_Test*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 3 ((*I*) 2) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 4
  (TypeDecl 5 (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) 
  (SeqDecl 7
  (TypeDecl 8 (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
  (SeqDecl 10
  (TypeDecl 11 (ArrayTypeDecl 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (SeqDecl 13
  (ObjDecl 14 (mkobjDecl 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
  (SeqDecl 16
  (ObjDecl 17 (mkobjDecl 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
  (SeqDecl 19
  (TypeDecl 20 (DerivedTypeDecl 21 ((*T1*) 8) Integer (Range 1 10))) 
  (SeqDecl 22
  (TypeDecl 23 (DerivedTypeDecl 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range 2 5))) 
  (SeqDecl 25
  (TypeDecl 26 (SubtypeDecl 27 ((*T3*) 10) Integer (Range 1 10))) 
  (SeqDecl 28
  (TypeDecl 29 (SubtypeDecl 30 ((*T4*) 11) Integer (Range 5 10))) 
  (SeqDecl 31
  (TypeDecl 32 (RecordTypeDecl 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
  (SeqDecl 35
  (ProcBodyDecl 36 
    (mkprocBodyDecl 37
      (* = = = Procedure Name = = = *)
      ((*increase*) 15)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpec 38 ((*X*) 16) Integer In) :: 
      (mkparamSpec 39 ((*Y*) 17) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDecl)
      (* = = = Procedure Body = = = *)
        (Assign 40 (Identifier 41 ((*Y*) 17) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 16) )) (Literal 45 (Integer_Literal 1) ) ))
    )
  ) 
  (SeqDecl 46
  (ObjDecl 48 (mkobjDecl 49 ((*B*) 21) Boolean (Some ((Literal 47 (Boolean_Literal true) ))))) 
  (SeqDecl 50
  (ProcBodyDecl 51 
    (mkprocBodyDecl 52
      (* = = = Procedure Name = = = *)
      ((*Search*) 22)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpec 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
      (mkparamSpec 54 ((*I*) 24) Integer In) :: 
      (mkparamSpec 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
      (* = = = Object Declarations = = = *)
      ((SeqDecl 56
    (ObjDecl 57 (mkobjDecl 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
    (SeqDecl 59
    (ObjDecl 60 (mkobjDecl 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
    (ObjDecl 62 (mkobjDecl 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
      (* = = = Procedure Body = = = *)
        (Seq 64
        (Assign 65 (Identifier 66 ((*Left*) 26) ) (Literal 67 (Integer_Literal 0) )) 
        (Seq 68
        (Assign 69 (Identifier 70 ((*Right*) 27) ) (Literal 71 (Integer_Literal 10) )) 
        (Seq 72
        (Assign 73 (Identifier 74 ((*R*) 25) ) (Literal 75 (Integer_Literal 0) )) 
        (Seq 76
        (If 77 (BinOp 78 Or (BinOp 79 Greater_Than (Name 80 (IndexedComponent 81 (Identifier 82 ((*A*) 23) ) (BinOp 83 Plus (Name 84 (Identifier 85 ((*Left*) 26) )) (Literal 86 (Integer_Literal 1) ) ) )) (Name 87 (Identifier 88 ((*I*) 24) )) ) (BinOp 89 Less_Than (Name 90 (IndexedComponent 91 (Identifier 92 ((*A*) 23) ) (Name 93 (Identifier 94 ((*Right*) 27) )) )) (Name 95 (Identifier 96 ((*I*) 24) )) ) )
          (Assign 97 (Identifier 98 ((*R*) 25) ) (Literal 99 (Integer_Literal 0) ))
          Null
        ) 
        (While 100 (BinOp 101 Less_Than_Or_Equal (Name 102 (Identifier 103 ((*Left*) 26) )) (Name 104 (Identifier 105 ((*Right*) 27) )) )
          (Seq 106
          (Assign 107 (Identifier 108 ((*Med*) 28) ) (BinOp 109 Plus (Name 110 (Identifier 111 ((*Left*) 26) )) (BinOp 112 Divide (BinOp 113 Minus (Name 114 (Identifier 115 ((*Right*) 27) )) (Name 116 (Identifier 117 ((*Left*) 26) )) ) (Literal 118 (Integer_Literal 2) ) ) )) 
          (If 119 (BinOp 120 Less_Than (Name 121 (IndexedComponent 122 (Identifier 123 ((*A*) 23) ) (Name 124 (Identifier 125 ((*Med*) 28) )) )) (Name 126 (Identifier 127 ((*I*) 24) )) )
            (Assign 128 (Identifier 129 ((*Left*) 26) ) (BinOp 130 Plus (Name 131 (Identifier 132 ((*Med*) 28) )) (Literal 133 (Integer_Literal 1) ) ))
            (If 134 (BinOp 135 Greater_Than (Name 136 (IndexedComponent 137 (Identifier 138 ((*A*) 23) ) (Name 139 (Identifier 140 ((*Med*) 28) )) )) (Name 141 (Identifier 142 ((*I*) 24) )) )
              (Assign 143 (Identifier 144 ((*Right*) 27) ) (BinOp 145 Minus (Name 146 (Identifier 147 ((*Med*) 28) )) (Literal 148 (Integer_Literal 1) ) ))
              (Assign 149 (Identifier 150 ((*R*) 25) ) (Name 151 (Identifier 152 ((*Med*) 28) )))
            )
          ))
        )))))
    )
  ) 
  (SeqDecl 153
  (ObjDecl 155 (mkobjDecl 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((Literal 154 (Integer_Literal 2) ))))) 
  (SeqDecl 157
  (ObjDecl 159 (mkobjDecl 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((Literal 158 (Integer_Literal 3) ))))) 
  (SeqDecl 161
  (ObjDecl 163 (mkobjDecl 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((Literal 162 (Integer_Literal 4) ))))) 
  (ObjDecl 166 (mkobjDecl 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((Literal 165 (Integer_Literal 6) ))))))))))))))))))))))
    (* = = = Procedure Body = = = *)
      (Seq 168
      (Call 169 170 ((*increase*) 15) 
        ((Literal 171 (Integer_Literal 10) ) :: (Name 172 (Identifier 173 ((*X4*) 32) )) :: nil)
      ) 
      (Seq 174
      (Assign 175 (Identifier 176 ((*X1*) 29) ) (BinOp 177 Plus (Name 178 (Identifier 179 ((*X1*) 29) )) (Literal 180 (Integer_Literal 1) ) )) 
      (Seq 181
      (Assign 182 (Identifier 183 ((*X2*) 30) ) (BinOp 184 Plus (Name 185 (Identifier 186 ((*X2*) 30) )) (Literal 187 (Integer_Literal 2) ) )) 
      (Seq 188
      (Assign 189 (Identifier 190 ((*X4*) 32) ) (BinOp 191 Plus (Name 192 (Identifier 193 ((*X3*) 31) )) (Name 194 (Identifier 195 ((*X4*) 32) )) )) 
      (Seq 196
      (Assign 197 (IndexedComponent 198 (Identifier 199 ((*A*) 6) ) (Literal 200 (Integer_Literal 0) ) ) (Literal 201 (Integer_Literal 0) )) 
      (Seq 202
      (Assign 203 (IndexedComponent 204 (Identifier 205 ((*A*) 6) ) (Literal 206 (Integer_Literal 1) ) ) (Literal 207 (Integer_Literal 10) )) 
      (Call 208 209 ((*Search*) 22) 
        ((Name 210 (Identifier 211 ((*A*) 6) )) :: (Name 212 (Identifier 213 ((*I*) 2) )) :: (Name 214 (Identifier 215 ((*R*) 7) )) :: nil)
      )))))))
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
  ((((*X3*) 31), (In_Out, (Subtype ((*T3*) 10)))) :: (((*R*) 25), (Out, (Integer_Type ((*T*) 3)))) :: (((*R*) 7), (In_Out, (Integer_Type ((*T*) 3)))) :: (((*X1*) 29), (In_Out, (Derived_Type ((*T1*) 8)))) :: (((*I*) 24), (In, Integer)) :: (((*X*) 16), (In, Integer)) :: (((*B*) 21), (In_Out, Boolean)) :: (((*X4*) 32), (In_Out, (Subtype ((*T4*) 11)))) :: (((*I*) 2), (In, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: (((*Left*) 26), (In_Out, (Subtype ((*U*) 4)))) :: (((*Right*) 27), (In_Out, (Subtype ((*U*) 4)))) :: (((*Med*) 28), (In_Out, (Subtype ((*U*) 4)))) :: (((*X2*) 30), (In_Out, (Derived_Type ((*T2*) 9)))) :: (((*Y*) 17), (Out, Integer)) :: (((*A*) 23), (In, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 22), (1, (mkprocBodyDecl 52
  (* = = = Procedure Name = = = *)
  ((*Search*) 22)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
  (mkparamSpec 54 ((*I*) 24) Integer In) :: 
  (mkparamSpec 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 56
(ObjDecl 57 (mkobjDecl 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
(SeqDecl 59
(ObjDecl 60 (mkobjDecl 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
(ObjDecl 62 (mkobjDecl 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (Seq 64
    (Assign 65 (Identifier 66 ((*Left*) 26) ) (Literal 67 (Integer_Literal 0) )) 
    (Seq 68
    (Assign 69 (Identifier 70 ((*Right*) 27) ) (Literal 71 (Integer_Literal 10) )) 
    (Seq 72
    (Assign 73 (Identifier 74 ((*R*) 25) ) (Literal 75 (Integer_Literal 0) )) 
    (Seq 76
    (If 77 (BinOp 78 Or (BinOp 79 Greater_Than (Name 80 (IndexedComponent 81 (Identifier 82 ((*A*) 23) ) (BinOp 83 Plus (Name 84 (Identifier 85 ((*Left*) 26) )) (Literal 86 (Integer_Literal 1) ) ) )) (Name 87 (Identifier 88 ((*I*) 24) )) ) (BinOp 89 Less_Than (Name 90 (IndexedComponent 91 (Identifier 92 ((*A*) 23) ) (Name 93 (Identifier 94 ((*Right*) 27) )) )) (Name 95 (Identifier 96 ((*I*) 24) )) ) )
      (Assign 97 (Identifier 98 ((*R*) 25) ) (Literal 99 (Integer_Literal 0) ))
      Null
    ) 
    (While 100 (BinOp 101 Less_Than_Or_Equal (Name 102 (Identifier 103 ((*Left*) 26) )) (Name 104 (Identifier 105 ((*Right*) 27) )) )
      (Seq 106
      (Assign 107 (Identifier 108 ((*Med*) 28) ) (BinOp 109 Plus (Name 110 (Identifier 111 ((*Left*) 26) )) (BinOp 112 Divide (BinOp 113 Minus (Name 114 (Identifier 115 ((*Right*) 27) )) (Name 116 (Identifier 117 ((*Left*) 26) )) ) (Literal 118 (Integer_Literal 2) ) ) )) 
      (If 119 (BinOp 120 Less_Than (Name 121 (IndexedComponent 122 (Identifier 123 ((*A*) 23) ) (Name 124 (Identifier 125 ((*Med*) 28) )) )) (Name 126 (Identifier 127 ((*I*) 24) )) )
        (Assign 128 (Identifier 129 ((*Left*) 26) ) (BinOp 130 Plus (Name 131 (Identifier 132 ((*Med*) 28) )) (Literal 133 (Integer_Literal 1) ) ))
        (If 134 (BinOp 135 Greater_Than (Name 136 (IndexedComponent 137 (Identifier 138 ((*A*) 23) ) (Name 139 (Identifier 140 ((*Med*) 28) )) )) (Name 141 (Identifier 142 ((*I*) 24) )) )
          (Assign 143 (Identifier 144 ((*Right*) 27) ) (BinOp 145 Minus (Name 146 (Identifier 147 ((*Med*) 28) )) (Literal 148 (Integer_Literal 1) ) ))
          (Assign 149 (Identifier 150 ((*R*) 25) ) (Name 151 (Identifier 152 ((*Med*) 28) )))
        )
      ))
    )))))
))) :: (((*Binary_Search_Test*) 1), (0, (mkprocBodyDecl 2
  (* = = = Procedure Name = = = *)
  ((*Binary_Search_Test*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 3 ((*I*) 2) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 4
(TypeDecl 5 (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) 
(SeqDecl 7
(TypeDecl 8 (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) 
(SeqDecl 10
(TypeDecl 11 (ArrayTypeDecl 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(SeqDecl 13
(ObjDecl 14 (mkobjDecl 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
(SeqDecl 16
(ObjDecl 17 (mkobjDecl 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
(SeqDecl 19
(TypeDecl 20 (DerivedTypeDecl 21 ((*T1*) 8) Integer (Range 1 10))) 
(SeqDecl 22
(TypeDecl 23 (DerivedTypeDecl 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range 2 5))) 
(SeqDecl 25
(TypeDecl 26 (SubtypeDecl 27 ((*T3*) 10) Integer (Range 1 10))) 
(SeqDecl 28
(TypeDecl 29 (SubtypeDecl 30 ((*T4*) 11) Integer (Range 5 10))) 
(SeqDecl 31
(TypeDecl 32 (RecordTypeDecl 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
(SeqDecl 35
(ProcBodyDecl 36 
  (mkprocBodyDecl 37
    (* = = = Procedure Name = = = *)
    ((*increase*) 15)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 38 ((*X*) 16) Integer In) :: 
    (mkparamSpec 39 ((*Y*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 40 (Identifier 41 ((*Y*) 17) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 16) )) (Literal 45 (Integer_Literal 1) ) ))
  )
) 
(SeqDecl 46
(ObjDecl 48 (mkobjDecl 49 ((*B*) 21) Boolean (Some ((Literal 47 (Boolean_Literal true) ))))) 
(SeqDecl 50
(ProcBodyDecl 51 
  (mkprocBodyDecl 52
    (* = = = Procedure Name = = = *)
    ((*Search*) 22)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
    (mkparamSpec 54 ((*I*) 24) Integer In) :: 
    (mkparamSpec 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 56
  (ObjDecl 57 (mkobjDecl 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
  (SeqDecl 59
  (ObjDecl 60 (mkobjDecl 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
  (ObjDecl 62 (mkobjDecl 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (Seq 64
      (Assign 65 (Identifier 66 ((*Left*) 26) ) (Literal 67 (Integer_Literal 0) )) 
      (Seq 68
      (Assign 69 (Identifier 70 ((*Right*) 27) ) (Literal 71 (Integer_Literal 10) )) 
      (Seq 72
      (Assign 73 (Identifier 74 ((*R*) 25) ) (Literal 75 (Integer_Literal 0) )) 
      (Seq 76
      (If 77 (BinOp 78 Or (BinOp 79 Greater_Than (Name 80 (IndexedComponent 81 (Identifier 82 ((*A*) 23) ) (BinOp 83 Plus (Name 84 (Identifier 85 ((*Left*) 26) )) (Literal 86 (Integer_Literal 1) ) ) )) (Name 87 (Identifier 88 ((*I*) 24) )) ) (BinOp 89 Less_Than (Name 90 (IndexedComponent 91 (Identifier 92 ((*A*) 23) ) (Name 93 (Identifier 94 ((*Right*) 27) )) )) (Name 95 (Identifier 96 ((*I*) 24) )) ) )
        (Assign 97 (Identifier 98 ((*R*) 25) ) (Literal 99 (Integer_Literal 0) ))
        Null
      ) 
      (While 100 (BinOp 101 Less_Than_Or_Equal (Name 102 (Identifier 103 ((*Left*) 26) )) (Name 104 (Identifier 105 ((*Right*) 27) )) )
        (Seq 106
        (Assign 107 (Identifier 108 ((*Med*) 28) ) (BinOp 109 Plus (Name 110 (Identifier 111 ((*Left*) 26) )) (BinOp 112 Divide (BinOp 113 Minus (Name 114 (Identifier 115 ((*Right*) 27) )) (Name 116 (Identifier 117 ((*Left*) 26) )) ) (Literal 118 (Integer_Literal 2) ) ) )) 
        (If 119 (BinOp 120 Less_Than (Name 121 (IndexedComponent 122 (Identifier 123 ((*A*) 23) ) (Name 124 (Identifier 125 ((*Med*) 28) )) )) (Name 126 (Identifier 127 ((*I*) 24) )) )
          (Assign 128 (Identifier 129 ((*Left*) 26) ) (BinOp 130 Plus (Name 131 (Identifier 132 ((*Med*) 28) )) (Literal 133 (Integer_Literal 1) ) ))
          (If 134 (BinOp 135 Greater_Than (Name 136 (IndexedComponent 137 (Identifier 138 ((*A*) 23) ) (Name 139 (Identifier 140 ((*Med*) 28) )) )) (Name 141 (Identifier 142 ((*I*) 24) )) )
            (Assign 143 (Identifier 144 ((*Right*) 27) ) (BinOp 145 Minus (Name 146 (Identifier 147 ((*Med*) 28) )) (Literal 148 (Integer_Literal 1) ) ))
            (Assign 149 (Identifier 150 ((*R*) 25) ) (Name 151 (Identifier 152 ((*Med*) 28) )))
          )
        ))
      )))))
  )
) 
(SeqDecl 153
(ObjDecl 155 (mkobjDecl 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((Literal 154 (Integer_Literal 2) ))))) 
(SeqDecl 157
(ObjDecl 159 (mkobjDecl 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((Literal 158 (Integer_Literal 3) ))))) 
(SeqDecl 161
(ObjDecl 163 (mkobjDecl 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((Literal 162 (Integer_Literal 4) ))))) 
(ObjDecl 166 (mkobjDecl 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((Literal 165 (Integer_Literal 6) ))))))))))))))))))))))
  (* = = = Procedure Body = = = *)
    (Seq 168
    (Call 169 170 ((*increase*) 15) 
      ((Literal 171 (Integer_Literal 10) ) :: (Name 172 (Identifier 173 ((*X4*) 32) )) :: nil)
    ) 
    (Seq 174
    (Assign 175 (Identifier 176 ((*X1*) 29) ) (BinOp 177 Plus (Name 178 (Identifier 179 ((*X1*) 29) )) (Literal 180 (Integer_Literal 1) ) )) 
    (Seq 181
    (Assign 182 (Identifier 183 ((*X2*) 30) ) (BinOp 184 Plus (Name 185 (Identifier 186 ((*X2*) 30) )) (Literal 187 (Integer_Literal 2) ) )) 
    (Seq 188
    (Assign 189 (Identifier 190 ((*X4*) 32) ) (BinOp 191 Plus (Name 192 (Identifier 193 ((*X3*) 31) )) (Name 194 (Identifier 195 ((*X4*) 32) )) )) 
    (Seq 196
    (Assign 197 (IndexedComponent 198 (Identifier 199 ((*A*) 6) ) (Literal 200 (Integer_Literal 0) ) ) (Literal 201 (Integer_Literal 0) )) 
    (Seq 202
    (Assign 203 (IndexedComponent 204 (Identifier 205 ((*A*) 6) ) (Literal 206 (Integer_Literal 1) ) ) (Literal 207 (Integer_Literal 10) )) 
    (Call 208 209 ((*Search*) 22) 
      ((Name 210 (Identifier 211 ((*A*) 6) )) :: (Name 212 (Identifier 213 ((*I*) 2) )) :: (Name 214 (Identifier 215 ((*R*) 7) )) :: nil)
    )))))))
))) :: (((*increase*) 15), (1, (mkprocBodyDecl 37
  (* = = = Procedure Name = = = *)
  ((*increase*) 15)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 38 ((*X*) 16) Integer In) :: 
  (mkparamSpec 39 ((*Y*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 40 (Identifier 41 ((*Y*) 17) ) (BinOp 42 Plus (Name 43 (Identifier 44 ((*X*) 16) )) (Literal 45 (Integer_Literal 1) ) ))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*RT*) 12), (RecordTypeDecl 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) :: (((*T3*) 10), (SubtypeDecl 27 ((*T3*) 10) Integer (Range 1 10))) :: (((*Ar*) 5), (ArrayTypeDecl 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*T4*) 11), (SubtypeDecl 30 ((*T4*) 11) Integer (Range 5 10))) :: (((*T2*) 9), (DerivedTypeDecl 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (Range 2 5))) :: (((*T1*) 8), (DerivedTypeDecl 21 ((*T1*) 8) Integer (Range 1 10))) :: (((*U*) 4), (SubtypeDecl 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (Range 1 10))) :: (((*T*) 3), (IntegerTypeDecl 6 ((*T*) 3) (Range 0 10))) :: nil)
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

Definition AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(ProcBodyDeclRT 1 
  (mkprocBodyDeclRT 2
    (* = = = Procedure Name = = = *)
    ((*Binary_Search_Test*) 1)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 3 ((*I*) 2) Integer In) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 4
  (TypeDeclRT 5 (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) 
  (SeqDeclRT 7
  (TypeDeclRT 8 (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) 
  (SeqDeclRT 10
  (TypeDeclRT 11 (ArrayTypeDeclRT 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
  (SeqDeclRT 13
  (ObjDeclRT 14 (mkobjDeclRT 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
  (SeqDeclRT 16
  (ObjDeclRT 17 (mkobjDeclRT 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
  (SeqDeclRT 19
  (TypeDeclRT 20 (DerivedTypeDeclRT 21 ((*T1*) 8) Integer (RangeRT 1 10))) 
  (SeqDeclRT 22
  (TypeDeclRT 23 (DerivedTypeDeclRT 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (RangeRT 2 5))) 
  (SeqDeclRT 25
  (TypeDeclRT 26 (SubtypeDeclRT 27 ((*T3*) 10) Integer (RangeRT 1 10))) 
  (SeqDeclRT 28
  (TypeDeclRT 29 (SubtypeDeclRT 30 ((*T4*) 11) Integer (RangeRT 5 10))) 
  (SeqDeclRT 31
  (TypeDeclRT 32 (RecordTypeDeclRT 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
  (SeqDeclRT 35
  (ProcBodyDeclRT 36 
    (mkprocBodyDeclRT 37
      (* = = = Procedure Name = = = *)
      ((*increase*) 15)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpecRT 38 ((*X*) 16) Integer In) :: 
      (mkparamSpecRT 39 ((*Y*) 17) Integer Out) :: nil)
      (* = = = Object Declarations = = = *)
      (NullDeclRT)
      (* = = = Procedure Body = = = *)
        (AssignRT 40 (IdentifierRT 41 ((*Y*) 17) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 16) (nil))) (LiteralRT 45 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
    )
  ) 
  (SeqDeclRT 46
  (ObjDeclRT 48 (mkobjDeclRT 49 ((*B*) 21) Boolean (Some ((LiteralRT 47 (Boolean_Literal true) (nil) nil))))) 
  (SeqDeclRT 50
  (ProcBodyDeclRT 51 
    (mkprocBodyDeclRT 52
      (* = = = Procedure Name = = = *)
      ((*Search*) 22)
      (* = = = Formal Parameters = = = *)
      (
      (mkparamSpecRT 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
      (mkparamSpecRT 54 ((*I*) 24) Integer In) :: 
      (mkparamSpecRT 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
      (* = = = Object Declarations = = = *)
      ((SeqDeclRT 56
    (ObjDeclRT 57 (mkobjDeclRT 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
    (SeqDeclRT 59
    (ObjDeclRT 60 (mkobjDeclRT 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
    (ObjDeclRT 62 (mkobjDeclRT 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
      (* = = = Procedure Body = = = *)
        (SeqRT 64
        (AssignRT 65 (IdentifierRT 66 ((*Left*) 26) (nil)) (LiteralRT 67 (Integer_Literal 0) (nil) nil)) 
        (SeqRT 68
        (AssignRT 69 (IdentifierRT 70 ((*Right*) 27) (nil)) (LiteralRT 71 (Integer_Literal 10) (nil) nil)) 
        (SeqRT 72
        (AssignRT 73 (IdentifierRT 74 ((*R*) 25) (nil)) (LiteralRT 75 (Integer_Literal 0) (nil) nil)) 
        (SeqRT 76
        (IfRT 77 (BinOpRT 78 Or (BinOpRT 79 Greater_Than (NameRT 80 (IndexedComponentRT 81 (IdentifierRT 82 ((*A*) 23) (nil)) (BinOpRT 83 Plus (NameRT 84 (IdentifierRT 85 ((*Left*) 26) (nil))) (LiteralRT 86 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil))) (NameRT 87 (IdentifierRT 88 ((*I*) 24) (nil))) (nil) nil) (BinOpRT 89 Less_Than (NameRT 90 (IndexedComponentRT 91 (IdentifierRT 92 ((*A*) 23) (nil)) (NameRT 93 (IdentifierRT 94 ((*Right*) 27) (nil))) (nil))) (NameRT 95 (IdentifierRT 96 ((*I*) 24) (nil))) (nil) nil) (nil) nil)
          (AssignRT 97 (IdentifierRT 98 ((*R*) 25) (nil)) (LiteralRT 99 (Integer_Literal 0) (nil) nil))
          NullRT
        ) 
        (WhileRT 100 (BinOpRT 101 Less_Than_Or_Equal (NameRT 102 (IdentifierRT 103 ((*Left*) 26) (nil))) (NameRT 104 (IdentifierRT 105 ((*Right*) 27) (nil))) (nil) nil)
          (SeqRT 106
          (AssignRT 107 (IdentifierRT 108 ((*Med*) 28) (nil)) (BinOpRT 109 Plus (NameRT 110 (IdentifierRT 111 ((*Left*) 26) (nil))) (BinOpRT 112 Divide (BinOpRT 113 Minus (NameRT 114 (IdentifierRT 115 ((*Right*) 27) (nil))) (NameRT 116 (IdentifierRT 117 ((*Left*) 26) (nil))) (nil) nil) (LiteralRT 118 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil) (RangeCheck :: nil) nil)) 
          (IfRT 119 (BinOpRT 120 Less_Than (NameRT 121 (IndexedComponentRT 122 (IdentifierRT 123 ((*A*) 23) (nil)) (NameRT 124 (IdentifierRT 125 ((*Med*) 28) (nil))) (nil))) (NameRT 126 (IdentifierRT 127 ((*I*) 24) (nil))) (nil) nil)
            (AssignRT 128 (IdentifierRT 129 ((*Left*) 26) (nil)) (BinOpRT 130 Plus (NameRT 131 (IdentifierRT 132 ((*Med*) 28) (nil))) (LiteralRT 133 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
            (IfRT 134 (BinOpRT 135 Greater_Than (NameRT 136 (IndexedComponentRT 137 (IdentifierRT 138 ((*A*) 23) (nil)) (NameRT 139 (IdentifierRT 140 ((*Med*) 28) (nil))) (nil))) (NameRT 141 (IdentifierRT 142 ((*I*) 24) (nil))) (nil) nil)
              (AssignRT 143 (IdentifierRT 144 ((*Right*) 27) (nil)) (BinOpRT 145 Minus (NameRT 146 (IdentifierRT 147 ((*Med*) 28) (nil))) (LiteralRT 148 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
              (AssignRT 149 (IdentifierRT 150 ((*R*) 25) (nil)) (NameRT 151 (IdentifierRT 152 ((*Med*) 28) (nil))))
            )
          ))
        )))))
    )
  ) 
  (SeqDeclRT 153
  (ObjDeclRT 155 (mkobjDeclRT 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((LiteralRT 154 (Integer_Literal 2) (nil) nil))))) 
  (SeqDeclRT 157
  (ObjDeclRT 159 (mkobjDeclRT 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((LiteralRT 158 (Integer_Literal 3) (nil) nil))))) 
  (SeqDeclRT 161
  (ObjDeclRT 163 (mkobjDeclRT 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((LiteralRT 162 (Integer_Literal 4) (nil) nil))))) 
  (ObjDeclRT 166 (mkobjDeclRT 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((LiteralRT 165 (Integer_Literal 6) (nil) nil))))))))))))))))))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 168
      (CallRT 169 170 ((*increase*) 15) 
        ((LiteralRT 171 (Integer_Literal 10) (nil) nil) :: (NameRT 172 (IdentifierRT 173 ((*X4*) 32) (RangeCheck :: nil))) :: nil)
      ) 
      (SeqRT 174
      (AssignRT 175 (IdentifierRT 176 ((*X1*) 29) (nil)) (BinOpRT 177 Plus (NameRT 178 (IdentifierRT 179 ((*X1*) 29) (nil))) (LiteralRT 180 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
      (SeqRT 181
      (AssignRT 182 (IdentifierRT 183 ((*X2*) 30) (nil)) (BinOpRT 184 Plus (NameRT 185 (IdentifierRT 186 ((*X2*) 30) (nil))) (LiteralRT 187 (Integer_Literal 2) (nil) nil) (RangeCheck :: nil) nil)) 
      (SeqRT 188
      (AssignRT 189 (IdentifierRT 190 ((*X4*) 32) (nil)) (BinOpRT 191 Plus (NameRT 192 (IdentifierRT 193 ((*X3*) 31) (nil))) (NameRT 194 (IdentifierRT 195 ((*X4*) 32) (nil))) (RangeCheck :: nil) nil)) 
      (SeqRT 196
      (AssignRT 197 (IndexedComponentRT 198 (IdentifierRT 199 ((*A*) 6) (nil)) (LiteralRT 200 (Integer_Literal 0) (nil) nil) (nil)) (LiteralRT 201 (Integer_Literal 0) (nil) nil)) 
      (SeqRT 202
      (AssignRT 203 (IndexedComponentRT 204 (IdentifierRT 205 ((*A*) 6) (nil)) (LiteralRT 206 (Integer_Literal 1) (nil) nil) (nil)) (LiteralRT 207 (Integer_Literal 10) (nil) nil)) 
      (CallRT 208 209 ((*Search*) 22) 
        ((NameRT 210 (IdentifierRT 211 ((*A*) 6) (nil))) :: (NameRT 212 (IdentifierRT 213 ((*I*) 2) (nil))) :: (NameRT 214 (IdentifierRT 215 ((*R*) 7) (nil))) :: nil)
      )))))))
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
  ((((*X3*) 31), (In_Out, (Subtype ((*T3*) 10)))) :: (((*R*) 25), (Out, (Integer_Type ((*T*) 3)))) :: (((*R*) 7), (In_Out, (Integer_Type ((*T*) 3)))) :: (((*X1*) 29), (In_Out, (Derived_Type ((*T1*) 8)))) :: (((*I*) 24), (In, Integer)) :: (((*X*) 16), (In, Integer)) :: (((*B*) 21), (In_Out, Boolean)) :: (((*X4*) 32), (In_Out, (Subtype ((*T4*) 11)))) :: (((*I*) 2), (In, Integer)) :: (((*A*) 6), (In_Out, (Array_Type ((*Ar*) 5)))) :: (((*Left*) 26), (In_Out, (Subtype ((*U*) 4)))) :: (((*Right*) 27), (In_Out, (Subtype ((*U*) 4)))) :: (((*Med*) 28), (In_Out, (Subtype ((*U*) 4)))) :: (((*X2*) 30), (In_Out, (Derived_Type ((*T2*) 9)))) :: (((*Y*) 17), (Out, Integer)) :: (((*A*) 23), (In, (Array_Type ((*Ar*) 5)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Search*) 22), (1, (mkprocBodyDeclRT 52
  (* = = = Procedure Name = = = *)
  ((*Search*) 22)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
  (mkparamSpecRT 54 ((*I*) 24) Integer In) :: 
  (mkparamSpecRT 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 56
(ObjDeclRT 57 (mkobjDeclRT 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
(SeqDeclRT 59
(ObjDeclRT 60 (mkobjDeclRT 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
(ObjDeclRT 62 (mkobjDeclRT 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
  (* = = = Procedure Body = = = *)
    (SeqRT 64
    (AssignRT 65 (IdentifierRT 66 ((*Left*) 26) (nil)) (LiteralRT 67 (Integer_Literal 0) (nil) nil)) 
    (SeqRT 68
    (AssignRT 69 (IdentifierRT 70 ((*Right*) 27) (nil)) (LiteralRT 71 (Integer_Literal 10) (nil) nil)) 
    (SeqRT 72
    (AssignRT 73 (IdentifierRT 74 ((*R*) 25) (nil)) (LiteralRT 75 (Integer_Literal 0) (nil) nil)) 
    (SeqRT 76
    (IfRT 77 (BinOpRT 78 Or (BinOpRT 79 Greater_Than (NameRT 80 (IndexedComponentRT 81 (IdentifierRT 82 ((*A*) 23) (nil)) (BinOpRT 83 Plus (NameRT 84 (IdentifierRT 85 ((*Left*) 26) (nil))) (LiteralRT 86 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil))) (NameRT 87 (IdentifierRT 88 ((*I*) 24) (nil))) (nil) nil) (BinOpRT 89 Less_Than (NameRT 90 (IndexedComponentRT 91 (IdentifierRT 92 ((*A*) 23) (nil)) (NameRT 93 (IdentifierRT 94 ((*Right*) 27) (nil))) (nil))) (NameRT 95 (IdentifierRT 96 ((*I*) 24) (nil))) (nil) nil) (nil) nil)
      (AssignRT 97 (IdentifierRT 98 ((*R*) 25) (nil)) (LiteralRT 99 (Integer_Literal 0) (nil) nil))
      NullRT
    ) 
    (WhileRT 100 (BinOpRT 101 Less_Than_Or_Equal (NameRT 102 (IdentifierRT 103 ((*Left*) 26) (nil))) (NameRT 104 (IdentifierRT 105 ((*Right*) 27) (nil))) (nil) nil)
      (SeqRT 106
      (AssignRT 107 (IdentifierRT 108 ((*Med*) 28) (nil)) (BinOpRT 109 Plus (NameRT 110 (IdentifierRT 111 ((*Left*) 26) (nil))) (BinOpRT 112 Divide (BinOpRT 113 Minus (NameRT 114 (IdentifierRT 115 ((*Right*) 27) (nil))) (NameRT 116 (IdentifierRT 117 ((*Left*) 26) (nil))) (nil) nil) (LiteralRT 118 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil) (RangeCheck :: nil) nil)) 
      (IfRT 119 (BinOpRT 120 Less_Than (NameRT 121 (IndexedComponentRT 122 (IdentifierRT 123 ((*A*) 23) (nil)) (NameRT 124 (IdentifierRT 125 ((*Med*) 28) (nil))) (nil))) (NameRT 126 (IdentifierRT 127 ((*I*) 24) (nil))) (nil) nil)
        (AssignRT 128 (IdentifierRT 129 ((*Left*) 26) (nil)) (BinOpRT 130 Plus (NameRT 131 (IdentifierRT 132 ((*Med*) 28) (nil))) (LiteralRT 133 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
        (IfRT 134 (BinOpRT 135 Greater_Than (NameRT 136 (IndexedComponentRT 137 (IdentifierRT 138 ((*A*) 23) (nil)) (NameRT 139 (IdentifierRT 140 ((*Med*) 28) (nil))) (nil))) (NameRT 141 (IdentifierRT 142 ((*I*) 24) (nil))) (nil) nil)
          (AssignRT 143 (IdentifierRT 144 ((*Right*) 27) (nil)) (BinOpRT 145 Minus (NameRT 146 (IdentifierRT 147 ((*Med*) 28) (nil))) (LiteralRT 148 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
          (AssignRT 149 (IdentifierRT 150 ((*R*) 25) (nil)) (NameRT 151 (IdentifierRT 152 ((*Med*) 28) (nil))))
        )
      ))
    )))))
))) :: (((*Binary_Search_Test*) 1), (0, (mkprocBodyDeclRT 2
  (* = = = Procedure Name = = = *)
  ((*Binary_Search_Test*) 1)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 3 ((*I*) 2) Integer In) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 4
(TypeDeclRT 5 (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) 
(SeqDeclRT 7
(TypeDeclRT 8 (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) 
(SeqDeclRT 10
(TypeDeclRT 11 (ArrayTypeDeclRT 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) 
(SeqDeclRT 13
(ObjDeclRT 14 (mkobjDeclRT 15 ((*A*) 6) (Array_Type ((*Ar*) 5)) None)) 
(SeqDeclRT 16
(ObjDeclRT 17 (mkobjDeclRT 18 ((*R*) 7) (Integer_Type ((*T*) 3)) None)) 
(SeqDeclRT 19
(TypeDeclRT 20 (DerivedTypeDeclRT 21 ((*T1*) 8) Integer (RangeRT 1 10))) 
(SeqDeclRT 22
(TypeDeclRT 23 (DerivedTypeDeclRT 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (RangeRT 2 5))) 
(SeqDeclRT 25
(TypeDeclRT 26 (SubtypeDeclRT 27 ((*T3*) 10) Integer (RangeRT 1 10))) 
(SeqDeclRT 28
(TypeDeclRT 29 (SubtypeDeclRT 30 ((*T4*) 11) Integer (RangeRT 5 10))) 
(SeqDeclRT 31
(TypeDeclRT 32 (RecordTypeDeclRT 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) 
(SeqDeclRT 35
(ProcBodyDeclRT 36 
  (mkprocBodyDeclRT 37
    (* = = = Procedure Name = = = *)
    ((*increase*) 15)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 38 ((*X*) 16) Integer In) :: 
    (mkparamSpecRT 39 ((*Y*) 17) Integer Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 40 (IdentifierRT 41 ((*Y*) 17) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 16) (nil))) (LiteralRT 45 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
  )
) 
(SeqDeclRT 46
(ObjDeclRT 48 (mkobjDeclRT 49 ((*B*) 21) Boolean (Some ((LiteralRT 47 (Boolean_Literal true) (nil) nil))))) 
(SeqDeclRT 50
(ProcBodyDeclRT 51 
  (mkprocBodyDeclRT 52
    (* = = = Procedure Name = = = *)
    ((*Search*) 22)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 53 ((*A*) 23) (Array_Type ((*Ar*) 5)) In) :: 
    (mkparamSpecRT 54 ((*I*) 24) Integer In) :: 
    (mkparamSpecRT 55 ((*R*) 25) (Integer_Type ((*T*) 3)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 56
  (ObjDeclRT 57 (mkobjDeclRT 58 ((*Left*) 26) (Subtype ((*U*) 4)) None)) 
  (SeqDeclRT 59
  (ObjDeclRT 60 (mkobjDeclRT 61 ((*Right*) 27) (Subtype ((*U*) 4)) None)) 
  (ObjDeclRT 62 (mkobjDeclRT 63 ((*Med*) 28) (Subtype ((*U*) 4)) None)))))
    (* = = = Procedure Body = = = *)
      (SeqRT 64
      (AssignRT 65 (IdentifierRT 66 ((*Left*) 26) (nil)) (LiteralRT 67 (Integer_Literal 0) (nil) nil)) 
      (SeqRT 68
      (AssignRT 69 (IdentifierRT 70 ((*Right*) 27) (nil)) (LiteralRT 71 (Integer_Literal 10) (nil) nil)) 
      (SeqRT 72
      (AssignRT 73 (IdentifierRT 74 ((*R*) 25) (nil)) (LiteralRT 75 (Integer_Literal 0) (nil) nil)) 
      (SeqRT 76
      (IfRT 77 (BinOpRT 78 Or (BinOpRT 79 Greater_Than (NameRT 80 (IndexedComponentRT 81 (IdentifierRT 82 ((*A*) 23) (nil)) (BinOpRT 83 Plus (NameRT 84 (IdentifierRT 85 ((*Left*) 26) (nil))) (LiteralRT 86 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil))) (NameRT 87 (IdentifierRT 88 ((*I*) 24) (nil))) (nil) nil) (BinOpRT 89 Less_Than (NameRT 90 (IndexedComponentRT 91 (IdentifierRT 92 ((*A*) 23) (nil)) (NameRT 93 (IdentifierRT 94 ((*Right*) 27) (nil))) (nil))) (NameRT 95 (IdentifierRT 96 ((*I*) 24) (nil))) (nil) nil) (nil) nil)
        (AssignRT 97 (IdentifierRT 98 ((*R*) 25) (nil)) (LiteralRT 99 (Integer_Literal 0) (nil) nil))
        NullRT
      ) 
      (WhileRT 100 (BinOpRT 101 Less_Than_Or_Equal (NameRT 102 (IdentifierRT 103 ((*Left*) 26) (nil))) (NameRT 104 (IdentifierRT 105 ((*Right*) 27) (nil))) (nil) nil)
        (SeqRT 106
        (AssignRT 107 (IdentifierRT 108 ((*Med*) 28) (nil)) (BinOpRT 109 Plus (NameRT 110 (IdentifierRT 111 ((*Left*) 26) (nil))) (BinOpRT 112 Divide (BinOpRT 113 Minus (NameRT 114 (IdentifierRT 115 ((*Right*) 27) (nil))) (NameRT 116 (IdentifierRT 117 ((*Left*) 26) (nil))) (nil) nil) (LiteralRT 118 (Integer_Literal 2) (nil) nil) (DivCheck :: nil) nil) (RangeCheck :: nil) nil)) 
        (IfRT 119 (BinOpRT 120 Less_Than (NameRT 121 (IndexedComponentRT 122 (IdentifierRT 123 ((*A*) 23) (nil)) (NameRT 124 (IdentifierRT 125 ((*Med*) 28) (nil))) (nil))) (NameRT 126 (IdentifierRT 127 ((*I*) 24) (nil))) (nil) nil)
          (AssignRT 128 (IdentifierRT 129 ((*Left*) 26) (nil)) (BinOpRT 130 Plus (NameRT 131 (IdentifierRT 132 ((*Med*) 28) (nil))) (LiteralRT 133 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
          (IfRT 134 (BinOpRT 135 Greater_Than (NameRT 136 (IndexedComponentRT 137 (IdentifierRT 138 ((*A*) 23) (nil)) (NameRT 139 (IdentifierRT 140 ((*Med*) 28) (nil))) (nil))) (NameRT 141 (IdentifierRT 142 ((*I*) 24) (nil))) (nil) nil)
            (AssignRT 143 (IdentifierRT 144 ((*Right*) 27) (nil)) (BinOpRT 145 Minus (NameRT 146 (IdentifierRT 147 ((*Med*) 28) (nil))) (LiteralRT 148 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
            (AssignRT 149 (IdentifierRT 150 ((*R*) 25) (nil)) (NameRT 151 (IdentifierRT 152 ((*Med*) 28) (nil))))
          )
        ))
      )))))
  )
) 
(SeqDeclRT 153
(ObjDeclRT 155 (mkobjDeclRT 156 ((*X1*) 29) (Derived_Type ((*T1*) 8)) (Some ((LiteralRT 154 (Integer_Literal 2) (nil) nil))))) 
(SeqDeclRT 157
(ObjDeclRT 159 (mkobjDeclRT 160 ((*X2*) 30) (Derived_Type ((*T2*) 9)) (Some ((LiteralRT 158 (Integer_Literal 3) (nil) nil))))) 
(SeqDeclRT 161
(ObjDeclRT 163 (mkobjDeclRT 164 ((*X3*) 31) (Subtype ((*T3*) 10)) (Some ((LiteralRT 162 (Integer_Literal 4) (nil) nil))))) 
(ObjDeclRT 166 (mkobjDeclRT 167 ((*X4*) 32) (Subtype ((*T4*) 11)) (Some ((LiteralRT 165 (Integer_Literal 6) (nil) nil))))))))))))))))))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 168
    (CallRT 169 170 ((*increase*) 15) 
      ((LiteralRT 171 (Integer_Literal 10) (nil) nil) :: (NameRT 172 (IdentifierRT 173 ((*X4*) 32) (RangeCheck :: nil))) :: nil)
    ) 
    (SeqRT 174
    (AssignRT 175 (IdentifierRT 176 ((*X1*) 29) (nil)) (BinOpRT 177 Plus (NameRT 178 (IdentifierRT 179 ((*X1*) 29) (nil))) (LiteralRT 180 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)) 
    (SeqRT 181
    (AssignRT 182 (IdentifierRT 183 ((*X2*) 30) (nil)) (BinOpRT 184 Plus (NameRT 185 (IdentifierRT 186 ((*X2*) 30) (nil))) (LiteralRT 187 (Integer_Literal 2) (nil) nil) (RangeCheck :: nil) nil)) 
    (SeqRT 188
    (AssignRT 189 (IdentifierRT 190 ((*X4*) 32) (nil)) (BinOpRT 191 Plus (NameRT 192 (IdentifierRT 193 ((*X3*) 31) (nil))) (NameRT 194 (IdentifierRT 195 ((*X4*) 32) (nil))) (RangeCheck :: nil) nil)) 
    (SeqRT 196
    (AssignRT 197 (IndexedComponentRT 198 (IdentifierRT 199 ((*A*) 6) (nil)) (LiteralRT 200 (Integer_Literal 0) (nil) nil) (nil)) (LiteralRT 201 (Integer_Literal 0) (nil) nil)) 
    (SeqRT 202
    (AssignRT 203 (IndexedComponentRT 204 (IdentifierRT 205 ((*A*) 6) (nil)) (LiteralRT 206 (Integer_Literal 1) (nil) nil) (nil)) (LiteralRT 207 (Integer_Literal 10) (nil) nil)) 
    (CallRT 208 209 ((*Search*) 22) 
      ((NameRT 210 (IdentifierRT 211 ((*A*) 6) (nil))) :: (NameRT 212 (IdentifierRT 213 ((*I*) 2) (nil))) :: (NameRT 214 (IdentifierRT 215 ((*R*) 7) (nil))) :: nil)
    )))))))
))) :: (((*increase*) 15), (1, (mkprocBodyDeclRT 37
  (* = = = Procedure Name = = = *)
  ((*increase*) 15)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 38 ((*X*) 16) Integer In) :: 
  (mkparamSpecRT 39 ((*Y*) 17) Integer Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 40 (IdentifierRT 41 ((*Y*) 17) (nil)) (BinOpRT 42 Plus (NameRT 43 (IdentifierRT 44 ((*X*) 16) (nil))) (LiteralRT 45 (Integer_Literal 1) (nil) nil) (OverflowCheck :: nil) nil))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*RT*) 12), (RecordTypeDeclRT 33 ((*RT*) 12) ((((*X*) 13), Integer) :: (((*Y*) 14), Integer) :: nil))) :: (((*T3*) 10), (SubtypeDeclRT 27 ((*T3*) 10) Integer (RangeRT 1 10))) :: (((*Ar*) 5), (ArrayTypeDeclRT 12 ((*Ar*) 5) ((*index subtype mark*) (Subtype ((*U*) 4))) ((*component type*) Integer))) :: (((*T4*) 11), (SubtypeDeclRT 30 ((*T4*) 11) Integer (RangeRT 5 10))) :: (((*T2*) 9), (DerivedTypeDeclRT 24 ((*T2*) 9) (Integer_Type ((*T*) 3)) (RangeRT 2 5))) :: (((*T1*) 8), (DerivedTypeDeclRT 21 ((*T1*) 8) Integer (RangeRT 1 10))) :: (((*U*) 4), (SubtypeDeclRT 9 ((*U*) 4) (Integer_Type ((*T*) 3)) (RangeRT 1 10))) :: (((*T*) 3), (IntegerTypeDeclRT 6 ((*T*) 3) (RangeRT 0 10))) :: nil)
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

