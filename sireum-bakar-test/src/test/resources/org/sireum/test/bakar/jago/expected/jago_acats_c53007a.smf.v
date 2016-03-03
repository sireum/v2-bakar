Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Subtype_Declaration 4 ((*FILE_NUM*) 1) Integer (Range 1 5))) 
(D_Seq_Declaration 5
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 6
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 7
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 8
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 9
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 10
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 11
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 12
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 13
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 14
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 15
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 16
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 17
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 18
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *)))))))))))))))) 
(D_Procedure_Body 19 
  (mkprocedure_body 20
    (* = = = Procedure Name = = = *)
    ((*ACATS_C53007A*) 17)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 21
  D_Null_Declaration (* Undefined Declarations ! *) 
  (D_Seq_Declaration 22
  (D_Object_Declaration 24 (mkobject_declaration 25 ((*CI1*) 19) Integer (Some ((E_Literal 23 (Integer_Literal 1) ))))) 
  (D_Seq_Declaration 26
  (D_Object_Declaration 28 (mkobject_declaration 29 ((*CI9*) 20) Integer (Some ((E_Literal 27 (Integer_Literal 9) ))))) 
  (D_Seq_Declaration 30
  (D_Object_Declaration 32 (mkobject_declaration 33 ((*CBT*) 22) Boolean (Some ((E_Literal 31 (Boolean_Literal true) ))))) 
  (D_Seq_Declaration 34
  (D_Object_Declaration 36 (mkobject_declaration 37 ((*CBF*) 23) Boolean (Some ((E_Literal 35 (Boolean_Literal false) ))))) 
  (D_Seq_Declaration 38
  (D_Object_Declaration 40 (mkobject_declaration 41 ((*VI1*) 24) Integer (Some ((E_Literal 39 (Integer_Literal 1) ))))) 
  (D_Seq_Declaration 42
  (D_Object_Declaration 44 (mkobject_declaration 45 ((*VI9*) 25) Integer (Some ((E_Literal 43 (Integer_Literal 9) ))))) 
  (D_Seq_Declaration 46
  (D_Object_Declaration 48 (mkobject_declaration 49 ((*VBT*) 26) Boolean (Some ((E_Literal 47 (Boolean_Literal true) ))))) 
  (D_Seq_Declaration 50
  (D_Object_Declaration 52 (mkobject_declaration 53 ((*VBF*) 27) Boolean (Some ((E_Literal 51 (Boolean_Literal false) ))))) 
  (D_Object_Declaration 55 (mkobject_declaration 56 ((*FLOW_COUNT*) 28) Integer (Some ((E_Literal 54 (Integer_Literal 0) )))))))))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 57
      S_Null (* arguments of procedure call are unrecognized ! *) 
      (S_Sequence 60
      (S_If 61 (E_Name 62 (E_Identifier 63 ((*VBF*) 27) ))
        S_Null (* arguments of procedure call are unrecognized ! *)
        (S_If 66 (E_Binary_Operation 67 Less_Than (E_Literal 27 (Integer_Literal 9) ) (E_Literal 69 (Integer_Literal 20) ) )
          (S_Sequence 70
          (S_Assignment 71 (E_Identifier 72 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 73 Plus (E_Name 74 (E_Identifier 75 ((*FLOW_COUNT*) 28) )) (E_Literal 76 (Integer_Literal 1) ) )) 
          (S_If 77 (E_Binary_Operation 78 And (E_Binary_Operation 79 Not_Equal (E_Name 80 (E_Identifier 81 ((*VI1*) 24) )) (E_Literal 82 (Integer_Literal 0) ) ) (E_Literal 83 (Boolean_Literal true) ) )
            (S_Assignment 84 (E_Identifier 85 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 86 Plus (E_Name 87 (E_Identifier 88 ((*FLOW_COUNT*) 28) )) (E_Literal 89 (Integer_Literal 1) ) ))
            S_Null (* arguments of procedure call are unrecognized ! *)
          ))
          S_Null (* arguments of procedure call are unrecognized ! *)
        )
      ) 
      (S_Sequence 94
      (S_If 95 (E_Binary_Operation 96 Or (E_Literal 35 (Boolean_Literal false) ) (E_Binary_Operation 98 Equal (E_Name 99 (E_Identifier 100 ((*VI9*) 25) )) (E_Literal 101 (Integer_Literal 9) ) ) )
        (S_If 102 (E_Binary_Operation 103 Or (E_Binary_Operation 104 Greater_Than (E_Binary_Operation 105 Plus (E_Name 106 (E_Identifier 107 ((*VI1*) 24) )) (E_Literal 27 (Integer_Literal 9) ) ) (E_Literal 109 (Integer_Literal 0) ) ) (E_Binary_Operation 110 And (E_Literal 35 (Boolean_Literal false) ) (E_Name 112 (E_Identifier 113 ((*VBT*) 26) )) ) )
          (S_Assignment 114 (E_Identifier 115 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 116 Plus (E_Name 117 (E_Identifier 118 ((*FLOW_COUNT*) 28) )) (E_Literal 119 (Integer_Literal 1) ) ))
          S_Null
        )
        (S_If 120 (E_Binary_Operation 121 Or (E_Name 122 (E_Identifier 123 ((*VBF*) 27) )) (E_Binary_Operation 124 Greater_Than (E_Name 125 (E_Identifier 126 ((*VI1*) 24) )) (E_Literal 127 (Integer_Literal 10) ) ) )
          S_Null (* arguments of procedure call are unrecognized ! *)
          S_Null
        )
      ) 
      (S_Sequence 130
      (S_If 131 (E_Binary_Operation 132 And (E_Binary_Operation 133 And (E_Unary_Operation 134 Not (E_Literal 31 (Boolean_Literal true) ) ) (E_Unary_Operation 136 Not (E_Name 137 (E_Identifier 138 ((*VBT*) 26) )) ) ) (E_Binary_Operation 139 Less_Than (E_Literal 27 (Integer_Literal 9) ) (E_Literal 141 (Integer_Literal 0) ) ) )
        (S_Sequence 142
        (S_If 143 (E_Binary_Operation 144 Or (E_Literal 145 (Boolean_Literal false) ) (E_Unary_Operation 146 Not (E_Literal 147 (Boolean_Literal true) ) ) )
          S_Null (* arguments of procedure call are unrecognized ! *)
          (S_If 150 (E_Binary_Operation 151 Greater_Than_Or_Equal (E_Name 152 (E_Identifier 153 ((*VI1*) 24) )) (E_Literal 154 (Integer_Literal 0) ) )
            S_Null
            S_Null (* arguments of procedure call are unrecognized ! *)
          )
        ) 
        S_Null (* arguments of procedure call are unrecognized ! *))
        (S_If 159 (E_Binary_Operation 160 Or (E_Binary_Operation 161 Less_Than (E_Binary_Operation 162 Plus (E_Binary_Operation 163 Multiply (E_Name 164 (E_Identifier 165 ((*VI1*) 24) )) (E_Literal 27 (Integer_Literal 9) ) ) (E_Literal 167 (Integer_Literal 3) ) ) (E_Literal 168 (Integer_Literal 0) ) ) (E_Binary_Operation 169 And (E_Name 170 (E_Identifier 171 ((*VBT*) 26) )) (E_Unary_Operation 172 Not (E_Binary_Operation 173 Less_Than (E_Literal 23 (Integer_Literal 1) ) (E_Literal 175 (Integer_Literal 0) ) ) ) ) )
          (S_Sequence 176
          (S_Assignment 177 (E_Identifier 178 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 179 Plus (E_Name 180 (E_Identifier 181 ((*FLOW_COUNT*) 28) )) (E_Literal 182 (Integer_Literal 1) ) )) 
          (S_If 183 (E_Binary_Operation 184 Or (E_Unary_Operation 185 Not (E_Literal 31 (Boolean_Literal true) ) ) (E_Binary_Operation 187 Equal (E_Binary_Operation 188 Plus (E_Literal 27 (Integer_Literal 9) ) (E_Literal 190 (Integer_Literal 1) ) ) (E_Literal 191 (Integer_Literal 0) ) ) )
            S_Null (* arguments of procedure call are unrecognized ! *)
            (S_Sequence 194
            (S_Assignment 195 (E_Identifier 196 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 197 Plus (E_Name 198 (E_Identifier 199 ((*FLOW_COUNT*) 28) )) (E_Literal 200 (Integer_Literal 1) ) )) 
            (S_If 201 (E_Binary_Operation 202 Greater_Than (E_Binary_Operation 203 Multiply (E_Name 204 (E_Identifier 205 ((*VI1*) 24) )) (E_Literal 206 (Integer_Literal 2) ) ) (E_Literal 207 (Integer_Literal 0) ) )
              (S_Assignment 208 (E_Identifier 209 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 210 Plus (E_Name 211 (E_Identifier 212 ((*FLOW_COUNT*) 28) )) (E_Literal 213 (Integer_Literal 1) ) ))
              (S_If 214 (E_Literal 215 (Boolean_Literal true) )
                S_Null (* arguments of procedure call are unrecognized ! *)
                S_Null
              )
            ))
          ))
          (S_If 218 (E_Binary_Operation 219 And (E_Literal 220 (Boolean_Literal false) ) (E_Literal 35 (Boolean_Literal false) ) )
            S_Null (* arguments of procedure call are unrecognized ! *)
            (S_If 224 (E_Name 225 (E_Identifier 226 ((*VBT*) 26) ))
              S_Null (* arguments of procedure call are unrecognized ! *)
              (S_If 229 (E_Binary_Operation 230 Equal (E_Name 231 (E_Identifier 232 ((*VI1*) 24) )) (E_Literal 233 (Integer_Literal 0) ) )
                S_Null (* arguments of procedure call are unrecognized ! *)
                S_Null (* arguments of procedure call are unrecognized ! *)
              )
            )
          )
        )
      ) 
      (S_Sequence 238
      (S_If 239 (E_Binary_Operation 240 Or (E_Binary_Operation 241 Equal (E_Literal 242 (Integer_Literal 3) ) (E_Literal 243 (Integer_Literal 5) ) ) (E_Unary_Operation 244 Not (E_Name 245 (E_Identifier 246 ((*VBT*) 26) )) ) )
        (S_Sequence 247
        S_Null (* arguments of procedure call are unrecognized ! *) 
        (S_If 250 (E_Binary_Operation 251 And (E_Literal 252 (Boolean_Literal true) ) (E_Literal 31 (Boolean_Literal true) ) )
          S_Null (* arguments of procedure call are unrecognized ! *)
          S_Null (* arguments of procedure call are unrecognized ! *)
        ))
        (S_If 258 (E_Literal 35 (Boolean_Literal false) )
          (S_Sequence 260
          (S_If 261 (E_Binary_Operation 262 Or (E_Binary_Operation 263 Greater_Than_Or_Equal (E_Name 264 (E_Identifier 265 ((*VI9*) 25) )) (E_Literal 266 (Integer_Literal 0) ) ) (E_Literal 267 (Boolean_Literal false) ) )
            (S_Sequence 268
            (S_If 269 (E_Name 270 (E_Identifier 271 ((*VBT*) 26) ))
              S_Null (* arguments of procedure call are unrecognized ! *)
              S_Null
            ) 
            S_Null (* arguments of procedure call are unrecognized ! *))
            (S_If 276 (E_Binary_Operation 277 Not_Equal (E_Binary_Operation 278 Plus (E_Name 279 (E_Identifier 280 ((*VI1*) 24) )) (E_Literal 27 (Integer_Literal 9) ) ) (E_Literal 282 (Integer_Literal 0) ) )
              S_Null (* arguments of procedure call are unrecognized ! *)
              S_Null
            )
          ) 
          S_Null (* arguments of procedure call are unrecognized ! *))
          (S_Sequence 287
          (S_If 288 (E_Binary_Operation 289 And (E_Name 290 (E_Identifier 291 ((*VBT*) 26) )) (E_Binary_Operation 292 Equal (E_Binary_Operation 293 Minus (E_Literal 27 (Integer_Literal 9) ) (E_Literal 295 (Integer_Literal 9) ) ) (E_Literal 296 (Integer_Literal 0) ) ) )
            (S_Sequence 297
            (S_If 298 (E_Literal 299 (Boolean_Literal false) )
              S_Null (* arguments of procedure call are unrecognized ! *)
              (S_If 302 (E_Binary_Operation 303 And (E_Unary_Operation 304 Not (E_Name 305 (E_Identifier 306 ((*VBF*) 27) )) ) (E_Binary_Operation 307 Greater_Than (E_Literal 23 (Integer_Literal 1) ) (E_Literal 309 (Integer_Literal 0) ) ) )
                (S_Assignment 310 (E_Identifier 311 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 312 Plus (E_Name 313 (E_Identifier 314 ((*FLOW_COUNT*) 28) )) (E_Literal 315 (Integer_Literal 1) ) ))
                S_Null (* arguments of procedure call are unrecognized ! *)
              )
            ) 
            (S_Assignment 318 (E_Identifier 319 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 320 Plus (E_Name 321 (E_Identifier 322 ((*FLOW_COUNT*) 28) )) (E_Literal 323 (Integer_Literal 1) ) )))
            (S_If 324 (E_Binary_Operation 325 Or (E_Unary_Operation 326 Not (E_Literal 35 (Boolean_Literal false) ) ) (E_Binary_Operation 328 Not_Equal (E_Name 329 (E_Identifier 330 ((*VI1*) 24) )) (E_Literal 331 (Integer_Literal 0) ) ) )
              (S_Sequence 332
              (S_If 333 (E_Name 334 (E_Identifier 335 ((*VBT*) 26) ))
                S_Null
                S_Null
              ) 
              S_Null (* arguments of procedure call are unrecognized ! *))
              S_Null (* arguments of procedure call are unrecognized ! *)
            )
          ) 
          (S_Assignment 340 (E_Identifier 341 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 342 Plus (E_Name 343 (E_Identifier 344 ((*FLOW_COUNT*) 28) )) (E_Literal 345 (Integer_Literal 1) ) )))
        )
      ) 
      (S_Sequence 346
      (S_If 347 (E_Binary_Operation 348 Not_Equal (E_Name 349 (E_Identifier 350 ((*FLOW_COUNT*) 28) )) (E_Literal 351 (Integer_Literal 9) ) )
        S_Null (* arguments of procedure call are unrecognized ! *)
        S_Null
      ) 
      (S_Procedure_Call 354 355 ((*RESULT*) 7) 
        (nil)
      )))))))
  )
)).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*CI1*) 19), (In, Integer)) :: (((*VBT*) 26), (In_Out, Boolean)) :: (((*CBF*) 23), (In, Boolean)) :: (((*FLOW_COUNT*) 28), (In_Out, Integer)) :: (((*CBT*) 22), (In, Boolean)) :: (((*VI1*) 24), (In_Out, Integer)) :: (((*CI9*) 20), (In, Integer)) :: (((*VI9*) 25), (In_Out, Integer)) :: (((*VBF*) 27), (In_Out, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*TIME_STAMP*) 16), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*LEGAL_FILE_NAME*) 15), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*FAILED*) 3), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*RESULT*) 7), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*SPECIAL_ACTION*) 5), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*TEST*) 2), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*NOT_APPLICABLE*) 4), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: (((*ACATS_C53007A*) 17), (0, (mkprocedure_body 20
  (* = = = Procedure Name = = = *)
  ((*ACATS_C53007A*) 17)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 21
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 22
(D_Object_Declaration 24 (mkobject_declaration 25 ((*CI1*) 19) Integer (Some ((E_Literal 23 (Integer_Literal 1) ))))) 
(D_Seq_Declaration 26
(D_Object_Declaration 28 (mkobject_declaration 29 ((*CI9*) 20) Integer (Some ((E_Literal 27 (Integer_Literal 9) ))))) 
(D_Seq_Declaration 30
(D_Object_Declaration 32 (mkobject_declaration 33 ((*CBT*) 22) Boolean (Some ((E_Literal 31 (Boolean_Literal true) ))))) 
(D_Seq_Declaration 34
(D_Object_Declaration 36 (mkobject_declaration 37 ((*CBF*) 23) Boolean (Some ((E_Literal 35 (Boolean_Literal false) ))))) 
(D_Seq_Declaration 38
(D_Object_Declaration 40 (mkobject_declaration 41 ((*VI1*) 24) Integer (Some ((E_Literal 39 (Integer_Literal 1) ))))) 
(D_Seq_Declaration 42
(D_Object_Declaration 44 (mkobject_declaration 45 ((*VI9*) 25) Integer (Some ((E_Literal 43 (Integer_Literal 9) ))))) 
(D_Seq_Declaration 46
(D_Object_Declaration 48 (mkobject_declaration 49 ((*VBT*) 26) Boolean (Some ((E_Literal 47 (Boolean_Literal true) ))))) 
(D_Seq_Declaration 50
(D_Object_Declaration 52 (mkobject_declaration 53 ((*VBF*) 27) Boolean (Some ((E_Literal 51 (Boolean_Literal false) ))))) 
(D_Object_Declaration 55 (mkobject_declaration 56 ((*FLOW_COUNT*) 28) Integer (Some ((E_Literal 54 (Integer_Literal 0) )))))))))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 57
    S_Null (* arguments of procedure call are unrecognized ! *) 
    (S_Sequence 60
    (S_If 61 (E_Name 62 (E_Identifier 63 ((*VBF*) 27) ))
      S_Null (* arguments of procedure call are unrecognized ! *)
      (S_If 66 (E_Binary_Operation 67 Less_Than (E_Literal 27 (Integer_Literal 9) ) (E_Literal 69 (Integer_Literal 20) ) )
        (S_Sequence 70
        (S_Assignment 71 (E_Identifier 72 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 73 Plus (E_Name 74 (E_Identifier 75 ((*FLOW_COUNT*) 28) )) (E_Literal 76 (Integer_Literal 1) ) )) 
        (S_If 77 (E_Binary_Operation 78 And (E_Binary_Operation 79 Not_Equal (E_Name 80 (E_Identifier 81 ((*VI1*) 24) )) (E_Literal 82 (Integer_Literal 0) ) ) (E_Literal 83 (Boolean_Literal true) ) )
          (S_Assignment 84 (E_Identifier 85 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 86 Plus (E_Name 87 (E_Identifier 88 ((*FLOW_COUNT*) 28) )) (E_Literal 89 (Integer_Literal 1) ) ))
          S_Null (* arguments of procedure call are unrecognized ! *)
        ))
        S_Null (* arguments of procedure call are unrecognized ! *)
      )
    ) 
    (S_Sequence 94
    (S_If 95 (E_Binary_Operation 96 Or (E_Literal 35 (Boolean_Literal false) ) (E_Binary_Operation 98 Equal (E_Name 99 (E_Identifier 100 ((*VI9*) 25) )) (E_Literal 101 (Integer_Literal 9) ) ) )
      (S_If 102 (E_Binary_Operation 103 Or (E_Binary_Operation 104 Greater_Than (E_Binary_Operation 105 Plus (E_Name 106 (E_Identifier 107 ((*VI1*) 24) )) (E_Literal 27 (Integer_Literal 9) ) ) (E_Literal 109 (Integer_Literal 0) ) ) (E_Binary_Operation 110 And (E_Literal 35 (Boolean_Literal false) ) (E_Name 112 (E_Identifier 113 ((*VBT*) 26) )) ) )
        (S_Assignment 114 (E_Identifier 115 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 116 Plus (E_Name 117 (E_Identifier 118 ((*FLOW_COUNT*) 28) )) (E_Literal 119 (Integer_Literal 1) ) ))
        S_Null
      )
      (S_If 120 (E_Binary_Operation 121 Or (E_Name 122 (E_Identifier 123 ((*VBF*) 27) )) (E_Binary_Operation 124 Greater_Than (E_Name 125 (E_Identifier 126 ((*VI1*) 24) )) (E_Literal 127 (Integer_Literal 10) ) ) )
        S_Null (* arguments of procedure call are unrecognized ! *)
        S_Null
      )
    ) 
    (S_Sequence 130
    (S_If 131 (E_Binary_Operation 132 And (E_Binary_Operation 133 And (E_Unary_Operation 134 Not (E_Literal 31 (Boolean_Literal true) ) ) (E_Unary_Operation 136 Not (E_Name 137 (E_Identifier 138 ((*VBT*) 26) )) ) ) (E_Binary_Operation 139 Less_Than (E_Literal 27 (Integer_Literal 9) ) (E_Literal 141 (Integer_Literal 0) ) ) )
      (S_Sequence 142
      (S_If 143 (E_Binary_Operation 144 Or (E_Literal 145 (Boolean_Literal false) ) (E_Unary_Operation 146 Not (E_Literal 147 (Boolean_Literal true) ) ) )
        S_Null (* arguments of procedure call are unrecognized ! *)
        (S_If 150 (E_Binary_Operation 151 Greater_Than_Or_Equal (E_Name 152 (E_Identifier 153 ((*VI1*) 24) )) (E_Literal 154 (Integer_Literal 0) ) )
          S_Null
          S_Null (* arguments of procedure call are unrecognized ! *)
        )
      ) 
      S_Null (* arguments of procedure call are unrecognized ! *))
      (S_If 159 (E_Binary_Operation 160 Or (E_Binary_Operation 161 Less_Than (E_Binary_Operation 162 Plus (E_Binary_Operation 163 Multiply (E_Name 164 (E_Identifier 165 ((*VI1*) 24) )) (E_Literal 27 (Integer_Literal 9) ) ) (E_Literal 167 (Integer_Literal 3) ) ) (E_Literal 168 (Integer_Literal 0) ) ) (E_Binary_Operation 169 And (E_Name 170 (E_Identifier 171 ((*VBT*) 26) )) (E_Unary_Operation 172 Not (E_Binary_Operation 173 Less_Than (E_Literal 23 (Integer_Literal 1) ) (E_Literal 175 (Integer_Literal 0) ) ) ) ) )
        (S_Sequence 176
        (S_Assignment 177 (E_Identifier 178 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 179 Plus (E_Name 180 (E_Identifier 181 ((*FLOW_COUNT*) 28) )) (E_Literal 182 (Integer_Literal 1) ) )) 
        (S_If 183 (E_Binary_Operation 184 Or (E_Unary_Operation 185 Not (E_Literal 31 (Boolean_Literal true) ) ) (E_Binary_Operation 187 Equal (E_Binary_Operation 188 Plus (E_Literal 27 (Integer_Literal 9) ) (E_Literal 190 (Integer_Literal 1) ) ) (E_Literal 191 (Integer_Literal 0) ) ) )
          S_Null (* arguments of procedure call are unrecognized ! *)
          (S_Sequence 194
          (S_Assignment 195 (E_Identifier 196 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 197 Plus (E_Name 198 (E_Identifier 199 ((*FLOW_COUNT*) 28) )) (E_Literal 200 (Integer_Literal 1) ) )) 
          (S_If 201 (E_Binary_Operation 202 Greater_Than (E_Binary_Operation 203 Multiply (E_Name 204 (E_Identifier 205 ((*VI1*) 24) )) (E_Literal 206 (Integer_Literal 2) ) ) (E_Literal 207 (Integer_Literal 0) ) )
            (S_Assignment 208 (E_Identifier 209 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 210 Plus (E_Name 211 (E_Identifier 212 ((*FLOW_COUNT*) 28) )) (E_Literal 213 (Integer_Literal 1) ) ))
            (S_If 214 (E_Literal 215 (Boolean_Literal true) )
              S_Null (* arguments of procedure call are unrecognized ! *)
              S_Null
            )
          ))
        ))
        (S_If 218 (E_Binary_Operation 219 And (E_Literal 220 (Boolean_Literal false) ) (E_Literal 35 (Boolean_Literal false) ) )
          S_Null (* arguments of procedure call are unrecognized ! *)
          (S_If 224 (E_Name 225 (E_Identifier 226 ((*VBT*) 26) ))
            S_Null (* arguments of procedure call are unrecognized ! *)
            (S_If 229 (E_Binary_Operation 230 Equal (E_Name 231 (E_Identifier 232 ((*VI1*) 24) )) (E_Literal 233 (Integer_Literal 0) ) )
              S_Null (* arguments of procedure call are unrecognized ! *)
              S_Null (* arguments of procedure call are unrecognized ! *)
            )
          )
        )
      )
    ) 
    (S_Sequence 238
    (S_If 239 (E_Binary_Operation 240 Or (E_Binary_Operation 241 Equal (E_Literal 242 (Integer_Literal 3) ) (E_Literal 243 (Integer_Literal 5) ) ) (E_Unary_Operation 244 Not (E_Name 245 (E_Identifier 246 ((*VBT*) 26) )) ) )
      (S_Sequence 247
      S_Null (* arguments of procedure call are unrecognized ! *) 
      (S_If 250 (E_Binary_Operation 251 And (E_Literal 252 (Boolean_Literal true) ) (E_Literal 31 (Boolean_Literal true) ) )
        S_Null (* arguments of procedure call are unrecognized ! *)
        S_Null (* arguments of procedure call are unrecognized ! *)
      ))
      (S_If 258 (E_Literal 35 (Boolean_Literal false) )
        (S_Sequence 260
        (S_If 261 (E_Binary_Operation 262 Or (E_Binary_Operation 263 Greater_Than_Or_Equal (E_Name 264 (E_Identifier 265 ((*VI9*) 25) )) (E_Literal 266 (Integer_Literal 0) ) ) (E_Literal 267 (Boolean_Literal false) ) )
          (S_Sequence 268
          (S_If 269 (E_Name 270 (E_Identifier 271 ((*VBT*) 26) ))
            S_Null (* arguments of procedure call are unrecognized ! *)
            S_Null
          ) 
          S_Null (* arguments of procedure call are unrecognized ! *))
          (S_If 276 (E_Binary_Operation 277 Not_Equal (E_Binary_Operation 278 Plus (E_Name 279 (E_Identifier 280 ((*VI1*) 24) )) (E_Literal 27 (Integer_Literal 9) ) ) (E_Literal 282 (Integer_Literal 0) ) )
            S_Null (* arguments of procedure call are unrecognized ! *)
            S_Null
          )
        ) 
        S_Null (* arguments of procedure call are unrecognized ! *))
        (S_Sequence 287
        (S_If 288 (E_Binary_Operation 289 And (E_Name 290 (E_Identifier 291 ((*VBT*) 26) )) (E_Binary_Operation 292 Equal (E_Binary_Operation 293 Minus (E_Literal 27 (Integer_Literal 9) ) (E_Literal 295 (Integer_Literal 9) ) ) (E_Literal 296 (Integer_Literal 0) ) ) )
          (S_Sequence 297
          (S_If 298 (E_Literal 299 (Boolean_Literal false) )
            S_Null (* arguments of procedure call are unrecognized ! *)
            (S_If 302 (E_Binary_Operation 303 And (E_Unary_Operation 304 Not (E_Name 305 (E_Identifier 306 ((*VBF*) 27) )) ) (E_Binary_Operation 307 Greater_Than (E_Literal 23 (Integer_Literal 1) ) (E_Literal 309 (Integer_Literal 0) ) ) )
              (S_Assignment 310 (E_Identifier 311 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 312 Plus (E_Name 313 (E_Identifier 314 ((*FLOW_COUNT*) 28) )) (E_Literal 315 (Integer_Literal 1) ) ))
              S_Null (* arguments of procedure call are unrecognized ! *)
            )
          ) 
          (S_Assignment 318 (E_Identifier 319 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 320 Plus (E_Name 321 (E_Identifier 322 ((*FLOW_COUNT*) 28) )) (E_Literal 323 (Integer_Literal 1) ) )))
          (S_If 324 (E_Binary_Operation 325 Or (E_Unary_Operation 326 Not (E_Literal 35 (Boolean_Literal false) ) ) (E_Binary_Operation 328 Not_Equal (E_Name 329 (E_Identifier 330 ((*VI1*) 24) )) (E_Literal 331 (Integer_Literal 0) ) ) )
            (S_Sequence 332
            (S_If 333 (E_Name 334 (E_Identifier 335 ((*VBT*) 26) ))
              S_Null
              S_Null
            ) 
            S_Null (* arguments of procedure call are unrecognized ! *))
            S_Null (* arguments of procedure call are unrecognized ! *)
          )
        ) 
        (S_Assignment 340 (E_Identifier 341 ((*FLOW_COUNT*) 28) ) (E_Binary_Operation 342 Plus (E_Name 343 (E_Identifier 344 ((*FLOW_COUNT*) 28) )) (E_Literal 345 (Integer_Literal 1) ) )))
      )
    ) 
    (S_Sequence 346
    (S_If 347 (E_Binary_Operation 348 Not_Equal (E_Name 349 (E_Identifier 350 ((*FLOW_COUNT*) 28) )) (E_Literal 351 (Integer_Literal 9) ) )
      S_Null (* arguments of procedure call are unrecognized ! *)
      S_Null
    ) 
    (S_Procedure_Call 354 355 ((*RESULT*) 7) 
      (nil)
    )))))))
))) :: (((*COMMENT*) 6), (0, (mkprocedure_body 0 0 nil D_Null_Declaration S_Null))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*FILE_NUM*) 1), (Subtype_Declaration 4 ((*FILE_NUM*) 1) Integer (Range 1 5))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((137, Boolean) :: (146, Boolean) :: (101, Integer) :: (173, Boolean) :: (200, Integer) :: (182, Integer) :: (209, Integer) :: (191, Integer) :: (83, Boolean) :: (164, Integer) :: (245, Boolean) :: (110, Boolean) :: (119, Integer) :: (23, Integer) :: (104, Boolean) :: (122, Boolean) :: (86, Integer) :: (185, Boolean) :: (167, Integer) :: (68, Integer) :: (140, Integer) :: (113, Boolean) :: (62, Boolean) :: (134, Boolean) :: (35, Boolean) :: (349, Integer) :: (125, Integer) :: (304, Boolean) :: (331, Integer) :: (80, Integer) :: (89, Integer) :: (295, Integer) :: (116, Integer) :: (98, Boolean) :: (107, Integer) :: (313, Integer) :: (322, Integer) :: (307, Boolean) :: (74, Integer) :: (262, Boolean) :: (343, Integer) :: (47, Boolean) :: (244, Boolean) :: (226, Boolean) :: (253, Boolean) :: (325, Boolean) :: (334, Boolean) :: (289, Boolean) :: (271, Boolean) :: (280, Integer) :: (319, Integer) :: (184, Boolean) :: (265, Integer) :: (175, Integer) :: (211, Integer) :: (292, Boolean) :: (166, Integer) :: (328, Boolean) :: (220, Boolean) :: (202, Boolean) :: (277, Boolean) :: (151, Boolean) :: (232, Integer) :: (259, Boolean) :: (124, Boolean) :: (133, Boolean) :: (106, Integer) :: (205, Integer) :: (160, Boolean) :: (169, Boolean) :: (178, Integer) :: (115, Integer) :: (187, Boolean) :: (196, Integer) :: (241, Boolean) :: (181, Integer) :: (163, Integer) :: (172, Boolean) :: (118, Integer) :: (127, Integer) :: (136, Boolean) :: (199, Integer) :: (100, Integer) :: (82, Integer) :: (109, Integer) :: (190, Integer) :: (73, Integer) :: (145, Boolean) :: (154, Integer) :: (85, Integer) :: (67, Boolean) :: (139, Boolean) :: (345, Integer) :: (121, Boolean) :: (31, Boolean) :: (76, Integer) :: (103, Boolean) :: (112, Boolean) :: (309, Integer) :: (327, Boolean) :: (97, Boolean) :: (348, Boolean) :: (312, Integer) :: (79, Boolean) :: (88, Integer) :: (294, Integer) :: (303, Boolean) :: (43, Integer) :: (267, Boolean) :: (330, Integer) :: (240, Boolean) :: (321, Integer) :: (189, Integer) :: (225, Boolean) :: (306, Boolean) :: (180, Integer) :: (342, Integer) :: (207, Integer) :: (198, Integer) :: (270, Boolean) :: (252, Boolean) :: (279, Integer) :: (351, Integer) :: (243, Integer) :: (315, Integer) :: (282, Integer) :: (174, Integer) :: (147, Boolean) :: (264, Integer) :: (138, Boolean) :: (210, Integer) :: (219, Boolean) :: (291, Boolean) :: (165, Integer) :: (246, Boolean) :: (186, Boolean) :: (213, Integer) :: (87, Integer) :: (96, Boolean) :: (168, Integer) :: (132, Boolean) :: (141, Integer) :: (105, Integer) :: (123, Boolean) :: (204, Integer) :: (78, Boolean) :: (69, Integer) :: (231, Integer) :: (63, Boolean) :: (99, Integer) :: (54, Integer) :: (341, Integer) :: (171, Boolean) :: (72, Integer) :: (144, Boolean) :: (81, Integer) :: (153, Integer) :: (126, Integer) :: (162, Integer) :: (27, Integer) :: (135, Boolean) :: (108, Integer) :: (117, Integer) :: (350, Integer) :: (323, Integer) :: (263, Boolean) :: (344, Integer) :: (299, Boolean) :: (326, Boolean) :: (335, Boolean) :: (308, Integer) :: (75, Integer) :: (281, Integer) :: (290, Boolean) :: (39, Integer) :: (111, Boolean) :: (230, Boolean) :: (51, Boolean) :: (221, Boolean) :: (320, Integer) :: (329, Integer) :: (203, Integer) :: (212, Integer) :: (311, Integer) :: (293, Integer) :: (266, Integer) :: (314, Integer) :: (179, Integer) :: (152, Integer) :: (188, Integer) :: (170, Boolean) :: (215, Boolean) :: (161, Boolean) :: (242, Integer) :: (251, Boolean) :: (197, Integer) :: (206, Integer) :: (233, Integer) :: (296, Integer) :: (278, Integer) :: (305, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((137, (sloc (*Line*)74 (*Col*)30 (*EndLine*)74 (*EndCol*)32)) :: (146, (sloc (*Line*)75 (*Col*)23 (*EndLine*)75 (*EndCol*)30)) :: (101, (sloc (*Line*)66 (*Col*)27 (*EndLine*)66 (*EndCol*)27)) :: (173, (sloc (*Line*)82 (*Col*)49 (*EndLine*)82 (*EndCol*)55)) :: (200, (sloc (*Line*)86 (*Col*)43 (*EndLine*)86 (*EndCol*)43)) :: (182, (sloc (*Line*)83 (*Col*)38 (*EndLine*)83 (*EndCol*)38)) :: (209, (sloc (*Line*)88 (*Col*)21 (*EndLine*)88 (*EndCol*)30)) :: (191, (sloc (*Line*)84 (*Col*)40 (*EndLine*)84 (*EndCol*)40)) :: (83, (sloc (*Line*)59 (*Col*)27 (*EndLine*)59 (*EndCol*)30)) :: (164, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)15)) :: (245, (sloc (*Line*)104 (*Col*)22 (*EndLine*)104 (*EndCol*)24)) :: (110, (sloc (*Line*)67 (*Col*)32 (*EndLine*)67 (*EndCol*)42)) :: (119, (sloc (*Line*)68 (*Col*)43 (*EndLine*)68 (*EndCol*)43)) :: (23, (sloc (*Line*)35 (*Col*)32 (*EndLine*)35 (*EndCol*)32)) :: (104, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)26)) :: (122, (sloc (*Line*)70 (*Col*)12 (*EndLine*)70 (*EndCol*)14)) :: (86, (sloc (*Line*)60 (*Col*)30 (*EndLine*)60 (*EndCol*)43)) :: (185, (sloc (*Line*)84 (*Col*)14 (*EndLine*)84 (*EndCol*)20)) :: (167, (sloc (*Line*)82 (*Col*)25 (*EndLine*)82 (*EndCol*)25)) :: (68, (sloc (*Line*)57 (*Col*)12 (*EndLine*)57 (*EndCol*)14)) :: (140, (sloc (*Line*)74 (*Col*)43 (*EndLine*)74 (*EndCol*)45)) :: (113, (sloc (*Line*)67 (*Col*)40 (*EndLine*)67 (*EndCol*)42)) :: (62, (sloc (*Line*)55 (*Col*)9 (*EndLine*)55 (*EndCol*)11)) :: (134, (sloc (*Line*)74 (*Col*)9 (*EndLine*)74 (*EndCol*)15)) :: (35, (sloc (*Line*)38 (*Col*)32 (*EndLine*)38 (*EndCol*)36)) :: (349, (sloc (*Line*)138 (*Col*)9 (*EndLine*)138 (*EndCol*)18)) :: (125, (sloc (*Line*)70 (*Col*)19 (*EndLine*)70 (*EndCol*)21)) :: (304, (sloc (*Line*)123 (*Col*)22 (*EndLine*)123 (*EndCol*)28)) :: (331, (sloc (*Line*)128 (*Col*)35 (*EndLine*)128 (*EndCol*)35)) :: (80, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)16)) :: (89, (sloc (*Line*)60 (*Col*)43 (*EndLine*)60 (*EndCol*)43)) :: (295, (sloc (*Line*)120 (*Col*)28 (*EndLine*)120 (*EndCol*)28)) :: (116, (sloc (*Line*)68 (*Col*)30 (*EndLine*)68 (*EndCol*)43)) :: (98, (sloc (*Line*)66 (*Col*)21 (*EndLine*)66 (*EndCol*)27)) :: (107, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)16)) :: (313, (sloc (*Line*)124 (*Col*)35 (*EndLine*)124 (*EndCol*)44)) :: (322, (sloc (*Line*)127 (*Col*)30 (*EndLine*)127 (*EndCol*)39)) :: (307, (sloc (*Line*)123 (*Col*)39 (*EndLine*)123 (*EndCol*)45)) :: (74, (sloc (*Line*)58 (*Col*)25 (*EndLine*)58 (*EndCol*)34)) :: (262, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)30)) :: (343, (sloc (*Line*)135 (*Col*)25 (*EndLine*)135 (*EndCol*)34)) :: (47, (sloc (*Line*)47 (*Col*)23 (*EndLine*)47 (*EndCol*)26)) :: (244, (sloc (*Line*)104 (*Col*)18 (*EndLine*)104 (*EndCol*)24)) :: (226, (sloc (*Line*)96 (*Col*)14 (*EndLine*)96 (*EndCol*)16)) :: (253, (sloc (*Line*)106 (*Col*)23 (*EndLine*)106 (*EndCol*)25)) :: (325, (sloc (*Line*)128 (*Col*)17 (*EndLine*)128 (*EndCol*)35)) :: (334, (sloc (*Line*)129 (*Col*)19 (*EndLine*)129 (*EndCol*)21)) :: (289, (sloc (*Line*)120 (*Col*)14 (*EndLine*)120 (*EndCol*)32)) :: (271, (sloc (*Line*)112 (*Col*)19 (*EndLine*)112 (*EndCol*)21)) :: (280, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)19)) :: (319, (sloc (*Line*)127 (*Col*)16 (*EndLine*)127 (*EndCol*)25)) :: (184, (sloc (*Line*)84 (*Col*)14 (*EndLine*)84 (*EndCol*)40)) :: (265, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)16)) :: (175, (sloc (*Line*)82 (*Col*)55 (*EndLine*)82 (*EndCol*)55)) :: (211, (sloc (*Line*)88 (*Col*)35 (*EndLine*)88 (*EndCol*)44)) :: (292, (sloc (*Line*)120 (*Col*)22 (*EndLine*)120 (*EndCol*)32)) :: (166, (sloc (*Line*)82 (*Col*)19 (*EndLine*)82 (*EndCol*)21)) :: (328, (sloc (*Line*)128 (*Col*)28 (*EndLine*)128 (*EndCol*)35)) :: (220, (sloc (*Line*)94 (*Col*)12 (*EndLine*)94 (*EndCol*)16)) :: (202, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)29)) :: (277, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)30)) :: (151, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)24)) :: (232, (sloc (*Line*)98 (*Col*)17 (*EndLine*)98 (*EndCol*)19)) :: (259, (sloc (*Line*)110 (*Col*)12 (*EndLine*)110 (*EndCol*)14)) :: (124, (sloc (*Line*)70 (*Col*)19 (*EndLine*)70 (*EndCol*)26)) :: (133, (sloc (*Line*)74 (*Col*)9 (*EndLine*)74 (*EndCol*)32)) :: (106, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)16)) :: (205, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)21)) :: (160, (sloc (*Line*)82 (*Col*)12 (*EndLine*)82 (*EndCol*)57)) :: (169, (sloc (*Line*)82 (*Col*)36 (*EndLine*)82 (*EndCol*)56)) :: (178, (sloc (*Line*)83 (*Col*)11 (*EndLine*)83 (*EndCol*)20)) :: (115, (sloc (*Line*)68 (*Col*)16 (*EndLine*)68 (*EndCol*)25)) :: (187, (sloc (*Line*)84 (*Col*)30 (*EndLine*)84 (*EndCol*)40)) :: (196, (sloc (*Line*)86 (*Col*)16 (*EndLine*)86 (*EndCol*)25)) :: (241, (sloc (*Line*)104 (*Col*)9 (*EndLine*)104 (*EndCol*)13)) :: (181, (sloc (*Line*)83 (*Col*)25 (*EndLine*)83 (*EndCol*)34)) :: (163, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)21)) :: (172, (sloc (*Line*)82 (*Col*)44 (*EndLine*)82 (*EndCol*)56)) :: (118, (sloc (*Line*)68 (*Col*)30 (*EndLine*)68 (*EndCol*)39)) :: (127, (sloc (*Line*)70 (*Col*)25 (*EndLine*)70 (*EndCol*)26)) :: (136, (sloc (*Line*)74 (*Col*)26 (*EndLine*)74 (*EndCol*)32)) :: (199, (sloc (*Line*)86 (*Col*)30 (*EndLine*)86 (*EndCol*)39)) :: (100, (sloc (*Line*)66 (*Col*)21 (*EndLine*)66 (*EndCol*)23)) :: (82, (sloc (*Line*)59 (*Col*)21 (*EndLine*)59 (*EndCol*)21)) :: (109, (sloc (*Line*)67 (*Col*)26 (*EndLine*)67 (*EndCol*)26)) :: (190, (sloc (*Line*)84 (*Col*)36 (*EndLine*)84 (*EndCol*)36)) :: (73, (sloc (*Line*)58 (*Col*)25 (*EndLine*)58 (*EndCol*)38)) :: (145, (sloc (*Line*)75 (*Col*)14 (*EndLine*)75 (*EndCol*)18)) :: (154, (sloc (*Line*)77 (*Col*)24 (*EndLine*)77 (*EndCol*)24)) :: (85, (sloc (*Line*)60 (*Col*)16 (*EndLine*)60 (*EndCol*)25)) :: (67, (sloc (*Line*)57 (*Col*)12 (*EndLine*)57 (*EndCol*)19)) :: (139, (sloc (*Line*)74 (*Col*)43 (*EndLine*)74 (*EndCol*)49)) :: (345, (sloc (*Line*)135 (*Col*)38 (*EndLine*)135 (*EndCol*)38)) :: (121, (sloc (*Line*)70 (*Col*)12 (*EndLine*)70 (*EndCol*)26)) :: (31, (sloc (*Line*)37 (*Col*)32 (*EndLine*)37 (*EndCol*)35)) :: (76, (sloc (*Line*)58 (*Col*)38 (*EndLine*)58 (*EndCol*)38)) :: (103, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)43)) :: (112, (sloc (*Line*)67 (*Col*)40 (*EndLine*)67 (*EndCol*)42)) :: (309, (sloc (*Line*)123 (*Col*)45 (*EndLine*)123 (*EndCol*)45)) :: (327, (sloc (*Line*)128 (*Col*)21 (*EndLine*)128 (*EndCol*)23)) :: (97, (sloc (*Line*)66 (*Col*)9 (*EndLine*)66 (*EndCol*)11)) :: (348, (sloc (*Line*)138 (*Col*)9 (*EndLine*)138 (*EndCol*)23)) :: (312, (sloc (*Line*)124 (*Col*)35 (*EndLine*)124 (*EndCol*)48)) :: (79, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)21)) :: (88, (sloc (*Line*)60 (*Col*)30 (*EndLine*)60 (*EndCol*)39)) :: (294, (sloc (*Line*)120 (*Col*)22 (*EndLine*)120 (*EndCol*)24)) :: (303, (sloc (*Line*)123 (*Col*)22 (*EndLine*)123 (*EndCol*)45)) :: (43, (sloc (*Line*)46 (*Col*)23 (*EndLine*)46 (*EndCol*)23)) :: (267, (sloc (*Line*)111 (*Col*)26 (*EndLine*)111 (*EndCol*)30)) :: (330, (sloc (*Line*)128 (*Col*)28 (*EndLine*)128 (*EndCol*)30)) :: (240, (sloc (*Line*)104 (*Col*)9 (*EndLine*)104 (*EndCol*)24)) :: (321, (sloc (*Line*)127 (*Col*)30 (*EndLine*)127 (*EndCol*)39)) :: (189, (sloc (*Line*)84 (*Col*)30 (*EndLine*)84 (*EndCol*)32)) :: (225, (sloc (*Line*)96 (*Col*)14 (*EndLine*)96 (*EndCol*)16)) :: (306, (sloc (*Line*)123 (*Col*)26 (*EndLine*)123 (*EndCol*)28)) :: (180, (sloc (*Line*)83 (*Col*)25 (*EndLine*)83 (*EndCol*)34)) :: (342, (sloc (*Line*)135 (*Col*)25 (*EndLine*)135 (*EndCol*)38)) :: (207, (sloc (*Line*)87 (*Col*)29 (*EndLine*)87 (*EndCol*)29)) :: (198, (sloc (*Line*)86 (*Col*)30 (*EndLine*)86 (*EndCol*)39)) :: (270, (sloc (*Line*)112 (*Col*)19 (*EndLine*)112 (*EndCol*)21)) :: (252, (sloc (*Line*)106 (*Col*)14 (*EndLine*)106 (*EndCol*)17)) :: (279, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)19)) :: (351, (sloc (*Line*)138 (*Col*)23 (*EndLine*)138 (*EndCol*)23)) :: (243, (sloc (*Line*)104 (*Col*)13 (*EndLine*)104 (*EndCol*)13)) :: (315, (sloc (*Line*)124 (*Col*)48 (*EndLine*)124 (*EndCol*)48)) :: (282, (sloc (*Line*)116 (*Col*)30 (*EndLine*)116 (*EndCol*)30)) :: (174, (sloc (*Line*)82 (*Col*)49 (*EndLine*)82 (*EndCol*)51)) :: (147, (sloc (*Line*)75 (*Col*)27 (*EndLine*)75 (*EndCol*)30)) :: (264, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)16)) :: (138, (sloc (*Line*)74 (*Col*)30 (*EndLine*)74 (*EndCol*)32)) :: (210, (sloc (*Line*)88 (*Col*)35 (*EndLine*)88 (*EndCol*)48)) :: (219, (sloc (*Line*)94 (*Col*)12 (*EndLine*)94 (*EndCol*)24)) :: (291, (sloc (*Line*)120 (*Col*)14 (*EndLine*)120 (*EndCol*)16)) :: (165, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)15)) :: (246, (sloc (*Line*)104 (*Col*)22 (*EndLine*)104 (*EndCol*)24)) :: (186, (sloc (*Line*)84 (*Col*)18 (*EndLine*)84 (*EndCol*)20)) :: (213, (sloc (*Line*)88 (*Col*)48 (*EndLine*)88 (*EndCol*)48)) :: (87, (sloc (*Line*)60 (*Col*)30 (*EndLine*)60 (*EndCol*)39)) :: (96, (sloc (*Line*)66 (*Col*)9 (*EndLine*)66 (*EndCol*)27)) :: (168, (sloc (*Line*)82 (*Col*)29 (*EndLine*)82 (*EndCol*)29)) :: (132, (sloc (*Line*)74 (*Col*)9 (*EndLine*)74 (*EndCol*)49)) :: (141, (sloc (*Line*)74 (*Col*)49 (*EndLine*)74 (*EndCol*)49)) :: (105, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)22)) :: (123, (sloc (*Line*)70 (*Col*)12 (*EndLine*)70 (*EndCol*)14)) :: (204, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)21)) :: (78, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)30)) :: (69, (sloc (*Line*)57 (*Col*)18 (*EndLine*)57 (*EndCol*)19)) :: (231, (sloc (*Line*)98 (*Col*)17 (*EndLine*)98 (*EndCol*)19)) :: (63, (sloc (*Line*)55 (*Col*)9 (*EndLine*)55 (*EndCol*)11)) :: (99, (sloc (*Line*)66 (*Col*)21 (*EndLine*)66 (*EndCol*)23)) :: (54, (sloc (*Line*)50 (*Col*)30 (*EndLine*)50 (*EndCol*)30)) :: (341, (sloc (*Line*)135 (*Col*)11 (*EndLine*)135 (*EndCol*)20)) :: (171, (sloc (*Line*)82 (*Col*)36 (*EndLine*)82 (*EndCol*)38)) :: (72, (sloc (*Line*)58 (*Col*)11 (*EndLine*)58 (*EndCol*)20)) :: (144, (sloc (*Line*)75 (*Col*)14 (*EndLine*)75 (*EndCol*)30)) :: (81, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)16)) :: (153, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)19)) :: (126, (sloc (*Line*)70 (*Col*)19 (*EndLine*)70 (*EndCol*)21)) :: (162, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)25)) :: (27, (sloc (*Line*)36 (*Col*)32 (*EndLine*)36 (*EndCol*)32)) :: (135, (sloc (*Line*)74 (*Col*)13 (*EndLine*)74 (*EndCol*)15)) :: (108, (sloc (*Line*)67 (*Col*)20 (*EndLine*)67 (*EndCol*)22)) :: (117, (sloc (*Line*)68 (*Col*)30 (*EndLine*)68 (*EndCol*)39)) :: (350, (sloc (*Line*)138 (*Col*)9 (*EndLine*)138 (*EndCol*)18)) :: (323, (sloc (*Line*)127 (*Col*)43 (*EndLine*)127 (*EndCol*)43)) :: (263, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)21)) :: (344, (sloc (*Line*)135 (*Col*)25 (*EndLine*)135 (*EndCol*)34)) :: (299, (sloc (*Line*)121 (*Col*)19 (*EndLine*)121 (*EndCol*)23)) :: (326, (sloc (*Line*)128 (*Col*)17 (*EndLine*)128 (*EndCol*)23)) :: (335, (sloc (*Line*)129 (*Col*)19 (*EndLine*)129 (*EndCol*)21)) :: (308, (sloc (*Line*)123 (*Col*)39 (*EndLine*)123 (*EndCol*)41)) :: (75, (sloc (*Line*)58 (*Col*)25 (*EndLine*)58 (*EndCol*)34)) :: (281, (sloc (*Line*)116 (*Col*)23 (*EndLine*)116 (*EndCol*)25)) :: (290, (sloc (*Line*)120 (*Col*)14 (*EndLine*)120 (*EndCol*)16)) :: (39, (sloc (*Line*)45 (*Col*)23 (*EndLine*)45 (*EndCol*)23)) :: (111, (sloc (*Line*)67 (*Col*)32 (*EndLine*)67 (*EndCol*)34)) :: (230, (sloc (*Line*)98 (*Col*)17 (*EndLine*)98 (*EndCol*)23)) :: (51, (sloc (*Line*)48 (*Col*)23 (*EndLine*)48 (*EndCol*)27)) :: (221, (sloc (*Line*)94 (*Col*)22 (*EndLine*)94 (*EndCol*)24)) :: (320, (sloc (*Line*)127 (*Col*)30 (*EndLine*)127 (*EndCol*)43)) :: (329, (sloc (*Line*)128 (*Col*)28 (*EndLine*)128 (*EndCol*)30)) :: (203, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)25)) :: (212, (sloc (*Line*)88 (*Col*)35 (*EndLine*)88 (*EndCol*)44)) :: (311, (sloc (*Line*)124 (*Col*)21 (*EndLine*)124 (*EndCol*)30)) :: (293, (sloc (*Line*)120 (*Col*)22 (*EndLine*)120 (*EndCol*)28)) :: (266, (sloc (*Line*)111 (*Col*)21 (*EndLine*)111 (*EndCol*)21)) :: (314, (sloc (*Line*)124 (*Col*)35 (*EndLine*)124 (*EndCol*)44)) :: (179, (sloc (*Line*)83 (*Col*)25 (*EndLine*)83 (*EndCol*)38)) :: (152, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)19)) :: (188, (sloc (*Line*)84 (*Col*)30 (*EndLine*)84 (*EndCol*)36)) :: (170, (sloc (*Line*)82 (*Col*)36 (*EndLine*)82 (*EndCol*)38)) :: (215, (sloc (*Line*)89 (*Col*)22 (*EndLine*)89 (*EndCol*)25)) :: (161, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)29)) :: (242, (sloc (*Line*)104 (*Col*)9 (*EndLine*)104 (*EndCol*)9)) :: (251, (sloc (*Line*)106 (*Col*)14 (*EndLine*)106 (*EndCol*)25)) :: (197, (sloc (*Line*)86 (*Col*)30 (*EndLine*)86 (*EndCol*)43)) :: (206, (sloc (*Line*)87 (*Col*)25 (*EndLine*)87 (*EndCol*)25)) :: (233, (sloc (*Line*)98 (*Col*)23 (*EndLine*)98 (*EndCol*)23)) :: (296, (sloc (*Line*)120 (*Col*)32 (*EndLine*)120 (*EndCol*)32)) :: (278, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)25)) :: (305, (sloc (*Line*)123 (*Col*)26 (*EndLine*)123 (*EndCol*)28)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("CBF", "ada://constant/ACATS_C53007A+31:11/CBF+38:6")) :: (26, ("VBT", "ada://variable/ACATS_C53007A+31:11/VBT+47:6")) :: (20, ("CI9", "ada://constant/ACATS_C53007A+31:11/CI9+36:6")) :: (22, ("CBT", "ada://constant/ACATS_C53007A+31:11/CBT+37:6")) :: (25, ("VI9", "ada://variable/ACATS_C53007A+31:11/VI9+46:6")) :: (28, ("FLOW_COUNT", "ada://variable/ACATS_C53007A+31:11/FLOW_COUNT+50:6")) :: (19, ("CI1", "ada://constant/ACATS_C53007A+31:11/CI1+35:6")) :: (27, ("VBF", "ada://variable/ACATS_C53007A+31:11/VBF+48:6")) :: (24, ("VI1", "ada://variable/ACATS_C53007A+31:11/VI1+45:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((17, ("ACATS_C53007A", "ada://procedure_body/ACATS_C53007A+31:11")) :: (8, ("IDENT_INT", "ada://expression_function/ACATS_REPORT-47:9/IDENT_INT-112:15")) :: (11, ("IDENT_BOOL", "ada://expression_function/ACATS_REPORT-47:9/IDENT_BOOL-129:15")) :: (2, ("TEST", "ada://procedure/ACATS_REPORT-47:9/TEST-53:16")) :: (5, ("SPECIAL_ACTION", "ada://procedure/ACATS_REPORT-47:9/SPECIAL_ACTION-85:16")) :: (14, ("EQUAL", "ada://expression_function/ACATS_REPORT-47:9/EQUAL-144:15")) :: (4, ("NOT_APPLICABLE", "ada://procedure/ACATS_REPORT-47:9/NOT_APPLICABLE-75:16")) :: (13, ("IDENT_WIDE_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_STR-139:15")) :: (16, ("TIME_STAMP", "ada://function/ACATS_REPORT-47:9/TIME_STAMP-159:15")) :: (7, ("RESULT", "ada://procedure/ACATS_REPORT-47:9/RESULT-99:16")) :: (10, ("IDENT_WIDE_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_CHAR-123:15")) :: (9, ("IDENT_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_CHAR-117:15")) :: (3, ("FAILED", "ada://procedure/ACATS_REPORT-47:9/FAILED-65:16")) :: (12, ("IDENT_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_STR-134:15")) :: (15, ("LEGAL_FILE_NAME", "ada://function/ACATS_REPORT-47:9/LEGAL_FILE_NAME-152:15")) :: (6, ("COMMENT", "ada://procedure/ACATS_REPORT-47:9/COMMENT-94:16")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((1, ("FILE_NUM", "ada://subtype/ACATS_REPORT-47:9/FILE_NUM-49:14")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Subtype_Declaration_X 4 ((*FILE_NUM*) 1) Integer (Range_X 1 5))) 
(D_Seq_Declaration_X 5
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 6
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 7
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 8
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 9
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 10
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 11
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 12
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 13
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 14
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 15
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 16
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 17
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 18
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *)))))))))))))))) 
(D_Procedure_Body_X 19 
  (mkprocedure_body_x 20
    (* = = = Procedure Name = = = *)
    ((*ACATS_C53007A*) 17)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 21
  D_Null_Declaration_X (* Undefined Declarations ! *) 
  (D_Seq_Declaration_X 22
  (D_Object_Declaration_X 24 (mkobject_declaration_x 25 ((*CI1*) 19) Integer (Some ((E_Literal_X 23 (Integer_Literal 1) (nil) nil))))) 
  (D_Seq_Declaration_X 26
  (D_Object_Declaration_X 28 (mkobject_declaration_x 29 ((*CI9*) 20) Integer (Some ((E_Literal_X 27 (Integer_Literal 9) (nil) nil))))) 
  (D_Seq_Declaration_X 30
  (D_Object_Declaration_X 32 (mkobject_declaration_x 33 ((*CBT*) 22) Boolean (Some ((E_Literal_X 31 (Boolean_Literal true) (nil) nil))))) 
  (D_Seq_Declaration_X 34
  (D_Object_Declaration_X 36 (mkobject_declaration_x 37 ((*CBF*) 23) Boolean (Some ((E_Literal_X 35 (Boolean_Literal false) (nil) nil))))) 
  (D_Seq_Declaration_X 38
  (D_Object_Declaration_X 40 (mkobject_declaration_x 41 ((*VI1*) 24) Integer (Some ((E_Literal_X 39 (Integer_Literal 1) (nil) nil))))) 
  (D_Seq_Declaration_X 42
  (D_Object_Declaration_X 44 (mkobject_declaration_x 45 ((*VI9*) 25) Integer (Some ((E_Literal_X 43 (Integer_Literal 9) (nil) nil))))) 
  (D_Seq_Declaration_X 46
  (D_Object_Declaration_X 48 (mkobject_declaration_x 49 ((*VBT*) 26) Boolean (Some ((E_Literal_X 47 (Boolean_Literal true) (nil) nil))))) 
  (D_Seq_Declaration_X 50
  (D_Object_Declaration_X 52 (mkobject_declaration_x 53 ((*VBF*) 27) Boolean (Some ((E_Literal_X 51 (Boolean_Literal false) (nil) nil))))) 
  (D_Object_Declaration_X 55 (mkobject_declaration_x 56 ((*FLOW_COUNT*) 28) Integer (Some ((E_Literal_X 54 (Integer_Literal 0) (nil) nil)))))))))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 57
      S_Null_X (* arguments of procedure call are unrecognized ! *) 
      (S_Sequence_X 60
      (S_If_X 61 (E_Name_X 62 (E_Identifier_X 63 ((*VBF*) 27) (nil)))
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        (S_If_X 66 (E_Binary_Operation_X 67 Less_Than (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 69 (Integer_Literal 20) (nil) nil) (nil) nil)
          (S_Sequence_X 70
          (S_Assignment_X 71 (E_Identifier_X 72 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 73 Plus (E_Name_X 74 (E_Identifier_X 75 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 76 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
          (S_If_X 77 (E_Binary_Operation_X 78 And (E_Binary_Operation_X 79 Not_Equal (E_Name_X 80 (E_Identifier_X 81 ((*VI1*) 24) (nil))) (E_Literal_X 82 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Literal_X 83 (Boolean_Literal true) (nil) nil) (nil) nil)
            (S_Assignment_X 84 (E_Identifier_X 85 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 86 Plus (E_Name_X 87 (E_Identifier_X 88 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 89 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
            S_Null_X (* arguments of procedure call are unrecognized ! *)
          ))
          S_Null_X (* arguments of procedure call are unrecognized ! *)
        )
      ) 
      (S_Sequence_X 94
      (S_If_X 95 (E_Binary_Operation_X 96 Or (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (E_Binary_Operation_X 98 Equal (E_Name_X 99 (E_Identifier_X 100 ((*VI9*) 25) (nil))) (E_Literal_X 101 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil)
        (S_If_X 102 (E_Binary_Operation_X 103 Or (E_Binary_Operation_X 104 Greater_Than (E_Binary_Operation_X 105 Plus (E_Name_X 106 (E_Identifier_X 107 ((*VI1*) 24) (nil))) (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 109 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Binary_Operation_X 110 And (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (E_Name_X 112 (E_Identifier_X 113 ((*VBT*) 26) (nil))) (nil) nil) (nil) nil)
          (S_Assignment_X 114 (E_Identifier_X 115 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 116 Plus (E_Name_X 117 (E_Identifier_X 118 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 119 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
          S_Null_X
        )
        (S_If_X 120 (E_Binary_Operation_X 121 Or (E_Name_X 122 (E_Identifier_X 123 ((*VBF*) 27) (nil))) (E_Binary_Operation_X 124 Greater_Than (E_Name_X 125 (E_Identifier_X 126 ((*VI1*) 24) (nil))) (E_Literal_X 127 (Integer_Literal 10) (nil) nil) (nil) nil) (nil) nil)
          S_Null_X (* arguments of procedure call are unrecognized ! *)
          S_Null_X
        )
      ) 
      (S_Sequence_X 130
      (S_If_X 131 (E_Binary_Operation_X 132 And (E_Binary_Operation_X 133 And (E_Unary_Operation_X 134 Not (E_Literal_X 31 (Boolean_Literal true) (nil) nil) (nil) nil) (E_Unary_Operation_X 136 Not (E_Name_X 137 (E_Identifier_X 138 ((*VBT*) 26) (nil))) (nil) nil) (nil) nil) (E_Binary_Operation_X 139 Less_Than (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 141 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
        (S_Sequence_X 142
        (S_If_X 143 (E_Binary_Operation_X 144 Or (E_Literal_X 145 (Boolean_Literal false) (nil) nil) (E_Unary_Operation_X 146 Not (E_Literal_X 147 (Boolean_Literal true) (nil) nil) (nil) nil) (nil) nil)
          S_Null_X (* arguments of procedure call are unrecognized ! *)
          (S_If_X 150 (E_Binary_Operation_X 151 Greater_Than_Or_Equal (E_Name_X 152 (E_Identifier_X 153 ((*VI1*) 24) (nil))) (E_Literal_X 154 (Integer_Literal 0) (nil) nil) (nil) nil)
            S_Null_X
            S_Null_X (* arguments of procedure call are unrecognized ! *)
          )
        ) 
        S_Null_X (* arguments of procedure call are unrecognized ! *))
        (S_If_X 159 (E_Binary_Operation_X 160 Or (E_Binary_Operation_X 161 Less_Than (E_Binary_Operation_X 162 Plus (E_Binary_Operation_X 163 Multiply (E_Name_X 164 (E_Identifier_X 165 ((*VI1*) 24) (nil))) (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 167 (Integer_Literal 3) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 168 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Binary_Operation_X 169 And (E_Name_X 170 (E_Identifier_X 171 ((*VBT*) 26) (nil))) (E_Unary_Operation_X 172 Not (E_Binary_Operation_X 173 Less_Than (E_Literal_X 23 (Integer_Literal 1) (nil) nil) (E_Literal_X 175 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil) (nil) nil) (nil) nil)
          (S_Sequence_X 176
          (S_Assignment_X 177 (E_Identifier_X 178 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 179 Plus (E_Name_X 180 (E_Identifier_X 181 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 182 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
          (S_If_X 183 (E_Binary_Operation_X 184 Or (E_Unary_Operation_X 185 Not (E_Literal_X 31 (Boolean_Literal true) (nil) nil) (nil) nil) (E_Binary_Operation_X 187 Equal (E_Binary_Operation_X 188 Plus (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 190 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 191 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
            S_Null_X (* arguments of procedure call are unrecognized ! *)
            (S_Sequence_X 194
            (S_Assignment_X 195 (E_Identifier_X 196 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 197 Plus (E_Name_X 198 (E_Identifier_X 199 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 200 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
            (S_If_X 201 (E_Binary_Operation_X 202 Greater_Than (E_Binary_Operation_X 203 Multiply (E_Name_X 204 (E_Identifier_X 205 ((*VI1*) 24) (nil))) (E_Literal_X 206 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 207 (Integer_Literal 0) (nil) nil) (nil) nil)
              (S_Assignment_X 208 (E_Identifier_X 209 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 210 Plus (E_Name_X 211 (E_Identifier_X 212 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 213 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
              (S_If_X 214 (E_Literal_X 215 (Boolean_Literal true) (nil) nil)
                S_Null_X (* arguments of procedure call are unrecognized ! *)
                S_Null_X
              )
            ))
          ))
          (S_If_X 218 (E_Binary_Operation_X 219 And (E_Literal_X 220 (Boolean_Literal false) (nil) nil) (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (nil) nil)
            S_Null_X (* arguments of procedure call are unrecognized ! *)
            (S_If_X 224 (E_Name_X 225 (E_Identifier_X 226 ((*VBT*) 26) (nil)))
              S_Null_X (* arguments of procedure call are unrecognized ! *)
              (S_If_X 229 (E_Binary_Operation_X 230 Equal (E_Name_X 231 (E_Identifier_X 232 ((*VI1*) 24) (nil))) (E_Literal_X 233 (Integer_Literal 0) (nil) nil) (nil) nil)
                S_Null_X (* arguments of procedure call are unrecognized ! *)
                S_Null_X (* arguments of procedure call are unrecognized ! *)
              )
            )
          )
        )
      ) 
      (S_Sequence_X 238
      (S_If_X 239 (E_Binary_Operation_X 240 Or (E_Binary_Operation_X 241 Equal (E_Literal_X 242 (Integer_Literal 3) (nil) nil) (E_Literal_X 243 (Integer_Literal 5) (nil) nil) (nil) nil) (E_Unary_Operation_X 244 Not (E_Name_X 245 (E_Identifier_X 246 ((*VBT*) 26) (nil))) (nil) nil) (nil) nil)
        (S_Sequence_X 247
        S_Null_X (* arguments of procedure call are unrecognized ! *) 
        (S_If_X 250 (E_Binary_Operation_X 251 And (E_Literal_X 252 (Boolean_Literal true) (nil) nil) (E_Literal_X 31 (Boolean_Literal true) (nil) nil) (nil) nil)
          S_Null_X (* arguments of procedure call are unrecognized ! *)
          S_Null_X (* arguments of procedure call are unrecognized ! *)
        ))
        (S_If_X 258 (E_Literal_X 35 (Boolean_Literal false) (nil) nil)
          (S_Sequence_X 260
          (S_If_X 261 (E_Binary_Operation_X 262 Or (E_Binary_Operation_X 263 Greater_Than_Or_Equal (E_Name_X 264 (E_Identifier_X 265 ((*VI9*) 25) (nil))) (E_Literal_X 266 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Literal_X 267 (Boolean_Literal false) (nil) nil) (nil) nil)
            (S_Sequence_X 268
            (S_If_X 269 (E_Name_X 270 (E_Identifier_X 271 ((*VBT*) 26) (nil)))
              S_Null_X (* arguments of procedure call are unrecognized ! *)
              S_Null_X
            ) 
            S_Null_X (* arguments of procedure call are unrecognized ! *))
            (S_If_X 276 (E_Binary_Operation_X 277 Not_Equal (E_Binary_Operation_X 278 Plus (E_Name_X 279 (E_Identifier_X 280 ((*VI1*) 24) (nil))) (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 282 (Integer_Literal 0) (nil) nil) (nil) nil)
              S_Null_X (* arguments of procedure call are unrecognized ! *)
              S_Null_X
            )
          ) 
          S_Null_X (* arguments of procedure call are unrecognized ! *))
          (S_Sequence_X 287
          (S_If_X 288 (E_Binary_Operation_X 289 And (E_Name_X 290 (E_Identifier_X 291 ((*VBT*) 26) (nil))) (E_Binary_Operation_X 292 Equal (E_Binary_Operation_X 293 Minus (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 295 (Integer_Literal 9) (nil) nil) (nil) nil) (E_Literal_X 296 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
            (S_Sequence_X 297
            (S_If_X 298 (E_Literal_X 299 (Boolean_Literal false) (nil) nil)
              S_Null_X (* arguments of procedure call are unrecognized ! *)
              (S_If_X 302 (E_Binary_Operation_X 303 And (E_Unary_Operation_X 304 Not (E_Name_X 305 (E_Identifier_X 306 ((*VBF*) 27) (nil))) (nil) nil) (E_Binary_Operation_X 307 Greater_Than (E_Literal_X 23 (Integer_Literal 1) (nil) nil) (E_Literal_X 309 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
                (S_Assignment_X 310 (E_Identifier_X 311 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 312 Plus (E_Name_X 313 (E_Identifier_X 314 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 315 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
                S_Null_X (* arguments of procedure call are unrecognized ! *)
              )
            ) 
            (S_Assignment_X 318 (E_Identifier_X 319 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 320 Plus (E_Name_X 321 (E_Identifier_X 322 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 323 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
            (S_If_X 324 (E_Binary_Operation_X 325 Or (E_Unary_Operation_X 326 Not (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (nil) nil) (E_Binary_Operation_X 328 Not_Equal (E_Name_X 329 (E_Identifier_X 330 ((*VI1*) 24) (nil))) (E_Literal_X 331 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
              (S_Sequence_X 332
              (S_If_X 333 (E_Name_X 334 (E_Identifier_X 335 ((*VBT*) 26) (nil)))
                S_Null_X
                S_Null_X
              ) 
              S_Null_X (* arguments of procedure call are unrecognized ! *))
              S_Null_X (* arguments of procedure call are unrecognized ! *)
            )
          ) 
          (S_Assignment_X 340 (E_Identifier_X 341 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 342 Plus (E_Name_X 343 (E_Identifier_X 344 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 345 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
        )
      ) 
      (S_Sequence_X 346
      (S_If_X 347 (E_Binary_Operation_X 348 Not_Equal (E_Name_X 349 (E_Identifier_X 350 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 351 (Integer_Literal 9) (nil) nil) (nil) nil)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        S_Null_X
      ) 
      (S_Procedure_Call_X 354 355 ((*RESULT*) 7) 
        (nil)
      )))))))
  )
)).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*CI1*) 19), (In, Integer)) :: (((*VBT*) 26), (In_Out, Boolean)) :: (((*CBF*) 23), (In, Boolean)) :: (((*FLOW_COUNT*) 28), (In_Out, Integer)) :: (((*CBT*) 22), (In, Boolean)) :: (((*VI1*) 24), (In_Out, Integer)) :: (((*CI9*) 20), (In, Integer)) :: (((*VI9*) 25), (In_Out, Integer)) :: (((*VBF*) 27), (In_Out, Boolean)) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*TIME_STAMP*) 16), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*LEGAL_FILE_NAME*) 15), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*FAILED*) 3), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*RESULT*) 7), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*SPECIAL_ACTION*) 5), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*TEST*) 2), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*NOT_APPLICABLE*) 4), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: (((*ACATS_C53007A*) 17), (0, (mkprocedure_body_x 20
  (* = = = Procedure Name = = = *)
  ((*ACATS_C53007A*) 17)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 21
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 22
(D_Object_Declaration_X 24 (mkobject_declaration_x 25 ((*CI1*) 19) Integer (Some ((E_Literal_X 23 (Integer_Literal 1) (nil) nil))))) 
(D_Seq_Declaration_X 26
(D_Object_Declaration_X 28 (mkobject_declaration_x 29 ((*CI9*) 20) Integer (Some ((E_Literal_X 27 (Integer_Literal 9) (nil) nil))))) 
(D_Seq_Declaration_X 30
(D_Object_Declaration_X 32 (mkobject_declaration_x 33 ((*CBT*) 22) Boolean (Some ((E_Literal_X 31 (Boolean_Literal true) (nil) nil))))) 
(D_Seq_Declaration_X 34
(D_Object_Declaration_X 36 (mkobject_declaration_x 37 ((*CBF*) 23) Boolean (Some ((E_Literal_X 35 (Boolean_Literal false) (nil) nil))))) 
(D_Seq_Declaration_X 38
(D_Object_Declaration_X 40 (mkobject_declaration_x 41 ((*VI1*) 24) Integer (Some ((E_Literal_X 39 (Integer_Literal 1) (nil) nil))))) 
(D_Seq_Declaration_X 42
(D_Object_Declaration_X 44 (mkobject_declaration_x 45 ((*VI9*) 25) Integer (Some ((E_Literal_X 43 (Integer_Literal 9) (nil) nil))))) 
(D_Seq_Declaration_X 46
(D_Object_Declaration_X 48 (mkobject_declaration_x 49 ((*VBT*) 26) Boolean (Some ((E_Literal_X 47 (Boolean_Literal true) (nil) nil))))) 
(D_Seq_Declaration_X 50
(D_Object_Declaration_X 52 (mkobject_declaration_x 53 ((*VBF*) 27) Boolean (Some ((E_Literal_X 51 (Boolean_Literal false) (nil) nil))))) 
(D_Object_Declaration_X 55 (mkobject_declaration_x 56 ((*FLOW_COUNT*) 28) Integer (Some ((E_Literal_X 54 (Integer_Literal 0) (nil) nil)))))))))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 57
    S_Null_X (* arguments of procedure call are unrecognized ! *) 
    (S_Sequence_X 60
    (S_If_X 61 (E_Name_X 62 (E_Identifier_X 63 ((*VBF*) 27) (nil)))
      S_Null_X (* arguments of procedure call are unrecognized ! *)
      (S_If_X 66 (E_Binary_Operation_X 67 Less_Than (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 69 (Integer_Literal 20) (nil) nil) (nil) nil)
        (S_Sequence_X 70
        (S_Assignment_X 71 (E_Identifier_X 72 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 73 Plus (E_Name_X 74 (E_Identifier_X 75 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 76 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_If_X 77 (E_Binary_Operation_X 78 And (E_Binary_Operation_X 79 Not_Equal (E_Name_X 80 (E_Identifier_X 81 ((*VI1*) 24) (nil))) (E_Literal_X 82 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Literal_X 83 (Boolean_Literal true) (nil) nil) (nil) nil)
          (S_Assignment_X 84 (E_Identifier_X 85 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 86 Plus (E_Name_X 87 (E_Identifier_X 88 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 89 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
          S_Null_X (* arguments of procedure call are unrecognized ! *)
        ))
        S_Null_X (* arguments of procedure call are unrecognized ! *)
      )
    ) 
    (S_Sequence_X 94
    (S_If_X 95 (E_Binary_Operation_X 96 Or (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (E_Binary_Operation_X 98 Equal (E_Name_X 99 (E_Identifier_X 100 ((*VI9*) 25) (nil))) (E_Literal_X 101 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil)
      (S_If_X 102 (E_Binary_Operation_X 103 Or (E_Binary_Operation_X 104 Greater_Than (E_Binary_Operation_X 105 Plus (E_Name_X 106 (E_Identifier_X 107 ((*VI1*) 24) (nil))) (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 109 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Binary_Operation_X 110 And (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (E_Name_X 112 (E_Identifier_X 113 ((*VBT*) 26) (nil))) (nil) nil) (nil) nil)
        (S_Assignment_X 114 (E_Identifier_X 115 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 116 Plus (E_Name_X 117 (E_Identifier_X 118 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 119 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
        S_Null_X
      )
      (S_If_X 120 (E_Binary_Operation_X 121 Or (E_Name_X 122 (E_Identifier_X 123 ((*VBF*) 27) (nil))) (E_Binary_Operation_X 124 Greater_Than (E_Name_X 125 (E_Identifier_X 126 ((*VI1*) 24) (nil))) (E_Literal_X 127 (Integer_Literal 10) (nil) nil) (nil) nil) (nil) nil)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        S_Null_X
      )
    ) 
    (S_Sequence_X 130
    (S_If_X 131 (E_Binary_Operation_X 132 And (E_Binary_Operation_X 133 And (E_Unary_Operation_X 134 Not (E_Literal_X 31 (Boolean_Literal true) (nil) nil) (nil) nil) (E_Unary_Operation_X 136 Not (E_Name_X 137 (E_Identifier_X 138 ((*VBT*) 26) (nil))) (nil) nil) (nil) nil) (E_Binary_Operation_X 139 Less_Than (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 141 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
      (S_Sequence_X 142
      (S_If_X 143 (E_Binary_Operation_X 144 Or (E_Literal_X 145 (Boolean_Literal false) (nil) nil) (E_Unary_Operation_X 146 Not (E_Literal_X 147 (Boolean_Literal true) (nil) nil) (nil) nil) (nil) nil)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        (S_If_X 150 (E_Binary_Operation_X 151 Greater_Than_Or_Equal (E_Name_X 152 (E_Identifier_X 153 ((*VI1*) 24) (nil))) (E_Literal_X 154 (Integer_Literal 0) (nil) nil) (nil) nil)
          S_Null_X
          S_Null_X (* arguments of procedure call are unrecognized ! *)
        )
      ) 
      S_Null_X (* arguments of procedure call are unrecognized ! *))
      (S_If_X 159 (E_Binary_Operation_X 160 Or (E_Binary_Operation_X 161 Less_Than (E_Binary_Operation_X 162 Plus (E_Binary_Operation_X 163 Multiply (E_Name_X 164 (E_Identifier_X 165 ((*VI1*) 24) (nil))) (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 167 (Integer_Literal 3) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 168 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Binary_Operation_X 169 And (E_Name_X 170 (E_Identifier_X 171 ((*VBT*) 26) (nil))) (E_Unary_Operation_X 172 Not (E_Binary_Operation_X 173 Less_Than (E_Literal_X 23 (Integer_Literal 1) (nil) nil) (E_Literal_X 175 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil) (nil) nil) (nil) nil)
        (S_Sequence_X 176
        (S_Assignment_X 177 (E_Identifier_X 178 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 179 Plus (E_Name_X 180 (E_Identifier_X 181 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 182 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
        (S_If_X 183 (E_Binary_Operation_X 184 Or (E_Unary_Operation_X 185 Not (E_Literal_X 31 (Boolean_Literal true) (nil) nil) (nil) nil) (E_Binary_Operation_X 187 Equal (E_Binary_Operation_X 188 Plus (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 190 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 191 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
          S_Null_X (* arguments of procedure call are unrecognized ! *)
          (S_Sequence_X 194
          (S_Assignment_X 195 (E_Identifier_X 196 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 197 Plus (E_Name_X 198 (E_Identifier_X 199 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 200 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)) 
          (S_If_X 201 (E_Binary_Operation_X 202 Greater_Than (E_Binary_Operation_X 203 Multiply (E_Name_X 204 (E_Identifier_X 205 ((*VI1*) 24) (nil))) (E_Literal_X 206 (Integer_Literal 2) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 207 (Integer_Literal 0) (nil) nil) (nil) nil)
            (S_Assignment_X 208 (E_Identifier_X 209 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 210 Plus (E_Name_X 211 (E_Identifier_X 212 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 213 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
            (S_If_X 214 (E_Literal_X 215 (Boolean_Literal true) (nil) nil)
              S_Null_X (* arguments of procedure call are unrecognized ! *)
              S_Null_X
            )
          ))
        ))
        (S_If_X 218 (E_Binary_Operation_X 219 And (E_Literal_X 220 (Boolean_Literal false) (nil) nil) (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (nil) nil)
          S_Null_X (* arguments of procedure call are unrecognized ! *)
          (S_If_X 224 (E_Name_X 225 (E_Identifier_X 226 ((*VBT*) 26) (nil)))
            S_Null_X (* arguments of procedure call are unrecognized ! *)
            (S_If_X 229 (E_Binary_Operation_X 230 Equal (E_Name_X 231 (E_Identifier_X 232 ((*VI1*) 24) (nil))) (E_Literal_X 233 (Integer_Literal 0) (nil) nil) (nil) nil)
              S_Null_X (* arguments of procedure call are unrecognized ! *)
              S_Null_X (* arguments of procedure call are unrecognized ! *)
            )
          )
        )
      )
    ) 
    (S_Sequence_X 238
    (S_If_X 239 (E_Binary_Operation_X 240 Or (E_Binary_Operation_X 241 Equal (E_Literal_X 242 (Integer_Literal 3) (nil) nil) (E_Literal_X 243 (Integer_Literal 5) (nil) nil) (nil) nil) (E_Unary_Operation_X 244 Not (E_Name_X 245 (E_Identifier_X 246 ((*VBT*) 26) (nil))) (nil) nil) (nil) nil)
      (S_Sequence_X 247
      S_Null_X (* arguments of procedure call are unrecognized ! *) 
      (S_If_X 250 (E_Binary_Operation_X 251 And (E_Literal_X 252 (Boolean_Literal true) (nil) nil) (E_Literal_X 31 (Boolean_Literal true) (nil) nil) (nil) nil)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
        S_Null_X (* arguments of procedure call are unrecognized ! *)
      ))
      (S_If_X 258 (E_Literal_X 35 (Boolean_Literal false) (nil) nil)
        (S_Sequence_X 260
        (S_If_X 261 (E_Binary_Operation_X 262 Or (E_Binary_Operation_X 263 Greater_Than_Or_Equal (E_Name_X 264 (E_Identifier_X 265 ((*VI9*) 25) (nil))) (E_Literal_X 266 (Integer_Literal 0) (nil) nil) (nil) nil) (E_Literal_X 267 (Boolean_Literal false) (nil) nil) (nil) nil)
          (S_Sequence_X 268
          (S_If_X 269 (E_Name_X 270 (E_Identifier_X 271 ((*VBT*) 26) (nil)))
            S_Null_X (* arguments of procedure call are unrecognized ! *)
            S_Null_X
          ) 
          S_Null_X (* arguments of procedure call are unrecognized ! *))
          (S_If_X 276 (E_Binary_Operation_X 277 Not_Equal (E_Binary_Operation_X 278 Plus (E_Name_X 279 (E_Identifier_X 280 ((*VI1*) 24) (nil))) (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (Do_Overflow_Check :: nil) nil) (E_Literal_X 282 (Integer_Literal 0) (nil) nil) (nil) nil)
            S_Null_X (* arguments of procedure call are unrecognized ! *)
            S_Null_X
          )
        ) 
        S_Null_X (* arguments of procedure call are unrecognized ! *))
        (S_Sequence_X 287
        (S_If_X 288 (E_Binary_Operation_X 289 And (E_Name_X 290 (E_Identifier_X 291 ((*VBT*) 26) (nil))) (E_Binary_Operation_X 292 Equal (E_Binary_Operation_X 293 Minus (E_Literal_X 27 (Integer_Literal 9) (nil) nil) (E_Literal_X 295 (Integer_Literal 9) (nil) nil) (nil) nil) (E_Literal_X 296 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
          (S_Sequence_X 297
          (S_If_X 298 (E_Literal_X 299 (Boolean_Literal false) (nil) nil)
            S_Null_X (* arguments of procedure call are unrecognized ! *)
            (S_If_X 302 (E_Binary_Operation_X 303 And (E_Unary_Operation_X 304 Not (E_Name_X 305 (E_Identifier_X 306 ((*VBF*) 27) (nil))) (nil) nil) (E_Binary_Operation_X 307 Greater_Than (E_Literal_X 23 (Integer_Literal 1) (nil) nil) (E_Literal_X 309 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
              (S_Assignment_X 310 (E_Identifier_X 311 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 312 Plus (E_Name_X 313 (E_Identifier_X 314 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 315 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil))
              S_Null_X (* arguments of procedure call are unrecognized ! *)
            )
          ) 
          (S_Assignment_X 318 (E_Identifier_X 319 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 320 Plus (E_Name_X 321 (E_Identifier_X 322 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 323 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
          (S_If_X 324 (E_Binary_Operation_X 325 Or (E_Unary_Operation_X 326 Not (E_Literal_X 35 (Boolean_Literal false) (nil) nil) (nil) nil) (E_Binary_Operation_X 328 Not_Equal (E_Name_X 329 (E_Identifier_X 330 ((*VI1*) 24) (nil))) (E_Literal_X 331 (Integer_Literal 0) (nil) nil) (nil) nil) (nil) nil)
            (S_Sequence_X 332
            (S_If_X 333 (E_Name_X 334 (E_Identifier_X 335 ((*VBT*) 26) (nil)))
              S_Null_X
              S_Null_X
            ) 
            S_Null_X (* arguments of procedure call are unrecognized ! *))
            S_Null_X (* arguments of procedure call are unrecognized ! *)
          )
        ) 
        (S_Assignment_X 340 (E_Identifier_X 341 ((*FLOW_COUNT*) 28) (nil)) (E_Binary_Operation_X 342 Plus (E_Name_X 343 (E_Identifier_X 344 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 345 (Integer_Literal 1) (nil) nil) (Do_Overflow_Check :: nil) nil)))
      )
    ) 
    (S_Sequence_X 346
    (S_If_X 347 (E_Binary_Operation_X 348 Not_Equal (E_Name_X 349 (E_Identifier_X 350 ((*FLOW_COUNT*) 28) (nil))) (E_Literal_X 351 (Integer_Literal 9) (nil) nil) (nil) nil)
      S_Null_X (* arguments of procedure call are unrecognized ! *)
      S_Null_X
    ) 
    (S_Procedure_Call_X 354 355 ((*RESULT*) 7) 
      (nil)
    )))))))
))) :: (((*COMMENT*) 6), (0, (mkprocedure_body_x 0 0 nil D_Null_Declaration_X S_Null_X))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*FILE_NUM*) 1), (Subtype_Declaration_X 4 ((*FILE_NUM*) 1) Integer (Range_X 1 5))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((137, Boolean) :: (146, Boolean) :: (101, Integer) :: (173, Boolean) :: (200, Integer) :: (182, Integer) :: (209, Integer) :: (191, Integer) :: (83, Boolean) :: (164, Integer) :: (245, Boolean) :: (110, Boolean) :: (119, Integer) :: (23, Integer) :: (104, Boolean) :: (122, Boolean) :: (86, Integer) :: (185, Boolean) :: (167, Integer) :: (68, Integer) :: (140, Integer) :: (113, Boolean) :: (62, Boolean) :: (134, Boolean) :: (35, Boolean) :: (349, Integer) :: (125, Integer) :: (304, Boolean) :: (331, Integer) :: (80, Integer) :: (89, Integer) :: (295, Integer) :: (116, Integer) :: (98, Boolean) :: (107, Integer) :: (313, Integer) :: (322, Integer) :: (307, Boolean) :: (74, Integer) :: (262, Boolean) :: (343, Integer) :: (47, Boolean) :: (244, Boolean) :: (226, Boolean) :: (253, Boolean) :: (325, Boolean) :: (334, Boolean) :: (289, Boolean) :: (271, Boolean) :: (280, Integer) :: (319, Integer) :: (184, Boolean) :: (265, Integer) :: (175, Integer) :: (211, Integer) :: (292, Boolean) :: (166, Integer) :: (328, Boolean) :: (220, Boolean) :: (202, Boolean) :: (277, Boolean) :: (151, Boolean) :: (232, Integer) :: (259, Boolean) :: (124, Boolean) :: (133, Boolean) :: (106, Integer) :: (205, Integer) :: (160, Boolean) :: (169, Boolean) :: (178, Integer) :: (115, Integer) :: (187, Boolean) :: (196, Integer) :: (241, Boolean) :: (181, Integer) :: (163, Integer) :: (172, Boolean) :: (118, Integer) :: (127, Integer) :: (136, Boolean) :: (199, Integer) :: (100, Integer) :: (82, Integer) :: (109, Integer) :: (190, Integer) :: (73, Integer) :: (145, Boolean) :: (154, Integer) :: (85, Integer) :: (67, Boolean) :: (139, Boolean) :: (345, Integer) :: (121, Boolean) :: (31, Boolean) :: (76, Integer) :: (103, Boolean) :: (112, Boolean) :: (309, Integer) :: (327, Boolean) :: (97, Boolean) :: (348, Boolean) :: (312, Integer) :: (79, Boolean) :: (88, Integer) :: (294, Integer) :: (303, Boolean) :: (43, Integer) :: (267, Boolean) :: (330, Integer) :: (240, Boolean) :: (321, Integer) :: (189, Integer) :: (225, Boolean) :: (306, Boolean) :: (180, Integer) :: (342, Integer) :: (207, Integer) :: (198, Integer) :: (270, Boolean) :: (252, Boolean) :: (279, Integer) :: (351, Integer) :: (243, Integer) :: (315, Integer) :: (282, Integer) :: (174, Integer) :: (147, Boolean) :: (264, Integer) :: (138, Boolean) :: (210, Integer) :: (219, Boolean) :: (291, Boolean) :: (165, Integer) :: (246, Boolean) :: (186, Boolean) :: (213, Integer) :: (87, Integer) :: (96, Boolean) :: (168, Integer) :: (132, Boolean) :: (141, Integer) :: (105, Integer) :: (123, Boolean) :: (204, Integer) :: (78, Boolean) :: (69, Integer) :: (231, Integer) :: (63, Boolean) :: (99, Integer) :: (54, Integer) :: (341, Integer) :: (171, Boolean) :: (72, Integer) :: (144, Boolean) :: (81, Integer) :: (153, Integer) :: (126, Integer) :: (162, Integer) :: (27, Integer) :: (135, Boolean) :: (108, Integer) :: (117, Integer) :: (350, Integer) :: (323, Integer) :: (263, Boolean) :: (344, Integer) :: (299, Boolean) :: (326, Boolean) :: (335, Boolean) :: (308, Integer) :: (75, Integer) :: (281, Integer) :: (290, Boolean) :: (39, Integer) :: (111, Boolean) :: (230, Boolean) :: (51, Boolean) :: (221, Boolean) :: (320, Integer) :: (329, Integer) :: (203, Integer) :: (212, Integer) :: (311, Integer) :: (293, Integer) :: (266, Integer) :: (314, Integer) :: (179, Integer) :: (152, Integer) :: (188, Integer) :: (170, Boolean) :: (215, Boolean) :: (161, Boolean) :: (242, Integer) :: (251, Boolean) :: (197, Integer) :: (206, Integer) :: (233, Integer) :: (296, Integer) :: (278, Integer) :: (305, Boolean) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((137, (sloc (*Line*)74 (*Col*)30 (*EndLine*)74 (*EndCol*)32)) :: (146, (sloc (*Line*)75 (*Col*)23 (*EndLine*)75 (*EndCol*)30)) :: (101, (sloc (*Line*)66 (*Col*)27 (*EndLine*)66 (*EndCol*)27)) :: (173, (sloc (*Line*)82 (*Col*)49 (*EndLine*)82 (*EndCol*)55)) :: (200, (sloc (*Line*)86 (*Col*)43 (*EndLine*)86 (*EndCol*)43)) :: (182, (sloc (*Line*)83 (*Col*)38 (*EndLine*)83 (*EndCol*)38)) :: (209, (sloc (*Line*)88 (*Col*)21 (*EndLine*)88 (*EndCol*)30)) :: (191, (sloc (*Line*)84 (*Col*)40 (*EndLine*)84 (*EndCol*)40)) :: (83, (sloc (*Line*)59 (*Col*)27 (*EndLine*)59 (*EndCol*)30)) :: (164, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)15)) :: (245, (sloc (*Line*)104 (*Col*)22 (*EndLine*)104 (*EndCol*)24)) :: (110, (sloc (*Line*)67 (*Col*)32 (*EndLine*)67 (*EndCol*)42)) :: (119, (sloc (*Line*)68 (*Col*)43 (*EndLine*)68 (*EndCol*)43)) :: (23, (sloc (*Line*)35 (*Col*)32 (*EndLine*)35 (*EndCol*)32)) :: (104, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)26)) :: (122, (sloc (*Line*)70 (*Col*)12 (*EndLine*)70 (*EndCol*)14)) :: (86, (sloc (*Line*)60 (*Col*)30 (*EndLine*)60 (*EndCol*)43)) :: (185, (sloc (*Line*)84 (*Col*)14 (*EndLine*)84 (*EndCol*)20)) :: (167, (sloc (*Line*)82 (*Col*)25 (*EndLine*)82 (*EndCol*)25)) :: (68, (sloc (*Line*)57 (*Col*)12 (*EndLine*)57 (*EndCol*)14)) :: (140, (sloc (*Line*)74 (*Col*)43 (*EndLine*)74 (*EndCol*)45)) :: (113, (sloc (*Line*)67 (*Col*)40 (*EndLine*)67 (*EndCol*)42)) :: (62, (sloc (*Line*)55 (*Col*)9 (*EndLine*)55 (*EndCol*)11)) :: (134, (sloc (*Line*)74 (*Col*)9 (*EndLine*)74 (*EndCol*)15)) :: (35, (sloc (*Line*)38 (*Col*)32 (*EndLine*)38 (*EndCol*)36)) :: (349, (sloc (*Line*)138 (*Col*)9 (*EndLine*)138 (*EndCol*)18)) :: (125, (sloc (*Line*)70 (*Col*)19 (*EndLine*)70 (*EndCol*)21)) :: (304, (sloc (*Line*)123 (*Col*)22 (*EndLine*)123 (*EndCol*)28)) :: (331, (sloc (*Line*)128 (*Col*)35 (*EndLine*)128 (*EndCol*)35)) :: (80, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)16)) :: (89, (sloc (*Line*)60 (*Col*)43 (*EndLine*)60 (*EndCol*)43)) :: (295, (sloc (*Line*)120 (*Col*)28 (*EndLine*)120 (*EndCol*)28)) :: (116, (sloc (*Line*)68 (*Col*)30 (*EndLine*)68 (*EndCol*)43)) :: (98, (sloc (*Line*)66 (*Col*)21 (*EndLine*)66 (*EndCol*)27)) :: (107, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)16)) :: (313, (sloc (*Line*)124 (*Col*)35 (*EndLine*)124 (*EndCol*)44)) :: (322, (sloc (*Line*)127 (*Col*)30 (*EndLine*)127 (*EndCol*)39)) :: (307, (sloc (*Line*)123 (*Col*)39 (*EndLine*)123 (*EndCol*)45)) :: (74, (sloc (*Line*)58 (*Col*)25 (*EndLine*)58 (*EndCol*)34)) :: (262, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)30)) :: (343, (sloc (*Line*)135 (*Col*)25 (*EndLine*)135 (*EndCol*)34)) :: (47, (sloc (*Line*)47 (*Col*)23 (*EndLine*)47 (*EndCol*)26)) :: (244, (sloc (*Line*)104 (*Col*)18 (*EndLine*)104 (*EndCol*)24)) :: (226, (sloc (*Line*)96 (*Col*)14 (*EndLine*)96 (*EndCol*)16)) :: (253, (sloc (*Line*)106 (*Col*)23 (*EndLine*)106 (*EndCol*)25)) :: (325, (sloc (*Line*)128 (*Col*)17 (*EndLine*)128 (*EndCol*)35)) :: (334, (sloc (*Line*)129 (*Col*)19 (*EndLine*)129 (*EndCol*)21)) :: (289, (sloc (*Line*)120 (*Col*)14 (*EndLine*)120 (*EndCol*)32)) :: (271, (sloc (*Line*)112 (*Col*)19 (*EndLine*)112 (*EndCol*)21)) :: (280, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)19)) :: (319, (sloc (*Line*)127 (*Col*)16 (*EndLine*)127 (*EndCol*)25)) :: (184, (sloc (*Line*)84 (*Col*)14 (*EndLine*)84 (*EndCol*)40)) :: (265, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)16)) :: (175, (sloc (*Line*)82 (*Col*)55 (*EndLine*)82 (*EndCol*)55)) :: (211, (sloc (*Line*)88 (*Col*)35 (*EndLine*)88 (*EndCol*)44)) :: (292, (sloc (*Line*)120 (*Col*)22 (*EndLine*)120 (*EndCol*)32)) :: (166, (sloc (*Line*)82 (*Col*)19 (*EndLine*)82 (*EndCol*)21)) :: (328, (sloc (*Line*)128 (*Col*)28 (*EndLine*)128 (*EndCol*)35)) :: (220, (sloc (*Line*)94 (*Col*)12 (*EndLine*)94 (*EndCol*)16)) :: (202, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)29)) :: (277, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)30)) :: (151, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)24)) :: (232, (sloc (*Line*)98 (*Col*)17 (*EndLine*)98 (*EndCol*)19)) :: (259, (sloc (*Line*)110 (*Col*)12 (*EndLine*)110 (*EndCol*)14)) :: (124, (sloc (*Line*)70 (*Col*)19 (*EndLine*)70 (*EndCol*)26)) :: (133, (sloc (*Line*)74 (*Col*)9 (*EndLine*)74 (*EndCol*)32)) :: (106, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)16)) :: (205, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)21)) :: (160, (sloc (*Line*)82 (*Col*)12 (*EndLine*)82 (*EndCol*)57)) :: (169, (sloc (*Line*)82 (*Col*)36 (*EndLine*)82 (*EndCol*)56)) :: (178, (sloc (*Line*)83 (*Col*)11 (*EndLine*)83 (*EndCol*)20)) :: (115, (sloc (*Line*)68 (*Col*)16 (*EndLine*)68 (*EndCol*)25)) :: (187, (sloc (*Line*)84 (*Col*)30 (*EndLine*)84 (*EndCol*)40)) :: (196, (sloc (*Line*)86 (*Col*)16 (*EndLine*)86 (*EndCol*)25)) :: (241, (sloc (*Line*)104 (*Col*)9 (*EndLine*)104 (*EndCol*)13)) :: (181, (sloc (*Line*)83 (*Col*)25 (*EndLine*)83 (*EndCol*)34)) :: (163, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)21)) :: (172, (sloc (*Line*)82 (*Col*)44 (*EndLine*)82 (*EndCol*)56)) :: (118, (sloc (*Line*)68 (*Col*)30 (*EndLine*)68 (*EndCol*)39)) :: (127, (sloc (*Line*)70 (*Col*)25 (*EndLine*)70 (*EndCol*)26)) :: (136, (sloc (*Line*)74 (*Col*)26 (*EndLine*)74 (*EndCol*)32)) :: (199, (sloc (*Line*)86 (*Col*)30 (*EndLine*)86 (*EndCol*)39)) :: (100, (sloc (*Line*)66 (*Col*)21 (*EndLine*)66 (*EndCol*)23)) :: (82, (sloc (*Line*)59 (*Col*)21 (*EndLine*)59 (*EndCol*)21)) :: (109, (sloc (*Line*)67 (*Col*)26 (*EndLine*)67 (*EndCol*)26)) :: (190, (sloc (*Line*)84 (*Col*)36 (*EndLine*)84 (*EndCol*)36)) :: (73, (sloc (*Line*)58 (*Col*)25 (*EndLine*)58 (*EndCol*)38)) :: (145, (sloc (*Line*)75 (*Col*)14 (*EndLine*)75 (*EndCol*)18)) :: (154, (sloc (*Line*)77 (*Col*)24 (*EndLine*)77 (*EndCol*)24)) :: (85, (sloc (*Line*)60 (*Col*)16 (*EndLine*)60 (*EndCol*)25)) :: (67, (sloc (*Line*)57 (*Col*)12 (*EndLine*)57 (*EndCol*)19)) :: (139, (sloc (*Line*)74 (*Col*)43 (*EndLine*)74 (*EndCol*)49)) :: (345, (sloc (*Line*)135 (*Col*)38 (*EndLine*)135 (*EndCol*)38)) :: (121, (sloc (*Line*)70 (*Col*)12 (*EndLine*)70 (*EndCol*)26)) :: (31, (sloc (*Line*)37 (*Col*)32 (*EndLine*)37 (*EndCol*)35)) :: (76, (sloc (*Line*)58 (*Col*)38 (*EndLine*)58 (*EndCol*)38)) :: (103, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)43)) :: (112, (sloc (*Line*)67 (*Col*)40 (*EndLine*)67 (*EndCol*)42)) :: (309, (sloc (*Line*)123 (*Col*)45 (*EndLine*)123 (*EndCol*)45)) :: (327, (sloc (*Line*)128 (*Col*)21 (*EndLine*)128 (*EndCol*)23)) :: (97, (sloc (*Line*)66 (*Col*)9 (*EndLine*)66 (*EndCol*)11)) :: (348, (sloc (*Line*)138 (*Col*)9 (*EndLine*)138 (*EndCol*)23)) :: (312, (sloc (*Line*)124 (*Col*)35 (*EndLine*)124 (*EndCol*)48)) :: (79, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)21)) :: (88, (sloc (*Line*)60 (*Col*)30 (*EndLine*)60 (*EndCol*)39)) :: (294, (sloc (*Line*)120 (*Col*)22 (*EndLine*)120 (*EndCol*)24)) :: (303, (sloc (*Line*)123 (*Col*)22 (*EndLine*)123 (*EndCol*)45)) :: (43, (sloc (*Line*)46 (*Col*)23 (*EndLine*)46 (*EndCol*)23)) :: (267, (sloc (*Line*)111 (*Col*)26 (*EndLine*)111 (*EndCol*)30)) :: (330, (sloc (*Line*)128 (*Col*)28 (*EndLine*)128 (*EndCol*)30)) :: (240, (sloc (*Line*)104 (*Col*)9 (*EndLine*)104 (*EndCol*)24)) :: (321, (sloc (*Line*)127 (*Col*)30 (*EndLine*)127 (*EndCol*)39)) :: (189, (sloc (*Line*)84 (*Col*)30 (*EndLine*)84 (*EndCol*)32)) :: (225, (sloc (*Line*)96 (*Col*)14 (*EndLine*)96 (*EndCol*)16)) :: (306, (sloc (*Line*)123 (*Col*)26 (*EndLine*)123 (*EndCol*)28)) :: (180, (sloc (*Line*)83 (*Col*)25 (*EndLine*)83 (*EndCol*)34)) :: (342, (sloc (*Line*)135 (*Col*)25 (*EndLine*)135 (*EndCol*)38)) :: (207, (sloc (*Line*)87 (*Col*)29 (*EndLine*)87 (*EndCol*)29)) :: (198, (sloc (*Line*)86 (*Col*)30 (*EndLine*)86 (*EndCol*)39)) :: (270, (sloc (*Line*)112 (*Col*)19 (*EndLine*)112 (*EndCol*)21)) :: (252, (sloc (*Line*)106 (*Col*)14 (*EndLine*)106 (*EndCol*)17)) :: (279, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)19)) :: (351, (sloc (*Line*)138 (*Col*)23 (*EndLine*)138 (*EndCol*)23)) :: (243, (sloc (*Line*)104 (*Col*)13 (*EndLine*)104 (*EndCol*)13)) :: (315, (sloc (*Line*)124 (*Col*)48 (*EndLine*)124 (*EndCol*)48)) :: (282, (sloc (*Line*)116 (*Col*)30 (*EndLine*)116 (*EndCol*)30)) :: (174, (sloc (*Line*)82 (*Col*)49 (*EndLine*)82 (*EndCol*)51)) :: (147, (sloc (*Line*)75 (*Col*)27 (*EndLine*)75 (*EndCol*)30)) :: (264, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)16)) :: (138, (sloc (*Line*)74 (*Col*)30 (*EndLine*)74 (*EndCol*)32)) :: (210, (sloc (*Line*)88 (*Col*)35 (*EndLine*)88 (*EndCol*)48)) :: (219, (sloc (*Line*)94 (*Col*)12 (*EndLine*)94 (*EndCol*)24)) :: (291, (sloc (*Line*)120 (*Col*)14 (*EndLine*)120 (*EndCol*)16)) :: (165, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)15)) :: (246, (sloc (*Line*)104 (*Col*)22 (*EndLine*)104 (*EndCol*)24)) :: (186, (sloc (*Line*)84 (*Col*)18 (*EndLine*)84 (*EndCol*)20)) :: (213, (sloc (*Line*)88 (*Col*)48 (*EndLine*)88 (*EndCol*)48)) :: (87, (sloc (*Line*)60 (*Col*)30 (*EndLine*)60 (*EndCol*)39)) :: (96, (sloc (*Line*)66 (*Col*)9 (*EndLine*)66 (*EndCol*)27)) :: (168, (sloc (*Line*)82 (*Col*)29 (*EndLine*)82 (*EndCol*)29)) :: (132, (sloc (*Line*)74 (*Col*)9 (*EndLine*)74 (*EndCol*)49)) :: (141, (sloc (*Line*)74 (*Col*)49 (*EndLine*)74 (*EndCol*)49)) :: (105, (sloc (*Line*)67 (*Col*)14 (*EndLine*)67 (*EndCol*)22)) :: (123, (sloc (*Line*)70 (*Col*)12 (*EndLine*)70 (*EndCol*)14)) :: (204, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)21)) :: (78, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)30)) :: (69, (sloc (*Line*)57 (*Col*)18 (*EndLine*)57 (*EndCol*)19)) :: (231, (sloc (*Line*)98 (*Col*)17 (*EndLine*)98 (*EndCol*)19)) :: (63, (sloc (*Line*)55 (*Col*)9 (*EndLine*)55 (*EndCol*)11)) :: (99, (sloc (*Line*)66 (*Col*)21 (*EndLine*)66 (*EndCol*)23)) :: (54, (sloc (*Line*)50 (*Col*)30 (*EndLine*)50 (*EndCol*)30)) :: (341, (sloc (*Line*)135 (*Col*)11 (*EndLine*)135 (*EndCol*)20)) :: (171, (sloc (*Line*)82 (*Col*)36 (*EndLine*)82 (*EndCol*)38)) :: (72, (sloc (*Line*)58 (*Col*)11 (*EndLine*)58 (*EndCol*)20)) :: (144, (sloc (*Line*)75 (*Col*)14 (*EndLine*)75 (*EndCol*)30)) :: (81, (sloc (*Line*)59 (*Col*)14 (*EndLine*)59 (*EndCol*)16)) :: (153, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)19)) :: (126, (sloc (*Line*)70 (*Col*)19 (*EndLine*)70 (*EndCol*)21)) :: (162, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)25)) :: (27, (sloc (*Line*)36 (*Col*)32 (*EndLine*)36 (*EndCol*)32)) :: (135, (sloc (*Line*)74 (*Col*)13 (*EndLine*)74 (*EndCol*)15)) :: (108, (sloc (*Line*)67 (*Col*)20 (*EndLine*)67 (*EndCol*)22)) :: (117, (sloc (*Line*)68 (*Col*)30 (*EndLine*)68 (*EndCol*)39)) :: (350, (sloc (*Line*)138 (*Col*)9 (*EndLine*)138 (*EndCol*)18)) :: (323, (sloc (*Line*)127 (*Col*)43 (*EndLine*)127 (*EndCol*)43)) :: (263, (sloc (*Line*)111 (*Col*)14 (*EndLine*)111 (*EndCol*)21)) :: (344, (sloc (*Line*)135 (*Col*)25 (*EndLine*)135 (*EndCol*)34)) :: (299, (sloc (*Line*)121 (*Col*)19 (*EndLine*)121 (*EndCol*)23)) :: (326, (sloc (*Line*)128 (*Col*)17 (*EndLine*)128 (*EndCol*)23)) :: (335, (sloc (*Line*)129 (*Col*)19 (*EndLine*)129 (*EndCol*)21)) :: (308, (sloc (*Line*)123 (*Col*)39 (*EndLine*)123 (*EndCol*)41)) :: (75, (sloc (*Line*)58 (*Col*)25 (*EndLine*)58 (*EndCol*)34)) :: (281, (sloc (*Line*)116 (*Col*)23 (*EndLine*)116 (*EndCol*)25)) :: (290, (sloc (*Line*)120 (*Col*)14 (*EndLine*)120 (*EndCol*)16)) :: (39, (sloc (*Line*)45 (*Col*)23 (*EndLine*)45 (*EndCol*)23)) :: (111, (sloc (*Line*)67 (*Col*)32 (*EndLine*)67 (*EndCol*)34)) :: (230, (sloc (*Line*)98 (*Col*)17 (*EndLine*)98 (*EndCol*)23)) :: (51, (sloc (*Line*)48 (*Col*)23 (*EndLine*)48 (*EndCol*)27)) :: (221, (sloc (*Line*)94 (*Col*)22 (*EndLine*)94 (*EndCol*)24)) :: (320, (sloc (*Line*)127 (*Col*)30 (*EndLine*)127 (*EndCol*)43)) :: (329, (sloc (*Line*)128 (*Col*)28 (*EndLine*)128 (*EndCol*)30)) :: (203, (sloc (*Line*)87 (*Col*)19 (*EndLine*)87 (*EndCol*)25)) :: (212, (sloc (*Line*)88 (*Col*)35 (*EndLine*)88 (*EndCol*)44)) :: (311, (sloc (*Line*)124 (*Col*)21 (*EndLine*)124 (*EndCol*)30)) :: (293, (sloc (*Line*)120 (*Col*)22 (*EndLine*)120 (*EndCol*)28)) :: (266, (sloc (*Line*)111 (*Col*)21 (*EndLine*)111 (*EndCol*)21)) :: (314, (sloc (*Line*)124 (*Col*)35 (*EndLine*)124 (*EndCol*)44)) :: (179, (sloc (*Line*)83 (*Col*)25 (*EndLine*)83 (*EndCol*)38)) :: (152, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)19)) :: (188, (sloc (*Line*)84 (*Col*)30 (*EndLine*)84 (*EndCol*)36)) :: (170, (sloc (*Line*)82 (*Col*)36 (*EndLine*)82 (*EndCol*)38)) :: (215, (sloc (*Line*)89 (*Col*)22 (*EndLine*)89 (*EndCol*)25)) :: (161, (sloc (*Line*)82 (*Col*)13 (*EndLine*)82 (*EndCol*)29)) :: (242, (sloc (*Line*)104 (*Col*)9 (*EndLine*)104 (*EndCol*)9)) :: (251, (sloc (*Line*)106 (*Col*)14 (*EndLine*)106 (*EndCol*)25)) :: (197, (sloc (*Line*)86 (*Col*)30 (*EndLine*)86 (*EndCol*)43)) :: (206, (sloc (*Line*)87 (*Col*)25 (*EndLine*)87 (*EndCol*)25)) :: (233, (sloc (*Line*)98 (*Col*)23 (*EndLine*)98 (*EndCol*)23)) :: (296, (sloc (*Line*)120 (*Col*)32 (*EndLine*)120 (*EndCol*)32)) :: (278, (sloc (*Line*)116 (*Col*)17 (*EndLine*)116 (*EndCol*)25)) :: (305, (sloc (*Line*)123 (*Col*)26 (*EndLine*)123 (*EndCol*)28)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((23, ("CBF", "ada://constant/ACATS_C53007A+31:11/CBF+38:6")) :: (26, ("VBT", "ada://variable/ACATS_C53007A+31:11/VBT+47:6")) :: (20, ("CI9", "ada://constant/ACATS_C53007A+31:11/CI9+36:6")) :: (22, ("CBT", "ada://constant/ACATS_C53007A+31:11/CBT+37:6")) :: (25, ("VI9", "ada://variable/ACATS_C53007A+31:11/VI9+46:6")) :: (28, ("FLOW_COUNT", "ada://variable/ACATS_C53007A+31:11/FLOW_COUNT+50:6")) :: (19, ("CI1", "ada://constant/ACATS_C53007A+31:11/CI1+35:6")) :: (27, ("VBF", "ada://variable/ACATS_C53007A+31:11/VBF+48:6")) :: (24, ("VI1", "ada://variable/ACATS_C53007A+31:11/VI1+45:6")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((17, ("ACATS_C53007A", "ada://procedure_body/ACATS_C53007A+31:11")) :: (8, ("IDENT_INT", "ada://expression_function/ACATS_REPORT-47:9/IDENT_INT-112:15")) :: (11, ("IDENT_BOOL", "ada://expression_function/ACATS_REPORT-47:9/IDENT_BOOL-129:15")) :: (2, ("TEST", "ada://procedure/ACATS_REPORT-47:9/TEST-53:16")) :: (5, ("SPECIAL_ACTION", "ada://procedure/ACATS_REPORT-47:9/SPECIAL_ACTION-85:16")) :: (14, ("EQUAL", "ada://expression_function/ACATS_REPORT-47:9/EQUAL-144:15")) :: (4, ("NOT_APPLICABLE", "ada://procedure/ACATS_REPORT-47:9/NOT_APPLICABLE-75:16")) :: (13, ("IDENT_WIDE_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_STR-139:15")) :: (16, ("TIME_STAMP", "ada://function/ACATS_REPORT-47:9/TIME_STAMP-159:15")) :: (7, ("RESULT", "ada://procedure/ACATS_REPORT-47:9/RESULT-99:16")) :: (10, ("IDENT_WIDE_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_WIDE_CHAR-123:15")) :: (9, ("IDENT_CHAR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_CHAR-117:15")) :: (3, ("FAILED", "ada://procedure/ACATS_REPORT-47:9/FAILED-65:16")) :: (12, ("IDENT_STR", "ada://expression_function/ACATS_REPORT-47:9/IDENT_STR-134:15")) :: (15, ("LEGAL_FILE_NAME", "ada://function/ACATS_REPORT-47:9/LEGAL_FILE_NAME-152:15")) :: (6, ("COMMENT", "ada://procedure/ACATS_REPORT-47:9/COMMENT-94:16")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  (nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((1, ("FILE_NUM", "ada://subtype/ACATS_REPORT-47:9/FILE_NUM-49:14")) :: nil)
))
).

