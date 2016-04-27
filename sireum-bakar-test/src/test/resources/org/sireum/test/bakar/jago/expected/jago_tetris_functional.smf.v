Require Import String.
Require Import symboltable.
Open Scope string_scope.

Definition Coq_AST_Tree := 

(mkprogram
(* = = = declarations = = = *)
(SeqDecl 1
(SeqDecl 2
(TypeDecl 3 (DerivedTypeDecl 4 ((*Cell*) 1) Integer (Range 0 8))) 
(SeqDecl 5
(TypeDecl 6 (SubtypeDecl 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (Range 1 8))) 
(SeqDecl 8
(TypeDecl 9 (SubtypeDecl 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (Range 3 8))) 
(SeqDecl 11
(TypeDecl 12 (SubtypeDecl 13 ((*X_Coord*) 4) Integer (Range 1 10))) 
(SeqDecl 14
(TypeDecl 15 (SubtypeDecl 16 ((*Y_Coord*) 5) Integer (Range 1 50))) 
(SeqDecl 17
(TypeDecl 18 (ArrayTypeDecl 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) 
(SeqDecl 20
(TypeDecl 21 (ArrayTypeDecl 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) 
(SeqDecl 23
(ObjDecl 24 (mkobjDecl 25 ((*Cur_Board*) 8) (Array_Type ((*Board*) 7)) None)) 
(SeqDecl 26
(TypeDecl 27 (SubtypeDecl 28 ((*PX_Coord*) 9) Integer (Range (-1) 9))) 
(SeqDecl 29
(TypeDecl 30 (SubtypeDecl 31 ((*PY_Coord*) 10) Integer (Range (-1) 49))) 
(SeqDecl 32
(TypeDecl 33 (DerivedTypeDecl 34 ((*Direction*) 11) Integer (Range 0 3))) 
(SeqDecl 35
(TypeDecl 36 (RecordTypeDecl 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) 
(SeqDecl 39
(ObjDecl 40 (mkobjDecl 41 ((*Cur_Piece*) 17) (Record_Type ((*Piece*) 12)) None)) 
(SeqDecl 42
(TypeDecl 43 (DerivedTypeDecl 44 ((*State*) 18) Integer (Range 0 3))) 
(SeqDecl 45
(ObjDecl 46 (mkobjDecl 47 ((*Cur_State*) 19) (Derived_Type ((*State*) 18)) None)) 
(SeqDecl 48
(TypeDecl 49 (SubtypeDecl 50 ((*I_Delta*) 20) Integer (Range 0 3))) 
(SeqDecl 51
(TypeDecl 52 (ArrayTypeDecl 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) 
(SeqDecl 54
(TypeDecl 55 (SubtypeDecl 56 ((*Three_Delta*) 22) Integer (Range 0 2))) 
(SeqDecl 57
(TypeDecl 58 (ArrayTypeDecl 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) 
(SeqDecl 60
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 61
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 62
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 63
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 64
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 65
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 66
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 67
(TypeDecl 68 (DerivedTypeDecl 69 ((*Action*) 31) Integer (Range 0 4))) 
(SeqDecl 70
(TypeDecl 71 (SubtypeDecl 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (Range 0 1))) 
(SeqDecl 73
(TypeDecl 74 (SubtypeDecl 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (Range 3 4))) 
(SeqDecl 76
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 77
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 78
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 79
NullDecl (* Undefined Declarations ! *) 
(SeqDecl 80
NullDecl (* Undefined Declarations ! *) 
NullDecl (* Undefined Declarations ! *))))))))))))))))))))))))))))))))))) 
(SeqDecl 81
(ProcBodyDecl 82 
  (mkprocBodyDecl 83
    (* = = = Procedure Name = = = *)
    ((*Is_Empty*) 26)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
    (mkparamSpec 85 ((*Y*) 42) Integer In) :: 
    (mkparamSpec 86 ((*X*) 43) Integer In) :: 
    (mkparamSpec 87 ((*R*) 44) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 88 (Identifier 89 ((*R*) 44) ) (Literal 90 (Boolean_Literal true) ))
  )
) 
(SeqDecl 91
(ProcBodyDecl 92 
  (mkprocBodyDecl 93
    (* = = = Procedure Name = = = *)
    ((*Is_Complete_Line*) 27)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
    (mkparamSpec 95 ((*R*) 47) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 96 (Identifier 97 ((*R*) 47) ) (Literal 98 (Boolean_Literal true) ))
  )
) 
(SeqDecl 99
(ProcBodyDecl 100 
  (mkprocBodyDecl 101
    (* = = = Procedure Name = = = *)
    ((*Is_Empty_Line*) 28)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
    (mkparamSpec 103 ((*R*) 49) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 104 (Identifier 105 ((*R*) 49) ) (Literal 106 (Boolean_Literal true) ))
  )
) 
(SeqDecl 107
(ProcBodyDecl 108 
  (mkprocBodyDecl 109
    (* = = = Procedure Name = = = *)
    ((*No_Complete_Lines*) 29)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
    (mkparamSpec 111 ((*R*) 51) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 112 (Identifier 113 ((*R*) 51) ) (Literal 114 (Boolean_Literal true) ))
  )
) 
(SeqDecl 115
(ProcBodyDecl 116 
  (mkprocBodyDecl 117
    (* = = = Procedure Name = = = *)
    ((*Possible_I_Shapes*) 24)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparamSpec 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpec 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpec 121 ((*R*) 55) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 122 (Identifier 123 ((*R*) 55) ) (Literal 124 (Boolean_Literal true) ))
  )
) 
(SeqDecl 125
(ProcBodyDecl 126 
  (mkprocBodyDecl 127
    (* = = = Procedure Name = = = *)
    ((*Possible_Three_Shapes*) 25)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
    (mkparamSpec 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparamSpec 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpec 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpec 132 ((*R*) 60) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 133 (Identifier 134 ((*R*) 60) ) (Literal 135 (Boolean_Literal true) ))
  )
) 
(SeqDecl 136
(ProcBodyDecl 137 
  (mkprocBodyDecl 138
    (* = = = Procedure Name = = = *)
    ((*Include_Piece_In_Board*) 38)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 139
  (ObjDecl 141 (mkobjDecl 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((Literal 140 (Integer_Literal 0) ))))) 
  (SeqDecl 143
  (ObjDecl 145 (mkobjDecl 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((Literal 144 (Integer_Literal 0) ))))) 
  (ObjDecl 147 (mkobjDecl 148 ((*R*) 64) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (Seq 149
      (If 150 (BinOp 151 Equal (Name 152 (SelectedComponent 153 (Identifier 154 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (Literal 156 (Integer_Literal 2) ) )
        (Seq 157
        (Assign 158 (IndexedComponent 159 (IndexedComponent 160 (Identifier 161 ((*Cur_Board*) 8) ) (Name 162 (SelectedComponent 163 (Identifier 164 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (Name 166 (SelectedComponent 167 (Identifier 168 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (Name 170 (SelectedComponent 171 (Identifier 172 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
        (Seq 174
        (Assign 175 (IndexedComponent 176 (IndexedComponent 177 (Identifier 178 ((*Cur_Board*) 8) ) (BinOp 179 Plus (Name 180 (SelectedComponent 181 (Identifier 182 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Literal 184 (Integer_Literal 1) ) ) ) (Name 185 (SelectedComponent 186 (Identifier 187 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (Name 189 (SelectedComponent 190 (Identifier 191 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
        (Seq 193
        (Assign 194 (IndexedComponent 195 (IndexedComponent 196 (Identifier 197 ((*Cur_Board*) 8) ) (Name 198 (SelectedComponent 199 (Identifier 200 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (BinOp 202 Plus (Name 203 (SelectedComponent 204 (Identifier 205 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Literal 207 (Integer_Literal 1) ) ) ) (Name 208 (SelectedComponent 209 (Identifier 210 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
        (Assign 212 (IndexedComponent 213 (IndexedComponent 214 (Identifier 215 ((*Cur_Board*) 8) ) (BinOp 216 Plus (Name 217 (SelectedComponent 218 (Identifier 219 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Literal 221 (Integer_Literal 1) ) ) ) (BinOp 222 Plus (Name 223 (SelectedComponent 224 (Identifier 225 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Literal 227 (Integer_Literal 1) ) ) ) (Name 228 (SelectedComponent 229 (Identifier 230 ((*Cur_Piece*) 17) ) ((*S*) 13) ))))))
        (If 232 (BinOp 233 Equal (Name 234 (SelectedComponent 235 (Identifier 236 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (Literal 238 (Integer_Literal 1) ) )
          (While 239 (BinOp 240 Less_Than_Or_Equal (Name 241 (Identifier 242 ((*Y*) 62) )) (Literal 243 (Integer_Literal 3) ) )
            (Seq 244
            (While 245 (BinOp 246 Less_Than_Or_Equal (Name 247 (Identifier 248 ((*X*) 63) )) (Literal 249 (Integer_Literal 3) ) )
              (Seq 250
              (Call 251 252 ((*Possible_I_Shapes*) 24) 
                ((Name 253 (SelectedComponent 254 (Identifier 255 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (Name 257 (Identifier 258 ((*Y*) 62) )) :: (Name 259 (Identifier 260 ((*X*) 63) )) :: (Name 261 (Identifier 262 ((*R*) 64) )) :: nil)
              ) 
              (Seq 263
              (If 264 (Name 265 (Identifier 266 ((*R*) 64) ))
                (Assign 267 (IndexedComponent 268 (IndexedComponent 269 (Identifier 270 ((*Cur_Board*) 8) ) (BinOp 271 Plus (Name 272 (SelectedComponent 273 (Identifier 274 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Name 276 (Identifier 277 ((*Y*) 62) )) ) ) (BinOp 278 Plus (Name 279 (SelectedComponent 280 (Identifier 281 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Name 283 (Identifier 284 ((*X*) 63) )) ) ) (Name 285 (SelectedComponent 286 (Identifier 287 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
                Null
              ) 
              (Assign 289 (Identifier 290 ((*X*) 63) ) (BinOp 291 Plus (Name 292 (Identifier 293 ((*X*) 63) )) (Literal 294 (Integer_Literal 1) ) ))))
            ) 
            (Assign 295 (Identifier 296 ((*Y*) 62) ) (BinOp 297 Plus (Name 298 (Identifier 299 ((*Y*) 62) )) (Literal 300 (Integer_Literal 1) ) )))
          )
          (While 301 (BinOp 302 Less_Than_Or_Equal (Name 303 (Identifier 304 ((*Y*) 62) )) (Literal 305 (Integer_Literal 2) ) )
            (Seq 306
            (While 307 (BinOp 308 Less_Than_Or_Equal (Name 309 (Identifier 310 ((*X*) 63) )) (Literal 311 (Integer_Literal 2) ) )
              (Seq 312
              (Call 313 314 ((*Possible_Three_Shapes*) 25) 
                ((Name 315 (SelectedComponent 316 (Identifier 317 ((*Cur_Piece*) 17) ) ((*S*) 13) )) :: (Name 319 (SelectedComponent 320 (Identifier 321 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (Name 323 (Identifier 324 ((*Y*) 62) )) :: (Name 325 (Identifier 326 ((*X*) 63) )) :: (Name 327 (Identifier 328 ((*R*) 64) )) :: nil)
              ) 
              (Seq 329
              (If 330 (Name 331 (Identifier 332 ((*R*) 64) ))
                (Assign 333 (IndexedComponent 334 (IndexedComponent 335 (Identifier 336 ((*Cur_Board*) 8) ) (BinOp 337 Plus (Name 338 (SelectedComponent 339 (Identifier 340 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Name 342 (Identifier 343 ((*Y*) 62) )) ) ) (BinOp 344 Plus (Name 345 (SelectedComponent 346 (Identifier 347 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Name 349 (Identifier 350 ((*X*) 63) )) ) ) (Name 351 (SelectedComponent 352 (Identifier 353 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
                Null
              ) 
              (Assign 355 (Identifier 356 ((*X*) 63) ) (BinOp 357 Plus (Name 358 (Identifier 359 ((*X*) 63) )) (Literal 360 (Integer_Literal 1) ) ))))
            ) 
            (Assign 361 (Identifier 362 ((*Y*) 62) ) (BinOp 363 Plus (Name 364 (Identifier 365 ((*Y*) 62) )) (Literal 366 (Integer_Literal 1) ) )))
          )
        )
      ) 
      (Assign 367 (Identifier 368 ((*Cur_State*) 19) ) (Literal 369 (Integer_Literal 2) )))
  )
) 
(SeqDecl 370
(ProcBodyDecl 371 
  (mkprocBodyDecl 372
    (* = = = Procedure Name = = = *)
    ((*Delete_Complete_Lines*) 39)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 373
  (ObjDecl 374 (mkobjDecl 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
  (SeqDecl 376
  (ObjDecl 378 (mkobjDecl 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((Literal 377 (Integer_Literal 10) ))))) 
  (SeqDecl 380
  (ObjDecl 382 (mkobjDecl 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((Literal 381 (Boolean_Literal false) ))))) 
  (SeqDecl 384
  (ObjDecl 386 (mkobjDecl 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((Literal 385 (Integer_Literal 1) ))))) 
  (SeqDecl 388
  (ObjDecl 389 (mkobjDecl 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
  (ObjDecl 391 (mkobjDecl 392 ((*R*) 71) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (Seq 393
      (While 394 (BinOp 395 Less_Than_Or_Equal (Name 396 (Identifier 397 ((*Del_Line*) 69) )) (Literal 398 (Integer_Literal 50) ) )
        (Seq 399
        (Call 400 401 ((*Is_Complete_Line*) 27) 
          ((Name 402 (IndexedComponent 403 (Identifier 404 ((*Cur_Board*) 8) ) (Name 405 (Identifier 406 ((*Del_Line*) 69) )) )) :: (Name 407 (Identifier 408 ((*R*) 71) )) :: nil)
        ) 
        (Seq 409
        (If 410 (Name 411 (Identifier 412 ((*R*) 71) ))
          (Seq 413
          (Assign 414 (IndexedComponent 415 (Identifier 416 ((*Cur_Board*) 8) ) (Name 417 (Identifier 418 ((*Del_Line*) 69) )) ) (Name 419 (Identifier 420 ((*Empty_Line*) 66) ))) 
          (Seq 421
          (Assign 422 (Identifier 423 ((*Has_Complete_Lines*) 68) ) (Literal 424 (Boolean_Literal true) )) 
          (Assign 425 (Identifier 426 ((*To_Line*) 67) ) (Name 427 (Identifier 428 ((*Del_Line*) 69) )))))
          Null
        ) 
        (Assign 429 (Identifier 430 ((*Del_Line*) 69) ) (BinOp 431 Plus (Name 432 (Identifier 433 ((*Del_Line*) 69) )) (Literal 434 (Integer_Literal 1) ) ))))
      ) 
      (Seq 435
      (If 436 (Name 437 (Identifier 438 ((*Has_Complete_Lines*) 68) ))
        (Seq 439
        (Assign 440 (Identifier 441 ((*From_Line*) 70) ) (Literal 442 (Integer_Literal 9) )) 
        (While 443 (BinOp 444 Greater_Than_Or_Equal (Name 445 (Identifier 446 ((*From_Line*) 70) )) (Literal 447 (Integer_Literal 1) ) )
          (Seq 448
          (Call 449 450 ((*Is_Empty_Line*) 28) 
            ((Name 451 (IndexedComponent 452 (Identifier 453 ((*Cur_Board*) 8) ) (Name 454 (Identifier 455 ((*From_Line*) 70) )) )) :: (Name 456 (Identifier 457 ((*R*) 71) )) :: nil)
          ) 
          (Seq 458
          (If 459 (UnOp 460 Not (Name 461 (Identifier 462 ((*R*) 71) )) )
            (Seq 463
            (Assign 464 (IndexedComponent 465 (Identifier 466 ((*Cur_Board*) 8) ) (Name 467 (Identifier 468 ((*To_Line*) 67) )) ) (Name 469 (IndexedComponent 470 (Identifier 471 ((*Cur_Board*) 8) ) (Name 472 (Identifier 473 ((*From_Line*) 70) )) ))) 
            (Seq 474
            (Assign 475 (IndexedComponent 476 (Identifier 477 ((*Cur_Board*) 8) ) (Name 478 (Identifier 479 ((*From_Line*) 70) )) ) (Name 480 (Identifier 481 ((*Empty_Line*) 66) ))) 
            (Assign 482 (Identifier 483 ((*To_Line*) 67) ) (BinOp 484 Minus (Name 485 (Identifier 486 ((*To_Line*) 67) )) (Literal 487 (Integer_Literal 1) ) ))))
            Null
          ) 
          (Assign 488 (Identifier 489 ((*From_Line*) 70) ) (BinOp 490 Minus (Name 491 (Identifier 492 ((*From_Line*) 70) )) (Literal 493 (Integer_Literal 1) ) ))))
        ))
        Null
      ) 
      (Assign 494 (Identifier 495 ((*Cur_State*) 19) ) (Literal 496 (Integer_Literal 3) ))))
  )
) 
(SeqDecl 497
(ProcBodyDecl 498 
  (mkprocBodyDecl 499
    (* = = = Procedure Name = = = *)
    ((*No_Overlap*) 30)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
    (mkparamSpec 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparamSpec 502 ((*R*) 74) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (Assign 503 (Identifier 504 ((*R*) 74) ) (Literal 505 (Boolean_Literal true) ))
  )
) 
(SeqDecl 506
(ProcBodyDecl 507 
  (mkprocBodyDecl 508
    (* = = = Procedure Name = = = *)
    ((*Turn_Direction*) 34)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparamSpec 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
    (mkparamSpec 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (If 512 (BinOp 513 Equal (Name 514 (Identifier 515 ((*T*) 76) )) (Literal 516 (Integer_Literal 3) ) )
        (If 517 (BinOp 518 Equal (Name 519 (Identifier 520 ((*D*) 75) )) (Literal 521 (Integer_Literal 0) ) )
          (Assign 522 (Identifier 523 ((*R*) 77) ) (Literal 524 (Integer_Literal 3) ))
          (Assign 525 (Identifier 526 ((*R*) 77) ) (BinOp 527 Minus (Name 528 (Identifier 529 ((*D*) 75) )) (Literal 530 (Integer_Literal 1) ) ))
        )
        (If 531 (BinOp 532 Equal (Name 533 (Identifier 534 ((*D*) 75) )) (Literal 535 (Integer_Literal 3) ) )
          (Assign 536 (Identifier 537 ((*R*) 77) ) (Literal 538 (Integer_Literal 0) ))
          (Assign 539 (Identifier 540 ((*R*) 77) ) (BinOp 541 Plus (Name 542 (Identifier 543 ((*D*) 75) )) (Literal 544 (Integer_Literal 1) ) ))
        )
      )
  )
) 
(SeqDecl 545
(ProcBodyDecl 546 
  (mkprocBodyDecl 547
    (* = = = Procedure Name = = = *)
    ((*Move_Is_Possible*) 35)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparamSpec 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparamSpec 550 ((*R*) 80) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (If 551 (BinOp 552 Equal (Name 553 (Identifier 554 ((*A*) 79) )) (Literal 555 (Integer_Literal 0) ) )
        (Assign 556 (Identifier 557 ((*R*) 80) ) (BinOp 558 And (BinOp 559 Greater_Than_Or_Equal (BinOp 560 Minus (Name 561 (SelectedComponent 562 (Identifier 563 ((*P*) 78) ) ((*X*) 15) )) (Literal 565 (Integer_Literal 1) ) ) (UnOp 566 Unary_Minus (Literal 567 (Integer_Literal 1) ) ) ) (BinOp 568 Less_Than_Or_Equal (BinOp 569 Minus (Name 570 (SelectedComponent 571 (Identifier 572 ((*P*) 78) ) ((*X*) 15) )) (Literal 574 (Integer_Literal 1) ) ) (Literal 575 (Integer_Literal 9) ) ) ))
        (If 576 (BinOp 577 Equal (Name 578 (Identifier 579 ((*A*) 79) )) (Literal 580 (Integer_Literal 1) ) )
          (Assign 581 (Identifier 582 ((*R*) 80) ) (BinOp 583 And (BinOp 584 Greater_Than_Or_Equal (BinOp 585 Plus (Name 586 (SelectedComponent 587 (Identifier 588 ((*P*) 78) ) ((*X*) 15) )) (Literal 590 (Integer_Literal 1) ) ) (UnOp 591 Unary_Minus (Literal 592 (Integer_Literal 1) ) ) ) (BinOp 593 Less_Than_Or_Equal (BinOp 594 Plus (Name 595 (SelectedComponent 596 (Identifier 597 ((*P*) 78) ) ((*X*) 15) )) (Literal 599 (Integer_Literal 1) ) ) (Literal 600 (Integer_Literal 9) ) ) ))
          (If 601 (BinOp 602 Equal (Name 603 (Identifier 604 ((*A*) 79) )) (Literal 605 (Integer_Literal 2) ) )
            (Assign 606 (Identifier 607 ((*R*) 80) ) (BinOp 608 And (BinOp 609 Greater_Than_Or_Equal (BinOp 610 Plus (Name 611 (SelectedComponent 612 (Identifier 613 ((*P*) 78) ) ((*Y*) 16) )) (Literal 615 (Integer_Literal 1) ) ) (UnOp 616 Unary_Minus (Literal 617 (Integer_Literal 1) ) ) ) (BinOp 618 Less_Than_Or_Equal (BinOp 619 Plus (Name 620 (SelectedComponent 621 (Identifier 622 ((*P*) 78) ) ((*Y*) 16) )) (Literal 624 (Integer_Literal 1) ) ) (Literal 625 (Integer_Literal 49) ) ) ))
            (Assign 626 (Identifier 627 ((*R*) 80) ) (Literal 628 (Boolean_Literal true) ))
          )
        )
      )
  )
) 
(SeqDecl 629
(ProcBodyDecl 630 
  (mkprocBodyDecl 631
    (* = = = Procedure Name = = = *)
    ((*Move*) 36)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparamSpec 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparamSpec 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDecl)
    (* = = = Procedure Body = = = *)
      (If 635 (BinOp 636 Equal (Name 637 (Identifier 638 ((*A*) 82) )) (Literal 639 (Integer_Literal 0) ) )
        (Assign 640 (SelectedComponent 641 (Identifier 642 ((*R*) 83) ) ((*X*) 15) ) (BinOp 644 Minus (Name 645 (SelectedComponent 646 (Identifier 647 ((*P*) 81) ) ((*X*) 15) )) (Literal 649 (Integer_Literal 1) ) ))
        (If 650 (BinOp 651 Equal (Name 652 (Identifier 653 ((*A*) 82) )) (Literal 654 (Integer_Literal 1) ) )
          (Assign 655 (SelectedComponent 656 (Identifier 657 ((*R*) 83) ) ((*X*) 15) ) (BinOp 659 Plus (Name 660 (SelectedComponent 661 (Identifier 662 ((*P*) 81) ) ((*X*) 15) )) (Literal 664 (Integer_Literal 1) ) ))
          (If 665 (BinOp 666 Equal (Name 667 (Identifier 668 ((*A*) 82) )) (Literal 669 (Integer_Literal 2) ) )
            (Assign 670 (SelectedComponent 671 (Identifier 672 ((*R*) 83) ) ((*Y*) 16) ) (BinOp 674 Plus (Name 675 (SelectedComponent 676 (Identifier 677 ((*P*) 81) ) ((*Y*) 16) )) (Literal 679 (Integer_Literal 1) ) ))
            (Call 680 681 ((*Turn_Direction*) 34) 
              ((Name 682 (SelectedComponent 683 (Identifier 684 ((*P*) 81) ) ((*D*) 14) )) :: (Name 686 (Identifier 687 ((*A*) 82) )) :: (Name 688 (SelectedComponent 689 (Identifier 690 ((*R*) 83) ) ((*D*) 14) )) :: nil)
            )
          )
        )
      )
  )
) 
(ProcBodyDecl 692 
  (mkprocBodyDecl 693
    (* = = = Procedure Name = = = *)
    ((*Do_Action*) 37)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpec 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparamSpec 695 ((*Success*) 85) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDecl 696
  (ObjDecl 697 (mkobjDecl 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
  (SeqDecl 699
  (ObjDecl 700 (mkobjDecl 701 ((*Is_Move_OK*) 87) Boolean None)) 
  (ObjDecl 702 (mkobjDecl 703 ((*Is_No_Overlap*) 88) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (Seq 704
      (Call 705 706 ((*Move_Is_Possible*) 35) 
        ((Name 707 (Identifier 708 ((*Cur_Piece*) 17) )) :: (Name 709 (Identifier 710 ((*A*) 84) )) :: (Name 711 (Identifier 712 ((*Is_Move_OK*) 87) )) :: nil)
      ) 
      (Seq 713
      (If 714 (Name 715 (Identifier 716 ((*Is_Move_OK*) 87) ))
        (Seq 717
        (Call 718 719 ((*Move*) 36) 
          ((Name 720 (Identifier 721 ((*Cur_Piece*) 17) )) :: (Name 722 (Identifier 723 ((*A*) 84) )) :: (Name 724 (Identifier 725 ((*Candidate*) 86) )) :: nil)
        ) 
        (Seq 726
        (Call 727 728 ((*No_Overlap*) 30) 
          ((Name 729 (Identifier 730 ((*Cur_Board*) 8) )) :: (Name 731 (Identifier 732 ((*Candidate*) 86) )) :: (Name 733 (Identifier 734 ((*Is_No_Overlap*) 88) )) :: nil)
        ) 
        (If 735 (Name 736 (Identifier 737 ((*Is_No_Overlap*) 88) ))
          (Seq 738
          (Assign 739 (Identifier 740 ((*Cur_Piece*) 17) ) (Name 741 (Identifier 742 ((*Candidate*) 86) ))) 
          (Seq 743
          (Assign 744 (Identifier 745 ((*Success*) 85) ) (Literal 746 (Boolean_Literal true) )) 
          Null (* Ignore Return Statement ! *)))
          Null
        )))
        Null
      ) 
      (Assign 747 (Identifier 748 ((*Success*) 85) ) (Literal 749 (Boolean_Literal false) ))))
  )
))))))))))))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_Table := 
(Symbol_Table_Module.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*R*) 49), (Out, Boolean)) :: (((*X*) 53), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Cur_Board*) 8), (In_Out, (Array_Type ((*Board*) 7)))) :: (((*To_Line*) 67), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 55), (Out, Boolean)) :: (((*P*) 81), (In, (Record_Type ((*Piece*) 12)))) :: (((*A*) 82), (In, (Derived_Type ((*Action*) 31)))) :: (((*From_Line*) 70), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 64), (In_Out, Boolean)) :: (((*Is_No_Overlap*) 88), (In_Out, Boolean)) :: (((*L*) 48), (In, (Array_Type ((*Line*) 6)))) :: (((*Candidate*) 86), (In_Out, (Record_Type ((*Piece*) 12)))) :: (((*X*) 58), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Success*) 85), (Out, Boolean)) :: (((*B*) 72), (In, (Array_Type ((*Board*) 7)))) :: (((*Y*) 54), (In, (Subtype ((*I_Delta*) 20)))) :: (((*X*) 43), (In, Integer)) :: (((*Is_Move_OK*) 87), (In_Out, Boolean)) :: (((*T*) 76), (In, (Subtype ((*Turn_Action*) 33)))) :: (((*Has_Complete_Lines*) 68), (In_Out, Boolean)) :: (((*Cur_State*) 19), (In_Out, (Derived_Type ((*State*) 18)))) :: (((*R*) 51), (Out, Boolean)) :: (((*Y*) 42), (In, Integer)) :: (((*A*) 84), (In, (Derived_Type ((*Action*) 31)))) :: (((*Cur_Piece_D*) 52), (In, (Derived_Type ((*Direction*) 11)))) :: (((*B*) 41), (In, (Array_Type ((*Board*) 7)))) :: (((*Cur_Piece_S*) 56), (In, (Subtype ((*Shape*) 2)))) :: (((*Y*) 59), (In, (Subtype ((*I_Delta*) 20)))) :: (((*D*) 75), (In, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 47), (Out, Boolean)) :: (((*Del_Line*) 69), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 60), (Out, Boolean)) :: (((*X*) 63), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*P*) 73), (In, (Record_Type ((*Piece*) 12)))) :: (((*B*) 50), (In, (Array_Type ((*Board*) 7)))) :: (((*R*) 77), (Out, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 44), (Out, Boolean)) :: (((*R*) 83), (Out, (Record_Type ((*Piece*) 12)))) :: (((*Cur_Piece_D*) 57), (In, (Derived_Type ((*Direction*) 11)))) :: (((*Y*) 62), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*R*) 74), (Out, Boolean)) :: (((*L*) 46), (In, (Array_Type ((*Line*) 6)))) :: (((*R*) 80), (Out, Boolean)) :: (((*Empty_Line*) 66), (In_Out, (Array_Type ((*Line*) 6)))) :: (((*A*) 79), (In, (Derived_Type ((*Action*) 31)))) :: (((*P*) 78), (In, (Record_Type ((*Piece*) 12)))) :: (((*R*) 71), (In_Out, Boolean)) :: (((*Cur_Piece*) 17), (In_Out, (Record_Type ((*Piece*) 12)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Possible_Three_Shapes*) 25), (0, (mkprocBodyDecl 127
  (* = = = Procedure Name = = = *)
  ((*Possible_Three_Shapes*) 25)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
  (mkparamSpec 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparamSpec 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpec 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpec 132 ((*R*) 60) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 133 (Identifier 134 ((*R*) 60) ) (Literal 135 (Boolean_Literal true) ))
))) :: (((*Do_Action*) 37), (0, (mkprocBodyDecl 693
  (* = = = Procedure Name = = = *)
  ((*Do_Action*) 37)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparamSpec 695 ((*Success*) 85) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 696
(ObjDecl 697 (mkobjDecl 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
(SeqDecl 699
(ObjDecl 700 (mkobjDecl 701 ((*Is_Move_OK*) 87) Boolean None)) 
(ObjDecl 702 (mkobjDecl 703 ((*Is_No_Overlap*) 88) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (Seq 704
    (Call 705 706 ((*Move_Is_Possible*) 35) 
      ((Name 707 (Identifier 708 ((*Cur_Piece*) 17) )) :: (Name 709 (Identifier 710 ((*A*) 84) )) :: (Name 711 (Identifier 712 ((*Is_Move_OK*) 87) )) :: nil)
    ) 
    (Seq 713
    (If 714 (Name 715 (Identifier 716 ((*Is_Move_OK*) 87) ))
      (Seq 717
      (Call 718 719 ((*Move*) 36) 
        ((Name 720 (Identifier 721 ((*Cur_Piece*) 17) )) :: (Name 722 (Identifier 723 ((*A*) 84) )) :: (Name 724 (Identifier 725 ((*Candidate*) 86) )) :: nil)
      ) 
      (Seq 726
      (Call 727 728 ((*No_Overlap*) 30) 
        ((Name 729 (Identifier 730 ((*Cur_Board*) 8) )) :: (Name 731 (Identifier 732 ((*Candidate*) 86) )) :: (Name 733 (Identifier 734 ((*Is_No_Overlap*) 88) )) :: nil)
      ) 
      (If 735 (Name 736 (Identifier 737 ((*Is_No_Overlap*) 88) ))
        (Seq 738
        (Assign 739 (Identifier 740 ((*Cur_Piece*) 17) ) (Name 741 (Identifier 742 ((*Candidate*) 86) ))) 
        (Seq 743
        (Assign 744 (Identifier 745 ((*Success*) 85) ) (Literal 746 (Boolean_Literal true) )) 
        Null (* Ignore Return Statement ! *)))
        Null
      )))
      Null
    ) 
    (Assign 747 (Identifier 748 ((*Success*) 85) ) (Literal 749 (Boolean_Literal false) ))))
))) :: (((*No_Complete_Lines*) 29), (0, (mkprocBodyDecl 109
  (* = = = Procedure Name = = = *)
  ((*No_Complete_Lines*) 29)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
  (mkparamSpec 111 ((*R*) 51) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 112 (Identifier 113 ((*R*) 51) ) (Literal 114 (Boolean_Literal true) ))
))) :: (((*Is_Complete_Line*) 27), (0, (mkprocBodyDecl 93
  (* = = = Procedure Name = = = *)
  ((*Is_Complete_Line*) 27)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
  (mkparamSpec 95 ((*R*) 47) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 96 (Identifier 97 ((*R*) 47) ) (Literal 98 (Boolean_Literal true) ))
))) :: (((*Is_Empty*) 26), (0, (mkprocBodyDecl 83
  (* = = = Procedure Name = = = *)
  ((*Is_Empty*) 26)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
  (mkparamSpec 85 ((*Y*) 42) Integer In) :: 
  (mkparamSpec 86 ((*X*) 43) Integer In) :: 
  (mkparamSpec 87 ((*R*) 44) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 88 (Identifier 89 ((*R*) 44) ) (Literal 90 (Boolean_Literal true) ))
))) :: (((*No_Overlap*) 30), (0, (mkprocBodyDecl 499
  (* = = = Procedure Name = = = *)
  ((*No_Overlap*) 30)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
  (mkparamSpec 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparamSpec 502 ((*R*) 74) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 503 (Identifier 504 ((*R*) 74) ) (Literal 505 (Boolean_Literal true) ))
))) :: (((*Possible_I_Shapes*) 24), (0, (mkprocBodyDecl 117
  (* = = = Procedure Name = = = *)
  ((*Possible_I_Shapes*) 24)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparamSpec 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpec 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpec 121 ((*R*) 55) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 122 (Identifier 123 ((*R*) 55) ) (Literal 124 (Boolean_Literal true) ))
))) :: (((*Include_Piece_In_Board*) 38), (0, (mkprocBodyDecl 138
  (* = = = Procedure Name = = = *)
  ((*Include_Piece_In_Board*) 38)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 139
(ObjDecl 141 (mkobjDecl 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((Literal 140 (Integer_Literal 0) ))))) 
(SeqDecl 143
(ObjDecl 145 (mkobjDecl 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((Literal 144 (Integer_Literal 0) ))))) 
(ObjDecl 147 (mkobjDecl 148 ((*R*) 64) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (Seq 149
    (If 150 (BinOp 151 Equal (Name 152 (SelectedComponent 153 (Identifier 154 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (Literal 156 (Integer_Literal 2) ) )
      (Seq 157
      (Assign 158 (IndexedComponent 159 (IndexedComponent 160 (Identifier 161 ((*Cur_Board*) 8) ) (Name 162 (SelectedComponent 163 (Identifier 164 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (Name 166 (SelectedComponent 167 (Identifier 168 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (Name 170 (SelectedComponent 171 (Identifier 172 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
      (Seq 174
      (Assign 175 (IndexedComponent 176 (IndexedComponent 177 (Identifier 178 ((*Cur_Board*) 8) ) (BinOp 179 Plus (Name 180 (SelectedComponent 181 (Identifier 182 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Literal 184 (Integer_Literal 1) ) ) ) (Name 185 (SelectedComponent 186 (Identifier 187 ((*Cur_Piece*) 17) ) ((*X*) 15) )) ) (Name 189 (SelectedComponent 190 (Identifier 191 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
      (Seq 193
      (Assign 194 (IndexedComponent 195 (IndexedComponent 196 (Identifier 197 ((*Cur_Board*) 8) ) (Name 198 (SelectedComponent 199 (Identifier 200 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) ) (BinOp 202 Plus (Name 203 (SelectedComponent 204 (Identifier 205 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Literal 207 (Integer_Literal 1) ) ) ) (Name 208 (SelectedComponent 209 (Identifier 210 ((*Cur_Piece*) 17) ) ((*S*) 13) ))) 
      (Assign 212 (IndexedComponent 213 (IndexedComponent 214 (Identifier 215 ((*Cur_Board*) 8) ) (BinOp 216 Plus (Name 217 (SelectedComponent 218 (Identifier 219 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Literal 221 (Integer_Literal 1) ) ) ) (BinOp 222 Plus (Name 223 (SelectedComponent 224 (Identifier 225 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Literal 227 (Integer_Literal 1) ) ) ) (Name 228 (SelectedComponent 229 (Identifier 230 ((*Cur_Piece*) 17) ) ((*S*) 13) ))))))
      (If 232 (BinOp 233 Equal (Name 234 (SelectedComponent 235 (Identifier 236 ((*Cur_Piece*) 17) ) ((*S*) 13) )) (Literal 238 (Integer_Literal 1) ) )
        (While 239 (BinOp 240 Less_Than_Or_Equal (Name 241 (Identifier 242 ((*Y*) 62) )) (Literal 243 (Integer_Literal 3) ) )
          (Seq 244
          (While 245 (BinOp 246 Less_Than_Or_Equal (Name 247 (Identifier 248 ((*X*) 63) )) (Literal 249 (Integer_Literal 3) ) )
            (Seq 250
            (Call 251 252 ((*Possible_I_Shapes*) 24) 
              ((Name 253 (SelectedComponent 254 (Identifier 255 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (Name 257 (Identifier 258 ((*Y*) 62) )) :: (Name 259 (Identifier 260 ((*X*) 63) )) :: (Name 261 (Identifier 262 ((*R*) 64) )) :: nil)
            ) 
            (Seq 263
            (If 264 (Name 265 (Identifier 266 ((*R*) 64) ))
              (Assign 267 (IndexedComponent 268 (IndexedComponent 269 (Identifier 270 ((*Cur_Board*) 8) ) (BinOp 271 Plus (Name 272 (SelectedComponent 273 (Identifier 274 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Name 276 (Identifier 277 ((*Y*) 62) )) ) ) (BinOp 278 Plus (Name 279 (SelectedComponent 280 (Identifier 281 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Name 283 (Identifier 284 ((*X*) 63) )) ) ) (Name 285 (SelectedComponent 286 (Identifier 287 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
              Null
            ) 
            (Assign 289 (Identifier 290 ((*X*) 63) ) (BinOp 291 Plus (Name 292 (Identifier 293 ((*X*) 63) )) (Literal 294 (Integer_Literal 1) ) ))))
          ) 
          (Assign 295 (Identifier 296 ((*Y*) 62) ) (BinOp 297 Plus (Name 298 (Identifier 299 ((*Y*) 62) )) (Literal 300 (Integer_Literal 1) ) )))
        )
        (While 301 (BinOp 302 Less_Than_Or_Equal (Name 303 (Identifier 304 ((*Y*) 62) )) (Literal 305 (Integer_Literal 2) ) )
          (Seq 306
          (While 307 (BinOp 308 Less_Than_Or_Equal (Name 309 (Identifier 310 ((*X*) 63) )) (Literal 311 (Integer_Literal 2) ) )
            (Seq 312
            (Call 313 314 ((*Possible_Three_Shapes*) 25) 
              ((Name 315 (SelectedComponent 316 (Identifier 317 ((*Cur_Piece*) 17) ) ((*S*) 13) )) :: (Name 319 (SelectedComponent 320 (Identifier 321 ((*Cur_Piece*) 17) ) ((*D*) 14) )) :: (Name 323 (Identifier 324 ((*Y*) 62) )) :: (Name 325 (Identifier 326 ((*X*) 63) )) :: (Name 327 (Identifier 328 ((*R*) 64) )) :: nil)
            ) 
            (Seq 329
            (If 330 (Name 331 (Identifier 332 ((*R*) 64) ))
              (Assign 333 (IndexedComponent 334 (IndexedComponent 335 (Identifier 336 ((*Cur_Board*) 8) ) (BinOp 337 Plus (Name 338 (SelectedComponent 339 (Identifier 340 ((*Cur_Piece*) 17) ) ((*Y*) 16) )) (Name 342 (Identifier 343 ((*Y*) 62) )) ) ) (BinOp 344 Plus (Name 345 (SelectedComponent 346 (Identifier 347 ((*Cur_Piece*) 17) ) ((*X*) 15) )) (Name 349 (Identifier 350 ((*X*) 63) )) ) ) (Name 351 (SelectedComponent 352 (Identifier 353 ((*Cur_Piece*) 17) ) ((*S*) 13) )))
              Null
            ) 
            (Assign 355 (Identifier 356 ((*X*) 63) ) (BinOp 357 Plus (Name 358 (Identifier 359 ((*X*) 63) )) (Literal 360 (Integer_Literal 1) ) ))))
          ) 
          (Assign 361 (Identifier 362 ((*Y*) 62) ) (BinOp 363 Plus (Name 364 (Identifier 365 ((*Y*) 62) )) (Literal 366 (Integer_Literal 1) ) )))
        )
      )
    ) 
    (Assign 367 (Identifier 368 ((*Cur_State*) 19) ) (Literal 369 (Integer_Literal 2) )))
))) :: (((*Is_Empty_Line*) 28), (0, (mkprocBodyDecl 101
  (* = = = Procedure Name = = = *)
  ((*Is_Empty_Line*) 28)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
  (mkparamSpec 103 ((*R*) 49) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (Assign 104 (Identifier 105 ((*R*) 49) ) (Literal 106 (Boolean_Literal true) ))
))) :: (((*Move_Is_Possible*) 35), (0, (mkprocBodyDecl 547
  (* = = = Procedure Name = = = *)
  ((*Move_Is_Possible*) 35)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparamSpec 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparamSpec 550 ((*R*) 80) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (If 551 (BinOp 552 Equal (Name 553 (Identifier 554 ((*A*) 79) )) (Literal 555 (Integer_Literal 0) ) )
      (Assign 556 (Identifier 557 ((*R*) 80) ) (BinOp 558 And (BinOp 559 Greater_Than_Or_Equal (BinOp 560 Minus (Name 561 (SelectedComponent 562 (Identifier 563 ((*P*) 78) ) ((*X*) 15) )) (Literal 565 (Integer_Literal 1) ) ) (UnOp 566 Unary_Minus (Literal 567 (Integer_Literal 1) ) ) ) (BinOp 568 Less_Than_Or_Equal (BinOp 569 Minus (Name 570 (SelectedComponent 571 (Identifier 572 ((*P*) 78) ) ((*X*) 15) )) (Literal 574 (Integer_Literal 1) ) ) (Literal 575 (Integer_Literal 9) ) ) ))
      (If 576 (BinOp 577 Equal (Name 578 (Identifier 579 ((*A*) 79) )) (Literal 580 (Integer_Literal 1) ) )
        (Assign 581 (Identifier 582 ((*R*) 80) ) (BinOp 583 And (BinOp 584 Greater_Than_Or_Equal (BinOp 585 Plus (Name 586 (SelectedComponent 587 (Identifier 588 ((*P*) 78) ) ((*X*) 15) )) (Literal 590 (Integer_Literal 1) ) ) (UnOp 591 Unary_Minus (Literal 592 (Integer_Literal 1) ) ) ) (BinOp 593 Less_Than_Or_Equal (BinOp 594 Plus (Name 595 (SelectedComponent 596 (Identifier 597 ((*P*) 78) ) ((*X*) 15) )) (Literal 599 (Integer_Literal 1) ) ) (Literal 600 (Integer_Literal 9) ) ) ))
        (If 601 (BinOp 602 Equal (Name 603 (Identifier 604 ((*A*) 79) )) (Literal 605 (Integer_Literal 2) ) )
          (Assign 606 (Identifier 607 ((*R*) 80) ) (BinOp 608 And (BinOp 609 Greater_Than_Or_Equal (BinOp 610 Plus (Name 611 (SelectedComponent 612 (Identifier 613 ((*P*) 78) ) ((*Y*) 16) )) (Literal 615 (Integer_Literal 1) ) ) (UnOp 616 Unary_Minus (Literal 617 (Integer_Literal 1) ) ) ) (BinOp 618 Less_Than_Or_Equal (BinOp 619 Plus (Name 620 (SelectedComponent 621 (Identifier 622 ((*P*) 78) ) ((*Y*) 16) )) (Literal 624 (Integer_Literal 1) ) ) (Literal 625 (Integer_Literal 49) ) ) ))
          (Assign 626 (Identifier 627 ((*R*) 80) ) (Literal 628 (Boolean_Literal true) ))
        )
      )
    )
))) :: (((*Turn_Direction*) 34), (0, (mkprocBodyDecl 508
  (* = = = Procedure Name = = = *)
  ((*Turn_Direction*) 34)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparamSpec 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
  (mkparamSpec 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (If 512 (BinOp 513 Equal (Name 514 (Identifier 515 ((*T*) 76) )) (Literal 516 (Integer_Literal 3) ) )
      (If 517 (BinOp 518 Equal (Name 519 (Identifier 520 ((*D*) 75) )) (Literal 521 (Integer_Literal 0) ) )
        (Assign 522 (Identifier 523 ((*R*) 77) ) (Literal 524 (Integer_Literal 3) ))
        (Assign 525 (Identifier 526 ((*R*) 77) ) (BinOp 527 Minus (Name 528 (Identifier 529 ((*D*) 75) )) (Literal 530 (Integer_Literal 1) ) ))
      )
      (If 531 (BinOp 532 Equal (Name 533 (Identifier 534 ((*D*) 75) )) (Literal 535 (Integer_Literal 3) ) )
        (Assign 536 (Identifier 537 ((*R*) 77) ) (Literal 538 (Integer_Literal 0) ))
        (Assign 539 (Identifier 540 ((*R*) 77) ) (BinOp 541 Plus (Name 542 (Identifier 543 ((*D*) 75) )) (Literal 544 (Integer_Literal 1) ) ))
      )
    )
))) :: (((*Move*) 36), (0, (mkprocBodyDecl 631
  (* = = = Procedure Name = = = *)
  ((*Move*) 36)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpec 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparamSpec 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparamSpec 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDecl)
  (* = = = Procedure Body = = = *)
    (If 635 (BinOp 636 Equal (Name 637 (Identifier 638 ((*A*) 82) )) (Literal 639 (Integer_Literal 0) ) )
      (Assign 640 (SelectedComponent 641 (Identifier 642 ((*R*) 83) ) ((*X*) 15) ) (BinOp 644 Minus (Name 645 (SelectedComponent 646 (Identifier 647 ((*P*) 81) ) ((*X*) 15) )) (Literal 649 (Integer_Literal 1) ) ))
      (If 650 (BinOp 651 Equal (Name 652 (Identifier 653 ((*A*) 82) )) (Literal 654 (Integer_Literal 1) ) )
        (Assign 655 (SelectedComponent 656 (Identifier 657 ((*R*) 83) ) ((*X*) 15) ) (BinOp 659 Plus (Name 660 (SelectedComponent 661 (Identifier 662 ((*P*) 81) ) ((*X*) 15) )) (Literal 664 (Integer_Literal 1) ) ))
        (If 665 (BinOp 666 Equal (Name 667 (Identifier 668 ((*A*) 82) )) (Literal 669 (Integer_Literal 2) ) )
          (Assign 670 (SelectedComponent 671 (Identifier 672 ((*R*) 83) ) ((*Y*) 16) ) (BinOp 674 Plus (Name 675 (SelectedComponent 676 (Identifier 677 ((*P*) 81) ) ((*Y*) 16) )) (Literal 679 (Integer_Literal 1) ) ))
          (Call 680 681 ((*Turn_Direction*) 34) 
            ((Name 682 (SelectedComponent 683 (Identifier 684 ((*P*) 81) ) ((*D*) 14) )) :: (Name 686 (Identifier 687 ((*A*) 82) )) :: (Name 688 (SelectedComponent 689 (Identifier 690 ((*R*) 83) ) ((*D*) 14) )) :: nil)
          )
        )
      )
    )
))) :: (((*Delete_Complete_Lines*) 39), (0, (mkprocBodyDecl 372
  (* = = = Procedure Name = = = *)
  ((*Delete_Complete_Lines*) 39)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDecl 373
(ObjDecl 374 (mkobjDecl 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
(SeqDecl 376
(ObjDecl 378 (mkobjDecl 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((Literal 377 (Integer_Literal 10) ))))) 
(SeqDecl 380
(ObjDecl 382 (mkobjDecl 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((Literal 381 (Boolean_Literal false) ))))) 
(SeqDecl 384
(ObjDecl 386 (mkobjDecl 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((Literal 385 (Integer_Literal 1) ))))) 
(SeqDecl 388
(ObjDecl 389 (mkobjDecl 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
(ObjDecl 391 (mkobjDecl 392 ((*R*) 71) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (Seq 393
    (While 394 (BinOp 395 Less_Than_Or_Equal (Name 396 (Identifier 397 ((*Del_Line*) 69) )) (Literal 398 (Integer_Literal 50) ) )
      (Seq 399
      (Call 400 401 ((*Is_Complete_Line*) 27) 
        ((Name 402 (IndexedComponent 403 (Identifier 404 ((*Cur_Board*) 8) ) (Name 405 (Identifier 406 ((*Del_Line*) 69) )) )) :: (Name 407 (Identifier 408 ((*R*) 71) )) :: nil)
      ) 
      (Seq 409
      (If 410 (Name 411 (Identifier 412 ((*R*) 71) ))
        (Seq 413
        (Assign 414 (IndexedComponent 415 (Identifier 416 ((*Cur_Board*) 8) ) (Name 417 (Identifier 418 ((*Del_Line*) 69) )) ) (Name 419 (Identifier 420 ((*Empty_Line*) 66) ))) 
        (Seq 421
        (Assign 422 (Identifier 423 ((*Has_Complete_Lines*) 68) ) (Literal 424 (Boolean_Literal true) )) 
        (Assign 425 (Identifier 426 ((*To_Line*) 67) ) (Name 427 (Identifier 428 ((*Del_Line*) 69) )))))
        Null
      ) 
      (Assign 429 (Identifier 430 ((*Del_Line*) 69) ) (BinOp 431 Plus (Name 432 (Identifier 433 ((*Del_Line*) 69) )) (Literal 434 (Integer_Literal 1) ) ))))
    ) 
    (Seq 435
    (If 436 (Name 437 (Identifier 438 ((*Has_Complete_Lines*) 68) ))
      (Seq 439
      (Assign 440 (Identifier 441 ((*From_Line*) 70) ) (Literal 442 (Integer_Literal 9) )) 
      (While 443 (BinOp 444 Greater_Than_Or_Equal (Name 445 (Identifier 446 ((*From_Line*) 70) )) (Literal 447 (Integer_Literal 1) ) )
        (Seq 448
        (Call 449 450 ((*Is_Empty_Line*) 28) 
          ((Name 451 (IndexedComponent 452 (Identifier 453 ((*Cur_Board*) 8) ) (Name 454 (Identifier 455 ((*From_Line*) 70) )) )) :: (Name 456 (Identifier 457 ((*R*) 71) )) :: nil)
        ) 
        (Seq 458
        (If 459 (UnOp 460 Not (Name 461 (Identifier 462 ((*R*) 71) )) )
          (Seq 463
          (Assign 464 (IndexedComponent 465 (Identifier 466 ((*Cur_Board*) 8) ) (Name 467 (Identifier 468 ((*To_Line*) 67) )) ) (Name 469 (IndexedComponent 470 (Identifier 471 ((*Cur_Board*) 8) ) (Name 472 (Identifier 473 ((*From_Line*) 70) )) ))) 
          (Seq 474
          (Assign 475 (IndexedComponent 476 (Identifier 477 ((*Cur_Board*) 8) ) (Name 478 (Identifier 479 ((*From_Line*) 70) )) ) (Name 480 (Identifier 481 ((*Empty_Line*) 66) ))) 
          (Assign 482 (Identifier 483 ((*To_Line*) 67) ) (BinOp 484 Minus (Name 485 (Identifier 486 ((*To_Line*) 67) )) (Literal 487 (Integer_Literal 1) ) ))))
          Null
        ) 
        (Assign 488 (Identifier 489 ((*From_Line*) 70) ) (BinOp 490 Minus (Name 491 (Identifier 492 ((*From_Line*) 70) )) (Literal 493 (Integer_Literal 1) ) ))))
      ))
      Null
    ) 
    (Assign 494 (Identifier 495 ((*Cur_State*) 19) ) (Literal 496 (Integer_Literal 3) ))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Oriented_Three_Shape*) 23), (ArrayTypeDecl 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) :: (((*Y_Coord*) 5), (SubtypeDecl 16 ((*Y_Coord*) 5) Integer (Range 1 50))) :: (((*Board*) 7), (ArrayTypeDecl 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) :: (((*Move_Action*) 32), (SubtypeDecl 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (Range 0 1))) :: (((*Cell*) 1), (DerivedTypeDecl 4 ((*Cell*) 1) Integer (Range 0 8))) :: (((*Line*) 6), (ArrayTypeDecl 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) :: (((*PY_Coord*) 10), (SubtypeDecl 31 ((*PY_Coord*) 10) Integer (Range (-1) 49))) :: (((*Oriented_I_Shape*) 21), (ArrayTypeDecl 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) :: (((*Action*) 31), (DerivedTypeDecl 69 ((*Action*) 31) Integer (Range 0 4))) :: (((*Direction*) 11), (DerivedTypeDecl 34 ((*Direction*) 11) Integer (Range 0 3))) :: (((*Piece*) 12), (RecordTypeDecl 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) :: (((*Shape*) 2), (SubtypeDecl 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (Range 1 8))) :: (((*I_Delta*) 20), (SubtypeDecl 50 ((*I_Delta*) 20) Integer (Range 0 3))) :: (((*State*) 18), (DerivedTypeDecl 44 ((*State*) 18) Integer (Range 0 3))) :: (((*X_Coord*) 4), (SubtypeDecl 13 ((*X_Coord*) 4) Integer (Range 1 10))) :: (((*Turn_Action*) 33), (SubtypeDecl 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (Range 3 4))) :: (((*Three_Delta*) 22), (SubtypeDecl 56 ((*Three_Delta*) 22) Integer (Range 0 2))) :: (((*Three_Shape*) 3), (SubtypeDecl 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (Range 3 8))) :: (((*PX_Coord*) 9), (SubtypeDecl 28 ((*PX_Coord*) 9) Integer (Range (-1) 9))) :: nil)
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

Definition Coq_AST_TreeRT := 

(mkprogramRT
(* = = = declarations = = = *)
(SeqDeclRT 1
(SeqDeclRT 2
(TypeDeclRT 3 (DerivedTypeDeclRT 4 ((*Cell*) 1) Integer (RangeRT 0 8))) 
(SeqDeclRT 5
(TypeDeclRT 6 (SubtypeDeclRT 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (RangeRT 1 8))) 
(SeqDeclRT 8
(TypeDeclRT 9 (SubtypeDeclRT 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (RangeRT 3 8))) 
(SeqDeclRT 11
(TypeDeclRT 12 (SubtypeDeclRT 13 ((*X_Coord*) 4) Integer (RangeRT 1 10))) 
(SeqDeclRT 14
(TypeDeclRT 15 (SubtypeDeclRT 16 ((*Y_Coord*) 5) Integer (RangeRT 1 50))) 
(SeqDeclRT 17
(TypeDeclRT 18 (ArrayTypeDeclRT 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) 
(SeqDeclRT 20
(TypeDeclRT 21 (ArrayTypeDeclRT 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) 
(SeqDeclRT 23
(ObjDeclRT 24 (mkobjDeclRT 25 ((*Cur_Board*) 8) (Array_Type ((*Board*) 7)) None)) 
(SeqDeclRT 26
(TypeDeclRT 27 (SubtypeDeclRT 28 ((*PX_Coord*) 9) Integer (RangeRT (-1) 9))) 
(SeqDeclRT 29
(TypeDeclRT 30 (SubtypeDeclRT 31 ((*PY_Coord*) 10) Integer (RangeRT (-1) 49))) 
(SeqDeclRT 32
(TypeDeclRT 33 (DerivedTypeDeclRT 34 ((*Direction*) 11) Integer (RangeRT 0 3))) 
(SeqDeclRT 35
(TypeDeclRT 36 (RecordTypeDeclRT 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) 
(SeqDeclRT 39
(ObjDeclRT 40 (mkobjDeclRT 41 ((*Cur_Piece*) 17) (Record_Type ((*Piece*) 12)) None)) 
(SeqDeclRT 42
(TypeDeclRT 43 (DerivedTypeDeclRT 44 ((*State*) 18) Integer (RangeRT 0 3))) 
(SeqDeclRT 45
(ObjDeclRT 46 (mkobjDeclRT 47 ((*Cur_State*) 19) (Derived_Type ((*State*) 18)) None)) 
(SeqDeclRT 48
(TypeDeclRT 49 (SubtypeDeclRT 50 ((*I_Delta*) 20) Integer (RangeRT 0 3))) 
(SeqDeclRT 51
(TypeDeclRT 52 (ArrayTypeDeclRT 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) 
(SeqDeclRT 54
(TypeDeclRT 55 (SubtypeDeclRT 56 ((*Three_Delta*) 22) Integer (RangeRT 0 2))) 
(SeqDeclRT 57
(TypeDeclRT 58 (ArrayTypeDeclRT 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) 
(SeqDeclRT 60
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 61
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 62
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 63
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 64
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 65
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 66
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 67
(TypeDeclRT 68 (DerivedTypeDeclRT 69 ((*Action*) 31) Integer (RangeRT 0 4))) 
(SeqDeclRT 70
(TypeDeclRT 71 (SubtypeDeclRT 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (RangeRT 0 1))) 
(SeqDeclRT 73
(TypeDeclRT 74 (SubtypeDeclRT 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (RangeRT 3 4))) 
(SeqDeclRT 76
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 77
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 78
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 79
NullDeclRT (* Undefined Declarations ! *) 
(SeqDeclRT 80
NullDeclRT (* Undefined Declarations ! *) 
NullDeclRT (* Undefined Declarations ! *))))))))))))))))))))))))))))))))))) 
(SeqDeclRT 81
(ProcBodyDeclRT 82 
  (mkprocBodyDeclRT 83
    (* = = = Procedure Name = = = *)
    ((*Is_Empty*) 26)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
    (mkparamSpecRT 85 ((*Y*) 42) Integer In) :: 
    (mkparamSpecRT 86 ((*X*) 43) Integer In) :: 
    (mkparamSpecRT 87 ((*R*) 44) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 88 (IdentifierRT 89 ((*R*) 44) (nil)) (LiteralRT 90 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 91
(ProcBodyDeclRT 92 
  (mkprocBodyDeclRT 93
    (* = = = Procedure Name = = = *)
    ((*Is_Complete_Line*) 27)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
    (mkparamSpecRT 95 ((*R*) 47) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 96 (IdentifierRT 97 ((*R*) 47) (nil)) (LiteralRT 98 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 99
(ProcBodyDeclRT 100 
  (mkprocBodyDeclRT 101
    (* = = = Procedure Name = = = *)
    ((*Is_Empty_Line*) 28)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
    (mkparamSpecRT 103 ((*R*) 49) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 104 (IdentifierRT 105 ((*R*) 49) (nil)) (LiteralRT 106 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 107
(ProcBodyDeclRT 108 
  (mkprocBodyDeclRT 109
    (* = = = Procedure Name = = = *)
    ((*No_Complete_Lines*) 29)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
    (mkparamSpecRT 111 ((*R*) 51) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 112 (IdentifierRT 113 ((*R*) 51) (nil)) (LiteralRT 114 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 115
(ProcBodyDeclRT 116 
  (mkprocBodyDeclRT 117
    (* = = = Procedure Name = = = *)
    ((*Possible_I_Shapes*) 24)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparamSpecRT 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpecRT 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpecRT 121 ((*R*) 55) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 122 (IdentifierRT 123 ((*R*) 55) (nil)) (LiteralRT 124 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 125
(ProcBodyDeclRT 126 
  (mkprocBodyDeclRT 127
    (* = = = Procedure Name = = = *)
    ((*Possible_Three_Shapes*) 25)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
    (mkparamSpecRT 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparamSpecRT 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpecRT 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
    (mkparamSpecRT 132 ((*R*) 60) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 133 (IdentifierRT 134 ((*R*) 60) (nil)) (LiteralRT 135 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 136
(ProcBodyDeclRT 137 
  (mkprocBodyDeclRT 138
    (* = = = Procedure Name = = = *)
    ((*Include_Piece_In_Board*) 38)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 139
  (ObjDeclRT 141 (mkobjDeclRT 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((LiteralRT 140 (Integer_Literal 0) (nil) nil))))) 
  (SeqDeclRT 143
  (ObjDeclRT 145 (mkobjDeclRT 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((LiteralRT 144 (Integer_Literal 0) (nil) nil))))) 
  (ObjDeclRT 147 (mkobjDeclRT 148 ((*R*) 64) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (SeqRT 149
      (IfRT 150 (BinOpRT 151 Equal (NameRT 152 (SelectedComponentRT 153 (IdentifierRT 154 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (LiteralRT 156 (Integer_Literal 2) (nil) nil) (nil) nil)
        (SeqRT 157
        (AssignRT 158 (IndexedComponentRT 159 (IndexedComponentRT 160 (IdentifierRT 161 ((*Cur_Board*) 8) (nil)) (NameRT 162 (SelectedComponentRT 163 (IdentifierRT 164 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (RangeCheck :: nil))) (nil)) (NameRT 166 (SelectedComponentRT 167 (IdentifierRT 168 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (RangeCheck :: nil))) (nil)) (NameRT 170 (SelectedComponentRT 171 (IdentifierRT 172 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
        (SeqRT 174
        (AssignRT 175 (IndexedComponentRT 176 (IndexedComponentRT 177 (IdentifierRT 178 ((*Cur_Board*) 8) (nil)) (BinOpRT 179 Plus (NameRT 180 (SelectedComponentRT 181 (IdentifierRT 182 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (LiteralRT 184 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (NameRT 185 (SelectedComponentRT 186 (IdentifierRT 187 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (RangeCheck :: nil))) (nil)) (NameRT 189 (SelectedComponentRT 190 (IdentifierRT 191 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
        (SeqRT 193
        (AssignRT 194 (IndexedComponentRT 195 (IndexedComponentRT 196 (IdentifierRT 197 ((*Cur_Board*) 8) (nil)) (NameRT 198 (SelectedComponentRT 199 (IdentifierRT 200 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (RangeCheck :: nil))) (nil)) (BinOpRT 202 Plus (NameRT 203 (SelectedComponentRT 204 (IdentifierRT 205 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (LiteralRT 207 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (NameRT 208 (SelectedComponentRT 209 (IdentifierRT 210 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
        (AssignRT 212 (IndexedComponentRT 213 (IndexedComponentRT 214 (IdentifierRT 215 ((*Cur_Board*) 8) (nil)) (BinOpRT 216 Plus (NameRT 217 (SelectedComponentRT 218 (IdentifierRT 219 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (LiteralRT 221 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (BinOpRT 222 Plus (NameRT 223 (SelectedComponentRT 224 (IdentifierRT 225 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (LiteralRT 227 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (NameRT 228 (SelectedComponentRT 229 (IdentifierRT 230 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))))))
        (IfRT 232 (BinOpRT 233 Equal (NameRT 234 (SelectedComponentRT 235 (IdentifierRT 236 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (LiteralRT 238 (Integer_Literal 1) (nil) nil) (nil) nil)
          (WhileRT 239 (BinOpRT 240 Less_Than_Or_Equal (NameRT 241 (IdentifierRT 242 ((*Y*) 62) (nil))) (LiteralRT 243 (Integer_Literal 3) (nil) nil) (nil) nil)
            (SeqRT 244
            (WhileRT 245 (BinOpRT 246 Less_Than_Or_Equal (NameRT 247 (IdentifierRT 248 ((*X*) 63) (nil))) (LiteralRT 249 (Integer_Literal 3) (nil) nil) (nil) nil)
              (SeqRT 250
              (CallRT 251 252 ((*Possible_I_Shapes*) 24) 
                ((NameRT 253 (SelectedComponentRT 254 (IdentifierRT 255 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (NameRT 257 (IdentifierRT 258 ((*Y*) 62) (nil))) :: (NameRT 259 (IdentifierRT 260 ((*X*) 63) (nil))) :: (NameRT 261 (IdentifierRT 262 ((*R*) 64) (nil))) :: nil)
              ) 
              (SeqRT 263
              (IfRT 264 (NameRT 265 (IdentifierRT 266 ((*R*) 64) (nil)))
                (AssignRT 267 (IndexedComponentRT 268 (IndexedComponentRT 269 (IdentifierRT 270 ((*Cur_Board*) 8) (nil)) (BinOpRT 271 Plus (NameRT 272 (SelectedComponentRT 273 (IdentifierRT 274 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (NameRT 276 (IdentifierRT 277 ((*Y*) 62) (nil))) (RangeCheck :: nil) nil) (nil)) (BinOpRT 278 Plus (NameRT 279 (SelectedComponentRT 280 (IdentifierRT 281 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (NameRT 283 (IdentifierRT 284 ((*X*) 63) (nil))) (RangeCheck :: nil) nil) (nil)) (NameRT 285 (SelectedComponentRT 286 (IdentifierRT 287 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
                NullRT
              ) 
              (AssignRT 289 (IdentifierRT 290 ((*X*) 63) (nil)) (BinOpRT 291 Plus (NameRT 292 (IdentifierRT 293 ((*X*) 63) (nil))) (LiteralRT 294 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
            ) 
            (AssignRT 295 (IdentifierRT 296 ((*Y*) 62) (nil)) (BinOpRT 297 Plus (NameRT 298 (IdentifierRT 299 ((*Y*) 62) (nil))) (LiteralRT 300 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)))
          )
          (WhileRT 301 (BinOpRT 302 Less_Than_Or_Equal (NameRT 303 (IdentifierRT 304 ((*Y*) 62) (nil))) (LiteralRT 305 (Integer_Literal 2) (nil) nil) (nil) nil)
            (SeqRT 306
            (WhileRT 307 (BinOpRT 308 Less_Than_Or_Equal (NameRT 309 (IdentifierRT 310 ((*X*) 63) (nil))) (LiteralRT 311 (Integer_Literal 2) (nil) nil) (nil) nil)
              (SeqRT 312
              (CallRT 313 314 ((*Possible_Three_Shapes*) 25) 
                ((NameRT 315 (SelectedComponentRT 316 (IdentifierRT 317 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) :: (NameRT 319 (SelectedComponentRT 320 (IdentifierRT 321 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (NameRT 323 (IdentifierRT 324 ((*Y*) 62) (nil))) :: (NameRT 325 (IdentifierRT 326 ((*X*) 63) (nil))) :: (NameRT 327 (IdentifierRT 328 ((*R*) 64) (nil))) :: nil)
              ) 
              (SeqRT 329
              (IfRT 330 (NameRT 331 (IdentifierRT 332 ((*R*) 64) (nil)))
                (AssignRT 333 (IndexedComponentRT 334 (IndexedComponentRT 335 (IdentifierRT 336 ((*Cur_Board*) 8) (nil)) (BinOpRT 337 Plus (NameRT 338 (SelectedComponentRT 339 (IdentifierRT 340 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (NameRT 342 (IdentifierRT 343 ((*Y*) 62) (nil))) (RangeCheck :: nil) nil) (nil)) (BinOpRT 344 Plus (NameRT 345 (SelectedComponentRT 346 (IdentifierRT 347 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (NameRT 349 (IdentifierRT 350 ((*X*) 63) (nil))) (RangeCheck :: nil) nil) (nil)) (NameRT 351 (SelectedComponentRT 352 (IdentifierRT 353 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
                NullRT
              ) 
              (AssignRT 355 (IdentifierRT 356 ((*X*) 63) (nil)) (BinOpRT 357 Plus (NameRT 358 (IdentifierRT 359 ((*X*) 63) (nil))) (LiteralRT 360 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
            ) 
            (AssignRT 361 (IdentifierRT 362 ((*Y*) 62) (nil)) (BinOpRT 363 Plus (NameRT 364 (IdentifierRT 365 ((*Y*) 62) (nil))) (LiteralRT 366 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)))
          )
        )
      ) 
      (AssignRT 367 (IdentifierRT 368 ((*Cur_State*) 19) (nil)) (LiteralRT 369 (Integer_Literal 2) (nil) nil)))
  )
) 
(SeqDeclRT 370
(ProcBodyDeclRT 371 
  (mkprocBodyDeclRT 372
    (* = = = Procedure Name = = = *)
    ((*Delete_Complete_Lines*) 39)
    (* = = = Formal Parameters = = = *)
    (nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 373
  (ObjDeclRT 374 (mkobjDeclRT 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
  (SeqDeclRT 376
  (ObjDeclRT 378 (mkobjDeclRT 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((LiteralRT 377 (Integer_Literal 10) (nil) nil))))) 
  (SeqDeclRT 380
  (ObjDeclRT 382 (mkobjDeclRT 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((LiteralRT 381 (Boolean_Literal false) (nil) nil))))) 
  (SeqDeclRT 384
  (ObjDeclRT 386 (mkobjDeclRT 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((LiteralRT 385 (Integer_Literal 1) (nil) nil))))) 
  (SeqDeclRT 388
  (ObjDeclRT 389 (mkobjDeclRT 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
  (ObjDeclRT 391 (mkobjDeclRT 392 ((*R*) 71) Boolean None))))))))
    (* = = = Procedure Body = = = *)
      (SeqRT 393
      (WhileRT 394 (BinOpRT 395 Less_Than_Or_Equal (NameRT 396 (IdentifierRT 397 ((*Del_Line*) 69) (nil))) (LiteralRT 398 (Integer_Literal 50) (nil) nil) (nil) nil)
        (SeqRT 399
        (CallRT 400 401 ((*Is_Complete_Line*) 27) 
          ((NameRT 402 (IndexedComponentRT 403 (IdentifierRT 404 ((*Cur_Board*) 8) (nil)) (NameRT 405 (IdentifierRT 406 ((*Del_Line*) 69) (nil))) (nil))) :: (NameRT 407 (IdentifierRT 408 ((*R*) 71) (nil))) :: nil)
        ) 
        (SeqRT 409
        (IfRT 410 (NameRT 411 (IdentifierRT 412 ((*R*) 71) (nil)))
          (SeqRT 413
          (AssignRT 414 (IndexedComponentRT 415 (IdentifierRT 416 ((*Cur_Board*) 8) (nil)) (NameRT 417 (IdentifierRT 418 ((*Del_Line*) 69) (nil))) (nil)) (NameRT 419 (IdentifierRT 420 ((*Empty_Line*) 66) (nil)))) 
          (SeqRT 421
          (AssignRT 422 (IdentifierRT 423 ((*Has_Complete_Lines*) 68) (nil)) (LiteralRT 424 (Boolean_Literal true) (nil) nil)) 
          (AssignRT 425 (IdentifierRT 426 ((*To_Line*) 67) (nil)) (NameRT 427 (IdentifierRT 428 ((*Del_Line*) 69) (nil))))))
          NullRT
        ) 
        (AssignRT 429 (IdentifierRT 430 ((*Del_Line*) 69) (nil)) (BinOpRT 431 Plus (NameRT 432 (IdentifierRT 433 ((*Del_Line*) 69) (nil))) (LiteralRT 434 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
      ) 
      (SeqRT 435
      (IfRT 436 (NameRT 437 (IdentifierRT 438 ((*Has_Complete_Lines*) 68) (nil)))
        (SeqRT 439
        (AssignRT 440 (IdentifierRT 441 ((*From_Line*) 70) (nil)) (LiteralRT 442 (Integer_Literal 9) (nil) nil)) 
        (WhileRT 443 (BinOpRT 444 Greater_Than_Or_Equal (NameRT 445 (IdentifierRT 446 ((*From_Line*) 70) (nil))) (LiteralRT 447 (Integer_Literal 1) (nil) nil) (nil) nil)
          (SeqRT 448
          (CallRT 449 450 ((*Is_Empty_Line*) 28) 
            ((NameRT 451 (IndexedComponentRT 452 (IdentifierRT 453 ((*Cur_Board*) 8) (nil)) (NameRT 454 (IdentifierRT 455 ((*From_Line*) 70) (nil))) (nil))) :: (NameRT 456 (IdentifierRT 457 ((*R*) 71) (nil))) :: nil)
          ) 
          (SeqRT 458
          (IfRT 459 (UnOpRT 460 Not (NameRT 461 (IdentifierRT 462 ((*R*) 71) (nil))) (nil) nil)
            (SeqRT 463
            (AssignRT 464 (IndexedComponentRT 465 (IdentifierRT 466 ((*Cur_Board*) 8) (nil)) (NameRT 467 (IdentifierRT 468 ((*To_Line*) 67) (nil))) (nil)) (NameRT 469 (IndexedComponentRT 470 (IdentifierRT 471 ((*Cur_Board*) 8) (nil)) (NameRT 472 (IdentifierRT 473 ((*From_Line*) 70) (nil))) (nil)))) 
            (SeqRT 474
            (AssignRT 475 (IndexedComponentRT 476 (IdentifierRT 477 ((*Cur_Board*) 8) (nil)) (NameRT 478 (IdentifierRT 479 ((*From_Line*) 70) (nil))) (nil)) (NameRT 480 (IdentifierRT 481 ((*Empty_Line*) 66) (nil)))) 
            (AssignRT 482 (IdentifierRT 483 ((*To_Line*) 67) (nil)) (BinOpRT 484 Minus (NameRT 485 (IdentifierRT 486 ((*To_Line*) 67) (nil))) (LiteralRT 487 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
            NullRT
          ) 
          (AssignRT 488 (IdentifierRT 489 ((*From_Line*) 70) (nil)) (BinOpRT 490 Minus (NameRT 491 (IdentifierRT 492 ((*From_Line*) 70) (nil))) (LiteralRT 493 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
        ))
        NullRT
      ) 
      (AssignRT 494 (IdentifierRT 495 ((*Cur_State*) 19) (nil)) (LiteralRT 496 (Integer_Literal 3) (nil) nil))))
  )
) 
(SeqDeclRT 497
(ProcBodyDeclRT 498 
  (mkprocBodyDeclRT 499
    (* = = = Procedure Name = = = *)
    ((*No_Overlap*) 30)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
    (mkparamSpecRT 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparamSpecRT 502 ((*R*) 74) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (AssignRT 503 (IdentifierRT 504 ((*R*) 74) (nil)) (LiteralRT 505 (Boolean_Literal true) (nil) nil))
  )
) 
(SeqDeclRT 506
(ProcBodyDeclRT 507 
  (mkprocBodyDeclRT 508
    (* = = = Procedure Name = = = *)
    ((*Turn_Direction*) 34)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
    (mkparamSpecRT 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
    (mkparamSpecRT 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (IfRT 512 (BinOpRT 513 Equal (NameRT 514 (IdentifierRT 515 ((*T*) 76) (nil))) (LiteralRT 516 (Integer_Literal 3) (nil) nil) (nil) nil)
        (IfRT 517 (BinOpRT 518 Equal (NameRT 519 (IdentifierRT 520 ((*D*) 75) (nil))) (LiteralRT 521 (Integer_Literal 0) (nil) nil) (nil) nil)
          (AssignRT 522 (IdentifierRT 523 ((*R*) 77) (nil)) (LiteralRT 524 (Integer_Literal 3) (nil) nil))
          (AssignRT 525 (IdentifierRT 526 ((*R*) 77) (nil)) (BinOpRT 527 Minus (NameRT 528 (IdentifierRT 529 ((*D*) 75) (nil))) (LiteralRT 530 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
        )
        (IfRT 531 (BinOpRT 532 Equal (NameRT 533 (IdentifierRT 534 ((*D*) 75) (nil))) (LiteralRT 535 (Integer_Literal 3) (nil) nil) (nil) nil)
          (AssignRT 536 (IdentifierRT 537 ((*R*) 77) (nil)) (LiteralRT 538 (Integer_Literal 0) (nil) nil))
          (AssignRT 539 (IdentifierRT 540 ((*R*) 77) (nil)) (BinOpRT 541 Plus (NameRT 542 (IdentifierRT 543 ((*D*) 75) (nil))) (LiteralRT 544 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
        )
      )
  )
) 
(SeqDeclRT 545
(ProcBodyDeclRT 546 
  (mkprocBodyDeclRT 547
    (* = = = Procedure Name = = = *)
    ((*Move_Is_Possible*) 35)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparamSpecRT 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparamSpecRT 550 ((*R*) 80) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (IfRT 551 (BinOpRT 552 Equal (NameRT 553 (IdentifierRT 554 ((*A*) 79) (nil))) (LiteralRT 555 (Integer_Literal 0) (nil) nil) (nil) nil)
        (AssignRT 556 (IdentifierRT 557 ((*R*) 80) (nil)) (BinOpRT 558 And (BinOpRT 559 Greater_Than_Or_Equal (BinOpRT 560 Minus (NameRT 561 (SelectedComponentRT 562 (IdentifierRT 563 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 565 (Integer_Literal 1) (nil) nil) (nil) nil) (UnOpRT 566 Unary_Minus (LiteralRT 567 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (BinOpRT 568 Less_Than_Or_Equal (BinOpRT 569 Minus (NameRT 570 (SelectedComponentRT 571 (IdentifierRT 572 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 574 (Integer_Literal 1) (nil) nil) (nil) nil) (LiteralRT 575 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
        (IfRT 576 (BinOpRT 577 Equal (NameRT 578 (IdentifierRT 579 ((*A*) 79) (nil))) (LiteralRT 580 (Integer_Literal 1) (nil) nil) (nil) nil)
          (AssignRT 581 (IdentifierRT 582 ((*R*) 80) (nil)) (BinOpRT 583 And (BinOpRT 584 Greater_Than_Or_Equal (BinOpRT 585 Plus (NameRT 586 (SelectedComponentRT 587 (IdentifierRT 588 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 590 (Integer_Literal 1) (nil) nil) (nil) nil) (UnOpRT 591 Unary_Minus (LiteralRT 592 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (BinOpRT 593 Less_Than_Or_Equal (BinOpRT 594 Plus (NameRT 595 (SelectedComponentRT 596 (IdentifierRT 597 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 599 (Integer_Literal 1) (nil) nil) (nil) nil) (LiteralRT 600 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
          (IfRT 601 (BinOpRT 602 Equal (NameRT 603 (IdentifierRT 604 ((*A*) 79) (nil))) (LiteralRT 605 (Integer_Literal 2) (nil) nil) (nil) nil)
            (AssignRT 606 (IdentifierRT 607 ((*R*) 80) (nil)) (BinOpRT 608 And (BinOpRT 609 Greater_Than_Or_Equal (BinOpRT 610 Plus (NameRT 611 (SelectedComponentRT 612 (IdentifierRT 613 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (LiteralRT 615 (Integer_Literal 1) (nil) nil) (nil) nil) (UnOpRT 616 Unary_Minus (LiteralRT 617 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (BinOpRT 618 Less_Than_Or_Equal (BinOpRT 619 Plus (NameRT 620 (SelectedComponentRT 621 (IdentifierRT 622 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (LiteralRT 624 (Integer_Literal 1) (nil) nil) (nil) nil) (LiteralRT 625 (Integer_Literal 49) (nil) nil) (nil) nil) (nil) nil))
            (AssignRT 626 (IdentifierRT 627 ((*R*) 80) (nil)) (LiteralRT 628 (Boolean_Literal true) (nil) nil))
          )
        )
      )
  )
) 
(SeqDeclRT 629
(ProcBodyDeclRT 630 
  (mkprocBodyDeclRT 631
    (* = = = Procedure Name = = = *)
    ((*Move*) 36)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
    (mkparamSpecRT 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparamSpecRT 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
    (* = = = Object Declarations = = = *)
    (NullDeclRT)
    (* = = = Procedure Body = = = *)
      (IfRT 635 (BinOpRT 636 Equal (NameRT 637 (IdentifierRT 638 ((*A*) 82) (nil))) (LiteralRT 639 (Integer_Literal 0) (nil) nil) (nil) nil)
        (AssignRT 640 (SelectedComponentRT 641 (IdentifierRT 642 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (BinOpRT 644 Minus (NameRT 645 (SelectedComponentRT 646 (IdentifierRT 647 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (LiteralRT 649 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
        (IfRT 650 (BinOpRT 651 Equal (NameRT 652 (IdentifierRT 653 ((*A*) 82) (nil))) (LiteralRT 654 (Integer_Literal 1) (nil) nil) (nil) nil)
          (AssignRT 655 (SelectedComponentRT 656 (IdentifierRT 657 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (BinOpRT 659 Plus (NameRT 660 (SelectedComponentRT 661 (IdentifierRT 662 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (LiteralRT 664 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
          (IfRT 665 (BinOpRT 666 Equal (NameRT 667 (IdentifierRT 668 ((*A*) 82) (nil))) (LiteralRT 669 (Integer_Literal 2) (nil) nil) (nil) nil)
            (AssignRT 670 (SelectedComponentRT 671 (IdentifierRT 672 ((*R*) 83) (nil)) ((*Y*) 16) (nil)) (BinOpRT 674 Plus (NameRT 675 (SelectedComponentRT 676 (IdentifierRT 677 ((*P*) 81) (nil)) ((*Y*) 16) (nil))) (LiteralRT 679 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
            (CallRT 680 681 ((*Turn_Direction*) 34) 
              ((NameRT 682 (SelectedComponentRT 683 (IdentifierRT 684 ((*P*) 81) (nil)) ((*D*) 14) (nil))) :: (NameRT 686 (IdentifierRT 687 ((*A*) 82) (RangeCheck :: nil))) :: (NameRT 688 (SelectedComponentRT 689 (IdentifierRT 690 ((*R*) 83) (nil)) ((*D*) 14) (nil))) :: nil)
            )
          )
        )
      )
  )
) 
(ProcBodyDeclRT 692 
  (mkprocBodyDeclRT 693
    (* = = = Procedure Name = = = *)
    ((*Do_Action*) 37)
    (* = = = Formal Parameters = = = *)
    (
    (mkparamSpecRT 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
    (mkparamSpecRT 695 ((*Success*) 85) Boolean Out) :: nil)
    (* = = = Object Declarations = = = *)
    ((SeqDeclRT 696
  (ObjDeclRT 697 (mkobjDeclRT 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
  (SeqDeclRT 699
  (ObjDeclRT 700 (mkobjDeclRT 701 ((*Is_Move_OK*) 87) Boolean None)) 
  (ObjDeclRT 702 (mkobjDeclRT 703 ((*Is_No_Overlap*) 88) Boolean None)))))
    (* = = = Procedure Body = = = *)
      (SeqRT 704
      (CallRT 705 706 ((*Move_Is_Possible*) 35) 
        ((NameRT 707 (IdentifierRT 708 ((*Cur_Piece*) 17) (nil))) :: (NameRT 709 (IdentifierRT 710 ((*A*) 84) (nil))) :: (NameRT 711 (IdentifierRT 712 ((*Is_Move_OK*) 87) (nil))) :: nil)
      ) 
      (SeqRT 713
      (IfRT 714 (NameRT 715 (IdentifierRT 716 ((*Is_Move_OK*) 87) (nil)))
        (SeqRT 717
        (CallRT 718 719 ((*Move*) 36) 
          ((NameRT 720 (IdentifierRT 721 ((*Cur_Piece*) 17) (nil))) :: (NameRT 722 (IdentifierRT 723 ((*A*) 84) (nil))) :: (NameRT 724 (IdentifierRT 725 ((*Candidate*) 86) (nil))) :: nil)
        ) 
        (SeqRT 726
        (CallRT 727 728 ((*No_Overlap*) 30) 
          ((NameRT 729 (IdentifierRT 730 ((*Cur_Board*) 8) (nil))) :: (NameRT 731 (IdentifierRT 732 ((*Candidate*) 86) (nil))) :: (NameRT 733 (IdentifierRT 734 ((*Is_No_Overlap*) 88) (nil))) :: nil)
        ) 
        (IfRT 735 (NameRT 736 (IdentifierRT 737 ((*Is_No_Overlap*) 88) (nil)))
          (SeqRT 738
          (AssignRT 739 (IdentifierRT 740 ((*Cur_Piece*) 17) (nil)) (NameRT 741 (IdentifierRT 742 ((*Candidate*) 86) (nil)))) 
          (SeqRT 743
          (AssignRT 744 (IdentifierRT 745 ((*Success*) 85) (nil)) (LiteralRT 746 (Boolean_Literal true) (nil) nil)) 
          NullRT (* Ignore Return Statement ! *)))
          NullRT
        )))
        NullRT
      ) 
      (AssignRT 747 (IdentifierRT 748 ((*Success*) 85) (nil)) (LiteralRT 749 (Boolean_Literal false) (nil) nil))))
  )
))))))))))))))
(* = = = main procedure = = = *)
1
).

Definition Symbol_TableRT := 
(Symbol_Table_Module_RT.mkSymbolTable
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  ((((*R*) 49), (Out, Boolean)) :: (((*X*) 53), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Cur_Board*) 8), (In_Out, (Array_Type ((*Board*) 7)))) :: (((*To_Line*) 67), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 55), (Out, Boolean)) :: (((*P*) 81), (In, (Record_Type ((*Piece*) 12)))) :: (((*A*) 82), (In, (Derived_Type ((*Action*) 31)))) :: (((*From_Line*) 70), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 64), (In_Out, Boolean)) :: (((*Is_No_Overlap*) 88), (In_Out, Boolean)) :: (((*L*) 48), (In, (Array_Type ((*Line*) 6)))) :: (((*Candidate*) 86), (In_Out, (Record_Type ((*Piece*) 12)))) :: (((*X*) 58), (In, (Subtype ((*I_Delta*) 20)))) :: (((*Success*) 85), (Out, Boolean)) :: (((*B*) 72), (In, (Array_Type ((*Board*) 7)))) :: (((*Y*) 54), (In, (Subtype ((*I_Delta*) 20)))) :: (((*X*) 43), (In, Integer)) :: (((*Is_Move_OK*) 87), (In_Out, Boolean)) :: (((*T*) 76), (In, (Subtype ((*Turn_Action*) 33)))) :: (((*Has_Complete_Lines*) 68), (In_Out, Boolean)) :: (((*Cur_State*) 19), (In_Out, (Derived_Type ((*State*) 18)))) :: (((*R*) 51), (Out, Boolean)) :: (((*Y*) 42), (In, Integer)) :: (((*A*) 84), (In, (Derived_Type ((*Action*) 31)))) :: (((*Cur_Piece_D*) 52), (In, (Derived_Type ((*Direction*) 11)))) :: (((*B*) 41), (In, (Array_Type ((*Board*) 7)))) :: (((*Cur_Piece_S*) 56), (In, (Subtype ((*Shape*) 2)))) :: (((*Y*) 59), (In, (Subtype ((*I_Delta*) 20)))) :: (((*D*) 75), (In, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 47), (Out, Boolean)) :: (((*Del_Line*) 69), (In_Out, (Subtype ((*Y_Coord*) 5)))) :: (((*R*) 60), (Out, Boolean)) :: (((*X*) 63), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*P*) 73), (In, (Record_Type ((*Piece*) 12)))) :: (((*B*) 50), (In, (Array_Type ((*Board*) 7)))) :: (((*R*) 77), (Out, (Derived_Type ((*Direction*) 11)))) :: (((*R*) 44), (Out, Boolean)) :: (((*R*) 83), (Out, (Record_Type ((*Piece*) 12)))) :: (((*Cur_Piece_D*) 57), (In, (Derived_Type ((*Direction*) 11)))) :: (((*Y*) 62), (In_Out, (Subtype ((*I_Delta*) 20)))) :: (((*R*) 74), (Out, Boolean)) :: (((*L*) 46), (In, (Array_Type ((*Line*) 6)))) :: (((*R*) 80), (Out, Boolean)) :: (((*Empty_Line*) 66), (In_Out, (Array_Type ((*Line*) 6)))) :: (((*A*) 79), (In, (Derived_Type ((*Action*) 31)))) :: (((*P*) 78), (In, (Record_Type ((*Piece*) 12)))) :: (((*R*) 71), (In_Out, Boolean)) :: (((*Cur_Piece*) 17), (In_Out, (Record_Type ((*Piece*) 12)))) :: nil)
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  ((((*Possible_Three_Shapes*) 25), (0, (mkprocBodyDeclRT 127
  (* = = = Procedure Name = = = *)
  ((*Possible_Three_Shapes*) 25)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 128 ((*Cur_Piece_S*) 56) (Subtype ((*Shape*) 2)) In) :: 
  (mkparamSpecRT 129 ((*Cur_Piece_D*) 57) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparamSpecRT 130 ((*X*) 58) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpecRT 131 ((*Y*) 59) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpecRT 132 ((*R*) 60) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 133 (IdentifierRT 134 ((*R*) 60) (nil)) (LiteralRT 135 (Boolean_Literal true) (nil) nil))
))) :: (((*Do_Action*) 37), (0, (mkprocBodyDeclRT 693
  (* = = = Procedure Name = = = *)
  ((*Do_Action*) 37)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 694 ((*A*) 84) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparamSpecRT 695 ((*Success*) 85) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 696
(ObjDeclRT 697 (mkobjDeclRT 698 ((*Candidate*) 86) (Record_Type ((*Piece*) 12)) None)) 
(SeqDeclRT 699
(ObjDeclRT 700 (mkobjDeclRT 701 ((*Is_Move_OK*) 87) Boolean None)) 
(ObjDeclRT 702 (mkobjDeclRT 703 ((*Is_No_Overlap*) 88) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (SeqRT 704
    (CallRT 705 706 ((*Move_Is_Possible*) 35) 
      ((NameRT 707 (IdentifierRT 708 ((*Cur_Piece*) 17) (nil))) :: (NameRT 709 (IdentifierRT 710 ((*A*) 84) (nil))) :: (NameRT 711 (IdentifierRT 712 ((*Is_Move_OK*) 87) (nil))) :: nil)
    ) 
    (SeqRT 713
    (IfRT 714 (NameRT 715 (IdentifierRT 716 ((*Is_Move_OK*) 87) (nil)))
      (SeqRT 717
      (CallRT 718 719 ((*Move*) 36) 
        ((NameRT 720 (IdentifierRT 721 ((*Cur_Piece*) 17) (nil))) :: (NameRT 722 (IdentifierRT 723 ((*A*) 84) (nil))) :: (NameRT 724 (IdentifierRT 725 ((*Candidate*) 86) (nil))) :: nil)
      ) 
      (SeqRT 726
      (CallRT 727 728 ((*No_Overlap*) 30) 
        ((NameRT 729 (IdentifierRT 730 ((*Cur_Board*) 8) (nil))) :: (NameRT 731 (IdentifierRT 732 ((*Candidate*) 86) (nil))) :: (NameRT 733 (IdentifierRT 734 ((*Is_No_Overlap*) 88) (nil))) :: nil)
      ) 
      (IfRT 735 (NameRT 736 (IdentifierRT 737 ((*Is_No_Overlap*) 88) (nil)))
        (SeqRT 738
        (AssignRT 739 (IdentifierRT 740 ((*Cur_Piece*) 17) (nil)) (NameRT 741 (IdentifierRT 742 ((*Candidate*) 86) (nil)))) 
        (SeqRT 743
        (AssignRT 744 (IdentifierRT 745 ((*Success*) 85) (nil)) (LiteralRT 746 (Boolean_Literal true) (nil) nil)) 
        NullRT (* Ignore Return Statement ! *)))
        NullRT
      )))
      NullRT
    ) 
    (AssignRT 747 (IdentifierRT 748 ((*Success*) 85) (nil)) (LiteralRT 749 (Boolean_Literal false) (nil) nil))))
))) :: (((*No_Complete_Lines*) 29), (0, (mkprocBodyDeclRT 109
  (* = = = Procedure Name = = = *)
  ((*No_Complete_Lines*) 29)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 110 ((*B*) 50) (Array_Type ((*Board*) 7)) In) :: 
  (mkparamSpecRT 111 ((*R*) 51) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 112 (IdentifierRT 113 ((*R*) 51) (nil)) (LiteralRT 114 (Boolean_Literal true) (nil) nil))
))) :: (((*Is_Complete_Line*) 27), (0, (mkprocBodyDeclRT 93
  (* = = = Procedure Name = = = *)
  ((*Is_Complete_Line*) 27)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 94 ((*L*) 46) (Array_Type ((*Line*) 6)) In) :: 
  (mkparamSpecRT 95 ((*R*) 47) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 96 (IdentifierRT 97 ((*R*) 47) (nil)) (LiteralRT 98 (Boolean_Literal true) (nil) nil))
))) :: (((*Is_Empty*) 26), (0, (mkprocBodyDeclRT 83
  (* = = = Procedure Name = = = *)
  ((*Is_Empty*) 26)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 84 ((*B*) 41) (Array_Type ((*Board*) 7)) In) :: 
  (mkparamSpecRT 85 ((*Y*) 42) Integer In) :: 
  (mkparamSpecRT 86 ((*X*) 43) Integer In) :: 
  (mkparamSpecRT 87 ((*R*) 44) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 88 (IdentifierRT 89 ((*R*) 44) (nil)) (LiteralRT 90 (Boolean_Literal true) (nil) nil))
))) :: (((*No_Overlap*) 30), (0, (mkprocBodyDeclRT 499
  (* = = = Procedure Name = = = *)
  ((*No_Overlap*) 30)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 500 ((*B*) 72) (Array_Type ((*Board*) 7)) In) :: 
  (mkparamSpecRT 501 ((*P*) 73) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparamSpecRT 502 ((*R*) 74) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 503 (IdentifierRT 504 ((*R*) 74) (nil)) (LiteralRT 505 (Boolean_Literal true) (nil) nil))
))) :: (((*Possible_I_Shapes*) 24), (0, (mkprocBodyDeclRT 117
  (* = = = Procedure Name = = = *)
  ((*Possible_I_Shapes*) 24)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 118 ((*Cur_Piece_D*) 52) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparamSpecRT 119 ((*X*) 53) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpecRT 120 ((*Y*) 54) (Subtype ((*I_Delta*) 20)) In) :: 
  (mkparamSpecRT 121 ((*R*) 55) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 122 (IdentifierRT 123 ((*R*) 55) (nil)) (LiteralRT 124 (Boolean_Literal true) (nil) nil))
))) :: (((*Include_Piece_In_Board*) 38), (0, (mkprocBodyDeclRT 138
  (* = = = Procedure Name = = = *)
  ((*Include_Piece_In_Board*) 38)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 139
(ObjDeclRT 141 (mkobjDeclRT 142 ((*Y*) 62) (Subtype ((*I_Delta*) 20)) (Some ((LiteralRT 140 (Integer_Literal 0) (nil) nil))))) 
(SeqDeclRT 143
(ObjDeclRT 145 (mkobjDeclRT 146 ((*X*) 63) (Subtype ((*I_Delta*) 20)) (Some ((LiteralRT 144 (Integer_Literal 0) (nil) nil))))) 
(ObjDeclRT 147 (mkobjDeclRT 148 ((*R*) 64) Boolean None)))))
  (* = = = Procedure Body = = = *)
    (SeqRT 149
    (IfRT 150 (BinOpRT 151 Equal (NameRT 152 (SelectedComponentRT 153 (IdentifierRT 154 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (LiteralRT 156 (Integer_Literal 2) (nil) nil) (nil) nil)
      (SeqRT 157
      (AssignRT 158 (IndexedComponentRT 159 (IndexedComponentRT 160 (IdentifierRT 161 ((*Cur_Board*) 8) (nil)) (NameRT 162 (SelectedComponentRT 163 (IdentifierRT 164 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (RangeCheck :: nil))) (nil)) (NameRT 166 (SelectedComponentRT 167 (IdentifierRT 168 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (RangeCheck :: nil))) (nil)) (NameRT 170 (SelectedComponentRT 171 (IdentifierRT 172 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
      (SeqRT 174
      (AssignRT 175 (IndexedComponentRT 176 (IndexedComponentRT 177 (IdentifierRT 178 ((*Cur_Board*) 8) (nil)) (BinOpRT 179 Plus (NameRT 180 (SelectedComponentRT 181 (IdentifierRT 182 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (LiteralRT 184 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (NameRT 185 (SelectedComponentRT 186 (IdentifierRT 187 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (RangeCheck :: nil))) (nil)) (NameRT 189 (SelectedComponentRT 190 (IdentifierRT 191 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
      (SeqRT 193
      (AssignRT 194 (IndexedComponentRT 195 (IndexedComponentRT 196 (IdentifierRT 197 ((*Cur_Board*) 8) (nil)) (NameRT 198 (SelectedComponentRT 199 (IdentifierRT 200 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (RangeCheck :: nil))) (nil)) (BinOpRT 202 Plus (NameRT 203 (SelectedComponentRT 204 (IdentifierRT 205 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (LiteralRT 207 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (NameRT 208 (SelectedComponentRT 209 (IdentifierRT 210 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))) 
      (AssignRT 212 (IndexedComponentRT 213 (IndexedComponentRT 214 (IdentifierRT 215 ((*Cur_Board*) 8) (nil)) (BinOpRT 216 Plus (NameRT 217 (SelectedComponentRT 218 (IdentifierRT 219 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (LiteralRT 221 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (BinOpRT 222 Plus (NameRT 223 (SelectedComponentRT 224 (IdentifierRT 225 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (LiteralRT 227 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil) (nil)) (NameRT 228 (SelectedComponentRT 229 (IdentifierRT 230 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil)))))))
      (IfRT 232 (BinOpRT 233 Equal (NameRT 234 (SelectedComponentRT 235 (IdentifierRT 236 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) (LiteralRT 238 (Integer_Literal 1) (nil) nil) (nil) nil)
        (WhileRT 239 (BinOpRT 240 Less_Than_Or_Equal (NameRT 241 (IdentifierRT 242 ((*Y*) 62) (nil))) (LiteralRT 243 (Integer_Literal 3) (nil) nil) (nil) nil)
          (SeqRT 244
          (WhileRT 245 (BinOpRT 246 Less_Than_Or_Equal (NameRT 247 (IdentifierRT 248 ((*X*) 63) (nil))) (LiteralRT 249 (Integer_Literal 3) (nil) nil) (nil) nil)
            (SeqRT 250
            (CallRT 251 252 ((*Possible_I_Shapes*) 24) 
              ((NameRT 253 (SelectedComponentRT 254 (IdentifierRT 255 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (NameRT 257 (IdentifierRT 258 ((*Y*) 62) (nil))) :: (NameRT 259 (IdentifierRT 260 ((*X*) 63) (nil))) :: (NameRT 261 (IdentifierRT 262 ((*R*) 64) (nil))) :: nil)
            ) 
            (SeqRT 263
            (IfRT 264 (NameRT 265 (IdentifierRT 266 ((*R*) 64) (nil)))
              (AssignRT 267 (IndexedComponentRT 268 (IndexedComponentRT 269 (IdentifierRT 270 ((*Cur_Board*) 8) (nil)) (BinOpRT 271 Plus (NameRT 272 (SelectedComponentRT 273 (IdentifierRT 274 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (NameRT 276 (IdentifierRT 277 ((*Y*) 62) (nil))) (RangeCheck :: nil) nil) (nil)) (BinOpRT 278 Plus (NameRT 279 (SelectedComponentRT 280 (IdentifierRT 281 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (NameRT 283 (IdentifierRT 284 ((*X*) 63) (nil))) (RangeCheck :: nil) nil) (nil)) (NameRT 285 (SelectedComponentRT 286 (IdentifierRT 287 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
              NullRT
            ) 
            (AssignRT 289 (IdentifierRT 290 ((*X*) 63) (nil)) (BinOpRT 291 Plus (NameRT 292 (IdentifierRT 293 ((*X*) 63) (nil))) (LiteralRT 294 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
          ) 
          (AssignRT 295 (IdentifierRT 296 ((*Y*) 62) (nil)) (BinOpRT 297 Plus (NameRT 298 (IdentifierRT 299 ((*Y*) 62) (nil))) (LiteralRT 300 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)))
        )
        (WhileRT 301 (BinOpRT 302 Less_Than_Or_Equal (NameRT 303 (IdentifierRT 304 ((*Y*) 62) (nil))) (LiteralRT 305 (Integer_Literal 2) (nil) nil) (nil) nil)
          (SeqRT 306
          (WhileRT 307 (BinOpRT 308 Less_Than_Or_Equal (NameRT 309 (IdentifierRT 310 ((*X*) 63) (nil))) (LiteralRT 311 (Integer_Literal 2) (nil) nil) (nil) nil)
            (SeqRT 312
            (CallRT 313 314 ((*Possible_Three_Shapes*) 25) 
              ((NameRT 315 (SelectedComponentRT 316 (IdentifierRT 317 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))) :: (NameRT 319 (SelectedComponentRT 320 (IdentifierRT 321 ((*Cur_Piece*) 17) (nil)) ((*D*) 14) (nil))) :: (NameRT 323 (IdentifierRT 324 ((*Y*) 62) (nil))) :: (NameRT 325 (IdentifierRT 326 ((*X*) 63) (nil))) :: (NameRT 327 (IdentifierRT 328 ((*R*) 64) (nil))) :: nil)
            ) 
            (SeqRT 329
            (IfRT 330 (NameRT 331 (IdentifierRT 332 ((*R*) 64) (nil)))
              (AssignRT 333 (IndexedComponentRT 334 (IndexedComponentRT 335 (IdentifierRT 336 ((*Cur_Board*) 8) (nil)) (BinOpRT 337 Plus (NameRT 338 (SelectedComponentRT 339 (IdentifierRT 340 ((*Cur_Piece*) 17) (nil)) ((*Y*) 16) (nil))) (NameRT 342 (IdentifierRT 343 ((*Y*) 62) (nil))) (RangeCheck :: nil) nil) (nil)) (BinOpRT 344 Plus (NameRT 345 (SelectedComponentRT 346 (IdentifierRT 347 ((*Cur_Piece*) 17) (nil)) ((*X*) 15) (nil))) (NameRT 349 (IdentifierRT 350 ((*X*) 63) (nil))) (RangeCheck :: nil) nil) (nil)) (NameRT 351 (SelectedComponentRT 352 (IdentifierRT 353 ((*Cur_Piece*) 17) (nil)) ((*S*) 13) (nil))))
              NullRT
            ) 
            (AssignRT 355 (IdentifierRT 356 ((*X*) 63) (nil)) (BinOpRT 357 Plus (NameRT 358 (IdentifierRT 359 ((*X*) 63) (nil))) (LiteralRT 360 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
          ) 
          (AssignRT 361 (IdentifierRT 362 ((*Y*) 62) (nil)) (BinOpRT 363 Plus (NameRT 364 (IdentifierRT 365 ((*Y*) 62) (nil))) (LiteralRT 366 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil)))
        )
      )
    ) 
    (AssignRT 367 (IdentifierRT 368 ((*Cur_State*) 19) (nil)) (LiteralRT 369 (Integer_Literal 2) (nil) nil)))
))) :: (((*Is_Empty_Line*) 28), (0, (mkprocBodyDeclRT 101
  (* = = = Procedure Name = = = *)
  ((*Is_Empty_Line*) 28)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 102 ((*L*) 48) (Array_Type ((*Line*) 6)) In) :: 
  (mkparamSpecRT 103 ((*R*) 49) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (AssignRT 104 (IdentifierRT 105 ((*R*) 49) (nil)) (LiteralRT 106 (Boolean_Literal true) (nil) nil))
))) :: (((*Move_Is_Possible*) 35), (0, (mkprocBodyDeclRT 547
  (* = = = Procedure Name = = = *)
  ((*Move_Is_Possible*) 35)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 548 ((*P*) 78) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparamSpecRT 549 ((*A*) 79) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparamSpecRT 550 ((*R*) 80) Boolean Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (IfRT 551 (BinOpRT 552 Equal (NameRT 553 (IdentifierRT 554 ((*A*) 79) (nil))) (LiteralRT 555 (Integer_Literal 0) (nil) nil) (nil) nil)
      (AssignRT 556 (IdentifierRT 557 ((*R*) 80) (nil)) (BinOpRT 558 And (BinOpRT 559 Greater_Than_Or_Equal (BinOpRT 560 Minus (NameRT 561 (SelectedComponentRT 562 (IdentifierRT 563 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 565 (Integer_Literal 1) (nil) nil) (nil) nil) (UnOpRT 566 Unary_Minus (LiteralRT 567 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (BinOpRT 568 Less_Than_Or_Equal (BinOpRT 569 Minus (NameRT 570 (SelectedComponentRT 571 (IdentifierRT 572 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 574 (Integer_Literal 1) (nil) nil) (nil) nil) (LiteralRT 575 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
      (IfRT 576 (BinOpRT 577 Equal (NameRT 578 (IdentifierRT 579 ((*A*) 79) (nil))) (LiteralRT 580 (Integer_Literal 1) (nil) nil) (nil) nil)
        (AssignRT 581 (IdentifierRT 582 ((*R*) 80) (nil)) (BinOpRT 583 And (BinOpRT 584 Greater_Than_Or_Equal (BinOpRT 585 Plus (NameRT 586 (SelectedComponentRT 587 (IdentifierRT 588 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 590 (Integer_Literal 1) (nil) nil) (nil) nil) (UnOpRT 591 Unary_Minus (LiteralRT 592 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (BinOpRT 593 Less_Than_Or_Equal (BinOpRT 594 Plus (NameRT 595 (SelectedComponentRT 596 (IdentifierRT 597 ((*P*) 78) (nil)) ((*X*) 15) (nil))) (LiteralRT 599 (Integer_Literal 1) (nil) nil) (nil) nil) (LiteralRT 600 (Integer_Literal 9) (nil) nil) (nil) nil) (nil) nil))
        (IfRT 601 (BinOpRT 602 Equal (NameRT 603 (IdentifierRT 604 ((*A*) 79) (nil))) (LiteralRT 605 (Integer_Literal 2) (nil) nil) (nil) nil)
          (AssignRT 606 (IdentifierRT 607 ((*R*) 80) (nil)) (BinOpRT 608 And (BinOpRT 609 Greater_Than_Or_Equal (BinOpRT 610 Plus (NameRT 611 (SelectedComponentRT 612 (IdentifierRT 613 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (LiteralRT 615 (Integer_Literal 1) (nil) nil) (nil) nil) (UnOpRT 616 Unary_Minus (LiteralRT 617 (Integer_Literal 1) (nil) nil) (nil) nil) (nil) nil) (BinOpRT 618 Less_Than_Or_Equal (BinOpRT 619 Plus (NameRT 620 (SelectedComponentRT 621 (IdentifierRT 622 ((*P*) 78) (nil)) ((*Y*) 16) (nil))) (LiteralRT 624 (Integer_Literal 1) (nil) nil) (nil) nil) (LiteralRT 625 (Integer_Literal 49) (nil) nil) (nil) nil) (nil) nil))
          (AssignRT 626 (IdentifierRT 627 ((*R*) 80) (nil)) (LiteralRT 628 (Boolean_Literal true) (nil) nil))
        )
      )
    )
))) :: (((*Turn_Direction*) 34), (0, (mkprocBodyDeclRT 508
  (* = = = Procedure Name = = = *)
  ((*Turn_Direction*) 34)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 509 ((*D*) 75) (Derived_Type ((*Direction*) 11)) In) :: 
  (mkparamSpecRT 510 ((*T*) 76) (Subtype ((*Turn_Action*) 33)) In) :: 
  (mkparamSpecRT 511 ((*R*) 77) (Derived_Type ((*Direction*) 11)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (IfRT 512 (BinOpRT 513 Equal (NameRT 514 (IdentifierRT 515 ((*T*) 76) (nil))) (LiteralRT 516 (Integer_Literal 3) (nil) nil) (nil) nil)
      (IfRT 517 (BinOpRT 518 Equal (NameRT 519 (IdentifierRT 520 ((*D*) 75) (nil))) (LiteralRT 521 (Integer_Literal 0) (nil) nil) (nil) nil)
        (AssignRT 522 (IdentifierRT 523 ((*R*) 77) (nil)) (LiteralRT 524 (Integer_Literal 3) (nil) nil))
        (AssignRT 525 (IdentifierRT 526 ((*R*) 77) (nil)) (BinOpRT 527 Minus (NameRT 528 (IdentifierRT 529 ((*D*) 75) (nil))) (LiteralRT 530 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
      )
      (IfRT 531 (BinOpRT 532 Equal (NameRT 533 (IdentifierRT 534 ((*D*) 75) (nil))) (LiteralRT 535 (Integer_Literal 3) (nil) nil) (nil) nil)
        (AssignRT 536 (IdentifierRT 537 ((*R*) 77) (nil)) (LiteralRT 538 (Integer_Literal 0) (nil) nil))
        (AssignRT 539 (IdentifierRT 540 ((*R*) 77) (nil)) (BinOpRT 541 Plus (NameRT 542 (IdentifierRT 543 ((*D*) 75) (nil))) (LiteralRT 544 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
      )
    )
))) :: (((*Move*) 36), (0, (mkprocBodyDeclRT 631
  (* = = = Procedure Name = = = *)
  ((*Move*) 36)
  (* = = = Formal Parameters = = = *)
  (
  (mkparamSpecRT 632 ((*P*) 81) (Record_Type ((*Piece*) 12)) In) :: 
  (mkparamSpecRT 633 ((*A*) 82) (Derived_Type ((*Action*) 31)) In) :: 
  (mkparamSpecRT 634 ((*R*) 83) (Record_Type ((*Piece*) 12)) Out) :: nil)
  (* = = = Object Declarations = = = *)
  (NullDeclRT)
  (* = = = Procedure Body = = = *)
    (IfRT 635 (BinOpRT 636 Equal (NameRT 637 (IdentifierRT 638 ((*A*) 82) (nil))) (LiteralRT 639 (Integer_Literal 0) (nil) nil) (nil) nil)
      (AssignRT 640 (SelectedComponentRT 641 (IdentifierRT 642 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (BinOpRT 644 Minus (NameRT 645 (SelectedComponentRT 646 (IdentifierRT 647 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (LiteralRT 649 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
      (IfRT 650 (BinOpRT 651 Equal (NameRT 652 (IdentifierRT 653 ((*A*) 82) (nil))) (LiteralRT 654 (Integer_Literal 1) (nil) nil) (nil) nil)
        (AssignRT 655 (SelectedComponentRT 656 (IdentifierRT 657 ((*R*) 83) (nil)) ((*X*) 15) (nil)) (BinOpRT 659 Plus (NameRT 660 (SelectedComponentRT 661 (IdentifierRT 662 ((*P*) 81) (nil)) ((*X*) 15) (nil))) (LiteralRT 664 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
        (IfRT 665 (BinOpRT 666 Equal (NameRT 667 (IdentifierRT 668 ((*A*) 82) (nil))) (LiteralRT 669 (Integer_Literal 2) (nil) nil) (nil) nil)
          (AssignRT 670 (SelectedComponentRT 671 (IdentifierRT 672 ((*R*) 83) (nil)) ((*Y*) 16) (nil)) (BinOpRT 674 Plus (NameRT 675 (SelectedComponentRT 676 (IdentifierRT 677 ((*P*) 81) (nil)) ((*Y*) 16) (nil))) (LiteralRT 679 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))
          (CallRT 680 681 ((*Turn_Direction*) 34) 
            ((NameRT 682 (SelectedComponentRT 683 (IdentifierRT 684 ((*P*) 81) (nil)) ((*D*) 14) (nil))) :: (NameRT 686 (IdentifierRT 687 ((*A*) 82) (RangeCheck :: nil))) :: (NameRT 688 (SelectedComponentRT 689 (IdentifierRT 690 ((*R*) 83) (nil)) ((*D*) 14) (nil))) :: nil)
          )
        )
      )
    )
))) :: (((*Delete_Complete_Lines*) 39), (0, (mkprocBodyDeclRT 372
  (* = = = Procedure Name = = = *)
  ((*Delete_Complete_Lines*) 39)
  (* = = = Formal Parameters = = = *)
  (nil)
  (* = = = Object Declarations = = = *)
  ((SeqDeclRT 373
(ObjDeclRT 374 (mkobjDeclRT 375 ((*Empty_Line*) 66) (Array_Type ((*Line*) 6)) None)) 
(SeqDeclRT 376
(ObjDeclRT 378 (mkobjDeclRT 379 ((*To_Line*) 67) (Subtype ((*Y_Coord*) 5)) (Some ((LiteralRT 377 (Integer_Literal 10) (nil) nil))))) 
(SeqDeclRT 380
(ObjDeclRT 382 (mkobjDeclRT 383 ((*Has_Complete_Lines*) 68) Boolean (Some ((LiteralRT 381 (Boolean_Literal false) (nil) nil))))) 
(SeqDeclRT 384
(ObjDeclRT 386 (mkobjDeclRT 387 ((*Del_Line*) 69) (Subtype ((*Y_Coord*) 5)) (Some ((LiteralRT 385 (Integer_Literal 1) (nil) nil))))) 
(SeqDeclRT 388
(ObjDeclRT 389 (mkobjDeclRT 390 ((*From_Line*) 70) (Subtype ((*Y_Coord*) 5)) None)) 
(ObjDeclRT 391 (mkobjDeclRT 392 ((*R*) 71) Boolean None))))))))
  (* = = = Procedure Body = = = *)
    (SeqRT 393
    (WhileRT 394 (BinOpRT 395 Less_Than_Or_Equal (NameRT 396 (IdentifierRT 397 ((*Del_Line*) 69) (nil))) (LiteralRT 398 (Integer_Literal 50) (nil) nil) (nil) nil)
      (SeqRT 399
      (CallRT 400 401 ((*Is_Complete_Line*) 27) 
        ((NameRT 402 (IndexedComponentRT 403 (IdentifierRT 404 ((*Cur_Board*) 8) (nil)) (NameRT 405 (IdentifierRT 406 ((*Del_Line*) 69) (nil))) (nil))) :: (NameRT 407 (IdentifierRT 408 ((*R*) 71) (nil))) :: nil)
      ) 
      (SeqRT 409
      (IfRT 410 (NameRT 411 (IdentifierRT 412 ((*R*) 71) (nil)))
        (SeqRT 413
        (AssignRT 414 (IndexedComponentRT 415 (IdentifierRT 416 ((*Cur_Board*) 8) (nil)) (NameRT 417 (IdentifierRT 418 ((*Del_Line*) 69) (nil))) (nil)) (NameRT 419 (IdentifierRT 420 ((*Empty_Line*) 66) (nil)))) 
        (SeqRT 421
        (AssignRT 422 (IdentifierRT 423 ((*Has_Complete_Lines*) 68) (nil)) (LiteralRT 424 (Boolean_Literal true) (nil) nil)) 
        (AssignRT 425 (IdentifierRT 426 ((*To_Line*) 67) (nil)) (NameRT 427 (IdentifierRT 428 ((*Del_Line*) 69) (nil))))))
        NullRT
      ) 
      (AssignRT 429 (IdentifierRT 430 ((*Del_Line*) 69) (nil)) (BinOpRT 431 Plus (NameRT 432 (IdentifierRT 433 ((*Del_Line*) 69) (nil))) (LiteralRT 434 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
    ) 
    (SeqRT 435
    (IfRT 436 (NameRT 437 (IdentifierRT 438 ((*Has_Complete_Lines*) 68) (nil)))
      (SeqRT 439
      (AssignRT 440 (IdentifierRT 441 ((*From_Line*) 70) (nil)) (LiteralRT 442 (Integer_Literal 9) (nil) nil)) 
      (WhileRT 443 (BinOpRT 444 Greater_Than_Or_Equal (NameRT 445 (IdentifierRT 446 ((*From_Line*) 70) (nil))) (LiteralRT 447 (Integer_Literal 1) (nil) nil) (nil) nil)
        (SeqRT 448
        (CallRT 449 450 ((*Is_Empty_Line*) 28) 
          ((NameRT 451 (IndexedComponentRT 452 (IdentifierRT 453 ((*Cur_Board*) 8) (nil)) (NameRT 454 (IdentifierRT 455 ((*From_Line*) 70) (nil))) (nil))) :: (NameRT 456 (IdentifierRT 457 ((*R*) 71) (nil))) :: nil)
        ) 
        (SeqRT 458
        (IfRT 459 (UnOpRT 460 Not (NameRT 461 (IdentifierRT 462 ((*R*) 71) (nil))) (nil) nil)
          (SeqRT 463
          (AssignRT 464 (IndexedComponentRT 465 (IdentifierRT 466 ((*Cur_Board*) 8) (nil)) (NameRT 467 (IdentifierRT 468 ((*To_Line*) 67) (nil))) (nil)) (NameRT 469 (IndexedComponentRT 470 (IdentifierRT 471 ((*Cur_Board*) 8) (nil)) (NameRT 472 (IdentifierRT 473 ((*From_Line*) 70) (nil))) (nil)))) 
          (SeqRT 474
          (AssignRT 475 (IndexedComponentRT 476 (IdentifierRT 477 ((*Cur_Board*) 8) (nil)) (NameRT 478 (IdentifierRT 479 ((*From_Line*) 70) (nil))) (nil)) (NameRT 480 (IdentifierRT 481 ((*Empty_Line*) 66) (nil)))) 
          (AssignRT 482 (IdentifierRT 483 ((*To_Line*) 67) (nil)) (BinOpRT 484 Minus (NameRT 485 (IdentifierRT 486 ((*To_Line*) 67) (nil))) (LiteralRT 487 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
          NullRT
        ) 
        (AssignRT 488 (IdentifierRT 489 ((*From_Line*) 70) (nil)) (BinOpRT 490 Minus (NameRT 491 (IdentifierRT 492 ((*From_Line*) 70) (nil))) (LiteralRT 493 (Integer_Literal 1) (nil) nil) (RangeCheck :: nil) nil))))
      ))
      NullRT
    ) 
    (AssignRT 494 (IdentifierRT 495 ((*Cur_State*) 19) (nil)) (LiteralRT 496 (Integer_Literal 3) (nil) nil))))
))) :: nil)
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  ((((*Oriented_Three_Shape*) 23), (ArrayTypeDeclRT 59 ((*Oriented_Three_Shape*) 23) ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))) ((*component type*) Boolean))) :: (((*Y_Coord*) 5), (SubtypeDeclRT 16 ((*Y_Coord*) 5) Integer (RangeRT 1 50))) :: (((*Board*) 7), (ArrayTypeDeclRT 22 ((*Board*) 7) ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))) ((*component type*) (Array_Type ((*Line*) 6))))) :: (((*Move_Action*) 32), (SubtypeDeclRT 72 ((*Move_Action*) 32) (Derived_Type ((*Action*) 31)) (RangeRT 0 1))) :: (((*Cell*) 1), (DerivedTypeDeclRT 4 ((*Cell*) 1) Integer (RangeRT 0 8))) :: (((*Line*) 6), (ArrayTypeDeclRT 19 ((*Line*) 6) ((*index subtype mark*) (Subtype ((*X_Coord*) 4))) ((*component type*) (Derived_Type ((*Cell*) 1))))) :: (((*PY_Coord*) 10), (SubtypeDeclRT 31 ((*PY_Coord*) 10) Integer (RangeRT (-1) 49))) :: (((*Oriented_I_Shape*) 21), (ArrayTypeDeclRT 53 ((*Oriented_I_Shape*) 21) ((*index subtype mark*) (Subtype ((*I_Delta*) 20))) ((*component type*) Boolean))) :: (((*Action*) 31), (DerivedTypeDeclRT 69 ((*Action*) 31) Integer (RangeRT 0 4))) :: (((*Direction*) 11), (DerivedTypeDeclRT 34 ((*Direction*) 11) Integer (RangeRT 0 3))) :: (((*Piece*) 12), (RecordTypeDeclRT 37 ((*Piece*) 12) ((((*S*) 13), (Subtype ((*Shape*) 2))) :: (((*D*) 14), (Derived_Type ((*Direction*) 11))) :: (((*X*) 15), (Subtype ((*PX_Coord*) 9))) :: (((*Y*) 16), (Subtype ((*PY_Coord*) 10))) :: nil))) :: (((*Shape*) 2), (SubtypeDeclRT 7 ((*Shape*) 2) (Derived_Type ((*Cell*) 1)) (RangeRT 1 8))) :: (((*I_Delta*) 20), (SubtypeDeclRT 50 ((*I_Delta*) 20) Integer (RangeRT 0 3))) :: (((*State*) 18), (DerivedTypeDeclRT 44 ((*State*) 18) Integer (RangeRT 0 3))) :: (((*X_Coord*) 4), (SubtypeDeclRT 13 ((*X_Coord*) 4) Integer (RangeRT 1 10))) :: (((*Turn_Action*) 33), (SubtypeDeclRT 75 ((*Turn_Action*) 33) (Derived_Type ((*Action*) 31)) (RangeRT 3 4))) :: (((*Three_Delta*) 22), (SubtypeDeclRT 56 ((*Three_Delta*) 22) Integer (RangeRT 0 2))) :: (((*Three_Shape*) 3), (SubtypeDeclRT 10 ((*Three_Shape*) 3) (Derived_Type ((*Cell*) 1)) (RangeRT 3 8))) :: (((*PX_Coord*) 9), (SubtypeDeclRT 28 ((*PX_Coord*) 9) Integer (RangeRT (-1) 9))) :: nil)
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

