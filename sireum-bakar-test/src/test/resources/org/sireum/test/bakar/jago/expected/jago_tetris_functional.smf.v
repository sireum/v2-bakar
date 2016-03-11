Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 
(D_Seq_Declaration 1
(D_Seq_Declaration 2
(D_Type_Declaration 3 (Derived_Type_Declaration 4 ((*Cell*) 1) Integer (Range 0 8))) 
(D_Seq_Declaration 5
(D_Type_Declaration 6 (Subtype_Declaration 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (Range 1 8))) 
(D_Seq_Declaration 8
(D_Type_Declaration 9 (Subtype_Declaration 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (Range 3 8))) 
(D_Seq_Declaration 11
(D_Type_Declaration 12 (Subtype_Declaration 13 ((*X_Coord*) 4) Integer (Range 1 10))) 
(D_Seq_Declaration 14
(D_Type_Declaration 15 (Subtype_Declaration 16 ((*Y_Coord*) 5) Integer (Range 1 50))) 
(D_Seq_Declaration 17
(D_Type_Declaration 18 (Array_Type_Declaration 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) 
(D_Seq_Declaration 20
(D_Type_Declaration 21 (Array_Type_Declaration 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) 
(D_Seq_Declaration 23
(D_Object_Declaration 24 (mkobject_declaration 25 ((*Cur_Board*) 8) (Array_Type ((*Board*) 7)) None)) 
(D_Seq_Declaration 26
(D_Type_Declaration 27 (Subtype_Declaration 28 ((*PX_Coord*) 9) Integer (Range (-1) 9))) 
(D_Seq_Declaration 29
(D_Type_Declaration 30 (Subtype_Declaration 31 ((*PY_Coord*) 10) Integer (Range (-1) 49))) 
(D_Seq_Declaration 32
(D_Type_Declaration 33 (Derived_Type_Declaration 34 ((*Direction*) 11) Integer (Range 0 3))) 
(D_Seq_Declaration 35
(D_Type_Declaration 36 (Record_Type_Declaration 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) 
(D_Seq_Declaration 39
(D_Object_Declaration 40 (mkobject_declaration 41 ((*Cur_Piece*) 17) (Record_Type ((*Piece*) 12)) None)) 
(D_Seq_Declaration 42
(D_Type_Declaration 43 (Derived_Type_Declaration 44 ((*State*) 18) Integer (Range 0 3))) 
(D_Seq_Declaration 45
(D_Object_Declaration 46 (mkobject_declaration 47 ((*Cur_State*) 19) (Derived_Type ((*State*) 18)) None)) 
(D_Seq_Declaration 48
(D_Type_Declaration 49 (Subtype_Declaration 50 ((*I_Delta*) 20) Integer (Range 0 3))) 
(D_Seq_Declaration 51
(D_Type_Declaration 52 (Array_Type_Declaration 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) 
(D_Seq_Declaration 54
(D_Type_Declaration 55 (Subtype_Declaration 56 ((*Three_Delta*) 22) Integer (Range 0 2))) 
(D_Seq_Declaration 57
(D_Type_Declaration 58 (Array_Type_Declaration 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) 
(D_Seq_Declaration 60
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 61
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 62
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 63
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 64
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 65
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 66
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 67
(D_Type_Declaration 68 (Derived_Type_Declaration 69 ((*Action*) 31) Integer (Range 0 4))) 
(D_Seq_Declaration 70
(D_Type_Declaration 71 (Subtype_Declaration 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (Range 0 1))) 
(D_Seq_Declaration 73
(D_Type_Declaration 74 (Subtype_Declaration 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (Range 3 4))) 
(D_Seq_Declaration 76
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 77
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 78
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 79
D_Null_Declaration (* Undefined Declarations ! *) 
(D_Seq_Declaration 80
D_Null_Declaration (* Undefined Declarations ! *) 
D_Null_Declaration (* Undefined Declarations ! *))))))))))))))))))))))))))))))))))) 
(D_Seq_Declaration 81
(D_Procedure_Body 82 
  (mkprocedure_body 83
    (* = = = Procedure Name = = = *)
    ((*Is_Empty*) 26)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
    (mkparameter_specification 85 ((*Y*) 42) Integer In) :: 
    (mkparameter_specification 86 ((*X*) 43) Integer In) :: 
    (mkparameter_specification 87 ((*R*) 44) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 88 (E_Identifier 89 ((*R*) 44) ) (E_Literal 90 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 91
(D_Procedure_Body 92 
  (mkprocedure_body 93
    (* = = = Procedure Name = = = *)
    ((*Is_Complete_Line*) 27)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
    (mkparameter_specification 95 ((*R*) 47) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 96 (E_Identifier 97 ((*R*) 47) ) (E_Literal 98 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 99
(D_Procedure_Body 100 
  (mkprocedure_body 101
    (* = = = Procedure Name = = = *)
    ((*Is_Empty_Line*) 28)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
    (mkparameter_specification 103 ((*R*) 49) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 104 (E_Identifier 105 ((*R*) 49) ) (E_Literal 106 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 107
(D_Procedure_Body 108 
  (mkprocedure_body 109
    (* = = = Procedure Name = = = *)
    ((*No_Complete_Lines*) 29)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
    (mkparameter_specification 111 ((*R*) 51) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 112 (E_Identifier 113 ((*R*) 51) ) (E_Literal 114 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 115
(D_Procedure_Body 116 
  (mkprocedure_body 117
    (* = = = Procedure Name = = = *)
    ((*Possible_I_Shapes*) 24)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparameter_specification 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification 121 ((*R*) 55) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 122 (E_Identifier 123 ((*R*) 55) ) (E_Literal 124 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 125
(D_Procedure_Body 126 
  (mkprocedure_body 127
    (* = = = Procedure Name = = = *)
    ((*Possible_Three_Shapes*) 25)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
    (mkparameter_specification 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparameter_specification 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification 132 ((*R*) 60) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 133 (E_Identifier 134 ((*R*) 60) ) (E_Literal 135 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 136
(D_Procedure_Body 137 
  (mkprocedure_body 138
    (* = = = Procedure Name = = = *)
    ((*Include_Piece_In_Board*) 38)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 139
  (D_Object_Declaration 141 (mkobject_declaration 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal 140 (Integer_Literal 0) ))))) 
  (D_Seq_Declaration 143
  (D_Object_Declaration 145 (mkobject_declaration 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal 144 (Integer_Literal 0) ))))) 
  (D_Object_Declaration 147 (mkobject_declaration 148 ((*R*) 64) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 149
      (S_If 150 (E_Binary_Operation 151 Equal (E_Name 152 (E_Selected_Component 153 (E_Identifier 154 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (E_Literal 156 (Integer_Literal 2) ) )
        (S_Sequence 157
        (S_Assignment 158 (E_Indexed_Component 159 (E_Indexed_Component 160 (E_Identifier 161 ((*Cur_Board*) 8) ) (E_Name 162 (E_Selected_Component 163 (E_Identifier 164 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (E_Name 166 (E_Selected_Component 167 (E_Identifier 168 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (E_Name 170 (E_Selected_Component 171 (E_Identifier 172 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
        (S_Sequence 174
        (S_Assignment 175 (E_Indexed_Component 176 (E_Indexed_Component 177 (E_Identifier 178 ((*Cur_Board*) 8) ) (E_Binary_Operation 179 Plus (E_Name 180 (E_Selected_Component 181 (E_Identifier 182 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Literal 184 (Integer_Literal 1) ) ) ) (E_Name 185 (E_Selected_Component 186 (E_Identifier 187 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (E_Name 189 (E_Selected_Component 190 (E_Identifier 191 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
        (S_Sequence 193
        (S_Assignment 194 (E_Indexed_Component 195 (E_Indexed_Component 196 (E_Identifier 197 ((*Cur_Board*) 8) ) (E_Name 198 (E_Selected_Component 199 (E_Identifier 200 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (E_Binary_Operation 202 Plus (E_Name 203 (E_Selected_Component 204 (E_Identifier 205 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Literal 207 (Integer_Literal 1) ) ) ) (E_Name 208 (E_Selected_Component 209 (E_Identifier 210 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
        (S_Assignment 212 (E_Indexed_Component 213 (E_Indexed_Component 214 (E_Identifier 215 ((*Cur_Board*) 8) ) (E_Binary_Operation 216 Plus (E_Name 217 (E_Selected_Component 218 (E_Identifier 219 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Literal 221 (Integer_Literal 1) ) ) ) (E_Binary_Operation 222 Plus (E_Name 223 (E_Selected_Component 224 (E_Identifier 225 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Literal 227 (Integer_Literal 1) ) ) ) (E_Name 228 (E_Selected_Component 229 (E_Identifier 230 ((*Cur_Piece*) 17) ) ((*S*) 13) ))))))
        (S_If 232 (E_Binary_Operation 233 Equal (E_Name 234 (E_Selected_Component 235 (E_Identifier 236 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (E_Literal 238 (Integer_Literal 1) ) )
          (S_While_Loop 239 (E_Binary_Operation 240 Less_Than_Or_Equal (E_Name 241 (E_Identifier 242 ((*Y*) 62) )) (E_Literal 243 (Integer_Literal 3) ) )
            (S_Sequence 244
            (S_While_Loop 245 (E_Binary_Operation 246 Less_Than_Or_Equal (E_Name 247 (E_Identifier 248 ((*X*) 63) )) (E_Literal 249 (Integer_Literal 3) ) )
              (S_Sequence 250
              (S_Procedure_Call 251 252 ((*Possible_I_Shapes*) 24) 
                ((E_Name 253 (E_Selected_Component 254 (E_Identifier 255 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (E_Name 257 (E_Identifier 258 ((*Y*) 62) )) :: (E_Name 259 (E_Identifier 260 ((*X*) 63) )) :: (E_Name 261 (E_Identifier 262 ((*R*) 64) )) :: nil)
              ) 
              (S_Sequence 263
              (S_If 264 (E_Name 265 (E_Identifier 266 ((*R*) 64) ))
                (S_Assignment 267 (E_Indexed_Component 268 (E_Indexed_Component 269 (E_Identifier 270 ((*Cur_Board*) 8) ) (E_Binary_Operation 271 Plus (E_Name 272 (E_Selected_Component 273 (E_Identifier 274 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Name 276 (E_Identifier 277 ((*Y*) 62) )) ) ) (E_Binary_Operation 278 Plus (E_Name 279 (E_Selected_Component 280 (E_Identifier 281 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Name 283 (E_Identifier 284 ((*X*) 63) )) ) ) (E_Name 285 (E_Selected_Component 286 (E_Identifier 287 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
                S_Null
              ) 
              (S_Assignment 289 (E_Identifier 290 ((*X*) 63) ) (E_Binary_Operation 291 Plus (E_Name 292 (E_Identifier 293 ((*X*) 63) )) (E_Literal 294 (Integer_Literal 1) ) ))))
            ) 
            (S_Assignment 295 (E_Identifier 296 ((*Y*) 62) ) (E_Binary_Operation 297 Plus (E_Name 298 (E_Identifier 299 ((*Y*) 62) )) (E_Literal 300 (Integer_Literal 1) ) )))
          )
          (S_While_Loop 301 (E_Binary_Operation 302 Less_Than_Or_Equal (E_Name 303 (E_Identifier 304 ((*Y*) 62) )) (E_Literal 305 (Integer_Literal 2) ) )
            (S_Sequence 306
            (S_While_Loop 307 (E_Binary_Operation 308 Less_Than_Or_Equal (E_Name 309 (E_Identifier 310 ((*X*) 63) )) (E_Literal 311 (Integer_Literal 2) ) )
              (S_Sequence 312
              (S_Procedure_Call 313 314 ((*Possible_Three_Shapes*) 25) 
                ((E_Name 315 (E_Selected_Component 316 (E_Identifier 317 ((*Cur_Piece*) 17) ) ((*S*) 13) )) :: (E_Name 319 (E_Selected_Component 320 (E_Identifier 321 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (E_Name 323 (E_Identifier 324 ((*Y*) 62) )) :: (E_Name 325 (E_Identifier 326 ((*X*) 63) )) :: (E_Name 327 (E_Identifier 328 ((*R*) 64) )) :: nil)
              ) 
              (S_Sequence 329
              (S_If 330 (E_Name 331 (E_Identifier 332 ((*R*) 64) ))
                (S_Assignment 333 (E_Indexed_Component 334 (E_Indexed_Component 335 (E_Identifier 336 ((*Cur_Board*) 8) ) (E_Binary_Operation 337 Plus (E_Name 338 (E_Selected_Component 339 (E_Identifier 340 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Name 342 (E_Identifier 343 ((*Y*) 62) )) ) ) (E_Binary_Operation 344 Plus (E_Name 345 (E_Selected_Component 346 (E_Identifier 347 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Name 349 (E_Identifier 350 ((*X*) 63) )) ) ) (E_Name 351 (E_Selected_Component 352 (E_Identifier 353 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
                S_Null
              ) 
              (S_Assignment 355 (E_Identifier 356 ((*X*) 63) ) (E_Binary_Operation 357 Plus (E_Name 358 (E_Identifier 359 ((*X*) 63) )) (E_Literal 360 (Integer_Literal 1) ) ))))
            ) 
            (S_Assignment 361 (E_Identifier 362 ((*Y*) 62) ) (E_Binary_Operation 363 Plus (E_Name 364 (E_Identifier 365 ((*Y*) 62) )) (E_Literal 366 (Integer_Literal 1) ) )))
          )
        )
      ) 
      (S_Assignment 367 (E_Identifier 368 ((*Cur_State*) 19) ) (E_Literal 369 (Integer_Literal 2) )))
  )
) 
(D_Seq_Declaration 370
(D_Procedure_Body 371 
  (mkprocedure_body 372
    (* = = = Procedure Name = = = *)
    ((*Delete_Complete_Lines*) 39)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 373
  (D_Object_Declaration 374 (mkobject_declaration 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
  (D_Seq_Declaration 376
  (D_Object_Declaration 378 (mkobject_declaration 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal 377 (Integer_Literal 10) ))))) 
  (D_Seq_Declaration 380
  (D_Object_Declaration 382 (mkobject_declaration 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((E_Literal 381 (Boolean_Literal false) ))))) 
  (D_Seq_Declaration 384
  (D_Object_Declaration 386 (mkobject_declaration 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal 385 (Integer_Literal 1) ))))) 
  (D_Seq_Declaration 388
  (D_Object_Declaration 389 (mkobject_declaration 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
  (D_Object_Declaration 391 (mkobject_declaration 392 ((*R*) 71) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 393
      (S_While_Loop 394 (E_Binary_Operation 395 Less_Than_Or_Equal (E_Name 396 (E_Identifier 397 ((*Del_Line*) 69) )) (E_Literal 398 (Integer_Literal 50) ) )
        (S_Sequence 399
        (S_Procedure_Call 400 401 ((*Is_Complete_Line*) 27) 
          ((E_Name 402 (E_Indexed_Component 403 (E_Identifier 404 ((*Cur_Board*) 8) ) (E_Name 405 (E_Identifier 406 ((*Del_Line*) 69) )) )) :: (E_Name 407 (E_Identifier 408 ((*R*) 71) )) :: nil)
        ) 
        (S_Sequence 409
        (S_If 410 (E_Name 411 (E_Identifier 412 ((*R*) 71) ))
          (S_Sequence 413
          (S_Assignment 414 (E_Indexed_Component 415 (E_Identifier 416 ((*Cur_Board*) 8) ) (E_Name 417 (E_Identifier 418 ((*Del_Line*) 69) )) ) (E_Name 419 (E_Identifier 420 ((*Empty_Line*) 66) ))) 
          (S_Sequence 421
          (S_Assignment 422 (E_Identifier 423 ((*Has_Complete_Lines*) 68) ) (E_Literal 424 (Boolean_Literal true) )) 
          (S_Assignment 425 (E_Identifier 426 ((*To_Line*) 67) ) (E_Name 427 (E_Identifier 428 ((*Del_Line*) 69) )))))
          S_Null
        ) 
        (S_Assignment 429 (E_Identifier 430 ((*Del_Line*) 69) ) (E_Binary_Operation 431 Plus (E_Name 432 (E_Identifier 433 ((*Del_Line*) 69) )) (E_Literal 434 (Integer_Literal 1) ) ))))
      ) 
      (S_Sequence 435
      (S_If 436 (E_Name 437 (E_Identifier 438 ((*Has_Complete_Lines*) 68) ))
        (S_Sequence 439
        (S_Assignment 440 (E_Identifier 441 ((*From_Line*) 70) ) (E_Literal 442 (Integer_Literal 9) )) 
        (S_While_Loop 443 (E_Binary_Operation 444 Greater_Than_Or_Equal (E_Name 445 (E_Identifier 446 ((*From_Line*) 70) )) (E_Literal 447 (Integer_Literal 1) ) )
          (S_Sequence 448
          (S_Procedure_Call 449 450 ((*Is_Empty_Line*) 28) 
            ((E_Name 451 (E_Indexed_Component 452 (E_Identifier 453 ((*Cur_Board*) 8) ) (E_Name 454 (E_Identifier 455 ((*From_Line*) 70) )) )) :: (E_Name 456 (E_Identifier 457 ((*R*) 71) )) :: nil)
          ) 
          (S_Sequence 458
          (S_If 459 (E_Unary_Operation 460 Not (E_Name 461 (E_Identifier 462 ((*R*) 71) )) )
            (S_Sequence 463
            (S_Assignment 464 (E_Indexed_Component 465 (E_Identifier 466 ((*Cur_Board*) 8) ) (E_Name 467 (E_Identifier 468 ((*To_Line*) 67) )) ) (E_Name 469 (E_Indexed_Component 470 (E_Identifier 471 ((*Cur_Board*) 8) ) (E_Name 472 (E_Identifier 473 ((*From_Line*) 70) )) ))) 
            (S_Sequence 474
            (S_Assignment 475 (E_Indexed_Component 476 (E_Identifier 477 ((*Cur_Board*) 8) ) (E_Name 478 (E_Identifier 479 ((*From_Line*) 70) )) ) (E_Name 480 (E_Identifier 481 ((*Empty_Line*) 66) ))) 
            (S_Assignment 482 (E_Identifier 483 ((*To_Line*) 67) ) (E_Binary_Operation 484 Minus (E_Name 485 (E_Identifier 486 ((*To_Line*) 67) )) (E_Literal 487 (Integer_Literal 1) ) ))))
            S_Null
          ) 
          (S_Assignment 488 (E_Identifier 489 ((*From_Line*) 70) ) (E_Binary_Operation 490 Minus (E_Name 491 (E_Identifier 492 ((*From_Line*) 70) )) (E_Literal 493 (Integer_Literal 1) ) ))))
        ))
        S_Null
      ) 
      (S_Assignment 494 (E_Identifier 495 ((*Cur_State*) 19) ) (E_Literal 496 (Integer_Literal 3) ))))
  )
) 
(D_Seq_Declaration 497
(D_Procedure_Body 498 
  (mkprocedure_body 499
    (* = = = Procedure Name = = = *)
    ((*No_Overlap*) 30)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
    (mkparameter_specification 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparameter_specification 502 ((*R*) 74) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_Assignment 503 (E_Identifier 504 ((*R*) 74) ) (E_Literal 505 (Boolean_Literal true) ))
  )
) 
(D_Seq_Declaration 506
(D_Procedure_Body 507 
  (mkprocedure_body 508
    (* = = = Procedure Name = = = *)
    ((*Turn_Direction*) 34)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparameter_specification 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
    (mkparameter_specification 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_If 512 (E_Binary_Operation 513 Equal (E_Name 514 (E_Identifier 515 ((*T*) 76) )) (E_Literal 516 (Integer_Literal 3) ) )
        (S_If 517 (E_Binary_Operation 518 Equal (E_Name 519 (E_Identifier 520 ((*D*) 75) )) (E_Literal 521 (Integer_Literal 0) ) )
          (S_Assignment 522 (E_Identifier 523 ((*R*) 77) ) (E_Literal 524 (Integer_Literal 3) ))
          (S_Assignment 525 (E_Identifier 526 ((*R*) 77) ) (E_Binary_Operation 527 Minus (E_Name 528 (E_Identifier 529 ((*D*) 75) )) (E_Literal 530 (Integer_Literal 1) ) ))
        )
        (S_If 531 (E_Binary_Operation 532 Equal (E_Name 533 (E_Identifier 534 ((*D*) 75) )) (E_Literal 535 (Integer_Literal 3) ) )
          (S_Assignment 536 (E_Identifier 537 ((*R*) 77) ) (E_Literal 538 (Integer_Literal 0) ))
          (S_Assignment 539 (E_Identifier 540 ((*R*) 77) ) (E_Binary_Operation 541 Plus (E_Name 542 (E_Identifier 543 ((*D*) 75) )) (E_Literal 544 (Integer_Literal 1) ) ))
        )
      )
  )
) 
(D_Seq_Declaration 545
(D_Procedure_Body 546 
  (mkprocedure_body 547
    (* = = = Procedure Name = = = *)
    ((*Move_Is_Possible*) 35)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparameter_specification 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparameter_specification 550 ((*R*) 80) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_If 551 (E_Binary_Operation 552 Equal (E_Name 553 (E_Identifier 554 ((*A*) 79) )) (E_Literal 555 (Integer_Literal 0) ) )
        (S_Assignment 556 (E_Identifier 557 ((*R*) 80) ) (E_Binary_Operation 558 And (E_Binary_Operation 559 Greater_Than_Or_Equal (E_Binary_Operation 560 Minus (E_Name 561 (E_Selected_Component 562 (E_Identifier 563 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 565 (Integer_Literal 1) ) ) (E_Unary_Operation 566 Unary_Minus (E_Literal 567 (Integer_Literal 1) ) ) ) (E_Binary_Operation 568 Less_Than_Or_Equal (E_Binary_Operation 569 Minus (E_Name 570 (E_Selected_Component 571 (E_Identifier 572 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 574 (Integer_Literal 1) ) ) (E_Literal 575 (Integer_Literal 9) ) ) ))
        (S_If 576 (E_Binary_Operation 577 Equal (E_Name 578 (E_Identifier 579 ((*A*) 79) )) (E_Literal 580 (Integer_Literal 1) ) )
          (S_Assignment 581 (E_Identifier 582 ((*R*) 80) ) (E_Binary_Operation 583 And (E_Binary_Operation 584 Greater_Than_Or_Equal (E_Binary_Operation 585 Plus (E_Name 586 (E_Selected_Component 587 (E_Identifier 588 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 590 (Integer_Literal 1) ) ) (E_Unary_Operation 591 Unary_Minus (E_Literal 592 (Integer_Literal 1) ) ) ) (E_Binary_Operation 593 Less_Than_Or_Equal (E_Binary_Operation 594 Plus (E_Name 595 (E_Selected_Component 596 (E_Identifier 597 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 599 (Integer_Literal 1) ) ) (E_Literal 600 (Integer_Literal 9) ) ) ))
          (S_If 601 (E_Binary_Operation 602 Equal (E_Name 603 (E_Identifier 604 ((*A*) 79) )) (E_Literal 605 (Integer_Literal 2) ) )
            (S_Assignment 606 (E_Identifier 607 ((*R*) 80) ) (E_Binary_Operation 608 And (E_Binary_Operation 609 Greater_Than_Or_Equal (E_Binary_Operation 610 Plus (E_Name 611 (E_Selected_Component 612 (E_Identifier 613 ((*P*) 78) ) ((*Y*) 16) )) (E_Literal 615 (Integer_Literal 1) ) ) (E_Unary_Operation 616 Unary_Minus (E_Literal 617 (Integer_Literal 1) ) ) ) (E_Binary_Operation 618 Less_Than_Or_Equal (E_Binary_Operation 619 Plus (E_Name 620 (E_Selected_Component 621 (E_Identifier 622 ((*P*) 78) ) ((*Y*) 16) )) (E_Literal 624 (Integer_Literal 1) ) ) (E_Literal 625 (Integer_Literal 49) ) ) ))
            (S_Assignment 626 (E_Identifier 627 ((*R*) 80) ) (E_Literal 628 (Boolean_Literal true) ))
          )
        )
      )
  )
) 
(D_Seq_Declaration 629
(D_Procedure_Body 630 
  (mkprocedure_body 631
    (* = = = Procedure Name = = = *)
    ((*Move*) 36)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparameter_specification 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparameter_specification 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration)
    (* = = = Procedure Body = = = *)
      (S_If 635 (E_Binary_Operation 636 Equal (E_Name 637 (E_Identifier 638 ((*A*) 82) )) (E_Literal 639 (Integer_Literal 0) ) )
        (S_Assignment 640 (E_Selected_Component 641 (E_Identifier 642 ((*R*) 83) ) ((*X*) 15) ) (E_Binary_Operation 644 Minus (E_Name 645 (E_Selected_Component 646 (E_Identifier 647 ((*P*) 81) ) ((*X*) 15) )) (E_Literal 649 (Integer_Literal 1) ) ))
        (S_If 650 (E_Binary_Operation 651 Equal (E_Name 652 (E_Identifier 653 ((*A*) 82) )) (E_Literal 654 (Integer_Literal 1) ) )
          (S_Assignment 655 (E_Selected_Component 656 (E_Identifier 657 ((*R*) 83) ) ((*X*) 15) ) (E_Binary_Operation 659 Plus (E_Name 660 (E_Selected_Component 661 (E_Identifier 662 ((*P*) 81) ) ((*X*) 15) )) (E_Literal 664 (Integer_Literal 1) ) ))
          (S_If 665 (E_Binary_Operation 666 Equal (E_Name 667 (E_Identifier 668 ((*A*) 82) )) (E_Literal 669 (Integer_Literal 2) ) )
            (S_Assignment 670 (E_Selected_Component 671 (E_Identifier 672 ((*R*) 83) ) ((*Y*) 16) ) (E_Binary_Operation 674 Plus (E_Name 675 (E_Selected_Component 676 (E_Identifier 677 ((*P*) 81) ) ((*Y*) 16) )) (E_Literal 679 (Integer_Literal 1) ) ))
            (S_Procedure_Call 680 681 ((*Turn_Direction*) 34) 
              ((E_Name 682 (E_Selected_Component 683 (E_Identifier 684 ((*P*) 81) ) ((*D*) 14) )) :: (E_Name 686 (E_Identifier 687 ((*A*) 82) )) :: (E_Name 688 (E_Selected_Component 689 (E_Identifier 690 ((*R*) 83) ) ((*D*) 14) )) :: nil)
            )
          )
        )
      )
  )
) 
(D_Procedure_Body 692 
  (mkprocedure_body 693
    (* = = = Procedure Name = = = *)
    ((*Do_Action*) 37)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparameter_specification 695 ((*Success*) 85) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration 696
  (D_Object_Declaration 697 (mkobject_declaration 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
  (D_Seq_Declaration 699
  (D_Object_Declaration 700 (mkobject_declaration 701 ((*Is_Move_OK*) 87) Boolean None)) 
  (D_Object_Declaration 702 (mkobject_declaration 703 ((*Is_No_Overlap*) 88) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence 704
      (S_Procedure_Call 705 706 ((*Move_Is_Possible*) 35) 
        ((E_Name 707 (E_Identifier 708 ((*Cur_Piece*) 17) )) :: (E_Name 709 (E_Identifier 710 ((*A*) 84) )) :: (E_Name 711 (E_Identifier 712 ((*Is_Move_OK*) 87) )) :: nil)
      ) 
      (S_Sequence 713
      (S_If 714 (E_Name 715 (E_Identifier 716 ((*Is_Move_OK*) 87) ))
        (S_Sequence 717
        (S_Procedure_Call 718 719 ((*Move*) 36) 
          ((E_Name 720 (E_Identifier 721 ((*Cur_Piece*) 17) )) :: (E_Name 722 (E_Identifier 723 ((*A*) 84) )) :: (E_Name 724 (E_Identifier 725 ((*Candidate*) 86) )) :: nil)
        ) 
        (S_Sequence 726
        (S_Procedure_Call 727 728 ((*No_Overlap*) 30) 
          ((E_Name 729 (E_Identifier 730 ((*Cur_Board*) 8) )) :: (E_Name 731 (E_Identifier 732 ((*Candidate*) 86) )) :: (E_Name 733 (E_Identifier 734 ((*Is_No_Overlap*) 88) )) :: nil)
        ) 
        (S_If 735 (E_Name 736 (E_Identifier 737 ((*Is_No_Overlap*) 88) ))
          (S_Sequence 738
          (S_Assignment 739 (E_Identifier 740 ((*Cur_Piece*) 17) ) (E_Name 741 (E_Identifier 742 ((*Candidate*) 86) ))) 
          (S_Sequence 743
          (S_Assignment 744 (E_Identifier 745 ((*Success*) 85) ) (E_Literal 746 (Boolean_Literal true) )) 
          S_Null (* Ignore Return Statement ! *)))
          S_Null
        )))
        S_Null
      ) 
      (S_Assignment 747 (E_Identifier 748 ((*Success*) 85) ) (E_Literal 749 (Boolean_Literal false) ))))
  )
)))))))))))))).

Definition Symbol_Table := 
(mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*R*) 49), (Out, Boolean)) :: (((*X*) 53), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Cur_Board*) 8), (In_Out, (Array_Type ((*Board*) 7)))) :: (((*To_Line*) 67), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 55), (Out, Boolean)) :: (((*P*) 81), (In, (Record_Type ((*Piece*) 12)))) :: (((*A*) 82), (In, (Derived_Type ((*Action*) 31)))) :: (((*From_Line*) 70), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 64), (In_Out, Boolean)) :: (((*Is_No_Overlap*) 88), (In_Out, Boolean)) :: (((*L*) 48), (In, (Array_Type ((*Line*) 6)))) :: (((*Candidate*) 86), (In_Out, (Record_Type ((*Piece*) 12)))) :: (((*X*) 58), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Success*) 85), (Out, Boolean)) :: (((*B*) 72), (In, (Array_Type ((*Board*) 7)))) :: (((*Y*) 54), (In, (Subtype ((*I_Delta*) 20)))) :: (((*X*) 43), (In, Integer)) :: (((*Is_Move_OK*) 87), (In_Out, Boolean)) :: (((*T*) 76), (In, (Subtype ((*Turn_Action*) 33)))) :: (((*Has_Complete_Lines*) 68), (In_Out, Boolean)) :: (((*Cur_State*) 19), (In_Out, (Derived_Type ((*State*) 18)))) :: (((*R*) 51), (Out, Boolean)) :: (((*Y*) 42), (In, Integer)) :: (((*A*) 84), (In, (Derived_Type ((*Action*) 31)))) :: (((*Cur_Piece_D*) 52), (In, (Derived_Type ((*Direction*) 11)))) :: (((*B*) 41), (In, (Array_Type ((*Board*) 7)))) :: (((*Cur_Piece_S*) 56), (In, (Subtype ((*Shape*) 2)))) :: (((*Y*) 59), (In, (Subtype ((*I_Delta*) 20)))) :: (((*D*) 75), (In, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 47), (Out, Boolean)) :: (((*Del_Line*) 69), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 60), (Out, Boolean)) :: (((*X*) 63), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*P*) 73), (In, (Record_Type ((*Piece*) 12)))) :: (((*B*) 50), (In, (Array_Type ((*Board*) 7)))) :: (((*R*) 77), (Out, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 44), (Out, Boolean)) :: (((*R*) 83), (Out, (Record_Type ((*Piece*) 12)))) :: (((*Cur_Piece_D*) 57), (In, (Derived_Type ((*Direction*) 11)))) :: (((*Y*) 62), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*R*) 74), (Out, Boolean)) :: (((*L*) 46), (In, (Array_Type ((*Line*) 6)))) :: (((*R*) 80), (Out, Boolean)) :: (((*Empty_Line*) 66), (In_Out, (Array_Type ((*Line*) 6)))) :: (((*A*) 79), (In, (Derived_Type ((*Action*) 31)))) :: (((*P*) 78), (In, (Record_Type ((*Piece*) 12)))) :: (((*R*) 71), (In_Out, Boolean)) :: (((*Cur_Piece*) 17), (In_Out, (Record_Type ((*Piece*) 12)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Possible_Three_Shapes*) 25), (0, (mkprocedure_body 127
  (* = = = Procedure Name = = = *)
  ((*Possible_Three_Shapes*) 25)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
  (mkparameter_specification 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparameter_specification 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification 132 ((*R*) 60) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 133 (E_Identifier 134 ((*R*) 60) ) (E_Literal 135 (Boolean_Literal true) ))
))) :: (((*Do_Action*) 37), (0, (mkprocedure_body 693
  (* = = = Procedure Name = = = *)
  ((*Do_Action*) 37)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparameter_specification 695 ((*Success*) 85) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 696
(D_Object_Declaration 697 (mkobject_declaration 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
(D_Seq_Declaration 699
(D_Object_Declaration 700 (mkobject_declaration 701 ((*Is_Move_OK*) 87) Boolean None)) 
(D_Object_Declaration 702 (mkobject_declaration 703 ((*Is_No_Overlap*) 88) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 704
    (S_Procedure_Call 705 706 ((*Move_Is_Possible*) 35) 
      ((E_Name 707 (E_Identifier 708 ((*Cur_Piece*) 17) )) :: (E_Name 709 (E_Identifier 710 ((*A*) 84) )) :: (E_Name 711 (E_Identifier 712 ((*Is_Move_OK*) 87) )) :: nil)
    ) 
    (S_Sequence 713
    (S_If 714 (E_Name 715 (E_Identifier 716 ((*Is_Move_OK*) 87) ))
      (S_Sequence 717
      (S_Procedure_Call 718 719 ((*Move*) 36) 
        ((E_Name 720 (E_Identifier 721 ((*Cur_Piece*) 17) )) :: (E_Name 722 (E_Identifier 723 ((*A*) 84) )) :: (E_Name 724 (E_Identifier 725 ((*Candidate*) 86) )) :: nil)
      ) 
      (S_Sequence 726
      (S_Procedure_Call 727 728 ((*No_Overlap*) 30) 
        ((E_Name 729 (E_Identifier 730 ((*Cur_Board*) 8) )) :: (E_Name 731 (E_Identifier 732 ((*Candidate*) 86) )) :: (E_Name 733 (E_Identifier 734 ((*Is_No_Overlap*) 88) )) :: nil)
      ) 
      (S_If 735 (E_Name 736 (E_Identifier 737 ((*Is_No_Overlap*) 88) ))
        (S_Sequence 738
        (S_Assignment 739 (E_Identifier 740 ((*Cur_Piece*) 17) ) (E_Name 741 (E_Identifier 742 ((*Candidate*) 86) ))) 
        (S_Sequence 743
        (S_Assignment 744 (E_Identifier 745 ((*Success*) 85) ) (E_Literal 746 (Boolean_Literal true) )) 
        S_Null (* Ignore Return Statement ! *)))
        S_Null
      )))
      S_Null
    ) 
    (S_Assignment 747 (E_Identifier 748 ((*Success*) 85) ) (E_Literal 749 (Boolean_Literal false) ))))
))) :: (((*No_Complete_Lines*) 29), (0, (mkprocedure_body 109
  (* = = = Procedure Name = = = *)
  ((*No_Complete_Lines*) 29)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
  (mkparameter_specification 111 ((*R*) 51) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 112 (E_Identifier 113 ((*R*) 51) ) (E_Literal 114 (Boolean_Literal true) ))
))) :: (((*Is_Complete_Line*) 27), (0, (mkprocedure_body 93
  (* = = = Procedure Name = = = *)
  ((*Is_Complete_Line*) 27)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
  (mkparameter_specification 95 ((*R*) 47) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 96 (E_Identifier 97 ((*R*) 47) ) (E_Literal 98 (Boolean_Literal true) ))
))) :: (((*Is_Empty*) 26), (0, (mkprocedure_body 83
  (* = = = Procedure Name = = = *)
  ((*Is_Empty*) 26)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
  (mkparameter_specification 85 ((*Y*) 42) Integer In) :: 
  (mkparameter_specification 86 ((*X*) 43) Integer In) :: 
  (mkparameter_specification 87 ((*R*) 44) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 88 (E_Identifier 89 ((*R*) 44) ) (E_Literal 90 (Boolean_Literal true) ))
))) :: (((*No_Overlap*) 30), (0, (mkprocedure_body 499
  (* = = = Procedure Name = = = *)
  ((*No_Overlap*) 30)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
  (mkparameter_specification 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparameter_specification 502 ((*R*) 74) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 503 (E_Identifier 504 ((*R*) 74) ) (E_Literal 505 (Boolean_Literal true) ))
))) :: (((*Possible_I_Shapes*) 24), (0, (mkprocedure_body 117
  (* = = = Procedure Name = = = *)
  ((*Possible_I_Shapes*) 24)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparameter_specification 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification 121 ((*R*) 55) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 122 (E_Identifier 123 ((*R*) 55) ) (E_Literal 124 (Boolean_Literal true) ))
))) :: (((*Include_Piece_In_Board*) 38), (0, (mkprocedure_body 138
  (* = = = Procedure Name = = = *)
  ((*Include_Piece_In_Board*) 38)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 139
(D_Object_Declaration 141 (mkobject_declaration 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal 140 (Integer_Literal 0) ))))) 
(D_Seq_Declaration 143
(D_Object_Declaration 145 (mkobject_declaration 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal 144 (Integer_Literal 0) ))))) 
(D_Object_Declaration 147 (mkobject_declaration 148 ((*R*) 64) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 149
    (S_If 150 (E_Binary_Operation 151 Equal (E_Name 152 (E_Selected_Component 153 (E_Identifier 154 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (E_Literal 156 (Integer_Literal 2) ) )
      (S_Sequence 157
      (S_Assignment 158 (E_Indexed_Component 159 (E_Indexed_Component 160 (E_Identifier 161 ((*Cur_Board*) 8) ) (E_Name 162 (E_Selected_Component 163 (E_Identifier 164 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (E_Name 166 (E_Selected_Component 167 (E_Identifier 168 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (E_Name 170 (E_Selected_Component 171 (E_Identifier 172 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
      (S_Sequence 174
      (S_Assignment 175 (E_Indexed_Component 176 (E_Indexed_Component 177 (E_Identifier 178 ((*Cur_Board*) 8) ) (E_Binary_Operation 179 Plus (E_Name 180 (E_Selected_Component 181 (E_Identifier 182 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Literal 184 (Integer_Literal 1) ) ) ) (E_Name 185 (E_Selected_Component 186 (E_Identifier 187 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (E_Name 189 (E_Selected_Component 190 (E_Identifier 191 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
      (S_Sequence 193
      (S_Assignment 194 (E_Indexed_Component 195 (E_Indexed_Component 196 (E_Identifier 197 ((*Cur_Board*) 8) ) (E_Name 198 (E_Selected_Component 199 (E_Identifier 200 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (E_Binary_Operation 202 Plus (E_Name 203 (E_Selected_Component 204 (E_Identifier 205 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Literal 207 (Integer_Literal 1) ) ) ) (E_Name 208 (E_Selected_Component 209 (E_Identifier 210 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
      (S_Assignment 212 (E_Indexed_Component 213 (E_Indexed_Component 214 (E_Identifier 215 ((*Cur_Board*) 8) ) (E_Binary_Operation 216 Plus (E_Name 217 (E_Selected_Component 218 (E_Identifier 219 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Literal 221 (Integer_Literal 1) ) ) ) (E_Binary_Operation 222 Plus (E_Name 223 (E_Selected_Component 224 (E_Identifier 225 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Literal 227 (Integer_Literal 1) ) ) ) (E_Name 228 (E_Selected_Component 229 (E_Identifier 230 ((*Cur_Piece*) 17) ) ((*S*) 13) ))))))
      (S_If 232 (E_Binary_Operation 233 Equal (E_Name 234 (E_Selected_Component 235 (E_Identifier 236 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (E_Literal 238 (Integer_Literal 1) ) )
        (S_While_Loop 239 (E_Binary_Operation 240 Less_Than_Or_Equal (E_Name 241 (E_Identifier 242 ((*Y*) 62) )) (E_Literal 243 (Integer_Literal 3) ) )
          (S_Sequence 244
          (S_While_Loop 245 (E_Binary_Operation 246 Less_Than_Or_Equal (E_Name 247 (E_Identifier 248 ((*X*) 63) )) (E_Literal 249 (Integer_Literal 3) ) )
            (S_Sequence 250
            (S_Procedure_Call 251 252 ((*Possible_I_Shapes*) 24) 
              ((E_Name 253 (E_Selected_Component 254 (E_Identifier 255 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (E_Name 257 (E_Identifier 258 ((*Y*) 62) )) :: (E_Name 259 (E_Identifier 260 ((*X*) 63) )) :: (E_Name 261 (E_Identifier 262 ((*R*) 64) )) :: nil)
            ) 
            (S_Sequence 263
            (S_If 264 (E_Name 265 (E_Identifier 266 ((*R*) 64) ))
              (S_Assignment 267 (E_Indexed_Component 268 (E_Indexed_Component 269 (E_Identifier 270 ((*Cur_Board*) 8) ) (E_Binary_Operation 271 Plus (E_Name 272 (E_Selected_Component 273 (E_Identifier 274 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Name 276 (E_Identifier 277 ((*Y*) 62) )) ) ) (E_Binary_Operation 278 Plus (E_Name 279 (E_Selected_Component 280 (E_Identifier 281 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Name 283 (E_Identifier 284 ((*X*) 63) )) ) ) (E_Name 285 (E_Selected_Component 286 (E_Identifier 287 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
              S_Null
            ) 
            (S_Assignment 289 (E_Identifier 290 ((*X*) 63) ) (E_Binary_Operation 291 Plus (E_Name 292 (E_Identifier 293 ((*X*) 63) )) (E_Literal 294 (Integer_Literal 1) ) ))))
          ) 
          (S_Assignment 295 (E_Identifier 296 ((*Y*) 62) ) (E_Binary_Operation 297 Plus (E_Name 298 (E_Identifier 299 ((*Y*) 62) )) (E_Literal 300 (Integer_Literal 1) ) )))
        )
        (S_While_Loop 301 (E_Binary_Operation 302 Less_Than_Or_Equal (E_Name 303 (E_Identifier 304 ((*Y*) 62) )) (E_Literal 305 (Integer_Literal 2) ) )
          (S_Sequence 306
          (S_While_Loop 307 (E_Binary_Operation 308 Less_Than_Or_Equal (E_Name 309 (E_Identifier 310 ((*X*) 63) )) (E_Literal 311 (Integer_Literal 2) ) )
            (S_Sequence 312
            (S_Procedure_Call 313 314 ((*Possible_Three_Shapes*) 25) 
              ((E_Name 315 (E_Selected_Component 316 (E_Identifier 317 ((*Cur_Piece*) 17) ) ((*S*) 13) )) :: (E_Name 319 (E_Selected_Component 320 (E_Identifier 321 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (E_Name 323 (E_Identifier 324 ((*Y*) 62) )) :: (E_Name 325 (E_Identifier 326 ((*X*) 63) )) :: (E_Name 327 (E_Identifier 328 ((*R*) 64) )) :: nil)
            ) 
            (S_Sequence 329
            (S_If 330 (E_Name 331 (E_Identifier 332 ((*R*) 64) ))
              (S_Assignment 333 (E_Indexed_Component 334 (E_Indexed_Component 335 (E_Identifier 336 ((*Cur_Board*) 8) ) (E_Binary_Operation 337 Plus (E_Name 338 (E_Selected_Component 339 (E_Identifier 340 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (E_Name 342 (E_Identifier 343 ((*Y*) 62) )) ) ) (E_Binary_Operation 344 Plus (E_Name 345 (E_Selected_Component 346 (E_Identifier 347 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (E_Name 349 (E_Identifier 350 ((*X*) 63) )) ) ) (E_Name 351 (E_Selected_Component 352 (E_Identifier 353 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
              S_Null
            ) 
            (S_Assignment 355 (E_Identifier 356 ((*X*) 63) ) (E_Binary_Operation 357 Plus (E_Name 358 (E_Identifier 359 ((*X*) 63) )) (E_Literal 360 (Integer_Literal 1) ) ))))
          ) 
          (S_Assignment 361 (E_Identifier 362 ((*Y*) 62) ) (E_Binary_Operation 363 Plus (E_Name 364 (E_Identifier 365 ((*Y*) 62) )) (E_Literal 366 (Integer_Literal 1) ) )))
        )
      )
    ) 
    (S_Assignment 367 (E_Identifier 368 ((*Cur_State*) 19) ) (E_Literal 369 (Integer_Literal 2) )))
))) :: (((*Is_Empty_Line*) 28), (0, (mkprocedure_body 101
  (* = = = Procedure Name = = = *)
  ((*Is_Empty_Line*) 28)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
  (mkparameter_specification 103 ((*R*) 49) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_Assignment 104 (E_Identifier 105 ((*R*) 49) ) (E_Literal 106 (Boolean_Literal true) ))
))) :: (((*Move_Is_Possible*) 35), (0, (mkprocedure_body 547
  (* = = = Procedure Name = = = *)
  ((*Move_Is_Possible*) 35)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparameter_specification 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparameter_specification 550 ((*R*) 80) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_If 551 (E_Binary_Operation 552 Equal (E_Name 553 (E_Identifier 554 ((*A*) 79) )) (E_Literal 555 (Integer_Literal 0) ) )
      (S_Assignment 556 (E_Identifier 557 ((*R*) 80) ) (E_Binary_Operation 558 And (E_Binary_Operation 559 Greater_Than_Or_Equal (E_Binary_Operation 560 Minus (E_Name 561 (E_Selected_Component 562 (E_Identifier 563 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 565 (Integer_Literal 1) ) ) (E_Unary_Operation 566 Unary_Minus (E_Literal 567 (Integer_Literal 1) ) ) ) (E_Binary_Operation 568 Less_Than_Or_Equal (E_Binary_Operation 569 Minus (E_Name 570 (E_Selected_Component 571 (E_Identifier 572 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 574 (Integer_Literal 1) ) ) (E_Literal 575 (Integer_Literal 9) ) ) ))
      (S_If 576 (E_Binary_Operation 577 Equal (E_Name 578 (E_Identifier 579 ((*A*) 79) )) (E_Literal 580 (Integer_Literal 1) ) )
        (S_Assignment 581 (E_Identifier 582 ((*R*) 80) ) (E_Binary_Operation 583 And (E_Binary_Operation 584 Greater_Than_Or_Equal (E_Binary_Operation 585 Plus (E_Name 586 (E_Selected_Component 587 (E_Identifier 588 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 590 (Integer_Literal 1) ) ) (E_Unary_Operation 591 Unary_Minus (E_Literal 592 (Integer_Literal 1) ) ) ) (E_Binary_Operation 593 Less_Than_Or_Equal (E_Binary_Operation 594 Plus (E_Name 595 (E_Selected_Component 596 (E_Identifier 597 ((*P*) 78) ) ((*X*) 15) )) (E_Literal 599 (Integer_Literal 1) ) ) (E_Literal 600 (Integer_Literal 9) ) ) ))
        (S_If 601 (E_Binary_Operation 602 Equal (E_Name 603 (E_Identifier 604 ((*A*) 79) )) (E_Literal 605 (Integer_Literal 2) ) )
          (S_Assignment 606 (E_Identifier 607 ((*R*) 80) ) (E_Binary_Operation 608 And (E_Binary_Operation 609 Greater_Than_Or_Equal (E_Binary_Operation 610 Plus (E_Name 611 (E_Selected_Component 612 (E_Identifier 613 ((*P*) 78) ) ((*Y*) 16) )) (E_Literal 615 (Integer_Literal 1) ) ) (E_Unary_Operation 616 Unary_Minus (E_Literal 617 (Integer_Literal 1) ) ) ) (E_Binary_Operation 618 Less_Than_Or_Equal (E_Binary_Operation 619 Plus (E_Name 620 (E_Selected_Component 621 (E_Identifier 622 ((*P*) 78) ) ((*Y*) 16) )) (E_Literal 624 (Integer_Literal 1) ) ) (E_Literal 625 (Integer_Literal 49) ) ) ))
          (S_Assignment 626 (E_Identifier 627 ((*R*) 80) ) (E_Literal 628 (Boolean_Literal true) ))
        )
      )
    )
))) :: (((*Turn_Direction*) 34), (0, (mkprocedure_body 508
  (* = = = Procedure Name = = = *)
  ((*Turn_Direction*) 34)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparameter_specification 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
  (mkparameter_specification 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_If 512 (E_Binary_Operation 513 Equal (E_Name 514 (E_Identifier 515 ((*T*) 76) )) (E_Literal 516 (Integer_Literal 3) ) )
      (S_If 517 (E_Binary_Operation 518 Equal (E_Name 519 (E_Identifier 520 ((*D*) 75) )) (E_Literal 521 (Integer_Literal 0) ) )
        (S_Assignment 522 (E_Identifier 523 ((*R*) 77) ) (E_Literal 524 (Integer_Literal 3) ))
        (S_Assignment 525 (E_Identifier 526 ((*R*) 77) ) (E_Binary_Operation 527 Minus (E_Name 528 (E_Identifier 529 ((*D*) 75) )) (E_Literal 530 (Integer_Literal 1) ) ))
      )
      (S_If 531 (E_Binary_Operation 532 Equal (E_Name 533 (E_Identifier 534 ((*D*) 75) )) (E_Literal 535 (Integer_Literal 3) ) )
        (S_Assignment 536 (E_Identifier 537 ((*R*) 77) ) (E_Literal 538 (Integer_Literal 0) ))
        (S_Assignment 539 (E_Identifier 540 ((*R*) 77) ) (E_Binary_Operation 541 Plus (E_Name 542 (E_Identifier 543 ((*D*) 75) )) (E_Literal 544 (Integer_Literal 1) ) ))
      )
    )
))) :: (((*Move*) 36), (0, (mkprocedure_body 631
  (* = = = Procedure Name = = = *)
  ((*Move*) 36)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparameter_specification 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparameter_specification 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration)
  (* = = = Procedure Body = = = *)
    (S_If 635 (E_Binary_Operation 636 Equal (E_Name 637 (E_Identifier 638 ((*A*) 82) )) (E_Literal 639 (Integer_Literal 0) ) )
      (S_Assignment 640 (E_Selected_Component 641 (E_Identifier 642 ((*R*) 83) ) ((*X*) 15) ) (E_Binary_Operation 644 Minus (E_Name 645 (E_Selected_Component 646 (E_Identifier 647 ((*P*) 81) ) ((*X*) 15) )) (E_Literal 649 (Integer_Literal 1) ) ))
      (S_If 650 (E_Binary_Operation 651 Equal (E_Name 652 (E_Identifier 653 ((*A*) 82) )) (E_Literal 654 (Integer_Literal 1) ) )
        (S_Assignment 655 (E_Selected_Component 656 (E_Identifier 657 ((*R*) 83) ) ((*X*) 15) ) (E_Binary_Operation 659 Plus (E_Name 660 (E_Selected_Component 661 (E_Identifier 662 ((*P*) 81) ) ((*X*) 15) )) (E_Literal 664 (Integer_Literal 1) ) ))
        (S_If 665 (E_Binary_Operation 666 Equal (E_Name 667 (E_Identifier 668 ((*A*) 82) )) (E_Literal 669 (Integer_Literal 2) ) )
          (S_Assignment 670 (E_Selected_Component 671 (E_Identifier 672 ((*R*) 83) ) ((*Y*) 16) ) (E_Binary_Operation 674 Plus (E_Name 675 (E_Selected_Component 676 (E_Identifier 677 ((*P*) 81) ) ((*Y*) 16) )) (E_Literal 679 (Integer_Literal 1) ) ))
          (S_Procedure_Call 680 681 ((*Turn_Direction*) 34) 
            ((E_Name 682 (E_Selected_Component 683 (E_Identifier 684 ((*P*) 81) ) ((*D*) 14) )) :: (E_Name 686 (E_Identifier 687 ((*A*) 82) )) :: (E_Name 688 (E_Selected_Component 689 (E_Identifier 690 ((*R*) 83) ) ((*D*) 14) )) :: nil)
          )
        )
      )
    )
))) :: (((*Delete_Complete_Lines*) 39), (0, (mkprocedure_body 372
  (* = = = Procedure Name = = = *)
  ((*Delete_Complete_Lines*) 39)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration 373
(D_Object_Declaration 374 (mkobject_declaration 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
(D_Seq_Declaration 376
(D_Object_Declaration 378 (mkobject_declaration 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal 377 (Integer_Literal 10) ))))) 
(D_Seq_Declaration 380
(D_Object_Declaration 382 (mkobject_declaration 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((E_Literal 381 (Boolean_Literal false) ))))) 
(D_Seq_Declaration 384
(D_Object_Declaration 386 (mkobject_declaration 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal 385 (Integer_Literal 1) ))))) 
(D_Seq_Declaration 388
(D_Object_Declaration 389 (mkobject_declaration 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
(D_Object_Declaration 391 (mkobject_declaration 392 ((*R*) 71) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence 393
    (S_While_Loop 394 (E_Binary_Operation 395 Less_Than_Or_Equal (E_Name 396 (E_Identifier 397 ((*Del_Line*) 69) )) (E_Literal 398 (Integer_Literal 50) ) )
      (S_Sequence 399
      (S_Procedure_Call 400 401 ((*Is_Complete_Line*) 27) 
        ((E_Name 402 (E_Indexed_Component 403 (E_Identifier 404 ((*Cur_Board*) 8) ) (E_Name 405 (E_Identifier 406 ((*Del_Line*) 69) )) )) :: (E_Name 407 (E_Identifier 408 ((*R*) 71) )) :: nil)
      ) 
      (S_Sequence 409
      (S_If 410 (E_Name 411 (E_Identifier 412 ((*R*) 71) ))
        (S_Sequence 413
        (S_Assignment 414 (E_Indexed_Component 415 (E_Identifier 416 ((*Cur_Board*) 8) ) (E_Name 417 (E_Identifier 418 ((*Del_Line*) 69) )) ) (E_Name 419 (E_Identifier 420 ((*Empty_Line*) 66) ))) 
        (S_Sequence 421
        (S_Assignment 422 (E_Identifier 423 ((*Has_Complete_Lines*) 68) ) (E_Literal 424 (Boolean_Literal true) )) 
        (S_Assignment 425 (E_Identifier 426 ((*To_Line*) 67) ) (E_Name 427 (E_Identifier 428 ((*Del_Line*) 69) )))))
        S_Null
      ) 
      (S_Assignment 429 (E_Identifier 430 ((*Del_Line*) 69) ) (E_Binary_Operation 431 Plus (E_Name 432 (E_Identifier 433 ((*Del_Line*) 69) )) (E_Literal 434 (Integer_Literal 1) ) ))))
    ) 
    (S_Sequence 435
    (S_If 436 (E_Name 437 (E_Identifier 438 ((*Has_Complete_Lines*) 68) ))
      (S_Sequence 439
      (S_Assignment 440 (E_Identifier 441 ((*From_Line*) 70) ) (E_Literal 442 (Integer_Literal 9) )) 
      (S_While_Loop 443 (E_Binary_Operation 444 Greater_Than_Or_Equal (E_Name 445 (E_Identifier 446 ((*From_Line*) 70) )) (E_Literal 447 (Integer_Literal 1) ) )
        (S_Sequence 448
        (S_Procedure_Call 449 450 ((*Is_Empty_Line*) 28) 
          ((E_Name 451 (E_Indexed_Component 452 (E_Identifier 453 ((*Cur_Board*) 8) ) (E_Name 454 (E_Identifier 455 ((*From_Line*) 70) )) )) :: (E_Name 456 (E_Identifier 457 ((*R*) 71) )) :: nil)
        ) 
        (S_Sequence 458
        (S_If 459 (E_Unary_Operation 460 Not (E_Name 461 (E_Identifier 462 ((*R*) 71) )) )
          (S_Sequence 463
          (S_Assignment 464 (E_Indexed_Component 465 (E_Identifier 466 ((*Cur_Board*) 8) ) (E_Name 467 (E_Identifier 468 ((*To_Line*) 67) )) ) (E_Name 469 (E_Indexed_Component 470 (E_Identifier 471 ((*Cur_Board*) 8) ) (E_Name 472 (E_Identifier 473 ((*From_Line*) 70) )) ))) 
          (S_Sequence 474
          (S_Assignment 475 (E_Indexed_Component 476 (E_Identifier 477 ((*Cur_Board*) 8) ) (E_Name 478 (E_Identifier 479 ((*From_Line*) 70) )) ) (E_Name 480 (E_Identifier 481 ((*Empty_Line*) 66) ))) 
          (S_Assignment 482 (E_Identifier 483 ((*To_Line*) 67) ) (E_Binary_Operation 484 Minus (E_Name 485 (E_Identifier 486 ((*To_Line*) 67) )) (E_Literal 487 (Integer_Literal 1) ) ))))
          S_Null
        ) 
        (S_Assignment 488 (E_Identifier 489 ((*From_Line*) 70) ) (E_Binary_Operation 490 Minus (E_Name 491 (E_Identifier 492 ((*From_Line*) 70) )) (E_Literal 493 (Integer_Literal 1) ) ))))
      ))
      S_Null
    ) 
    (S_Assignment 494 (E_Identifier 495 ((*Cur_State*) 19) ) (E_Literal 496 (Integer_Literal 3) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Oriented_Three_Shape*) 23), (Array_Type_Declaration 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) :: (((*Y_Coord*) 5), (Subtype_Declaration 16 ((*Y_Coord*) 5) Integer (Range 1 50))) :: (((*Board*) 7), (Array_Type_Declaration 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) :: (((*Move_Action*) 32), (Subtype_Declaration 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (Range 0 1))) :: (((*Cell*) 1), (Derived_Type_Declaration 4 ((*Cell*) 1) Integer (Range 0 8))) :: (((*Line*) 6), (Array_Type_Declaration 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) :: (((*PY_Coord*) 10), (Subtype_Declaration 31 ((*PY_Coord*) 10) Integer (Range (-1) 49))) :: (((*Oriented_I_Shape*) 21), (Array_Type_Declaration 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) :: (((*Action*) 31), (Derived_Type_Declaration 69 ((*Action*) 31) Integer (Range 0 4))) :: (((*Direction*) 11), (Derived_Type_Declaration 34 ((*Direction*) 11) Integer (Range 0 3))) :: (((*Piece*) 12), (Record_Type_Declaration 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) :: (((*Shape*) 2), (Subtype_Declaration 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (Range 1 8))) :: (((*I_Delta*) 20), (Subtype_Declaration 50 ((*I_Delta*) 20) Integer (Range 0 3))) :: (((*State*) 18), (Derived_Type_Declaration 44 ((*State*) 18) Integer (Range 0 3))) :: (((*X_Coord*) 4), (Subtype_Declaration 13 ((*X_Coord*) 4) Integer (Range 1 10))) :: (((*Turn_Action*) 33), (Subtype_Declaration 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (Range 3 4))) :: (((*Three_Delta*) 22), (Subtype_Declaration 56 ((*Three_Delta*) 22) Integer (Range 0 2))) :: (((*Three_Shape*) 3), (Subtype_Declaration 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (Range 3 8))) :: (((*PX_Coord*) 9), (Subtype_Declaration 28 ((*PX_Coord*) 9) Integer (Range (-1) 9))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((218, (Subtype ((*PY_Coord*) 10))) :: (559, Boolean) :: (227, Integer) :: (568, Boolean) :: (433, (Subtype ((*Y_Coord*) 5))) :: (442, Integer) :: (200, (Record_Type ((*Piece*) 12))) :: (173, (Subtype ((*Shape*) 2))) :: (514, (Subtype ((*Turn_Action*) 33))) :: (209, (Subtype ((*Shape*) 2))) :: (523, (Derived_Type ((*Direction*) 11))) :: (182, (Record_Type ((*Piece*) 12))) :: (254, (Derived_Type ((*Direction*) 11))) :: (191, (Record_Type ((*Piece*) 12))) :: (720, (Record_Type ((*Piece*) 12))) :: (729, (Array_Type ((*Board*) 7))) :: (424, Boolean) :: (155, (Subtype ((*Shape*) 2))) :: (469, (Array_Type ((*Line*) 6))) :: (496, Integer) :: (164, (Record_Type ((*Piece*) 12))) :: (478, (Subtype ((*Y_Coord*) 5))) :: (505, Boolean) :: (577, Boolean) :: (451, (Array_Type ((*Line*) 6))) :: (460, Boolean) :: (532, Boolean) :: (541, (Derived_Type ((*Direction*) 11))) :: (406, (Subtype ((*Y_Coord*) 5))) :: (415, (Array_Type ((*Line*) 6))) :: (487, Integer) :: (236, (Record_Type ((*Piece*) 12))) :: (741, (Record_Type ((*Piece*) 12))) :: (678, (Subtype ((*PY_Coord*) 10))) :: (445, (Subtype ((*Y_Coord*) 5))) :: (732, (Record_Type ((*Piece*) 12))) :: (472, (Subtype ((*Y_Coord*) 5))) :: (427, (Subtype ((*Y_Coord*) 5))) :: (176, (Derived_Type ((*Cell*) 1))) :: (723, (Derived_Type ((*Action*) 31))) :: (418, (Subtype ((*Y_Coord*) 5))) :: (490, Integer) :: (185, (Subtype ((*PX_Coord*) 9))) :: (167, (Subtype ((*PX_Coord*) 9))) :: (364, (Subtype ((*I_Delta*) 20))) :: (140, Integer) :: (113, Boolean) :: (454, (Subtype ((*Y_Coord*) 5))) :: (481, (Array_Type ((*Line*) 6))) :: (687, (Derived_Type ((*Action*) 31))) :: (660, (Subtype ((*PX_Coord*) 9))) :: (346, (Subtype ((*PX_Coord*) 9))) :: (669, Integer) :: (708, (Record_Type ((*Piece*) 12))) :: (403, (Array_Type ((*Line*) 6))) :: (134, Boolean) :: (600, Integer) :: (609, Boolean) :: (690, (Record_Type ((*Piece*) 12))) :: (349, (Subtype ((*I_Delta*) 20))) :: (358, (Subtype ((*I_Delta*) 20))) :: (430, (Subtype ((*Y_Coord*) 5))) :: (672, (Record_Type ((*Piece*) 12))) :: (645, (Subtype ((*PX_Coord*) 9))) :: (331, Boolean) :: (304, (Subtype ((*I_Delta*) 20))) :: (654, Integer) :: (340, (Record_Type ((*Piece*) 12))) :: (89, Boolean) :: (286, (Subtype ((*Shape*) 2))) :: (627, Boolean) :: (636, Boolean) :: (457, Boolean) :: (663, (Subtype ((*PX_Coord*) 9))) :: (98, Boolean) :: (412, Boolean) :: (618, Boolean) :: (322, (Derived_Type ((*Direction*) 11))) :: (385, Integer) :: (567, Integer) :: (639, Integer) :: (648, (Subtype ((*PX_Coord*) 9))) :: (397, (Subtype ((*Y_Coord*) 5))) :: (262, Boolean) :: (603, (Derived_Type ((*Action*) 31))) :: (298, (Subtype ((*I_Delta*) 20))) :: (711, Boolean) :: (684, (Record_Type ((*Piece*) 12))) :: (343, (Subtype ((*I_Delta*) 20))) :: (352, (Subtype ((*Shape*) 2))) :: (558, Boolean) :: (585, Integer) :: (253, (Derived_Type ((*Direction*) 11))) :: (226, (Subtype ((*PX_Coord*) 9))) :: (594, Integer) :: (666, Boolean) :: (325, (Subtype ((*I_Delta*) 20))) :: (675, (Subtype ((*PY_Coord*) 10))) :: (334, (Derived_Type ((*Cell*) 1))) :: (540, (Derived_Type ((*Direction*) 11))) :: (235, (Subtype ((*Shape*) 2))) :: (621, (Subtype ((*PY_Coord*) 10))) :: (657, (Record_Type ((*Piece*) 12))) :: (316, (Subtype ((*Shape*) 2))) :: (271, Integer) :: (612, (Subtype ((*PY_Coord*) 10))) :: (280, (Subtype ((*PX_Coord*) 9))) :: (319, (Derived_Type ((*Direction*) 11))) :: (516, Integer) :: (552, Boolean) :: (184, Integer) :: (534, (Derived_Type ((*Direction*) 11))) :: (597, (Record_Type ((*Piece*) 12))) :: (265, Boolean) :: (615, Integer) :: (480, (Array_Type ((*Line*) 6))) :: (256, (Derived_Type ((*Direction*) 11))) :: (337, Integer) :: (211, (Subtype ((*Shape*) 2))) :: (283, (Subtype ((*I_Delta*) 20))) :: (624, Integer) :: (292, (Subtype ((*I_Delta*) 20))) :: (166, (Subtype ((*PX_Coord*) 9))) :: (579, (Derived_Type ((*Action*) 31))) :: (274, (Record_Type ((*Piece*) 12))) :: (247, (Subtype ((*I_Delta*) 20))) :: (588, (Record_Type ((*Piece*) 12))) :: (328, Boolean) :: (489, (Subtype ((*Y_Coord*) 5))) :: (220, (Subtype ((*PY_Coord*) 10))) :: (561, (Subtype ((*PX_Coord*) 9))) :: (229, (Subtype ((*Shape*) 2))) :: (543, (Derived_Type ((*Direction*) 11))) :: (570, (Subtype ((*PX_Coord*) 9))) :: (202, Integer) :: (238, Integer) :: (642, (Record_Type ((*Piece*) 12))) :: (651, Boolean) :: (310, (Subtype ((*I_Delta*) 20))) :: (277, (Subtype ((*I_Delta*) 20))) :: (483, (Subtype ((*Y_Coord*) 5))) :: (151, Boolean) :: (492, (Subtype ((*Y_Coord*) 5))) :: (223, (Subtype ((*PX_Coord*) 9))) :: (564, (Subtype ((*PX_Coord*) 9))) :: (259, (Subtype ((*I_Delta*) 20))) :: (573, (Subtype ((*PX_Coord*) 9))) :: (124, Boolean) :: (438, Boolean) :: (537, (Derived_Type ((*Direction*) 11))) :: (106, Boolean) :: (447, Integer) :: (205, (Record_Type ((*Piece*) 12))) :: (519, (Derived_Type ((*Direction*) 11))) :: (214, (Array_Type ((*Line*) 6))) :: (555, Integer) :: (528, (Derived_Type ((*Direction*) 11))) :: (420, (Array_Type ((*Line*) 6))) :: (160, (Array_Type ((*Line*) 6))) :: (169, (Subtype ((*PX_Coord*) 9))) :: (178, (Array_Type ((*Board*) 7))) :: (582, Boolean) :: (591, Integer) :: (456, Boolean) :: (465, (Array_Type ((*Line*) 6))) :: (187, (Record_Type ((*Piece*) 12))) :: (196, (Array_Type ((*Line*) 6))) :: (268, (Derived_Type ((*Cell*) 1))) :: (241, (Subtype ((*I_Delta*) 20))) :: (369, Integer) :: (441, (Subtype ((*Y_Coord*) 5))) :: (181, (Subtype ((*PY_Coord*) 10))) :: (163, (Subtype ((*PY_Coord*) 10))) :: (477, (Array_Type ((*Board*) 7))) :: (172, (Record_Type ((*Piece*) 12))) :: (513, Boolean) :: (432, (Subtype ((*Y_Coord*) 5))) :: (468, (Subtype ((*Y_Coord*) 5))) :: (199, (Subtype ((*PY_Coord*) 10))) :: (208, (Subtype ((*Shape*) 2))) :: (217, (Subtype ((*PY_Coord*) 10))) :: (683, (Derived_Type ((*Direction*) 11))) :: (423, Boolean) :: (495, (Derived_Type ((*State*) 18))) :: (190, (Subtype ((*Shape*) 2))) :: (504, Boolean) :: (737, Boolean) :: (396, (Subtype ((*Y_Coord*) 5))) :: (710, (Derived_Type ((*Action*) 31))) :: (746, Boolean) :: (405, (Subtype ((*Y_Coord*) 5))) :: (486, (Subtype ((*Y_Coord*) 5))) :: (154, (Record_Type ((*Piece*) 12))) :: (360, Integer) :: (740, (Record_Type ((*Piece*) 12))) :: (426, (Subtype ((*Y_Coord*) 5))) :: (408, Boolean) :: (300, Integer) :: (686, (Derived_Type ((*Action*) 31))) :: (623, (Subtype ((*PY_Coord*) 10))) :: (722, (Derived_Type ((*Action*) 31))) :: (381, Boolean) :: (354, (Subtype ((*Shape*) 2))) :: (471, (Array_Type ((*Board*) 7))) :: (677, (Record_Type ((*Piece*) 12))) :: (336, (Array_Type ((*Board*) 7))) :: (345, (Subtype ((*PX_Coord*) 9))) :: (641, (Subtype ((*PX_Coord*) 9))) :: (453, (Array_Type ((*Board*) 7))) :: (462, Boolean) :: (668, (Derived_Type ((*Action*) 31))) :: (363, Integer) :: (749, Boolean) :: (417, (Subtype ((*Y_Coord*) 5))) :: (444, Boolean) :: (309, (Subtype ((*I_Delta*) 20))) :: (659, Integer) :: (318, (Subtype ((*Shape*) 2))) :: (731, (Record_Type ((*Piece*) 12))) :: (327, Boolean) :: (357, Integer) :: (97, Boolean) :: (563, (Record_Type ((*Piece*) 12))) :: (653, (Derived_Type ((*Action*) 31))) :: (348, (Subtype ((*PX_Coord*) 9))) :: (734, Boolean) :: (402, (Array_Type ((*Line*) 6))) :: (294, Integer) :: (608, Boolean) :: (707, (Record_Type ((*Piece*) 12))) :: (644, Integer) :: (303, (Subtype ((*I_Delta*) 20))) :: (716, Boolean) :: (725, (Record_Type ((*Piece*) 12))) :: (411, Boolean) :: (276, (Subtype ((*I_Delta*) 20))) :: (249, Integer) :: (590, Integer) :: (285, (Subtype ((*Shape*) 2))) :: (258, (Subtype ((*I_Delta*) 20))) :: (599, Integer) :: (671, (Subtype ((*PY_Coord*) 10))) :: (339, (Subtype ((*PY_Coord*) 10))) :: (366, Integer) :: (572, (Record_Type ((*Piece*) 12))) :: (240, Boolean) :: (662, (Record_Type ((*Piece*) 12))) :: (321, (Record_Type ((*Piece*) 12))) :: (617, Integer) :: (689, (Derived_Type ((*Direction*) 11))) :: (521, Integer) :: (557, Boolean) :: (189, (Subtype ((*Shape*) 2))) :: (530, Integer) :: (225, (Record_Type ((*Piece*) 12))) :: (180, (Subtype ((*PY_Coord*) 10))) :: (674, Integer) :: (342, (Subtype ((*I_Delta*) 20))) :: (207, Integer) :: (216, Integer) :: (288, (Subtype ((*Shape*) 2))) :: (324, (Subtype ((*I_Delta*) 20))) :: (297, Integer) :: (638, (Derived_Type ((*Action*) 31))) :: (198, (Subtype ((*PY_Coord*) 10))) :: (270, (Array_Type ((*Board*) 7))) :: (584, Boolean) :: (611, (Subtype ((*PY_Coord*) 10))) :: (279, (Subtype ((*PX_Coord*) 9))) :: (593, Boolean) :: (620, (Subtype ((*PY_Coord*) 10))) :: (351, (Subtype ((*Shape*) 2))) :: (566, Integer) :: (261, Boolean) :: (234, (Subtype ((*Shape*) 2))) :: (575, Integer) :: (602, Boolean) :: (647, (Record_Type ((*Piece*) 12))) :: (243, Integer) :: (656, (Subtype ((*PX_Coord*) 9))) :: (315, (Subtype ((*Shape*) 2))) :: (282, (Subtype ((*PX_Coord*) 9))) :: (183, (Subtype ((*PY_Coord*) 10))) :: (587, (Subtype ((*PX_Coord*) 9))) :: (156, Integer) :: (255, (Record_Type ((*Piece*) 12))) :: (569, Integer) :: (596, (Subtype ((*PX_Coord*) 9))) :: (228, (Subtype ((*Shape*) 2))) :: (578, (Derived_Type ((*Action*) 31))) :: (461, Boolean) :: (470, (Array_Type ((*Line*) 6))) :: (452, (Array_Type ((*Line*) 6))) :: (479, (Subtype ((*Y_Coord*) 5))) :: (542, (Derived_Type ((*Direction*) 11))) :: (210, (Record_Type ((*Piece*) 12))) :: (560, Integer) :: (219, (Record_Type ((*Piece*) 12))) :: (291, Integer) :: (165, (Subtype ((*PY_Coord*) 10))) :: (515, (Subtype ((*Turn_Action*) 33))) :: (237, (Subtype ((*Shape*) 2))) :: (246, Boolean) :: (524, Integer) :: (192, (Subtype ((*Shape*) 2))) :: (533, (Derived_Type ((*Direction*) 11))) :: (201, (Subtype ((*PY_Coord*) 10))) :: (605, Integer) :: (273, (Subtype ((*PY_Coord*) 10))) :: (614, (Subtype ((*PY_Coord*) 10))) :: (186, (Subtype ((*PX_Coord*) 9))) :: (213, (Derived_Type ((*Cell*) 1))) :: (222, Integer) :: (437, Boolean) :: (168, (Record_Type ((*Piece*) 12))) :: (177, (Array_Type ((*Line*) 6))) :: (518, Boolean) :: (715, Boolean) :: (724, (Record_Type ((*Piece*) 12))) :: (733, Boolean) :: (159, (Derived_Type ((*Cell*) 1))) :: (473, (Subtype ((*Y_Coord*) 5))) :: (554, (Derived_Type ((*Action*) 31))) :: (105, Boolean) :: (419, (Array_Type ((*Line*) 6))) :: (446, (Subtype ((*Y_Coord*) 5))) :: (114, Boolean) :: (428, (Subtype ((*Y_Coord*) 5))) :: (455, (Subtype ((*Y_Coord*) 5))) :: (123, Boolean) :: (527, (Derived_Type ((*Direction*) 11))) :: (195, (Derived_Type ((*Cell*) 1))) :: (204, (Subtype ((*PX_Coord*) 9))) :: (742, (Record_Type ((*Piece*) 12))) :: (491, (Subtype ((*Y_Coord*) 5))) :: (231, (Subtype ((*Shape*) 2))) :: (332, Boolean) :: (745, Boolean) :: (90, Boolean) :: (404, (Array_Type ((*Board*) 7))) :: (431, Integer) :: (646, (Subtype ((*PX_Coord*) 9))) :: (395, Boolean) :: (682, (Derived_Type ((*Direction*) 11))) :: (341, (Subtype ((*PY_Coord*) 10))) :: (691, (Derived_Type ((*Direction*) 11))) :: (171, (Subtype ((*Shape*) 2))) :: (377, Integer) :: (144, Integer) :: (485, (Subtype ((*Y_Coord*) 5))) :: (153, (Subtype ((*Shape*) 2))) :: (467, (Subtype ((*Y_Coord*) 5))) :: (162, (Subtype ((*PY_Coord*) 10))) :: (359, (Subtype ((*I_Delta*) 20))) :: (673, (Subtype ((*PY_Coord*) 10))) :: (709, (Derived_Type ((*Action*) 31))) :: (368, (Derived_Type ((*State*) 18))) :: (135, Boolean) :: (476, (Array_Type ((*Line*) 6))) :: (350, (Subtype ((*I_Delta*) 20))) :: (664, Integer) :: (323, (Subtype ((*I_Delta*) 20))) :: (736, Boolean) :: (362, (Subtype ((*I_Delta*) 20))) :: (676, (Subtype ((*PY_Coord*) 10))) :: (272, (Subtype ((*PY_Coord*) 10))) :: (685, (Derived_Type ((*Direction*) 11))) :: (344, Integer) :: (658, (Subtype ((*PX_Coord*) 9))) :: (317, (Record_Type ((*Piece*) 12))) :: (353, (Record_Type ((*Piece*) 12))) :: (434, Integer) :: (326, (Subtype ((*I_Delta*) 20))) :: (299, (Subtype ((*I_Delta*) 20))) :: (335, (Array_Type ((*Line*) 6))) :: (649, Integer) :: (308, Boolean) :: (721, (Record_Type ((*Piece*) 12))) :: (730, (Array_Type ((*Board*) 7))) :: (416, (Array_Type ((*Board*) 7))) :: (281, (Record_Type ((*Piece*) 12))) :: (595, (Subtype ((*PX_Coord*) 9))) :: (622, (Record_Type ((*Piece*) 12))) :: (290, (Subtype ((*I_Delta*) 20))) :: (604, (Derived_Type ((*Action*) 31))) :: (712, Boolean) :: (586, (Subtype ((*PX_Coord*) 9))) :: (667, (Derived_Type ((*Action*) 31))) :: (398, Integer) :: (748, Boolean) :: (407, Boolean) :: (613, (Record_Type ((*Piece*) 12))) :: (356, (Subtype ((*I_Delta*) 20))) :: (562, (Subtype ((*PX_Coord*) 9))) :: (230, (Record_Type ((*Piece*) 12))) :: (257, (Subtype ((*I_Delta*) 20))) :: (598, (Subtype ((*PX_Coord*) 9))) :: (679, Integer) :: (338, (Subtype ((*PY_Coord*) 10))) :: (688, (Derived_Type ((*Direction*) 11))) :: (347, (Record_Type ((*Piece*) 12))) :: (553, (Derived_Type ((*Action*) 31))) :: (652, (Derived_Type ((*Action*) 31))) :: (248, (Subtype ((*I_Delta*) 20))) :: (221, Integer) :: (589, (Subtype ((*PX_Coord*) 9))) :: (661, (Subtype ((*PX_Coord*) 9))) :: (320, (Derived_Type ((*Direction*) 11))) :: (302, Boolean) :: (643, (Subtype ((*PX_Coord*) 9))) :: (535, Integer) :: (203, (Subtype ((*PX_Coord*) 9))) :: (544, Integer) :: (275, (Subtype ((*PY_Coord*) 10))) :: (616, Integer) :: (311, Integer) :: (284, (Subtype ((*I_Delta*) 20))) :: (625, Integer) :: (293, (Subtype ((*I_Delta*) 20))) :: (365, (Subtype ((*I_Delta*) 20))) :: (526, (Derived_Type ((*Direction*) 11))) :: (571, (Subtype ((*PX_Coord*) 9))) :: (266, Boolean) :: (580, Integer) :: (607, Boolean) :: (628, Boolean) :: (520, (Derived_Type ((*Direction*) 11))) :: (179, Integer) :: (152, (Subtype ((*Shape*) 2))) :: (493, Integer) :: (188, (Subtype ((*PX_Coord*) 9))) :: (592, Integer) :: (260, (Subtype ((*I_Delta*) 20))) :: (269, (Array_Type ((*Line*) 6))) :: (610, Integer) :: (170, (Subtype ((*Shape*) 2))) :: (484, Integer) :: (215, (Array_Type ((*Board*) 7))) :: (565, Integer) :: (466, (Array_Type ((*Board*) 7))) :: (287, (Record_Type ((*Piece*) 12))) :: (161, (Array_Type ((*Board*) 7))) :: (574, Integer) :: (242, (Subtype ((*I_Delta*) 20))) :: (583, Boolean) :: (529, (Derived_Type ((*Direction*) 11))) :: (197, (Array_Type ((*Board*) 7))) :: (224, (Subtype ((*PX_Coord*) 9))) :: (538, Integer) :: (296, (Subtype ((*I_Delta*) 20))) :: (206, (Subtype ((*PX_Coord*) 9))) :: (233, Boolean) :: (637, (Derived_Type ((*Action*) 31))) :: (305, Integer) :: (278, Integer) :: (619, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((218, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)24)) :: (559, (sloc (*Line*)178 (*Col*)8 (*EndLine*)178 (*EndCol*)22)) :: (227, (sloc (*Line*)74 (*Col*)46 (*EndLine*)74 (*EndCol*)46)) :: (568, (sloc (*Line*)178 (*Col*)28 (*EndLine*)178 (*EndCol*)41)) :: (433, (sloc (*Line*)125 (*Col*)22 (*EndLine*)125 (*EndCol*)29)) :: (442, (sloc (*Line*)131 (*Col*)16 (*EndLine*)131 (*EndCol*)16)) :: (200, (sloc (*Line*)73 (*Col*)14 (*EndLine*)73 (*EndCol*)22)) :: (173, (sloc (*Line*)71 (*Col*)62 (*EndLine*)71 (*EndCol*)62)) :: (514, (sloc (*Line*)159 (*Col*)10 (*EndLine*)159 (*EndCol*)10)) :: (209, (sloc (*Line*)73 (*Col*)52 (*EndLine*)73 (*EndCol*)62)) :: (523, (sloc (*Line*)161 (*Col*)6 (*EndLine*)161 (*EndCol*)6)) :: (182, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)22)) :: (254, (sloc (*Line*)78 (*Col*)28 (*EndLine*)78 (*EndCol*)38)) :: (191, (sloc (*Line*)72 (*Col*)52 (*EndLine*)72 (*EndCol*)60)) :: (720, (sloc (*Line*)212 (*Col*)9 (*EndLine*)212 (*EndCol*)17)) :: (729, (sloc (*Line*)214 (*Col*)15 (*EndLine*)214 (*EndCol*)23)) :: (424, (sloc (*Line*)122 (*Col*)35 (*EndLine*)122 (*EndCol*)38)) :: (155, (sloc (*Line*)70 (*Col*)20 (*EndLine*)70 (*EndCol*)20)) :: (469, (sloc (*Line*)135 (*Col*)39 (*EndLine*)135 (*EndCol*)59)) :: (496, (sloc (*Line*)145 (*Col*)20 (*EndLine*)145 (*EndCol*)20)) :: (164, (sloc (*Line*)71 (*Col*)14 (*EndLine*)71 (*EndCol*)22)) :: (478, (sloc (*Line*)136 (*Col*)27 (*EndLine*)136 (*EndCol*)35)) :: (505, (sloc (*Line*)154 (*Col*)12 (*EndLine*)154 (*EndCol*)15)) :: (577, (sloc (*Line*)179 (*Col*)13 (*EndLine*)179 (*EndCol*)17)) :: (451, (sloc (*Line*)133 (*Col*)21 (*EndLine*)133 (*EndCol*)41)) :: (460, (sloc (*Line*)134 (*Col*)16 (*EndLine*)134 (*EndCol*)20)) :: (532, (sloc (*Line*)166 (*Col*)6 (*EndLine*)166 (*EndCol*)10)) :: (541, (sloc (*Line*)169 (*Col*)11 (*EndLine*)169 (*EndCol*)15)) :: (406, (sloc (*Line*)119 (*Col*)32 (*EndLine*)119 (*EndCol*)39)) :: (415, (sloc (*Line*)121 (*Col*)13 (*EndLine*)121 (*EndCol*)32)) :: (487, (sloc (*Line*)137 (*Col*)37 (*EndLine*)137 (*EndCol*)37)) :: (236, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)21)) :: (741, (sloc (*Line*)216 (*Col*)26 (*EndLine*)216 (*EndCol*)34)) :: (678, (sloc (*Line*)195 (*Col*)12 (*EndLine*)195 (*EndCol*)12)) :: (445, (sloc (*Line*)132 (*Col*)16 (*EndLine*)132 (*EndCol*)24)) :: (732, (sloc (*Line*)214 (*Col*)26 (*EndLine*)214 (*EndCol*)34)) :: (472, (sloc (*Line*)135 (*Col*)50 (*EndLine*)135 (*EndCol*)58)) :: (427, (sloc (*Line*)123 (*Col*)24 (*EndLine*)123 (*EndCol*)31)) :: (176, (sloc (*Line*)72 (*Col*)3 (*EndLine*)72 (*EndCol*)43)) :: (723, (sloc (*Line*)212 (*Col*)20 (*EndLine*)212 (*EndCol*)20)) :: (418, (sloc (*Line*)121 (*Col*)24 (*EndLine*)121 (*EndCol*)31)) :: (490, (sloc (*Line*)139 (*Col*)19 (*EndLine*)139 (*EndCol*)31)) :: (185, (sloc (*Line*)72 (*Col*)32 (*EndLine*)72 (*EndCol*)42)) :: (167, (sloc (*Line*)71 (*Col*)28 (*EndLine*)71 (*EndCol*)38)) :: (364, (sloc (*Line*)95 (*Col*)11 (*EndLine*)95 (*EndCol*)11)) :: (140, (sloc (*Line*)66 (*Col*)22 (*EndLine*)66 (*EndCol*)22)) :: (113, (sloc (*Line*)48 (*Col*)7 (*EndLine*)48 (*EndCol*)7)) :: (454, (sloc (*Line*)133 (*Col*)32 (*EndLine*)133 (*EndCol*)40)) :: (481, (sloc (*Line*)136 (*Col*)41 (*EndLine*)136 (*EndCol*)50)) :: (687, (sloc (*Line*)197 (*Col*)24 (*EndLine*)197 (*EndCol*)24)) :: (660, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)12)) :: (346, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)44)) :: (669, (sloc (*Line*)194 (*Col*)17 (*EndLine*)194 (*EndCol*)17)) :: (708, (sloc (*Line*)210 (*Col*)25 (*EndLine*)210 (*EndCol*)33)) :: (403, (sloc (*Line*)119 (*Col*)21 (*EndLine*)119 (*EndCol*)40)) :: (134, (sloc (*Line*)58 (*Col*)7 (*EndLine*)58 (*EndCol*)7)) :: (600, (sloc (*Line*)180 (*Col*)41 (*EndLine*)180 (*EndCol*)41)) :: (609, (sloc (*Line*)182 (*Col*)8 (*EndLine*)182 (*EndCol*)22)) :: (690, (sloc (*Line*)197 (*Col*)27 (*EndLine*)197 (*EndCol*)27)) :: (349, (sloc (*Line*)91 (*Col*)48 (*EndLine*)91 (*EndCol*)48)) :: (358, (sloc (*Line*)93 (*Col*)14 (*EndLine*)93 (*EndCol*)14)) :: (430, (sloc (*Line*)125 (*Col*)10 (*EndLine*)125 (*EndCol*)17)) :: (672, (sloc (*Line*)195 (*Col*)3 (*EndLine*)195 (*EndCol*)3)) :: (645, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)12)) :: (331, (sloc (*Line*)90 (*Col*)12 (*EndLine*)90 (*EndCol*)12)) :: (304, (sloc (*Line*)87 (*Col*)9 (*EndLine*)87 (*EndCol*)9)) :: (654, (sloc (*Line*)192 (*Col*)17 (*EndLine*)192 (*EndCol*)17)) :: (340, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)24)) :: (89, (sloc (*Line*)33 (*Col*)7 (*EndLine*)33 (*EndCol*)7)) :: (286, (sloc (*Line*)80 (*Col*)54 (*EndLine*)80 (*EndCol*)64)) :: (627, (sloc (*Line*)184 (*Col*)3 (*EndLine*)184 (*EndCol*)3)) :: (636, (sloc (*Line*)190 (*Col*)10 (*EndLine*)190 (*EndCol*)14)) :: (457, (sloc (*Line*)133 (*Col*)44 (*EndLine*)133 (*EndCol*)44)) :: (663, (sloc (*Line*)193 (*Col*)12 (*EndLine*)193 (*EndCol*)12)) :: (98, (sloc (*Line*)38 (*Col*)12 (*EndLine*)38 (*EndCol*)15)) :: (412, (sloc (*Line*)120 (*Col*)13 (*EndLine*)120 (*EndCol*)13)) :: (618, (sloc (*Line*)182 (*Col*)28 (*EndLine*)182 (*EndCol*)42)) :: (322, (sloc (*Line*)89 (*Col*)55 (*EndLine*)89 (*EndCol*)55)) :: (385, (sloc (*Line*)112 (*Col*)29 (*EndLine*)112 (*EndCol*)29)) :: (567, (sloc (*Line*)178 (*Col*)22 (*EndLine*)178 (*EndCol*)22)) :: (639, (sloc (*Line*)190 (*Col*)14 (*EndLine*)190 (*EndCol*)14)) :: (648, (sloc (*Line*)191 (*Col*)12 (*EndLine*)191 (*EndCol*)12)) :: (397, (sloc (*Line*)118 (*Col*)13 (*EndLine*)118 (*EndCol*)20)) :: (262, (sloc (*Line*)78 (*Col*)47 (*EndLine*)78 (*EndCol*)47)) :: (603, (sloc (*Line*)181 (*Col*)13 (*EndLine*)181 (*EndCol*)13)) :: (298, (sloc (*Line*)84 (*Col*)11 (*EndLine*)84 (*EndCol*)11)) :: (711, (sloc (*Line*)210 (*Col*)39 (*EndLine*)210 (*EndCol*)48)) :: (684, (sloc (*Line*)197 (*Col*)19 (*EndLine*)197 (*EndCol*)19)) :: (343, (sloc (*Line*)91 (*Col*)30 (*EndLine*)91 (*EndCol*)30)) :: (352, (sloc (*Line*)91 (*Col*)54 (*EndLine*)91 (*EndCol*)64)) :: (558, (sloc (*Line*)178 (*Col*)8 (*EndLine*)178 (*EndCol*)41)) :: (585, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)15)) :: (253, (sloc (*Line*)78 (*Col*)28 (*EndLine*)78 (*EndCol*)38)) :: (226, (sloc (*Line*)74 (*Col*)42 (*EndLine*)74 (*EndCol*)42)) :: (594, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)35)) :: (666, (sloc (*Line*)194 (*Col*)13 (*EndLine*)194 (*EndCol*)17)) :: (325, (sloc (*Line*)89 (*Col*)61 (*EndLine*)89 (*EndCol*)61)) :: (675, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)12)) :: (334, (sloc (*Line*)91 (*Col*)5 (*EndLine*)91 (*EndCol*)49)) :: (540, (sloc (*Line*)169 (*Col*)6 (*EndLine*)169 (*EndCol*)6)) :: (235, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)23)) :: (621, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)31)) :: (657, (sloc (*Line*)193 (*Col*)3 (*EndLine*)193 (*EndCol*)3)) :: (316, (sloc (*Line*)89 (*Col*)32 (*EndLine*)89 (*EndCol*)42)) :: (271, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)30)) :: (612, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)11)) :: (280, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)44)) :: (319, (sloc (*Line*)89 (*Col*)45 (*EndLine*)89 (*EndCol*)55)) :: (516, (sloc (*Line*)159 (*Col*)14 (*EndLine*)159 (*EndCol*)14)) :: (552, (sloc (*Line*)177 (*Col*)10 (*EndLine*)177 (*EndCol*)14)) :: (184, (sloc (*Line*)72 (*Col*)28 (*EndLine*)72 (*EndCol*)28)) :: (534, (sloc (*Line*)166 (*Col*)6 (*EndLine*)166 (*EndCol*)6)) :: (597, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)29)) :: (265, (sloc (*Line*)79 (*Col*)12 (*EndLine*)79 (*EndCol*)12)) :: (615, (sloc (*Line*)182 (*Col*)15 (*EndLine*)182 (*EndCol*)15)) :: (480, (sloc (*Line*)136 (*Col*)41 (*EndLine*)136 (*EndCol*)50)) :: (256, (sloc (*Line*)78 (*Col*)38 (*EndLine*)78 (*EndCol*)38)) :: (337, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)30)) :: (211, (sloc (*Line*)73 (*Col*)62 (*EndLine*)73 (*EndCol*)62)) :: (283, (sloc (*Line*)80 (*Col*)48 (*EndLine*)80 (*EndCol*)48)) :: (624, (sloc (*Line*)182 (*Col*)35 (*EndLine*)182 (*EndCol*)35)) :: (292, (sloc (*Line*)82 (*Col*)14 (*EndLine*)82 (*EndCol*)14)) :: (166, (sloc (*Line*)71 (*Col*)28 (*EndLine*)71 (*EndCol*)38)) :: (579, (sloc (*Line*)179 (*Col*)13 (*EndLine*)179 (*EndCol*)13)) :: (274, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)24)) :: (247, (sloc (*Line*)77 (*Col*)12 (*EndLine*)77 (*EndCol*)12)) :: (588, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)9)) :: (328, (sloc (*Line*)89 (*Col*)64 (*EndLine*)89 (*EndCol*)64)) :: (489, (sloc (*Line*)139 (*Col*)6 (*EndLine*)139 (*EndCol*)14)) :: (220, (sloc (*Line*)74 (*Col*)24 (*EndLine*)74 (*EndCol*)24)) :: (561, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)11)) :: (229, (sloc (*Line*)74 (*Col*)52 (*EndLine*)74 (*EndCol*)62)) :: (543, (sloc (*Line*)169 (*Col*)11 (*EndLine*)169 (*EndCol*)11)) :: (570, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)31)) :: (202, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)42)) :: (238, (sloc (*Line*)75 (*Col*)27 (*EndLine*)75 (*EndCol*)27)) :: (642, (sloc (*Line*)191 (*Col*)3 (*EndLine*)191 (*EndCol*)3)) :: (651, (sloc (*Line*)192 (*Col*)13 (*EndLine*)192 (*EndCol*)17)) :: (310, (sloc (*Line*)88 (*Col*)12 (*EndLine*)88 (*EndCol*)12)) :: (277, (sloc (*Line*)80 (*Col*)30 (*EndLine*)80 (*EndCol*)30)) :: (483, (sloc (*Line*)137 (*Col*)16 (*EndLine*)137 (*EndCol*)22)) :: (151, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)24)) :: (492, (sloc (*Line*)139 (*Col*)19 (*EndLine*)139 (*EndCol*)27)) :: (223, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)42)) :: (564, (sloc (*Line*)178 (*Col*)11 (*EndLine*)178 (*EndCol*)11)) :: (259, (sloc (*Line*)78 (*Col*)44 (*EndLine*)78 (*EndCol*)44)) :: (573, (sloc (*Line*)178 (*Col*)31 (*EndLine*)178 (*EndCol*)31)) :: (124, (sloc (*Line*)53 (*Col*)12 (*EndLine*)53 (*EndCol*)15)) :: (438, (sloc (*Line*)130 (*Col*)10 (*EndLine*)130 (*EndCol*)27)) :: (537, (sloc (*Line*)167 (*Col*)6 (*EndLine*)167 (*EndCol*)6)) :: (106, (sloc (*Line*)43 (*Col*)12 (*EndLine*)43 (*EndCol*)15)) :: (447, (sloc (*Line*)132 (*Col*)29 (*EndLine*)132 (*EndCol*)29)) :: (205, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)36)) :: (519, (sloc (*Line*)160 (*Col*)6 (*EndLine*)160 (*EndCol*)6)) :: (214, (sloc (*Line*)74 (*Col*)3 (*EndLine*)74 (*EndCol*)29)) :: (555, (sloc (*Line*)177 (*Col*)14 (*EndLine*)177 (*EndCol*)14)) :: (528, (sloc (*Line*)163 (*Col*)11 (*EndLine*)163 (*EndCol*)11)) :: (420, (sloc (*Line*)121 (*Col*)37 (*EndLine*)121 (*EndCol*)46)) :: (160, (sloc (*Line*)71 (*Col*)3 (*EndLine*)71 (*EndCol*)25)) :: (169, (sloc (*Line*)71 (*Col*)38 (*EndLine*)71 (*EndCol*)38)) :: (178, (sloc (*Line*)72 (*Col*)3 (*EndLine*)72 (*EndCol*)11)) :: (582, (sloc (*Line*)180 (*Col*)3 (*EndLine*)180 (*EndCol*)3)) :: (591, (sloc (*Line*)180 (*Col*)21 (*EndLine*)180 (*EndCol*)22)) :: (456, (sloc (*Line*)133 (*Col*)44 (*EndLine*)133 (*EndCol*)44)) :: (465, (sloc (*Line*)135 (*Col*)16 (*EndLine*)135 (*EndCol*)34)) :: (187, (sloc (*Line*)72 (*Col*)32 (*EndLine*)72 (*EndCol*)40)) :: (196, (sloc (*Line*)73 (*Col*)3 (*EndLine*)73 (*EndCol*)25)) :: (268, (sloc (*Line*)80 (*Col*)5 (*EndLine*)80 (*EndCol*)49)) :: (241, (sloc (*Line*)76 (*Col*)9 (*EndLine*)76 (*EndCol*)9)) :: (369, (sloc (*Line*)101 (*Col*)20 (*EndLine*)101 (*EndCol*)20)) :: (441, (sloc (*Line*)131 (*Col*)3 (*EndLine*)131 (*EndCol*)11)) :: (181, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)24)) :: (163, (sloc (*Line*)71 (*Col*)14 (*EndLine*)71 (*EndCol*)24)) :: (477, (sloc (*Line*)136 (*Col*)16 (*EndLine*)136 (*EndCol*)24)) :: (172, (sloc (*Line*)71 (*Col*)52 (*EndLine*)71 (*EndCol*)60)) :: (513, (sloc (*Line*)159 (*Col*)10 (*EndLine*)159 (*EndCol*)14)) :: (432, (sloc (*Line*)125 (*Col*)22 (*EndLine*)125 (*EndCol*)29)) :: (468, (sloc (*Line*)135 (*Col*)27 (*EndLine*)135 (*EndCol*)33)) :: (199, (sloc (*Line*)73 (*Col*)14 (*EndLine*)73 (*EndCol*)24)) :: (208, (sloc (*Line*)73 (*Col*)52 (*EndLine*)73 (*EndCol*)62)) :: (217, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)24)) :: (683, (sloc (*Line*)197 (*Col*)19 (*EndLine*)197 (*EndCol*)21)) :: (423, (sloc (*Line*)122 (*Col*)13 (*EndLine*)122 (*EndCol*)30)) :: (495, (sloc (*Line*)145 (*Col*)7 (*EndLine*)145 (*EndCol*)15)) :: (190, (sloc (*Line*)72 (*Col*)52 (*EndLine*)72 (*EndCol*)62)) :: (504, (sloc (*Line*)154 (*Col*)7 (*EndLine*)154 (*EndCol*)7)) :: (737, (sloc (*Line*)215 (*Col*)13 (*EndLine*)215 (*EndCol*)25)) :: (396, (sloc (*Line*)118 (*Col*)13 (*EndLine*)118 (*EndCol*)20)) :: (710, (sloc (*Line*)210 (*Col*)36 (*EndLine*)210 (*EndCol*)36)) :: (746, (sloc (*Line*)217 (*Col*)24 (*EndLine*)217 (*EndCol*)27)) :: (405, (sloc (*Line*)119 (*Col*)32 (*EndLine*)119 (*EndCol*)39)) :: (486, (sloc (*Line*)137 (*Col*)27 (*EndLine*)137 (*EndCol*)33)) :: (154, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)18)) :: (360, (sloc (*Line*)93 (*Col*)18 (*EndLine*)93 (*EndCol*)18)) :: (740, (sloc (*Line*)216 (*Col*)13 (*EndLine*)216 (*EndCol*)21)) :: (426, (sloc (*Line*)123 (*Col*)13 (*EndLine*)123 (*EndCol*)19)) :: (408, (sloc (*Line*)119 (*Col*)43 (*EndLine*)119 (*EndCol*)43)) :: (300, (sloc (*Line*)84 (*Col*)15 (*EndLine*)84 (*EndCol*)15)) :: (686, (sloc (*Line*)197 (*Col*)24 (*EndLine*)197 (*EndCol*)24)) :: (623, (sloc (*Line*)182 (*Col*)31 (*EndLine*)182 (*EndCol*)31)) :: (722, (sloc (*Line*)212 (*Col*)20 (*EndLine*)212 (*EndCol*)20)) :: (381, (sloc (*Line*)111 (*Col*)39 (*EndLine*)111 (*EndCol*)43)) :: (354, (sloc (*Line*)91 (*Col*)64 (*EndLine*)91 (*EndCol*)64)) :: (471, (sloc (*Line*)135 (*Col*)39 (*EndLine*)135 (*EndCol*)47)) :: (677, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)10)) :: (336, (sloc (*Line*)91 (*Col*)5 (*EndLine*)91 (*EndCol*)13)) :: (345, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)44)) :: (641, (sloc (*Line*)191 (*Col*)3 (*EndLine*)191 (*EndCol*)5)) :: (453, (sloc (*Line*)133 (*Col*)21 (*EndLine*)133 (*EndCol*)29)) :: (462, (sloc (*Line*)134 (*Col*)20 (*EndLine*)134 (*EndCol*)20)) :: (668, (sloc (*Line*)194 (*Col*)13 (*EndLine*)194 (*EndCol*)13)) :: (363, (sloc (*Line*)95 (*Col*)11 (*EndLine*)95 (*EndCol*)15)) :: (749, (sloc (*Line*)222 (*Col*)18 (*EndLine*)222 (*EndCol*)22)) :: (417, (sloc (*Line*)121 (*Col*)24 (*EndLine*)121 (*EndCol*)31)) :: (444, (sloc (*Line*)132 (*Col*)16 (*EndLine*)132 (*EndCol*)29)) :: (309, (sloc (*Line*)88 (*Col*)12 (*EndLine*)88 (*EndCol*)12)) :: (659, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)16)) :: (318, (sloc (*Line*)89 (*Col*)42 (*EndLine*)89 (*EndCol*)42)) :: (731, (sloc (*Line*)214 (*Col*)26 (*EndLine*)214 (*EndCol*)34)) :: (327, (sloc (*Line*)89 (*Col*)64 (*EndLine*)89 (*EndCol*)64)) :: (357, (sloc (*Line*)93 (*Col*)14 (*EndLine*)93 (*EndCol*)18)) :: (97, (sloc (*Line*)38 (*Col*)7 (*EndLine*)38 (*EndCol*)7)) :: (563, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)9)) :: (653, (sloc (*Line*)192 (*Col*)13 (*EndLine*)192 (*EndCol*)13)) :: (348, (sloc (*Line*)91 (*Col*)44 (*EndLine*)91 (*EndCol*)44)) :: (734, (sloc (*Line*)214 (*Col*)37 (*EndLine*)214 (*EndCol*)49)) :: (402, (sloc (*Line*)119 (*Col*)21 (*EndLine*)119 (*EndCol*)40)) :: (294, (sloc (*Line*)82 (*Col*)18 (*EndLine*)82 (*EndCol*)18)) :: (608, (sloc (*Line*)182 (*Col*)8 (*EndLine*)182 (*EndCol*)42)) :: (707, (sloc (*Line*)210 (*Col*)25 (*EndLine*)210 (*EndCol*)33)) :: (644, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)16)) :: (303, (sloc (*Line*)87 (*Col*)9 (*EndLine*)87 (*EndCol*)9)) :: (716, (sloc (*Line*)211 (*Col*)10 (*EndLine*)211 (*EndCol*)19)) :: (725, (sloc (*Line*)212 (*Col*)23 (*EndLine*)212 (*EndCol*)31)) :: (411, (sloc (*Line*)120 (*Col*)13 (*EndLine*)120 (*EndCol*)13)) :: (276, (sloc (*Line*)80 (*Col*)30 (*EndLine*)80 (*EndCol*)30)) :: (249, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)17)) :: (590, (sloc (*Line*)180 (*Col*)15 (*EndLine*)180 (*EndCol*)15)) :: (285, (sloc (*Line*)80 (*Col*)54 (*EndLine*)80 (*EndCol*)64)) :: (258, (sloc (*Line*)78 (*Col*)41 (*EndLine*)78 (*EndCol*)41)) :: (599, (sloc (*Line*)180 (*Col*)35 (*EndLine*)180 (*EndCol*)35)) :: (671, (sloc (*Line*)195 (*Col*)3 (*EndLine*)195 (*EndCol*)5)) :: (339, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)26)) :: (366, (sloc (*Line*)95 (*Col*)15 (*EndLine*)95 (*EndCol*)15)) :: (572, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)29)) :: (240, (sloc (*Line*)76 (*Col*)9 (*EndLine*)76 (*EndCol*)14)) :: (662, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)10)) :: (321, (sloc (*Line*)89 (*Col*)45 (*EndLine*)89 (*EndCol*)53)) :: (617, (sloc (*Line*)182 (*Col*)22 (*EndLine*)182 (*EndCol*)22)) :: (689, (sloc (*Line*)197 (*Col*)27 (*EndLine*)197 (*EndCol*)29)) :: (521, (sloc (*Line*)160 (*Col*)10 (*EndLine*)160 (*EndCol*)10)) :: (557, (sloc (*Line*)178 (*Col*)3 (*EndLine*)178 (*EndCol*)3)) :: (189, (sloc (*Line*)72 (*Col*)52 (*EndLine*)72 (*EndCol*)62)) :: (530, (sloc (*Line*)163 (*Col*)15 (*EndLine*)163 (*EndCol*)15)) :: (225, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)40)) :: (180, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)24)) :: (674, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)16)) :: (342, (sloc (*Line*)91 (*Col*)30 (*EndLine*)91 (*EndCol*)30)) :: (207, (sloc (*Line*)73 (*Col*)42 (*EndLine*)73 (*EndCol*)42)) :: (216, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)28)) :: (288, (sloc (*Line*)80 (*Col*)64 (*EndLine*)80 (*EndCol*)64)) :: (324, (sloc (*Line*)89 (*Col*)58 (*EndLine*)89 (*EndCol*)58)) :: (297, (sloc (*Line*)84 (*Col*)11 (*EndLine*)84 (*EndCol*)15)) :: (638, (sloc (*Line*)190 (*Col*)10 (*EndLine*)190 (*EndCol*)10)) :: (198, (sloc (*Line*)73 (*Col*)14 (*EndLine*)73 (*EndCol*)24)) :: (270, (sloc (*Line*)80 (*Col*)5 (*EndLine*)80 (*EndCol*)13)) :: (584, (sloc (*Line*)180 (*Col*)8 (*EndLine*)180 (*EndCol*)22)) :: (611, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)11)) :: (279, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)44)) :: (593, (sloc (*Line*)180 (*Col*)28 (*EndLine*)180 (*EndCol*)41)) :: (620, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)31)) :: (351, (sloc (*Line*)91 (*Col*)54 (*EndLine*)91 (*EndCol*)64)) :: (566, (sloc (*Line*)178 (*Col*)21 (*EndLine*)178 (*EndCol*)22)) :: (261, (sloc (*Line*)78 (*Col*)47 (*EndLine*)78 (*EndCol*)47)) :: (234, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)23)) :: (575, (sloc (*Line*)178 (*Col*)41 (*EndLine*)178 (*EndCol*)41)) :: (602, (sloc (*Line*)181 (*Col*)13 (*EndLine*)181 (*EndCol*)17)) :: (647, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)10)) :: (243, (sloc (*Line*)76 (*Col*)14 (*EndLine*)76 (*EndCol*)14)) :: (656, (sloc (*Line*)193 (*Col*)3 (*EndLine*)193 (*EndCol*)5)) :: (315, (sloc (*Line*)89 (*Col*)32 (*EndLine*)89 (*EndCol*)42)) :: (282, (sloc (*Line*)80 (*Col*)44 (*EndLine*)80 (*EndCol*)44)) :: (183, (sloc (*Line*)72 (*Col*)24 (*EndLine*)72 (*EndCol*)24)) :: (587, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)11)) :: (156, (sloc (*Line*)70 (*Col*)24 (*EndLine*)70 (*EndCol*)24)) :: (255, (sloc (*Line*)78 (*Col*)28 (*EndLine*)78 (*EndCol*)36)) :: (569, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)35)) :: (596, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)31)) :: (228, (sloc (*Line*)74 (*Col*)52 (*EndLine*)74 (*EndCol*)62)) :: (578, (sloc (*Line*)179 (*Col*)13 (*EndLine*)179 (*EndCol*)13)) :: (461, (sloc (*Line*)134 (*Col*)20 (*EndLine*)134 (*EndCol*)20)) :: (470, (sloc (*Line*)135 (*Col*)39 (*EndLine*)135 (*EndCol*)59)) :: (452, (sloc (*Line*)133 (*Col*)21 (*EndLine*)133 (*EndCol*)41)) :: (479, (sloc (*Line*)136 (*Col*)27 (*EndLine*)136 (*EndCol*)35)) :: (542, (sloc (*Line*)169 (*Col*)11 (*EndLine*)169 (*EndCol*)11)) :: (210, (sloc (*Line*)73 (*Col*)52 (*EndLine*)73 (*EndCol*)60)) :: (560, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)15)) :: (219, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)22)) :: (291, (sloc (*Line*)82 (*Col*)14 (*EndLine*)82 (*EndCol*)18)) :: (165, (sloc (*Line*)71 (*Col*)24 (*EndLine*)71 (*EndCol*)24)) :: (515, (sloc (*Line*)159 (*Col*)10 (*EndLine*)159 (*EndCol*)10)) :: (237, (sloc (*Line*)75 (*Col*)23 (*EndLine*)75 (*EndCol*)23)) :: (246, (sloc (*Line*)77 (*Col*)12 (*EndLine*)77 (*EndCol*)17)) :: (524, (sloc (*Line*)161 (*Col*)11 (*EndLine*)161 (*EndCol*)11)) :: (192, (sloc (*Line*)72 (*Col*)62 (*EndLine*)72 (*EndCol*)62)) :: (533, (sloc (*Line*)166 (*Col*)6 (*EndLine*)166 (*EndCol*)6)) :: (201, (sloc (*Line*)73 (*Col*)24 (*EndLine*)73 (*EndCol*)24)) :: (605, (sloc (*Line*)181 (*Col*)17 (*EndLine*)181 (*EndCol*)17)) :: (273, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)26)) :: (614, (sloc (*Line*)182 (*Col*)11 (*EndLine*)182 (*EndCol*)11)) :: (186, (sloc (*Line*)72 (*Col*)32 (*EndLine*)72 (*EndCol*)42)) :: (213, (sloc (*Line*)74 (*Col*)3 (*EndLine*)74 (*EndCol*)47)) :: (222, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)46)) :: (437, (sloc (*Line*)130 (*Col*)10 (*EndLine*)130 (*EndCol*)27)) :: (168, (sloc (*Line*)71 (*Col*)28 (*EndLine*)71 (*EndCol*)36)) :: (177, (sloc (*Line*)72 (*Col*)3 (*EndLine*)72 (*EndCol*)29)) :: (518, (sloc (*Line*)160 (*Col*)6 (*EndLine*)160 (*EndCol*)10)) :: (715, (sloc (*Line*)211 (*Col*)10 (*EndLine*)211 (*EndCol*)19)) :: (724, (sloc (*Line*)212 (*Col*)23 (*EndLine*)212 (*EndCol*)31)) :: (733, (sloc (*Line*)214 (*Col*)37 (*EndLine*)214 (*EndCol*)49)) :: (159, (sloc (*Line*)71 (*Col*)3 (*EndLine*)71 (*EndCol*)39)) :: (473, (sloc (*Line*)135 (*Col*)50 (*EndLine*)135 (*EndCol*)58)) :: (554, (sloc (*Line*)177 (*Col*)10 (*EndLine*)177 (*EndCol*)10)) :: (105, (sloc (*Line*)43 (*Col*)7 (*EndLine*)43 (*EndCol*)7)) :: (419, (sloc (*Line*)121 (*Col*)37 (*EndLine*)121 (*EndCol*)46)) :: (446, (sloc (*Line*)132 (*Col*)16 (*EndLine*)132 (*EndCol*)24)) :: (114, (sloc (*Line*)48 (*Col*)12 (*EndLine*)48 (*EndCol*)15)) :: (428, (sloc (*Line*)123 (*Col*)24 (*EndLine*)123 (*EndCol*)31)) :: (455, (sloc (*Line*)133 (*Col*)32 (*EndLine*)133 (*EndCol*)40)) :: (123, (sloc (*Line*)53 (*Col*)7 (*EndLine*)53 (*EndCol*)7)) :: (527, (sloc (*Line*)163 (*Col*)11 (*EndLine*)163 (*EndCol*)15)) :: (195, (sloc (*Line*)73 (*Col*)3 (*EndLine*)73 (*EndCol*)43)) :: (204, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)38)) :: (742, (sloc (*Line*)216 (*Col*)26 (*EndLine*)216 (*EndCol*)34)) :: (491, (sloc (*Line*)139 (*Col*)19 (*EndLine*)139 (*EndCol*)27)) :: (231, (sloc (*Line*)74 (*Col*)62 (*EndLine*)74 (*EndCol*)62)) :: (332, (sloc (*Line*)90 (*Col*)12 (*EndLine*)90 (*EndCol*)12)) :: (745, (sloc (*Line*)217 (*Col*)13 (*EndLine*)217 (*EndCol*)19)) :: (90, (sloc (*Line*)33 (*Col*)12 (*EndLine*)33 (*EndCol*)15)) :: (404, (sloc (*Line*)119 (*Col*)21 (*EndLine*)119 (*EndCol*)29)) :: (431, (sloc (*Line*)125 (*Col*)22 (*EndLine*)125 (*EndCol*)33)) :: (646, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)12)) :: (395, (sloc (*Line*)118 (*Col*)13 (*EndLine*)118 (*EndCol*)26)) :: (682, (sloc (*Line*)197 (*Col*)19 (*EndLine*)197 (*EndCol*)21)) :: (341, (sloc (*Line*)91 (*Col*)26 (*EndLine*)91 (*EndCol*)26)) :: (691, (sloc (*Line*)197 (*Col*)29 (*EndLine*)197 (*EndCol*)29)) :: (171, (sloc (*Line*)71 (*Col*)52 (*EndLine*)71 (*EndCol*)62)) :: (377, (sloc (*Line*)110 (*Col*)28 (*EndLine*)110 (*EndCol*)29)) :: (144, (sloc (*Line*)67 (*Col*)22 (*EndLine*)67 (*EndCol*)22)) :: (485, (sloc (*Line*)137 (*Col*)27 (*EndLine*)137 (*EndCol*)33)) :: (153, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)20)) :: (467, (sloc (*Line*)135 (*Col*)27 (*EndLine*)135 (*EndCol*)33)) :: (162, (sloc (*Line*)71 (*Col*)14 (*EndLine*)71 (*EndCol*)24)) :: (359, (sloc (*Line*)93 (*Col*)14 (*EndLine*)93 (*EndCol*)14)) :: (673, (sloc (*Line*)195 (*Col*)5 (*EndLine*)195 (*EndCol*)5)) :: (709, (sloc (*Line*)210 (*Col*)36 (*EndLine*)210 (*EndCol*)36)) :: (368, (sloc (*Line*)101 (*Col*)7 (*EndLine*)101 (*EndCol*)15)) :: (135, (sloc (*Line*)58 (*Col*)12 (*EndLine*)58 (*EndCol*)15)) :: (476, (sloc (*Line*)136 (*Col*)16 (*EndLine*)136 (*EndCol*)36)) :: (350, (sloc (*Line*)91 (*Col*)48 (*EndLine*)91 (*EndCol*)48)) :: (664, (sloc (*Line*)193 (*Col*)16 (*EndLine*)193 (*EndCol*)16)) :: (323, (sloc (*Line*)89 (*Col*)58 (*EndLine*)89 (*EndCol*)58)) :: (736, (sloc (*Line*)215 (*Col*)13 (*EndLine*)215 (*EndCol*)25)) :: (362, (sloc (*Line*)95 (*Col*)6 (*EndLine*)95 (*EndCol*)6)) :: (676, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)12)) :: (272, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)26)) :: (685, (sloc (*Line*)197 (*Col*)21 (*EndLine*)197 (*EndCol*)21)) :: (344, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)48)) :: (658, (sloc (*Line*)193 (*Col*)5 (*EndLine*)193 (*EndCol*)5)) :: (317, (sloc (*Line*)89 (*Col*)32 (*EndLine*)89 (*EndCol*)40)) :: (353, (sloc (*Line*)91 (*Col*)54 (*EndLine*)91 (*EndCol*)62)) :: (434, (sloc (*Line*)125 (*Col*)33 (*EndLine*)125 (*EndCol*)33)) :: (326, (sloc (*Line*)89 (*Col*)61 (*EndLine*)89 (*EndCol*)61)) :: (299, (sloc (*Line*)84 (*Col*)11 (*EndLine*)84 (*EndCol*)11)) :: (335, (sloc (*Line*)91 (*Col*)5 (*EndLine*)91 (*EndCol*)31)) :: (649, (sloc (*Line*)191 (*Col*)16 (*EndLine*)191 (*EndCol*)16)) :: (308, (sloc (*Line*)88 (*Col*)12 (*EndLine*)88 (*EndCol*)17)) :: (721, (sloc (*Line*)212 (*Col*)9 (*EndLine*)212 (*EndCol*)17)) :: (730, (sloc (*Line*)214 (*Col*)15 (*EndLine*)214 (*EndCol*)23)) :: (416, (sloc (*Line*)121 (*Col*)13 (*EndLine*)121 (*EndCol*)21)) :: (281, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)42)) :: (595, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)31)) :: (622, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)29)) :: (290, (sloc (*Line*)82 (*Col*)9 (*EndLine*)82 (*EndCol*)9)) :: (604, (sloc (*Line*)181 (*Col*)13 (*EndLine*)181 (*EndCol*)13)) :: (712, (sloc (*Line*)210 (*Col*)39 (*EndLine*)210 (*EndCol*)48)) :: (586, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)11)) :: (667, (sloc (*Line*)194 (*Col*)13 (*EndLine*)194 (*EndCol*)13)) :: (398, (sloc (*Line*)118 (*Col*)25 (*EndLine*)118 (*EndCol*)26)) :: (748, (sloc (*Line*)222 (*Col*)7 (*EndLine*)222 (*EndCol*)13)) :: (407, (sloc (*Line*)119 (*Col*)43 (*EndLine*)119 (*EndCol*)43)) :: (613, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)9)) :: (356, (sloc (*Line*)93 (*Col*)9 (*EndLine*)93 (*EndCol*)9)) :: (562, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)11)) :: (230, (sloc (*Line*)74 (*Col*)52 (*EndLine*)74 (*EndCol*)60)) :: (257, (sloc (*Line*)78 (*Col*)41 (*EndLine*)78 (*EndCol*)41)) :: (598, (sloc (*Line*)180 (*Col*)31 (*EndLine*)180 (*EndCol*)31)) :: (679, (sloc (*Line*)195 (*Col*)16 (*EndLine*)195 (*EndCol*)16)) :: (338, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)26)) :: (688, (sloc (*Line*)197 (*Col*)27 (*EndLine*)197 (*EndCol*)29)) :: (347, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)42)) :: (553, (sloc (*Line*)177 (*Col*)10 (*EndLine*)177 (*EndCol*)10)) :: (652, (sloc (*Line*)192 (*Col*)13 (*EndLine*)192 (*EndCol*)13)) :: (248, (sloc (*Line*)77 (*Col*)12 (*EndLine*)77 (*EndCol*)12)) :: (221, (sloc (*Line*)74 (*Col*)28 (*EndLine*)74 (*EndCol*)28)) :: (589, (sloc (*Line*)180 (*Col*)11 (*EndLine*)180 (*EndCol*)11)) :: (661, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)12)) :: (320, (sloc (*Line*)89 (*Col*)45 (*EndLine*)89 (*EndCol*)55)) :: (302, (sloc (*Line*)87 (*Col*)9 (*EndLine*)87 (*EndCol*)14)) :: (643, (sloc (*Line*)191 (*Col*)5 (*EndLine*)191 (*EndCol*)5)) :: (535, (sloc (*Line*)166 (*Col*)10 (*EndLine*)166 (*EndCol*)10)) :: (203, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)38)) :: (544, (sloc (*Line*)169 (*Col*)15 (*EndLine*)169 (*EndCol*)15)) :: (275, (sloc (*Line*)80 (*Col*)26 (*EndLine*)80 (*EndCol*)26)) :: (616, (sloc (*Line*)182 (*Col*)21 (*EndLine*)182 (*EndCol*)22)) :: (311, (sloc (*Line*)88 (*Col*)17 (*EndLine*)88 (*EndCol*)17)) :: (284, (sloc (*Line*)80 (*Col*)48 (*EndLine*)80 (*EndCol*)48)) :: (625, (sloc (*Line*)182 (*Col*)41 (*EndLine*)182 (*EndCol*)42)) :: (293, (sloc (*Line*)82 (*Col*)14 (*EndLine*)82 (*EndCol*)14)) :: (365, (sloc (*Line*)95 (*Col*)11 (*EndLine*)95 (*EndCol*)11)) :: (526, (sloc (*Line*)163 (*Col*)6 (*EndLine*)163 (*EndCol*)6)) :: (571, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)31)) :: (266, (sloc (*Line*)79 (*Col*)12 (*EndLine*)79 (*EndCol*)12)) :: (580, (sloc (*Line*)179 (*Col*)17 (*EndLine*)179 (*EndCol*)17)) :: (607, (sloc (*Line*)182 (*Col*)3 (*EndLine*)182 (*EndCol*)3)) :: (628, (sloc (*Line*)184 (*Col*)8 (*EndLine*)184 (*EndCol*)11)) :: (520, (sloc (*Line*)160 (*Col*)6 (*EndLine*)160 (*EndCol*)6)) :: (179, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)28)) :: (152, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)20)) :: (493, (sloc (*Line*)139 (*Col*)31 (*EndLine*)139 (*EndCol*)31)) :: (188, (sloc (*Line*)72 (*Col*)42 (*EndLine*)72 (*EndCol*)42)) :: (592, (sloc (*Line*)180 (*Col*)22 (*EndLine*)180 (*EndCol*)22)) :: (260, (sloc (*Line*)78 (*Col*)44 (*EndLine*)78 (*EndCol*)44)) :: (269, (sloc (*Line*)80 (*Col*)5 (*EndLine*)80 (*EndCol*)31)) :: (610, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)15)) :: (170, (sloc (*Line*)71 (*Col*)52 (*EndLine*)71 (*EndCol*)62)) :: (484, (sloc (*Line*)137 (*Col*)27 (*EndLine*)137 (*EndCol*)37)) :: (215, (sloc (*Line*)74 (*Col*)3 (*EndLine*)74 (*EndCol*)11)) :: (565, (sloc (*Line*)178 (*Col*)15 (*EndLine*)178 (*EndCol*)15)) :: (466, (sloc (*Line*)135 (*Col*)16 (*EndLine*)135 (*EndCol*)24)) :: (287, (sloc (*Line*)80 (*Col*)54 (*EndLine*)80 (*EndCol*)62)) :: (161, (sloc (*Line*)71 (*Col*)3 (*EndLine*)71 (*EndCol*)11)) :: (574, (sloc (*Line*)178 (*Col*)35 (*EndLine*)178 (*EndCol*)35)) :: (242, (sloc (*Line*)76 (*Col*)9 (*EndLine*)76 (*EndCol*)9)) :: (583, (sloc (*Line*)180 (*Col*)8 (*EndLine*)180 (*EndCol*)41)) :: (529, (sloc (*Line*)163 (*Col*)11 (*EndLine*)163 (*EndCol*)11)) :: (197, (sloc (*Line*)73 (*Col*)3 (*EndLine*)73 (*EndCol*)11)) :: (224, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)42)) :: (538, (sloc (*Line*)167 (*Col*)11 (*EndLine*)167 (*EndCol*)11)) :: (296, (sloc (*Line*)84 (*Col*)6 (*EndLine*)84 (*EndCol*)6)) :: (206, (sloc (*Line*)73 (*Col*)38 (*EndLine*)73 (*EndCol*)38)) :: (233, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)27)) :: (637, (sloc (*Line*)190 (*Col*)10 (*EndLine*)190 (*EndCol*)10)) :: (305, (sloc (*Line*)87 (*Col*)14 (*EndLine*)87 (*EndCol*)14)) :: (278, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)48)) :: (619, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)35)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((83, ("R", "ada://parameter/Tetris_Functional-28:9/Move-138:14/R-138:49")) :: (86, ("Candidate", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Candidate+206:7")) :: (77, ("R", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/R-134:68")) :: (59, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Y-109:102")) :: (50, ("B", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/B-121:33")) :: (41, ("B", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/B-115:24")) :: (68, ("Has_Complete_Lines", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Has_Complete_Lines+111:7")) :: (53, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/X-107:60")) :: (62, ("Y", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/Y+66:7")) :: (8, ("Cur_Board", "ada://variable/Tetris_Functional-28:9/Cur_Board-55:4")) :: (17, ("Cur_Piece", "ada://variable/Tetris_Functional-28:9/Cur_Piece-76:4")) :: (44, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/R-115:70")) :: (80, ("R", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/R-136:61")) :: (71, ("R", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/R+114:7")) :: (74, ("R", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/R-124:54")) :: (56, ("Cur_Piece_S", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_S-109:37")) :: (47, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/R-117:45")) :: (14, ("D", "ada://component/Tetris_Functional-28:9/Piece-69:9/D-71:7")) :: (46, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/L-117:32")) :: (82, ("A", "ada://parameter/Tetris_Functional-28:9/Move-138:14/A-138:34")) :: (55, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/R-107:90")) :: (64, ("R", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/R+68:7")) :: (73, ("P", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/P-124:40")) :: (58, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/X-109:87")) :: (67, ("To_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/To_Line+110:7")) :: (85, ("Success", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/Success-140:37")) :: (49, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/R-119:42")) :: (13, ("S", "ada://component/Tetris_Functional-28:9/Piece-69:9/S-70:7")) :: (76, ("T", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/T-134:48")) :: (16, ("Y", "ada://component/Tetris_Functional-28:9/Piece-69:9/Y-73:7")) :: (79, ("A", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/A-136:46")) :: (88, ("Is_No_Overlap", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_No_Overlap+208:7")) :: (52, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Cur_Piece_D-107:33")) :: (43, ("X", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/X-115:54")) :: (70, ("From_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/From_Line+113:7")) :: (19, ("Cur_State", "ada://variable/Tetris_Functional-28:9/Cur_State-90:4")) :: (60, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/R-109:117")) :: (87, ("Is_Move_OK", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_Move_OK+207:7")) :: (69, ("Del_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Del_Line+112:7")) :: (78, ("P", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/P-136:32")) :: (63, ("X", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/X+67:7")) :: (54, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Y-107:75")) :: (72, ("B", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/B-124:26")) :: (81, ("P", "ada://parameter/Tetris_Functional-28:9/Move-138:14/P-138:20")) :: (57, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_D-109:60")) :: (48, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/L-119:29")) :: (84, ("A", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/A-140:25")) :: (75, ("D", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/D-134:30")) :: (66, ("Empty_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Empty_Line+108:7")) :: (15, ("X", "ada://component/Tetris_Functional-28:9/Piece-69:9/X-72:7")) :: (42, ("Y", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/Y-115:38")) :: (51, ("R", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/R-121:47")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((26, ("Is_Empty", "ada://procedure_body/Tetris_Functional-28:9/Is_Empty-115:14")) :: (35, ("Move_Is_Possible", "ada://procedure/Tetris_Functional-28:9/Move_Is_Possible-136:14")) :: (29, ("No_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/No_Complete_Lines-121:14")) :: (38, ("Include_Piece_In_Board", "ada://procedure_body/Tetris_Functional-28:9/Include_Piece_In_Board-142:14")) :: (25, ("Possible_Three_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_Three_Shapes-109:14")) :: (34, ("Turn_Direction", "ada://procedure/Tetris_Functional-28:9/Turn_Direction-134:14")) :: (37, ("Do_Action", "ada://procedure_body/Tetris_Functional-28:9/Do_Action-140:14")) :: (28, ("Is_Empty_Line", "ada://procedure/Tetris_Functional-28:9/Is_Empty_Line-119:14")) :: (27, ("Is_Complete_Line", "ada://procedure/Tetris_Functional-28:9/Is_Complete_Line-117:14")) :: (36, ("Move", "ada://procedure/Tetris_Functional-28:9/Move-138:14")) :: (30, ("No_Overlap", "ada://procedure/Tetris_Functional-28:9/No_Overlap-124:14")) :: (39, ("Delete_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/Delete_Complete_Lines-146:14")) :: (24, ("Possible_I_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_I_Shapes-107:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((40, ("Tetris_Functional", "ada://package_body/Tetris_Functional-28:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((23, ("Oriented_Three_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_Three_Shape-105:9")) :: (32, ("Move_Action", "ada://subtype/Tetris_Functional-28:9/Move_Action-131:12")) :: (11, ("Direction", "ada://ordinary_type/Tetris_Functional-28:9/Direction-67:9")) :: (2, ("Shape", "ada://subtype/Tetris_Functional-28:9/Shape-37:12")) :: (20, ("I_Delta", "ada://subtype/Tetris_Functional-28:9/I_Delta-102:12")) :: (5, ("Y_Coord", "ada://subtype/Tetris_Functional-28:9/Y_Coord-50:12")) :: (4, ("X_Coord", "ada://subtype/Tetris_Functional-28:9/X_Coord-49:12")) :: (31, ("Action", "ada://ordinary_type/Tetris_Functional-28:9/Action-129:9")) :: (22, ("Three_Delta", "ada://subtype/Tetris_Functional-28:9/Three_Delta-104:12")) :: (7, ("Board", "ada://ordinary_type/Tetris_Functional-28:9/Board-53:9")) :: (1, ("Cell", "ada://ordinary_type/Tetris_Functional-28:9/Cell-33:9")) :: (10, ("PY_Coord", "ada://subtype/Tetris_Functional-28:9/PY_Coord-64:12")) :: (9, ("PX_Coord", "ada://subtype/Tetris_Functional-28:9/PX_Coord-63:12")) :: (18, ("State", "ada://ordinary_type/Tetris_Functional-28:9/State-87:9")) :: (21, ("Oriented_I_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_I_Shape-103:9")) :: (3, ("Three_Shape", "ada://subtype/Tetris_Functional-28:9/Three_Shape-41:12")) :: (12, ("Piece", "ada://ordinary_type/Tetris_Functional-28:9/Piece-69:9")) :: (33, ("Turn_Action", "ada://subtype/Tetris_Functional-28:9/Turn_Action-132:12")) :: (6, ("Line", "ada://ordinary_type/Tetris_Functional-28:9/Line-52:9")) :: nil)
))
).

Definition Coq_AST_Tree_X := 
(D_Seq_Declaration_X 1
(D_Seq_Declaration_X 2
(D_Type_Declaration_X 3 (Derived_Type_Declaration_X 4 ((*Cell*) 1) Integer (Range_X 0 8))) 
(D_Seq_Declaration_X 5
(D_Type_Declaration_X 6 (Subtype_Declaration_X 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (Range_X 1 8))) 
(D_Seq_Declaration_X 8
(D_Type_Declaration_X 9 (Subtype_Declaration_X 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (Range_X 3 8))) 
(D_Seq_Declaration_X 11
(D_Type_Declaration_X 12 (Subtype_Declaration_X 13 ((*X_Coord*) 4) Integer (Range_X 1 10))) 
(D_Seq_Declaration_X 14
(D_Type_Declaration_X 15 (Subtype_Declaration_X 16 ((*Y_Coord*) 5) Integer (Range_X 1 50))) 
(D_Seq_Declaration_X 17
(D_Type_Declaration_X 18 (Array_Type_Declaration_X 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) 
(D_Seq_Declaration_X 20
(D_Type_Declaration_X 21 (Array_Type_Declaration_X 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) 
(D_Seq_Declaration_X 23
(D_Object_Declaration_X 24 (mkobject_declaration_x 25 ((*Cur_Board*) 8) (Array_Type ((*Board*) 7)) None)) 
(D_Seq_Declaration_X 26
(D_Type_Declaration_X 27 (Subtype_Declaration_X 28 ((*PX_Coord*) 9) Integer (Range_X (-1) 9))) 
(D_Seq_Declaration_X 29
(D_Type_Declaration_X 30 (Subtype_Declaration_X 31 ((*PY_Coord*) 10) Integer (Range_X (-1) 49))) 
(D_Seq_Declaration_X 32
(D_Type_Declaration_X 33 (Derived_Type_Declaration_X 34 ((*Direction*) 11) Integer (Range_X 0 3))) 
(D_Seq_Declaration_X 35
(D_Type_Declaration_X 36 (Record_Type_Declaration_X 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) 
(D_Seq_Declaration_X 39
(D_Object_Declaration_X 40 (mkobject_declaration_x 41 ((*Cur_Piece*) 17) (Record_Type ((*Piece*) 12)) None)) 
(D_Seq_Declaration_X 42
(D_Type_Declaration_X 43 (Derived_Type_Declaration_X 44 ((*State*) 18) Integer (Range_X 0 3))) 
(D_Seq_Declaration_X 45
(D_Object_Declaration_X 46 (mkobject_declaration_x 47 ((*Cur_State*) 19) (Derived_Type ((*State*) 18)) None)) 
(D_Seq_Declaration_X 48
(D_Type_Declaration_X 49 (Subtype_Declaration_X 50 ((*I_Delta*) 20) Integer (Range_X 0 3))) 
(D_Seq_Declaration_X 51
(D_Type_Declaration_X 52 (Array_Type_Declaration_X 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) 
(D_Seq_Declaration_X 54
(D_Type_Declaration_X 55 (Subtype_Declaration_X 56 ((*Three_Delta*) 22) Integer (Range_X 0 2))) 
(D_Seq_Declaration_X 57
(D_Type_Declaration_X 58 (Array_Type_Declaration_X 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) 
(D_Seq_Declaration_X 60
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 61
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 62
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 63
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 64
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 65
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 66
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 67
(D_Type_Declaration_X 68 (Derived_Type_Declaration_X 69 ((*Action*) 31) Integer (Range_X 0 4))) 
(D_Seq_Declaration_X 70
(D_Type_Declaration_X 71 (Subtype_Declaration_X 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (Range_X 0 1))) 
(D_Seq_Declaration_X 73
(D_Type_Declaration_X 74 (Subtype_Declaration_X 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (Range_X 3 4))) 
(D_Seq_Declaration_X 76
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 77
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 78
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 79
D_Null_Declaration_X (* Undefined Declarations ! *) 
(D_Seq_Declaration_X 80
D_Null_Declaration_X (* Undefined Declarations ! *) 
D_Null_Declaration_X (* Undefined Declarations ! *))))))))))))))))))))))))))))))))))) 
(D_Seq_Declaration_X 81
(D_Procedure_Body_X 82 
  (mkprocedure_body_x 83
    (* = = = Procedure Name = = = *)
    ((*Is_Empty*) 26)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
    (mkparameter_specification_x 85 ((*Y*) 42) Integer In) :: 
    (mkparameter_specification_x 86 ((*X*) 43) Integer In) :: 
    (mkparameter_specification_x 87 ((*R*) 44) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 88 (E_Identifier_X 89 ((*R*) 44) (nil)) (E_Literal_X 90 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 91
(D_Procedure_Body_X 92 
  (mkprocedure_body_x 93
    (* = = = Procedure Name = = = *)
    ((*Is_Complete_Line*) 27)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
    (mkparameter_specification_x 95 ((*R*) 47) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 96 (E_Identifier_X 97 ((*R*) 47) (nil)) (E_Literal_X 98 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 99
(D_Procedure_Body_X 100 
  (mkprocedure_body_x 101
    (* = = = Procedure Name = = = *)
    ((*Is_Empty_Line*) 28)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
    (mkparameter_specification_x 103 ((*R*) 49) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 104 (E_Identifier_X 105 ((*R*) 49) (nil)) (E_Literal_X 106 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 107
(D_Procedure_Body_X 108 
  (mkprocedure_body_x 109
    (* = = = Procedure Name = = = *)
    ((*No_Complete_Lines*) 29)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
    (mkparameter_specification_x 111 ((*R*) 51) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 112 (E_Identifier_X 113 ((*R*) 51) (nil)) (E_Literal_X 114 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 115
(D_Procedure_Body_X 116 
  (mkprocedure_body_x 117
    (* = = = Procedure Name = = = *)
    ((*Possible_I_Shapes*) 24)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparameter_specification_x 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification_x 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification_x 121 ((*R*) 55) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 122 (E_Identifier_X 123 ((*R*) 55) (nil)) (E_Literal_X 124 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 125
(D_Procedure_Body_X 126 
  (mkprocedure_body_x 127
    (* = = = Procedure Name = = = *)
    ((*Possible_Three_Shapes*) 25)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
    (mkparameter_specification_x 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparameter_specification_x 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification_x 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparameter_specification_x 132 ((*R*) 60) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 133 (E_Identifier_X 134 ((*R*) 60) (nil)) (E_Literal_X 135 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 136
(D_Procedure_Body_X 137 
  (mkprocedure_body_x 138
    (* = = = Procedure Name = = = *)
    ((*Include_Piece_In_Board*) 38)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 139
  (D_Object_Declaration_X 141 (mkobject_declaration_x 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal_X 140 (Integer_Literal 0) (nil) nil))))) 
  (D_Seq_Declaration_X 143
  (D_Object_Declaration_X 145 (mkobject_declaration_x 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal_X 144 (Integer_Literal 0) (nil) nil))))) 
  (D_Object_Declaration_X 147 (mkobject_declaration_x 148 ((*R*) 64) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 149
      (S_If_X 150 (E_Binary_Operation_X 151 Equal (E_Name_X 152 (E_Selected_Component_X 153 (E_Identifier_X 154 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (E_Literal_X 156 (Integer_Literal 2) (nil) nil) (nil) nil)
        (S_Sequence_X 157
        (S_Assignment_X 158 (E_Indexed_Component_X 159 (E_Indexed_Component_X 160 (E_Identifier_X 161 ((*Cur_Board*) 8) (nil)) (E_Name_X 162 (E_Selected_Component_X 163 (E_Identifier_X 164 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (Do_Range_Check :: nil))) (nil)) (E_Name_X 166 (E_Selected_Component_X 167 (E_Identifier_X 168 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (Do_Range_Check :: nil))) (nil)) (E_Name_X 170 (E_Selected_Component_X 171 (E_Identifier_X 172 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
        (S_Sequence_X 174
        (S_Assignment_X 175 (E_Indexed_Component_X 176 (E_Indexed_Component_X 177 (E_Identifier_X 178 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 179 Plus (E_Name_X 180 (E_Selected_Component_X 181 (E_Identifier_X 182 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 184 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 185 (E_Selected_Component_X 186 (E_Identifier_X 187 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (Do_Range_Check :: nil))) (nil)) (E_Name_X 189 (E_Selected_Component_X 190 (E_Identifier_X 191 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
        (S_Sequence_X 193
        (S_Assignment_X 194 (E_Indexed_Component_X 195 (E_Indexed_Component_X 196 (E_Identifier_X 197 ((*Cur_Board*) 8) (nil)) (E_Name_X 198 (E_Selected_Component_X 199 (E_Identifier_X 200 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (Do_Range_Check :: nil))) (nil)) (E_Binary_Operation_X 202 Plus (E_Name_X 203 (E_Selected_Component_X 204 (E_Identifier_X 205 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Literal_X 207 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 208 (E_Selected_Component_X 209 (E_Identifier_X 210 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
        (S_Assignment_X 212 (E_Indexed_Component_X 213 (E_Indexed_Component_X 214 (E_Identifier_X 215 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 216 Plus (E_Name_X 217 (E_Selected_Component_X 218 (E_Identifier_X 219 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 221 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Binary_Operation_X 222 Plus (E_Name_X 223 (E_Selected_Component_X 224 (E_Identifier_X 225 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Literal_X 227 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 228 (E_Selected_Component_X 229 (E_Identifier_X 230 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))))))
        (S_If_X 232 (E_Binary_Operation_X 233 Equal (E_Name_X 234 (E_Selected_Component_X 235 (E_Identifier_X 236 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (E_Literal_X 238 (Integer_Literal 1) (nil) nil) (nil) nil)
          (S_While_Loop_X 239 (E_Binary_Operation_X 240 Less_Than_Or_Equal (E_Name_X 241 (E_Identifier_X 242 ((*Y*) 62) (nil))) (E_Literal_X 243 (Integer_Literal 3) (nil) nil) (nil) nil)
            (S_Sequence_X 244
            (S_While_Loop_X 245 (E_Binary_Operation_X 246 Less_Than_Or_Equal (E_Name_X 247 (E_Identifier_X 248 ((*X*) 63) (nil))) (E_Literal_X 249 (Integer_Literal 3) (nil) nil) (nil) nil)
              (S_Sequence_X 250
              (S_Procedure_Call_X 251 252 ((*Possible_I_Shapes*) 24) 
                ((E_Name_X 253 (E_Selected_Component_X 254 (E_Identifier_X 255 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (E_Name_X 257 (E_Identifier_X 258 ((*Y*) 62) (nil))) :: (E_Name_X 259 (E_Identifier_X 260 ((*X*) 63) (nil))) :: (E_Name_X 261 (E_Identifier_X 262 ((*R*) 64) (nil))) :: nil)
              ) 
              (S_Sequence_X 263
              (S_If_X 264 (E_Name_X 265 (E_Identifier_X 266 ((*R*) 64) (nil)))
                (S_Assignment_X 267 (E_Indexed_Component_X 268 (E_Indexed_Component_X 269 (E_Identifier_X 270 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 271 Plus (E_Name_X 272 (E_Selected_Component_X 273 (E_Identifier_X 274 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Name_X 276 (E_Identifier_X 277 ((*Y*) 62) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Binary_Operation_X 278 Plus (E_Name_X 279 (E_Selected_Component_X 280 (E_Identifier_X 281 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Name_X 283 (E_Identifier_X 284 ((*X*) 63) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 285 (E_Selected_Component_X 286 (E_Identifier_X 287 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
                S_Null_X
              ) 
              (S_Assignment_X 289 (E_Identifier_X 290 ((*X*) 63) (nil)) (E_Binary_Operation_X 291 Plus (E_Name_X 292 (E_Identifier_X 293 ((*X*) 63) (nil))) (E_Literal_X 294 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
            ) 
            (S_Assignment_X 295 (E_Identifier_X 296 ((*Y*) 62) (nil)) (E_Binary_Operation_X 297 Plus (E_Name_X 298 (E_Identifier_X 299 ((*Y*) 62) (nil))) (E_Literal_X 300 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)))
          )
          (S_While_Loop_X 301 (E_Binary_Operation_X 302 Less_Than_Or_Equal (E_Name_X 303 (E_Identifier_X 304 ((*Y*) 62) (nil))) (E_Literal_X 305 (Integer_Literal 2) (nil) nil) (nil) nil)
            (S_Sequence_X 306
            (S_While_Loop_X 307 (E_Binary_Operation_X 308 Less_Than_Or_Equal (E_Name_X 309 (E_Identifier_X 310 ((*X*) 63) (nil))) (E_Literal_X 311 (Integer_Literal 2) (nil) nil) (nil) nil)
              (S_Sequence_X 312
              (S_Procedure_Call_X 313 314 ((*Possible_Three_Shapes*) 25) 
                ((E_Name_X 315 (E_Selected_Component_X 316 (E_Identifier_X 317 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) :: (E_Name_X 319 (E_Selected_Component_X 320 (E_Identifier_X 321 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (E_Name_X 323 (E_Identifier_X 324 ((*Y*) 62) (nil))) :: (E_Name_X 325 (E_Identifier_X 326 ((*X*) 63) (nil))) :: (E_Name_X 327 (E_Identifier_X 328 ((*R*) 64) (nil))) :: nil)
              ) 
              (S_Sequence_X 329
              (S_If_X 330 (E_Name_X 331 (E_Identifier_X 332 ((*R*) 64) (nil)))
                (S_Assignment_X 333 (E_Indexed_Component_X 334 (E_Indexed_Component_X 335 (E_Identifier_X 336 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 337 Plus (E_Name_X 338 (E_Selected_Component_X 339 (E_Identifier_X 340 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Name_X 342 (E_Identifier_X 343 ((*Y*) 62) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Binary_Operation_X 344 Plus (E_Name_X 345 (E_Selected_Component_X 346 (E_Identifier_X 347 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Name_X 349 (E_Identifier_X 350 ((*X*) 63) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 351 (E_Selected_Component_X 352 (E_Identifier_X 353 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
                S_Null_X
              ) 
              (S_Assignment_X 355 (E_Identifier_X 356 ((*X*) 63) (nil)) (E_Binary_Operation_X 357 Plus (E_Name_X 358 (E_Identifier_X 359 ((*X*) 63) (nil))) (E_Literal_X 360 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
            ) 
            (S_Assignment_X 361 (E_Identifier_X 362 ((*Y*) 62) (nil)) (E_Binary_Operation_X 363 Plus (E_Name_X 364 (E_Identifier_X 365 ((*Y*) 62) (nil))) (E_Literal_X 366 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)))
          )
        )
      ) 
      (S_Assignment_X 367 (E_Identifier_X 368 ((*Cur_State*) 19) (nil)) (E_Literal_X 369 (Integer_Literal 2) (nil) nil)))
  )
) 
(D_Seq_Declaration_X 370
(D_Procedure_Body_X 371 
  (mkprocedure_body_x 372
    (* = = = Procedure Name = = = *)
    ((*Delete_Complete_Lines*) 39)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 373
  (D_Object_Declaration_X 374 (mkobject_declaration_x 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
  (D_Seq_Declaration_X 376
  (D_Object_Declaration_X 378 (mkobject_declaration_x 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal_X 377 (Integer_Literal 10) (nil) nil))))) 
  (D_Seq_Declaration_X 380
  (D_Object_Declaration_X 382 (mkobject_declaration_x 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((E_Literal_X 381 (Boolean_Literal false) (nil) nil))))) 
  (D_Seq_Declaration_X 384
  (D_Object_Declaration_X 386 (mkobject_declaration_x 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal_X 385 (Integer_Literal 1) (nil) nil))))) 
  (D_Seq_Declaration_X 388
  (D_Object_Declaration_X 389 (mkobject_declaration_x 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
  (D_Object_Declaration_X 391 (mkobject_declaration_x 392 ((*R*) 71) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 393
      (S_While_Loop_X 394 (E_Binary_Operation_X 395 Less_Than_Or_Equal (E_Name_X 396 (E_Identifier_X 397 ((*Del_Line*) 69) (nil))) (E_Literal_X 398 (Integer_Literal 50) (nil) nil) (nil) nil)
        (S_Sequence_X 399
        (S_Procedure_Call_X 400 401 ((*Is_Complete_Line*) 27) 
          ((E_Name_X 402 (E_Indexed_Component_X 403 (E_Identifier_X 404 ((*Cur_Board*) 8) (nil)) (E_Name_X 405 (E_Identifier_X 406 ((*Del_Line*) 69) (nil))) (nil))) :: (E_Name_X 407 (E_Identifier_X 408 ((*R*) 71) (nil))) :: nil)
        ) 
        (S_Sequence_X 409
        (S_If_X 410 (E_Name_X 411 (E_Identifier_X 412 ((*R*) 71) (nil)))
          (S_Sequence_X 413
          (S_Assignment_X 414 (E_Indexed_Component_X 415 (E_Identifier_X 416 ((*Cur_Board*) 8) (nil)) (E_Name_X 417 (E_Identifier_X 418 ((*Del_Line*) 69) (nil))) (nil)) (E_Name_X 419 (E_Identifier_X 420 ((*Empty_Line*) 66) (nil)))) 
          (S_Sequence_X 421
          (S_Assignment_X 422 (E_Identifier_X 423 ((*Has_Complete_Lines*) 68) (nil)) (E_Literal_X 424 (Boolean_Literal true) (nil) nil)) 
          (S_Assignment_X 425 (E_Identifier_X 426 ((*To_Line*) 67) (nil)) (E_Name_X 427 (E_Identifier_X 428 ((*Del_Line*) 69) (nil))))))
          S_Null_X
        ) 
        (S_Assignment_X 429 (E_Identifier_X 430 ((*Del_Line*) 69) (nil)) (E_Binary_Operation_X 431 Plus (E_Name_X 432 (E_Identifier_X 433 ((*Del_Line*) 69) (nil))) (E_Literal_X 434 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
      ) 
      (S_Sequence_X 435
      (S_If_X 436 (E_Name_X 437 (E_Identifier_X 438 ((*Has_Complete_Lines*) 68) (nil)))
        (S_Sequence_X 439
        (S_Assignment_X 440 (E_Identifier_X 441 ((*From_Line*) 70) (nil)) (E_Literal_X 442 (Integer_Literal 9) (nil) nil)) 
        (S_While_Loop_X 443 (E_Binary_Operation_X 444 Greater_Than_Or_Equal (E_Name_X 445 (E_Identifier_X 446 ((*From_Line*) 70) (nil))) (E_Literal_X 447 (Integer_Literal 1) (nil) nil) (nil) nil)
          (S_Sequence_X 448
          (S_Procedure_Call_X 449 450 ((*Is_Empty_Line*) 28) 
            ((E_Name_X 451 (E_Indexed_Component_X 452 (E_Identifier_X 453 ((*Cur_Board*) 8) (nil)) (E_Name_X 454 (E_Identifier_X 455 ((*From_Line*) 70) (nil))) (nil))) :: (E_Name_X 456 (E_Identifier_X 457 ((*R*) 71) (nil))) :: nil)
          ) 
          (S_Sequence_X 458
          (S_If_X 459 (E_Unary_Operation_X 460 Not (E_Name_X 461 (E_Identifier_X 462 ((*R*) 71) (nil))) (nil) nil)
            (S_Sequence_X 463
            (S_Assignment_X 464 (E_Indexed_Component_X 465 (E_Identifier_X 466 ((*Cur_Board*) 8) (nil)) (E_Name_X 467 (E_Identifier_X 468 ((*To_Line*) 67) (nil))) (nil)) (E_Name_X 469 (E_Indexed_Component_X 470 (E_Identifier_X 471 ((*Cur_Board*) 8) (nil)) (E_Name_X 472 (E_Identifier_X 473 ((*From_Line*) 70) (nil))) (nil)))) 
            (S_Sequence_X 474
            (S_Assignment_X 475 (E_Indexed_Component_X 476 (E_Identifier_X 477 ((*Cur_Board*) 8) (nil)) (E_Name_X 478 (E_Identifier_X 479 ((*From_Line*) 70) (nil))) (nil)) (E_Name_X 480 (E_Identifier_X 481 ((*Empty_Line*) 66) (nil)))) 
            (S_Assignment_X 482 (E_Identifier_X 483 ((*To_Line*) 67) (nil)) (E_Binary_Operation_X 484 Minus (E_Name_X 485 (E_Identifier_X 486 ((*To_Line*) 67) (nil))) (E_Literal_X 487 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
            S_Null_X
          ) 
          (S_Assignment_X 488 (E_Identifier_X 489 ((*From_Line*) 70) (nil)) (E_Binary_Operation_X 490 Minus (E_Name_X 491 (E_Identifier_X 492 ((*From_Line*) 70) (nil))) (E_Literal_X 493 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
        ))
        S_Null_X
      ) 
      (S_Assignment_X 494 (E_Identifier_X 495 ((*Cur_State*) 19) (nil)) (E_Literal_X 496 (Integer_Literal 3) (nil) nil))))
  )
) 
(D_Seq_Declaration_X 497
(D_Procedure_Body_X 498 
  (mkprocedure_body_x 499
    (* = = = Procedure Name = = = *)
    ((*No_Overlap*) 30)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
    (mkparameter_specification_x 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparameter_specification_x 502 ((*R*) 74) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_Assignment_X 503 (E_Identifier_X 504 ((*R*) 74) (nil)) (E_Literal_X 505 (Boolean_Literal true) (nil) nil))
  )
) 
(D_Seq_Declaration_X 506
(D_Procedure_Body_X 507 
  (mkprocedure_body_x 508
    (* = = = Procedure Name = = = *)
    ((*Turn_Direction*) 34)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparameter_specification_x 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
    (mkparameter_specification_x 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_If_X 512 (E_Binary_Operation_X 513 Equal (E_Name_X 514 (E_Identifier_X 515 ((*T*) 76) (nil))) (E_Literal_X 516 (Integer_Literal 3) (nil) nil) (nil) nil)
        (S_If_X 517 (E_Binary_Operation_X 518 Equal (E_Name_X 519 (E_Identifier_X 520 ((*D*) 75) (nil))) (E_Literal_X 521 (Integer_Literal 0) (nil) nil) (nil) nil)
          (S_Assignment_X 522 (E_Identifier_X 523 ((*R*) 77) (nil)) (E_Literal_X 524 (Integer_Literal 3) (nil) nil))
          (S_Assignment_X 525 (E_Identifier_X 526 ((*R*) 77) (nil)) (E_Binary_Operation_X 527 Minus (E_Name_X 528 (E_Identifier_X 529 ((*D*) 75) (nil))) (E_Literal_X 530 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
        )
        (S_If_X 531 (E_Binary_Operation_X 532 Equal (E_Name_X 533 (E_Identifier_X 534 ((*D*) 75) (nil))) (E_Literal_X 535 (Integer_Literal 3) (nil) nil) (nil) nil)
          (S_Assignment_X 536 (E_Identifier_X 537 ((*R*) 77) (nil)) (E_Literal_X 538 (Integer_Literal 0) (nil) nil))
          (S_Assignment_X 539 (E_Identifier_X 540 ((*R*) 77) (nil)) (E_Binary_Operation_X 541 Plus (E_Name_X 542 (E_Identifier_X 543 ((*D*) 75) (nil))) (E_Literal_X 544 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
        )
      )
  )
) 
(D_Seq_Declaration_X 545
(D_Procedure_Body_X 546 
  (mkprocedure_body_x 547
    (* = = = Procedure Name = = = *)
    ((*Move_Is_Possible*) 35)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparameter_specification_x 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparameter_specification_x 550 ((*R*) 80) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_If_X 551 (E_Binary_Operation_X 552 Equal (E_Name_X 553 (E_Identifier_X 554 ((*A*) 79) (nil))) (E_Literal_X 555 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Assignment_X 556 (E_Identifier_X 557 ((*R*) 80) (nil)) (E_Binary_Operation_X 558 And (E_Binary_Operation_X 559 Greater_Than_Or_Equal (E_Binary_Operation_X 560 Minus (E_Name_X 561 (E_Selected_Component_X 562 (E_Identifier_X 563 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 565 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Unary_Operation_X 566 Unary_Minus (E_Literal_X 567 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (E_Binary_Operation_X 568 Less_Than_Or_Equal (E_Binary_Operation_X 569 Minus (E_Name_X 570 (E_Selected_Component_X 571 (E_Identifier_X 572 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 574 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 575 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
        (S_If_X 576 (E_Binary_Operation_X 577 Equal (E_Name_X 578 (E_Identifier_X 579 ((*A*) 79) (nil))) (E_Literal_X 580 (Integer_Literal 1) (nil) nil) (nil) nil)
          (S_Assignment_X 581 (E_Identifier_X 582 ((*R*) 80) (nil)) (E_Binary_Operation_X 583 And (E_Binary_Operation_X 584 Greater_Than_Or_Equal (E_Binary_Operation_X 585 Plus (E_Name_X 586 (E_Selected_Component_X 587 (E_Identifier_X 588 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 590 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Unary_Operation_X 591 Unary_Minus (E_Literal_X 592 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (E_Binary_Operation_X 593 Less_Than_Or_Equal (E_Binary_Operation_X 594 Plus (E_Name_X 595 (E_Selected_Component_X 596 (E_Identifier_X 597 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 599 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 600 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
          (S_If_X 601 (E_Binary_Operation_X 602 Equal (E_Name_X 603 (E_Identifier_X 604 ((*A*) 79) (nil))) (E_Literal_X 605 (Integer_Literal 2) (nil) nil) (nil) nil)
            (S_Assignment_X 606 (E_Identifier_X 607 ((*R*) 80) (nil)) (E_Binary_Operation_X 608 And (E_Binary_Operation_X 609 Greater_Than_Or_Equal (E_Binary_Operation_X 610 Plus (E_Name_X 611 (E_Selected_Component_X 612 (E_Identifier_X 613 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 615 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Unary_Operation_X 616 Unary_Minus (E_Literal_X 617 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (E_Binary_Operation_X 618 Less_Than_Or_Equal (E_Binary_Operation_X 619 Plus (E_Name_X 620 (E_Selected_Component_X 621 (E_Identifier_X 622 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 624 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 625 (Integer_Literal 49) (nil) nil) (nil) nil) (nil) nil))
            (S_Assignment_X 626 (E_Identifier_X 627 ((*R*) 80) (nil)) (E_Literal_X 628 (Boolean_Literal true) (nil) nil))
          )
        )
      )
  )
) 
(D_Seq_Declaration_X 629
(D_Procedure_Body_X 630 
  (mkprocedure_body_x 631
    (* = = = Procedure Name = = = *)
    ((*Move*) 36)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparameter_specification_x 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparameter_specification_x 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (D_Null_Declaration_X)
    (* = = = Procedure Body = = = *)
      (S_If_X 635 (E_Binary_Operation_X 636 Equal (E_Name_X 637 (E_Identifier_X 638 ((*A*) 82) (nil))) (E_Literal_X 639 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Assignment_X 640 (E_Selected_Component_X 641 (E_Identifier_X 642 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (E_Binary_Operation_X 644 Minus (E_Name_X 645 (E_Selected_Component_X 646 (E_Identifier_X 647 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (E_Literal_X 649 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
        (S_If_X 650 (E_Binary_Operation_X 651 Equal (E_Name_X 652 (E_Identifier_X 653 ((*A*) 82) (nil))) (E_Literal_X 654 (Integer_Literal 1) (nil) nil) (nil) nil)
          (S_Assignment_X 655 (E_Selected_Component_X 656 (E_Identifier_X 657 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (E_Binary_Operation_X 659 Plus (E_Name_X 660 (E_Selected_Component_X 661 (E_Identifier_X 662 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (E_Literal_X 664 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
          (S_If_X 665 (E_Binary_Operation_X 666 Equal (E_Name_X 667 (E_Identifier_X 668 ((*A*) 82) (nil))) (E_Literal_X 669 (Integer_Literal 2) (nil) nil) (nil) nil)
            (S_Assignment_X 670 (E_Selected_Component_X 671 (E_Identifier_X 672 ((*R*) 83) (nil)) ((*Y*) 16) (nil)) (E_Binary_Operation_X 674 Plus (E_Name_X 675 (E_Selected_Component_X 676 (E_Identifier_X 677 ((*P*) 81) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 679 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
            (S_Procedure_Call_X 680 681 ((*Turn_Direction*) 34) 
              ((E_Name_X 682 (E_Selected_Component_X 683 (E_Identifier_X 684 ((*P*) 81) (nil)) ((*D*) 14) (nil))) :: (E_Name_X 686 (E_Identifier_X 687 ((*A*) 82) (Do_Range_Check :: nil))) :: (E_Name_X 688 (E_Selected_Component_X 689 (E_Identifier_X 690 ((*R*) 83) (nil)) ((*D*) 14) (nil))) :: nil)
            )
          )
        )
      )
  )
) 
(D_Procedure_Body_X 692 
  (mkprocedure_body_x 693
    (* = = = Procedure Name = = = *)
    ((*Do_Action*) 37)
    (* = = = Formal Parameters = = = *)
    (
    (mkparameter_specification_x 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparameter_specification_x 695 ((*Success*) 85) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((D_Seq_Declaration_X 696
  (D_Object_Declaration_X 697 (mkobject_declaration_x 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
  (D_Seq_Declaration_X 699
  (D_Object_Declaration_X 700 (mkobject_declaration_x 701 ((*Is_Move_OK*) 87) Boolean None)) 
  (D_Object_Declaration_X 702 (mkobject_declaration_x 703 ((*Is_No_Overlap*) 88) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (S_Sequence_X 704
      (S_Procedure_Call_X 705 706 ((*Move_Is_Possible*) 35) 
        ((E_Name_X 707 (E_Identifier_X 708 ((*Cur_Piece*) 17) (nil))) :: (E_Name_X 709 (E_Identifier_X 710 ((*A*) 84) (nil))) :: (E_Name_X 711 (E_Identifier_X 712 ((*Is_Move_OK*) 87) (nil))) :: nil)
      ) 
      (S_Sequence_X 713
      (S_If_X 714 (E_Name_X 715 (E_Identifier_X 716 ((*Is_Move_OK*) 87) (nil)))
        (S_Sequence_X 717
        (S_Procedure_Call_X 718 719 ((*Move*) 36) 
          ((E_Name_X 720 (E_Identifier_X 721 ((*Cur_Piece*) 17) (nil))) :: (E_Name_X 722 (E_Identifier_X 723 ((*A*) 84) (nil))) :: (E_Name_X 724 (E_Identifier_X 725 ((*Candidate*) 86) (nil))) :: nil)
        ) 
        (S_Sequence_X 726
        (S_Procedure_Call_X 727 728 ((*No_Overlap*) 30) 
          ((E_Name_X 729 (E_Identifier_X 730 ((*Cur_Board*) 8) (nil))) :: (E_Name_X 731 (E_Identifier_X 732 ((*Candidate*) 86) (nil))) :: (E_Name_X 733 (E_Identifier_X 734 ((*Is_No_Overlap*) 88) (nil))) :: nil)
        ) 
        (S_If_X 735 (E_Name_X 736 (E_Identifier_X 737 ((*Is_No_Overlap*) 88) (nil)))
          (S_Sequence_X 738
          (S_Assignment_X 739 (E_Identifier_X 740 ((*Cur_Piece*) 17) (nil)) (E_Name_X 741 (E_Identifier_X 742 ((*Candidate*) 86) (nil)))) 
          (S_Sequence_X 743
          (S_Assignment_X 744 (E_Identifier_X 745 ((*Success*) 85) (nil)) (E_Literal_X 746 (Boolean_Literal true) (nil) nil)) 
          S_Null_X (* Ignore Return Statement ! *)))
          S_Null_X
        )))
        S_Null_X
      ) 
      (S_Assignment_X 747 (E_Identifier_X 748 ((*Success*) 85) (nil)) (E_Literal_X 749 (Boolean_Literal false) (nil) nil))))
  )
)))))))))))))).

Definition Symbol_Table_X := 
(mkSymbolTable_x
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*R*) 49), (Out, Boolean)) :: (((*X*) 53), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Cur_Board*) 8), (In_Out, (Array_Type ((*Board*) 7)))) :: (((*To_Line*) 67), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 55), (Out, Boolean)) :: (((*P*) 81), (In, (Record_Type ((*Piece*) 12)))) :: (((*A*) 82), (In, (Derived_Type ((*Action*) 31)))) :: (((*From_Line*) 70), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 64), (In_Out, Boolean)) :: (((*Is_No_Overlap*) 88), (In_Out, Boolean)) :: (((*L*) 48), (In, (Array_Type ((*Line*) 6)))) :: (((*Candidate*) 86), (In_Out, (Record_Type ((*Piece*) 12)))) :: (((*X*) 58), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Success*) 85), (Out, Boolean)) :: (((*B*) 72), (In, (Array_Type ((*Board*) 7)))) :: (((*Y*) 54), (In, (Subtype ((*I_Delta*) 20)))) :: (((*X*) 43), (In, Integer)) :: (((*Is_Move_OK*) 87), (In_Out, Boolean)) :: (((*T*) 76), (In, (Subtype ((*Turn_Action*) 33)))) :: (((*Has_Complete_Lines*) 68), (In_Out, Boolean)) :: (((*Cur_State*) 19), (In_Out, (Derived_Type ((*State*) 18)))) :: (((*R*) 51), (Out, Boolean)) :: (((*Y*) 42), (In, Integer)) :: (((*A*) 84), (In, (Derived_Type ((*Action*) 31)))) :: (((*Cur_Piece_D*) 52), (In, (Derived_Type ((*Direction*) 11)))) :: (((*B*) 41), (In, (Array_Type ((*Board*) 7)))) :: (((*Cur_Piece_S*) 56), (In, (Subtype ((*Shape*) 2)))) :: (((*Y*) 59), (In, (Subtype ((*I_Delta*) 20)))) :: (((*D*) 75), (In, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 47), (Out, Boolean)) :: (((*Del_Line*) 69), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 60), (Out, Boolean)) :: (((*X*) 63), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*P*) 73), (In, (Record_Type ((*Piece*) 12)))) :: (((*B*) 50), (In, (Array_Type ((*Board*) 7)))) :: (((*R*) 77), (Out, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 44), (Out, Boolean)) :: (((*R*) 83), (Out, (Record_Type ((*Piece*) 12)))) :: (((*Cur_Piece_D*) 57), (In, (Derived_Type ((*Direction*) 11)))) :: (((*Y*) 62), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*R*) 74), (Out, Boolean)) :: (((*L*) 46), (In, (Array_Type ((*Line*) 6)))) :: (((*R*) 80), (Out, Boolean)) :: (((*Empty_Line*) 66), (In_Out, (Array_Type ((*Line*) 6)))) :: (((*A*) 79), (In, (Derived_Type ((*Action*) 31)))) :: (((*P*) 78), (In, (Record_Type ((*Piece*) 12)))) :: (((*R*) 71), (In_Out, Boolean)) :: (((*Cur_Piece*) 17), (In_Out, (Record_Type ((*Piece*) 12)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Possible_Three_Shapes*) 25), (0, (mkprocedure_body_x 127
  (* = = = Procedure Name = = = *)
  ((*Possible_Three_Shapes*) 25)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
  (mkparameter_specification_x 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparameter_specification_x 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification_x 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification_x 132 ((*R*) 60) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 133 (E_Identifier_X 134 ((*R*) 60) (nil)) (E_Literal_X 135 (Boolean_Literal true) (nil) nil))
))) :: (((*Do_Action*) 37), (0, (mkprocedure_body_x 693
  (* = = = Procedure Name = = = *)
  ((*Do_Action*) 37)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparameter_specification_x 695 ((*Success*) 85) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 696
(D_Object_Declaration_X 697 (mkobject_declaration_x 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
(D_Seq_Declaration_X 699
(D_Object_Declaration_X 700 (mkobject_declaration_x 701 ((*Is_Move_OK*) 87) Boolean None)) 
(D_Object_Declaration_X 702 (mkobject_declaration_x 703 ((*Is_No_Overlap*) 88) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 704
    (S_Procedure_Call_X 705 706 ((*Move_Is_Possible*) 35) 
      ((E_Name_X 707 (E_Identifier_X 708 ((*Cur_Piece*) 17) (nil))) :: (E_Name_X 709 (E_Identifier_X 710 ((*A*) 84) (nil))) :: (E_Name_X 711 (E_Identifier_X 712 ((*Is_Move_OK*) 87) (nil))) :: nil)
    ) 
    (S_Sequence_X 713
    (S_If_X 714 (E_Name_X 715 (E_Identifier_X 716 ((*Is_Move_OK*) 87) (nil)))
      (S_Sequence_X 717
      (S_Procedure_Call_X 718 719 ((*Move*) 36) 
        ((E_Name_X 720 (E_Identifier_X 721 ((*Cur_Piece*) 17) (nil))) :: (E_Name_X 722 (E_Identifier_X 723 ((*A*) 84) (nil))) :: (E_Name_X 724 (E_Identifier_X 725 ((*Candidate*) 86) (nil))) :: nil)
      ) 
      (S_Sequence_X 726
      (S_Procedure_Call_X 727 728 ((*No_Overlap*) 30) 
        ((E_Name_X 729 (E_Identifier_X 730 ((*Cur_Board*) 8) (nil))) :: (E_Name_X 731 (E_Identifier_X 732 ((*Candidate*) 86) (nil))) :: (E_Name_X 733 (E_Identifier_X 734 ((*Is_No_Overlap*) 88) (nil))) :: nil)
      ) 
      (S_If_X 735 (E_Name_X 736 (E_Identifier_X 737 ((*Is_No_Overlap*) 88) (nil)))
        (S_Sequence_X 738
        (S_Assignment_X 739 (E_Identifier_X 740 ((*Cur_Piece*) 17) (nil)) (E_Name_X 741 (E_Identifier_X 742 ((*Candidate*) 86) (nil)))) 
        (S_Sequence_X 743
        (S_Assignment_X 744 (E_Identifier_X 745 ((*Success*) 85) (nil)) (E_Literal_X 746 (Boolean_Literal true) (nil) nil)) 
        S_Null_X (* Ignore Return Statement ! *)))
        S_Null_X
      )))
      S_Null_X
    ) 
    (S_Assignment_X 747 (E_Identifier_X 748 ((*Success*) 85) (nil)) (E_Literal_X 749 (Boolean_Literal false) (nil) nil))))
))) :: (((*No_Complete_Lines*) 29), (0, (mkprocedure_body_x 109
  (* = = = Procedure Name = = = *)
  ((*No_Complete_Lines*) 29)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
  (mkparameter_specification_x 111 ((*R*) 51) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 112 (E_Identifier_X 113 ((*R*) 51) (nil)) (E_Literal_X 114 (Boolean_Literal true) (nil) nil))
))) :: (((*Is_Complete_Line*) 27), (0, (mkprocedure_body_x 93
  (* = = = Procedure Name = = = *)
  ((*Is_Complete_Line*) 27)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
  (mkparameter_specification_x 95 ((*R*) 47) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 96 (E_Identifier_X 97 ((*R*) 47) (nil)) (E_Literal_X 98 (Boolean_Literal true) (nil) nil))
))) :: (((*Is_Empty*) 26), (0, (mkprocedure_body_x 83
  (* = = = Procedure Name = = = *)
  ((*Is_Empty*) 26)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
  (mkparameter_specification_x 85 ((*Y*) 42) Integer In) :: 
  (mkparameter_specification_x 86 ((*X*) 43) Integer In) :: 
  (mkparameter_specification_x 87 ((*R*) 44) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 88 (E_Identifier_X 89 ((*R*) 44) (nil)) (E_Literal_X 90 (Boolean_Literal true) (nil) nil))
))) :: (((*No_Overlap*) 30), (0, (mkprocedure_body_x 499
  (* = = = Procedure Name = = = *)
  ((*No_Overlap*) 30)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
  (mkparameter_specification_x 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparameter_specification_x 502 ((*R*) 74) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 503 (E_Identifier_X 504 ((*R*) 74) (nil)) (E_Literal_X 505 (Boolean_Literal true) (nil) nil))
))) :: (((*Possible_I_Shapes*) 24), (0, (mkprocedure_body_x 117
  (* = = = Procedure Name = = = *)
  ((*Possible_I_Shapes*) 24)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparameter_specification_x 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification_x 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparameter_specification_x 121 ((*R*) 55) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 122 (E_Identifier_X 123 ((*R*) 55) (nil)) (E_Literal_X 124 (Boolean_Literal true) (nil) nil))
))) :: (((*Include_Piece_In_Board*) 38), (0, (mkprocedure_body_x 138
  (* = = = Procedure Name = = = *)
  ((*Include_Piece_In_Board*) 38)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 139
(D_Object_Declaration_X 141 (mkobject_declaration_x 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal_X 140 (Integer_Literal 0) (nil) nil))))) 
(D_Seq_Declaration_X 143
(D_Object_Declaration_X 145 (mkobject_declaration_x 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((E_Literal_X 144 (Integer_Literal 0) (nil) nil))))) 
(D_Object_Declaration_X 147 (mkobject_declaration_x 148 ((*R*) 64) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 149
    (S_If_X 150 (E_Binary_Operation_X 151 Equal (E_Name_X 152 (E_Selected_Component_X 153 (E_Identifier_X 154 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (E_Literal_X 156 (Integer_Literal 2) (nil) nil) (nil) nil)
      (S_Sequence_X 157
      (S_Assignment_X 158 (E_Indexed_Component_X 159 (E_Indexed_Component_X 160 (E_Identifier_X 161 ((*Cur_Board*) 8) (nil)) (E_Name_X 162 (E_Selected_Component_X 163 (E_Identifier_X 164 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (Do_Range_Check :: nil))) (nil)) (E_Name_X 166 (E_Selected_Component_X 167 (E_Identifier_X 168 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (Do_Range_Check :: nil))) (nil)) (E_Name_X 170 (E_Selected_Component_X 171 (E_Identifier_X 172 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
      (S_Sequence_X 174
      (S_Assignment_X 175 (E_Indexed_Component_X 176 (E_Indexed_Component_X 177 (E_Identifier_X 178 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 179 Plus (E_Name_X 180 (E_Selected_Component_X 181 (E_Identifier_X 182 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 184 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 185 (E_Selected_Component_X 186 (E_Identifier_X 187 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (Do_Range_Check :: nil))) (nil)) (E_Name_X 189 (E_Selected_Component_X 190 (E_Identifier_X 191 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
      (S_Sequence_X 193
      (S_Assignment_X 194 (E_Indexed_Component_X 195 (E_Indexed_Component_X 196 (E_Identifier_X 197 ((*Cur_Board*) 8) (nil)) (E_Name_X 198 (E_Selected_Component_X 199 (E_Identifier_X 200 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (Do_Range_Check :: nil))) (nil)) (E_Binary_Operation_X 202 Plus (E_Name_X 203 (E_Selected_Component_X 204 (E_Identifier_X 205 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Literal_X 207 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 208 (E_Selected_Component_X 209 (E_Identifier_X 210 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
      (S_Assignment_X 212 (E_Indexed_Component_X 213 (E_Indexed_Component_X 214 (E_Identifier_X 215 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 216 Plus (E_Name_X 217 (E_Selected_Component_X 218 (E_Identifier_X 219 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 221 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Binary_Operation_X 222 Plus (E_Name_X 223 (E_Selected_Component_X 224 (E_Identifier_X 225 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Literal_X 227 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 228 (E_Selected_Component_X 229 (E_Identifier_X 230 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))))))
      (S_If_X 232 (E_Binary_Operation_X 233 Equal (E_Name_X 234 (E_Selected_Component_X 235 (E_Identifier_X 236 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (E_Literal_X 238 (Integer_Literal 1) (nil) nil) (nil) nil)
        (S_While_Loop_X 239 (E_Binary_Operation_X 240 Less_Than_Or_Equal (E_Name_X 241 (E_Identifier_X 242 ((*Y*) 62) (nil))) (E_Literal_X 243 (Integer_Literal 3) (nil) nil) (nil) nil)
          (S_Sequence_X 244
          (S_While_Loop_X 245 (E_Binary_Operation_X 246 Less_Than_Or_Equal (E_Name_X 247 (E_Identifier_X 248 ((*X*) 63) (nil))) (E_Literal_X 249 (Integer_Literal 3) (nil) nil) (nil) nil)
            (S_Sequence_X 250
            (S_Procedure_Call_X 251 252 ((*Possible_I_Shapes*) 24) 
              ((E_Name_X 253 (E_Selected_Component_X 254 (E_Identifier_X 255 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (E_Name_X 257 (E_Identifier_X 258 ((*Y*) 62) (nil))) :: (E_Name_X 259 (E_Identifier_X 260 ((*X*) 63) (nil))) :: (E_Name_X 261 (E_Identifier_X 262 ((*R*) 64) (nil))) :: nil)
            ) 
            (S_Sequence_X 263
            (S_If_X 264 (E_Name_X 265 (E_Identifier_X 266 ((*R*) 64) (nil)))
              (S_Assignment_X 267 (E_Indexed_Component_X 268 (E_Indexed_Component_X 269 (E_Identifier_X 270 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 271 Plus (E_Name_X 272 (E_Selected_Component_X 273 (E_Identifier_X 274 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Name_X 276 (E_Identifier_X 277 ((*Y*) 62) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Binary_Operation_X 278 Plus (E_Name_X 279 (E_Selected_Component_X 280 (E_Identifier_X 281 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Name_X 283 (E_Identifier_X 284 ((*X*) 63) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 285 (E_Selected_Component_X 286 (E_Identifier_X 287 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
              S_Null_X
            ) 
            (S_Assignment_X 289 (E_Identifier_X 290 ((*X*) 63) (nil)) (E_Binary_Operation_X 291 Plus (E_Name_X 292 (E_Identifier_X 293 ((*X*) 63) (nil))) (E_Literal_X 294 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
          ) 
          (S_Assignment_X 295 (E_Identifier_X 296 ((*Y*) 62) (nil)) (E_Binary_Operation_X 297 Plus (E_Name_X 298 (E_Identifier_X 299 ((*Y*) 62) (nil))) (E_Literal_X 300 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)))
        )
        (S_While_Loop_X 301 (E_Binary_Operation_X 302 Less_Than_Or_Equal (E_Name_X 303 (E_Identifier_X 304 ((*Y*) 62) (nil))) (E_Literal_X 305 (Integer_Literal 2) (nil) nil) (nil) nil)
          (S_Sequence_X 306
          (S_While_Loop_X 307 (E_Binary_Operation_X 308 Less_Than_Or_Equal (E_Name_X 309 (E_Identifier_X 310 ((*X*) 63) (nil))) (E_Literal_X 311 (Integer_Literal 2) (nil) nil) (nil) nil)
            (S_Sequence_X 312
            (S_Procedure_Call_X 313 314 ((*Possible_Three_Shapes*) 25) 
              ((E_Name_X 315 (E_Selected_Component_X 316 (E_Identifier_X 317 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) :: (E_Name_X 319 (E_Selected_Component_X 320 (E_Identifier_X 321 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (E_Name_X 323 (E_Identifier_X 324 ((*Y*) 62) (nil))) :: (E_Name_X 325 (E_Identifier_X 326 ((*X*) 63) (nil))) :: (E_Name_X 327 (E_Identifier_X 328 ((*R*) 64) (nil))) :: nil)
            ) 
            (S_Sequence_X 329
            (S_If_X 330 (E_Name_X 331 (E_Identifier_X 332 ((*R*) 64) (nil)))
              (S_Assignment_X 333 (E_Indexed_Component_X 334 (E_Indexed_Component_X 335 (E_Identifier_X 336 ((*Cur_Board*) 8) (nil)) (E_Binary_Operation_X 337 Plus (E_Name_X 338 (E_Selected_Component_X 339 (E_Identifier_X 340 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (E_Name_X 342 (E_Identifier_X 343 ((*Y*) 62) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Binary_Operation_X 344 Plus (E_Name_X 345 (E_Selected_Component_X 346 (E_Identifier_X 347 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (E_Name_X 349 (E_Identifier_X 350 ((*X*) 63) (nil))) (Do_Range_Check :: nil) nil) (nil)) (E_Name_X 351 (E_Selected_Component_X 352 (E_Identifier_X 353 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
              S_Null_X
            ) 
            (S_Assignment_X 355 (E_Identifier_X 356 ((*X*) 63) (nil)) (E_Binary_Operation_X 357 Plus (E_Name_X 358 (E_Identifier_X 359 ((*X*) 63) (nil))) (E_Literal_X 360 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
          ) 
          (S_Assignment_X 361 (E_Identifier_X 362 ((*Y*) 62) (nil)) (E_Binary_Operation_X 363 Plus (E_Name_X 364 (E_Identifier_X 365 ((*Y*) 62) (nil))) (E_Literal_X 366 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil)))
        )
      )
    ) 
    (S_Assignment_X 367 (E_Identifier_X 368 ((*Cur_State*) 19) (nil)) (E_Literal_X 369 (Integer_Literal 2) (nil) nil)))
))) :: (((*Is_Empty_Line*) 28), (0, (mkprocedure_body_x 101
  (* = = = Procedure Name = = = *)
  ((*Is_Empty_Line*) 28)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
  (mkparameter_specification_x 103 ((*R*) 49) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_Assignment_X 104 (E_Identifier_X 105 ((*R*) 49) (nil)) (E_Literal_X 106 (Boolean_Literal true) (nil) nil))
))) :: (((*Move_Is_Possible*) 35), (0, (mkprocedure_body_x 547
  (* = = = Procedure Name = = = *)
  ((*Move_Is_Possible*) 35)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparameter_specification_x 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparameter_specification_x 550 ((*R*) 80) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_If_X 551 (E_Binary_Operation_X 552 Equal (E_Name_X 553 (E_Identifier_X 554 ((*A*) 79) (nil))) (E_Literal_X 555 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Assignment_X 556 (E_Identifier_X 557 ((*R*) 80) (nil)) (E_Binary_Operation_X 558 And (E_Binary_Operation_X 559 Greater_Than_Or_Equal (E_Binary_Operation_X 560 Minus (E_Name_X 561 (E_Selected_Component_X 562 (E_Identifier_X 563 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 565 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Unary_Operation_X 566 Unary_Minus (E_Literal_X 567 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (E_Binary_Operation_X 568 Less_Than_Or_Equal (E_Binary_Operation_X 569 Minus (E_Name_X 570 (E_Selected_Component_X 571 (E_Identifier_X 572 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 574 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 575 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
      (S_If_X 576 (E_Binary_Operation_X 577 Equal (E_Name_X 578 (E_Identifier_X 579 ((*A*) 79) (nil))) (E_Literal_X 580 (Integer_Literal 1) (nil) nil) (nil) nil)
        (S_Assignment_X 581 (E_Identifier_X 582 ((*R*) 80) (nil)) (E_Binary_Operation_X 583 And (E_Binary_Operation_X 584 Greater_Than_Or_Equal (E_Binary_Operation_X 585 Plus (E_Name_X 586 (E_Selected_Component_X 587 (E_Identifier_X 588 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 590 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Unary_Operation_X 591 Unary_Minus (E_Literal_X 592 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (E_Binary_Operation_X 593 Less_Than_Or_Equal (E_Binary_Operation_X 594 Plus (E_Name_X 595 (E_Selected_Component_X 596 (E_Identifier_X 597 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (E_Literal_X 599 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 600 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
        (S_If_X 601 (E_Binary_Operation_X 602 Equal (E_Name_X 603 (E_Identifier_X 604 ((*A*) 79) (nil))) (E_Literal_X 605 (Integer_Literal 2) (nil) nil) (nil) nil)
          (S_Assignment_X 606 (E_Identifier_X 607 ((*R*) 80) (nil)) (E_Binary_Operation_X 608 And (E_Binary_Operation_X 609 Greater_Than_Or_Equal (E_Binary_Operation_X 610 Plus (E_Name_X 611 (E_Selected_Component_X 612 (E_Identifier_X 613 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 615 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Unary_Operation_X 616 Unary_Minus (E_Literal_X 617 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (E_Binary_Operation_X 618 Less_Than_Or_Equal (E_Binary_Operation_X 619 Plus (E_Name_X 620 (E_Selected_Component_X 621 (E_Identifier_X 622 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 624 (Integer_Literal 1) (nil) nil) (nil) nil) (E_Literal_X 625 (Integer_Literal 49) (nil) nil) (nil) nil) (nil) nil))
          (S_Assignment_X 626 (E_Identifier_X 627 ((*R*) 80) (nil)) (E_Literal_X 628 (Boolean_Literal true) (nil) nil))
        )
      )
    )
))) :: (((*Turn_Direction*) 34), (0, (mkprocedure_body_x 508
  (* = = = Procedure Name = = = *)
  ((*Turn_Direction*) 34)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparameter_specification_x 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
  (mkparameter_specification_x 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_If_X 512 (E_Binary_Operation_X 513 Equal (E_Name_X 514 (E_Identifier_X 515 ((*T*) 76) (nil))) (E_Literal_X 516 (Integer_Literal 3) (nil) nil) (nil) nil)
      (S_If_X 517 (E_Binary_Operation_X 518 Equal (E_Name_X 519 (E_Identifier_X 520 ((*D*) 75) (nil))) (E_Literal_X 521 (Integer_Literal 0) (nil) nil) (nil) nil)
        (S_Assignment_X 522 (E_Identifier_X 523 ((*R*) 77) (nil)) (E_Literal_X 524 (Integer_Literal 3) (nil) nil))
        (S_Assignment_X 525 (E_Identifier_X 526 ((*R*) 77) (nil)) (E_Binary_Operation_X 527 Minus (E_Name_X 528 (E_Identifier_X 529 ((*D*) 75) (nil))) (E_Literal_X 530 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
      )
      (S_If_X 531 (E_Binary_Operation_X 532 Equal (E_Name_X 533 (E_Identifier_X 534 ((*D*) 75) (nil))) (E_Literal_X 535 (Integer_Literal 3) (nil) nil) (nil) nil)
        (S_Assignment_X 536 (E_Identifier_X 537 ((*R*) 77) (nil)) (E_Literal_X 538 (Integer_Literal 0) (nil) nil))
        (S_Assignment_X 539 (E_Identifier_X 540 ((*R*) 77) (nil)) (E_Binary_Operation_X 541 Plus (E_Name_X 542 (E_Identifier_X 543 ((*D*) 75) (nil))) (E_Literal_X 544 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
      )
    )
))) :: (((*Move*) 36), (0, (mkprocedure_body_x 631
  (* = = = Procedure Name = = = *)
  ((*Move*) 36)
  (* = = = Formal Parameters = = = *)
  (
  (mkparameter_specification_x 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparameter_specification_x 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparameter_specification_x 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (D_Null_Declaration_X)
  (* = = = Procedure Body = = = *)
    (S_If_X 635 (E_Binary_Operation_X 636 Equal (E_Name_X 637 (E_Identifier_X 638 ((*A*) 82) (nil))) (E_Literal_X 639 (Integer_Literal 0) (nil) nil) (nil) nil)
      (S_Assignment_X 640 (E_Selected_Component_X 641 (E_Identifier_X 642 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (E_Binary_Operation_X 644 Minus (E_Name_X 645 (E_Selected_Component_X 646 (E_Identifier_X 647 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (E_Literal_X 649 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
      (S_If_X 650 (E_Binary_Operation_X 651 Equal (E_Name_X 652 (E_Identifier_X 653 ((*A*) 82) (nil))) (E_Literal_X 654 (Integer_Literal 1) (nil) nil) (nil) nil)
        (S_Assignment_X 655 (E_Selected_Component_X 656 (E_Identifier_X 657 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (E_Binary_Operation_X 659 Plus (E_Name_X 660 (E_Selected_Component_X 661 (E_Identifier_X 662 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (E_Literal_X 664 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
        (S_If_X 665 (E_Binary_Operation_X 666 Equal (E_Name_X 667 (E_Identifier_X 668 ((*A*) 82) (nil))) (E_Literal_X 669 (Integer_Literal 2) (nil) nil) (nil) nil)
          (S_Assignment_X 670 (E_Selected_Component_X 671 (E_Identifier_X 672 ((*R*) 83) (nil)) ((*Y*) 16) (nil)) (E_Binary_Operation_X 674 Plus (E_Name_X 675 (E_Selected_Component_X 676 (E_Identifier_X 677 ((*P*) 81) (nil)) ((*Y*) 16) (nil))) (E_Literal_X 679 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))
          (S_Procedure_Call_X 680 681 ((*Turn_Direction*) 34) 
            ((E_Name_X 682 (E_Selected_Component_X 683 (E_Identifier_X 684 ((*P*) 81) (nil)) ((*D*) 14) (nil))) :: (E_Name_X 686 (E_Identifier_X 687 ((*A*) 82) (Do_Range_Check :: nil))) :: (E_Name_X 688 (E_Selected_Component_X 689 (E_Identifier_X 690 ((*R*) 83) (nil)) ((*D*) 14) (nil))) :: nil)
          )
        )
      )
    )
))) :: (((*Delete_Complete_Lines*) 39), (0, (mkprocedure_body_x 372
  (* = = = Procedure Name = = = *)
  ((*Delete_Complete_Lines*) 39)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((D_Seq_Declaration_X 373
(D_Object_Declaration_X 374 (mkobject_declaration_x 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
(D_Seq_Declaration_X 376
(D_Object_Declaration_X 378 (mkobject_declaration_x 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal_X 377 (Integer_Literal 10) (nil) nil))))) 
(D_Seq_Declaration_X 380
(D_Object_Declaration_X 382 (mkobject_declaration_x 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((E_Literal_X 381 (Boolean_Literal false) (nil) nil))))) 
(D_Seq_Declaration_X 384
(D_Object_Declaration_X 386 (mkobject_declaration_x 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((E_Literal_X 385 (Integer_Literal 1) (nil) nil))))) 
(D_Seq_Declaration_X 388
(D_Object_Declaration_X 389 (mkobject_declaration_x 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
(D_Object_Declaration_X 391 (mkobject_declaration_x 392 ((*R*) 71) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (S_Sequence_X 393
    (S_While_Loop_X 394 (E_Binary_Operation_X 395 Less_Than_Or_Equal (E_Name_X 396 (E_Identifier_X 397 ((*Del_Line*) 69) (nil))) (E_Literal_X 398 (Integer_Literal 50) (nil) nil) (nil) nil)
      (S_Sequence_X 399
      (S_Procedure_Call_X 400 401 ((*Is_Complete_Line*) 27) 
        ((E_Name_X 402 (E_Indexed_Component_X 403 (E_Identifier_X 404 ((*Cur_Board*) 8) (nil)) (E_Name_X 405 (E_Identifier_X 406 ((*Del_Line*) 69) (nil))) (nil))) :: (E_Name_X 407 (E_Identifier_X 408 ((*R*) 71) (nil))) :: nil)
      ) 
      (S_Sequence_X 409
      (S_If_X 410 (E_Name_X 411 (E_Identifier_X 412 ((*R*) 71) (nil)))
        (S_Sequence_X 413
        (S_Assignment_X 414 (E_Indexed_Component_X 415 (E_Identifier_X 416 ((*Cur_Board*) 8) (nil)) (E_Name_X 417 (E_Identifier_X 418 ((*Del_Line*) 69) (nil))) (nil)) (E_Name_X 419 (E_Identifier_X 420 ((*Empty_Line*) 66) (nil)))) 
        (S_Sequence_X 421
        (S_Assignment_X 422 (E_Identifier_X 423 ((*Has_Complete_Lines*) 68) (nil)) (E_Literal_X 424 (Boolean_Literal true) (nil) nil)) 
        (S_Assignment_X 425 (E_Identifier_X 426 ((*To_Line*) 67) (nil)) (E_Name_X 427 (E_Identifier_X 428 ((*Del_Line*) 69) (nil))))))
        S_Null_X
      ) 
      (S_Assignment_X 429 (E_Identifier_X 430 ((*Del_Line*) 69) (nil)) (E_Binary_Operation_X 431 Plus (E_Name_X 432 (E_Identifier_X 433 ((*Del_Line*) 69) (nil))) (E_Literal_X 434 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
    ) 
    (S_Sequence_X 435
    (S_If_X 436 (E_Name_X 437 (E_Identifier_X 438 ((*Has_Complete_Lines*) 68) (nil)))
      (S_Sequence_X 439
      (S_Assignment_X 440 (E_Identifier_X 441 ((*From_Line*) 70) (nil)) (E_Literal_X 442 (Integer_Literal 9) (nil) nil)) 
      (S_While_Loop_X 443 (E_Binary_Operation_X 444 Greater_Than_Or_Equal (E_Name_X 445 (E_Identifier_X 446 ((*From_Line*) 70) (nil))) (E_Literal_X 447 (Integer_Literal 1) (nil) nil) (nil) nil)
        (S_Sequence_X 448
        (S_Procedure_Call_X 449 450 ((*Is_Empty_Line*) 28) 
          ((E_Name_X 451 (E_Indexed_Component_X 452 (E_Identifier_X 453 ((*Cur_Board*) 8) (nil)) (E_Name_X 454 (E_Identifier_X 455 ((*From_Line*) 70) (nil))) (nil))) :: (E_Name_X 456 (E_Identifier_X 457 ((*R*) 71) (nil))) :: nil)
        ) 
        (S_Sequence_X 458
        (S_If_X 459 (E_Unary_Operation_X 460 Not (E_Name_X 461 (E_Identifier_X 462 ((*R*) 71) (nil))) (nil) nil)
          (S_Sequence_X 463
          (S_Assignment_X 464 (E_Indexed_Component_X 465 (E_Identifier_X 466 ((*Cur_Board*) 8) (nil)) (E_Name_X 467 (E_Identifier_X 468 ((*To_Line*) 67) (nil))) (nil)) (E_Name_X 469 (E_Indexed_Component_X 470 (E_Identifier_X 471 ((*Cur_Board*) 8) (nil)) (E_Name_X 472 (E_Identifier_X 473 ((*From_Line*) 70) (nil))) (nil)))) 
          (S_Sequence_X 474
          (S_Assignment_X 475 (E_Indexed_Component_X 476 (E_Identifier_X 477 ((*Cur_Board*) 8) (nil)) (E_Name_X 478 (E_Identifier_X 479 ((*From_Line*) 70) (nil))) (nil)) (E_Name_X 480 (E_Identifier_X 481 ((*Empty_Line*) 66) (nil)))) 
          (S_Assignment_X 482 (E_Identifier_X 483 ((*To_Line*) 67) (nil)) (E_Binary_Operation_X 484 Minus (E_Name_X 485 (E_Identifier_X 486 ((*To_Line*) 67) (nil))) (E_Literal_X 487 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
          S_Null_X
        ) 
        (S_Assignment_X 488 (E_Identifier_X 489 ((*From_Line*) 70) (nil)) (E_Binary_Operation_X 490 Minus (E_Name_X 491 (E_Identifier_X 492 ((*From_Line*) 70) (nil))) (E_Literal_X 493 (Integer_Literal 1) (nil) nil) (Do_Range_Check :: nil) nil))))
      ))
      S_Null_X
    ) 
    (S_Assignment_X 494 (E_Identifier_X 495 ((*Cur_State*) 19) (nil)) (E_Literal_X 496 (Integer_Literal 3) (nil) nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Oriented_Three_Shape*) 23), (Array_Type_Declaration_X 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) :: (((*Y_Coord*) 5), (Subtype_Declaration_X 16 ((*Y_Coord*) 5) Integer (Range_X 1 50))) :: (((*Board*) 7), (Array_Type_Declaration_X 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) :: (((*Move_Action*) 32), (Subtype_Declaration_X 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (Range_X 0 1))) :: (((*Cell*) 1), (Derived_Type_Declaration_X 4 ((*Cell*) 1) Integer (Range_X 0 8))) :: (((*Line*) 6), (Array_Type_Declaration_X 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) :: (((*PY_Coord*) 10), (Subtype_Declaration_X 31 ((*PY_Coord*) 10) Integer (Range_X (-1) 49))) :: (((*Oriented_I_Shape*) 21), (Array_Type_Declaration_X 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) :: (((*Action*) 31), (Derived_Type_Declaration_X 69 ((*Action*) 31) Integer (Range_X 0 4))) :: (((*Direction*) 11), (Derived_Type_Declaration_X 34 ((*Direction*) 11) Integer (Range_X 0 3))) :: (((*Piece*) 12), (Record_Type_Declaration_X 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) :: (((*Shape*) 2), (Subtype_Declaration_X 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (Range_X 1 8))) :: (((*I_Delta*) 20), (Subtype_Declaration_X 50 ((*I_Delta*) 20) Integer (Range_X 0 3))) :: (((*State*) 18), (Derived_Type_Declaration_X 44 ((*State*) 18) Integer (Range_X 0 3))) :: (((*X_Coord*) 4), (Subtype_Declaration_X 13 ((*X_Coord*) 4) Integer (Range_X 1 10))) :: (((*Turn_Action*) 33), (Subtype_Declaration_X 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (Range_X 3 4))) :: (((*Three_Delta*) 22), (Subtype_Declaration_X 56 ((*Three_Delta*) 22) Integer (Range_X 0 2))) :: (((*Three_Shape*) 3), (Subtype_Declaration_X 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (Range_X 3 8))) :: (((*PX_Coord*) 9), (Subtype_Declaration_X 28 ((*PX_Coord*) 9) Integer (Range_X (-1) 9))) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  ((218, (Subtype ((*PY_Coord*) 10))) :: (559, Boolean) :: (227, Integer) :: (568, Boolean) :: (433, (Subtype ((*Y_Coord*) 5))) :: (442, Integer) :: (200, (Record_Type ((*Piece*) 12))) :: (173, (Subtype ((*Shape*) 2))) :: (514, (Subtype ((*Turn_Action*) 33))) :: (209, (Subtype ((*Shape*) 2))) :: (523, (Derived_Type ((*Direction*) 11))) :: (182, (Record_Type ((*Piece*) 12))) :: (254, (Derived_Type ((*Direction*) 11))) :: (191, (Record_Type ((*Piece*) 12))) :: (720, (Record_Type ((*Piece*) 12))) :: (729, (Array_Type ((*Board*) 7))) :: (424, Boolean) :: (155, (Subtype ((*Shape*) 2))) :: (469, (Array_Type ((*Line*) 6))) :: (496, Integer) :: (164, (Record_Type ((*Piece*) 12))) :: (478, (Subtype ((*Y_Coord*) 5))) :: (505, Boolean) :: (577, Boolean) :: (451, (Array_Type ((*Line*) 6))) :: (460, Boolean) :: (532, Boolean) :: (541, (Derived_Type ((*Direction*) 11))) :: (406, (Subtype ((*Y_Coord*) 5))) :: (415, (Array_Type ((*Line*) 6))) :: (487, Integer) :: (236, (Record_Type ((*Piece*) 12))) :: (741, (Record_Type ((*Piece*) 12))) :: (678, (Subtype ((*PY_Coord*) 10))) :: (445, (Subtype ((*Y_Coord*) 5))) :: (732, (Record_Type ((*Piece*) 12))) :: (472, (Subtype ((*Y_Coord*) 5))) :: (427, (Subtype ((*Y_Coord*) 5))) :: (176, (Derived_Type ((*Cell*) 1))) :: (723, (Derived_Type ((*Action*) 31))) :: (418, (Subtype ((*Y_Coord*) 5))) :: (490, Integer) :: (185, (Subtype ((*PX_Coord*) 9))) :: (167, (Subtype ((*PX_Coord*) 9))) :: (364, (Subtype ((*I_Delta*) 20))) :: (140, Integer) :: (113, Boolean) :: (454, (Subtype ((*Y_Coord*) 5))) :: (481, (Array_Type ((*Line*) 6))) :: (687, (Derived_Type ((*Action*) 31))) :: (660, (Subtype ((*PX_Coord*) 9))) :: (346, (Subtype ((*PX_Coord*) 9))) :: (669, Integer) :: (708, (Record_Type ((*Piece*) 12))) :: (403, (Array_Type ((*Line*) 6))) :: (134, Boolean) :: (600, Integer) :: (609, Boolean) :: (690, (Record_Type ((*Piece*) 12))) :: (349, (Subtype ((*I_Delta*) 20))) :: (358, (Subtype ((*I_Delta*) 20))) :: (430, (Subtype ((*Y_Coord*) 5))) :: (672, (Record_Type ((*Piece*) 12))) :: (645, (Subtype ((*PX_Coord*) 9))) :: (331, Boolean) :: (304, (Subtype ((*I_Delta*) 20))) :: (654, Integer) :: (340, (Record_Type ((*Piece*) 12))) :: (89, Boolean) :: (286, (Subtype ((*Shape*) 2))) :: (627, Boolean) :: (636, Boolean) :: (457, Boolean) :: (663, (Subtype ((*PX_Coord*) 9))) :: (98, Boolean) :: (412, Boolean) :: (618, Boolean) :: (322, (Derived_Type ((*Direction*) 11))) :: (385, Integer) :: (567, Integer) :: (639, Integer) :: (648, (Subtype ((*PX_Coord*) 9))) :: (397, (Subtype ((*Y_Coord*) 5))) :: (262, Boolean) :: (603, (Derived_Type ((*Action*) 31))) :: (298, (Subtype ((*I_Delta*) 20))) :: (711, Boolean) :: (684, (Record_Type ((*Piece*) 12))) :: (343, (Subtype ((*I_Delta*) 20))) :: (352, (Subtype ((*Shape*) 2))) :: (558, Boolean) :: (585, Integer) :: (253, (Derived_Type ((*Direction*) 11))) :: (226, (Subtype ((*PX_Coord*) 9))) :: (594, Integer) :: (666, Boolean) :: (325, (Subtype ((*I_Delta*) 20))) :: (675, (Subtype ((*PY_Coord*) 10))) :: (334, (Derived_Type ((*Cell*) 1))) :: (540, (Derived_Type ((*Direction*) 11))) :: (235, (Subtype ((*Shape*) 2))) :: (621, (Subtype ((*PY_Coord*) 10))) :: (657, (Record_Type ((*Piece*) 12))) :: (316, (Subtype ((*Shape*) 2))) :: (271, Integer) :: (612, (Subtype ((*PY_Coord*) 10))) :: (280, (Subtype ((*PX_Coord*) 9))) :: (319, (Derived_Type ((*Direction*) 11))) :: (516, Integer) :: (552, Boolean) :: (184, Integer) :: (534, (Derived_Type ((*Direction*) 11))) :: (597, (Record_Type ((*Piece*) 12))) :: (265, Boolean) :: (615, Integer) :: (480, (Array_Type ((*Line*) 6))) :: (256, (Derived_Type ((*Direction*) 11))) :: (337, Integer) :: (211, (Subtype ((*Shape*) 2))) :: (283, (Subtype ((*I_Delta*) 20))) :: (624, Integer) :: (292, (Subtype ((*I_Delta*) 20))) :: (166, (Subtype ((*PX_Coord*) 9))) :: (579, (Derived_Type ((*Action*) 31))) :: (274, (Record_Type ((*Piece*) 12))) :: (247, (Subtype ((*I_Delta*) 20))) :: (588, (Record_Type ((*Piece*) 12))) :: (328, Boolean) :: (489, (Subtype ((*Y_Coord*) 5))) :: (220, (Subtype ((*PY_Coord*) 10))) :: (561, (Subtype ((*PX_Coord*) 9))) :: (229, (Subtype ((*Shape*) 2))) :: (543, (Derived_Type ((*Direction*) 11))) :: (570, (Subtype ((*PX_Coord*) 9))) :: (202, Integer) :: (238, Integer) :: (642, (Record_Type ((*Piece*) 12))) :: (651, Boolean) :: (310, (Subtype ((*I_Delta*) 20))) :: (277, (Subtype ((*I_Delta*) 20))) :: (483, (Subtype ((*Y_Coord*) 5))) :: (151, Boolean) :: (492, (Subtype ((*Y_Coord*) 5))) :: (223, (Subtype ((*PX_Coord*) 9))) :: (564, (Subtype ((*PX_Coord*) 9))) :: (259, (Subtype ((*I_Delta*) 20))) :: (573, (Subtype ((*PX_Coord*) 9))) :: (124, Boolean) :: (438, Boolean) :: (537, (Derived_Type ((*Direction*) 11))) :: (106, Boolean) :: (447, Integer) :: (205, (Record_Type ((*Piece*) 12))) :: (519, (Derived_Type ((*Direction*) 11))) :: (214, (Array_Type ((*Line*) 6))) :: (555, Integer) :: (528, (Derived_Type ((*Direction*) 11))) :: (420, (Array_Type ((*Line*) 6))) :: (160, (Array_Type ((*Line*) 6))) :: (169, (Subtype ((*PX_Coord*) 9))) :: (178, (Array_Type ((*Board*) 7))) :: (582, Boolean) :: (591, Integer) :: (456, Boolean) :: (465, (Array_Type ((*Line*) 6))) :: (187, (Record_Type ((*Piece*) 12))) :: (196, (Array_Type ((*Line*) 6))) :: (268, (Derived_Type ((*Cell*) 1))) :: (241, (Subtype ((*I_Delta*) 20))) :: (369, Integer) :: (441, (Subtype ((*Y_Coord*) 5))) :: (181, (Subtype ((*PY_Coord*) 10))) :: (163, (Subtype ((*PY_Coord*) 10))) :: (477, (Array_Type ((*Board*) 7))) :: (172, (Record_Type ((*Piece*) 12))) :: (513, Boolean) :: (432, (Subtype ((*Y_Coord*) 5))) :: (468, (Subtype ((*Y_Coord*) 5))) :: (199, (Subtype ((*PY_Coord*) 10))) :: (208, (Subtype ((*Shape*) 2))) :: (217, (Subtype ((*PY_Coord*) 10))) :: (683, (Derived_Type ((*Direction*) 11))) :: (423, Boolean) :: (495, (Derived_Type ((*State*) 18))) :: (190, (Subtype ((*Shape*) 2))) :: (504, Boolean) :: (737, Boolean) :: (396, (Subtype ((*Y_Coord*) 5))) :: (710, (Derived_Type ((*Action*) 31))) :: (746, Boolean) :: (405, (Subtype ((*Y_Coord*) 5))) :: (486, (Subtype ((*Y_Coord*) 5))) :: (154, (Record_Type ((*Piece*) 12))) :: (360, Integer) :: (740, (Record_Type ((*Piece*) 12))) :: (426, (Subtype ((*Y_Coord*) 5))) :: (408, Boolean) :: (300, Integer) :: (686, (Derived_Type ((*Action*) 31))) :: (623, (Subtype ((*PY_Coord*) 10))) :: (722, (Derived_Type ((*Action*) 31))) :: (381, Boolean) :: (354, (Subtype ((*Shape*) 2))) :: (471, (Array_Type ((*Board*) 7))) :: (677, (Record_Type ((*Piece*) 12))) :: (336, (Array_Type ((*Board*) 7))) :: (345, (Subtype ((*PX_Coord*) 9))) :: (641, (Subtype ((*PX_Coord*) 9))) :: (453, (Array_Type ((*Board*) 7))) :: (462, Boolean) :: (668, (Derived_Type ((*Action*) 31))) :: (363, Integer) :: (749, Boolean) :: (417, (Subtype ((*Y_Coord*) 5))) :: (444, Boolean) :: (309, (Subtype ((*I_Delta*) 20))) :: (659, Integer) :: (318, (Subtype ((*Shape*) 2))) :: (731, (Record_Type ((*Piece*) 12))) :: (327, Boolean) :: (357, Integer) :: (97, Boolean) :: (563, (Record_Type ((*Piece*) 12))) :: (653, (Derived_Type ((*Action*) 31))) :: (348, (Subtype ((*PX_Coord*) 9))) :: (734, Boolean) :: (402, (Array_Type ((*Line*) 6))) :: (294, Integer) :: (608, Boolean) :: (707, (Record_Type ((*Piece*) 12))) :: (644, Integer) :: (303, (Subtype ((*I_Delta*) 20))) :: (716, Boolean) :: (725, (Record_Type ((*Piece*) 12))) :: (411, Boolean) :: (276, (Subtype ((*I_Delta*) 20))) :: (249, Integer) :: (590, Integer) :: (285, (Subtype ((*Shape*) 2))) :: (258, (Subtype ((*I_Delta*) 20))) :: (599, Integer) :: (671, (Subtype ((*PY_Coord*) 10))) :: (339, (Subtype ((*PY_Coord*) 10))) :: (366, Integer) :: (572, (Record_Type ((*Piece*) 12))) :: (240, Boolean) :: (662, (Record_Type ((*Piece*) 12))) :: (321, (Record_Type ((*Piece*) 12))) :: (617, Integer) :: (689, (Derived_Type ((*Direction*) 11))) :: (521, Integer) :: (557, Boolean) :: (189, (Subtype ((*Shape*) 2))) :: (530, Integer) :: (225, (Record_Type ((*Piece*) 12))) :: (180, (Subtype ((*PY_Coord*) 10))) :: (674, Integer) :: (342, (Subtype ((*I_Delta*) 20))) :: (207, Integer) :: (216, Integer) :: (288, (Subtype ((*Shape*) 2))) :: (324, (Subtype ((*I_Delta*) 20))) :: (297, Integer) :: (638, (Derived_Type ((*Action*) 31))) :: (198, (Subtype ((*PY_Coord*) 10))) :: (270, (Array_Type ((*Board*) 7))) :: (584, Boolean) :: (611, (Subtype ((*PY_Coord*) 10))) :: (279, (Subtype ((*PX_Coord*) 9))) :: (593, Boolean) :: (620, (Subtype ((*PY_Coord*) 10))) :: (351, (Subtype ((*Shape*) 2))) :: (566, Integer) :: (261, Boolean) :: (234, (Subtype ((*Shape*) 2))) :: (575, Integer) :: (602, Boolean) :: (647, (Record_Type ((*Piece*) 12))) :: (243, Integer) :: (656, (Subtype ((*PX_Coord*) 9))) :: (315, (Subtype ((*Shape*) 2))) :: (282, (Subtype ((*PX_Coord*) 9))) :: (183, (Subtype ((*PY_Coord*) 10))) :: (587, (Subtype ((*PX_Coord*) 9))) :: (156, Integer) :: (255, (Record_Type ((*Piece*) 12))) :: (569, Integer) :: (596, (Subtype ((*PX_Coord*) 9))) :: (228, (Subtype ((*Shape*) 2))) :: (578, (Derived_Type ((*Action*) 31))) :: (461, Boolean) :: (470, (Array_Type ((*Line*) 6))) :: (452, (Array_Type ((*Line*) 6))) :: (479, (Subtype ((*Y_Coord*) 5))) :: (542, (Derived_Type ((*Direction*) 11))) :: (210, (Record_Type ((*Piece*) 12))) :: (560, Integer) :: (219, (Record_Type ((*Piece*) 12))) :: (291, Integer) :: (165, (Subtype ((*PY_Coord*) 10))) :: (515, (Subtype ((*Turn_Action*) 33))) :: (237, (Subtype ((*Shape*) 2))) :: (246, Boolean) :: (524, Integer) :: (192, (Subtype ((*Shape*) 2))) :: (533, (Derived_Type ((*Direction*) 11))) :: (201, (Subtype ((*PY_Coord*) 10))) :: (605, Integer) :: (273, (Subtype ((*PY_Coord*) 10))) :: (614, (Subtype ((*PY_Coord*) 10))) :: (186, (Subtype ((*PX_Coord*) 9))) :: (213, (Derived_Type ((*Cell*) 1))) :: (222, Integer) :: (437, Boolean) :: (168, (Record_Type ((*Piece*) 12))) :: (177, (Array_Type ((*Line*) 6))) :: (518, Boolean) :: (715, Boolean) :: (724, (Record_Type ((*Piece*) 12))) :: (733, Boolean) :: (159, (Derived_Type ((*Cell*) 1))) :: (473, (Subtype ((*Y_Coord*) 5))) :: (554, (Derived_Type ((*Action*) 31))) :: (105, Boolean) :: (419, (Array_Type ((*Line*) 6))) :: (446, (Subtype ((*Y_Coord*) 5))) :: (114, Boolean) :: (428, (Subtype ((*Y_Coord*) 5))) :: (455, (Subtype ((*Y_Coord*) 5))) :: (123, Boolean) :: (527, (Derived_Type ((*Direction*) 11))) :: (195, (Derived_Type ((*Cell*) 1))) :: (204, (Subtype ((*PX_Coord*) 9))) :: (742, (Record_Type ((*Piece*) 12))) :: (491, (Subtype ((*Y_Coord*) 5))) :: (231, (Subtype ((*Shape*) 2))) :: (332, Boolean) :: (745, Boolean) :: (90, Boolean) :: (404, (Array_Type ((*Board*) 7))) :: (431, Integer) :: (646, (Subtype ((*PX_Coord*) 9))) :: (395, Boolean) :: (682, (Derived_Type ((*Direction*) 11))) :: (341, (Subtype ((*PY_Coord*) 10))) :: (691, (Derived_Type ((*Direction*) 11))) :: (171, (Subtype ((*Shape*) 2))) :: (377, Integer) :: (144, Integer) :: (485, (Subtype ((*Y_Coord*) 5))) :: (153, (Subtype ((*Shape*) 2))) :: (467, (Subtype ((*Y_Coord*) 5))) :: (162, (Subtype ((*PY_Coord*) 10))) :: (359, (Subtype ((*I_Delta*) 20))) :: (673, (Subtype ((*PY_Coord*) 10))) :: (709, (Derived_Type ((*Action*) 31))) :: (368, (Derived_Type ((*State*) 18))) :: (135, Boolean) :: (476, (Array_Type ((*Line*) 6))) :: (350, (Subtype ((*I_Delta*) 20))) :: (664, Integer) :: (323, (Subtype ((*I_Delta*) 20))) :: (736, Boolean) :: (362, (Subtype ((*I_Delta*) 20))) :: (676, (Subtype ((*PY_Coord*) 10))) :: (272, (Subtype ((*PY_Coord*) 10))) :: (685, (Derived_Type ((*Direction*) 11))) :: (344, Integer) :: (658, (Subtype ((*PX_Coord*) 9))) :: (317, (Record_Type ((*Piece*) 12))) :: (353, (Record_Type ((*Piece*) 12))) :: (434, Integer) :: (326, (Subtype ((*I_Delta*) 20))) :: (299, (Subtype ((*I_Delta*) 20))) :: (335, (Array_Type ((*Line*) 6))) :: (649, Integer) :: (308, Boolean) :: (721, (Record_Type ((*Piece*) 12))) :: (730, (Array_Type ((*Board*) 7))) :: (416, (Array_Type ((*Board*) 7))) :: (281, (Record_Type ((*Piece*) 12))) :: (595, (Subtype ((*PX_Coord*) 9))) :: (622, (Record_Type ((*Piece*) 12))) :: (290, (Subtype ((*I_Delta*) 20))) :: (604, (Derived_Type ((*Action*) 31))) :: (712, Boolean) :: (586, (Subtype ((*PX_Coord*) 9))) :: (667, (Derived_Type ((*Action*) 31))) :: (398, Integer) :: (748, Boolean) :: (407, Boolean) :: (613, (Record_Type ((*Piece*) 12))) :: (356, (Subtype ((*I_Delta*) 20))) :: (562, (Subtype ((*PX_Coord*) 9))) :: (230, (Record_Type ((*Piece*) 12))) :: (257, (Subtype ((*I_Delta*) 20))) :: (598, (Subtype ((*PX_Coord*) 9))) :: (679, Integer) :: (338, (Subtype ((*PY_Coord*) 10))) :: (688, (Derived_Type ((*Direction*) 11))) :: (347, (Record_Type ((*Piece*) 12))) :: (553, (Derived_Type ((*Action*) 31))) :: (652, (Derived_Type ((*Action*) 31))) :: (248, (Subtype ((*I_Delta*) 20))) :: (221, Integer) :: (589, (Subtype ((*PX_Coord*) 9))) :: (661, (Subtype ((*PX_Coord*) 9))) :: (320, (Derived_Type ((*Direction*) 11))) :: (302, Boolean) :: (643, (Subtype ((*PX_Coord*) 9))) :: (535, Integer) :: (203, (Subtype ((*PX_Coord*) 9))) :: (544, Integer) :: (275, (Subtype ((*PY_Coord*) 10))) :: (616, Integer) :: (311, Integer) :: (284, (Subtype ((*I_Delta*) 20))) :: (625, Integer) :: (293, (Subtype ((*I_Delta*) 20))) :: (365, (Subtype ((*I_Delta*) 20))) :: (526, (Derived_Type ((*Direction*) 11))) :: (571, (Subtype ((*PX_Coord*) 9))) :: (266, Boolean) :: (580, Integer) :: (607, Boolean) :: (628, Boolean) :: (520, (Derived_Type ((*Direction*) 11))) :: (179, Integer) :: (152, (Subtype ((*Shape*) 2))) :: (493, Integer) :: (188, (Subtype ((*PX_Coord*) 9))) :: (592, Integer) :: (260, (Subtype ((*I_Delta*) 20))) :: (269, (Array_Type ((*Line*) 6))) :: (610, Integer) :: (170, (Subtype ((*Shape*) 2))) :: (484, Integer) :: (215, (Array_Type ((*Board*) 7))) :: (565, Integer) :: (466, (Array_Type ((*Board*) 7))) :: (287, (Record_Type ((*Piece*) 12))) :: (161, (Array_Type ((*Board*) 7))) :: (574, Integer) :: (242, (Subtype ((*I_Delta*) 20))) :: (583, Boolean) :: (529, (Derived_Type ((*Direction*) 11))) :: (197, (Array_Type ((*Board*) 7))) :: (224, (Subtype ((*PX_Coord*) 9))) :: (538, Integer) :: (296, (Subtype ((*I_Delta*) 20))) :: (206, (Subtype ((*PX_Coord*) 9))) :: (233, Boolean) :: (637, (Derived_Type ((*Action*) 31))) :: (305, Integer) :: (278, Integer) :: (619, Integer) :: nil)
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  ((218, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)24)) :: (559, (sloc (*Line*)178 (*Col*)8 (*EndLine*)178 (*EndCol*)22)) :: (227, (sloc (*Line*)74 (*Col*)46 (*EndLine*)74 (*EndCol*)46)) :: (568, (sloc (*Line*)178 (*Col*)28 (*EndLine*)178 (*EndCol*)41)) :: (433, (sloc (*Line*)125 (*Col*)22 (*EndLine*)125 (*EndCol*)29)) :: (442, (sloc (*Line*)131 (*Col*)16 (*EndLine*)131 (*EndCol*)16)) :: (200, (sloc (*Line*)73 (*Col*)14 (*EndLine*)73 (*EndCol*)22)) :: (173, (sloc (*Line*)71 (*Col*)62 (*EndLine*)71 (*EndCol*)62)) :: (514, (sloc (*Line*)159 (*Col*)10 (*EndLine*)159 (*EndCol*)10)) :: (209, (sloc (*Line*)73 (*Col*)52 (*EndLine*)73 (*EndCol*)62)) :: (523, (sloc (*Line*)161 (*Col*)6 (*EndLine*)161 (*EndCol*)6)) :: (182, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)22)) :: (254, (sloc (*Line*)78 (*Col*)28 (*EndLine*)78 (*EndCol*)38)) :: (191, (sloc (*Line*)72 (*Col*)52 (*EndLine*)72 (*EndCol*)60)) :: (720, (sloc (*Line*)212 (*Col*)9 (*EndLine*)212 (*EndCol*)17)) :: (729, (sloc (*Line*)214 (*Col*)15 (*EndLine*)214 (*EndCol*)23)) :: (424, (sloc (*Line*)122 (*Col*)35 (*EndLine*)122 (*EndCol*)38)) :: (155, (sloc (*Line*)70 (*Col*)20 (*EndLine*)70 (*EndCol*)20)) :: (469, (sloc (*Line*)135 (*Col*)39 (*EndLine*)135 (*EndCol*)59)) :: (496, (sloc (*Line*)145 (*Col*)20 (*EndLine*)145 (*EndCol*)20)) :: (164, (sloc (*Line*)71 (*Col*)14 (*EndLine*)71 (*EndCol*)22)) :: (478, (sloc (*Line*)136 (*Col*)27 (*EndLine*)136 (*EndCol*)35)) :: (505, (sloc (*Line*)154 (*Col*)12 (*EndLine*)154 (*EndCol*)15)) :: (577, (sloc (*Line*)179 (*Col*)13 (*EndLine*)179 (*EndCol*)17)) :: (451, (sloc (*Line*)133 (*Col*)21 (*EndLine*)133 (*EndCol*)41)) :: (460, (sloc (*Line*)134 (*Col*)16 (*EndLine*)134 (*EndCol*)20)) :: (532, (sloc (*Line*)166 (*Col*)6 (*EndLine*)166 (*EndCol*)10)) :: (541, (sloc (*Line*)169 (*Col*)11 (*EndLine*)169 (*EndCol*)15)) :: (406, (sloc (*Line*)119 (*Col*)32 (*EndLine*)119 (*EndCol*)39)) :: (415, (sloc (*Line*)121 (*Col*)13 (*EndLine*)121 (*EndCol*)32)) :: (487, (sloc (*Line*)137 (*Col*)37 (*EndLine*)137 (*EndCol*)37)) :: (236, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)21)) :: (741, (sloc (*Line*)216 (*Col*)26 (*EndLine*)216 (*EndCol*)34)) :: (678, (sloc (*Line*)195 (*Col*)12 (*EndLine*)195 (*EndCol*)12)) :: (445, (sloc (*Line*)132 (*Col*)16 (*EndLine*)132 (*EndCol*)24)) :: (732, (sloc (*Line*)214 (*Col*)26 (*EndLine*)214 (*EndCol*)34)) :: (472, (sloc (*Line*)135 (*Col*)50 (*EndLine*)135 (*EndCol*)58)) :: (427, (sloc (*Line*)123 (*Col*)24 (*EndLine*)123 (*EndCol*)31)) :: (176, (sloc (*Line*)72 (*Col*)3 (*EndLine*)72 (*EndCol*)43)) :: (723, (sloc (*Line*)212 (*Col*)20 (*EndLine*)212 (*EndCol*)20)) :: (418, (sloc (*Line*)121 (*Col*)24 (*EndLine*)121 (*EndCol*)31)) :: (490, (sloc (*Line*)139 (*Col*)19 (*EndLine*)139 (*EndCol*)31)) :: (185, (sloc (*Line*)72 (*Col*)32 (*EndLine*)72 (*EndCol*)42)) :: (167, (sloc (*Line*)71 (*Col*)28 (*EndLine*)71 (*EndCol*)38)) :: (364, (sloc (*Line*)95 (*Col*)11 (*EndLine*)95 (*EndCol*)11)) :: (140, (sloc (*Line*)66 (*Col*)22 (*EndLine*)66 (*EndCol*)22)) :: (113, (sloc (*Line*)48 (*Col*)7 (*EndLine*)48 (*EndCol*)7)) :: (454, (sloc (*Line*)133 (*Col*)32 (*EndLine*)133 (*EndCol*)40)) :: (481, (sloc (*Line*)136 (*Col*)41 (*EndLine*)136 (*EndCol*)50)) :: (687, (sloc (*Line*)197 (*Col*)24 (*EndLine*)197 (*EndCol*)24)) :: (660, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)12)) :: (346, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)44)) :: (669, (sloc (*Line*)194 (*Col*)17 (*EndLine*)194 (*EndCol*)17)) :: (708, (sloc (*Line*)210 (*Col*)25 (*EndLine*)210 (*EndCol*)33)) :: (403, (sloc (*Line*)119 (*Col*)21 (*EndLine*)119 (*EndCol*)40)) :: (134, (sloc (*Line*)58 (*Col*)7 (*EndLine*)58 (*EndCol*)7)) :: (600, (sloc (*Line*)180 (*Col*)41 (*EndLine*)180 (*EndCol*)41)) :: (609, (sloc (*Line*)182 (*Col*)8 (*EndLine*)182 (*EndCol*)22)) :: (690, (sloc (*Line*)197 (*Col*)27 (*EndLine*)197 (*EndCol*)27)) :: (349, (sloc (*Line*)91 (*Col*)48 (*EndLine*)91 (*EndCol*)48)) :: (358, (sloc (*Line*)93 (*Col*)14 (*EndLine*)93 (*EndCol*)14)) :: (430, (sloc (*Line*)125 (*Col*)10 (*EndLine*)125 (*EndCol*)17)) :: (672, (sloc (*Line*)195 (*Col*)3 (*EndLine*)195 (*EndCol*)3)) :: (645, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)12)) :: (331, (sloc (*Line*)90 (*Col*)12 (*EndLine*)90 (*EndCol*)12)) :: (304, (sloc (*Line*)87 (*Col*)9 (*EndLine*)87 (*EndCol*)9)) :: (654, (sloc (*Line*)192 (*Col*)17 (*EndLine*)192 (*EndCol*)17)) :: (340, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)24)) :: (89, (sloc (*Line*)33 (*Col*)7 (*EndLine*)33 (*EndCol*)7)) :: (286, (sloc (*Line*)80 (*Col*)54 (*EndLine*)80 (*EndCol*)64)) :: (627, (sloc (*Line*)184 (*Col*)3 (*EndLine*)184 (*EndCol*)3)) :: (636, (sloc (*Line*)190 (*Col*)10 (*EndLine*)190 (*EndCol*)14)) :: (457, (sloc (*Line*)133 (*Col*)44 (*EndLine*)133 (*EndCol*)44)) :: (663, (sloc (*Line*)193 (*Col*)12 (*EndLine*)193 (*EndCol*)12)) :: (98, (sloc (*Line*)38 (*Col*)12 (*EndLine*)38 (*EndCol*)15)) :: (412, (sloc (*Line*)120 (*Col*)13 (*EndLine*)120 (*EndCol*)13)) :: (618, (sloc (*Line*)182 (*Col*)28 (*EndLine*)182 (*EndCol*)42)) :: (322, (sloc (*Line*)89 (*Col*)55 (*EndLine*)89 (*EndCol*)55)) :: (385, (sloc (*Line*)112 (*Col*)29 (*EndLine*)112 (*EndCol*)29)) :: (567, (sloc (*Line*)178 (*Col*)22 (*EndLine*)178 (*EndCol*)22)) :: (639, (sloc (*Line*)190 (*Col*)14 (*EndLine*)190 (*EndCol*)14)) :: (648, (sloc (*Line*)191 (*Col*)12 (*EndLine*)191 (*EndCol*)12)) :: (397, (sloc (*Line*)118 (*Col*)13 (*EndLine*)118 (*EndCol*)20)) :: (262, (sloc (*Line*)78 (*Col*)47 (*EndLine*)78 (*EndCol*)47)) :: (603, (sloc (*Line*)181 (*Col*)13 (*EndLine*)181 (*EndCol*)13)) :: (298, (sloc (*Line*)84 (*Col*)11 (*EndLine*)84 (*EndCol*)11)) :: (711, (sloc (*Line*)210 (*Col*)39 (*EndLine*)210 (*EndCol*)48)) :: (684, (sloc (*Line*)197 (*Col*)19 (*EndLine*)197 (*EndCol*)19)) :: (343, (sloc (*Line*)91 (*Col*)30 (*EndLine*)91 (*EndCol*)30)) :: (352, (sloc (*Line*)91 (*Col*)54 (*EndLine*)91 (*EndCol*)64)) :: (558, (sloc (*Line*)178 (*Col*)8 (*EndLine*)178 (*EndCol*)41)) :: (585, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)15)) :: (253, (sloc (*Line*)78 (*Col*)28 (*EndLine*)78 (*EndCol*)38)) :: (226, (sloc (*Line*)74 (*Col*)42 (*EndLine*)74 (*EndCol*)42)) :: (594, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)35)) :: (666, (sloc (*Line*)194 (*Col*)13 (*EndLine*)194 (*EndCol*)17)) :: (325, (sloc (*Line*)89 (*Col*)61 (*EndLine*)89 (*EndCol*)61)) :: (675, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)12)) :: (334, (sloc (*Line*)91 (*Col*)5 (*EndLine*)91 (*EndCol*)49)) :: (540, (sloc (*Line*)169 (*Col*)6 (*EndLine*)169 (*EndCol*)6)) :: (235, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)23)) :: (621, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)31)) :: (657, (sloc (*Line*)193 (*Col*)3 (*EndLine*)193 (*EndCol*)3)) :: (316, (sloc (*Line*)89 (*Col*)32 (*EndLine*)89 (*EndCol*)42)) :: (271, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)30)) :: (612, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)11)) :: (280, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)44)) :: (319, (sloc (*Line*)89 (*Col*)45 (*EndLine*)89 (*EndCol*)55)) :: (516, (sloc (*Line*)159 (*Col*)14 (*EndLine*)159 (*EndCol*)14)) :: (552, (sloc (*Line*)177 (*Col*)10 (*EndLine*)177 (*EndCol*)14)) :: (184, (sloc (*Line*)72 (*Col*)28 (*EndLine*)72 (*EndCol*)28)) :: (534, (sloc (*Line*)166 (*Col*)6 (*EndLine*)166 (*EndCol*)6)) :: (597, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)29)) :: (265, (sloc (*Line*)79 (*Col*)12 (*EndLine*)79 (*EndCol*)12)) :: (615, (sloc (*Line*)182 (*Col*)15 (*EndLine*)182 (*EndCol*)15)) :: (480, (sloc (*Line*)136 (*Col*)41 (*EndLine*)136 (*EndCol*)50)) :: (256, (sloc (*Line*)78 (*Col*)38 (*EndLine*)78 (*EndCol*)38)) :: (337, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)30)) :: (211, (sloc (*Line*)73 (*Col*)62 (*EndLine*)73 (*EndCol*)62)) :: (283, (sloc (*Line*)80 (*Col*)48 (*EndLine*)80 (*EndCol*)48)) :: (624, (sloc (*Line*)182 (*Col*)35 (*EndLine*)182 (*EndCol*)35)) :: (292, (sloc (*Line*)82 (*Col*)14 (*EndLine*)82 (*EndCol*)14)) :: (166, (sloc (*Line*)71 (*Col*)28 (*EndLine*)71 (*EndCol*)38)) :: (579, (sloc (*Line*)179 (*Col*)13 (*EndLine*)179 (*EndCol*)13)) :: (274, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)24)) :: (247, (sloc (*Line*)77 (*Col*)12 (*EndLine*)77 (*EndCol*)12)) :: (588, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)9)) :: (328, (sloc (*Line*)89 (*Col*)64 (*EndLine*)89 (*EndCol*)64)) :: (489, (sloc (*Line*)139 (*Col*)6 (*EndLine*)139 (*EndCol*)14)) :: (220, (sloc (*Line*)74 (*Col*)24 (*EndLine*)74 (*EndCol*)24)) :: (561, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)11)) :: (229, (sloc (*Line*)74 (*Col*)52 (*EndLine*)74 (*EndCol*)62)) :: (543, (sloc (*Line*)169 (*Col*)11 (*EndLine*)169 (*EndCol*)11)) :: (570, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)31)) :: (202, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)42)) :: (238, (sloc (*Line*)75 (*Col*)27 (*EndLine*)75 (*EndCol*)27)) :: (642, (sloc (*Line*)191 (*Col*)3 (*EndLine*)191 (*EndCol*)3)) :: (651, (sloc (*Line*)192 (*Col*)13 (*EndLine*)192 (*EndCol*)17)) :: (310, (sloc (*Line*)88 (*Col*)12 (*EndLine*)88 (*EndCol*)12)) :: (277, (sloc (*Line*)80 (*Col*)30 (*EndLine*)80 (*EndCol*)30)) :: (483, (sloc (*Line*)137 (*Col*)16 (*EndLine*)137 (*EndCol*)22)) :: (151, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)24)) :: (492, (sloc (*Line*)139 (*Col*)19 (*EndLine*)139 (*EndCol*)27)) :: (223, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)42)) :: (564, (sloc (*Line*)178 (*Col*)11 (*EndLine*)178 (*EndCol*)11)) :: (259, (sloc (*Line*)78 (*Col*)44 (*EndLine*)78 (*EndCol*)44)) :: (573, (sloc (*Line*)178 (*Col*)31 (*EndLine*)178 (*EndCol*)31)) :: (124, (sloc (*Line*)53 (*Col*)12 (*EndLine*)53 (*EndCol*)15)) :: (438, (sloc (*Line*)130 (*Col*)10 (*EndLine*)130 (*EndCol*)27)) :: (537, (sloc (*Line*)167 (*Col*)6 (*EndLine*)167 (*EndCol*)6)) :: (106, (sloc (*Line*)43 (*Col*)12 (*EndLine*)43 (*EndCol*)15)) :: (447, (sloc (*Line*)132 (*Col*)29 (*EndLine*)132 (*EndCol*)29)) :: (205, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)36)) :: (519, (sloc (*Line*)160 (*Col*)6 (*EndLine*)160 (*EndCol*)6)) :: (214, (sloc (*Line*)74 (*Col*)3 (*EndLine*)74 (*EndCol*)29)) :: (555, (sloc (*Line*)177 (*Col*)14 (*EndLine*)177 (*EndCol*)14)) :: (528, (sloc (*Line*)163 (*Col*)11 (*EndLine*)163 (*EndCol*)11)) :: (420, (sloc (*Line*)121 (*Col*)37 (*EndLine*)121 (*EndCol*)46)) :: (160, (sloc (*Line*)71 (*Col*)3 (*EndLine*)71 (*EndCol*)25)) :: (169, (sloc (*Line*)71 (*Col*)38 (*EndLine*)71 (*EndCol*)38)) :: (178, (sloc (*Line*)72 (*Col*)3 (*EndLine*)72 (*EndCol*)11)) :: (582, (sloc (*Line*)180 (*Col*)3 (*EndLine*)180 (*EndCol*)3)) :: (591, (sloc (*Line*)180 (*Col*)21 (*EndLine*)180 (*EndCol*)22)) :: (456, (sloc (*Line*)133 (*Col*)44 (*EndLine*)133 (*EndCol*)44)) :: (465, (sloc (*Line*)135 (*Col*)16 (*EndLine*)135 (*EndCol*)34)) :: (187, (sloc (*Line*)72 (*Col*)32 (*EndLine*)72 (*EndCol*)40)) :: (196, (sloc (*Line*)73 (*Col*)3 (*EndLine*)73 (*EndCol*)25)) :: (268, (sloc (*Line*)80 (*Col*)5 (*EndLine*)80 (*EndCol*)49)) :: (241, (sloc (*Line*)76 (*Col*)9 (*EndLine*)76 (*EndCol*)9)) :: (369, (sloc (*Line*)101 (*Col*)20 (*EndLine*)101 (*EndCol*)20)) :: (441, (sloc (*Line*)131 (*Col*)3 (*EndLine*)131 (*EndCol*)11)) :: (181, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)24)) :: (163, (sloc (*Line*)71 (*Col*)14 (*EndLine*)71 (*EndCol*)24)) :: (477, (sloc (*Line*)136 (*Col*)16 (*EndLine*)136 (*EndCol*)24)) :: (172, (sloc (*Line*)71 (*Col*)52 (*EndLine*)71 (*EndCol*)60)) :: (513, (sloc (*Line*)159 (*Col*)10 (*EndLine*)159 (*EndCol*)14)) :: (432, (sloc (*Line*)125 (*Col*)22 (*EndLine*)125 (*EndCol*)29)) :: (468, (sloc (*Line*)135 (*Col*)27 (*EndLine*)135 (*EndCol*)33)) :: (199, (sloc (*Line*)73 (*Col*)14 (*EndLine*)73 (*EndCol*)24)) :: (208, (sloc (*Line*)73 (*Col*)52 (*EndLine*)73 (*EndCol*)62)) :: (217, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)24)) :: (683, (sloc (*Line*)197 (*Col*)19 (*EndLine*)197 (*EndCol*)21)) :: (423, (sloc (*Line*)122 (*Col*)13 (*EndLine*)122 (*EndCol*)30)) :: (495, (sloc (*Line*)145 (*Col*)7 (*EndLine*)145 (*EndCol*)15)) :: (190, (sloc (*Line*)72 (*Col*)52 (*EndLine*)72 (*EndCol*)62)) :: (504, (sloc (*Line*)154 (*Col*)7 (*EndLine*)154 (*EndCol*)7)) :: (737, (sloc (*Line*)215 (*Col*)13 (*EndLine*)215 (*EndCol*)25)) :: (396, (sloc (*Line*)118 (*Col*)13 (*EndLine*)118 (*EndCol*)20)) :: (710, (sloc (*Line*)210 (*Col*)36 (*EndLine*)210 (*EndCol*)36)) :: (746, (sloc (*Line*)217 (*Col*)24 (*EndLine*)217 (*EndCol*)27)) :: (405, (sloc (*Line*)119 (*Col*)32 (*EndLine*)119 (*EndCol*)39)) :: (486, (sloc (*Line*)137 (*Col*)27 (*EndLine*)137 (*EndCol*)33)) :: (154, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)18)) :: (360, (sloc (*Line*)93 (*Col*)18 (*EndLine*)93 (*EndCol*)18)) :: (740, (sloc (*Line*)216 (*Col*)13 (*EndLine*)216 (*EndCol*)21)) :: (426, (sloc (*Line*)123 (*Col*)13 (*EndLine*)123 (*EndCol*)19)) :: (408, (sloc (*Line*)119 (*Col*)43 (*EndLine*)119 (*EndCol*)43)) :: (300, (sloc (*Line*)84 (*Col*)15 (*EndLine*)84 (*EndCol*)15)) :: (686, (sloc (*Line*)197 (*Col*)24 (*EndLine*)197 (*EndCol*)24)) :: (623, (sloc (*Line*)182 (*Col*)31 (*EndLine*)182 (*EndCol*)31)) :: (722, (sloc (*Line*)212 (*Col*)20 (*EndLine*)212 (*EndCol*)20)) :: (381, (sloc (*Line*)111 (*Col*)39 (*EndLine*)111 (*EndCol*)43)) :: (354, (sloc (*Line*)91 (*Col*)64 (*EndLine*)91 (*EndCol*)64)) :: (471, (sloc (*Line*)135 (*Col*)39 (*EndLine*)135 (*EndCol*)47)) :: (677, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)10)) :: (336, (sloc (*Line*)91 (*Col*)5 (*EndLine*)91 (*EndCol*)13)) :: (345, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)44)) :: (641, (sloc (*Line*)191 (*Col*)3 (*EndLine*)191 (*EndCol*)5)) :: (453, (sloc (*Line*)133 (*Col*)21 (*EndLine*)133 (*EndCol*)29)) :: (462, (sloc (*Line*)134 (*Col*)20 (*EndLine*)134 (*EndCol*)20)) :: (668, (sloc (*Line*)194 (*Col*)13 (*EndLine*)194 (*EndCol*)13)) :: (363, (sloc (*Line*)95 (*Col*)11 (*EndLine*)95 (*EndCol*)15)) :: (749, (sloc (*Line*)222 (*Col*)18 (*EndLine*)222 (*EndCol*)22)) :: (417, (sloc (*Line*)121 (*Col*)24 (*EndLine*)121 (*EndCol*)31)) :: (444, (sloc (*Line*)132 (*Col*)16 (*EndLine*)132 (*EndCol*)29)) :: (309, (sloc (*Line*)88 (*Col*)12 (*EndLine*)88 (*EndCol*)12)) :: (659, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)16)) :: (318, (sloc (*Line*)89 (*Col*)42 (*EndLine*)89 (*EndCol*)42)) :: (731, (sloc (*Line*)214 (*Col*)26 (*EndLine*)214 (*EndCol*)34)) :: (327, (sloc (*Line*)89 (*Col*)64 (*EndLine*)89 (*EndCol*)64)) :: (357, (sloc (*Line*)93 (*Col*)14 (*EndLine*)93 (*EndCol*)18)) :: (97, (sloc (*Line*)38 (*Col*)7 (*EndLine*)38 (*EndCol*)7)) :: (563, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)9)) :: (653, (sloc (*Line*)192 (*Col*)13 (*EndLine*)192 (*EndCol*)13)) :: (348, (sloc (*Line*)91 (*Col*)44 (*EndLine*)91 (*EndCol*)44)) :: (734, (sloc (*Line*)214 (*Col*)37 (*EndLine*)214 (*EndCol*)49)) :: (402, (sloc (*Line*)119 (*Col*)21 (*EndLine*)119 (*EndCol*)40)) :: (294, (sloc (*Line*)82 (*Col*)18 (*EndLine*)82 (*EndCol*)18)) :: (608, (sloc (*Line*)182 (*Col*)8 (*EndLine*)182 (*EndCol*)42)) :: (707, (sloc (*Line*)210 (*Col*)25 (*EndLine*)210 (*EndCol*)33)) :: (644, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)16)) :: (303, (sloc (*Line*)87 (*Col*)9 (*EndLine*)87 (*EndCol*)9)) :: (716, (sloc (*Line*)211 (*Col*)10 (*EndLine*)211 (*EndCol*)19)) :: (725, (sloc (*Line*)212 (*Col*)23 (*EndLine*)212 (*EndCol*)31)) :: (411, (sloc (*Line*)120 (*Col*)13 (*EndLine*)120 (*EndCol*)13)) :: (276, (sloc (*Line*)80 (*Col*)30 (*EndLine*)80 (*EndCol*)30)) :: (249, (sloc (*Line*)77 (*Col*)17 (*EndLine*)77 (*EndCol*)17)) :: (590, (sloc (*Line*)180 (*Col*)15 (*EndLine*)180 (*EndCol*)15)) :: (285, (sloc (*Line*)80 (*Col*)54 (*EndLine*)80 (*EndCol*)64)) :: (258, (sloc (*Line*)78 (*Col*)41 (*EndLine*)78 (*EndCol*)41)) :: (599, (sloc (*Line*)180 (*Col*)35 (*EndLine*)180 (*EndCol*)35)) :: (671, (sloc (*Line*)195 (*Col*)3 (*EndLine*)195 (*EndCol*)5)) :: (339, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)26)) :: (366, (sloc (*Line*)95 (*Col*)15 (*EndLine*)95 (*EndCol*)15)) :: (572, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)29)) :: (240, (sloc (*Line*)76 (*Col*)9 (*EndLine*)76 (*EndCol*)14)) :: (662, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)10)) :: (321, (sloc (*Line*)89 (*Col*)45 (*EndLine*)89 (*EndCol*)53)) :: (617, (sloc (*Line*)182 (*Col*)22 (*EndLine*)182 (*EndCol*)22)) :: (689, (sloc (*Line*)197 (*Col*)27 (*EndLine*)197 (*EndCol*)29)) :: (521, (sloc (*Line*)160 (*Col*)10 (*EndLine*)160 (*EndCol*)10)) :: (557, (sloc (*Line*)178 (*Col*)3 (*EndLine*)178 (*EndCol*)3)) :: (189, (sloc (*Line*)72 (*Col*)52 (*EndLine*)72 (*EndCol*)62)) :: (530, (sloc (*Line*)163 (*Col*)15 (*EndLine*)163 (*EndCol*)15)) :: (225, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)40)) :: (180, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)24)) :: (674, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)16)) :: (342, (sloc (*Line*)91 (*Col*)30 (*EndLine*)91 (*EndCol*)30)) :: (207, (sloc (*Line*)73 (*Col*)42 (*EndLine*)73 (*EndCol*)42)) :: (216, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)28)) :: (288, (sloc (*Line*)80 (*Col*)64 (*EndLine*)80 (*EndCol*)64)) :: (324, (sloc (*Line*)89 (*Col*)58 (*EndLine*)89 (*EndCol*)58)) :: (297, (sloc (*Line*)84 (*Col*)11 (*EndLine*)84 (*EndCol*)15)) :: (638, (sloc (*Line*)190 (*Col*)10 (*EndLine*)190 (*EndCol*)10)) :: (198, (sloc (*Line*)73 (*Col*)14 (*EndLine*)73 (*EndCol*)24)) :: (270, (sloc (*Line*)80 (*Col*)5 (*EndLine*)80 (*EndCol*)13)) :: (584, (sloc (*Line*)180 (*Col*)8 (*EndLine*)180 (*EndCol*)22)) :: (611, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)11)) :: (279, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)44)) :: (593, (sloc (*Line*)180 (*Col*)28 (*EndLine*)180 (*EndCol*)41)) :: (620, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)31)) :: (351, (sloc (*Line*)91 (*Col*)54 (*EndLine*)91 (*EndCol*)64)) :: (566, (sloc (*Line*)178 (*Col*)21 (*EndLine*)178 (*EndCol*)22)) :: (261, (sloc (*Line*)78 (*Col*)47 (*EndLine*)78 (*EndCol*)47)) :: (234, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)23)) :: (575, (sloc (*Line*)178 (*Col*)41 (*EndLine*)178 (*EndCol*)41)) :: (602, (sloc (*Line*)181 (*Col*)13 (*EndLine*)181 (*EndCol*)17)) :: (647, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)10)) :: (243, (sloc (*Line*)76 (*Col*)14 (*EndLine*)76 (*EndCol*)14)) :: (656, (sloc (*Line*)193 (*Col*)3 (*EndLine*)193 (*EndCol*)5)) :: (315, (sloc (*Line*)89 (*Col*)32 (*EndLine*)89 (*EndCol*)42)) :: (282, (sloc (*Line*)80 (*Col*)44 (*EndLine*)80 (*EndCol*)44)) :: (183, (sloc (*Line*)72 (*Col*)24 (*EndLine*)72 (*EndCol*)24)) :: (587, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)11)) :: (156, (sloc (*Line*)70 (*Col*)24 (*EndLine*)70 (*EndCol*)24)) :: (255, (sloc (*Line*)78 (*Col*)28 (*EndLine*)78 (*EndCol*)36)) :: (569, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)35)) :: (596, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)31)) :: (228, (sloc (*Line*)74 (*Col*)52 (*EndLine*)74 (*EndCol*)62)) :: (578, (sloc (*Line*)179 (*Col*)13 (*EndLine*)179 (*EndCol*)13)) :: (461, (sloc (*Line*)134 (*Col*)20 (*EndLine*)134 (*EndCol*)20)) :: (470, (sloc (*Line*)135 (*Col*)39 (*EndLine*)135 (*EndCol*)59)) :: (452, (sloc (*Line*)133 (*Col*)21 (*EndLine*)133 (*EndCol*)41)) :: (479, (sloc (*Line*)136 (*Col*)27 (*EndLine*)136 (*EndCol*)35)) :: (542, (sloc (*Line*)169 (*Col*)11 (*EndLine*)169 (*EndCol*)11)) :: (210, (sloc (*Line*)73 (*Col*)52 (*EndLine*)73 (*EndCol*)60)) :: (560, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)15)) :: (219, (sloc (*Line*)74 (*Col*)14 (*EndLine*)74 (*EndCol*)22)) :: (291, (sloc (*Line*)82 (*Col*)14 (*EndLine*)82 (*EndCol*)18)) :: (165, (sloc (*Line*)71 (*Col*)24 (*EndLine*)71 (*EndCol*)24)) :: (515, (sloc (*Line*)159 (*Col*)10 (*EndLine*)159 (*EndCol*)10)) :: (237, (sloc (*Line*)75 (*Col*)23 (*EndLine*)75 (*EndCol*)23)) :: (246, (sloc (*Line*)77 (*Col*)12 (*EndLine*)77 (*EndCol*)17)) :: (524, (sloc (*Line*)161 (*Col*)11 (*EndLine*)161 (*EndCol*)11)) :: (192, (sloc (*Line*)72 (*Col*)62 (*EndLine*)72 (*EndCol*)62)) :: (533, (sloc (*Line*)166 (*Col*)6 (*EndLine*)166 (*EndCol*)6)) :: (201, (sloc (*Line*)73 (*Col*)24 (*EndLine*)73 (*EndCol*)24)) :: (605, (sloc (*Line*)181 (*Col*)17 (*EndLine*)181 (*EndCol*)17)) :: (273, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)26)) :: (614, (sloc (*Line*)182 (*Col*)11 (*EndLine*)182 (*EndCol*)11)) :: (186, (sloc (*Line*)72 (*Col*)32 (*EndLine*)72 (*EndCol*)42)) :: (213, (sloc (*Line*)74 (*Col*)3 (*EndLine*)74 (*EndCol*)47)) :: (222, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)46)) :: (437, (sloc (*Line*)130 (*Col*)10 (*EndLine*)130 (*EndCol*)27)) :: (168, (sloc (*Line*)71 (*Col*)28 (*EndLine*)71 (*EndCol*)36)) :: (177, (sloc (*Line*)72 (*Col*)3 (*EndLine*)72 (*EndCol*)29)) :: (518, (sloc (*Line*)160 (*Col*)6 (*EndLine*)160 (*EndCol*)10)) :: (715, (sloc (*Line*)211 (*Col*)10 (*EndLine*)211 (*EndCol*)19)) :: (724, (sloc (*Line*)212 (*Col*)23 (*EndLine*)212 (*EndCol*)31)) :: (733, (sloc (*Line*)214 (*Col*)37 (*EndLine*)214 (*EndCol*)49)) :: (159, (sloc (*Line*)71 (*Col*)3 (*EndLine*)71 (*EndCol*)39)) :: (473, (sloc (*Line*)135 (*Col*)50 (*EndLine*)135 (*EndCol*)58)) :: (554, (sloc (*Line*)177 (*Col*)10 (*EndLine*)177 (*EndCol*)10)) :: (105, (sloc (*Line*)43 (*Col*)7 (*EndLine*)43 (*EndCol*)7)) :: (419, (sloc (*Line*)121 (*Col*)37 (*EndLine*)121 (*EndCol*)46)) :: (446, (sloc (*Line*)132 (*Col*)16 (*EndLine*)132 (*EndCol*)24)) :: (114, (sloc (*Line*)48 (*Col*)12 (*EndLine*)48 (*EndCol*)15)) :: (428, (sloc (*Line*)123 (*Col*)24 (*EndLine*)123 (*EndCol*)31)) :: (455, (sloc (*Line*)133 (*Col*)32 (*EndLine*)133 (*EndCol*)40)) :: (123, (sloc (*Line*)53 (*Col*)7 (*EndLine*)53 (*EndCol*)7)) :: (527, (sloc (*Line*)163 (*Col*)11 (*EndLine*)163 (*EndCol*)15)) :: (195, (sloc (*Line*)73 (*Col*)3 (*EndLine*)73 (*EndCol*)43)) :: (204, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)38)) :: (742, (sloc (*Line*)216 (*Col*)26 (*EndLine*)216 (*EndCol*)34)) :: (491, (sloc (*Line*)139 (*Col*)19 (*EndLine*)139 (*EndCol*)27)) :: (231, (sloc (*Line*)74 (*Col*)62 (*EndLine*)74 (*EndCol*)62)) :: (332, (sloc (*Line*)90 (*Col*)12 (*EndLine*)90 (*EndCol*)12)) :: (745, (sloc (*Line*)217 (*Col*)13 (*EndLine*)217 (*EndCol*)19)) :: (90, (sloc (*Line*)33 (*Col*)12 (*EndLine*)33 (*EndCol*)15)) :: (404, (sloc (*Line*)119 (*Col*)21 (*EndLine*)119 (*EndCol*)29)) :: (431, (sloc (*Line*)125 (*Col*)22 (*EndLine*)125 (*EndCol*)33)) :: (646, (sloc (*Line*)191 (*Col*)10 (*EndLine*)191 (*EndCol*)12)) :: (395, (sloc (*Line*)118 (*Col*)13 (*EndLine*)118 (*EndCol*)26)) :: (682, (sloc (*Line*)197 (*Col*)19 (*EndLine*)197 (*EndCol*)21)) :: (341, (sloc (*Line*)91 (*Col*)26 (*EndLine*)91 (*EndCol*)26)) :: (691, (sloc (*Line*)197 (*Col*)29 (*EndLine*)197 (*EndCol*)29)) :: (171, (sloc (*Line*)71 (*Col*)52 (*EndLine*)71 (*EndCol*)62)) :: (377, (sloc (*Line*)110 (*Col*)28 (*EndLine*)110 (*EndCol*)29)) :: (144, (sloc (*Line*)67 (*Col*)22 (*EndLine*)67 (*EndCol*)22)) :: (485, (sloc (*Line*)137 (*Col*)27 (*EndLine*)137 (*EndCol*)33)) :: (153, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)20)) :: (467, (sloc (*Line*)135 (*Col*)27 (*EndLine*)135 (*EndCol*)33)) :: (162, (sloc (*Line*)71 (*Col*)14 (*EndLine*)71 (*EndCol*)24)) :: (359, (sloc (*Line*)93 (*Col*)14 (*EndLine*)93 (*EndCol*)14)) :: (673, (sloc (*Line*)195 (*Col*)5 (*EndLine*)195 (*EndCol*)5)) :: (709, (sloc (*Line*)210 (*Col*)36 (*EndLine*)210 (*EndCol*)36)) :: (368, (sloc (*Line*)101 (*Col*)7 (*EndLine*)101 (*EndCol*)15)) :: (135, (sloc (*Line*)58 (*Col*)12 (*EndLine*)58 (*EndCol*)15)) :: (476, (sloc (*Line*)136 (*Col*)16 (*EndLine*)136 (*EndCol*)36)) :: (350, (sloc (*Line*)91 (*Col*)48 (*EndLine*)91 (*EndCol*)48)) :: (664, (sloc (*Line*)193 (*Col*)16 (*EndLine*)193 (*EndCol*)16)) :: (323, (sloc (*Line*)89 (*Col*)58 (*EndLine*)89 (*EndCol*)58)) :: (736, (sloc (*Line*)215 (*Col*)13 (*EndLine*)215 (*EndCol*)25)) :: (362, (sloc (*Line*)95 (*Col*)6 (*EndLine*)95 (*EndCol*)6)) :: (676, (sloc (*Line*)195 (*Col*)10 (*EndLine*)195 (*EndCol*)12)) :: (272, (sloc (*Line*)80 (*Col*)16 (*EndLine*)80 (*EndCol*)26)) :: (685, (sloc (*Line*)197 (*Col*)21 (*EndLine*)197 (*EndCol*)21)) :: (344, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)48)) :: (658, (sloc (*Line*)193 (*Col*)5 (*EndLine*)193 (*EndCol*)5)) :: (317, (sloc (*Line*)89 (*Col*)32 (*EndLine*)89 (*EndCol*)40)) :: (353, (sloc (*Line*)91 (*Col*)54 (*EndLine*)91 (*EndCol*)62)) :: (434, (sloc (*Line*)125 (*Col*)33 (*EndLine*)125 (*EndCol*)33)) :: (326, (sloc (*Line*)89 (*Col*)61 (*EndLine*)89 (*EndCol*)61)) :: (299, (sloc (*Line*)84 (*Col*)11 (*EndLine*)84 (*EndCol*)11)) :: (335, (sloc (*Line*)91 (*Col*)5 (*EndLine*)91 (*EndCol*)31)) :: (649, (sloc (*Line*)191 (*Col*)16 (*EndLine*)191 (*EndCol*)16)) :: (308, (sloc (*Line*)88 (*Col*)12 (*EndLine*)88 (*EndCol*)17)) :: (721, (sloc (*Line*)212 (*Col*)9 (*EndLine*)212 (*EndCol*)17)) :: (730, (sloc (*Line*)214 (*Col*)15 (*EndLine*)214 (*EndCol*)23)) :: (416, (sloc (*Line*)121 (*Col*)13 (*EndLine*)121 (*EndCol*)21)) :: (281, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)42)) :: (595, (sloc (*Line*)180 (*Col*)29 (*EndLine*)180 (*EndCol*)31)) :: (622, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)29)) :: (290, (sloc (*Line*)82 (*Col*)9 (*EndLine*)82 (*EndCol*)9)) :: (604, (sloc (*Line*)181 (*Col*)13 (*EndLine*)181 (*EndCol*)13)) :: (712, (sloc (*Line*)210 (*Col*)39 (*EndLine*)210 (*EndCol*)48)) :: (586, (sloc (*Line*)180 (*Col*)9 (*EndLine*)180 (*EndCol*)11)) :: (667, (sloc (*Line*)194 (*Col*)13 (*EndLine*)194 (*EndCol*)13)) :: (398, (sloc (*Line*)118 (*Col*)25 (*EndLine*)118 (*EndCol*)26)) :: (748, (sloc (*Line*)222 (*Col*)7 (*EndLine*)222 (*EndCol*)13)) :: (407, (sloc (*Line*)119 (*Col*)43 (*EndLine*)119 (*EndCol*)43)) :: (613, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)9)) :: (356, (sloc (*Line*)93 (*Col*)9 (*EndLine*)93 (*EndCol*)9)) :: (562, (sloc (*Line*)178 (*Col*)9 (*EndLine*)178 (*EndCol*)11)) :: (230, (sloc (*Line*)74 (*Col*)52 (*EndLine*)74 (*EndCol*)60)) :: (257, (sloc (*Line*)78 (*Col*)41 (*EndLine*)78 (*EndCol*)41)) :: (598, (sloc (*Line*)180 (*Col*)31 (*EndLine*)180 (*EndCol*)31)) :: (679, (sloc (*Line*)195 (*Col*)16 (*EndLine*)195 (*EndCol*)16)) :: (338, (sloc (*Line*)91 (*Col*)16 (*EndLine*)91 (*EndCol*)26)) :: (688, (sloc (*Line*)197 (*Col*)27 (*EndLine*)197 (*EndCol*)29)) :: (347, (sloc (*Line*)91 (*Col*)34 (*EndLine*)91 (*EndCol*)42)) :: (553, (sloc (*Line*)177 (*Col*)10 (*EndLine*)177 (*EndCol*)10)) :: (652, (sloc (*Line*)192 (*Col*)13 (*EndLine*)192 (*EndCol*)13)) :: (248, (sloc (*Line*)77 (*Col*)12 (*EndLine*)77 (*EndCol*)12)) :: (221, (sloc (*Line*)74 (*Col*)28 (*EndLine*)74 (*EndCol*)28)) :: (589, (sloc (*Line*)180 (*Col*)11 (*EndLine*)180 (*EndCol*)11)) :: (661, (sloc (*Line*)193 (*Col*)10 (*EndLine*)193 (*EndCol*)12)) :: (320, (sloc (*Line*)89 (*Col*)45 (*EndLine*)89 (*EndCol*)55)) :: (302, (sloc (*Line*)87 (*Col*)9 (*EndLine*)87 (*EndCol*)14)) :: (643, (sloc (*Line*)191 (*Col*)5 (*EndLine*)191 (*EndCol*)5)) :: (535, (sloc (*Line*)166 (*Col*)10 (*EndLine*)166 (*EndCol*)10)) :: (203, (sloc (*Line*)73 (*Col*)28 (*EndLine*)73 (*EndCol*)38)) :: (544, (sloc (*Line*)169 (*Col*)15 (*EndLine*)169 (*EndCol*)15)) :: (275, (sloc (*Line*)80 (*Col*)26 (*EndLine*)80 (*EndCol*)26)) :: (616, (sloc (*Line*)182 (*Col*)21 (*EndLine*)182 (*EndCol*)22)) :: (311, (sloc (*Line*)88 (*Col*)17 (*EndLine*)88 (*EndCol*)17)) :: (284, (sloc (*Line*)80 (*Col*)48 (*EndLine*)80 (*EndCol*)48)) :: (625, (sloc (*Line*)182 (*Col*)41 (*EndLine*)182 (*EndCol*)42)) :: (293, (sloc (*Line*)82 (*Col*)14 (*EndLine*)82 (*EndCol*)14)) :: (365, (sloc (*Line*)95 (*Col*)11 (*EndLine*)95 (*EndCol*)11)) :: (526, (sloc (*Line*)163 (*Col*)6 (*EndLine*)163 (*EndCol*)6)) :: (571, (sloc (*Line*)178 (*Col*)29 (*EndLine*)178 (*EndCol*)31)) :: (266, (sloc (*Line*)79 (*Col*)12 (*EndLine*)79 (*EndCol*)12)) :: (580, (sloc (*Line*)179 (*Col*)17 (*EndLine*)179 (*EndCol*)17)) :: (607, (sloc (*Line*)182 (*Col*)3 (*EndLine*)182 (*EndCol*)3)) :: (628, (sloc (*Line*)184 (*Col*)8 (*EndLine*)184 (*EndCol*)11)) :: (520, (sloc (*Line*)160 (*Col*)6 (*EndLine*)160 (*EndCol*)6)) :: (179, (sloc (*Line*)72 (*Col*)14 (*EndLine*)72 (*EndCol*)28)) :: (152, (sloc (*Line*)70 (*Col*)10 (*EndLine*)70 (*EndCol*)20)) :: (493, (sloc (*Line*)139 (*Col*)31 (*EndLine*)139 (*EndCol*)31)) :: (188, (sloc (*Line*)72 (*Col*)42 (*EndLine*)72 (*EndCol*)42)) :: (592, (sloc (*Line*)180 (*Col*)22 (*EndLine*)180 (*EndCol*)22)) :: (260, (sloc (*Line*)78 (*Col*)44 (*EndLine*)78 (*EndCol*)44)) :: (269, (sloc (*Line*)80 (*Col*)5 (*EndLine*)80 (*EndCol*)31)) :: (610, (sloc (*Line*)182 (*Col*)9 (*EndLine*)182 (*EndCol*)15)) :: (170, (sloc (*Line*)71 (*Col*)52 (*EndLine*)71 (*EndCol*)62)) :: (484, (sloc (*Line*)137 (*Col*)27 (*EndLine*)137 (*EndCol*)37)) :: (215, (sloc (*Line*)74 (*Col*)3 (*EndLine*)74 (*EndCol*)11)) :: (565, (sloc (*Line*)178 (*Col*)15 (*EndLine*)178 (*EndCol*)15)) :: (466, (sloc (*Line*)135 (*Col*)16 (*EndLine*)135 (*EndCol*)24)) :: (287, (sloc (*Line*)80 (*Col*)54 (*EndLine*)80 (*EndCol*)62)) :: (161, (sloc (*Line*)71 (*Col*)3 (*EndLine*)71 (*EndCol*)11)) :: (574, (sloc (*Line*)178 (*Col*)35 (*EndLine*)178 (*EndCol*)35)) :: (242, (sloc (*Line*)76 (*Col*)9 (*EndLine*)76 (*EndCol*)9)) :: (583, (sloc (*Line*)180 (*Col*)8 (*EndLine*)180 (*EndCol*)41)) :: (529, (sloc (*Line*)163 (*Col*)11 (*EndLine*)163 (*EndCol*)11)) :: (197, (sloc (*Line*)73 (*Col*)3 (*EndLine*)73 (*EndCol*)11)) :: (224, (sloc (*Line*)74 (*Col*)32 (*EndLine*)74 (*EndCol*)42)) :: (538, (sloc (*Line*)167 (*Col*)11 (*EndLine*)167 (*EndCol*)11)) :: (296, (sloc (*Line*)84 (*Col*)6 (*EndLine*)84 (*EndCol*)6)) :: (206, (sloc (*Line*)73 (*Col*)38 (*EndLine*)73 (*EndCol*)38)) :: (233, (sloc (*Line*)75 (*Col*)13 (*EndLine*)75 (*EndCol*)27)) :: (637, (sloc (*Line*)190 (*Col*)10 (*EndLine*)190 (*EndCol*)10)) :: (305, (sloc (*Line*)87 (*Col*)14 (*EndLine*)87 (*EndCol*)14)) :: (278, (sloc (*Line*)80 (*Col*)34 (*EndLine*)80 (*EndCol*)48)) :: (619, (sloc (*Line*)182 (*Col*)29 (*EndLine*)182 (*EndCol*)35)) :: nil)
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  ((mkNameTable
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  ((83, ("R", "ada://parameter/Tetris_Functional-28:9/Move-138:14/R-138:49")) :: (86, ("Candidate", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Candidate+206:7")) :: (77, ("R", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/R-134:68")) :: (59, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Y-109:102")) :: (50, ("B", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/B-121:33")) :: (41, ("B", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/B-115:24")) :: (68, ("Has_Complete_Lines", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Has_Complete_Lines+111:7")) :: (53, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/X-107:60")) :: (62, ("Y", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/Y+66:7")) :: (8, ("Cur_Board", "ada://variable/Tetris_Functional-28:9/Cur_Board-55:4")) :: (17, ("Cur_Piece", "ada://variable/Tetris_Functional-28:9/Cur_Piece-76:4")) :: (44, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/R-115:70")) :: (80, ("R", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/R-136:61")) :: (71, ("R", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/R+114:7")) :: (74, ("R", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/R-124:54")) :: (56, ("Cur_Piece_S", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_S-109:37")) :: (47, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/R-117:45")) :: (14, ("D", "ada://component/Tetris_Functional-28:9/Piece-69:9/D-71:7")) :: (46, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/L-117:32")) :: (82, ("A", "ada://parameter/Tetris_Functional-28:9/Move-138:14/A-138:34")) :: (55, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/R-107:90")) :: (64, ("R", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/R+68:7")) :: (73, ("P", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/P-124:40")) :: (58, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/X-109:87")) :: (67, ("To_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/To_Line+110:7")) :: (85, ("Success", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/Success-140:37")) :: (49, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/R-119:42")) :: (13, ("S", "ada://component/Tetris_Functional-28:9/Piece-69:9/S-70:7")) :: (76, ("T", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/T-134:48")) :: (16, ("Y", "ada://component/Tetris_Functional-28:9/Piece-69:9/Y-73:7")) :: (79, ("A", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/A-136:46")) :: (88, ("Is_No_Overlap", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_No_Overlap+208:7")) :: (52, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Cur_Piece_D-107:33")) :: (43, ("X", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/X-115:54")) :: (70, ("From_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/From_Line+113:7")) :: (19, ("Cur_State", "ada://variable/Tetris_Functional-28:9/Cur_State-90:4")) :: (60, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/R-109:117")) :: (87, ("Is_Move_OK", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_Move_OK+207:7")) :: (69, ("Del_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Del_Line+112:7")) :: (78, ("P", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/P-136:32")) :: (63, ("X", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/X+67:7")) :: (54, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Y-107:75")) :: (72, ("B", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/B-124:26")) :: (81, ("P", "ada://parameter/Tetris_Functional-28:9/Move-138:14/P-138:20")) :: (57, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_D-109:60")) :: (48, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/L-119:29")) :: (84, ("A", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/A-140:25")) :: (75, ("D", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/D-134:30")) :: (66, ("Empty_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Empty_Line+108:7")) :: (15, ("X", "ada://component/Tetris_Functional-28:9/Piece-69:9/X-72:7")) :: (42, ("Y", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/Y-115:38")) :: (51, ("R", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/R-121:47")) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  ((26, ("Is_Empty", "ada://procedure_body/Tetris_Functional-28:9/Is_Empty-115:14")) :: (35, ("Move_Is_Possible", "ada://procedure/Tetris_Functional-28:9/Move_Is_Possible-136:14")) :: (29, ("No_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/No_Complete_Lines-121:14")) :: (38, ("Include_Piece_In_Board", "ada://procedure_body/Tetris_Functional-28:9/Include_Piece_In_Board-142:14")) :: (25, ("Possible_Three_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_Three_Shapes-109:14")) :: (34, ("Turn_Direction", "ada://procedure/Tetris_Functional-28:9/Turn_Direction-134:14")) :: (37, ("Do_Action", "ada://procedure_body/Tetris_Functional-28:9/Do_Action-140:14")) :: (28, ("Is_Empty_Line", "ada://procedure/Tetris_Functional-28:9/Is_Empty_Line-119:14")) :: (27, ("Is_Complete_Line", "ada://procedure/Tetris_Functional-28:9/Is_Complete_Line-117:14")) :: (36, ("Move", "ada://procedure/Tetris_Functional-28:9/Move-138:14")) :: (30, ("No_Overlap", "ada://procedure/Tetris_Functional-28:9/No_Overlap-124:14")) :: (39, ("Delete_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/Delete_Complete_Lines-146:14")) :: (24, ("Possible_I_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_I_Shapes-107:14")) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  ((40, ("Tetris_Functional", "ada://package_body/Tetris_Functional-28:9")) :: nil)
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  ((23, ("Oriented_Three_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_Three_Shape-105:9")) :: (32, ("Move_Action", "ada://subtype/Tetris_Functional-28:9/Move_Action-131:12")) :: (11, ("Direction", "ada://ordinary_type/Tetris_Functional-28:9/Direction-67:9")) :: (2, ("Shape", "ada://subtype/Tetris_Functional-28:9/Shape-37:12")) :: (20, ("I_Delta", "ada://subtype/Tetris_Functional-28:9/I_Delta-102:12")) :: (5, ("Y_Coord", "ada://subtype/Tetris_Functional-28:9/Y_Coord-50:12")) :: (4, ("X_Coord", "ada://subtype/Tetris_Functional-28:9/X_Coord-49:12")) :: (31, ("Action", "ada://ordinary_type/Tetris_Functional-28:9/Action-129:9")) :: (22, ("Three_Delta", "ada://subtype/Tetris_Functional-28:9/Three_Delta-104:12")) :: (7, ("Board", "ada://ordinary_type/Tetris_Functional-28:9/Board-53:9")) :: (1, ("Cell", "ada://ordinary_type/Tetris_Functional-28:9/Cell-33:9")) :: (10, ("PY_Coord", "ada://subtype/Tetris_Functional-28:9/PY_Coord-64:12")) :: (9, ("PX_Coord", "ada://subtype/Tetris_Functional-28:9/PX_Coord-63:12")) :: (18, ("State", "ada://ordinary_type/Tetris_Functional-28:9/State-87:9")) :: (21, ("Oriented_I_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_I_Shape-103:9")) :: (3, ("Three_Shape", "ada://subtype/Tetris_Functional-28:9/Three_Shape-41:12")) :: (12, ("Piece", "ada://ordinary_type/Tetris_Functional-28:9/Piece-69:9")) :: (33, ("Turn_Action", "ada://subtype/Tetris_Functional-28:9/Turn_Action-132:12")) :: (6, ("Line", "ada://ordinary_type/Tetris_Functional-28:9/Line-52:9")) :: nil)
))
).

