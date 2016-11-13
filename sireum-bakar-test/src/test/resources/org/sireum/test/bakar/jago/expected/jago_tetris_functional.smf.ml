

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
(SeqDecl (2,
(TypeDecl (3, (DerivedTypeDecl (4, ((*Cell*) 1), Integer, (Range (0, 8)))))),
(SeqDecl (5,
(TypeDecl (6, (SubtypeDecl (7, ((*Shape*) 2), (Derived_Type ((*Cell*) 1)), (Range (1, 8)))))),
(SeqDecl (8,
(TypeDecl (9, (SubtypeDecl (10, ((*Three_Shape*) 3), (Derived_Type ((*Cell*) 1)), (Range (3, 8)))))),
(SeqDecl (11,
(TypeDecl (12, (SubtypeDecl (13, ((*X_Coord*) 4), Integer, (Range (1, 10)))))),
(SeqDecl (14,
(TypeDecl (15, (SubtypeDecl (16, ((*Y_Coord*) 5), Integer, (Range (1, 50)))))),
(SeqDecl (17,
(TypeDecl (18, (ArrayTypeDecl (19, ((*Line*) 6), ((*index subtype mark*) (Subtype ((*X_Coord*) 4))), ((*component type*) (Derived_Type ((*Cell*) 1))))))),
(SeqDecl (20,
(TypeDecl (21, (ArrayTypeDecl (22, ((*Board*) 7), ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))), ((*component type*) (Array_Type ((*Line*) 6))))))),
(SeqDecl (23,
(ObjDecl (24, { declaration_astnum = 25; object_name = ((*Cur_Board*) 8); object_nominal_subtype = (Array_Type ((*Board*) 7)); initialization_exp = None })),
(SeqDecl (26,
(TypeDecl (27, (SubtypeDecl (28, ((*PX_Coord*) 9), Integer, (Range ((-1), 9)))))),
(SeqDecl (29,
(TypeDecl (30, (SubtypeDecl (31, ((*PY_Coord*) 10), Integer, (Range ((-1), 49)))))),
(SeqDecl (32,
(TypeDecl (33, (DerivedTypeDecl (34, ((*Direction*) 11), Integer, (Range (0, 3)))))),
(SeqDecl (35,
(TypeDecl (36, (RecordTypeDecl (37, ((*Piece*) 12), [(((*S*) 13), (Subtype ((*Shape*) 2))); (((*D*) 14), (Derived_Type ((*Direction*) 11))); (((*X*) 15), (Subtype ((*PX_Coord*) 9))); (((*Y*) 16), (Subtype ((*PY_Coord*) 10)))])))),
(SeqDecl (39,
(ObjDecl (40, { declaration_astnum = 41; object_name = ((*Cur_Piece*) 17); object_nominal_subtype = (Record_Type ((*Piece*) 12)); initialization_exp = None })),
(SeqDecl (42,
(TypeDecl (43, (DerivedTypeDecl (44, ((*State*) 18), Integer, (Range (0, 3)))))),
(SeqDecl (45,
(ObjDecl (46, { declaration_astnum = 47; object_name = ((*Cur_State*) 19); object_nominal_subtype = (Derived_Type ((*State*) 18)); initialization_exp = None })),
(SeqDecl (48,
(TypeDecl (49, (SubtypeDecl (50, ((*I_Delta*) 20), Integer, (Range (0, 3)))))),
(SeqDecl (51,
(TypeDecl (52, (ArrayTypeDecl (53, ((*Oriented_I_Shape*) 21), ((*index subtype mark*) (Subtype ((*I_Delta*) 20))), ((*component type*) Boolean))))),
(SeqDecl (54,
(TypeDecl (55, (SubtypeDecl (56, ((*Three_Delta*) 22), Integer, (Range (0, 2)))))),
(SeqDecl (57,
(TypeDecl (58, (ArrayTypeDecl (59, ((*Oriented_Three_Shape*) 23), ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))), ((*component type*) Boolean))))),
(SeqDecl (60,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (61,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (62,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (63,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (64,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (65,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (66,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (67,
(TypeDecl (68, (DerivedTypeDecl (69, ((*Action*) 31), Integer, (Range (0, 4)))))),
(SeqDecl (70,
(TypeDecl (71, (SubtypeDecl (72, ((*Move_Action*) 32), (Derived_Type ((*Action*) 31)), (Range (0, 1)))))),
(SeqDecl (73,
(TypeDecl (74, (SubtypeDecl (75, ((*Turn_Action*) 33), (Derived_Type ((*Action*) 31)), (Range (3, 4)))))),
(SeqDecl (76,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (77,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (78,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (79,
NullDecl (* Undefined Declarations ! *),
(SeqDecl (80,
NullDecl (* Undefined Declarations ! *),
NullDecl (* Undefined Declarations ! *))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
(SeqDecl (81,
(ProcBodyDecl (82, 
  mkprocBodyDecl (
   83,
    (* = = = Procedure Name = = = *)
    ((*Is_Empty*) 26),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 84; parameter_name = ((*B*) 41); parameter_subtype_mark = (Array_Type ((*Board*) 7)); parameter_mode = In }; 
  { parameter_astnum = 85; parameter_name = ((*Y*) 42); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 86; parameter_name = ((*X*) 43); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 87; parameter_name = ((*R*) 44); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (88, (Identifier (89, ((*R*) 44) )), (Literal (90, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (91,
(ProcBodyDecl (92, 
  mkprocBodyDecl (
   93,
    (* = = = Procedure Name = = = *)
    ((*Is_Complete_Line*) 27),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 94; parameter_name = ((*L*) 46); parameter_subtype_mark = (Array_Type ((*Line*) 6)); parameter_mode = In }; 
  { parameter_astnum = 95; parameter_name = ((*R*) 47); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (96, (Identifier (97, ((*R*) 47) )), (Literal (98, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (99,
(ProcBodyDecl (100, 
  mkprocBodyDecl (
   101,
    (* = = = Procedure Name = = = *)
    ((*Is_Empty_Line*) 28),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 102; parameter_name = ((*L*) 48); parameter_subtype_mark = (Array_Type ((*Line*) 6)); parameter_mode = In }; 
  { parameter_astnum = 103; parameter_name = ((*R*) 49); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (104, (Identifier (105, ((*R*) 49) )), (Literal (106, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (107,
(ProcBodyDecl (108, 
  mkprocBodyDecl (
   109,
    (* = = = Procedure Name = = = *)
    ((*No_Complete_Lines*) 29),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 110; parameter_name = ((*B*) 50); parameter_subtype_mark = (Array_Type ((*Board*) 7)); parameter_mode = In }; 
  { parameter_astnum = 111; parameter_name = ((*R*) 51); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (112, (Identifier (113, ((*R*) 51) )), (Literal (114, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (115,
(ProcBodyDecl (116, 
  mkprocBodyDecl (
   117,
    (* = = = Procedure Name = = = *)
    ((*Possible_I_Shapes*) 24),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 118; parameter_name = ((*Cur_Piece_D*) 52); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = In }; 
  { parameter_astnum = 119; parameter_name = ((*X*) 53); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
  { parameter_astnum = 120; parameter_name = ((*Y*) 54); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
  { parameter_astnum = 121; parameter_name = ((*R*) 55); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (122, (Identifier (123, ((*R*) 55) )), (Literal (124, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (125,
(ProcBodyDecl (126, 
  mkprocBodyDecl (
   127,
    (* = = = Procedure Name = = = *)
    ((*Possible_Three_Shapes*) 25),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 128; parameter_name = ((*Cur_Piece_S*) 56); parameter_subtype_mark = (Subtype ((*Shape*) 2)); parameter_mode = In }; 
  { parameter_astnum = 129; parameter_name = ((*Cur_Piece_D*) 57); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = In }; 
  { parameter_astnum = 130; parameter_name = ((*X*) 58); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
  { parameter_astnum = 131; parameter_name = ((*Y*) 59); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
  { parameter_astnum = 132; parameter_name = ((*R*) 60); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (133, (Identifier (134, ((*R*) 60) )), (Literal (135, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (136,
(ProcBodyDecl (137, 
  mkprocBodyDecl (
   138,
    (* = = = Procedure Name = = = *)
    ((*Include_Piece_In_Board*) 38),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    (SeqDecl (139,
    (ObjDecl (141, { declaration_astnum = 142; object_name = ((*Y*) 62); object_nominal_subtype = (Subtype ((*I_Delta*) 20)); initialization_exp = (Some ((Literal (140, (Integer_Literal 0) )))) })),
    (SeqDecl (143,
    (ObjDecl (145, { declaration_astnum = 146; object_name = ((*X*) 63); object_nominal_subtype = (Subtype ((*I_Delta*) 20)); initialization_exp = (Some ((Literal (144, (Integer_Literal 0) )))) })),
    (ObjDecl (147, { declaration_astnum = 148; object_name = ((*R*) 64); object_nominal_subtype = Boolean; initialization_exp = None })))))),
    (* = = = Procedure Body = = = *)
    (Seq (149,
    (If (150, (BinOp (151, Equal, (Name (152, (SelectedComponent (153, (Identifier (154, ((*Cur_Piece*) 17) )), ((*S*) 13) )))), (Literal (156, (Integer_Literal 2) )) )),
      (Seq (157,
      (Assign (158, (IndexedComponent (159, (IndexedComponent (160, (Identifier (161, ((*Cur_Board*) 8) )), (Name (162, (SelectedComponent (163, (Identifier (164, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))) )), (Name (166, (SelectedComponent (167, (Identifier (168, ((*Cur_Piece*) 17) )), ((*X*) 15) )))) )), (Name (170, (SelectedComponent (171, (Identifier (172, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
      (Seq (174,
      (Assign (175, (IndexedComponent (176, (IndexedComponent (177, (Identifier (178, ((*Cur_Board*) 8) )), (BinOp (179, Plus, (Name (180, (SelectedComponent (181, (Identifier (182, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Literal (184, (Integer_Literal 1) )) )) )), (Name (185, (SelectedComponent (186, (Identifier (187, ((*Cur_Piece*) 17) )), ((*X*) 15) )))) )), (Name (189, (SelectedComponent (190, (Identifier (191, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
      (Seq (193,
      (Assign (194, (IndexedComponent (195, (IndexedComponent (196, (Identifier (197, ((*Cur_Board*) 8) )), (Name (198, (SelectedComponent (199, (Identifier (200, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))) )), (BinOp (202, Plus, (Name (203, (SelectedComponent (204, (Identifier (205, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Literal (207, (Integer_Literal 1) )) )) )), (Name (208, (SelectedComponent (209, (Identifier (210, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
      (Assign (212, (IndexedComponent (213, (IndexedComponent (214, (Identifier (215, ((*Cur_Board*) 8) )), (BinOp (216, Plus, (Name (217, (SelectedComponent (218, (Identifier (219, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Literal (221, (Integer_Literal 1) )) )) )), (BinOp (222, Plus, (Name (223, (SelectedComponent (224, (Identifier (225, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Literal (227, (Integer_Literal 1) )) )) )), (Name (228, (SelectedComponent (229, (Identifier (230, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))))))))),
      (If (232, (BinOp (233, Equal, (Name (234, (SelectedComponent (235, (Identifier (236, ((*Cur_Piece*) 17) )), ((*S*) 13) )))), (Literal (238, (Integer_Literal 1) )) )),
        (While (239, (BinOp (240, Less_Than_Or_Equal, (Name (241, (Identifier (242, ((*Y*) 62) )))), (Literal (243, (Integer_Literal 3) )) )),
          (Seq (244,
          (While (245, (BinOp (246, Less_Than_Or_Equal, (Name (247, (Identifier (248, ((*X*) 63) )))), (Literal (249, (Integer_Literal 3) )) )),
            (Seq (250,
            (Call (251, 252, ((*Possible_I_Shapes*) 24), 
              [(Name (253, (SelectedComponent (254, (Identifier (255, ((*Cur_Piece*) 17) )), ((*D*) 14) )))); (Name (257, (Identifier (258, ((*Y*) 62) )))); (Name (259, (Identifier (260, ((*X*) 63) )))); (Name (261, (Identifier (262, ((*R*) 64) ))))])
            ),
            (Seq (263,
            (If (264, (Name (265, (Identifier (266, ((*R*) 64) )))),
              (Assign (267, (IndexedComponent (268, (IndexedComponent (269, (Identifier (270, ((*Cur_Board*) 8) )), (BinOp (271, Plus, (Name (272, (SelectedComponent (273, (Identifier (274, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Name (276, (Identifier (277, ((*Y*) 62) )))) )) )), (BinOp (278, Plus, (Name (279, (SelectedComponent (280, (Identifier (281, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Name (283, (Identifier (284, ((*X*) 63) )))) )) )), (Name (285, (SelectedComponent (286, (Identifier (287, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
              Null)
            ),
            (Assign (289, (Identifier (290, ((*X*) 63) )), (BinOp (291, Plus, (Name (292, (Identifier (293, ((*X*) 63) )))), (Literal (294, (Integer_Literal 1) )) )))))))))
          ),
          (Assign (295, (Identifier (296, ((*Y*) 62) )), (BinOp (297, Plus, (Name (298, (Identifier (299, ((*Y*) 62) )))), (Literal (300, (Integer_Literal 1) )) )))))))
        ),
        (While (301, (BinOp (302, Less_Than_Or_Equal, (Name (303, (Identifier (304, ((*Y*) 62) )))), (Literal (305, (Integer_Literal 2) )) )),
          (Seq (306,
          (While (307, (BinOp (308, Less_Than_Or_Equal, (Name (309, (Identifier (310, ((*X*) 63) )))), (Literal (311, (Integer_Literal 2) )) )),
            (Seq (312,
            (Call (313, 314, ((*Possible_Three_Shapes*) 25), 
              [(Name (315, (SelectedComponent (316, (Identifier (317, ((*Cur_Piece*) 17) )), ((*S*) 13) )))); (Name (319, (SelectedComponent (320, (Identifier (321, ((*Cur_Piece*) 17) )), ((*D*) 14) )))); (Name (323, (Identifier (324, ((*Y*) 62) )))); (Name (325, (Identifier (326, ((*X*) 63) )))); (Name (327, (Identifier (328, ((*R*) 64) ))))])
            ),
            (Seq (329,
            (If (330, (Name (331, (Identifier (332, ((*R*) 64) )))),
              (Assign (333, (IndexedComponent (334, (IndexedComponent (335, (Identifier (336, ((*Cur_Board*) 8) )), (BinOp (337, Plus, (Name (338, (SelectedComponent (339, (Identifier (340, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Name (342, (Identifier (343, ((*Y*) 62) )))) )) )), (BinOp (344, Plus, (Name (345, (SelectedComponent (346, (Identifier (347, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Name (349, (Identifier (350, ((*X*) 63) )))) )) )), (Name (351, (SelectedComponent (352, (Identifier (353, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
              Null)
            ),
            (Assign (355, (Identifier (356, ((*X*) 63) )), (BinOp (357, Plus, (Name (358, (Identifier (359, ((*X*) 63) )))), (Literal (360, (Integer_Literal 1) )) )))))))))
          ),
          (Assign (361, (Identifier (362, ((*Y*) 62) )), (BinOp (363, Plus, (Name (364, (Identifier (365, ((*Y*) 62) )))), (Literal (366, (Integer_Literal 1) )) )))))))
        ))
      ))
    ),
    (Assign (367, (Identifier (368, ((*Cur_State*) 19) )), (Literal (369, (Integer_Literal 2) ))))))
  ))
),
(SeqDecl (370,
(ProcBodyDecl (371, 
  mkprocBodyDecl (
   372,
    (* = = = Procedure Name = = = *)
    ((*Delete_Complete_Lines*) 39),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    (SeqDecl (373,
    (ObjDecl (374, { declaration_astnum = 375; object_name = ((*Empty_Line*) 66); object_nominal_subtype = (Array_Type ((*Line*) 6)); initialization_exp = None })),
    (SeqDecl (376,
    (ObjDecl (378, { declaration_astnum = 379; object_name = ((*To_Line*) 67); object_nominal_subtype = (Subtype ((*Y_Coord*) 5)); initialization_exp = (Some ((Literal (377, (Integer_Literal 10) )))) })),
    (SeqDecl (380,
    (ObjDecl (382, { declaration_astnum = 383; object_name = ((*Has_Complete_Lines*) 68); object_nominal_subtype = Boolean; initialization_exp = (Some ((Literal (381, (Boolean_Literal false) )))) })),
    (SeqDecl (384,
    (ObjDecl (386, { declaration_astnum = 387; object_name = ((*Del_Line*) 69); object_nominal_subtype = (Subtype ((*Y_Coord*) 5)); initialization_exp = (Some ((Literal (385, (Integer_Literal 1) )))) })),
    (SeqDecl (388,
    (ObjDecl (389, { declaration_astnum = 390; object_name = ((*From_Line*) 70); object_nominal_subtype = (Subtype ((*Y_Coord*) 5)); initialization_exp = None })),
    (ObjDecl (391, { declaration_astnum = 392; object_name = ((*R*) 71); object_nominal_subtype = Boolean; initialization_exp = None })))))))))))),
    (* = = = Procedure Body = = = *)
    (Seq (393,
    (While (394, (BinOp (395, Less_Than_Or_Equal, (Name (396, (Identifier (397, ((*Del_Line*) 69) )))), (Literal (398, (Integer_Literal 50) )) )),
      (Seq (399,
      (Call (400, 401, ((*Is_Complete_Line*) 27), 
        [(Name (402, (IndexedComponent (403, (Identifier (404, ((*Cur_Board*) 8) )), (Name (405, (Identifier (406, ((*Del_Line*) 69) )))) )))); (Name (407, (Identifier (408, ((*R*) 71) ))))])
      ),
      (Seq (409,
      (If (410, (Name (411, (Identifier (412, ((*R*) 71) )))),
        (Seq (413,
        (Assign (414, (IndexedComponent (415, (Identifier (416, ((*Cur_Board*) 8) )), (Name (417, (Identifier (418, ((*Del_Line*) 69) )))) )), (Name (419, (Identifier (420, ((*Empty_Line*) 66) )))))),
        (Seq (421,
        (Assign (422, (Identifier (423, ((*Has_Complete_Lines*) 68) )), (Literal (424, (Boolean_Literal true) )))),
        (Assign (425, (Identifier (426, ((*To_Line*) 67) )), (Name (427, (Identifier (428, ((*Del_Line*) 69) )))))))))),
        Null)
      ),
      (Assign (429, (Identifier (430, ((*Del_Line*) 69) )), (BinOp (431, Plus, (Name (432, (Identifier (433, ((*Del_Line*) 69) )))), (Literal (434, (Integer_Literal 1) )) )))))))))
    ),
    (Seq (435,
    (If (436, (Name (437, (Identifier (438, ((*Has_Complete_Lines*) 68) )))),
      (Seq (439,
      (Assign (440, (Identifier (441, ((*From_Line*) 70) )), (Literal (442, (Integer_Literal 9) )))),
      (While (443, (BinOp (444, Greater_Than_Or_Equal, (Name (445, (Identifier (446, ((*From_Line*) 70) )))), (Literal (447, (Integer_Literal 1) )) )),
        (Seq (448,
        (Call (449, 450, ((*Is_Empty_Line*) 28), 
          [(Name (451, (IndexedComponent (452, (Identifier (453, ((*Cur_Board*) 8) )), (Name (454, (Identifier (455, ((*From_Line*) 70) )))) )))); (Name (456, (Identifier (457, ((*R*) 71) ))))])
        ),
        (Seq (458,
        (If (459, (UnOp (460, Not, (Name (461, (Identifier (462, ((*R*) 71) )))) )),
          (Seq (463,
          (Assign (464, (IndexedComponent (465, (Identifier (466, ((*Cur_Board*) 8) )), (Name (467, (Identifier (468, ((*To_Line*) 67) )))) )), (Name (469, (IndexedComponent (470, (Identifier (471, ((*Cur_Board*) 8) )), (Name (472, (Identifier (473, ((*From_Line*) 70) )))) )))))),
          (Seq (474,
          (Assign (475, (IndexedComponent (476, (Identifier (477, ((*Cur_Board*) 8) )), (Name (478, (Identifier (479, ((*From_Line*) 70) )))) )), (Name (480, (Identifier (481, ((*Empty_Line*) 66) )))))),
          (Assign (482, (Identifier (483, ((*To_Line*) 67) )), (BinOp (484, Minus, (Name (485, (Identifier (486, ((*To_Line*) 67) )))), (Literal (487, (Integer_Literal 1) )) )))))))),
          Null)
        ),
        (Assign (488, (Identifier (489, ((*From_Line*) 70) )), (BinOp (490, Minus, (Name (491, (Identifier (492, ((*From_Line*) 70) )))), (Literal (493, (Integer_Literal 1) )) )))))))))
      ))),
      Null)
    ),
    (Assign (494, (Identifier (495, ((*Cur_State*) 19) )), (Literal (496, (Integer_Literal 3) ))))))))
  ))
),
(SeqDecl (497,
(ProcBodyDecl (498, 
  mkprocBodyDecl (
   499,
    (* = = = Procedure Name = = = *)
    ((*No_Overlap*) 30),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 500; parameter_name = ((*B*) 72); parameter_subtype_mark = (Array_Type ((*Board*) 7)); parameter_mode = In }; 
  { parameter_astnum = 501; parameter_name = ((*P*) 73); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = In }; 
  { parameter_astnum = 502; parameter_name = ((*R*) 74); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (Assign (503, (Identifier (504, ((*R*) 74) )), (Literal (505, (Boolean_Literal true) ))))
  ))
),
(SeqDecl (506,
(ProcBodyDecl (507, 
  mkprocBodyDecl (
   508,
    (* = = = Procedure Name = = = *)
    ((*Turn_Direction*) 34),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 509; parameter_name = ((*D*) 75); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = In }; 
  { parameter_astnum = 510; parameter_name = ((*T*) 76); parameter_subtype_mark = (Subtype ((*Turn_Action*) 33)); parameter_mode = In }; 
  { parameter_astnum = 511; parameter_name = ((*R*) 77); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (If (512, (BinOp (513, Equal, (Name (514, (Identifier (515, ((*T*) 76) )))), (Literal (516, (Integer_Literal 3) )) )),
      (If (517, (BinOp (518, Equal, (Name (519, (Identifier (520, ((*D*) 75) )))), (Literal (521, (Integer_Literal 0) )) )),
        (Assign (522, (Identifier (523, ((*R*) 77) )), (Literal (524, (Integer_Literal 3) )))),
        (Assign (525, (Identifier (526, ((*R*) 77) )), (BinOp (527, Minus, (Name (528, (Identifier (529, ((*D*) 75) )))), (Literal (530, (Integer_Literal 1) )) )))))
      ),
      (If (531, (BinOp (532, Equal, (Name (533, (Identifier (534, ((*D*) 75) )))), (Literal (535, (Integer_Literal 3) )) )),
        (Assign (536, (Identifier (537, ((*R*) 77) )), (Literal (538, (Integer_Literal 0) )))),
        (Assign (539, (Identifier (540, ((*R*) 77) )), (BinOp (541, Plus, (Name (542, (Identifier (543, ((*D*) 75) )))), (Literal (544, (Integer_Literal 1) )) )))))
      ))
    )
  ))
),
(SeqDecl (545,
(ProcBodyDecl (546, 
  mkprocBodyDecl (
   547,
    (* = = = Procedure Name = = = *)
    ((*Move_Is_Possible*) 35),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 548; parameter_name = ((*P*) 78); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = In }; 
  { parameter_astnum = 549; parameter_name = ((*A*) 79); parameter_subtype_mark = (Derived_Type ((*Action*) 31)); parameter_mode = In }; 
  { parameter_astnum = 550; parameter_name = ((*R*) 80); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (If (551, (BinOp (552, Equal, (Name (553, (Identifier (554, ((*A*) 79) )))), (Literal (555, (Integer_Literal 0) )) )),
      (Assign (556, (Identifier (557, ((*R*) 80) )), (BinOp (558, And, (BinOp (559, Greater_Than_Or_Equal, (BinOp (560, Minus, (Name (561, (SelectedComponent (562, (Identifier (563, ((*P*) 78) )), ((*X*) 15) )))), (Literal (565, (Integer_Literal 1) )) )), (UnOp (566, Unary_Minus, (Literal (567, (Integer_Literal 1) )) )) )), (BinOp (568, Less_Than_Or_Equal, (BinOp (569, Minus, (Name (570, (SelectedComponent (571, (Identifier (572, ((*P*) 78) )), ((*X*) 15) )))), (Literal (574, (Integer_Literal 1) )) )), (Literal (575, (Integer_Literal 9) )) )) )))),
      (If (576, (BinOp (577, Equal, (Name (578, (Identifier (579, ((*A*) 79) )))), (Literal (580, (Integer_Literal 1) )) )),
        (Assign (581, (Identifier (582, ((*R*) 80) )), (BinOp (583, And, (BinOp (584, Greater_Than_Or_Equal, (BinOp (585, Plus, (Name (586, (SelectedComponent (587, (Identifier (588, ((*P*) 78) )), ((*X*) 15) )))), (Literal (590, (Integer_Literal 1) )) )), (UnOp (591, Unary_Minus, (Literal (592, (Integer_Literal 1) )) )) )), (BinOp (593, Less_Than_Or_Equal, (BinOp (594, Plus, (Name (595, (SelectedComponent (596, (Identifier (597, ((*P*) 78) )), ((*X*) 15) )))), (Literal (599, (Integer_Literal 1) )) )), (Literal (600, (Integer_Literal 9) )) )) )))),
        (If (601, (BinOp (602, Equal, (Name (603, (Identifier (604, ((*A*) 79) )))), (Literal (605, (Integer_Literal 2) )) )),
          (Assign (606, (Identifier (607, ((*R*) 80) )), (BinOp (608, And, (BinOp (609, Greater_Than_Or_Equal, (BinOp (610, Plus, (Name (611, (SelectedComponent (612, (Identifier (613, ((*P*) 78) )), ((*Y*) 16) )))), (Literal (615, (Integer_Literal 1) )) )), (UnOp (616, Unary_Minus, (Literal (617, (Integer_Literal 1) )) )) )), (BinOp (618, Less_Than_Or_Equal, (BinOp (619, Plus, (Name (620, (SelectedComponent (621, (Identifier (622, ((*P*) 78) )), ((*Y*) 16) )))), (Literal (624, (Integer_Literal 1) )) )), (Literal (625, (Integer_Literal 49) )) )) )))),
          (Assign (626, (Identifier (627, ((*R*) 80) )), (Literal (628, (Boolean_Literal true) )))))
        ))
      ))
    )
  ))
),
(SeqDecl (629,
(ProcBodyDecl (630, 
  mkprocBodyDecl (
   631,
    (* = = = Procedure Name = = = *)
    ((*Move*) 36),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 632; parameter_name = ((*P*) 81); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = In }; 
  { parameter_astnum = 633; parameter_name = ((*A*) 82); parameter_subtype_mark = (Derived_Type ((*Action*) 31)); parameter_mode = In }; 
  { parameter_astnum = 634; parameter_name = ((*R*) 83); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    NullDecl,
    (* = = = Procedure Body = = = *)
    (If (635, (BinOp (636, Equal, (Name (637, (Identifier (638, ((*A*) 82) )))), (Literal (639, (Integer_Literal 0) )) )),
      (Assign (640, (SelectedComponent (641, (Identifier (642, ((*R*) 83) )), ((*X*) 15) )), (BinOp (644, Minus, (Name (645, (SelectedComponent (646, (Identifier (647, ((*P*) 81) )), ((*X*) 15) )))), (Literal (649, (Integer_Literal 1) )) )))),
      (If (650, (BinOp (651, Equal, (Name (652, (Identifier (653, ((*A*) 82) )))), (Literal (654, (Integer_Literal 1) )) )),
        (Assign (655, (SelectedComponent (656, (Identifier (657, ((*R*) 83) )), ((*X*) 15) )), (BinOp (659, Plus, (Name (660, (SelectedComponent (661, (Identifier (662, ((*P*) 81) )), ((*X*) 15) )))), (Literal (664, (Integer_Literal 1) )) )))),
        (If (665, (BinOp (666, Equal, (Name (667, (Identifier (668, ((*A*) 82) )))), (Literal (669, (Integer_Literal 2) )) )),
          (Assign (670, (SelectedComponent (671, (Identifier (672, ((*R*) 83) )), ((*Y*) 16) )), (BinOp (674, Plus, (Name (675, (SelectedComponent (676, (Identifier (677, ((*P*) 81) )), ((*Y*) 16) )))), (Literal (679, (Integer_Literal 1) )) )))),
          (Call (680, 681, ((*Turn_Direction*) 34), 
            [(Name (682, (SelectedComponent (683, (Identifier (684, ((*P*) 81) )), ((*D*) 14) )))); (Name (686, (Identifier (687, ((*A*) 82) )))); (Name (688, (SelectedComponent (689, (Identifier (690, ((*R*) 83) )), ((*D*) 14) ))))])
          ))
        ))
      ))
    )
  ))
),
(ProcBodyDecl (692, 
  mkprocBodyDecl (
   693,
    (* = = = Procedure Name = = = *)
    ((*Do_Action*) 37),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 694; parameter_name = ((*A*) 84); parameter_subtype_mark = (Derived_Type ((*Action*) 31)); parameter_mode = In }; 
  { parameter_astnum = 695; parameter_name = ((*Success*) 85); parameter_subtype_mark = Boolean; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDecl (696,
    (ObjDecl (697, { declaration_astnum = 698; object_name = ((*Candidate*) 86); object_nominal_subtype = (Record_Type ((*Piece*) 12)); initialization_exp = None })),
    (SeqDecl (699,
    (ObjDecl (700, { declaration_astnum = 701; object_name = ((*Is_Move_OK*) 87); object_nominal_subtype = Boolean; initialization_exp = None })),
    (ObjDecl (702, { declaration_astnum = 703; object_name = ((*Is_No_Overlap*) 88); object_nominal_subtype = Boolean; initialization_exp = None })))))),
    (* = = = Procedure Body = = = *)
    (Seq (704,
    (Call (705, 706, ((*Move_Is_Possible*) 35), 
      [(Name (707, (Identifier (708, ((*Cur_Piece*) 17) )))); (Name (709, (Identifier (710, ((*A*) 84) )))); (Name (711, (Identifier (712, ((*Is_Move_OK*) 87) ))))])
    ),
    (Seq (713,
    (If (714, (Name (715, (Identifier (716, ((*Is_Move_OK*) 87) )))),
      (Seq (717,
      (Call (718, 719, ((*Move*) 36), 
        [(Name (720, (Identifier (721, ((*Cur_Piece*) 17) )))); (Name (722, (Identifier (723, ((*A*) 84) )))); (Name (724, (Identifier (725, ((*Candidate*) 86) ))))])
      ),
      (Seq (726,
      (Call (727, 728, ((*No_Overlap*) 30), 
        [(Name (729, (Identifier (730, ((*Cur_Board*) 8) )))); (Name (731, (Identifier (732, ((*Candidate*) 86) )))); (Name (733, (Identifier (734, ((*Is_No_Overlap*) 88) ))))])
      ),
      (If (735, (Name (736, (Identifier (737, ((*Is_No_Overlap*) 88) )))),
        (Seq (738,
        (Assign (739, (Identifier (740, ((*Cur_Piece*) 17) )), (Name (741, (Identifier (742, ((*Candidate*) 86) )))))),
        (Seq (743,
        (Assign (744, (Identifier (745, ((*Success*) 85) )), (Literal (746, (Boolean_Literal true) )))),
        Null (* Ignore Return Statement ! *))))),
        Null)
      ))))),
      Null)
    ),
    (Assign (747, (Identifier (748, ((*Success*) 85) )), (Literal (749, (Boolean_Literal false) ))))))))
  ))
)))))))))))))))))))))))))));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*R*) 49), (Out, Boolean)); (((*X*) 53), (In, (Subtype ((*I_Delta*) 20)))); (((*Cur_Board*) 8), (In_Out, (Array_Type ((*Board*) 7)))); (((*To_Line*) 67), (In_Out, (Subtype ((*Y_Coord*) 5)))); (((*R*) 55), (Out, Boolean)); (((*P*) 81), (In, (Record_Type ((*Piece*) 12)))); (((*A*) 82), (In, (Derived_Type ((*Action*) 31)))); (((*From_Line*) 70), (In_Out, (Subtype ((*Y_Coord*) 5)))); (((*R*) 64), (In_Out, Boolean)); (((*Is_No_Overlap*) 88), (In_Out, Boolean)); (((*L*) 48), (In, (Array_Type ((*Line*) 6)))); (((*Candidate*) 86), (In_Out, (Record_Type ((*Piece*) 12)))); (((*X*) 58), (In, (Subtype ((*I_Delta*) 20)))); (((*Success*) 85), (Out, Boolean)); (((*B*) 72), (In, (Array_Type ((*Board*) 7)))); (((*Y*) 54), (In, (Subtype ((*I_Delta*) 20)))); (((*X*) 43), (In, Integer)); (((*Is_Move_OK*) 87), (In_Out, Boolean)); (((*T*) 76), (In, (Subtype ((*Turn_Action*) 33)))); (((*Has_Complete_Lines*) 68), (In_Out, Boolean)); (((*Cur_State*) 19), (In_Out, (Derived_Type ((*State*) 18)))); (((*R*) 51), (Out, Boolean)); (((*Y*) 42), (In, Integer)); (((*A*) 84), (In, (Derived_Type ((*Action*) 31)))); (((*Cur_Piece_D*) 52), (In, (Derived_Type ((*Direction*) 11)))); (((*B*) 41), (In, (Array_Type ((*Board*) 7)))); (((*Cur_Piece_S*) 56), (In, (Subtype ((*Shape*) 2)))); (((*Y*) 59), (In, (Subtype ((*I_Delta*) 20)))); (((*D*) 75), (In, (Derived_Type ((*Direction*) 11)))); (((*R*) 47), (Out, Boolean)); (((*Del_Line*) 69), (In_Out, (Subtype ((*Y_Coord*) 5)))); (((*R*) 60), (Out, Boolean)); (((*X*) 63), (In_Out, (Subtype ((*I_Delta*) 20)))); (((*P*) 73), (In, (Record_Type ((*Piece*) 12)))); (((*B*) 50), (In, (Array_Type ((*Board*) 7)))); (((*R*) 77), (Out, (Derived_Type ((*Direction*) 11)))); (((*R*) 44), (Out, Boolean)); (((*R*) 83), (Out, (Record_Type ((*Piece*) 12)))); (((*Cur_Piece_D*) 57), (In, (Derived_Type ((*Direction*) 11)))); (((*Y*) 62), (In_Out, (Subtype ((*I_Delta*) 20)))); (((*R*) 74), (Out, Boolean)); (((*L*) 46), (In, (Array_Type ((*Line*) 6)))); (((*R*) 80), (Out, Boolean)); (((*Empty_Line*) 66), (In_Out, (Array_Type ((*Line*) 6)))); (((*A*) 79), (In, (Derived_Type ((*Action*) 31)))); (((*P*) 78), (In, (Record_Type ((*Piece*) 12)))); (((*R*) 71), (In_Out, Boolean)); (((*Cur_Piece*) 17), (In_Out, (Record_Type ((*Piece*) 12))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Possible_Three_Shapes*) 25), (0, mkprocBodyDecl (
 127,
  (* = = = Procedure Name = = = *)
  ((*Possible_Three_Shapes*) 25),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 128; parameter_name = ((*Cur_Piece_S*) 56); parameter_subtype_mark = (Subtype ((*Shape*) 2)); parameter_mode = In }; 
{ parameter_astnum = 129; parameter_name = ((*Cur_Piece_D*) 57); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = In }; 
{ parameter_astnum = 130; parameter_name = ((*X*) 58); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
{ parameter_astnum = 131; parameter_name = ((*Y*) 59); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
{ parameter_astnum = 132; parameter_name = ((*R*) 60); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (133, (Identifier (134, ((*R*) 60) )), (Literal (135, (Boolean_Literal true) ))))
))); (((*Do_Action*) 37), (0, mkprocBodyDecl (
 693,
  (* = = = Procedure Name = = = *)
  ((*Do_Action*) 37),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 694; parameter_name = ((*A*) 84); parameter_subtype_mark = (Derived_Type ((*Action*) 31)); parameter_mode = In }; 
{ parameter_astnum = 695; parameter_name = ((*Success*) 85); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDecl (696,
  (ObjDecl (697, { declaration_astnum = 698; object_name = ((*Candidate*) 86); object_nominal_subtype = (Record_Type ((*Piece*) 12)); initialization_exp = None })),
  (SeqDecl (699,
  (ObjDecl (700, { declaration_astnum = 701; object_name = ((*Is_Move_OK*) 87); object_nominal_subtype = Boolean; initialization_exp = None })),
  (ObjDecl (702, { declaration_astnum = 703; object_name = ((*Is_No_Overlap*) 88); object_nominal_subtype = Boolean; initialization_exp = None })))))),
  (* = = = Procedure Body = = = *)
  (Seq (704,
  (Call (705, 706, ((*Move_Is_Possible*) 35), 
    [(Name (707, (Identifier (708, ((*Cur_Piece*) 17) )))); (Name (709, (Identifier (710, ((*A*) 84) )))); (Name (711, (Identifier (712, ((*Is_Move_OK*) 87) ))))])
  ),
  (Seq (713,
  (If (714, (Name (715, (Identifier (716, ((*Is_Move_OK*) 87) )))),
    (Seq (717,
    (Call (718, 719, ((*Move*) 36), 
      [(Name (720, (Identifier (721, ((*Cur_Piece*) 17) )))); (Name (722, (Identifier (723, ((*A*) 84) )))); (Name (724, (Identifier (725, ((*Candidate*) 86) ))))])
    ),
    (Seq (726,
    (Call (727, 728, ((*No_Overlap*) 30), 
      [(Name (729, (Identifier (730, ((*Cur_Board*) 8) )))); (Name (731, (Identifier (732, ((*Candidate*) 86) )))); (Name (733, (Identifier (734, ((*Is_No_Overlap*) 88) ))))])
    ),
    (If (735, (Name (736, (Identifier (737, ((*Is_No_Overlap*) 88) )))),
      (Seq (738,
      (Assign (739, (Identifier (740, ((*Cur_Piece*) 17) )), (Name (741, (Identifier (742, ((*Candidate*) 86) )))))),
      (Seq (743,
      (Assign (744, (Identifier (745, ((*Success*) 85) )), (Literal (746, (Boolean_Literal true) )))),
      Null (* Ignore Return Statement ! *))))),
      Null)
    ))))),
    Null)
  ),
  (Assign (747, (Identifier (748, ((*Success*) 85) )), (Literal (749, (Boolean_Literal false) ))))))))
))); (((*No_Complete_Lines*) 29), (0, mkprocBodyDecl (
 109,
  (* = = = Procedure Name = = = *)
  ((*No_Complete_Lines*) 29),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 110; parameter_name = ((*B*) 50); parameter_subtype_mark = (Array_Type ((*Board*) 7)); parameter_mode = In }; 
{ parameter_astnum = 111; parameter_name = ((*R*) 51); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (112, (Identifier (113, ((*R*) 51) )), (Literal (114, (Boolean_Literal true) ))))
))); (((*Is_Complete_Line*) 27), (0, mkprocBodyDecl (
 93,
  (* = = = Procedure Name = = = *)
  ((*Is_Complete_Line*) 27),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 94; parameter_name = ((*L*) 46); parameter_subtype_mark = (Array_Type ((*Line*) 6)); parameter_mode = In }; 
{ parameter_astnum = 95; parameter_name = ((*R*) 47); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (96, (Identifier (97, ((*R*) 47) )), (Literal (98, (Boolean_Literal true) ))))
))); (((*Is_Empty*) 26), (0, mkprocBodyDecl (
 83,
  (* = = = Procedure Name = = = *)
  ((*Is_Empty*) 26),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 84; parameter_name = ((*B*) 41); parameter_subtype_mark = (Array_Type ((*Board*) 7)); parameter_mode = In }; 
{ parameter_astnum = 85; parameter_name = ((*Y*) 42); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 86; parameter_name = ((*X*) 43); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 87; parameter_name = ((*R*) 44); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (88, (Identifier (89, ((*R*) 44) )), (Literal (90, (Boolean_Literal true) ))))
))); (((*No_Overlap*) 30), (0, mkprocBodyDecl (
 499,
  (* = = = Procedure Name = = = *)
  ((*No_Overlap*) 30),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 500; parameter_name = ((*B*) 72); parameter_subtype_mark = (Array_Type ((*Board*) 7)); parameter_mode = In }; 
{ parameter_astnum = 501; parameter_name = ((*P*) 73); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = In }; 
{ parameter_astnum = 502; parameter_name = ((*R*) 74); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (503, (Identifier (504, ((*R*) 74) )), (Literal (505, (Boolean_Literal true) ))))
))); (((*Possible_I_Shapes*) 24), (0, mkprocBodyDecl (
 117,
  (* = = = Procedure Name = = = *)
  ((*Possible_I_Shapes*) 24),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 118; parameter_name = ((*Cur_Piece_D*) 52); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = In }; 
{ parameter_astnum = 119; parameter_name = ((*X*) 53); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
{ parameter_astnum = 120; parameter_name = ((*Y*) 54); parameter_subtype_mark = (Subtype ((*I_Delta*) 20)); parameter_mode = In }; 
{ parameter_astnum = 121; parameter_name = ((*R*) 55); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (122, (Identifier (123, ((*R*) 55) )), (Literal (124, (Boolean_Literal true) ))))
))); (((*Include_Piece_In_Board*) 38), (0, mkprocBodyDecl (
 138,
  (* = = = Procedure Name = = = *)
  ((*Include_Piece_In_Board*) 38),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  (SeqDecl (139,
  (ObjDecl (141, { declaration_astnum = 142; object_name = ((*Y*) 62); object_nominal_subtype = (Subtype ((*I_Delta*) 20)); initialization_exp = (Some ((Literal (140, (Integer_Literal 0) )))) })),
  (SeqDecl (143,
  (ObjDecl (145, { declaration_astnum = 146; object_name = ((*X*) 63); object_nominal_subtype = (Subtype ((*I_Delta*) 20)); initialization_exp = (Some ((Literal (144, (Integer_Literal 0) )))) })),
  (ObjDecl (147, { declaration_astnum = 148; object_name = ((*R*) 64); object_nominal_subtype = Boolean; initialization_exp = None })))))),
  (* = = = Procedure Body = = = *)
  (Seq (149,
  (If (150, (BinOp (151, Equal, (Name (152, (SelectedComponent (153, (Identifier (154, ((*Cur_Piece*) 17) )), ((*S*) 13) )))), (Literal (156, (Integer_Literal 2) )) )),
    (Seq (157,
    (Assign (158, (IndexedComponent (159, (IndexedComponent (160, (Identifier (161, ((*Cur_Board*) 8) )), (Name (162, (SelectedComponent (163, (Identifier (164, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))) )), (Name (166, (SelectedComponent (167, (Identifier (168, ((*Cur_Piece*) 17) )), ((*X*) 15) )))) )), (Name (170, (SelectedComponent (171, (Identifier (172, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
    (Seq (174,
    (Assign (175, (IndexedComponent (176, (IndexedComponent (177, (Identifier (178, ((*Cur_Board*) 8) )), (BinOp (179, Plus, (Name (180, (SelectedComponent (181, (Identifier (182, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Literal (184, (Integer_Literal 1) )) )) )), (Name (185, (SelectedComponent (186, (Identifier (187, ((*Cur_Piece*) 17) )), ((*X*) 15) )))) )), (Name (189, (SelectedComponent (190, (Identifier (191, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
    (Seq (193,
    (Assign (194, (IndexedComponent (195, (IndexedComponent (196, (Identifier (197, ((*Cur_Board*) 8) )), (Name (198, (SelectedComponent (199, (Identifier (200, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))) )), (BinOp (202, Plus, (Name (203, (SelectedComponent (204, (Identifier (205, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Literal (207, (Integer_Literal 1) )) )) )), (Name (208, (SelectedComponent (209, (Identifier (210, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
    (Assign (212, (IndexedComponent (213, (IndexedComponent (214, (Identifier (215, ((*Cur_Board*) 8) )), (BinOp (216, Plus, (Name (217, (SelectedComponent (218, (Identifier (219, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Literal (221, (Integer_Literal 1) )) )) )), (BinOp (222, Plus, (Name (223, (SelectedComponent (224, (Identifier (225, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Literal (227, (Integer_Literal 1) )) )) )), (Name (228, (SelectedComponent (229, (Identifier (230, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))))))))),
    (If (232, (BinOp (233, Equal, (Name (234, (SelectedComponent (235, (Identifier (236, ((*Cur_Piece*) 17) )), ((*S*) 13) )))), (Literal (238, (Integer_Literal 1) )) )),
      (While (239, (BinOp (240, Less_Than_Or_Equal, (Name (241, (Identifier (242, ((*Y*) 62) )))), (Literal (243, (Integer_Literal 3) )) )),
        (Seq (244,
        (While (245, (BinOp (246, Less_Than_Or_Equal, (Name (247, (Identifier (248, ((*X*) 63) )))), (Literal (249, (Integer_Literal 3) )) )),
          (Seq (250,
          (Call (251, 252, ((*Possible_I_Shapes*) 24), 
            [(Name (253, (SelectedComponent (254, (Identifier (255, ((*Cur_Piece*) 17) )), ((*D*) 14) )))); (Name (257, (Identifier (258, ((*Y*) 62) )))); (Name (259, (Identifier (260, ((*X*) 63) )))); (Name (261, (Identifier (262, ((*R*) 64) ))))])
          ),
          (Seq (263,
          (If (264, (Name (265, (Identifier (266, ((*R*) 64) )))),
            (Assign (267, (IndexedComponent (268, (IndexedComponent (269, (Identifier (270, ((*Cur_Board*) 8) )), (BinOp (271, Plus, (Name (272, (SelectedComponent (273, (Identifier (274, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Name (276, (Identifier (277, ((*Y*) 62) )))) )) )), (BinOp (278, Plus, (Name (279, (SelectedComponent (280, (Identifier (281, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Name (283, (Identifier (284, ((*X*) 63) )))) )) )), (Name (285, (SelectedComponent (286, (Identifier (287, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
            Null)
          ),
          (Assign (289, (Identifier (290, ((*X*) 63) )), (BinOp (291, Plus, (Name (292, (Identifier (293, ((*X*) 63) )))), (Literal (294, (Integer_Literal 1) )) )))))))))
        ),
        (Assign (295, (Identifier (296, ((*Y*) 62) )), (BinOp (297, Plus, (Name (298, (Identifier (299, ((*Y*) 62) )))), (Literal (300, (Integer_Literal 1) )) )))))))
      ),
      (While (301, (BinOp (302, Less_Than_Or_Equal, (Name (303, (Identifier (304, ((*Y*) 62) )))), (Literal (305, (Integer_Literal 2) )) )),
        (Seq (306,
        (While (307, (BinOp (308, Less_Than_Or_Equal, (Name (309, (Identifier (310, ((*X*) 63) )))), (Literal (311, (Integer_Literal 2) )) )),
          (Seq (312,
          (Call (313, 314, ((*Possible_Three_Shapes*) 25), 
            [(Name (315, (SelectedComponent (316, (Identifier (317, ((*Cur_Piece*) 17) )), ((*S*) 13) )))); (Name (319, (SelectedComponent (320, (Identifier (321, ((*Cur_Piece*) 17) )), ((*D*) 14) )))); (Name (323, (Identifier (324, ((*Y*) 62) )))); (Name (325, (Identifier (326, ((*X*) 63) )))); (Name (327, (Identifier (328, ((*R*) 64) ))))])
          ),
          (Seq (329,
          (If (330, (Name (331, (Identifier (332, ((*R*) 64) )))),
            (Assign (333, (IndexedComponent (334, (IndexedComponent (335, (Identifier (336, ((*Cur_Board*) 8) )), (BinOp (337, Plus, (Name (338, (SelectedComponent (339, (Identifier (340, ((*Cur_Piece*) 17) )), ((*Y*) 16) )))), (Name (342, (Identifier (343, ((*Y*) 62) )))) )) )), (BinOp (344, Plus, (Name (345, (SelectedComponent (346, (Identifier (347, ((*Cur_Piece*) 17) )), ((*X*) 15) )))), (Name (349, (Identifier (350, ((*X*) 63) )))) )) )), (Name (351, (SelectedComponent (352, (Identifier (353, ((*Cur_Piece*) 17) )), ((*S*) 13) )))))),
            Null)
          ),
          (Assign (355, (Identifier (356, ((*X*) 63) )), (BinOp (357, Plus, (Name (358, (Identifier (359, ((*X*) 63) )))), (Literal (360, (Integer_Literal 1) )) )))))))))
        ),
        (Assign (361, (Identifier (362, ((*Y*) 62) )), (BinOp (363, Plus, (Name (364, (Identifier (365, ((*Y*) 62) )))), (Literal (366, (Integer_Literal 1) )) )))))))
      ))
    ))
  ),
  (Assign (367, (Identifier (368, ((*Cur_State*) 19) )), (Literal (369, (Integer_Literal 2) ))))))
))); (((*Is_Empty_Line*) 28), (0, mkprocBodyDecl (
 101,
  (* = = = Procedure Name = = = *)
  ((*Is_Empty_Line*) 28),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 102; parameter_name = ((*L*) 48); parameter_subtype_mark = (Array_Type ((*Line*) 6)); parameter_mode = In }; 
{ parameter_astnum = 103; parameter_name = ((*R*) 49); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (Assign (104, (Identifier (105, ((*R*) 49) )), (Literal (106, (Boolean_Literal true) ))))
))); (((*Move_Is_Possible*) 35), (0, mkprocBodyDecl (
 547,
  (* = = = Procedure Name = = = *)
  ((*Move_Is_Possible*) 35),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 548; parameter_name = ((*P*) 78); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = In }; 
{ parameter_astnum = 549; parameter_name = ((*A*) 79); parameter_subtype_mark = (Derived_Type ((*Action*) 31)); parameter_mode = In }; 
{ parameter_astnum = 550; parameter_name = ((*R*) 80); parameter_subtype_mark = Boolean; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (If (551, (BinOp (552, Equal, (Name (553, (Identifier (554, ((*A*) 79) )))), (Literal (555, (Integer_Literal 0) )) )),
    (Assign (556, (Identifier (557, ((*R*) 80) )), (BinOp (558, And, (BinOp (559, Greater_Than_Or_Equal, (BinOp (560, Minus, (Name (561, (SelectedComponent (562, (Identifier (563, ((*P*) 78) )), ((*X*) 15) )))), (Literal (565, (Integer_Literal 1) )) )), (UnOp (566, Unary_Minus, (Literal (567, (Integer_Literal 1) )) )) )), (BinOp (568, Less_Than_Or_Equal, (BinOp (569, Minus, (Name (570, (SelectedComponent (571, (Identifier (572, ((*P*) 78) )), ((*X*) 15) )))), (Literal (574, (Integer_Literal 1) )) )), (Literal (575, (Integer_Literal 9) )) )) )))),
    (If (576, (BinOp (577, Equal, (Name (578, (Identifier (579, ((*A*) 79) )))), (Literal (580, (Integer_Literal 1) )) )),
      (Assign (581, (Identifier (582, ((*R*) 80) )), (BinOp (583, And, (BinOp (584, Greater_Than_Or_Equal, (BinOp (585, Plus, (Name (586, (SelectedComponent (587, (Identifier (588, ((*P*) 78) )), ((*X*) 15) )))), (Literal (590, (Integer_Literal 1) )) )), (UnOp (591, Unary_Minus, (Literal (592, (Integer_Literal 1) )) )) )), (BinOp (593, Less_Than_Or_Equal, (BinOp (594, Plus, (Name (595, (SelectedComponent (596, (Identifier (597, ((*P*) 78) )), ((*X*) 15) )))), (Literal (599, (Integer_Literal 1) )) )), (Literal (600, (Integer_Literal 9) )) )) )))),
      (If (601, (BinOp (602, Equal, (Name (603, (Identifier (604, ((*A*) 79) )))), (Literal (605, (Integer_Literal 2) )) )),
        (Assign (606, (Identifier (607, ((*R*) 80) )), (BinOp (608, And, (BinOp (609, Greater_Than_Or_Equal, (BinOp (610, Plus, (Name (611, (SelectedComponent (612, (Identifier (613, ((*P*) 78) )), ((*Y*) 16) )))), (Literal (615, (Integer_Literal 1) )) )), (UnOp (616, Unary_Minus, (Literal (617, (Integer_Literal 1) )) )) )), (BinOp (618, Less_Than_Or_Equal, (BinOp (619, Plus, (Name (620, (SelectedComponent (621, (Identifier (622, ((*P*) 78) )), ((*Y*) 16) )))), (Literal (624, (Integer_Literal 1) )) )), (Literal (625, (Integer_Literal 49) )) )) )))),
        (Assign (626, (Identifier (627, ((*R*) 80) )), (Literal (628, (Boolean_Literal true) )))))
      ))
    ))
  )
))); (((*Turn_Direction*) 34), (0, mkprocBodyDecl (
 508,
  (* = = = Procedure Name = = = *)
  ((*Turn_Direction*) 34),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 509; parameter_name = ((*D*) 75); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = In }; 
{ parameter_astnum = 510; parameter_name = ((*T*) 76); parameter_subtype_mark = (Subtype ((*Turn_Action*) 33)); parameter_mode = In }; 
{ parameter_astnum = 511; parameter_name = ((*R*) 77); parameter_subtype_mark = (Derived_Type ((*Direction*) 11)); parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (If (512, (BinOp (513, Equal, (Name (514, (Identifier (515, ((*T*) 76) )))), (Literal (516, (Integer_Literal 3) )) )),
    (If (517, (BinOp (518, Equal, (Name (519, (Identifier (520, ((*D*) 75) )))), (Literal (521, (Integer_Literal 0) )) )),
      (Assign (522, (Identifier (523, ((*R*) 77) )), (Literal (524, (Integer_Literal 3) )))),
      (Assign (525, (Identifier (526, ((*R*) 77) )), (BinOp (527, Minus, (Name (528, (Identifier (529, ((*D*) 75) )))), (Literal (530, (Integer_Literal 1) )) )))))
    ),
    (If (531, (BinOp (532, Equal, (Name (533, (Identifier (534, ((*D*) 75) )))), (Literal (535, (Integer_Literal 3) )) )),
      (Assign (536, (Identifier (537, ((*R*) 77) )), (Literal (538, (Integer_Literal 0) )))),
      (Assign (539, (Identifier (540, ((*R*) 77) )), (BinOp (541, Plus, (Name (542, (Identifier (543, ((*D*) 75) )))), (Literal (544, (Integer_Literal 1) )) )))))
    ))
  )
))); (((*Move*) 36), (0, mkprocBodyDecl (
 631,
  (* = = = Procedure Name = = = *)
  ((*Move*) 36),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 632; parameter_name = ((*P*) 81); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = In }; 
{ parameter_astnum = 633; parameter_name = ((*A*) 82); parameter_subtype_mark = (Derived_Type ((*Action*) 31)); parameter_mode = In }; 
{ parameter_astnum = 634; parameter_name = ((*R*) 83); parameter_subtype_mark = (Record_Type ((*Piece*) 12)); parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  NullDecl,
  (* = = = Procedure Body = = = *)
  (If (635, (BinOp (636, Equal, (Name (637, (Identifier (638, ((*A*) 82) )))), (Literal (639, (Integer_Literal 0) )) )),
    (Assign (640, (SelectedComponent (641, (Identifier (642, ((*R*) 83) )), ((*X*) 15) )), (BinOp (644, Minus, (Name (645, (SelectedComponent (646, (Identifier (647, ((*P*) 81) )), ((*X*) 15) )))), (Literal (649, (Integer_Literal 1) )) )))),
    (If (650, (BinOp (651, Equal, (Name (652, (Identifier (653, ((*A*) 82) )))), (Literal (654, (Integer_Literal 1) )) )),
      (Assign (655, (SelectedComponent (656, (Identifier (657, ((*R*) 83) )), ((*X*) 15) )), (BinOp (659, Plus, (Name (660, (SelectedComponent (661, (Identifier (662, ((*P*) 81) )), ((*X*) 15) )))), (Literal (664, (Integer_Literal 1) )) )))),
      (If (665, (BinOp (666, Equal, (Name (667, (Identifier (668, ((*A*) 82) )))), (Literal (669, (Integer_Literal 2) )) )),
        (Assign (670, (SelectedComponent (671, (Identifier (672, ((*R*) 83) )), ((*Y*) 16) )), (BinOp (674, Plus, (Name (675, (SelectedComponent (676, (Identifier (677, ((*P*) 81) )), ((*Y*) 16) )))), (Literal (679, (Integer_Literal 1) )) )))),
        (Call (680, 681, ((*Turn_Direction*) 34), 
          [(Name (682, (SelectedComponent (683, (Identifier (684, ((*P*) 81) )), ((*D*) 14) )))); (Name (686, (Identifier (687, ((*A*) 82) )))); (Name (688, (SelectedComponent (689, (Identifier (690, ((*R*) 83) )), ((*D*) 14) ))))])
        ))
      ))
    ))
  )
))); (((*Delete_Complete_Lines*) 39), (0, mkprocBodyDecl (
 372,
  (* = = = Procedure Name = = = *)
  ((*Delete_Complete_Lines*) 39),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  (SeqDecl (373,
  (ObjDecl (374, { declaration_astnum = 375; object_name = ((*Empty_Line*) 66); object_nominal_subtype = (Array_Type ((*Line*) 6)); initialization_exp = None })),
  (SeqDecl (376,
  (ObjDecl (378, { declaration_astnum = 379; object_name = ((*To_Line*) 67); object_nominal_subtype = (Subtype ((*Y_Coord*) 5)); initialization_exp = (Some ((Literal (377, (Integer_Literal 10) )))) })),
  (SeqDecl (380,
  (ObjDecl (382, { declaration_astnum = 383; object_name = ((*Has_Complete_Lines*) 68); object_nominal_subtype = Boolean; initialization_exp = (Some ((Literal (381, (Boolean_Literal false) )))) })),
  (SeqDecl (384,
  (ObjDecl (386, { declaration_astnum = 387; object_name = ((*Del_Line*) 69); object_nominal_subtype = (Subtype ((*Y_Coord*) 5)); initialization_exp = (Some ((Literal (385, (Integer_Literal 1) )))) })),
  (SeqDecl (388,
  (ObjDecl (389, { declaration_astnum = 390; object_name = ((*From_Line*) 70); object_nominal_subtype = (Subtype ((*Y_Coord*) 5)); initialization_exp = None })),
  (ObjDecl (391, { declaration_astnum = 392; object_name = ((*R*) 71); object_nominal_subtype = Boolean; initialization_exp = None })))))))))))),
  (* = = = Procedure Body = = = *)
  (Seq (393,
  (While (394, (BinOp (395, Less_Than_Or_Equal, (Name (396, (Identifier (397, ((*Del_Line*) 69) )))), (Literal (398, (Integer_Literal 50) )) )),
    (Seq (399,
    (Call (400, 401, ((*Is_Complete_Line*) 27), 
      [(Name (402, (IndexedComponent (403, (Identifier (404, ((*Cur_Board*) 8) )), (Name (405, (Identifier (406, ((*Del_Line*) 69) )))) )))); (Name (407, (Identifier (408, ((*R*) 71) ))))])
    ),
    (Seq (409,
    (If (410, (Name (411, (Identifier (412, ((*R*) 71) )))),
      (Seq (413,
      (Assign (414, (IndexedComponent (415, (Identifier (416, ((*Cur_Board*) 8) )), (Name (417, (Identifier (418, ((*Del_Line*) 69) )))) )), (Name (419, (Identifier (420, ((*Empty_Line*) 66) )))))),
      (Seq (421,
      (Assign (422, (Identifier (423, ((*Has_Complete_Lines*) 68) )), (Literal (424, (Boolean_Literal true) )))),
      (Assign (425, (Identifier (426, ((*To_Line*) 67) )), (Name (427, (Identifier (428, ((*Del_Line*) 69) )))))))))),
      Null)
    ),
    (Assign (429, (Identifier (430, ((*Del_Line*) 69) )), (BinOp (431, Plus, (Name (432, (Identifier (433, ((*Del_Line*) 69) )))), (Literal (434, (Integer_Literal 1) )) )))))))))
  ),
  (Seq (435,
  (If (436, (Name (437, (Identifier (438, ((*Has_Complete_Lines*) 68) )))),
    (Seq (439,
    (Assign (440, (Identifier (441, ((*From_Line*) 70) )), (Literal (442, (Integer_Literal 9) )))),
    (While (443, (BinOp (444, Greater_Than_Or_Equal, (Name (445, (Identifier (446, ((*From_Line*) 70) )))), (Literal (447, (Integer_Literal 1) )) )),
      (Seq (448,
      (Call (449, 450, ((*Is_Empty_Line*) 28), 
        [(Name (451, (IndexedComponent (452, (Identifier (453, ((*Cur_Board*) 8) )), (Name (454, (Identifier (455, ((*From_Line*) 70) )))) )))); (Name (456, (Identifier (457, ((*R*) 71) ))))])
      ),
      (Seq (458,
      (If (459, (UnOp (460, Not, (Name (461, (Identifier (462, ((*R*) 71) )))) )),
        (Seq (463,
        (Assign (464, (IndexedComponent (465, (Identifier (466, ((*Cur_Board*) 8) )), (Name (467, (Identifier (468, ((*To_Line*) 67) )))) )), (Name (469, (IndexedComponent (470, (Identifier (471, ((*Cur_Board*) 8) )), (Name (472, (Identifier (473, ((*From_Line*) 70) )))) )))))),
        (Seq (474,
        (Assign (475, (IndexedComponent (476, (Identifier (477, ((*Cur_Board*) 8) )), (Name (478, (Identifier (479, ((*From_Line*) 70) )))) )), (Name (480, (Identifier (481, ((*Empty_Line*) 66) )))))),
        (Assign (482, (Identifier (483, ((*To_Line*) 67) )), (BinOp (484, Minus, (Name (485, (Identifier (486, ((*To_Line*) 67) )))), (Literal (487, (Integer_Literal 1) )) )))))))),
        Null)
      ),
      (Assign (488, (Identifier (489, ((*From_Line*) 70) )), (BinOp (490, Minus, (Name (491, (Identifier (492, ((*From_Line*) 70) )))), (Literal (493, (Integer_Literal 1) )) )))))))))
    ))),
    Null)
  ),
  (Assign (494, (Identifier (495, ((*Cur_State*) 19) )), (Literal (496, (Integer_Literal 3) ))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Oriented_Three_Shape*) 23), (ArrayTypeDecl (59, ((*Oriented_Three_Shape*) 23), ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))), ((*component type*) Boolean)))); (((*Y_Coord*) 5), (SubtypeDecl (16, ((*Y_Coord*) 5), Integer, (Range (1, 50))))); (((*Board*) 7), (ArrayTypeDecl (22, ((*Board*) 7), ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))), ((*component type*) (Array_Type ((*Line*) 6)))))); (((*Move_Action*) 32), (SubtypeDecl (72, ((*Move_Action*) 32), (Derived_Type ((*Action*) 31)), (Range (0, 1))))); (((*Cell*) 1), (DerivedTypeDecl (4, ((*Cell*) 1), Integer, (Range (0, 8))))); (((*Line*) 6), (ArrayTypeDecl (19, ((*Line*) 6), ((*index subtype mark*) (Subtype ((*X_Coord*) 4))), ((*component type*) (Derived_Type ((*Cell*) 1)))))); (((*PY_Coord*) 10), (SubtypeDecl (31, ((*PY_Coord*) 10), Integer, (Range ((-1), 49))))); (((*Oriented_I_Shape*) 21), (ArrayTypeDecl (53, ((*Oriented_I_Shape*) 21), ((*index subtype mark*) (Subtype ((*I_Delta*) 20))), ((*component type*) Boolean)))); (((*Action*) 31), (DerivedTypeDecl (69, ((*Action*) 31), Integer, (Range (0, 4))))); (((*Direction*) 11), (DerivedTypeDecl (34, ((*Direction*) 11), Integer, (Range (0, 3))))); (((*Piece*) 12), (RecordTypeDecl (37, ((*Piece*) 12), [(((*S*) 13), (Subtype ((*Shape*) 2))); (((*D*) 14), (Derived_Type ((*Direction*) 11))); (((*X*) 15), (Subtype ((*PX_Coord*) 9))); (((*Y*) 16), (Subtype ((*PY_Coord*) 10)))]))); (((*Shape*) 2), (SubtypeDecl (7, ((*Shape*) 2), (Derived_Type ((*Cell*) 1)), (Range (1, 8))))); (((*I_Delta*) 20), (SubtypeDecl (50, ((*I_Delta*) 20), Integer, (Range (0, 3))))); (((*State*) 18), (DerivedTypeDecl (44, ((*State*) 18), Integer, (Range (0, 3))))); (((*X_Coord*) 4), (SubtypeDecl (13, ((*X_Coord*) 4), Integer, (Range (1, 10))))); (((*Turn_Action*) 33), (SubtypeDecl (75, ((*Turn_Action*) 33), (Derived_Type ((*Action*) 31)), (Range (3, 4))))); (((*Three_Delta*) 22), (SubtypeDecl (56, ((*Three_Delta*) 22), Integer, (Range (0, 2))))); (((*Three_Shape*) 3), (SubtypeDecl (10, ((*Three_Shape*) 3), (Derived_Type ((*Cell*) 1)), (Range (3, 8))))); (((*PX_Coord*) 9), (SubtypeDecl (28, ((*PX_Coord*) 9), Integer, (Range ((-1), 9)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(218, (Subtype ((*PY_Coord*) 10))); (559, Boolean); (227, Integer); (568, Boolean); (433, (Subtype ((*Y_Coord*) 5))); (442, Integer); (200, (Record_Type ((*Piece*) 12))); (173, (Subtype ((*Shape*) 2))); (514, (Subtype ((*Turn_Action*) 33))); (209, (Subtype ((*Shape*) 2))); (523, (Derived_Type ((*Direction*) 11))); (182, (Record_Type ((*Piece*) 12))); (254, (Derived_Type ((*Direction*) 11))); (191, (Record_Type ((*Piece*) 12))); (720, (Record_Type ((*Piece*) 12))); (729, (Array_Type ((*Board*) 7))); (424, Boolean); (155, (Subtype ((*Shape*) 2))); (469, (Array_Type ((*Line*) 6))); (496, Integer); (164, (Record_Type ((*Piece*) 12))); (478, (Subtype ((*Y_Coord*) 5))); (505, Boolean); (577, Boolean); (451, (Array_Type ((*Line*) 6))); (460, Boolean); (532, Boolean); (541, (Derived_Type ((*Direction*) 11))); (406, (Subtype ((*Y_Coord*) 5))); (415, (Array_Type ((*Line*) 6))); (487, Integer); (236, (Record_Type ((*Piece*) 12))); (741, (Record_Type ((*Piece*) 12))); (678, (Subtype ((*PY_Coord*) 10))); (445, (Subtype ((*Y_Coord*) 5))); (732, (Record_Type ((*Piece*) 12))); (472, (Subtype ((*Y_Coord*) 5))); (427, (Subtype ((*Y_Coord*) 5))); (176, (Derived_Type ((*Cell*) 1))); (723, (Derived_Type ((*Action*) 31))); (418, (Subtype ((*Y_Coord*) 5))); (490, Integer); (185, (Subtype ((*PX_Coord*) 9))); (167, (Subtype ((*PX_Coord*) 9))); (364, (Subtype ((*I_Delta*) 20))); (140, Integer); (113, Boolean); (454, (Subtype ((*Y_Coord*) 5))); (481, (Array_Type ((*Line*) 6))); (687, (Derived_Type ((*Action*) 31))); (660, (Subtype ((*PX_Coord*) 9))); (346, (Subtype ((*PX_Coord*) 9))); (669, Integer); (708, (Record_Type ((*Piece*) 12))); (403, (Array_Type ((*Line*) 6))); (134, Boolean); (600, Integer); (609, Boolean); (690, (Record_Type ((*Piece*) 12))); (349, (Subtype ((*I_Delta*) 20))); (358, (Subtype ((*I_Delta*) 20))); (430, (Subtype ((*Y_Coord*) 5))); (672, (Record_Type ((*Piece*) 12))); (645, (Subtype ((*PX_Coord*) 9))); (331, Boolean); (304, (Subtype ((*I_Delta*) 20))); (654, Integer); (340, (Record_Type ((*Piece*) 12))); (89, Boolean); (286, (Subtype ((*Shape*) 2))); (627, Boolean); (636, Boolean); (457, Boolean); (663, (Subtype ((*PX_Coord*) 9))); (98, Boolean); (412, Boolean); (618, Boolean); (322, (Derived_Type ((*Direction*) 11))); (385, Integer); (567, Integer); (639, Integer); (648, (Subtype ((*PX_Coord*) 9))); (397, (Subtype ((*Y_Coord*) 5))); (262, Boolean); (603, (Derived_Type ((*Action*) 31))); (298, (Subtype ((*I_Delta*) 20))); (711, Boolean); (684, (Record_Type ((*Piece*) 12))); (343, (Subtype ((*I_Delta*) 20))); (352, (Subtype ((*Shape*) 2))); (558, Boolean); (585, Integer); (253, (Derived_Type ((*Direction*) 11))); (226, (Subtype ((*PX_Coord*) 9))); (594, Integer); (666, Boolean); (325, (Subtype ((*I_Delta*) 20))); (675, (Subtype ((*PY_Coord*) 10))); (334, (Derived_Type ((*Cell*) 1))); (540, (Derived_Type ((*Direction*) 11))); (235, (Subtype ((*Shape*) 2))); (621, (Subtype ((*PY_Coord*) 10))); (657, (Record_Type ((*Piece*) 12))); (316, (Subtype ((*Shape*) 2))); (271, Integer); (612, (Subtype ((*PY_Coord*) 10))); (280, (Subtype ((*PX_Coord*) 9))); (319, (Derived_Type ((*Direction*) 11))); (516, Integer); (552, Boolean); (184, Integer); (534, (Derived_Type ((*Direction*) 11))); (597, (Record_Type ((*Piece*) 12))); (265, Boolean); (615, Integer); (480, (Array_Type ((*Line*) 6))); (256, (Derived_Type ((*Direction*) 11))); (337, Integer); (211, (Subtype ((*Shape*) 2))); (283, (Subtype ((*I_Delta*) 20))); (624, Integer); (292, (Subtype ((*I_Delta*) 20))); (166, (Subtype ((*PX_Coord*) 9))); (579, (Derived_Type ((*Action*) 31))); (274, (Record_Type ((*Piece*) 12))); (247, (Subtype ((*I_Delta*) 20))); (588, (Record_Type ((*Piece*) 12))); (328, Boolean); (489, (Subtype ((*Y_Coord*) 5))); (220, (Subtype ((*PY_Coord*) 10))); (561, (Subtype ((*PX_Coord*) 9))); (229, (Subtype ((*Shape*) 2))); (543, (Derived_Type ((*Direction*) 11))); (570, (Subtype ((*PX_Coord*) 9))); (202, Integer); (238, Integer); (642, (Record_Type ((*Piece*) 12))); (651, Boolean); (310, (Subtype ((*I_Delta*) 20))); (277, (Subtype ((*I_Delta*) 20))); (483, (Subtype ((*Y_Coord*) 5))); (151, Boolean); (492, (Subtype ((*Y_Coord*) 5))); (223, (Subtype ((*PX_Coord*) 9))); (564, (Subtype ((*PX_Coord*) 9))); (259, (Subtype ((*I_Delta*) 20))); (573, (Subtype ((*PX_Coord*) 9))); (124, Boolean); (438, Boolean); (537, (Derived_Type ((*Direction*) 11))); (106, Boolean); (447, Integer); (205, (Record_Type ((*Piece*) 12))); (519, (Derived_Type ((*Direction*) 11))); (214, (Array_Type ((*Line*) 6))); (555, Integer); (528, (Derived_Type ((*Direction*) 11))); (420, (Array_Type ((*Line*) 6))); (160, (Array_Type ((*Line*) 6))); (169, (Subtype ((*PX_Coord*) 9))); (178, (Array_Type ((*Board*) 7))); (582, Boolean); (591, Integer); (456, Boolean); (465, (Array_Type ((*Line*) 6))); (187, (Record_Type ((*Piece*) 12))); (196, (Array_Type ((*Line*) 6))); (268, (Derived_Type ((*Cell*) 1))); (241, (Subtype ((*I_Delta*) 20))); (369, Integer); (441, (Subtype ((*Y_Coord*) 5))); (181, (Subtype ((*PY_Coord*) 10))); (163, (Subtype ((*PY_Coord*) 10))); (477, (Array_Type ((*Board*) 7))); (172, (Record_Type ((*Piece*) 12))); (513, Boolean); (432, (Subtype ((*Y_Coord*) 5))); (468, (Subtype ((*Y_Coord*) 5))); (199, (Subtype ((*PY_Coord*) 10))); (208, (Subtype ((*Shape*) 2))); (217, (Subtype ((*PY_Coord*) 10))); (683, (Derived_Type ((*Direction*) 11))); (423, Boolean); (495, (Derived_Type ((*State*) 18))); (190, (Subtype ((*Shape*) 2))); (504, Boolean); (737, Boolean); (396, (Subtype ((*Y_Coord*) 5))); (710, (Derived_Type ((*Action*) 31))); (746, Boolean); (405, (Subtype ((*Y_Coord*) 5))); (486, (Subtype ((*Y_Coord*) 5))); (154, (Record_Type ((*Piece*) 12))); (360, Integer); (740, (Record_Type ((*Piece*) 12))); (426, (Subtype ((*Y_Coord*) 5))); (408, Boolean); (300, Integer); (686, (Derived_Type ((*Action*) 31))); (623, (Subtype ((*PY_Coord*) 10))); (722, (Derived_Type ((*Action*) 31))); (381, Boolean); (354, (Subtype ((*Shape*) 2))); (471, (Array_Type ((*Board*) 7))); (677, (Record_Type ((*Piece*) 12))); (336, (Array_Type ((*Board*) 7))); (345, (Subtype ((*PX_Coord*) 9))); (641, (Subtype ((*PX_Coord*) 9))); (453, (Array_Type ((*Board*) 7))); (462, Boolean); (668, (Derived_Type ((*Action*) 31))); (363, Integer); (749, Boolean); (417, (Subtype ((*Y_Coord*) 5))); (444, Boolean); (309, (Subtype ((*I_Delta*) 20))); (659, Integer); (318, (Subtype ((*Shape*) 2))); (731, (Record_Type ((*Piece*) 12))); (327, Boolean); (357, Integer); (97, Boolean); (563, (Record_Type ((*Piece*) 12))); (653, (Derived_Type ((*Action*) 31))); (348, (Subtype ((*PX_Coord*) 9))); (734, Boolean); (402, (Array_Type ((*Line*) 6))); (294, Integer); (608, Boolean); (707, (Record_Type ((*Piece*) 12))); (644, Integer); (303, (Subtype ((*I_Delta*) 20))); (716, Boolean); (725, (Record_Type ((*Piece*) 12))); (411, Boolean); (276, (Subtype ((*I_Delta*) 20))); (249, Integer); (590, Integer); (285, (Subtype ((*Shape*) 2))); (258, (Subtype ((*I_Delta*) 20))); (599, Integer); (671, (Subtype ((*PY_Coord*) 10))); (339, (Subtype ((*PY_Coord*) 10))); (366, Integer); (572, (Record_Type ((*Piece*) 12))); (240, Boolean); (662, (Record_Type ((*Piece*) 12))); (321, (Record_Type ((*Piece*) 12))); (617, Integer); (689, (Derived_Type ((*Direction*) 11))); (521, Integer); (557, Boolean); (189, (Subtype ((*Shape*) 2))); (530, Integer); (225, (Record_Type ((*Piece*) 12))); (180, (Subtype ((*PY_Coord*) 10))); (674, Integer); (342, (Subtype ((*I_Delta*) 20))); (207, Integer); (216, Integer); (288, (Subtype ((*Shape*) 2))); (324, (Subtype ((*I_Delta*) 20))); (297, Integer); (638, (Derived_Type ((*Action*) 31))); (198, (Subtype ((*PY_Coord*) 10))); (270, (Array_Type ((*Board*) 7))); (584, Boolean); (611, (Subtype ((*PY_Coord*) 10))); (279, (Subtype ((*PX_Coord*) 9))); (593, Boolean); (620, (Subtype ((*PY_Coord*) 10))); (351, (Subtype ((*Shape*) 2))); (566, Integer); (261, Boolean); (234, (Subtype ((*Shape*) 2))); (575, Integer); (602, Boolean); (647, (Record_Type ((*Piece*) 12))); (243, Integer); (656, (Subtype ((*PX_Coord*) 9))); (315, (Subtype ((*Shape*) 2))); (282, (Subtype ((*PX_Coord*) 9))); (183, (Subtype ((*PY_Coord*) 10))); (587, (Subtype ((*PX_Coord*) 9))); (156, Integer); (255, (Record_Type ((*Piece*) 12))); (569, Integer); (596, (Subtype ((*PX_Coord*) 9))); (228, (Subtype ((*Shape*) 2))); (578, (Derived_Type ((*Action*) 31))); (461, Boolean); (470, (Array_Type ((*Line*) 6))); (452, (Array_Type ((*Line*) 6))); (479, (Subtype ((*Y_Coord*) 5))); (542, (Derived_Type ((*Direction*) 11))); (210, (Record_Type ((*Piece*) 12))); (560, Integer); (219, (Record_Type ((*Piece*) 12))); (291, Integer); (165, (Subtype ((*PY_Coord*) 10))); (515, (Subtype ((*Turn_Action*) 33))); (237, (Subtype ((*Shape*) 2))); (246, Boolean); (524, Integer); (192, (Subtype ((*Shape*) 2))); (533, (Derived_Type ((*Direction*) 11))); (201, (Subtype ((*PY_Coord*) 10))); (605, Integer); (273, (Subtype ((*PY_Coord*) 10))); (614, (Subtype ((*PY_Coord*) 10))); (186, (Subtype ((*PX_Coord*) 9))); (213, (Derived_Type ((*Cell*) 1))); (222, Integer); (437, Boolean); (168, (Record_Type ((*Piece*) 12))); (177, (Array_Type ((*Line*) 6))); (518, Boolean); (715, Boolean); (724, (Record_Type ((*Piece*) 12))); (733, Boolean); (159, (Derived_Type ((*Cell*) 1))); (473, (Subtype ((*Y_Coord*) 5))); (554, (Derived_Type ((*Action*) 31))); (105, Boolean); (419, (Array_Type ((*Line*) 6))); (446, (Subtype ((*Y_Coord*) 5))); (114, Boolean); (428, (Subtype ((*Y_Coord*) 5))); (455, (Subtype ((*Y_Coord*) 5))); (123, Boolean); (527, (Derived_Type ((*Direction*) 11))); (195, (Derived_Type ((*Cell*) 1))); (204, (Subtype ((*PX_Coord*) 9))); (742, (Record_Type ((*Piece*) 12))); (491, (Subtype ((*Y_Coord*) 5))); (231, (Subtype ((*Shape*) 2))); (332, Boolean); (745, Boolean); (90, Boolean); (404, (Array_Type ((*Board*) 7))); (431, Integer); (646, (Subtype ((*PX_Coord*) 9))); (395, Boolean); (682, (Derived_Type ((*Direction*) 11))); (341, (Subtype ((*PY_Coord*) 10))); (691, (Derived_Type ((*Direction*) 11))); (171, (Subtype ((*Shape*) 2))); (377, Integer); (144, Integer); (485, (Subtype ((*Y_Coord*) 5))); (153, (Subtype ((*Shape*) 2))); (467, (Subtype ((*Y_Coord*) 5))); (162, (Subtype ((*PY_Coord*) 10))); (359, (Subtype ((*I_Delta*) 20))); (673, (Subtype ((*PY_Coord*) 10))); (709, (Derived_Type ((*Action*) 31))); (368, (Derived_Type ((*State*) 18))); (135, Boolean); (476, (Array_Type ((*Line*) 6))); (350, (Subtype ((*I_Delta*) 20))); (664, Integer); (323, (Subtype ((*I_Delta*) 20))); (736, Boolean); (362, (Subtype ((*I_Delta*) 20))); (676, (Subtype ((*PY_Coord*) 10))); (272, (Subtype ((*PY_Coord*) 10))); (685, (Derived_Type ((*Direction*) 11))); (344, Integer); (658, (Subtype ((*PX_Coord*) 9))); (317, (Record_Type ((*Piece*) 12))); (353, (Record_Type ((*Piece*) 12))); (434, Integer); (326, (Subtype ((*I_Delta*) 20))); (299, (Subtype ((*I_Delta*) 20))); (335, (Array_Type ((*Line*) 6))); (649, Integer); (308, Boolean); (721, (Record_Type ((*Piece*) 12))); (730, (Array_Type ((*Board*) 7))); (416, (Array_Type ((*Board*) 7))); (281, (Record_Type ((*Piece*) 12))); (595, (Subtype ((*PX_Coord*) 9))); (622, (Record_Type ((*Piece*) 12))); (290, (Subtype ((*I_Delta*) 20))); (604, (Derived_Type ((*Action*) 31))); (712, Boolean); (586, (Subtype ((*PX_Coord*) 9))); (667, (Derived_Type ((*Action*) 31))); (398, Integer); (748, Boolean); (407, Boolean); (613, (Record_Type ((*Piece*) 12))); (356, (Subtype ((*I_Delta*) 20))); (562, (Subtype ((*PX_Coord*) 9))); (230, (Record_Type ((*Piece*) 12))); (257, (Subtype ((*I_Delta*) 20))); (598, (Subtype ((*PX_Coord*) 9))); (679, Integer); (338, (Subtype ((*PY_Coord*) 10))); (688, (Derived_Type ((*Direction*) 11))); (347, (Record_Type ((*Piece*) 12))); (553, (Derived_Type ((*Action*) 31))); (652, (Derived_Type ((*Action*) 31))); (248, (Subtype ((*I_Delta*) 20))); (221, Integer); (589, (Subtype ((*PX_Coord*) 9))); (661, (Subtype ((*PX_Coord*) 9))); (320, (Derived_Type ((*Direction*) 11))); (302, Boolean); (643, (Subtype ((*PX_Coord*) 9))); (535, Integer); (203, (Subtype ((*PX_Coord*) 9))); (544, Integer); (275, (Subtype ((*PY_Coord*) 10))); (616, Integer); (311, Integer); (284, (Subtype ((*I_Delta*) 20))); (625, Integer); (293, (Subtype ((*I_Delta*) 20))); (365, (Subtype ((*I_Delta*) 20))); (526, (Derived_Type ((*Direction*) 11))); (571, (Subtype ((*PX_Coord*) 9))); (266, Boolean); (580, Integer); (607, Boolean); (628, Boolean); (520, (Derived_Type ((*Direction*) 11))); (179, Integer); (152, (Subtype ((*Shape*) 2))); (493, Integer); (188, (Subtype ((*PX_Coord*) 9))); (592, Integer); (260, (Subtype ((*I_Delta*) 20))); (269, (Array_Type ((*Line*) 6))); (610, Integer); (170, (Subtype ((*Shape*) 2))); (484, Integer); (215, (Array_Type ((*Board*) 7))); (565, Integer); (466, (Array_Type ((*Board*) 7))); (287, (Record_Type ((*Piece*) 12))); (161, (Array_Type ((*Board*) 7))); (574, Integer); (242, (Subtype ((*I_Delta*) 20))); (583, Boolean); (529, (Derived_Type ((*Direction*) 11))); (197, (Array_Type ((*Board*) 7))); (224, (Subtype ((*PX_Coord*) 9))); (538, Integer); (296, (Subtype ((*I_Delta*) 20))); (206, (Subtype ((*PX_Coord*) 9))); (233, Boolean); (637, (Derived_Type ((*Action*) 31))); (305, Integer); (278, Integer); (619, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(218, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)24 }); (559, { line = (*Line*)178; col = (*Col*)8; endline = (*EndLine*)178; endcol = (*EndCol*)22 }); (227, { line = (*Line*)74; col = (*Col*)46; endline = (*EndLine*)74; endcol = (*EndCol*)46 }); (568, { line = (*Line*)178; col = (*Col*)28; endline = (*EndLine*)178; endcol = (*EndCol*)41 }); (433, { line = (*Line*)125; col = (*Col*)22; endline = (*EndLine*)125; endcol = (*EndCol*)29 }); (442, { line = (*Line*)131; col = (*Col*)16; endline = (*EndLine*)131; endcol = (*EndCol*)16 }); (200, { line = (*Line*)73; col = (*Col*)14; endline = (*EndLine*)73; endcol = (*EndCol*)22 }); (173, { line = (*Line*)71; col = (*Col*)62; endline = (*EndLine*)71; endcol = (*EndCol*)62 }); (514, { line = (*Line*)159; col = (*Col*)10; endline = (*EndLine*)159; endcol = (*EndCol*)10 }); (209, { line = (*Line*)73; col = (*Col*)52; endline = (*EndLine*)73; endcol = (*EndCol*)62 }); (523, { line = (*Line*)161; col = (*Col*)6; endline = (*EndLine*)161; endcol = (*EndCol*)6 }); (182, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)22 }); (254, { line = (*Line*)78; col = (*Col*)28; endline = (*EndLine*)78; endcol = (*EndCol*)38 }); (191, { line = (*Line*)72; col = (*Col*)52; endline = (*EndLine*)72; endcol = (*EndCol*)60 }); (720, { line = (*Line*)212; col = (*Col*)9; endline = (*EndLine*)212; endcol = (*EndCol*)17 }); (729, { line = (*Line*)214; col = (*Col*)15; endline = (*EndLine*)214; endcol = (*EndCol*)23 }); (424, { line = (*Line*)122; col = (*Col*)35; endline = (*EndLine*)122; endcol = (*EndCol*)38 }); (155, { line = (*Line*)70; col = (*Col*)20; endline = (*EndLine*)70; endcol = (*EndCol*)20 }); (469, { line = (*Line*)135; col = (*Col*)39; endline = (*EndLine*)135; endcol = (*EndCol*)59 }); (496, { line = (*Line*)145; col = (*Col*)20; endline = (*EndLine*)145; endcol = (*EndCol*)20 }); (164, { line = (*Line*)71; col = (*Col*)14; endline = (*EndLine*)71; endcol = (*EndCol*)22 }); (478, { line = (*Line*)136; col = (*Col*)27; endline = (*EndLine*)136; endcol = (*EndCol*)35 }); (505, { line = (*Line*)154; col = (*Col*)12; endline = (*EndLine*)154; endcol = (*EndCol*)15 }); (577, { line = (*Line*)179; col = (*Col*)13; endline = (*EndLine*)179; endcol = (*EndCol*)17 }); (451, { line = (*Line*)133; col = (*Col*)21; endline = (*EndLine*)133; endcol = (*EndCol*)41 }); (460, { line = (*Line*)134; col = (*Col*)16; endline = (*EndLine*)134; endcol = (*EndCol*)20 }); (532, { line = (*Line*)166; col = (*Col*)6; endline = (*EndLine*)166; endcol = (*EndCol*)10 }); (541, { line = (*Line*)169; col = (*Col*)11; endline = (*EndLine*)169; endcol = (*EndCol*)15 }); (406, { line = (*Line*)119; col = (*Col*)32; endline = (*EndLine*)119; endcol = (*EndCol*)39 }); (415, { line = (*Line*)121; col = (*Col*)13; endline = (*EndLine*)121; endcol = (*EndCol*)32 }); (487, { line = (*Line*)137; col = (*Col*)37; endline = (*EndLine*)137; endcol = (*EndCol*)37 }); (236, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)21 }); (741, { line = (*Line*)216; col = (*Col*)26; endline = (*EndLine*)216; endcol = (*EndCol*)34 }); (678, { line = (*Line*)195; col = (*Col*)12; endline = (*EndLine*)195; endcol = (*EndCol*)12 }); (445, { line = (*Line*)132; col = (*Col*)16; endline = (*EndLine*)132; endcol = (*EndCol*)24 }); (732, { line = (*Line*)214; col = (*Col*)26; endline = (*EndLine*)214; endcol = (*EndCol*)34 }); (472, { line = (*Line*)135; col = (*Col*)50; endline = (*EndLine*)135; endcol = (*EndCol*)58 }); (427, { line = (*Line*)123; col = (*Col*)24; endline = (*EndLine*)123; endcol = (*EndCol*)31 }); (176, { line = (*Line*)72; col = (*Col*)3; endline = (*EndLine*)72; endcol = (*EndCol*)43 }); (723, { line = (*Line*)212; col = (*Col*)20; endline = (*EndLine*)212; endcol = (*EndCol*)20 }); (418, { line = (*Line*)121; col = (*Col*)24; endline = (*EndLine*)121; endcol = (*EndCol*)31 }); (490, { line = (*Line*)139; col = (*Col*)19; endline = (*EndLine*)139; endcol = (*EndCol*)31 }); (185, { line = (*Line*)72; col = (*Col*)32; endline = (*EndLine*)72; endcol = (*EndCol*)42 }); (167, { line = (*Line*)71; col = (*Col*)28; endline = (*EndLine*)71; endcol = (*EndCol*)38 }); (364, { line = (*Line*)95; col = (*Col*)11; endline = (*EndLine*)95; endcol = (*EndCol*)11 }); (140, { line = (*Line*)66; col = (*Col*)22; endline = (*EndLine*)66; endcol = (*EndCol*)22 }); (113, { line = (*Line*)48; col = (*Col*)7; endline = (*EndLine*)48; endcol = (*EndCol*)7 }); (454, { line = (*Line*)133; col = (*Col*)32; endline = (*EndLine*)133; endcol = (*EndCol*)40 }); (481, { line = (*Line*)136; col = (*Col*)41; endline = (*EndLine*)136; endcol = (*EndCol*)50 }); (687, { line = (*Line*)197; col = (*Col*)24; endline = (*EndLine*)197; endcol = (*EndCol*)24 }); (660, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)12 }); (346, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)44 }); (669, { line = (*Line*)194; col = (*Col*)17; endline = (*EndLine*)194; endcol = (*EndCol*)17 }); (708, { line = (*Line*)210; col = (*Col*)25; endline = (*EndLine*)210; endcol = (*EndCol*)33 }); (403, { line = (*Line*)119; col = (*Col*)21; endline = (*EndLine*)119; endcol = (*EndCol*)40 }); (134, { line = (*Line*)58; col = (*Col*)7; endline = (*EndLine*)58; endcol = (*EndCol*)7 }); (600, { line = (*Line*)180; col = (*Col*)41; endline = (*EndLine*)180; endcol = (*EndCol*)41 }); (609, { line = (*Line*)182; col = (*Col*)8; endline = (*EndLine*)182; endcol = (*EndCol*)22 }); (690, { line = (*Line*)197; col = (*Col*)27; endline = (*EndLine*)197; endcol = (*EndCol*)27 }); (349, { line = (*Line*)91; col = (*Col*)48; endline = (*EndLine*)91; endcol = (*EndCol*)48 }); (358, { line = (*Line*)93; col = (*Col*)14; endline = (*EndLine*)93; endcol = (*EndCol*)14 }); (430, { line = (*Line*)125; col = (*Col*)10; endline = (*EndLine*)125; endcol = (*EndCol*)17 }); (672, { line = (*Line*)195; col = (*Col*)3; endline = (*EndLine*)195; endcol = (*EndCol*)3 }); (645, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)12 }); (331, { line = (*Line*)90; col = (*Col*)12; endline = (*EndLine*)90; endcol = (*EndCol*)12 }); (304, { line = (*Line*)87; col = (*Col*)9; endline = (*EndLine*)87; endcol = (*EndCol*)9 }); (654, { line = (*Line*)192; col = (*Col*)17; endline = (*EndLine*)192; endcol = (*EndCol*)17 }); (340, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)24 }); (89, { line = (*Line*)33; col = (*Col*)7; endline = (*EndLine*)33; endcol = (*EndCol*)7 }); (286, { line = (*Line*)80; col = (*Col*)54; endline = (*EndLine*)80; endcol = (*EndCol*)64 }); (627, { line = (*Line*)184; col = (*Col*)3; endline = (*EndLine*)184; endcol = (*EndCol*)3 }); (636, { line = (*Line*)190; col = (*Col*)10; endline = (*EndLine*)190; endcol = (*EndCol*)14 }); (457, { line = (*Line*)133; col = (*Col*)44; endline = (*EndLine*)133; endcol = (*EndCol*)44 }); (663, { line = (*Line*)193; col = (*Col*)12; endline = (*EndLine*)193; endcol = (*EndCol*)12 }); (98, { line = (*Line*)38; col = (*Col*)12; endline = (*EndLine*)38; endcol = (*EndCol*)15 }); (412, { line = (*Line*)120; col = (*Col*)13; endline = (*EndLine*)120; endcol = (*EndCol*)13 }); (618, { line = (*Line*)182; col = (*Col*)28; endline = (*EndLine*)182; endcol = (*EndCol*)42 }); (322, { line = (*Line*)89; col = (*Col*)55; endline = (*EndLine*)89; endcol = (*EndCol*)55 }); (385, { line = (*Line*)112; col = (*Col*)29; endline = (*EndLine*)112; endcol = (*EndCol*)29 }); (567, { line = (*Line*)178; col = (*Col*)22; endline = (*EndLine*)178; endcol = (*EndCol*)22 }); (639, { line = (*Line*)190; col = (*Col*)14; endline = (*EndLine*)190; endcol = (*EndCol*)14 }); (648, { line = (*Line*)191; col = (*Col*)12; endline = (*EndLine*)191; endcol = (*EndCol*)12 }); (397, { line = (*Line*)118; col = (*Col*)13; endline = (*EndLine*)118; endcol = (*EndCol*)20 }); (262, { line = (*Line*)78; col = (*Col*)47; endline = (*EndLine*)78; endcol = (*EndCol*)47 }); (603, { line = (*Line*)181; col = (*Col*)13; endline = (*EndLine*)181; endcol = (*EndCol*)13 }); (298, { line = (*Line*)84; col = (*Col*)11; endline = (*EndLine*)84; endcol = (*EndCol*)11 }); (711, { line = (*Line*)210; col = (*Col*)39; endline = (*EndLine*)210; endcol = (*EndCol*)48 }); (684, { line = (*Line*)197; col = (*Col*)19; endline = (*EndLine*)197; endcol = (*EndCol*)19 }); (343, { line = (*Line*)91; col = (*Col*)30; endline = (*EndLine*)91; endcol = (*EndCol*)30 }); (352, { line = (*Line*)91; col = (*Col*)54; endline = (*EndLine*)91; endcol = (*EndCol*)64 }); (558, { line = (*Line*)178; col = (*Col*)8; endline = (*EndLine*)178; endcol = (*EndCol*)41 }); (585, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)15 }); (253, { line = (*Line*)78; col = (*Col*)28; endline = (*EndLine*)78; endcol = (*EndCol*)38 }); (226, { line = (*Line*)74; col = (*Col*)42; endline = (*EndLine*)74; endcol = (*EndCol*)42 }); (594, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)35 }); (666, { line = (*Line*)194; col = (*Col*)13; endline = (*EndLine*)194; endcol = (*EndCol*)17 }); (325, { line = (*Line*)89; col = (*Col*)61; endline = (*EndLine*)89; endcol = (*EndCol*)61 }); (675, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)12 }); (334, { line = (*Line*)91; col = (*Col*)5; endline = (*EndLine*)91; endcol = (*EndCol*)49 }); (540, { line = (*Line*)169; col = (*Col*)6; endline = (*EndLine*)169; endcol = (*EndCol*)6 }); (235, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)23 }); (621, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)31 }); (657, { line = (*Line*)193; col = (*Col*)3; endline = (*EndLine*)193; endcol = (*EndCol*)3 }); (316, { line = (*Line*)89; col = (*Col*)32; endline = (*EndLine*)89; endcol = (*EndCol*)42 }); (271, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)30 }); (612, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)11 }); (280, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)44 }); (319, { line = (*Line*)89; col = (*Col*)45; endline = (*EndLine*)89; endcol = (*EndCol*)55 }); (516, { line = (*Line*)159; col = (*Col*)14; endline = (*EndLine*)159; endcol = (*EndCol*)14 }); (552, { line = (*Line*)177; col = (*Col*)10; endline = (*EndLine*)177; endcol = (*EndCol*)14 }); (184, { line = (*Line*)72; col = (*Col*)28; endline = (*EndLine*)72; endcol = (*EndCol*)28 }); (534, { line = (*Line*)166; col = (*Col*)6; endline = (*EndLine*)166; endcol = (*EndCol*)6 }); (597, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)29 }); (265, { line = (*Line*)79; col = (*Col*)12; endline = (*EndLine*)79; endcol = (*EndCol*)12 }); (615, { line = (*Line*)182; col = (*Col*)15; endline = (*EndLine*)182; endcol = (*EndCol*)15 }); (480, { line = (*Line*)136; col = (*Col*)41; endline = (*EndLine*)136; endcol = (*EndCol*)50 }); (256, { line = (*Line*)78; col = (*Col*)38; endline = (*EndLine*)78; endcol = (*EndCol*)38 }); (337, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)30 }); (211, { line = (*Line*)73; col = (*Col*)62; endline = (*EndLine*)73; endcol = (*EndCol*)62 }); (283, { line = (*Line*)80; col = (*Col*)48; endline = (*EndLine*)80; endcol = (*EndCol*)48 }); (624, { line = (*Line*)182; col = (*Col*)35; endline = (*EndLine*)182; endcol = (*EndCol*)35 }); (292, { line = (*Line*)82; col = (*Col*)14; endline = (*EndLine*)82; endcol = (*EndCol*)14 }); (166, { line = (*Line*)71; col = (*Col*)28; endline = (*EndLine*)71; endcol = (*EndCol*)38 }); (579, { line = (*Line*)179; col = (*Col*)13; endline = (*EndLine*)179; endcol = (*EndCol*)13 }); (274, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)24 }); (247, { line = (*Line*)77; col = (*Col*)12; endline = (*EndLine*)77; endcol = (*EndCol*)12 }); (588, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)9 }); (328, { line = (*Line*)89; col = (*Col*)64; endline = (*EndLine*)89; endcol = (*EndCol*)64 }); (489, { line = (*Line*)139; col = (*Col*)6; endline = (*EndLine*)139; endcol = (*EndCol*)14 }); (220, { line = (*Line*)74; col = (*Col*)24; endline = (*EndLine*)74; endcol = (*EndCol*)24 }); (561, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)11 }); (229, { line = (*Line*)74; col = (*Col*)52; endline = (*EndLine*)74; endcol = (*EndCol*)62 }); (543, { line = (*Line*)169; col = (*Col*)11; endline = (*EndLine*)169; endcol = (*EndCol*)11 }); (570, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)31 }); (202, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)42 }); (238, { line = (*Line*)75; col = (*Col*)27; endline = (*EndLine*)75; endcol = (*EndCol*)27 }); (642, { line = (*Line*)191; col = (*Col*)3; endline = (*EndLine*)191; endcol = (*EndCol*)3 }); (651, { line = (*Line*)192; col = (*Col*)13; endline = (*EndLine*)192; endcol = (*EndCol*)17 }); (310, { line = (*Line*)88; col = (*Col*)12; endline = (*EndLine*)88; endcol = (*EndCol*)12 }); (277, { line = (*Line*)80; col = (*Col*)30; endline = (*EndLine*)80; endcol = (*EndCol*)30 }); (483, { line = (*Line*)137; col = (*Col*)16; endline = (*EndLine*)137; endcol = (*EndCol*)22 }); (151, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)24 }); (492, { line = (*Line*)139; col = (*Col*)19; endline = (*EndLine*)139; endcol = (*EndCol*)27 }); (223, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)42 }); (564, { line = (*Line*)178; col = (*Col*)11; endline = (*EndLine*)178; endcol = (*EndCol*)11 }); (259, { line = (*Line*)78; col = (*Col*)44; endline = (*EndLine*)78; endcol = (*EndCol*)44 }); (573, { line = (*Line*)178; col = (*Col*)31; endline = (*EndLine*)178; endcol = (*EndCol*)31 }); (124, { line = (*Line*)53; col = (*Col*)12; endline = (*EndLine*)53; endcol = (*EndCol*)15 }); (438, { line = (*Line*)130; col = (*Col*)10; endline = (*EndLine*)130; endcol = (*EndCol*)27 }); (537, { line = (*Line*)167; col = (*Col*)6; endline = (*EndLine*)167; endcol = (*EndCol*)6 }); (106, { line = (*Line*)43; col = (*Col*)12; endline = (*EndLine*)43; endcol = (*EndCol*)15 }); (447, { line = (*Line*)132; col = (*Col*)29; endline = (*EndLine*)132; endcol = (*EndCol*)29 }); (205, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)36 }); (519, { line = (*Line*)160; col = (*Col*)6; endline = (*EndLine*)160; endcol = (*EndCol*)6 }); (214, { line = (*Line*)74; col = (*Col*)3; endline = (*EndLine*)74; endcol = (*EndCol*)29 }); (555, { line = (*Line*)177; col = (*Col*)14; endline = (*EndLine*)177; endcol = (*EndCol*)14 }); (528, { line = (*Line*)163; col = (*Col*)11; endline = (*EndLine*)163; endcol = (*EndCol*)11 }); (420, { line = (*Line*)121; col = (*Col*)37; endline = (*EndLine*)121; endcol = (*EndCol*)46 }); (160, { line = (*Line*)71; col = (*Col*)3; endline = (*EndLine*)71; endcol = (*EndCol*)25 }); (169, { line = (*Line*)71; col = (*Col*)38; endline = (*EndLine*)71; endcol = (*EndCol*)38 }); (178, { line = (*Line*)72; col = (*Col*)3; endline = (*EndLine*)72; endcol = (*EndCol*)11 }); (582, { line = (*Line*)180; col = (*Col*)3; endline = (*EndLine*)180; endcol = (*EndCol*)3 }); (591, { line = (*Line*)180; col = (*Col*)21; endline = (*EndLine*)180; endcol = (*EndCol*)22 }); (456, { line = (*Line*)133; col = (*Col*)44; endline = (*EndLine*)133; endcol = (*EndCol*)44 }); (465, { line = (*Line*)135; col = (*Col*)16; endline = (*EndLine*)135; endcol = (*EndCol*)34 }); (187, { line = (*Line*)72; col = (*Col*)32; endline = (*EndLine*)72; endcol = (*EndCol*)40 }); (196, { line = (*Line*)73; col = (*Col*)3; endline = (*EndLine*)73; endcol = (*EndCol*)25 }); (268, { line = (*Line*)80; col = (*Col*)5; endline = (*EndLine*)80; endcol = (*EndCol*)49 }); (241, { line = (*Line*)76; col = (*Col*)9; endline = (*EndLine*)76; endcol = (*EndCol*)9 }); (369, { line = (*Line*)101; col = (*Col*)20; endline = (*EndLine*)101; endcol = (*EndCol*)20 }); (441, { line = (*Line*)131; col = (*Col*)3; endline = (*EndLine*)131; endcol = (*EndCol*)11 }); (181, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)24 }); (163, { line = (*Line*)71; col = (*Col*)14; endline = (*EndLine*)71; endcol = (*EndCol*)24 }); (477, { line = (*Line*)136; col = (*Col*)16; endline = (*EndLine*)136; endcol = (*EndCol*)24 }); (172, { line = (*Line*)71; col = (*Col*)52; endline = (*EndLine*)71; endcol = (*EndCol*)60 }); (513, { line = (*Line*)159; col = (*Col*)10; endline = (*EndLine*)159; endcol = (*EndCol*)14 }); (432, { line = (*Line*)125; col = (*Col*)22; endline = (*EndLine*)125; endcol = (*EndCol*)29 }); (468, { line = (*Line*)135; col = (*Col*)27; endline = (*EndLine*)135; endcol = (*EndCol*)33 }); (199, { line = (*Line*)73; col = (*Col*)14; endline = (*EndLine*)73; endcol = (*EndCol*)24 }); (208, { line = (*Line*)73; col = (*Col*)52; endline = (*EndLine*)73; endcol = (*EndCol*)62 }); (217, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)24 }); (683, { line = (*Line*)197; col = (*Col*)19; endline = (*EndLine*)197; endcol = (*EndCol*)21 }); (423, { line = (*Line*)122; col = (*Col*)13; endline = (*EndLine*)122; endcol = (*EndCol*)30 }); (495, { line = (*Line*)145; col = (*Col*)7; endline = (*EndLine*)145; endcol = (*EndCol*)15 }); (190, { line = (*Line*)72; col = (*Col*)52; endline = (*EndLine*)72; endcol = (*EndCol*)62 }); (504, { line = (*Line*)154; col = (*Col*)7; endline = (*EndLine*)154; endcol = (*EndCol*)7 }); (737, { line = (*Line*)215; col = (*Col*)13; endline = (*EndLine*)215; endcol = (*EndCol*)25 }); (396, { line = (*Line*)118; col = (*Col*)13; endline = (*EndLine*)118; endcol = (*EndCol*)20 }); (710, { line = (*Line*)210; col = (*Col*)36; endline = (*EndLine*)210; endcol = (*EndCol*)36 }); (746, { line = (*Line*)217; col = (*Col*)24; endline = (*EndLine*)217; endcol = (*EndCol*)27 }); (405, { line = (*Line*)119; col = (*Col*)32; endline = (*EndLine*)119; endcol = (*EndCol*)39 }); (486, { line = (*Line*)137; col = (*Col*)27; endline = (*EndLine*)137; endcol = (*EndCol*)33 }); (154, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)18 }); (360, { line = (*Line*)93; col = (*Col*)18; endline = (*EndLine*)93; endcol = (*EndCol*)18 }); (740, { line = (*Line*)216; col = (*Col*)13; endline = (*EndLine*)216; endcol = (*EndCol*)21 }); (426, { line = (*Line*)123; col = (*Col*)13; endline = (*EndLine*)123; endcol = (*EndCol*)19 }); (408, { line = (*Line*)119; col = (*Col*)43; endline = (*EndLine*)119; endcol = (*EndCol*)43 }); (300, { line = (*Line*)84; col = (*Col*)15; endline = (*EndLine*)84; endcol = (*EndCol*)15 }); (686, { line = (*Line*)197; col = (*Col*)24; endline = (*EndLine*)197; endcol = (*EndCol*)24 }); (623, { line = (*Line*)182; col = (*Col*)31; endline = (*EndLine*)182; endcol = (*EndCol*)31 }); (722, { line = (*Line*)212; col = (*Col*)20; endline = (*EndLine*)212; endcol = (*EndCol*)20 }); (381, { line = (*Line*)111; col = (*Col*)39; endline = (*EndLine*)111; endcol = (*EndCol*)43 }); (354, { line = (*Line*)91; col = (*Col*)64; endline = (*EndLine*)91; endcol = (*EndCol*)64 }); (471, { line = (*Line*)135; col = (*Col*)39; endline = (*EndLine*)135; endcol = (*EndCol*)47 }); (677, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)10 }); (336, { line = (*Line*)91; col = (*Col*)5; endline = (*EndLine*)91; endcol = (*EndCol*)13 }); (345, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)44 }); (641, { line = (*Line*)191; col = (*Col*)3; endline = (*EndLine*)191; endcol = (*EndCol*)5 }); (453, { line = (*Line*)133; col = (*Col*)21; endline = (*EndLine*)133; endcol = (*EndCol*)29 }); (462, { line = (*Line*)134; col = (*Col*)20; endline = (*EndLine*)134; endcol = (*EndCol*)20 }); (668, { line = (*Line*)194; col = (*Col*)13; endline = (*EndLine*)194; endcol = (*EndCol*)13 }); (363, { line = (*Line*)95; col = (*Col*)11; endline = (*EndLine*)95; endcol = (*EndCol*)15 }); (749, { line = (*Line*)222; col = (*Col*)18; endline = (*EndLine*)222; endcol = (*EndCol*)22 }); (417, { line = (*Line*)121; col = (*Col*)24; endline = (*EndLine*)121; endcol = (*EndCol*)31 }); (444, { line = (*Line*)132; col = (*Col*)16; endline = (*EndLine*)132; endcol = (*EndCol*)29 }); (309, { line = (*Line*)88; col = (*Col*)12; endline = (*EndLine*)88; endcol = (*EndCol*)12 }); (659, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)16 }); (318, { line = (*Line*)89; col = (*Col*)42; endline = (*EndLine*)89; endcol = (*EndCol*)42 }); (731, { line = (*Line*)214; col = (*Col*)26; endline = (*EndLine*)214; endcol = (*EndCol*)34 }); (327, { line = (*Line*)89; col = (*Col*)64; endline = (*EndLine*)89; endcol = (*EndCol*)64 }); (357, { line = (*Line*)93; col = (*Col*)14; endline = (*EndLine*)93; endcol = (*EndCol*)18 }); (97, { line = (*Line*)38; col = (*Col*)7; endline = (*EndLine*)38; endcol = (*EndCol*)7 }); (563, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)9 }); (653, { line = (*Line*)192; col = (*Col*)13; endline = (*EndLine*)192; endcol = (*EndCol*)13 }); (348, { line = (*Line*)91; col = (*Col*)44; endline = (*EndLine*)91; endcol = (*EndCol*)44 }); (734, { line = (*Line*)214; col = (*Col*)37; endline = (*EndLine*)214; endcol = (*EndCol*)49 }); (402, { line = (*Line*)119; col = (*Col*)21; endline = (*EndLine*)119; endcol = (*EndCol*)40 }); (294, { line = (*Line*)82; col = (*Col*)18; endline = (*EndLine*)82; endcol = (*EndCol*)18 }); (608, { line = (*Line*)182; col = (*Col*)8; endline = (*EndLine*)182; endcol = (*EndCol*)42 }); (707, { line = (*Line*)210; col = (*Col*)25; endline = (*EndLine*)210; endcol = (*EndCol*)33 }); (644, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)16 }); (303, { line = (*Line*)87; col = (*Col*)9; endline = (*EndLine*)87; endcol = (*EndCol*)9 }); (716, { line = (*Line*)211; col = (*Col*)10; endline = (*EndLine*)211; endcol = (*EndCol*)19 }); (725, { line = (*Line*)212; col = (*Col*)23; endline = (*EndLine*)212; endcol = (*EndCol*)31 }); (411, { line = (*Line*)120; col = (*Col*)13; endline = (*EndLine*)120; endcol = (*EndCol*)13 }); (276, { line = (*Line*)80; col = (*Col*)30; endline = (*EndLine*)80; endcol = (*EndCol*)30 }); (249, { line = (*Line*)77; col = (*Col*)17; endline = (*EndLine*)77; endcol = (*EndCol*)17 }); (590, { line = (*Line*)180; col = (*Col*)15; endline = (*EndLine*)180; endcol = (*EndCol*)15 }); (285, { line = (*Line*)80; col = (*Col*)54; endline = (*EndLine*)80; endcol = (*EndCol*)64 }); (258, { line = (*Line*)78; col = (*Col*)41; endline = (*EndLine*)78; endcol = (*EndCol*)41 }); (599, { line = (*Line*)180; col = (*Col*)35; endline = (*EndLine*)180; endcol = (*EndCol*)35 }); (671, { line = (*Line*)195; col = (*Col*)3; endline = (*EndLine*)195; endcol = (*EndCol*)5 }); (339, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)26 }); (366, { line = (*Line*)95; col = (*Col*)15; endline = (*EndLine*)95; endcol = (*EndCol*)15 }); (572, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)29 }); (240, { line = (*Line*)76; col = (*Col*)9; endline = (*EndLine*)76; endcol = (*EndCol*)14 }); (662, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)10 }); (321, { line = (*Line*)89; col = (*Col*)45; endline = (*EndLine*)89; endcol = (*EndCol*)53 }); (617, { line = (*Line*)182; col = (*Col*)22; endline = (*EndLine*)182; endcol = (*EndCol*)22 }); (689, { line = (*Line*)197; col = (*Col*)27; endline = (*EndLine*)197; endcol = (*EndCol*)29 }); (521, { line = (*Line*)160; col = (*Col*)10; endline = (*EndLine*)160; endcol = (*EndCol*)10 }); (557, { line = (*Line*)178; col = (*Col*)3; endline = (*EndLine*)178; endcol = (*EndCol*)3 }); (189, { line = (*Line*)72; col = (*Col*)52; endline = (*EndLine*)72; endcol = (*EndCol*)62 }); (530, { line = (*Line*)163; col = (*Col*)15; endline = (*EndLine*)163; endcol = (*EndCol*)15 }); (225, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)40 }); (180, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)24 }); (674, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)16 }); (342, { line = (*Line*)91; col = (*Col*)30; endline = (*EndLine*)91; endcol = (*EndCol*)30 }); (207, { line = (*Line*)73; col = (*Col*)42; endline = (*EndLine*)73; endcol = (*EndCol*)42 }); (216, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)28 }); (288, { line = (*Line*)80; col = (*Col*)64; endline = (*EndLine*)80; endcol = (*EndCol*)64 }); (324, { line = (*Line*)89; col = (*Col*)58; endline = (*EndLine*)89; endcol = (*EndCol*)58 }); (297, { line = (*Line*)84; col = (*Col*)11; endline = (*EndLine*)84; endcol = (*EndCol*)15 }); (638, { line = (*Line*)190; col = (*Col*)10; endline = (*EndLine*)190; endcol = (*EndCol*)10 }); (198, { line = (*Line*)73; col = (*Col*)14; endline = (*EndLine*)73; endcol = (*EndCol*)24 }); (270, { line = (*Line*)80; col = (*Col*)5; endline = (*EndLine*)80; endcol = (*EndCol*)13 }); (584, { line = (*Line*)180; col = (*Col*)8; endline = (*EndLine*)180; endcol = (*EndCol*)22 }); (611, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)11 }); (279, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)44 }); (593, { line = (*Line*)180; col = (*Col*)28; endline = (*EndLine*)180; endcol = (*EndCol*)41 }); (620, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)31 }); (351, { line = (*Line*)91; col = (*Col*)54; endline = (*EndLine*)91; endcol = (*EndCol*)64 }); (566, { line = (*Line*)178; col = (*Col*)21; endline = (*EndLine*)178; endcol = (*EndCol*)22 }); (261, { line = (*Line*)78; col = (*Col*)47; endline = (*EndLine*)78; endcol = (*EndCol*)47 }); (234, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)23 }); (575, { line = (*Line*)178; col = (*Col*)41; endline = (*EndLine*)178; endcol = (*EndCol*)41 }); (602, { line = (*Line*)181; col = (*Col*)13; endline = (*EndLine*)181; endcol = (*EndCol*)17 }); (647, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)10 }); (243, { line = (*Line*)76; col = (*Col*)14; endline = (*EndLine*)76; endcol = (*EndCol*)14 }); (656, { line = (*Line*)193; col = (*Col*)3; endline = (*EndLine*)193; endcol = (*EndCol*)5 }); (315, { line = (*Line*)89; col = (*Col*)32; endline = (*EndLine*)89; endcol = (*EndCol*)42 }); (282, { line = (*Line*)80; col = (*Col*)44; endline = (*EndLine*)80; endcol = (*EndCol*)44 }); (183, { line = (*Line*)72; col = (*Col*)24; endline = (*EndLine*)72; endcol = (*EndCol*)24 }); (587, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)11 }); (156, { line = (*Line*)70; col = (*Col*)24; endline = (*EndLine*)70; endcol = (*EndCol*)24 }); (255, { line = (*Line*)78; col = (*Col*)28; endline = (*EndLine*)78; endcol = (*EndCol*)36 }); (569, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)35 }); (596, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)31 }); (228, { line = (*Line*)74; col = (*Col*)52; endline = (*EndLine*)74; endcol = (*EndCol*)62 }); (578, { line = (*Line*)179; col = (*Col*)13; endline = (*EndLine*)179; endcol = (*EndCol*)13 }); (461, { line = (*Line*)134; col = (*Col*)20; endline = (*EndLine*)134; endcol = (*EndCol*)20 }); (470, { line = (*Line*)135; col = (*Col*)39; endline = (*EndLine*)135; endcol = (*EndCol*)59 }); (452, { line = (*Line*)133; col = (*Col*)21; endline = (*EndLine*)133; endcol = (*EndCol*)41 }); (479, { line = (*Line*)136; col = (*Col*)27; endline = (*EndLine*)136; endcol = (*EndCol*)35 }); (542, { line = (*Line*)169; col = (*Col*)11; endline = (*EndLine*)169; endcol = (*EndCol*)11 }); (210, { line = (*Line*)73; col = (*Col*)52; endline = (*EndLine*)73; endcol = (*EndCol*)60 }); (560, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)15 }); (219, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)22 }); (291, { line = (*Line*)82; col = (*Col*)14; endline = (*EndLine*)82; endcol = (*EndCol*)18 }); (165, { line = (*Line*)71; col = (*Col*)24; endline = (*EndLine*)71; endcol = (*EndCol*)24 }); (515, { line = (*Line*)159; col = (*Col*)10; endline = (*EndLine*)159; endcol = (*EndCol*)10 }); (237, { line = (*Line*)75; col = (*Col*)23; endline = (*EndLine*)75; endcol = (*EndCol*)23 }); (246, { line = (*Line*)77; col = (*Col*)12; endline = (*EndLine*)77; endcol = (*EndCol*)17 }); (524, { line = (*Line*)161; col = (*Col*)11; endline = (*EndLine*)161; endcol = (*EndCol*)11 }); (192, { line = (*Line*)72; col = (*Col*)62; endline = (*EndLine*)72; endcol = (*EndCol*)62 }); (533, { line = (*Line*)166; col = (*Col*)6; endline = (*EndLine*)166; endcol = (*EndCol*)6 }); (201, { line = (*Line*)73; col = (*Col*)24; endline = (*EndLine*)73; endcol = (*EndCol*)24 }); (605, { line = (*Line*)181; col = (*Col*)17; endline = (*EndLine*)181; endcol = (*EndCol*)17 }); (273, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)26 }); (614, { line = (*Line*)182; col = (*Col*)11; endline = (*EndLine*)182; endcol = (*EndCol*)11 }); (186, { line = (*Line*)72; col = (*Col*)32; endline = (*EndLine*)72; endcol = (*EndCol*)42 }); (213, { line = (*Line*)74; col = (*Col*)3; endline = (*EndLine*)74; endcol = (*EndCol*)47 }); (222, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)46 }); (437, { line = (*Line*)130; col = (*Col*)10; endline = (*EndLine*)130; endcol = (*EndCol*)27 }); (168, { line = (*Line*)71; col = (*Col*)28; endline = (*EndLine*)71; endcol = (*EndCol*)36 }); (177, { line = (*Line*)72; col = (*Col*)3; endline = (*EndLine*)72; endcol = (*EndCol*)29 }); (518, { line = (*Line*)160; col = (*Col*)6; endline = (*EndLine*)160; endcol = (*EndCol*)10 }); (715, { line = (*Line*)211; col = (*Col*)10; endline = (*EndLine*)211; endcol = (*EndCol*)19 }); (724, { line = (*Line*)212; col = (*Col*)23; endline = (*EndLine*)212; endcol = (*EndCol*)31 }); (733, { line = (*Line*)214; col = (*Col*)37; endline = (*EndLine*)214; endcol = (*EndCol*)49 }); (159, { line = (*Line*)71; col = (*Col*)3; endline = (*EndLine*)71; endcol = (*EndCol*)39 }); (473, { line = (*Line*)135; col = (*Col*)50; endline = (*EndLine*)135; endcol = (*EndCol*)58 }); (554, { line = (*Line*)177; col = (*Col*)10; endline = (*EndLine*)177; endcol = (*EndCol*)10 }); (105, { line = (*Line*)43; col = (*Col*)7; endline = (*EndLine*)43; endcol = (*EndCol*)7 }); (419, { line = (*Line*)121; col = (*Col*)37; endline = (*EndLine*)121; endcol = (*EndCol*)46 }); (446, { line = (*Line*)132; col = (*Col*)16; endline = (*EndLine*)132; endcol = (*EndCol*)24 }); (114, { line = (*Line*)48; col = (*Col*)12; endline = (*EndLine*)48; endcol = (*EndCol*)15 }); (428, { line = (*Line*)123; col = (*Col*)24; endline = (*EndLine*)123; endcol = (*EndCol*)31 }); (455, { line = (*Line*)133; col = (*Col*)32; endline = (*EndLine*)133; endcol = (*EndCol*)40 }); (123, { line = (*Line*)53; col = (*Col*)7; endline = (*EndLine*)53; endcol = (*EndCol*)7 }); (527, { line = (*Line*)163; col = (*Col*)11; endline = (*EndLine*)163; endcol = (*EndCol*)15 }); (195, { line = (*Line*)73; col = (*Col*)3; endline = (*EndLine*)73; endcol = (*EndCol*)43 }); (204, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)38 }); (742, { line = (*Line*)216; col = (*Col*)26; endline = (*EndLine*)216; endcol = (*EndCol*)34 }); (491, { line = (*Line*)139; col = (*Col*)19; endline = (*EndLine*)139; endcol = (*EndCol*)27 }); (231, { line = (*Line*)74; col = (*Col*)62; endline = (*EndLine*)74; endcol = (*EndCol*)62 }); (332, { line = (*Line*)90; col = (*Col*)12; endline = (*EndLine*)90; endcol = (*EndCol*)12 }); (745, { line = (*Line*)217; col = (*Col*)13; endline = (*EndLine*)217; endcol = (*EndCol*)19 }); (90, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)15 }); (404, { line = (*Line*)119; col = (*Col*)21; endline = (*EndLine*)119; endcol = (*EndCol*)29 }); (431, { line = (*Line*)125; col = (*Col*)22; endline = (*EndLine*)125; endcol = (*EndCol*)33 }); (646, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)12 }); (395, { line = (*Line*)118; col = (*Col*)13; endline = (*EndLine*)118; endcol = (*EndCol*)26 }); (682, { line = (*Line*)197; col = (*Col*)19; endline = (*EndLine*)197; endcol = (*EndCol*)21 }); (341, { line = (*Line*)91; col = (*Col*)26; endline = (*EndLine*)91; endcol = (*EndCol*)26 }); (691, { line = (*Line*)197; col = (*Col*)29; endline = (*EndLine*)197; endcol = (*EndCol*)29 }); (171, { line = (*Line*)71; col = (*Col*)52; endline = (*EndLine*)71; endcol = (*EndCol*)62 }); (377, { line = (*Line*)110; col = (*Col*)28; endline = (*EndLine*)110; endcol = (*EndCol*)29 }); (144, { line = (*Line*)67; col = (*Col*)22; endline = (*EndLine*)67; endcol = (*EndCol*)22 }); (485, { line = (*Line*)137; col = (*Col*)27; endline = (*EndLine*)137; endcol = (*EndCol*)33 }); (153, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)20 }); (467, { line = (*Line*)135; col = (*Col*)27; endline = (*EndLine*)135; endcol = (*EndCol*)33 }); (162, { line = (*Line*)71; col = (*Col*)14; endline = (*EndLine*)71; endcol = (*EndCol*)24 }); (359, { line = (*Line*)93; col = (*Col*)14; endline = (*EndLine*)93; endcol = (*EndCol*)14 }); (673, { line = (*Line*)195; col = (*Col*)5; endline = (*EndLine*)195; endcol = (*EndCol*)5 }); (709, { line = (*Line*)210; col = (*Col*)36; endline = (*EndLine*)210; endcol = (*EndCol*)36 }); (368, { line = (*Line*)101; col = (*Col*)7; endline = (*EndLine*)101; endcol = (*EndCol*)15 }); (135, { line = (*Line*)58; col = (*Col*)12; endline = (*EndLine*)58; endcol = (*EndCol*)15 }); (476, { line = (*Line*)136; col = (*Col*)16; endline = (*EndLine*)136; endcol = (*EndCol*)36 }); (350, { line = (*Line*)91; col = (*Col*)48; endline = (*EndLine*)91; endcol = (*EndCol*)48 }); (664, { line = (*Line*)193; col = (*Col*)16; endline = (*EndLine*)193; endcol = (*EndCol*)16 }); (323, { line = (*Line*)89; col = (*Col*)58; endline = (*EndLine*)89; endcol = (*EndCol*)58 }); (736, { line = (*Line*)215; col = (*Col*)13; endline = (*EndLine*)215; endcol = (*EndCol*)25 }); (362, { line = (*Line*)95; col = (*Col*)6; endline = (*EndLine*)95; endcol = (*EndCol*)6 }); (676, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)12 }); (272, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)26 }); (685, { line = (*Line*)197; col = (*Col*)21; endline = (*EndLine*)197; endcol = (*EndCol*)21 }); (344, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)48 }); (658, { line = (*Line*)193; col = (*Col*)5; endline = (*EndLine*)193; endcol = (*EndCol*)5 }); (317, { line = (*Line*)89; col = (*Col*)32; endline = (*EndLine*)89; endcol = (*EndCol*)40 }); (353, { line = (*Line*)91; col = (*Col*)54; endline = (*EndLine*)91; endcol = (*EndCol*)62 }); (434, { line = (*Line*)125; col = (*Col*)33; endline = (*EndLine*)125; endcol = (*EndCol*)33 }); (326, { line = (*Line*)89; col = (*Col*)61; endline = (*EndLine*)89; endcol = (*EndCol*)61 }); (299, { line = (*Line*)84; col = (*Col*)11; endline = (*EndLine*)84; endcol = (*EndCol*)11 }); (335, { line = (*Line*)91; col = (*Col*)5; endline = (*EndLine*)91; endcol = (*EndCol*)31 }); (649, { line = (*Line*)191; col = (*Col*)16; endline = (*EndLine*)191; endcol = (*EndCol*)16 }); (308, { line = (*Line*)88; col = (*Col*)12; endline = (*EndLine*)88; endcol = (*EndCol*)17 }); (721, { line = (*Line*)212; col = (*Col*)9; endline = (*EndLine*)212; endcol = (*EndCol*)17 }); (730, { line = (*Line*)214; col = (*Col*)15; endline = (*EndLine*)214; endcol = (*EndCol*)23 }); (416, { line = (*Line*)121; col = (*Col*)13; endline = (*EndLine*)121; endcol = (*EndCol*)21 }); (281, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)42 }); (595, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)31 }); (622, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)29 }); (290, { line = (*Line*)82; col = (*Col*)9; endline = (*EndLine*)82; endcol = (*EndCol*)9 }); (604, { line = (*Line*)181; col = (*Col*)13; endline = (*EndLine*)181; endcol = (*EndCol*)13 }); (712, { line = (*Line*)210; col = (*Col*)39; endline = (*EndLine*)210; endcol = (*EndCol*)48 }); (586, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)11 }); (667, { line = (*Line*)194; col = (*Col*)13; endline = (*EndLine*)194; endcol = (*EndCol*)13 }); (398, { line = (*Line*)118; col = (*Col*)25; endline = (*EndLine*)118; endcol = (*EndCol*)26 }); (748, { line = (*Line*)222; col = (*Col*)7; endline = (*EndLine*)222; endcol = (*EndCol*)13 }); (407, { line = (*Line*)119; col = (*Col*)43; endline = (*EndLine*)119; endcol = (*EndCol*)43 }); (613, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)9 }); (356, { line = (*Line*)93; col = (*Col*)9; endline = (*EndLine*)93; endcol = (*EndCol*)9 }); (562, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)11 }); (230, { line = (*Line*)74; col = (*Col*)52; endline = (*EndLine*)74; endcol = (*EndCol*)60 }); (257, { line = (*Line*)78; col = (*Col*)41; endline = (*EndLine*)78; endcol = (*EndCol*)41 }); (598, { line = (*Line*)180; col = (*Col*)31; endline = (*EndLine*)180; endcol = (*EndCol*)31 }); (679, { line = (*Line*)195; col = (*Col*)16; endline = (*EndLine*)195; endcol = (*EndCol*)16 }); (338, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)26 }); (688, { line = (*Line*)197; col = (*Col*)27; endline = (*EndLine*)197; endcol = (*EndCol*)29 }); (347, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)42 }); (553, { line = (*Line*)177; col = (*Col*)10; endline = (*EndLine*)177; endcol = (*EndCol*)10 }); (652, { line = (*Line*)192; col = (*Col*)13; endline = (*EndLine*)192; endcol = (*EndCol*)13 }); (248, { line = (*Line*)77; col = (*Col*)12; endline = (*EndLine*)77; endcol = (*EndCol*)12 }); (221, { line = (*Line*)74; col = (*Col*)28; endline = (*EndLine*)74; endcol = (*EndCol*)28 }); (589, { line = (*Line*)180; col = (*Col*)11; endline = (*EndLine*)180; endcol = (*EndCol*)11 }); (661, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)12 }); (320, { line = (*Line*)89; col = (*Col*)45; endline = (*EndLine*)89; endcol = (*EndCol*)55 }); (302, { line = (*Line*)87; col = (*Col*)9; endline = (*EndLine*)87; endcol = (*EndCol*)14 }); (643, { line = (*Line*)191; col = (*Col*)5; endline = (*EndLine*)191; endcol = (*EndCol*)5 }); (535, { line = (*Line*)166; col = (*Col*)10; endline = (*EndLine*)166; endcol = (*EndCol*)10 }); (203, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)38 }); (544, { line = (*Line*)169; col = (*Col*)15; endline = (*EndLine*)169; endcol = (*EndCol*)15 }); (275, { line = (*Line*)80; col = (*Col*)26; endline = (*EndLine*)80; endcol = (*EndCol*)26 }); (616, { line = (*Line*)182; col = (*Col*)21; endline = (*EndLine*)182; endcol = (*EndCol*)22 }); (311, { line = (*Line*)88; col = (*Col*)17; endline = (*EndLine*)88; endcol = (*EndCol*)17 }); (284, { line = (*Line*)80; col = (*Col*)48; endline = (*EndLine*)80; endcol = (*EndCol*)48 }); (625, { line = (*Line*)182; col = (*Col*)41; endline = (*EndLine*)182; endcol = (*EndCol*)42 }); (293, { line = (*Line*)82; col = (*Col*)14; endline = (*EndLine*)82; endcol = (*EndCol*)14 }); (365, { line = (*Line*)95; col = (*Col*)11; endline = (*EndLine*)95; endcol = (*EndCol*)11 }); (526, { line = (*Line*)163; col = (*Col*)6; endline = (*EndLine*)163; endcol = (*EndCol*)6 }); (571, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)31 }); (266, { line = (*Line*)79; col = (*Col*)12; endline = (*EndLine*)79; endcol = (*EndCol*)12 }); (580, { line = (*Line*)179; col = (*Col*)17; endline = (*EndLine*)179; endcol = (*EndCol*)17 }); (607, { line = (*Line*)182; col = (*Col*)3; endline = (*EndLine*)182; endcol = (*EndCol*)3 }); (628, { line = (*Line*)184; col = (*Col*)8; endline = (*EndLine*)184; endcol = (*EndCol*)11 }); (520, { line = (*Line*)160; col = (*Col*)6; endline = (*EndLine*)160; endcol = (*EndCol*)6 }); (179, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)28 }); (152, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)20 }); (493, { line = (*Line*)139; col = (*Col*)31; endline = (*EndLine*)139; endcol = (*EndCol*)31 }); (188, { line = (*Line*)72; col = (*Col*)42; endline = (*EndLine*)72; endcol = (*EndCol*)42 }); (592, { line = (*Line*)180; col = (*Col*)22; endline = (*EndLine*)180; endcol = (*EndCol*)22 }); (260, { line = (*Line*)78; col = (*Col*)44; endline = (*EndLine*)78; endcol = (*EndCol*)44 }); (269, { line = (*Line*)80; col = (*Col*)5; endline = (*EndLine*)80; endcol = (*EndCol*)31 }); (610, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)15 }); (170, { line = (*Line*)71; col = (*Col*)52; endline = (*EndLine*)71; endcol = (*EndCol*)62 }); (484, { line = (*Line*)137; col = (*Col*)27; endline = (*EndLine*)137; endcol = (*EndCol*)37 }); (215, { line = (*Line*)74; col = (*Col*)3; endline = (*EndLine*)74; endcol = (*EndCol*)11 }); (565, { line = (*Line*)178; col = (*Col*)15; endline = (*EndLine*)178; endcol = (*EndCol*)15 }); (466, { line = (*Line*)135; col = (*Col*)16; endline = (*EndLine*)135; endcol = (*EndCol*)24 }); (287, { line = (*Line*)80; col = (*Col*)54; endline = (*EndLine*)80; endcol = (*EndCol*)62 }); (161, { line = (*Line*)71; col = (*Col*)3; endline = (*EndLine*)71; endcol = (*EndCol*)11 }); (574, { line = (*Line*)178; col = (*Col*)35; endline = (*EndLine*)178; endcol = (*EndCol*)35 }); (242, { line = (*Line*)76; col = (*Col*)9; endline = (*EndLine*)76; endcol = (*EndCol*)9 }); (583, { line = (*Line*)180; col = (*Col*)8; endline = (*EndLine*)180; endcol = (*EndCol*)41 }); (529, { line = (*Line*)163; col = (*Col*)11; endline = (*EndLine*)163; endcol = (*EndCol*)11 }); (197, { line = (*Line*)73; col = (*Col*)3; endline = (*EndLine*)73; endcol = (*EndCol*)11 }); (224, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)42 }); (538, { line = (*Line*)167; col = (*Col*)11; endline = (*EndLine*)167; endcol = (*EndCol*)11 }); (296, { line = (*Line*)84; col = (*Col*)6; endline = (*EndLine*)84; endcol = (*EndCol*)6 }); (206, { line = (*Line*)73; col = (*Col*)38; endline = (*EndLine*)73; endcol = (*EndCol*)38 }); (233, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)27 }); (637, { line = (*Line*)190; col = (*Col*)10; endline = (*EndLine*)190; endcol = (*EndCol*)10 }); (305, { line = (*Line*)87; col = (*Col*)14; endline = (*EndLine*)87; endcol = (*EndCol*)14 }); (278, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)48 }); (619, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)35 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(83, ("R", "ada://parameter/Tetris_Functional-28:9/Move-138:14/R-138:49")); (86, ("Candidate", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Candidate+206:7")); (77, ("R", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/R-134:68")); (59, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Y-109:102")); (50, ("B", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/B-121:33")); (41, ("B", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/B-115:24")); (68, ("Has_Complete_Lines", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Has_Complete_Lines+111:7")); (53, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/X-107:60")); (62, ("Y", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/Y+66:7")); (8, ("Cur_Board", "ada://variable/Tetris_Functional-28:9/Cur_Board-55:4")); (17, ("Cur_Piece", "ada://variable/Tetris_Functional-28:9/Cur_Piece-76:4")); (44, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/R-115:70")); (80, ("R", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/R-136:61")); (71, ("R", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/R+114:7")); (74, ("R", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/R-124:54")); (56, ("Cur_Piece_S", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_S-109:37")); (47, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/R-117:45")); (14, ("D", "ada://component/Tetris_Functional-28:9/Piece-69:9/D-71:7")); (46, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/L-117:32")); (82, ("A", "ada://parameter/Tetris_Functional-28:9/Move-138:14/A-138:34")); (55, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/R-107:90")); (64, ("R", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/R+68:7")); (73, ("P", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/P-124:40")); (58, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/X-109:87")); (67, ("To_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/To_Line+110:7")); (85, ("Success", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/Success-140:37")); (49, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/R-119:42")); (13, ("S", "ada://component/Tetris_Functional-28:9/Piece-69:9/S-70:7")); (76, ("T", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/T-134:48")); (16, ("Y", "ada://component/Tetris_Functional-28:9/Piece-69:9/Y-73:7")); (79, ("A", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/A-136:46")); (88, ("Is_No_Overlap", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_No_Overlap+208:7")); (52, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Cur_Piece_D-107:33")); (43, ("X", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/X-115:54")); (70, ("From_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/From_Line+113:7")); (19, ("Cur_State", "ada://variable/Tetris_Functional-28:9/Cur_State-90:4")); (60, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/R-109:117")); (87, ("Is_Move_OK", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_Move_OK+207:7")); (69, ("Del_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Del_Line+112:7")); (78, ("P", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/P-136:32")); (63, ("X", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/X+67:7")); (54, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Y-107:75")); (72, ("B", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/B-124:26")); (81, ("P", "ada://parameter/Tetris_Functional-28:9/Move-138:14/P-138:20")); (57, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_D-109:60")); (48, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/L-119:29")); (84, ("A", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/A-140:25")); (75, ("D", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/D-134:30")); (66, ("Empty_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Empty_Line+108:7")); (15, ("X", "ada://component/Tetris_Functional-28:9/Piece-69:9/X-72:7")); (42, ("Y", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/Y-115:38")); (51, ("R", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/R-121:47"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(26, ("Is_Empty", "ada://procedure_body/Tetris_Functional-28:9/Is_Empty-115:14")); (35, ("Move_Is_Possible", "ada://procedure/Tetris_Functional-28:9/Move_Is_Possible-136:14")); (29, ("No_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/No_Complete_Lines-121:14")); (38, ("Include_Piece_In_Board", "ada://procedure_body/Tetris_Functional-28:9/Include_Piece_In_Board-142:14")); (25, ("Possible_Three_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_Three_Shapes-109:14")); (34, ("Turn_Direction", "ada://procedure/Tetris_Functional-28:9/Turn_Direction-134:14")); (37, ("Do_Action", "ada://procedure_body/Tetris_Functional-28:9/Do_Action-140:14")); (28, ("Is_Empty_Line", "ada://procedure/Tetris_Functional-28:9/Is_Empty_Line-119:14")); (27, ("Is_Complete_Line", "ada://procedure/Tetris_Functional-28:9/Is_Complete_Line-117:14")); (36, ("Move", "ada://procedure/Tetris_Functional-28:9/Move-138:14")); (30, ("No_Overlap", "ada://procedure/Tetris_Functional-28:9/No_Overlap-124:14")); (39, ("Delete_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/Delete_Complete_Lines-146:14")); (24, ("Possible_I_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_I_Shapes-107:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(40, ("Tetris_Functional", "ada://package_body/Tetris_Functional-28:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(23, ("Oriented_Three_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_Three_Shape-105:9")); (32, ("Move_Action", "ada://subtype/Tetris_Functional-28:9/Move_Action-131:12")); (11, ("Direction", "ada://ordinary_type/Tetris_Functional-28:9/Direction-67:9")); (2, ("Shape", "ada://subtype/Tetris_Functional-28:9/Shape-37:12")); (20, ("I_Delta", "ada://subtype/Tetris_Functional-28:9/I_Delta-102:12")); (5, ("Y_Coord", "ada://subtype/Tetris_Functional-28:9/Y_Coord-50:12")); (4, ("X_Coord", "ada://subtype/Tetris_Functional-28:9/X_Coord-49:12")); (31, ("Action", "ada://ordinary_type/Tetris_Functional-28:9/Action-129:9")); (22, ("Three_Delta", "ada://subtype/Tetris_Functional-28:9/Three_Delta-104:12")); (7, ("Board", "ada://ordinary_type/Tetris_Functional-28:9/Board-53:9")); (1, ("Cell", "ada://ordinary_type/Tetris_Functional-28:9/Cell-33:9")); (10, ("PY_Coord", "ada://subtype/Tetris_Functional-28:9/PY_Coord-64:12")); (9, ("PX_Coord", "ada://subtype/Tetris_Functional-28:9/PX_Coord-63:12")); (18, ("State", "ada://ordinary_type/Tetris_Functional-28:9/State-87:9")); (21, ("Oriented_I_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_I_Shape-103:9")); (3, ("Three_Shape", "ada://subtype/Tetris_Functional-28:9/Three_Shape-41:12")); (12, ("Piece", "ada://ordinary_type/Tetris_Functional-28:9/Piece-69:9")); (33, ("Turn_Action", "ada://subtype/Tetris_Functional-28:9/Turn_Action-132:12")); (6, ("Line", "ada://ordinary_type/Tetris_Functional-28:9/Line-52:9"))]
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
(SeqDeclRT (2,
(TypeDeclRT (3, (DerivedTypeDeclRT (4, ((*Cell*) 1), Integer, (RangeRT (0, 8)))))),
(SeqDeclRT (5,
(TypeDeclRT (6, (SubtypeDeclRT (7, ((*Shape*) 2), (Derived_Type ((*Cell*) 1)), (RangeRT (1, 8)))))),
(SeqDeclRT (8,
(TypeDeclRT (9, (SubtypeDeclRT (10, ((*Three_Shape*) 3), (Derived_Type ((*Cell*) 1)), (RangeRT (3, 8)))))),
(SeqDeclRT (11,
(TypeDeclRT (12, (SubtypeDeclRT (13, ((*X_Coord*) 4), Integer, (RangeRT (1, 10)))))),
(SeqDeclRT (14,
(TypeDeclRT (15, (SubtypeDeclRT (16, ((*Y_Coord*) 5), Integer, (RangeRT (1, 50)))))),
(SeqDeclRT (17,
(TypeDeclRT (18, (ArrayTypeDeclRT (19, ((*Line*) 6), ((*index subtype mark*) (Subtype ((*X_Coord*) 4))), ((*component type*) (Derived_Type ((*Cell*) 1))))))),
(SeqDeclRT (20,
(TypeDeclRT (21, (ArrayTypeDeclRT (22, ((*Board*) 7), ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))), ((*component type*) (Array_Type ((*Line*) 6))))))),
(SeqDeclRT (23,
(ObjDeclRT (24, { declaration_astnumRT = 25; object_nameRT = ((*Cur_Board*) 8); object_nominal_subtypeRT = (Array_Type ((*Board*) 7)); initialization_expRT = None })),
(SeqDeclRT (26,
(TypeDeclRT (27, (SubtypeDeclRT (28, ((*PX_Coord*) 9), Integer, (RangeRT ((-1), 9)))))),
(SeqDeclRT (29,
(TypeDeclRT (30, (SubtypeDeclRT (31, ((*PY_Coord*) 10), Integer, (RangeRT ((-1), 49)))))),
(SeqDeclRT (32,
(TypeDeclRT (33, (DerivedTypeDeclRT (34, ((*Direction*) 11), Integer, (RangeRT (0, 3)))))),
(SeqDeclRT (35,
(TypeDeclRT (36, (RecordTypeDeclRT (37, ((*Piece*) 12), [(((*S*) 13), (Subtype ((*Shape*) 2))); (((*D*) 14), (Derived_Type ((*Direction*) 11))); (((*X*) 15), (Subtype ((*PX_Coord*) 9))); (((*Y*) 16), (Subtype ((*PY_Coord*) 10)))])))),
(SeqDeclRT (39,
(ObjDeclRT (40, { declaration_astnumRT = 41; object_nameRT = ((*Cur_Piece*) 17); object_nominal_subtypeRT = (Record_Type ((*Piece*) 12)); initialization_expRT = None })),
(SeqDeclRT (42,
(TypeDeclRT (43, (DerivedTypeDeclRT (44, ((*State*) 18), Integer, (RangeRT (0, 3)))))),
(SeqDeclRT (45,
(ObjDeclRT (46, { declaration_astnumRT = 47; object_nameRT = ((*Cur_State*) 19); object_nominal_subtypeRT = (Derived_Type ((*State*) 18)); initialization_expRT = None })),
(SeqDeclRT (48,
(TypeDeclRT (49, (SubtypeDeclRT (50, ((*I_Delta*) 20), Integer, (RangeRT (0, 3)))))),
(SeqDeclRT (51,
(TypeDeclRT (52, (ArrayTypeDeclRT (53, ((*Oriented_I_Shape*) 21), ((*index subtype mark*) (Subtype ((*I_Delta*) 20))), ((*component type*) Boolean))))),
(SeqDeclRT (54,
(TypeDeclRT (55, (SubtypeDeclRT (56, ((*Three_Delta*) 22), Integer, (RangeRT (0, 2)))))),
(SeqDeclRT (57,
(TypeDeclRT (58, (ArrayTypeDeclRT (59, ((*Oriented_Three_Shape*) 23), ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))), ((*component type*) Boolean))))),
(SeqDeclRT (60,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (61,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (62,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (63,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (64,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (65,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (66,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (67,
(TypeDeclRT (68, (DerivedTypeDeclRT (69, ((*Action*) 31), Integer, (RangeRT (0, 4)))))),
(SeqDeclRT (70,
(TypeDeclRT (71, (SubtypeDeclRT (72, ((*Move_Action*) 32), (Derived_Type ((*Action*) 31)), (RangeRT (0, 1)))))),
(SeqDeclRT (73,
(TypeDeclRT (74, (SubtypeDeclRT (75, ((*Turn_Action*) 33), (Derived_Type ((*Action*) 31)), (RangeRT (3, 4)))))),
(SeqDeclRT (76,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (77,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (78,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (79,
NullDeclRT (* Undefined Declarations ! *),
(SeqDeclRT (80,
NullDeclRT (* Undefined Declarations ! *),
NullDeclRT (* Undefined Declarations ! *))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
(SeqDeclRT (81,
(ProcBodyDeclRT (82, 
  mkprocBodyDeclRT (
   83,
    (* = = = Procedure Name = = = *)
    ((*Is_Empty*) 26),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 84; parameter_nameRT = ((*B*) 41); parameter_subtype_markRT = (Array_Type ((*Board*) 7)); parameter_modeRT = In }; 
  { parameter_astnumRT = 85; parameter_nameRT = ((*Y*) 42); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 86; parameter_nameRT = ((*X*) 43); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 87; parameter_nameRT = ((*R*) 44); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (88, (IdentifierRT (89, ((*R*) 44) , [])), (LiteralRT (90, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (91,
(ProcBodyDeclRT (92, 
  mkprocBodyDeclRT (
   93,
    (* = = = Procedure Name = = = *)
    ((*Is_Complete_Line*) 27),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 94; parameter_nameRT = ((*L*) 46); parameter_subtype_markRT = (Array_Type ((*Line*) 6)); parameter_modeRT = In }; 
  { parameter_astnumRT = 95; parameter_nameRT = ((*R*) 47); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (96, (IdentifierRT (97, ((*R*) 47) , [])), (LiteralRT (98, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (99,
(ProcBodyDeclRT (100, 
  mkprocBodyDeclRT (
   101,
    (* = = = Procedure Name = = = *)
    ((*Is_Empty_Line*) 28),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 102; parameter_nameRT = ((*L*) 48); parameter_subtype_markRT = (Array_Type ((*Line*) 6)); parameter_modeRT = In }; 
  { parameter_astnumRT = 103; parameter_nameRT = ((*R*) 49); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (104, (IdentifierRT (105, ((*R*) 49) , [])), (LiteralRT (106, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (107,
(ProcBodyDeclRT (108, 
  mkprocBodyDeclRT (
   109,
    (* = = = Procedure Name = = = *)
    ((*No_Complete_Lines*) 29),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 110; parameter_nameRT = ((*B*) 50); parameter_subtype_markRT = (Array_Type ((*Board*) 7)); parameter_modeRT = In }; 
  { parameter_astnumRT = 111; parameter_nameRT = ((*R*) 51); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (112, (IdentifierRT (113, ((*R*) 51) , [])), (LiteralRT (114, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (115,
(ProcBodyDeclRT (116, 
  mkprocBodyDeclRT (
   117,
    (* = = = Procedure Name = = = *)
    ((*Possible_I_Shapes*) 24),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 118; parameter_nameRT = ((*Cur_Piece_D*) 52); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = In }; 
  { parameter_astnumRT = 119; parameter_nameRT = ((*X*) 53); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
  { parameter_astnumRT = 120; parameter_nameRT = ((*Y*) 54); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
  { parameter_astnumRT = 121; parameter_nameRT = ((*R*) 55); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (122, (IdentifierRT (123, ((*R*) 55) , [])), (LiteralRT (124, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (125,
(ProcBodyDeclRT (126, 
  mkprocBodyDeclRT (
   127,
    (* = = = Procedure Name = = = *)
    ((*Possible_Three_Shapes*) 25),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 128; parameter_nameRT = ((*Cur_Piece_S*) 56); parameter_subtype_markRT = (Subtype ((*Shape*) 2)); parameter_modeRT = In }; 
  { parameter_astnumRT = 129; parameter_nameRT = ((*Cur_Piece_D*) 57); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = In }; 
  { parameter_astnumRT = 130; parameter_nameRT = ((*X*) 58); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
  { parameter_astnumRT = 131; parameter_nameRT = ((*Y*) 59); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
  { parameter_astnumRT = 132; parameter_nameRT = ((*R*) 60); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (133, (IdentifierRT (134, ((*R*) 60) , [])), (LiteralRT (135, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (136,
(ProcBodyDeclRT (137, 
  mkprocBodyDeclRT (
   138,
    (* = = = Procedure Name = = = *)
    ((*Include_Piece_In_Board*) 38),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (139,
    (ObjDeclRT (141, { declaration_astnumRT = 142; object_nameRT = ((*Y*) 62); object_nominal_subtypeRT = (Subtype ((*I_Delta*) 20)); initialization_expRT = (Some ((LiteralRT (140, (Integer_Literal 0) , [], [])))) })),
    (SeqDeclRT (143,
    (ObjDeclRT (145, { declaration_astnumRT = 146; object_nameRT = ((*X*) 63); object_nominal_subtypeRT = (Subtype ((*I_Delta*) 20)); initialization_expRT = (Some ((LiteralRT (144, (Integer_Literal 0) , [], [])))) })),
    (ObjDeclRT (147, { declaration_astnumRT = 148; object_nameRT = ((*R*) 64); object_nominal_subtypeRT = Boolean; initialization_expRT = None })))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (149,
    (IfRT (150, (BinOpRT (151, Equal, (NameRT (152, (SelectedComponentRT (153, (IdentifierRT (154, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))), (LiteralRT (156, (Integer_Literal 2) , [], [])) , [], [])),
      (SeqRT (157,
      (AssignRT (158, (IndexedComponentRT (159, (IndexedComponentRT (160, (IdentifierRT (161, ((*Cur_Board*) 8) , [])), (NameRT (162, (SelectedComponentRT (163, (IdentifierRT (164, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [RangeCheck])))) , [])), (NameRT (166, (SelectedComponentRT (167, (IdentifierRT (168, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [RangeCheck])))) , [])), (NameRT (170, (SelectedComponentRT (171, (IdentifierRT (172, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
      (SeqRT (174,
      (AssignRT (175, (IndexedComponentRT (176, (IndexedComponentRT (177, (IdentifierRT (178, ((*Cur_Board*) 8) , [])), (BinOpRT (179, Plus, (NameRT (180, (SelectedComponentRT (181, (IdentifierRT (182, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (LiteralRT (184, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (NameRT (185, (SelectedComponentRT (186, (IdentifierRT (187, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [RangeCheck])))) , [])), (NameRT (189, (SelectedComponentRT (190, (IdentifierRT (191, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
      (SeqRT (193,
      (AssignRT (194, (IndexedComponentRT (195, (IndexedComponentRT (196, (IdentifierRT (197, ((*Cur_Board*) 8) , [])), (NameRT (198, (SelectedComponentRT (199, (IdentifierRT (200, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [RangeCheck])))) , [])), (BinOpRT (202, Plus, (NameRT (203, (SelectedComponentRT (204, (IdentifierRT (205, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (LiteralRT (207, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (NameRT (208, (SelectedComponentRT (209, (IdentifierRT (210, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
      (AssignRT (212, (IndexedComponentRT (213, (IndexedComponentRT (214, (IdentifierRT (215, ((*Cur_Board*) 8) , [])), (BinOpRT (216, Plus, (NameRT (217, (SelectedComponentRT (218, (IdentifierRT (219, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (LiteralRT (221, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (BinOpRT (222, Plus, (NameRT (223, (SelectedComponentRT (224, (IdentifierRT (225, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (LiteralRT (227, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (NameRT (228, (SelectedComponentRT (229, (IdentifierRT (230, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))))))))),
      (IfRT (232, (BinOpRT (233, Equal, (NameRT (234, (SelectedComponentRT (235, (IdentifierRT (236, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))), (LiteralRT (238, (Integer_Literal 1) , [], [])) , [], [])),
        (WhileRT (239, (BinOpRT (240, Less_Than_Or_Equal, (NameRT (241, (IdentifierRT (242, ((*Y*) 62) , [])))), (LiteralRT (243, (Integer_Literal 3) , [], [])) , [], [])),
          (SeqRT (244,
          (WhileRT (245, (BinOpRT (246, Less_Than_Or_Equal, (NameRT (247, (IdentifierRT (248, ((*X*) 63) , [])))), (LiteralRT (249, (Integer_Literal 3) , [], [])) , [], [])),
            (SeqRT (250,
            (CallRT (251, 252, ((*Possible_I_Shapes*) 24), 
              [(NameRT (253, (SelectedComponentRT (254, (IdentifierRT (255, ((*Cur_Piece*) 17) , [])), ((*D*) 14) , [])))); (NameRT (257, (IdentifierRT (258, ((*Y*) 62) , [])))); (NameRT (259, (IdentifierRT (260, ((*X*) 63) , [])))); (NameRT (261, (IdentifierRT (262, ((*R*) 64) , []))))])
            ),
            (SeqRT (263,
            (IfRT (264, (NameRT (265, (IdentifierRT (266, ((*R*) 64) , [])))),
              (AssignRT (267, (IndexedComponentRT (268, (IndexedComponentRT (269, (IdentifierRT (270, ((*Cur_Board*) 8) , [])), (BinOpRT (271, Plus, (NameRT (272, (SelectedComponentRT (273, (IdentifierRT (274, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (NameRT (276, (IdentifierRT (277, ((*Y*) 62) , [])))) , [RangeCheck], [])) , [])), (BinOpRT (278, Plus, (NameRT (279, (SelectedComponentRT (280, (IdentifierRT (281, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (NameRT (283, (IdentifierRT (284, ((*X*) 63) , [])))) , [RangeCheck], [])) , [])), (NameRT (285, (SelectedComponentRT (286, (IdentifierRT (287, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
              NullRT)
            ),
            (AssignRT (289, (IdentifierRT (290, ((*X*) 63) , [])), (BinOpRT (291, Plus, (NameRT (292, (IdentifierRT (293, ((*X*) 63) , [])))), (LiteralRT (294, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
          ),
          (AssignRT (295, (IdentifierRT (296, ((*Y*) 62) , [])), (BinOpRT (297, Plus, (NameRT (298, (IdentifierRT (299, ((*Y*) 62) , [])))), (LiteralRT (300, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))
        ),
        (WhileRT (301, (BinOpRT (302, Less_Than_Or_Equal, (NameRT (303, (IdentifierRT (304, ((*Y*) 62) , [])))), (LiteralRT (305, (Integer_Literal 2) , [], [])) , [], [])),
          (SeqRT (306,
          (WhileRT (307, (BinOpRT (308, Less_Than_Or_Equal, (NameRT (309, (IdentifierRT (310, ((*X*) 63) , [])))), (LiteralRT (311, (Integer_Literal 2) , [], [])) , [], [])),
            (SeqRT (312,
            (CallRT (313, 314, ((*Possible_Three_Shapes*) 25), 
              [(NameRT (315, (SelectedComponentRT (316, (IdentifierRT (317, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))); (NameRT (319, (SelectedComponentRT (320, (IdentifierRT (321, ((*Cur_Piece*) 17) , [])), ((*D*) 14) , [])))); (NameRT (323, (IdentifierRT (324, ((*Y*) 62) , [])))); (NameRT (325, (IdentifierRT (326, ((*X*) 63) , [])))); (NameRT (327, (IdentifierRT (328, ((*R*) 64) , []))))])
            ),
            (SeqRT (329,
            (IfRT (330, (NameRT (331, (IdentifierRT (332, ((*R*) 64) , [])))),
              (AssignRT (333, (IndexedComponentRT (334, (IndexedComponentRT (335, (IdentifierRT (336, ((*Cur_Board*) 8) , [])), (BinOpRT (337, Plus, (NameRT (338, (SelectedComponentRT (339, (IdentifierRT (340, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (NameRT (342, (IdentifierRT (343, ((*Y*) 62) , [])))) , [RangeCheck], [])) , [])), (BinOpRT (344, Plus, (NameRT (345, (SelectedComponentRT (346, (IdentifierRT (347, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (NameRT (349, (IdentifierRT (350, ((*X*) 63) , [])))) , [RangeCheck], [])) , [])), (NameRT (351, (SelectedComponentRT (352, (IdentifierRT (353, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
              NullRT)
            ),
            (AssignRT (355, (IdentifierRT (356, ((*X*) 63) , [])), (BinOpRT (357, Plus, (NameRT (358, (IdentifierRT (359, ((*X*) 63) , [])))), (LiteralRT (360, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
          ),
          (AssignRT (361, (IdentifierRT (362, ((*Y*) 62) , [])), (BinOpRT (363, Plus, (NameRT (364, (IdentifierRT (365, ((*Y*) 62) , [])))), (LiteralRT (366, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))
        ))
      ))
    ),
    (AssignRT (367, (IdentifierRT (368, ((*Cur_State*) 19) , [])), (LiteralRT (369, (Integer_Literal 2) , [], []))))))
  ))
),
(SeqDeclRT (370,
(ProcBodyDeclRT (371, 
  mkprocBodyDeclRT (
   372,
    (* = = = Procedure Name = = = *)
    ((*Delete_Complete_Lines*) 39),
    (* = = = Formal Parameters = = = *)
    [],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (373,
    (ObjDeclRT (374, { declaration_astnumRT = 375; object_nameRT = ((*Empty_Line*) 66); object_nominal_subtypeRT = (Array_Type ((*Line*) 6)); initialization_expRT = None })),
    (SeqDeclRT (376,
    (ObjDeclRT (378, { declaration_astnumRT = 379; object_nameRT = ((*To_Line*) 67); object_nominal_subtypeRT = (Subtype ((*Y_Coord*) 5)); initialization_expRT = (Some ((LiteralRT (377, (Integer_Literal 10) , [], [])))) })),
    (SeqDeclRT (380,
    (ObjDeclRT (382, { declaration_astnumRT = 383; object_nameRT = ((*Has_Complete_Lines*) 68); object_nominal_subtypeRT = Boolean; initialization_expRT = (Some ((LiteralRT (381, (Boolean_Literal false) , [], [])))) })),
    (SeqDeclRT (384,
    (ObjDeclRT (386, { declaration_astnumRT = 387; object_nameRT = ((*Del_Line*) 69); object_nominal_subtypeRT = (Subtype ((*Y_Coord*) 5)); initialization_expRT = (Some ((LiteralRT (385, (Integer_Literal 1) , [], [])))) })),
    (SeqDeclRT (388,
    (ObjDeclRT (389, { declaration_astnumRT = 390; object_nameRT = ((*From_Line*) 70); object_nominal_subtypeRT = (Subtype ((*Y_Coord*) 5)); initialization_expRT = None })),
    (ObjDeclRT (391, { declaration_astnumRT = 392; object_nameRT = ((*R*) 71); object_nominal_subtypeRT = Boolean; initialization_expRT = None })))))))))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (393,
    (WhileRT (394, (BinOpRT (395, Less_Than_Or_Equal, (NameRT (396, (IdentifierRT (397, ((*Del_Line*) 69) , [])))), (LiteralRT (398, (Integer_Literal 50) , [], [])) , [], [])),
      (SeqRT (399,
      (CallRT (400, 401, ((*Is_Complete_Line*) 27), 
        [(NameRT (402, (IndexedComponentRT (403, (IdentifierRT (404, ((*Cur_Board*) 8) , [])), (NameRT (405, (IdentifierRT (406, ((*Del_Line*) 69) , [])))) , [])))); (NameRT (407, (IdentifierRT (408, ((*R*) 71) , []))))])
      ),
      (SeqRT (409,
      (IfRT (410, (NameRT (411, (IdentifierRT (412, ((*R*) 71) , [])))),
        (SeqRT (413,
        (AssignRT (414, (IndexedComponentRT (415, (IdentifierRT (416, ((*Cur_Board*) 8) , [])), (NameRT (417, (IdentifierRT (418, ((*Del_Line*) 69) , [])))) , [])), (NameRT (419, (IdentifierRT (420, ((*Empty_Line*) 66) , [])))))),
        (SeqRT (421,
        (AssignRT (422, (IdentifierRT (423, ((*Has_Complete_Lines*) 68) , [])), (LiteralRT (424, (Boolean_Literal true) , [], [])))),
        (AssignRT (425, (IdentifierRT (426, ((*To_Line*) 67) , [])), (NameRT (427, (IdentifierRT (428, ((*Del_Line*) 69) , [])))))))))),
        NullRT)
      ),
      (AssignRT (429, (IdentifierRT (430, ((*Del_Line*) 69) , [])), (BinOpRT (431, Plus, (NameRT (432, (IdentifierRT (433, ((*Del_Line*) 69) , [])))), (LiteralRT (434, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
    ),
    (SeqRT (435,
    (IfRT (436, (NameRT (437, (IdentifierRT (438, ((*Has_Complete_Lines*) 68) , [])))),
      (SeqRT (439,
      (AssignRT (440, (IdentifierRT (441, ((*From_Line*) 70) , [])), (LiteralRT (442, (Integer_Literal 9) , [], [])))),
      (WhileRT (443, (BinOpRT (444, Greater_Than_Or_Equal, (NameRT (445, (IdentifierRT (446, ((*From_Line*) 70) , [])))), (LiteralRT (447, (Integer_Literal 1) , [], [])) , [], [])),
        (SeqRT (448,
        (CallRT (449, 450, ((*Is_Empty_Line*) 28), 
          [(NameRT (451, (IndexedComponentRT (452, (IdentifierRT (453, ((*Cur_Board*) 8) , [])), (NameRT (454, (IdentifierRT (455, ((*From_Line*) 70) , [])))) , [])))); (NameRT (456, (IdentifierRT (457, ((*R*) 71) , []))))])
        ),
        (SeqRT (458,
        (IfRT (459, (UnOpRT (460, Not, (NameRT (461, (IdentifierRT (462, ((*R*) 71) , [])))) , [], [])),
          (SeqRT (463,
          (AssignRT (464, (IndexedComponentRT (465, (IdentifierRT (466, ((*Cur_Board*) 8) , [])), (NameRT (467, (IdentifierRT (468, ((*To_Line*) 67) , [])))) , [])), (NameRT (469, (IndexedComponentRT (470, (IdentifierRT (471, ((*Cur_Board*) 8) , [])), (NameRT (472, (IdentifierRT (473, ((*From_Line*) 70) , [])))) , [])))))),
          (SeqRT (474,
          (AssignRT (475, (IndexedComponentRT (476, (IdentifierRT (477, ((*Cur_Board*) 8) , [])), (NameRT (478, (IdentifierRT (479, ((*From_Line*) 70) , [])))) , [])), (NameRT (480, (IdentifierRT (481, ((*Empty_Line*) 66) , [])))))),
          (AssignRT (482, (IdentifierRT (483, ((*To_Line*) 67) , [])), (BinOpRT (484, Minus, (NameRT (485, (IdentifierRT (486, ((*To_Line*) 67) , [])))), (LiteralRT (487, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))),
          NullRT)
        ),
        (AssignRT (488, (IdentifierRT (489, ((*From_Line*) 70) , [])), (BinOpRT (490, Minus, (NameRT (491, (IdentifierRT (492, ((*From_Line*) 70) , [])))), (LiteralRT (493, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
      ))),
      NullRT)
    ),
    (AssignRT (494, (IdentifierRT (495, ((*Cur_State*) 19) , [])), (LiteralRT (496, (Integer_Literal 3) , [], []))))))))
  ))
),
(SeqDeclRT (497,
(ProcBodyDeclRT (498, 
  mkprocBodyDeclRT (
   499,
    (* = = = Procedure Name = = = *)
    ((*No_Overlap*) 30),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 500; parameter_nameRT = ((*B*) 72); parameter_subtype_markRT = (Array_Type ((*Board*) 7)); parameter_modeRT = In }; 
  { parameter_astnumRT = 501; parameter_nameRT = ((*P*) 73); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = In }; 
  { parameter_astnumRT = 502; parameter_nameRT = ((*R*) 74); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (AssignRT (503, (IdentifierRT (504, ((*R*) 74) , [])), (LiteralRT (505, (Boolean_Literal true) , [], []))))
  ))
),
(SeqDeclRT (506,
(ProcBodyDeclRT (507, 
  mkprocBodyDeclRT (
   508,
    (* = = = Procedure Name = = = *)
    ((*Turn_Direction*) 34),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 509; parameter_nameRT = ((*D*) 75); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = In }; 
  { parameter_astnumRT = 510; parameter_nameRT = ((*T*) 76); parameter_subtype_markRT = (Subtype ((*Turn_Action*) 33)); parameter_modeRT = In }; 
  { parameter_astnumRT = 511; parameter_nameRT = ((*R*) 77); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (IfRT (512, (BinOpRT (513, Equal, (NameRT (514, (IdentifierRT (515, ((*T*) 76) , [])))), (LiteralRT (516, (Integer_Literal 3) , [], [])) , [], [])),
      (IfRT (517, (BinOpRT (518, Equal, (NameRT (519, (IdentifierRT (520, ((*D*) 75) , [])))), (LiteralRT (521, (Integer_Literal 0) , [], [])) , [], [])),
        (AssignRT (522, (IdentifierRT (523, ((*R*) 77) , [])), (LiteralRT (524, (Integer_Literal 3) , [], [])))),
        (AssignRT (525, (IdentifierRT (526, ((*R*) 77) , [])), (BinOpRT (527, Minus, (NameRT (528, (IdentifierRT (529, ((*D*) 75) , [])))), (LiteralRT (530, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))
      ),
      (IfRT (531, (BinOpRT (532, Equal, (NameRT (533, (IdentifierRT (534, ((*D*) 75) , [])))), (LiteralRT (535, (Integer_Literal 3) , [], [])) , [], [])),
        (AssignRT (536, (IdentifierRT (537, ((*R*) 77) , [])), (LiteralRT (538, (Integer_Literal 0) , [], [])))),
        (AssignRT (539, (IdentifierRT (540, ((*R*) 77) , [])), (BinOpRT (541, Plus, (NameRT (542, (IdentifierRT (543, ((*D*) 75) , [])))), (LiteralRT (544, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))
      ))
    )
  ))
),
(SeqDeclRT (545,
(ProcBodyDeclRT (546, 
  mkprocBodyDeclRT (
   547,
    (* = = = Procedure Name = = = *)
    ((*Move_Is_Possible*) 35),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 548; parameter_nameRT = ((*P*) 78); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = In }; 
  { parameter_astnumRT = 549; parameter_nameRT = ((*A*) 79); parameter_subtype_markRT = (Derived_Type ((*Action*) 31)); parameter_modeRT = In }; 
  { parameter_astnumRT = 550; parameter_nameRT = ((*R*) 80); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (IfRT (551, (BinOpRT (552, Equal, (NameRT (553, (IdentifierRT (554, ((*A*) 79) , [])))), (LiteralRT (555, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (556, (IdentifierRT (557, ((*R*) 80) , [])), (BinOpRT (558, And, (BinOpRT (559, Greater_Than_Or_Equal, (BinOpRT (560, Minus, (NameRT (561, (SelectedComponentRT (562, (IdentifierRT (563, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (565, (Integer_Literal 1) , [], [])) , [], [])), (UnOpRT (566, Unary_Minus, (LiteralRT (567, (Integer_Literal 1) , [], [])) , [], [])) , [], [])), (BinOpRT (568, Less_Than_Or_Equal, (BinOpRT (569, Minus, (NameRT (570, (SelectedComponentRT (571, (IdentifierRT (572, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (574, (Integer_Literal 1) , [], [])) , [], [])), (LiteralRT (575, (Integer_Literal 9) , [], [])) , [], [])) , [], [])))),
      (IfRT (576, (BinOpRT (577, Equal, (NameRT (578, (IdentifierRT (579, ((*A*) 79) , [])))), (LiteralRT (580, (Integer_Literal 1) , [], [])) , [], [])),
        (AssignRT (581, (IdentifierRT (582, ((*R*) 80) , [])), (BinOpRT (583, And, (BinOpRT (584, Greater_Than_Or_Equal, (BinOpRT (585, Plus, (NameRT (586, (SelectedComponentRT (587, (IdentifierRT (588, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (590, (Integer_Literal 1) , [], [])) , [], [])), (UnOpRT (591, Unary_Minus, (LiteralRT (592, (Integer_Literal 1) , [], [])) , [], [])) , [], [])), (BinOpRT (593, Less_Than_Or_Equal, (BinOpRT (594, Plus, (NameRT (595, (SelectedComponentRT (596, (IdentifierRT (597, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (599, (Integer_Literal 1) , [], [])) , [], [])), (LiteralRT (600, (Integer_Literal 9) , [], [])) , [], [])) , [], [])))),
        (IfRT (601, (BinOpRT (602, Equal, (NameRT (603, (IdentifierRT (604, ((*A*) 79) , [])))), (LiteralRT (605, (Integer_Literal 2) , [], [])) , [], [])),
          (AssignRT (606, (IdentifierRT (607, ((*R*) 80) , [])), (BinOpRT (608, And, (BinOpRT (609, Greater_Than_Or_Equal, (BinOpRT (610, Plus, (NameRT (611, (SelectedComponentRT (612, (IdentifierRT (613, ((*P*) 78) , [])), ((*Y*) 16) , [])))), (LiteralRT (615, (Integer_Literal 1) , [], [])) , [], [])), (UnOpRT (616, Unary_Minus, (LiteralRT (617, (Integer_Literal 1) , [], [])) , [], [])) , [], [])), (BinOpRT (618, Less_Than_Or_Equal, (BinOpRT (619, Plus, (NameRT (620, (SelectedComponentRT (621, (IdentifierRT (622, ((*P*) 78) , [])), ((*Y*) 16) , [])))), (LiteralRT (624, (Integer_Literal 1) , [], [])) , [], [])), (LiteralRT (625, (Integer_Literal 49) , [], [])) , [], [])) , [], [])))),
          (AssignRT (626, (IdentifierRT (627, ((*R*) 80) , [])), (LiteralRT (628, (Boolean_Literal true) , [], [])))))
        ))
      ))
    )
  ))
),
(SeqDeclRT (629,
(ProcBodyDeclRT (630, 
  mkprocBodyDeclRT (
   631,
    (* = = = Procedure Name = = = *)
    ((*Move*) 36),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 632; parameter_nameRT = ((*P*) 81); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = In }; 
  { parameter_astnumRT = 633; parameter_nameRT = ((*A*) 82); parameter_subtype_markRT = (Derived_Type ((*Action*) 31)); parameter_modeRT = In }; 
  { parameter_astnumRT = 634; parameter_nameRT = ((*R*) 83); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    NullDeclRT,
    (* = = = Procedure Body = = = *)
    (IfRT (635, (BinOpRT (636, Equal, (NameRT (637, (IdentifierRT (638, ((*A*) 82) , [])))), (LiteralRT (639, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (640, (SelectedComponentRT (641, (IdentifierRT (642, ((*R*) 83) , [])), ((*X*) 15) , [])), (BinOpRT (644, Minus, (NameRT (645, (SelectedComponentRT (646, (IdentifierRT (647, ((*P*) 81) , [])), ((*X*) 15) , [])))), (LiteralRT (649, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
      (IfRT (650, (BinOpRT (651, Equal, (NameRT (652, (IdentifierRT (653, ((*A*) 82) , [])))), (LiteralRT (654, (Integer_Literal 1) , [], [])) , [], [])),
        (AssignRT (655, (SelectedComponentRT (656, (IdentifierRT (657, ((*R*) 83) , [])), ((*X*) 15) , [])), (BinOpRT (659, Plus, (NameRT (660, (SelectedComponentRT (661, (IdentifierRT (662, ((*P*) 81) , [])), ((*X*) 15) , [])))), (LiteralRT (664, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
        (IfRT (665, (BinOpRT (666, Equal, (NameRT (667, (IdentifierRT (668, ((*A*) 82) , [])))), (LiteralRT (669, (Integer_Literal 2) , [], [])) , [], [])),
          (AssignRT (670, (SelectedComponentRT (671, (IdentifierRT (672, ((*R*) 83) , [])), ((*Y*) 16) , [])), (BinOpRT (674, Plus, (NameRT (675, (SelectedComponentRT (676, (IdentifierRT (677, ((*P*) 81) , [])), ((*Y*) 16) , [])))), (LiteralRT (679, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
          (CallRT (680, 681, ((*Turn_Direction*) 34), 
            [(NameRT (682, (SelectedComponentRT (683, (IdentifierRT (684, ((*P*) 81) , [])), ((*D*) 14) , [])))); (NameRT (686, (IdentifierRT (687, ((*A*) 82) , [RangeCheck])))); (NameRT (688, (SelectedComponentRT (689, (IdentifierRT (690, ((*R*) 83) , [])), ((*D*) 14) , []))))])
          ))
        ))
      ))
    )
  ))
),
(ProcBodyDeclRT (692, 
  mkprocBodyDeclRT (
   693,
    (* = = = Procedure Name = = = *)
    ((*Do_Action*) 37),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 694; parameter_nameRT = ((*A*) 84); parameter_subtype_markRT = (Derived_Type ((*Action*) 31)); parameter_modeRT = In }; 
  { parameter_astnumRT = 695; parameter_nameRT = ((*Success*) 85); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    (SeqDeclRT (696,
    (ObjDeclRT (697, { declaration_astnumRT = 698; object_nameRT = ((*Candidate*) 86); object_nominal_subtypeRT = (Record_Type ((*Piece*) 12)); initialization_expRT = None })),
    (SeqDeclRT (699,
    (ObjDeclRT (700, { declaration_astnumRT = 701; object_nameRT = ((*Is_Move_OK*) 87); object_nominal_subtypeRT = Boolean; initialization_expRT = None })),
    (ObjDeclRT (702, { declaration_astnumRT = 703; object_nameRT = ((*Is_No_Overlap*) 88); object_nominal_subtypeRT = Boolean; initialization_expRT = None })))))),
    (* = = = Procedure Body = = = *)
    (SeqRT (704,
    (CallRT (705, 706, ((*Move_Is_Possible*) 35), 
      [(NameRT (707, (IdentifierRT (708, ((*Cur_Piece*) 17) , [])))); (NameRT (709, (IdentifierRT (710, ((*A*) 84) , [])))); (NameRT (711, (IdentifierRT (712, ((*Is_Move_OK*) 87) , []))))])
    ),
    (SeqRT (713,
    (IfRT (714, (NameRT (715, (IdentifierRT (716, ((*Is_Move_OK*) 87) , [])))),
      (SeqRT (717,
      (CallRT (718, 719, ((*Move*) 36), 
        [(NameRT (720, (IdentifierRT (721, ((*Cur_Piece*) 17) , [])))); (NameRT (722, (IdentifierRT (723, ((*A*) 84) , [])))); (NameRT (724, (IdentifierRT (725, ((*Candidate*) 86) , []))))])
      ),
      (SeqRT (726,
      (CallRT (727, 728, ((*No_Overlap*) 30), 
        [(NameRT (729, (IdentifierRT (730, ((*Cur_Board*) 8) , [])))); (NameRT (731, (IdentifierRT (732, ((*Candidate*) 86) , [])))); (NameRT (733, (IdentifierRT (734, ((*Is_No_Overlap*) 88) , []))))])
      ),
      (IfRT (735, (NameRT (736, (IdentifierRT (737, ((*Is_No_Overlap*) 88) , [])))),
        (SeqRT (738,
        (AssignRT (739, (IdentifierRT (740, ((*Cur_Piece*) 17) , [])), (NameRT (741, (IdentifierRT (742, ((*Candidate*) 86) , [])))))),
        (SeqRT (743,
        (AssignRT (744, (IdentifierRT (745, ((*Success*) 85) , [])), (LiteralRT (746, (Boolean_Literal true) , [], [])))),
        NullRT (* Ignore Return Statement ! *))))),
        NullRT)
      ))))),
      NullRT)
    ),
    (AssignRT (747, (IdentifierRT (748, ((*Success*) 85) , [])), (LiteralRT (749, (Boolean_Literal false) , [], []))))))))
  ))
)))))))))))))))))))))))))));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*R*) 49), (Out, Boolean)); (((*X*) 53), (In, (Subtype ((*I_Delta*) 20)))); (((*Cur_Board*) 8), (In_Out, (Array_Type ((*Board*) 7)))); (((*To_Line*) 67), (In_Out, (Subtype ((*Y_Coord*) 5)))); (((*R*) 55), (Out, Boolean)); (((*P*) 81), (In, (Record_Type ((*Piece*) 12)))); (((*A*) 82), (In, (Derived_Type ((*Action*) 31)))); (((*From_Line*) 70), (In_Out, (Subtype ((*Y_Coord*) 5)))); (((*R*) 64), (In_Out, Boolean)); (((*Is_No_Overlap*) 88), (In_Out, Boolean)); (((*L*) 48), (In, (Array_Type ((*Line*) 6)))); (((*Candidate*) 86), (In_Out, (Record_Type ((*Piece*) 12)))); (((*X*) 58), (In, (Subtype ((*I_Delta*) 20)))); (((*Success*) 85), (Out, Boolean)); (((*B*) 72), (In, (Array_Type ((*Board*) 7)))); (((*Y*) 54), (In, (Subtype ((*I_Delta*) 20)))); (((*X*) 43), (In, Integer)); (((*Is_Move_OK*) 87), (In_Out, Boolean)); (((*T*) 76), (In, (Subtype ((*Turn_Action*) 33)))); (((*Has_Complete_Lines*) 68), (In_Out, Boolean)); (((*Cur_State*) 19), (In_Out, (Derived_Type ((*State*) 18)))); (((*R*) 51), (Out, Boolean)); (((*Y*) 42), (In, Integer)); (((*A*) 84), (In, (Derived_Type ((*Action*) 31)))); (((*Cur_Piece_D*) 52), (In, (Derived_Type ((*Direction*) 11)))); (((*B*) 41), (In, (Array_Type ((*Board*) 7)))); (((*Cur_Piece_S*) 56), (In, (Subtype ((*Shape*) 2)))); (((*Y*) 59), (In, (Subtype ((*I_Delta*) 20)))); (((*D*) 75), (In, (Derived_Type ((*Direction*) 11)))); (((*R*) 47), (Out, Boolean)); (((*Del_Line*) 69), (In_Out, (Subtype ((*Y_Coord*) 5)))); (((*R*) 60), (Out, Boolean)); (((*X*) 63), (In_Out, (Subtype ((*I_Delta*) 20)))); (((*P*) 73), (In, (Record_Type ((*Piece*) 12)))); (((*B*) 50), (In, (Array_Type ((*Board*) 7)))); (((*R*) 77), (Out, (Derived_Type ((*Direction*) 11)))); (((*R*) 44), (Out, Boolean)); (((*R*) 83), (Out, (Record_Type ((*Piece*) 12)))); (((*Cur_Piece_D*) 57), (In, (Derived_Type ((*Direction*) 11)))); (((*Y*) 62), (In_Out, (Subtype ((*I_Delta*) 20)))); (((*R*) 74), (Out, Boolean)); (((*L*) 46), (In, (Array_Type ((*Line*) 6)))); (((*R*) 80), (Out, Boolean)); (((*Empty_Line*) 66), (In_Out, (Array_Type ((*Line*) 6)))); (((*A*) 79), (In, (Derived_Type ((*Action*) 31)))); (((*P*) 78), (In, (Record_Type ((*Piece*) 12)))); (((*R*) 71), (In_Out, Boolean)); (((*Cur_Piece*) 17), (In_Out, (Record_Type ((*Piece*) 12))))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Possible_Three_Shapes*) 25), (0, mkprocBodyDeclRT (
 127,
  (* = = = Procedure Name = = = *)
  ((*Possible_Three_Shapes*) 25),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 128; parameter_nameRT = ((*Cur_Piece_S*) 56); parameter_subtype_markRT = (Subtype ((*Shape*) 2)); parameter_modeRT = In }; 
{ parameter_astnumRT = 129; parameter_nameRT = ((*Cur_Piece_D*) 57); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = In }; 
{ parameter_astnumRT = 130; parameter_nameRT = ((*X*) 58); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
{ parameter_astnumRT = 131; parameter_nameRT = ((*Y*) 59); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
{ parameter_astnumRT = 132; parameter_nameRT = ((*R*) 60); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (133, (IdentifierRT (134, ((*R*) 60) , [])), (LiteralRT (135, (Boolean_Literal true) , [], []))))
))); (((*Do_Action*) 37), (0, mkprocBodyDeclRT (
 693,
  (* = = = Procedure Name = = = *)
  ((*Do_Action*) 37),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 694; parameter_nameRT = ((*A*) 84); parameter_subtype_markRT = (Derived_Type ((*Action*) 31)); parameter_modeRT = In }; 
{ parameter_astnumRT = 695; parameter_nameRT = ((*Success*) 85); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (696,
  (ObjDeclRT (697, { declaration_astnumRT = 698; object_nameRT = ((*Candidate*) 86); object_nominal_subtypeRT = (Record_Type ((*Piece*) 12)); initialization_expRT = None })),
  (SeqDeclRT (699,
  (ObjDeclRT (700, { declaration_astnumRT = 701; object_nameRT = ((*Is_Move_OK*) 87); object_nominal_subtypeRT = Boolean; initialization_expRT = None })),
  (ObjDeclRT (702, { declaration_astnumRT = 703; object_nameRT = ((*Is_No_Overlap*) 88); object_nominal_subtypeRT = Boolean; initialization_expRT = None })))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (704,
  (CallRT (705, 706, ((*Move_Is_Possible*) 35), 
    [(NameRT (707, (IdentifierRT (708, ((*Cur_Piece*) 17) , [])))); (NameRT (709, (IdentifierRT (710, ((*A*) 84) , [])))); (NameRT (711, (IdentifierRT (712, ((*Is_Move_OK*) 87) , []))))])
  ),
  (SeqRT (713,
  (IfRT (714, (NameRT (715, (IdentifierRT (716, ((*Is_Move_OK*) 87) , [])))),
    (SeqRT (717,
    (CallRT (718, 719, ((*Move*) 36), 
      [(NameRT (720, (IdentifierRT (721, ((*Cur_Piece*) 17) , [])))); (NameRT (722, (IdentifierRT (723, ((*A*) 84) , [])))); (NameRT (724, (IdentifierRT (725, ((*Candidate*) 86) , []))))])
    ),
    (SeqRT (726,
    (CallRT (727, 728, ((*No_Overlap*) 30), 
      [(NameRT (729, (IdentifierRT (730, ((*Cur_Board*) 8) , [])))); (NameRT (731, (IdentifierRT (732, ((*Candidate*) 86) , [])))); (NameRT (733, (IdentifierRT (734, ((*Is_No_Overlap*) 88) , []))))])
    ),
    (IfRT (735, (NameRT (736, (IdentifierRT (737, ((*Is_No_Overlap*) 88) , [])))),
      (SeqRT (738,
      (AssignRT (739, (IdentifierRT (740, ((*Cur_Piece*) 17) , [])), (NameRT (741, (IdentifierRT (742, ((*Candidate*) 86) , [])))))),
      (SeqRT (743,
      (AssignRT (744, (IdentifierRT (745, ((*Success*) 85) , [])), (LiteralRT (746, (Boolean_Literal true) , [], [])))),
      NullRT (* Ignore Return Statement ! *))))),
      NullRT)
    ))))),
    NullRT)
  ),
  (AssignRT (747, (IdentifierRT (748, ((*Success*) 85) , [])), (LiteralRT (749, (Boolean_Literal false) , [], []))))))))
))); (((*No_Complete_Lines*) 29), (0, mkprocBodyDeclRT (
 109,
  (* = = = Procedure Name = = = *)
  ((*No_Complete_Lines*) 29),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 110; parameter_nameRT = ((*B*) 50); parameter_subtype_markRT = (Array_Type ((*Board*) 7)); parameter_modeRT = In }; 
{ parameter_astnumRT = 111; parameter_nameRT = ((*R*) 51); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (112, (IdentifierRT (113, ((*R*) 51) , [])), (LiteralRT (114, (Boolean_Literal true) , [], []))))
))); (((*Is_Complete_Line*) 27), (0, mkprocBodyDeclRT (
 93,
  (* = = = Procedure Name = = = *)
  ((*Is_Complete_Line*) 27),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 94; parameter_nameRT = ((*L*) 46); parameter_subtype_markRT = (Array_Type ((*Line*) 6)); parameter_modeRT = In }; 
{ parameter_astnumRT = 95; parameter_nameRT = ((*R*) 47); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (96, (IdentifierRT (97, ((*R*) 47) , [])), (LiteralRT (98, (Boolean_Literal true) , [], []))))
))); (((*Is_Empty*) 26), (0, mkprocBodyDeclRT (
 83,
  (* = = = Procedure Name = = = *)
  ((*Is_Empty*) 26),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 84; parameter_nameRT = ((*B*) 41); parameter_subtype_markRT = (Array_Type ((*Board*) 7)); parameter_modeRT = In }; 
{ parameter_astnumRT = 85; parameter_nameRT = ((*Y*) 42); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 86; parameter_nameRT = ((*X*) 43); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 87; parameter_nameRT = ((*R*) 44); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (88, (IdentifierRT (89, ((*R*) 44) , [])), (LiteralRT (90, (Boolean_Literal true) , [], []))))
))); (((*No_Overlap*) 30), (0, mkprocBodyDeclRT (
 499,
  (* = = = Procedure Name = = = *)
  ((*No_Overlap*) 30),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 500; parameter_nameRT = ((*B*) 72); parameter_subtype_markRT = (Array_Type ((*Board*) 7)); parameter_modeRT = In }; 
{ parameter_astnumRT = 501; parameter_nameRT = ((*P*) 73); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = In }; 
{ parameter_astnumRT = 502; parameter_nameRT = ((*R*) 74); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (503, (IdentifierRT (504, ((*R*) 74) , [])), (LiteralRT (505, (Boolean_Literal true) , [], []))))
))); (((*Possible_I_Shapes*) 24), (0, mkprocBodyDeclRT (
 117,
  (* = = = Procedure Name = = = *)
  ((*Possible_I_Shapes*) 24),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 118; parameter_nameRT = ((*Cur_Piece_D*) 52); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = In }; 
{ parameter_astnumRT = 119; parameter_nameRT = ((*X*) 53); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
{ parameter_astnumRT = 120; parameter_nameRT = ((*Y*) 54); parameter_subtype_markRT = (Subtype ((*I_Delta*) 20)); parameter_modeRT = In }; 
{ parameter_astnumRT = 121; parameter_nameRT = ((*R*) 55); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (122, (IdentifierRT (123, ((*R*) 55) , [])), (LiteralRT (124, (Boolean_Literal true) , [], []))))
))); (((*Include_Piece_In_Board*) 38), (0, mkprocBodyDeclRT (
 138,
  (* = = = Procedure Name = = = *)
  ((*Include_Piece_In_Board*) 38),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (139,
  (ObjDeclRT (141, { declaration_astnumRT = 142; object_nameRT = ((*Y*) 62); object_nominal_subtypeRT = (Subtype ((*I_Delta*) 20)); initialization_expRT = (Some ((LiteralRT (140, (Integer_Literal 0) , [], [])))) })),
  (SeqDeclRT (143,
  (ObjDeclRT (145, { declaration_astnumRT = 146; object_nameRT = ((*X*) 63); object_nominal_subtypeRT = (Subtype ((*I_Delta*) 20)); initialization_expRT = (Some ((LiteralRT (144, (Integer_Literal 0) , [], [])))) })),
  (ObjDeclRT (147, { declaration_astnumRT = 148; object_nameRT = ((*R*) 64); object_nominal_subtypeRT = Boolean; initialization_expRT = None })))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (149,
  (IfRT (150, (BinOpRT (151, Equal, (NameRT (152, (SelectedComponentRT (153, (IdentifierRT (154, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))), (LiteralRT (156, (Integer_Literal 2) , [], [])) , [], [])),
    (SeqRT (157,
    (AssignRT (158, (IndexedComponentRT (159, (IndexedComponentRT (160, (IdentifierRT (161, ((*Cur_Board*) 8) , [])), (NameRT (162, (SelectedComponentRT (163, (IdentifierRT (164, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [RangeCheck])))) , [])), (NameRT (166, (SelectedComponentRT (167, (IdentifierRT (168, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [RangeCheck])))) , [])), (NameRT (170, (SelectedComponentRT (171, (IdentifierRT (172, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
    (SeqRT (174,
    (AssignRT (175, (IndexedComponentRT (176, (IndexedComponentRT (177, (IdentifierRT (178, ((*Cur_Board*) 8) , [])), (BinOpRT (179, Plus, (NameRT (180, (SelectedComponentRT (181, (IdentifierRT (182, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (LiteralRT (184, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (NameRT (185, (SelectedComponentRT (186, (IdentifierRT (187, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [RangeCheck])))) , [])), (NameRT (189, (SelectedComponentRT (190, (IdentifierRT (191, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
    (SeqRT (193,
    (AssignRT (194, (IndexedComponentRT (195, (IndexedComponentRT (196, (IdentifierRT (197, ((*Cur_Board*) 8) , [])), (NameRT (198, (SelectedComponentRT (199, (IdentifierRT (200, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [RangeCheck])))) , [])), (BinOpRT (202, Plus, (NameRT (203, (SelectedComponentRT (204, (IdentifierRT (205, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (LiteralRT (207, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (NameRT (208, (SelectedComponentRT (209, (IdentifierRT (210, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
    (AssignRT (212, (IndexedComponentRT (213, (IndexedComponentRT (214, (IdentifierRT (215, ((*Cur_Board*) 8) , [])), (BinOpRT (216, Plus, (NameRT (217, (SelectedComponentRT (218, (IdentifierRT (219, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (LiteralRT (221, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (BinOpRT (222, Plus, (NameRT (223, (SelectedComponentRT (224, (IdentifierRT (225, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (LiteralRT (227, (Integer_Literal 1) , [], [])) , [RangeCheck], [])) , [])), (NameRT (228, (SelectedComponentRT (229, (IdentifierRT (230, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))))))))),
    (IfRT (232, (BinOpRT (233, Equal, (NameRT (234, (SelectedComponentRT (235, (IdentifierRT (236, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))), (LiteralRT (238, (Integer_Literal 1) , [], [])) , [], [])),
      (WhileRT (239, (BinOpRT (240, Less_Than_Or_Equal, (NameRT (241, (IdentifierRT (242, ((*Y*) 62) , [])))), (LiteralRT (243, (Integer_Literal 3) , [], [])) , [], [])),
        (SeqRT (244,
        (WhileRT (245, (BinOpRT (246, Less_Than_Or_Equal, (NameRT (247, (IdentifierRT (248, ((*X*) 63) , [])))), (LiteralRT (249, (Integer_Literal 3) , [], [])) , [], [])),
          (SeqRT (250,
          (CallRT (251, 252, ((*Possible_I_Shapes*) 24), 
            [(NameRT (253, (SelectedComponentRT (254, (IdentifierRT (255, ((*Cur_Piece*) 17) , [])), ((*D*) 14) , [])))); (NameRT (257, (IdentifierRT (258, ((*Y*) 62) , [])))); (NameRT (259, (IdentifierRT (260, ((*X*) 63) , [])))); (NameRT (261, (IdentifierRT (262, ((*R*) 64) , []))))])
          ),
          (SeqRT (263,
          (IfRT (264, (NameRT (265, (IdentifierRT (266, ((*R*) 64) , [])))),
            (AssignRT (267, (IndexedComponentRT (268, (IndexedComponentRT (269, (IdentifierRT (270, ((*Cur_Board*) 8) , [])), (BinOpRT (271, Plus, (NameRT (272, (SelectedComponentRT (273, (IdentifierRT (274, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (NameRT (276, (IdentifierRT (277, ((*Y*) 62) , [])))) , [RangeCheck], [])) , [])), (BinOpRT (278, Plus, (NameRT (279, (SelectedComponentRT (280, (IdentifierRT (281, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (NameRT (283, (IdentifierRT (284, ((*X*) 63) , [])))) , [RangeCheck], [])) , [])), (NameRT (285, (SelectedComponentRT (286, (IdentifierRT (287, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
            NullRT)
          ),
          (AssignRT (289, (IdentifierRT (290, ((*X*) 63) , [])), (BinOpRT (291, Plus, (NameRT (292, (IdentifierRT (293, ((*X*) 63) , [])))), (LiteralRT (294, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
        ),
        (AssignRT (295, (IdentifierRT (296, ((*Y*) 62) , [])), (BinOpRT (297, Plus, (NameRT (298, (IdentifierRT (299, ((*Y*) 62) , [])))), (LiteralRT (300, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))
      ),
      (WhileRT (301, (BinOpRT (302, Less_Than_Or_Equal, (NameRT (303, (IdentifierRT (304, ((*Y*) 62) , [])))), (LiteralRT (305, (Integer_Literal 2) , [], [])) , [], [])),
        (SeqRT (306,
        (WhileRT (307, (BinOpRT (308, Less_Than_Or_Equal, (NameRT (309, (IdentifierRT (310, ((*X*) 63) , [])))), (LiteralRT (311, (Integer_Literal 2) , [], [])) , [], [])),
          (SeqRT (312,
          (CallRT (313, 314, ((*Possible_Three_Shapes*) 25), 
            [(NameRT (315, (SelectedComponentRT (316, (IdentifierRT (317, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))); (NameRT (319, (SelectedComponentRT (320, (IdentifierRT (321, ((*Cur_Piece*) 17) , [])), ((*D*) 14) , [])))); (NameRT (323, (IdentifierRT (324, ((*Y*) 62) , [])))); (NameRT (325, (IdentifierRT (326, ((*X*) 63) , [])))); (NameRT (327, (IdentifierRT (328, ((*R*) 64) , []))))])
          ),
          (SeqRT (329,
          (IfRT (330, (NameRT (331, (IdentifierRT (332, ((*R*) 64) , [])))),
            (AssignRT (333, (IndexedComponentRT (334, (IndexedComponentRT (335, (IdentifierRT (336, ((*Cur_Board*) 8) , [])), (BinOpRT (337, Plus, (NameRT (338, (SelectedComponentRT (339, (IdentifierRT (340, ((*Cur_Piece*) 17) , [])), ((*Y*) 16) , [])))), (NameRT (342, (IdentifierRT (343, ((*Y*) 62) , [])))) , [RangeCheck], [])) , [])), (BinOpRT (344, Plus, (NameRT (345, (SelectedComponentRT (346, (IdentifierRT (347, ((*Cur_Piece*) 17) , [])), ((*X*) 15) , [])))), (NameRT (349, (IdentifierRT (350, ((*X*) 63) , [])))) , [RangeCheck], [])) , [])), (NameRT (351, (SelectedComponentRT (352, (IdentifierRT (353, ((*Cur_Piece*) 17) , [])), ((*S*) 13) , [])))))),
            NullRT)
          ),
          (AssignRT (355, (IdentifierRT (356, ((*X*) 63) , [])), (BinOpRT (357, Plus, (NameRT (358, (IdentifierRT (359, ((*X*) 63) , [])))), (LiteralRT (360, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
        ),
        (AssignRT (361, (IdentifierRT (362, ((*Y*) 62) , [])), (BinOpRT (363, Plus, (NameRT (364, (IdentifierRT (365, ((*Y*) 62) , [])))), (LiteralRT (366, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))
      ))
    ))
  ),
  (AssignRT (367, (IdentifierRT (368, ((*Cur_State*) 19) , [])), (LiteralRT (369, (Integer_Literal 2) , [], []))))))
))); (((*Is_Empty_Line*) 28), (0, mkprocBodyDeclRT (
 101,
  (* = = = Procedure Name = = = *)
  ((*Is_Empty_Line*) 28),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 102; parameter_nameRT = ((*L*) 48); parameter_subtype_markRT = (Array_Type ((*Line*) 6)); parameter_modeRT = In }; 
{ parameter_astnumRT = 103; parameter_nameRT = ((*R*) 49); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (AssignRT (104, (IdentifierRT (105, ((*R*) 49) , [])), (LiteralRT (106, (Boolean_Literal true) , [], []))))
))); (((*Move_Is_Possible*) 35), (0, mkprocBodyDeclRT (
 547,
  (* = = = Procedure Name = = = *)
  ((*Move_Is_Possible*) 35),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 548; parameter_nameRT = ((*P*) 78); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = In }; 
{ parameter_astnumRT = 549; parameter_nameRT = ((*A*) 79); parameter_subtype_markRT = (Derived_Type ((*Action*) 31)); parameter_modeRT = In }; 
{ parameter_astnumRT = 550; parameter_nameRT = ((*R*) 80); parameter_subtype_markRT = Boolean; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (IfRT (551, (BinOpRT (552, Equal, (NameRT (553, (IdentifierRT (554, ((*A*) 79) , [])))), (LiteralRT (555, (Integer_Literal 0) , [], [])) , [], [])),
    (AssignRT (556, (IdentifierRT (557, ((*R*) 80) , [])), (BinOpRT (558, And, (BinOpRT (559, Greater_Than_Or_Equal, (BinOpRT (560, Minus, (NameRT (561, (SelectedComponentRT (562, (IdentifierRT (563, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (565, (Integer_Literal 1) , [], [])) , [], [])), (UnOpRT (566, Unary_Minus, (LiteralRT (567, (Integer_Literal 1) , [], [])) , [], [])) , [], [])), (BinOpRT (568, Less_Than_Or_Equal, (BinOpRT (569, Minus, (NameRT (570, (SelectedComponentRT (571, (IdentifierRT (572, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (574, (Integer_Literal 1) , [], [])) , [], [])), (LiteralRT (575, (Integer_Literal 9) , [], [])) , [], [])) , [], [])))),
    (IfRT (576, (BinOpRT (577, Equal, (NameRT (578, (IdentifierRT (579, ((*A*) 79) , [])))), (LiteralRT (580, (Integer_Literal 1) , [], [])) , [], [])),
      (AssignRT (581, (IdentifierRT (582, ((*R*) 80) , [])), (BinOpRT (583, And, (BinOpRT (584, Greater_Than_Or_Equal, (BinOpRT (585, Plus, (NameRT (586, (SelectedComponentRT (587, (IdentifierRT (588, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (590, (Integer_Literal 1) , [], [])) , [], [])), (UnOpRT (591, Unary_Minus, (LiteralRT (592, (Integer_Literal 1) , [], [])) , [], [])) , [], [])), (BinOpRT (593, Less_Than_Or_Equal, (BinOpRT (594, Plus, (NameRT (595, (SelectedComponentRT (596, (IdentifierRT (597, ((*P*) 78) , [])), ((*X*) 15) , [])))), (LiteralRT (599, (Integer_Literal 1) , [], [])) , [], [])), (LiteralRT (600, (Integer_Literal 9) , [], [])) , [], [])) , [], [])))),
      (IfRT (601, (BinOpRT (602, Equal, (NameRT (603, (IdentifierRT (604, ((*A*) 79) , [])))), (LiteralRT (605, (Integer_Literal 2) , [], [])) , [], [])),
        (AssignRT (606, (IdentifierRT (607, ((*R*) 80) , [])), (BinOpRT (608, And, (BinOpRT (609, Greater_Than_Or_Equal, (BinOpRT (610, Plus, (NameRT (611, (SelectedComponentRT (612, (IdentifierRT (613, ((*P*) 78) , [])), ((*Y*) 16) , [])))), (LiteralRT (615, (Integer_Literal 1) , [], [])) , [], [])), (UnOpRT (616, Unary_Minus, (LiteralRT (617, (Integer_Literal 1) , [], [])) , [], [])) , [], [])), (BinOpRT (618, Less_Than_Or_Equal, (BinOpRT (619, Plus, (NameRT (620, (SelectedComponentRT (621, (IdentifierRT (622, ((*P*) 78) , [])), ((*Y*) 16) , [])))), (LiteralRT (624, (Integer_Literal 1) , [], [])) , [], [])), (LiteralRT (625, (Integer_Literal 49) , [], [])) , [], [])) , [], [])))),
        (AssignRT (626, (IdentifierRT (627, ((*R*) 80) , [])), (LiteralRT (628, (Boolean_Literal true) , [], [])))))
      ))
    ))
  )
))); (((*Turn_Direction*) 34), (0, mkprocBodyDeclRT (
 508,
  (* = = = Procedure Name = = = *)
  ((*Turn_Direction*) 34),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 509; parameter_nameRT = ((*D*) 75); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = In }; 
{ parameter_astnumRT = 510; parameter_nameRT = ((*T*) 76); parameter_subtype_markRT = (Subtype ((*Turn_Action*) 33)); parameter_modeRT = In }; 
{ parameter_astnumRT = 511; parameter_nameRT = ((*R*) 77); parameter_subtype_markRT = (Derived_Type ((*Direction*) 11)); parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (IfRT (512, (BinOpRT (513, Equal, (NameRT (514, (IdentifierRT (515, ((*T*) 76) , [])))), (LiteralRT (516, (Integer_Literal 3) , [], [])) , [], [])),
    (IfRT (517, (BinOpRT (518, Equal, (NameRT (519, (IdentifierRT (520, ((*D*) 75) , [])))), (LiteralRT (521, (Integer_Literal 0) , [], [])) , [], [])),
      (AssignRT (522, (IdentifierRT (523, ((*R*) 77) , [])), (LiteralRT (524, (Integer_Literal 3) , [], [])))),
      (AssignRT (525, (IdentifierRT (526, ((*R*) 77) , [])), (BinOpRT (527, Minus, (NameRT (528, (IdentifierRT (529, ((*D*) 75) , [])))), (LiteralRT (530, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))
    ),
    (IfRT (531, (BinOpRT (532, Equal, (NameRT (533, (IdentifierRT (534, ((*D*) 75) , [])))), (LiteralRT (535, (Integer_Literal 3) , [], [])) , [], [])),
      (AssignRT (536, (IdentifierRT (537, ((*R*) 77) , [])), (LiteralRT (538, (Integer_Literal 0) , [], [])))),
      (AssignRT (539, (IdentifierRT (540, ((*R*) 77) , [])), (BinOpRT (541, Plus, (NameRT (542, (IdentifierRT (543, ((*D*) 75) , [])))), (LiteralRT (544, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))
    ))
  )
))); (((*Move*) 36), (0, mkprocBodyDeclRT (
 631,
  (* = = = Procedure Name = = = *)
  ((*Move*) 36),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 632; parameter_nameRT = ((*P*) 81); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = In }; 
{ parameter_astnumRT = 633; parameter_nameRT = ((*A*) 82); parameter_subtype_markRT = (Derived_Type ((*Action*) 31)); parameter_modeRT = In }; 
{ parameter_astnumRT = 634; parameter_nameRT = ((*R*) 83); parameter_subtype_markRT = (Record_Type ((*Piece*) 12)); parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  NullDeclRT,
  (* = = = Procedure Body = = = *)
  (IfRT (635, (BinOpRT (636, Equal, (NameRT (637, (IdentifierRT (638, ((*A*) 82) , [])))), (LiteralRT (639, (Integer_Literal 0) , [], [])) , [], [])),
    (AssignRT (640, (SelectedComponentRT (641, (IdentifierRT (642, ((*R*) 83) , [])), ((*X*) 15) , [])), (BinOpRT (644, Minus, (NameRT (645, (SelectedComponentRT (646, (IdentifierRT (647, ((*P*) 81) , [])), ((*X*) 15) , [])))), (LiteralRT (649, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
    (IfRT (650, (BinOpRT (651, Equal, (NameRT (652, (IdentifierRT (653, ((*A*) 82) , [])))), (LiteralRT (654, (Integer_Literal 1) , [], [])) , [], [])),
      (AssignRT (655, (SelectedComponentRT (656, (IdentifierRT (657, ((*R*) 83) , [])), ((*X*) 15) , [])), (BinOpRT (659, Plus, (NameRT (660, (SelectedComponentRT (661, (IdentifierRT (662, ((*P*) 81) , [])), ((*X*) 15) , [])))), (LiteralRT (664, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
      (IfRT (665, (BinOpRT (666, Equal, (NameRT (667, (IdentifierRT (668, ((*A*) 82) , [])))), (LiteralRT (669, (Integer_Literal 2) , [], [])) , [], [])),
        (AssignRT (670, (SelectedComponentRT (671, (IdentifierRT (672, ((*R*) 83) , [])), ((*Y*) 16) , [])), (BinOpRT (674, Plus, (NameRT (675, (SelectedComponentRT (676, (IdentifierRT (677, ((*P*) 81) , [])), ((*Y*) 16) , [])))), (LiteralRT (679, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))),
        (CallRT (680, 681, ((*Turn_Direction*) 34), 
          [(NameRT (682, (SelectedComponentRT (683, (IdentifierRT (684, ((*P*) 81) , [])), ((*D*) 14) , [])))); (NameRT (686, (IdentifierRT (687, ((*A*) 82) , [RangeCheck])))); (NameRT (688, (SelectedComponentRT (689, (IdentifierRT (690, ((*R*) 83) , [])), ((*D*) 14) , []))))])
        ))
      ))
    ))
  )
))); (((*Delete_Complete_Lines*) 39), (0, mkprocBodyDeclRT (
 372,
  (* = = = Procedure Name = = = *)
  ((*Delete_Complete_Lines*) 39),
  (* = = = Formal Parameters = = = *)
  [],
  (* = = = Object Declarations = = = *)
  (SeqDeclRT (373,
  (ObjDeclRT (374, { declaration_astnumRT = 375; object_nameRT = ((*Empty_Line*) 66); object_nominal_subtypeRT = (Array_Type ((*Line*) 6)); initialization_expRT = None })),
  (SeqDeclRT (376,
  (ObjDeclRT (378, { declaration_astnumRT = 379; object_nameRT = ((*To_Line*) 67); object_nominal_subtypeRT = (Subtype ((*Y_Coord*) 5)); initialization_expRT = (Some ((LiteralRT (377, (Integer_Literal 10) , [], [])))) })),
  (SeqDeclRT (380,
  (ObjDeclRT (382, { declaration_astnumRT = 383; object_nameRT = ((*Has_Complete_Lines*) 68); object_nominal_subtypeRT = Boolean; initialization_expRT = (Some ((LiteralRT (381, (Boolean_Literal false) , [], [])))) })),
  (SeqDeclRT (384,
  (ObjDeclRT (386, { declaration_astnumRT = 387; object_nameRT = ((*Del_Line*) 69); object_nominal_subtypeRT = (Subtype ((*Y_Coord*) 5)); initialization_expRT = (Some ((LiteralRT (385, (Integer_Literal 1) , [], [])))) })),
  (SeqDeclRT (388,
  (ObjDeclRT (389, { declaration_astnumRT = 390; object_nameRT = ((*From_Line*) 70); object_nominal_subtypeRT = (Subtype ((*Y_Coord*) 5)); initialization_expRT = None })),
  (ObjDeclRT (391, { declaration_astnumRT = 392; object_nameRT = ((*R*) 71); object_nominal_subtypeRT = Boolean; initialization_expRT = None })))))))))))),
  (* = = = Procedure Body = = = *)
  (SeqRT (393,
  (WhileRT (394, (BinOpRT (395, Less_Than_Or_Equal, (NameRT (396, (IdentifierRT (397, ((*Del_Line*) 69) , [])))), (LiteralRT (398, (Integer_Literal 50) , [], [])) , [], [])),
    (SeqRT (399,
    (CallRT (400, 401, ((*Is_Complete_Line*) 27), 
      [(NameRT (402, (IndexedComponentRT (403, (IdentifierRT (404, ((*Cur_Board*) 8) , [])), (NameRT (405, (IdentifierRT (406, ((*Del_Line*) 69) , [])))) , [])))); (NameRT (407, (IdentifierRT (408, ((*R*) 71) , []))))])
    ),
    (SeqRT (409,
    (IfRT (410, (NameRT (411, (IdentifierRT (412, ((*R*) 71) , [])))),
      (SeqRT (413,
      (AssignRT (414, (IndexedComponentRT (415, (IdentifierRT (416, ((*Cur_Board*) 8) , [])), (NameRT (417, (IdentifierRT (418, ((*Del_Line*) 69) , [])))) , [])), (NameRT (419, (IdentifierRT (420, ((*Empty_Line*) 66) , [])))))),
      (SeqRT (421,
      (AssignRT (422, (IdentifierRT (423, ((*Has_Complete_Lines*) 68) , [])), (LiteralRT (424, (Boolean_Literal true) , [], [])))),
      (AssignRT (425, (IdentifierRT (426, ((*To_Line*) 67) , [])), (NameRT (427, (IdentifierRT (428, ((*Del_Line*) 69) , [])))))))))),
      NullRT)
    ),
    (AssignRT (429, (IdentifierRT (430, ((*Del_Line*) 69) , [])), (BinOpRT (431, Plus, (NameRT (432, (IdentifierRT (433, ((*Del_Line*) 69) , [])))), (LiteralRT (434, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
  ),
  (SeqRT (435,
  (IfRT (436, (NameRT (437, (IdentifierRT (438, ((*Has_Complete_Lines*) 68) , [])))),
    (SeqRT (439,
    (AssignRT (440, (IdentifierRT (441, ((*From_Line*) 70) , [])), (LiteralRT (442, (Integer_Literal 9) , [], [])))),
    (WhileRT (443, (BinOpRT (444, Greater_Than_Or_Equal, (NameRT (445, (IdentifierRT (446, ((*From_Line*) 70) , [])))), (LiteralRT (447, (Integer_Literal 1) , [], [])) , [], [])),
      (SeqRT (448,
      (CallRT (449, 450, ((*Is_Empty_Line*) 28), 
        [(NameRT (451, (IndexedComponentRT (452, (IdentifierRT (453, ((*Cur_Board*) 8) , [])), (NameRT (454, (IdentifierRT (455, ((*From_Line*) 70) , [])))) , [])))); (NameRT (456, (IdentifierRT (457, ((*R*) 71) , []))))])
      ),
      (SeqRT (458,
      (IfRT (459, (UnOpRT (460, Not, (NameRT (461, (IdentifierRT (462, ((*R*) 71) , [])))) , [], [])),
        (SeqRT (463,
        (AssignRT (464, (IndexedComponentRT (465, (IdentifierRT (466, ((*Cur_Board*) 8) , [])), (NameRT (467, (IdentifierRT (468, ((*To_Line*) 67) , [])))) , [])), (NameRT (469, (IndexedComponentRT (470, (IdentifierRT (471, ((*Cur_Board*) 8) , [])), (NameRT (472, (IdentifierRT (473, ((*From_Line*) 70) , [])))) , [])))))),
        (SeqRT (474,
        (AssignRT (475, (IndexedComponentRT (476, (IdentifierRT (477, ((*Cur_Board*) 8) , [])), (NameRT (478, (IdentifierRT (479, ((*From_Line*) 70) , [])))) , [])), (NameRT (480, (IdentifierRT (481, ((*Empty_Line*) 66) , [])))))),
        (AssignRT (482, (IdentifierRT (483, ((*To_Line*) 67) , [])), (BinOpRT (484, Minus, (NameRT (485, (IdentifierRT (486, ((*To_Line*) 67) , [])))), (LiteralRT (487, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))),
        NullRT)
      ),
      (AssignRT (488, (IdentifierRT (489, ((*From_Line*) 70) , [])), (BinOpRT (490, Minus, (NameRT (491, (IdentifierRT (492, ((*From_Line*) 70) , [])))), (LiteralRT (493, (Integer_Literal 1) , [], [])) , [RangeCheck], [])))))))))
    ))),
    NullRT)
  ),
  (AssignRT (494, (IdentifierRT (495, ((*Cur_State*) 19) , [])), (LiteralRT (496, (Integer_Literal 3) , [], []))))))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [(((*Oriented_Three_Shape*) 23), (ArrayTypeDeclRT (59, ((*Oriented_Three_Shape*) 23), ((*index subtype mark*) (Subtype ((*Three_Delta*) 22))), ((*component type*) Boolean)))); (((*Y_Coord*) 5), (SubtypeDeclRT (16, ((*Y_Coord*) 5), Integer, (RangeRT (1, 50))))); (((*Board*) 7), (ArrayTypeDeclRT (22, ((*Board*) 7), ((*index subtype mark*) (Subtype ((*Y_Coord*) 5))), ((*component type*) (Array_Type ((*Line*) 6)))))); (((*Move_Action*) 32), (SubtypeDeclRT (72, ((*Move_Action*) 32), (Derived_Type ((*Action*) 31)), (RangeRT (0, 1))))); (((*Cell*) 1), (DerivedTypeDeclRT (4, ((*Cell*) 1), Integer, (RangeRT (0, 8))))); (((*Line*) 6), (ArrayTypeDeclRT (19, ((*Line*) 6), ((*index subtype mark*) (Subtype ((*X_Coord*) 4))), ((*component type*) (Derived_Type ((*Cell*) 1)))))); (((*PY_Coord*) 10), (SubtypeDeclRT (31, ((*PY_Coord*) 10), Integer, (RangeRT ((-1), 49))))); (((*Oriented_I_Shape*) 21), (ArrayTypeDeclRT (53, ((*Oriented_I_Shape*) 21), ((*index subtype mark*) (Subtype ((*I_Delta*) 20))), ((*component type*) Boolean)))); (((*Action*) 31), (DerivedTypeDeclRT (69, ((*Action*) 31), Integer, (RangeRT (0, 4))))); (((*Direction*) 11), (DerivedTypeDeclRT (34, ((*Direction*) 11), Integer, (RangeRT (0, 3))))); (((*Piece*) 12), (RecordTypeDeclRT (37, ((*Piece*) 12), [(((*S*) 13), (Subtype ((*Shape*) 2))); (((*D*) 14), (Derived_Type ((*Direction*) 11))); (((*X*) 15), (Subtype ((*PX_Coord*) 9))); (((*Y*) 16), (Subtype ((*PY_Coord*) 10)))]))); (((*Shape*) 2), (SubtypeDeclRT (7, ((*Shape*) 2), (Derived_Type ((*Cell*) 1)), (RangeRT (1, 8))))); (((*I_Delta*) 20), (SubtypeDeclRT (50, ((*I_Delta*) 20), Integer, (RangeRT (0, 3))))); (((*State*) 18), (DerivedTypeDeclRT (44, ((*State*) 18), Integer, (RangeRT (0, 3))))); (((*X_Coord*) 4), (SubtypeDeclRT (13, ((*X_Coord*) 4), Integer, (RangeRT (1, 10))))); (((*Turn_Action*) 33), (SubtypeDeclRT (75, ((*Turn_Action*) 33), (Derived_Type ((*Action*) 31)), (RangeRT (3, 4))))); (((*Three_Delta*) 22), (SubtypeDeclRT (56, ((*Three_Delta*) 22), Integer, (RangeRT (0, 2))))); (((*Three_Shape*) 3), (SubtypeDeclRT (10, ((*Three_Shape*) 3), (Derived_Type ((*Cell*) 1)), (RangeRT (3, 8))))); (((*PX_Coord*) 9), (SubtypeDeclRT (28, ((*PX_Coord*) 9), Integer, (RangeRT ((-1), 9)))))];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(218, (Subtype ((*PY_Coord*) 10))); (559, Boolean); (227, Integer); (568, Boolean); (433, (Subtype ((*Y_Coord*) 5))); (442, Integer); (200, (Record_Type ((*Piece*) 12))); (173, (Subtype ((*Shape*) 2))); (514, (Subtype ((*Turn_Action*) 33))); (209, (Subtype ((*Shape*) 2))); (523, (Derived_Type ((*Direction*) 11))); (182, (Record_Type ((*Piece*) 12))); (254, (Derived_Type ((*Direction*) 11))); (191, (Record_Type ((*Piece*) 12))); (720, (Record_Type ((*Piece*) 12))); (729, (Array_Type ((*Board*) 7))); (424, Boolean); (155, (Subtype ((*Shape*) 2))); (469, (Array_Type ((*Line*) 6))); (496, Integer); (164, (Record_Type ((*Piece*) 12))); (478, (Subtype ((*Y_Coord*) 5))); (505, Boolean); (577, Boolean); (451, (Array_Type ((*Line*) 6))); (460, Boolean); (532, Boolean); (541, (Derived_Type ((*Direction*) 11))); (406, (Subtype ((*Y_Coord*) 5))); (415, (Array_Type ((*Line*) 6))); (487, Integer); (236, (Record_Type ((*Piece*) 12))); (741, (Record_Type ((*Piece*) 12))); (678, (Subtype ((*PY_Coord*) 10))); (445, (Subtype ((*Y_Coord*) 5))); (732, (Record_Type ((*Piece*) 12))); (472, (Subtype ((*Y_Coord*) 5))); (427, (Subtype ((*Y_Coord*) 5))); (176, (Derived_Type ((*Cell*) 1))); (723, (Derived_Type ((*Action*) 31))); (418, (Subtype ((*Y_Coord*) 5))); (490, Integer); (185, (Subtype ((*PX_Coord*) 9))); (167, (Subtype ((*PX_Coord*) 9))); (364, (Subtype ((*I_Delta*) 20))); (140, Integer); (113, Boolean); (454, (Subtype ((*Y_Coord*) 5))); (481, (Array_Type ((*Line*) 6))); (687, (Derived_Type ((*Action*) 31))); (660, (Subtype ((*PX_Coord*) 9))); (346, (Subtype ((*PX_Coord*) 9))); (669, Integer); (708, (Record_Type ((*Piece*) 12))); (403, (Array_Type ((*Line*) 6))); (134, Boolean); (600, Integer); (609, Boolean); (690, (Record_Type ((*Piece*) 12))); (349, (Subtype ((*I_Delta*) 20))); (358, (Subtype ((*I_Delta*) 20))); (430, (Subtype ((*Y_Coord*) 5))); (672, (Record_Type ((*Piece*) 12))); (645, (Subtype ((*PX_Coord*) 9))); (331, Boolean); (304, (Subtype ((*I_Delta*) 20))); (654, Integer); (340, (Record_Type ((*Piece*) 12))); (89, Boolean); (286, (Subtype ((*Shape*) 2))); (627, Boolean); (636, Boolean); (457, Boolean); (663, (Subtype ((*PX_Coord*) 9))); (98, Boolean); (412, Boolean); (618, Boolean); (322, (Derived_Type ((*Direction*) 11))); (385, Integer); (567, Integer); (639, Integer); (648, (Subtype ((*PX_Coord*) 9))); (397, (Subtype ((*Y_Coord*) 5))); (262, Boolean); (603, (Derived_Type ((*Action*) 31))); (298, (Subtype ((*I_Delta*) 20))); (711, Boolean); (684, (Record_Type ((*Piece*) 12))); (343, (Subtype ((*I_Delta*) 20))); (352, (Subtype ((*Shape*) 2))); (558, Boolean); (585, Integer); (253, (Derived_Type ((*Direction*) 11))); (226, (Subtype ((*PX_Coord*) 9))); (594, Integer); (666, Boolean); (325, (Subtype ((*I_Delta*) 20))); (675, (Subtype ((*PY_Coord*) 10))); (334, (Derived_Type ((*Cell*) 1))); (540, (Derived_Type ((*Direction*) 11))); (235, (Subtype ((*Shape*) 2))); (621, (Subtype ((*PY_Coord*) 10))); (657, (Record_Type ((*Piece*) 12))); (316, (Subtype ((*Shape*) 2))); (271, Integer); (612, (Subtype ((*PY_Coord*) 10))); (280, (Subtype ((*PX_Coord*) 9))); (319, (Derived_Type ((*Direction*) 11))); (516, Integer); (552, Boolean); (184, Integer); (534, (Derived_Type ((*Direction*) 11))); (597, (Record_Type ((*Piece*) 12))); (265, Boolean); (615, Integer); (480, (Array_Type ((*Line*) 6))); (256, (Derived_Type ((*Direction*) 11))); (337, Integer); (211, (Subtype ((*Shape*) 2))); (283, (Subtype ((*I_Delta*) 20))); (624, Integer); (292, (Subtype ((*I_Delta*) 20))); (166, (Subtype ((*PX_Coord*) 9))); (579, (Derived_Type ((*Action*) 31))); (274, (Record_Type ((*Piece*) 12))); (247, (Subtype ((*I_Delta*) 20))); (588, (Record_Type ((*Piece*) 12))); (328, Boolean); (489, (Subtype ((*Y_Coord*) 5))); (220, (Subtype ((*PY_Coord*) 10))); (561, (Subtype ((*PX_Coord*) 9))); (229, (Subtype ((*Shape*) 2))); (543, (Derived_Type ((*Direction*) 11))); (570, (Subtype ((*PX_Coord*) 9))); (202, Integer); (238, Integer); (642, (Record_Type ((*Piece*) 12))); (651, Boolean); (310, (Subtype ((*I_Delta*) 20))); (277, (Subtype ((*I_Delta*) 20))); (483, (Subtype ((*Y_Coord*) 5))); (151, Boolean); (492, (Subtype ((*Y_Coord*) 5))); (223, (Subtype ((*PX_Coord*) 9))); (564, (Subtype ((*PX_Coord*) 9))); (259, (Subtype ((*I_Delta*) 20))); (573, (Subtype ((*PX_Coord*) 9))); (124, Boolean); (438, Boolean); (537, (Derived_Type ((*Direction*) 11))); (106, Boolean); (447, Integer); (205, (Record_Type ((*Piece*) 12))); (519, (Derived_Type ((*Direction*) 11))); (214, (Array_Type ((*Line*) 6))); (555, Integer); (528, (Derived_Type ((*Direction*) 11))); (420, (Array_Type ((*Line*) 6))); (160, (Array_Type ((*Line*) 6))); (169, (Subtype ((*PX_Coord*) 9))); (178, (Array_Type ((*Board*) 7))); (582, Boolean); (591, Integer); (456, Boolean); (465, (Array_Type ((*Line*) 6))); (187, (Record_Type ((*Piece*) 12))); (196, (Array_Type ((*Line*) 6))); (268, (Derived_Type ((*Cell*) 1))); (241, (Subtype ((*I_Delta*) 20))); (369, Integer); (441, (Subtype ((*Y_Coord*) 5))); (181, (Subtype ((*PY_Coord*) 10))); (163, (Subtype ((*PY_Coord*) 10))); (477, (Array_Type ((*Board*) 7))); (172, (Record_Type ((*Piece*) 12))); (513, Boolean); (432, (Subtype ((*Y_Coord*) 5))); (468, (Subtype ((*Y_Coord*) 5))); (199, (Subtype ((*PY_Coord*) 10))); (208, (Subtype ((*Shape*) 2))); (217, (Subtype ((*PY_Coord*) 10))); (683, (Derived_Type ((*Direction*) 11))); (423, Boolean); (495, (Derived_Type ((*State*) 18))); (190, (Subtype ((*Shape*) 2))); (504, Boolean); (737, Boolean); (396, (Subtype ((*Y_Coord*) 5))); (710, (Derived_Type ((*Action*) 31))); (746, Boolean); (405, (Subtype ((*Y_Coord*) 5))); (486, (Subtype ((*Y_Coord*) 5))); (154, (Record_Type ((*Piece*) 12))); (360, Integer); (740, (Record_Type ((*Piece*) 12))); (426, (Subtype ((*Y_Coord*) 5))); (408, Boolean); (300, Integer); (686, (Derived_Type ((*Action*) 31))); (623, (Subtype ((*PY_Coord*) 10))); (722, (Derived_Type ((*Action*) 31))); (381, Boolean); (354, (Subtype ((*Shape*) 2))); (471, (Array_Type ((*Board*) 7))); (677, (Record_Type ((*Piece*) 12))); (336, (Array_Type ((*Board*) 7))); (345, (Subtype ((*PX_Coord*) 9))); (641, (Subtype ((*PX_Coord*) 9))); (453, (Array_Type ((*Board*) 7))); (462, Boolean); (668, (Derived_Type ((*Action*) 31))); (363, Integer); (749, Boolean); (417, (Subtype ((*Y_Coord*) 5))); (444, Boolean); (309, (Subtype ((*I_Delta*) 20))); (659, Integer); (318, (Subtype ((*Shape*) 2))); (731, (Record_Type ((*Piece*) 12))); (327, Boolean); (357, Integer); (97, Boolean); (563, (Record_Type ((*Piece*) 12))); (653, (Derived_Type ((*Action*) 31))); (348, (Subtype ((*PX_Coord*) 9))); (734, Boolean); (402, (Array_Type ((*Line*) 6))); (294, Integer); (608, Boolean); (707, (Record_Type ((*Piece*) 12))); (644, Integer); (303, (Subtype ((*I_Delta*) 20))); (716, Boolean); (725, (Record_Type ((*Piece*) 12))); (411, Boolean); (276, (Subtype ((*I_Delta*) 20))); (249, Integer); (590, Integer); (285, (Subtype ((*Shape*) 2))); (258, (Subtype ((*I_Delta*) 20))); (599, Integer); (671, (Subtype ((*PY_Coord*) 10))); (339, (Subtype ((*PY_Coord*) 10))); (366, Integer); (572, (Record_Type ((*Piece*) 12))); (240, Boolean); (662, (Record_Type ((*Piece*) 12))); (321, (Record_Type ((*Piece*) 12))); (617, Integer); (689, (Derived_Type ((*Direction*) 11))); (521, Integer); (557, Boolean); (189, (Subtype ((*Shape*) 2))); (530, Integer); (225, (Record_Type ((*Piece*) 12))); (180, (Subtype ((*PY_Coord*) 10))); (674, Integer); (342, (Subtype ((*I_Delta*) 20))); (207, Integer); (216, Integer); (288, (Subtype ((*Shape*) 2))); (324, (Subtype ((*I_Delta*) 20))); (297, Integer); (638, (Derived_Type ((*Action*) 31))); (198, (Subtype ((*PY_Coord*) 10))); (270, (Array_Type ((*Board*) 7))); (584, Boolean); (611, (Subtype ((*PY_Coord*) 10))); (279, (Subtype ((*PX_Coord*) 9))); (593, Boolean); (620, (Subtype ((*PY_Coord*) 10))); (351, (Subtype ((*Shape*) 2))); (566, Integer); (261, Boolean); (234, (Subtype ((*Shape*) 2))); (575, Integer); (602, Boolean); (647, (Record_Type ((*Piece*) 12))); (243, Integer); (656, (Subtype ((*PX_Coord*) 9))); (315, (Subtype ((*Shape*) 2))); (282, (Subtype ((*PX_Coord*) 9))); (183, (Subtype ((*PY_Coord*) 10))); (587, (Subtype ((*PX_Coord*) 9))); (156, Integer); (255, (Record_Type ((*Piece*) 12))); (569, Integer); (596, (Subtype ((*PX_Coord*) 9))); (228, (Subtype ((*Shape*) 2))); (578, (Derived_Type ((*Action*) 31))); (461, Boolean); (470, (Array_Type ((*Line*) 6))); (452, (Array_Type ((*Line*) 6))); (479, (Subtype ((*Y_Coord*) 5))); (542, (Derived_Type ((*Direction*) 11))); (210, (Record_Type ((*Piece*) 12))); (560, Integer); (219, (Record_Type ((*Piece*) 12))); (291, Integer); (165, (Subtype ((*PY_Coord*) 10))); (515, (Subtype ((*Turn_Action*) 33))); (237, (Subtype ((*Shape*) 2))); (246, Boolean); (524, Integer); (192, (Subtype ((*Shape*) 2))); (533, (Derived_Type ((*Direction*) 11))); (201, (Subtype ((*PY_Coord*) 10))); (605, Integer); (273, (Subtype ((*PY_Coord*) 10))); (614, (Subtype ((*PY_Coord*) 10))); (186, (Subtype ((*PX_Coord*) 9))); (213, (Derived_Type ((*Cell*) 1))); (222, Integer); (437, Boolean); (168, (Record_Type ((*Piece*) 12))); (177, (Array_Type ((*Line*) 6))); (518, Boolean); (715, Boolean); (724, (Record_Type ((*Piece*) 12))); (733, Boolean); (159, (Derived_Type ((*Cell*) 1))); (473, (Subtype ((*Y_Coord*) 5))); (554, (Derived_Type ((*Action*) 31))); (105, Boolean); (419, (Array_Type ((*Line*) 6))); (446, (Subtype ((*Y_Coord*) 5))); (114, Boolean); (428, (Subtype ((*Y_Coord*) 5))); (455, (Subtype ((*Y_Coord*) 5))); (123, Boolean); (527, (Derived_Type ((*Direction*) 11))); (195, (Derived_Type ((*Cell*) 1))); (204, (Subtype ((*PX_Coord*) 9))); (742, (Record_Type ((*Piece*) 12))); (491, (Subtype ((*Y_Coord*) 5))); (231, (Subtype ((*Shape*) 2))); (332, Boolean); (745, Boolean); (90, Boolean); (404, (Array_Type ((*Board*) 7))); (431, Integer); (646, (Subtype ((*PX_Coord*) 9))); (395, Boolean); (682, (Derived_Type ((*Direction*) 11))); (341, (Subtype ((*PY_Coord*) 10))); (691, (Derived_Type ((*Direction*) 11))); (171, (Subtype ((*Shape*) 2))); (377, Integer); (144, Integer); (485, (Subtype ((*Y_Coord*) 5))); (153, (Subtype ((*Shape*) 2))); (467, (Subtype ((*Y_Coord*) 5))); (162, (Subtype ((*PY_Coord*) 10))); (359, (Subtype ((*I_Delta*) 20))); (673, (Subtype ((*PY_Coord*) 10))); (709, (Derived_Type ((*Action*) 31))); (368, (Derived_Type ((*State*) 18))); (135, Boolean); (476, (Array_Type ((*Line*) 6))); (350, (Subtype ((*I_Delta*) 20))); (664, Integer); (323, (Subtype ((*I_Delta*) 20))); (736, Boolean); (362, (Subtype ((*I_Delta*) 20))); (676, (Subtype ((*PY_Coord*) 10))); (272, (Subtype ((*PY_Coord*) 10))); (685, (Derived_Type ((*Direction*) 11))); (344, Integer); (658, (Subtype ((*PX_Coord*) 9))); (317, (Record_Type ((*Piece*) 12))); (353, (Record_Type ((*Piece*) 12))); (434, Integer); (326, (Subtype ((*I_Delta*) 20))); (299, (Subtype ((*I_Delta*) 20))); (335, (Array_Type ((*Line*) 6))); (649, Integer); (308, Boolean); (721, (Record_Type ((*Piece*) 12))); (730, (Array_Type ((*Board*) 7))); (416, (Array_Type ((*Board*) 7))); (281, (Record_Type ((*Piece*) 12))); (595, (Subtype ((*PX_Coord*) 9))); (622, (Record_Type ((*Piece*) 12))); (290, (Subtype ((*I_Delta*) 20))); (604, (Derived_Type ((*Action*) 31))); (712, Boolean); (586, (Subtype ((*PX_Coord*) 9))); (667, (Derived_Type ((*Action*) 31))); (398, Integer); (748, Boolean); (407, Boolean); (613, (Record_Type ((*Piece*) 12))); (356, (Subtype ((*I_Delta*) 20))); (562, (Subtype ((*PX_Coord*) 9))); (230, (Record_Type ((*Piece*) 12))); (257, (Subtype ((*I_Delta*) 20))); (598, (Subtype ((*PX_Coord*) 9))); (679, Integer); (338, (Subtype ((*PY_Coord*) 10))); (688, (Derived_Type ((*Direction*) 11))); (347, (Record_Type ((*Piece*) 12))); (553, (Derived_Type ((*Action*) 31))); (652, (Derived_Type ((*Action*) 31))); (248, (Subtype ((*I_Delta*) 20))); (221, Integer); (589, (Subtype ((*PX_Coord*) 9))); (661, (Subtype ((*PX_Coord*) 9))); (320, (Derived_Type ((*Direction*) 11))); (302, Boolean); (643, (Subtype ((*PX_Coord*) 9))); (535, Integer); (203, (Subtype ((*PX_Coord*) 9))); (544, Integer); (275, (Subtype ((*PY_Coord*) 10))); (616, Integer); (311, Integer); (284, (Subtype ((*I_Delta*) 20))); (625, Integer); (293, (Subtype ((*I_Delta*) 20))); (365, (Subtype ((*I_Delta*) 20))); (526, (Derived_Type ((*Direction*) 11))); (571, (Subtype ((*PX_Coord*) 9))); (266, Boolean); (580, Integer); (607, Boolean); (628, Boolean); (520, (Derived_Type ((*Direction*) 11))); (179, Integer); (152, (Subtype ((*Shape*) 2))); (493, Integer); (188, (Subtype ((*PX_Coord*) 9))); (592, Integer); (260, (Subtype ((*I_Delta*) 20))); (269, (Array_Type ((*Line*) 6))); (610, Integer); (170, (Subtype ((*Shape*) 2))); (484, Integer); (215, (Array_Type ((*Board*) 7))); (565, Integer); (466, (Array_Type ((*Board*) 7))); (287, (Record_Type ((*Piece*) 12))); (161, (Array_Type ((*Board*) 7))); (574, Integer); (242, (Subtype ((*I_Delta*) 20))); (583, Boolean); (529, (Derived_Type ((*Direction*) 11))); (197, (Array_Type ((*Board*) 7))); (224, (Subtype ((*PX_Coord*) 9))); (538, Integer); (296, (Subtype ((*I_Delta*) 20))); (206, (Subtype ((*PX_Coord*) 9))); (233, Boolean); (637, (Derived_Type ((*Action*) 31))); (305, Integer); (278, Integer); (619, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(218, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)24 }); (559, { line = (*Line*)178; col = (*Col*)8; endline = (*EndLine*)178; endcol = (*EndCol*)22 }); (227, { line = (*Line*)74; col = (*Col*)46; endline = (*EndLine*)74; endcol = (*EndCol*)46 }); (568, { line = (*Line*)178; col = (*Col*)28; endline = (*EndLine*)178; endcol = (*EndCol*)41 }); (433, { line = (*Line*)125; col = (*Col*)22; endline = (*EndLine*)125; endcol = (*EndCol*)29 }); (442, { line = (*Line*)131; col = (*Col*)16; endline = (*EndLine*)131; endcol = (*EndCol*)16 }); (200, { line = (*Line*)73; col = (*Col*)14; endline = (*EndLine*)73; endcol = (*EndCol*)22 }); (173, { line = (*Line*)71; col = (*Col*)62; endline = (*EndLine*)71; endcol = (*EndCol*)62 }); (514, { line = (*Line*)159; col = (*Col*)10; endline = (*EndLine*)159; endcol = (*EndCol*)10 }); (209, { line = (*Line*)73; col = (*Col*)52; endline = (*EndLine*)73; endcol = (*EndCol*)62 }); (523, { line = (*Line*)161; col = (*Col*)6; endline = (*EndLine*)161; endcol = (*EndCol*)6 }); (182, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)22 }); (254, { line = (*Line*)78; col = (*Col*)28; endline = (*EndLine*)78; endcol = (*EndCol*)38 }); (191, { line = (*Line*)72; col = (*Col*)52; endline = (*EndLine*)72; endcol = (*EndCol*)60 }); (720, { line = (*Line*)212; col = (*Col*)9; endline = (*EndLine*)212; endcol = (*EndCol*)17 }); (729, { line = (*Line*)214; col = (*Col*)15; endline = (*EndLine*)214; endcol = (*EndCol*)23 }); (424, { line = (*Line*)122; col = (*Col*)35; endline = (*EndLine*)122; endcol = (*EndCol*)38 }); (155, { line = (*Line*)70; col = (*Col*)20; endline = (*EndLine*)70; endcol = (*EndCol*)20 }); (469, { line = (*Line*)135; col = (*Col*)39; endline = (*EndLine*)135; endcol = (*EndCol*)59 }); (496, { line = (*Line*)145; col = (*Col*)20; endline = (*EndLine*)145; endcol = (*EndCol*)20 }); (164, { line = (*Line*)71; col = (*Col*)14; endline = (*EndLine*)71; endcol = (*EndCol*)22 }); (478, { line = (*Line*)136; col = (*Col*)27; endline = (*EndLine*)136; endcol = (*EndCol*)35 }); (505, { line = (*Line*)154; col = (*Col*)12; endline = (*EndLine*)154; endcol = (*EndCol*)15 }); (577, { line = (*Line*)179; col = (*Col*)13; endline = (*EndLine*)179; endcol = (*EndCol*)17 }); (451, { line = (*Line*)133; col = (*Col*)21; endline = (*EndLine*)133; endcol = (*EndCol*)41 }); (460, { line = (*Line*)134; col = (*Col*)16; endline = (*EndLine*)134; endcol = (*EndCol*)20 }); (532, { line = (*Line*)166; col = (*Col*)6; endline = (*EndLine*)166; endcol = (*EndCol*)10 }); (541, { line = (*Line*)169; col = (*Col*)11; endline = (*EndLine*)169; endcol = (*EndCol*)15 }); (406, { line = (*Line*)119; col = (*Col*)32; endline = (*EndLine*)119; endcol = (*EndCol*)39 }); (415, { line = (*Line*)121; col = (*Col*)13; endline = (*EndLine*)121; endcol = (*EndCol*)32 }); (487, { line = (*Line*)137; col = (*Col*)37; endline = (*EndLine*)137; endcol = (*EndCol*)37 }); (236, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)21 }); (741, { line = (*Line*)216; col = (*Col*)26; endline = (*EndLine*)216; endcol = (*EndCol*)34 }); (678, { line = (*Line*)195; col = (*Col*)12; endline = (*EndLine*)195; endcol = (*EndCol*)12 }); (445, { line = (*Line*)132; col = (*Col*)16; endline = (*EndLine*)132; endcol = (*EndCol*)24 }); (732, { line = (*Line*)214; col = (*Col*)26; endline = (*EndLine*)214; endcol = (*EndCol*)34 }); (472, { line = (*Line*)135; col = (*Col*)50; endline = (*EndLine*)135; endcol = (*EndCol*)58 }); (427, { line = (*Line*)123; col = (*Col*)24; endline = (*EndLine*)123; endcol = (*EndCol*)31 }); (176, { line = (*Line*)72; col = (*Col*)3; endline = (*EndLine*)72; endcol = (*EndCol*)43 }); (723, { line = (*Line*)212; col = (*Col*)20; endline = (*EndLine*)212; endcol = (*EndCol*)20 }); (418, { line = (*Line*)121; col = (*Col*)24; endline = (*EndLine*)121; endcol = (*EndCol*)31 }); (490, { line = (*Line*)139; col = (*Col*)19; endline = (*EndLine*)139; endcol = (*EndCol*)31 }); (185, { line = (*Line*)72; col = (*Col*)32; endline = (*EndLine*)72; endcol = (*EndCol*)42 }); (167, { line = (*Line*)71; col = (*Col*)28; endline = (*EndLine*)71; endcol = (*EndCol*)38 }); (364, { line = (*Line*)95; col = (*Col*)11; endline = (*EndLine*)95; endcol = (*EndCol*)11 }); (140, { line = (*Line*)66; col = (*Col*)22; endline = (*EndLine*)66; endcol = (*EndCol*)22 }); (113, { line = (*Line*)48; col = (*Col*)7; endline = (*EndLine*)48; endcol = (*EndCol*)7 }); (454, { line = (*Line*)133; col = (*Col*)32; endline = (*EndLine*)133; endcol = (*EndCol*)40 }); (481, { line = (*Line*)136; col = (*Col*)41; endline = (*EndLine*)136; endcol = (*EndCol*)50 }); (687, { line = (*Line*)197; col = (*Col*)24; endline = (*EndLine*)197; endcol = (*EndCol*)24 }); (660, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)12 }); (346, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)44 }); (669, { line = (*Line*)194; col = (*Col*)17; endline = (*EndLine*)194; endcol = (*EndCol*)17 }); (708, { line = (*Line*)210; col = (*Col*)25; endline = (*EndLine*)210; endcol = (*EndCol*)33 }); (403, { line = (*Line*)119; col = (*Col*)21; endline = (*EndLine*)119; endcol = (*EndCol*)40 }); (134, { line = (*Line*)58; col = (*Col*)7; endline = (*EndLine*)58; endcol = (*EndCol*)7 }); (600, { line = (*Line*)180; col = (*Col*)41; endline = (*EndLine*)180; endcol = (*EndCol*)41 }); (609, { line = (*Line*)182; col = (*Col*)8; endline = (*EndLine*)182; endcol = (*EndCol*)22 }); (690, { line = (*Line*)197; col = (*Col*)27; endline = (*EndLine*)197; endcol = (*EndCol*)27 }); (349, { line = (*Line*)91; col = (*Col*)48; endline = (*EndLine*)91; endcol = (*EndCol*)48 }); (358, { line = (*Line*)93; col = (*Col*)14; endline = (*EndLine*)93; endcol = (*EndCol*)14 }); (430, { line = (*Line*)125; col = (*Col*)10; endline = (*EndLine*)125; endcol = (*EndCol*)17 }); (672, { line = (*Line*)195; col = (*Col*)3; endline = (*EndLine*)195; endcol = (*EndCol*)3 }); (645, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)12 }); (331, { line = (*Line*)90; col = (*Col*)12; endline = (*EndLine*)90; endcol = (*EndCol*)12 }); (304, { line = (*Line*)87; col = (*Col*)9; endline = (*EndLine*)87; endcol = (*EndCol*)9 }); (654, { line = (*Line*)192; col = (*Col*)17; endline = (*EndLine*)192; endcol = (*EndCol*)17 }); (340, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)24 }); (89, { line = (*Line*)33; col = (*Col*)7; endline = (*EndLine*)33; endcol = (*EndCol*)7 }); (286, { line = (*Line*)80; col = (*Col*)54; endline = (*EndLine*)80; endcol = (*EndCol*)64 }); (627, { line = (*Line*)184; col = (*Col*)3; endline = (*EndLine*)184; endcol = (*EndCol*)3 }); (636, { line = (*Line*)190; col = (*Col*)10; endline = (*EndLine*)190; endcol = (*EndCol*)14 }); (457, { line = (*Line*)133; col = (*Col*)44; endline = (*EndLine*)133; endcol = (*EndCol*)44 }); (663, { line = (*Line*)193; col = (*Col*)12; endline = (*EndLine*)193; endcol = (*EndCol*)12 }); (98, { line = (*Line*)38; col = (*Col*)12; endline = (*EndLine*)38; endcol = (*EndCol*)15 }); (412, { line = (*Line*)120; col = (*Col*)13; endline = (*EndLine*)120; endcol = (*EndCol*)13 }); (618, { line = (*Line*)182; col = (*Col*)28; endline = (*EndLine*)182; endcol = (*EndCol*)42 }); (322, { line = (*Line*)89; col = (*Col*)55; endline = (*EndLine*)89; endcol = (*EndCol*)55 }); (385, { line = (*Line*)112; col = (*Col*)29; endline = (*EndLine*)112; endcol = (*EndCol*)29 }); (567, { line = (*Line*)178; col = (*Col*)22; endline = (*EndLine*)178; endcol = (*EndCol*)22 }); (639, { line = (*Line*)190; col = (*Col*)14; endline = (*EndLine*)190; endcol = (*EndCol*)14 }); (648, { line = (*Line*)191; col = (*Col*)12; endline = (*EndLine*)191; endcol = (*EndCol*)12 }); (397, { line = (*Line*)118; col = (*Col*)13; endline = (*EndLine*)118; endcol = (*EndCol*)20 }); (262, { line = (*Line*)78; col = (*Col*)47; endline = (*EndLine*)78; endcol = (*EndCol*)47 }); (603, { line = (*Line*)181; col = (*Col*)13; endline = (*EndLine*)181; endcol = (*EndCol*)13 }); (298, { line = (*Line*)84; col = (*Col*)11; endline = (*EndLine*)84; endcol = (*EndCol*)11 }); (711, { line = (*Line*)210; col = (*Col*)39; endline = (*EndLine*)210; endcol = (*EndCol*)48 }); (684, { line = (*Line*)197; col = (*Col*)19; endline = (*EndLine*)197; endcol = (*EndCol*)19 }); (343, { line = (*Line*)91; col = (*Col*)30; endline = (*EndLine*)91; endcol = (*EndCol*)30 }); (352, { line = (*Line*)91; col = (*Col*)54; endline = (*EndLine*)91; endcol = (*EndCol*)64 }); (558, { line = (*Line*)178; col = (*Col*)8; endline = (*EndLine*)178; endcol = (*EndCol*)41 }); (585, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)15 }); (253, { line = (*Line*)78; col = (*Col*)28; endline = (*EndLine*)78; endcol = (*EndCol*)38 }); (226, { line = (*Line*)74; col = (*Col*)42; endline = (*EndLine*)74; endcol = (*EndCol*)42 }); (594, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)35 }); (666, { line = (*Line*)194; col = (*Col*)13; endline = (*EndLine*)194; endcol = (*EndCol*)17 }); (325, { line = (*Line*)89; col = (*Col*)61; endline = (*EndLine*)89; endcol = (*EndCol*)61 }); (675, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)12 }); (334, { line = (*Line*)91; col = (*Col*)5; endline = (*EndLine*)91; endcol = (*EndCol*)49 }); (540, { line = (*Line*)169; col = (*Col*)6; endline = (*EndLine*)169; endcol = (*EndCol*)6 }); (235, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)23 }); (621, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)31 }); (657, { line = (*Line*)193; col = (*Col*)3; endline = (*EndLine*)193; endcol = (*EndCol*)3 }); (316, { line = (*Line*)89; col = (*Col*)32; endline = (*EndLine*)89; endcol = (*EndCol*)42 }); (271, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)30 }); (612, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)11 }); (280, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)44 }); (319, { line = (*Line*)89; col = (*Col*)45; endline = (*EndLine*)89; endcol = (*EndCol*)55 }); (516, { line = (*Line*)159; col = (*Col*)14; endline = (*EndLine*)159; endcol = (*EndCol*)14 }); (552, { line = (*Line*)177; col = (*Col*)10; endline = (*EndLine*)177; endcol = (*EndCol*)14 }); (184, { line = (*Line*)72; col = (*Col*)28; endline = (*EndLine*)72; endcol = (*EndCol*)28 }); (534, { line = (*Line*)166; col = (*Col*)6; endline = (*EndLine*)166; endcol = (*EndCol*)6 }); (597, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)29 }); (265, { line = (*Line*)79; col = (*Col*)12; endline = (*EndLine*)79; endcol = (*EndCol*)12 }); (615, { line = (*Line*)182; col = (*Col*)15; endline = (*EndLine*)182; endcol = (*EndCol*)15 }); (480, { line = (*Line*)136; col = (*Col*)41; endline = (*EndLine*)136; endcol = (*EndCol*)50 }); (256, { line = (*Line*)78; col = (*Col*)38; endline = (*EndLine*)78; endcol = (*EndCol*)38 }); (337, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)30 }); (211, { line = (*Line*)73; col = (*Col*)62; endline = (*EndLine*)73; endcol = (*EndCol*)62 }); (283, { line = (*Line*)80; col = (*Col*)48; endline = (*EndLine*)80; endcol = (*EndCol*)48 }); (624, { line = (*Line*)182; col = (*Col*)35; endline = (*EndLine*)182; endcol = (*EndCol*)35 }); (292, { line = (*Line*)82; col = (*Col*)14; endline = (*EndLine*)82; endcol = (*EndCol*)14 }); (166, { line = (*Line*)71; col = (*Col*)28; endline = (*EndLine*)71; endcol = (*EndCol*)38 }); (579, { line = (*Line*)179; col = (*Col*)13; endline = (*EndLine*)179; endcol = (*EndCol*)13 }); (274, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)24 }); (247, { line = (*Line*)77; col = (*Col*)12; endline = (*EndLine*)77; endcol = (*EndCol*)12 }); (588, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)9 }); (328, { line = (*Line*)89; col = (*Col*)64; endline = (*EndLine*)89; endcol = (*EndCol*)64 }); (489, { line = (*Line*)139; col = (*Col*)6; endline = (*EndLine*)139; endcol = (*EndCol*)14 }); (220, { line = (*Line*)74; col = (*Col*)24; endline = (*EndLine*)74; endcol = (*EndCol*)24 }); (561, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)11 }); (229, { line = (*Line*)74; col = (*Col*)52; endline = (*EndLine*)74; endcol = (*EndCol*)62 }); (543, { line = (*Line*)169; col = (*Col*)11; endline = (*EndLine*)169; endcol = (*EndCol*)11 }); (570, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)31 }); (202, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)42 }); (238, { line = (*Line*)75; col = (*Col*)27; endline = (*EndLine*)75; endcol = (*EndCol*)27 }); (642, { line = (*Line*)191; col = (*Col*)3; endline = (*EndLine*)191; endcol = (*EndCol*)3 }); (651, { line = (*Line*)192; col = (*Col*)13; endline = (*EndLine*)192; endcol = (*EndCol*)17 }); (310, { line = (*Line*)88; col = (*Col*)12; endline = (*EndLine*)88; endcol = (*EndCol*)12 }); (277, { line = (*Line*)80; col = (*Col*)30; endline = (*EndLine*)80; endcol = (*EndCol*)30 }); (483, { line = (*Line*)137; col = (*Col*)16; endline = (*EndLine*)137; endcol = (*EndCol*)22 }); (151, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)24 }); (492, { line = (*Line*)139; col = (*Col*)19; endline = (*EndLine*)139; endcol = (*EndCol*)27 }); (223, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)42 }); (564, { line = (*Line*)178; col = (*Col*)11; endline = (*EndLine*)178; endcol = (*EndCol*)11 }); (259, { line = (*Line*)78; col = (*Col*)44; endline = (*EndLine*)78; endcol = (*EndCol*)44 }); (573, { line = (*Line*)178; col = (*Col*)31; endline = (*EndLine*)178; endcol = (*EndCol*)31 }); (124, { line = (*Line*)53; col = (*Col*)12; endline = (*EndLine*)53; endcol = (*EndCol*)15 }); (438, { line = (*Line*)130; col = (*Col*)10; endline = (*EndLine*)130; endcol = (*EndCol*)27 }); (537, { line = (*Line*)167; col = (*Col*)6; endline = (*EndLine*)167; endcol = (*EndCol*)6 }); (106, { line = (*Line*)43; col = (*Col*)12; endline = (*EndLine*)43; endcol = (*EndCol*)15 }); (447, { line = (*Line*)132; col = (*Col*)29; endline = (*EndLine*)132; endcol = (*EndCol*)29 }); (205, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)36 }); (519, { line = (*Line*)160; col = (*Col*)6; endline = (*EndLine*)160; endcol = (*EndCol*)6 }); (214, { line = (*Line*)74; col = (*Col*)3; endline = (*EndLine*)74; endcol = (*EndCol*)29 }); (555, { line = (*Line*)177; col = (*Col*)14; endline = (*EndLine*)177; endcol = (*EndCol*)14 }); (528, { line = (*Line*)163; col = (*Col*)11; endline = (*EndLine*)163; endcol = (*EndCol*)11 }); (420, { line = (*Line*)121; col = (*Col*)37; endline = (*EndLine*)121; endcol = (*EndCol*)46 }); (160, { line = (*Line*)71; col = (*Col*)3; endline = (*EndLine*)71; endcol = (*EndCol*)25 }); (169, { line = (*Line*)71; col = (*Col*)38; endline = (*EndLine*)71; endcol = (*EndCol*)38 }); (178, { line = (*Line*)72; col = (*Col*)3; endline = (*EndLine*)72; endcol = (*EndCol*)11 }); (582, { line = (*Line*)180; col = (*Col*)3; endline = (*EndLine*)180; endcol = (*EndCol*)3 }); (591, { line = (*Line*)180; col = (*Col*)21; endline = (*EndLine*)180; endcol = (*EndCol*)22 }); (456, { line = (*Line*)133; col = (*Col*)44; endline = (*EndLine*)133; endcol = (*EndCol*)44 }); (465, { line = (*Line*)135; col = (*Col*)16; endline = (*EndLine*)135; endcol = (*EndCol*)34 }); (187, { line = (*Line*)72; col = (*Col*)32; endline = (*EndLine*)72; endcol = (*EndCol*)40 }); (196, { line = (*Line*)73; col = (*Col*)3; endline = (*EndLine*)73; endcol = (*EndCol*)25 }); (268, { line = (*Line*)80; col = (*Col*)5; endline = (*EndLine*)80; endcol = (*EndCol*)49 }); (241, { line = (*Line*)76; col = (*Col*)9; endline = (*EndLine*)76; endcol = (*EndCol*)9 }); (369, { line = (*Line*)101; col = (*Col*)20; endline = (*EndLine*)101; endcol = (*EndCol*)20 }); (441, { line = (*Line*)131; col = (*Col*)3; endline = (*EndLine*)131; endcol = (*EndCol*)11 }); (181, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)24 }); (163, { line = (*Line*)71; col = (*Col*)14; endline = (*EndLine*)71; endcol = (*EndCol*)24 }); (477, { line = (*Line*)136; col = (*Col*)16; endline = (*EndLine*)136; endcol = (*EndCol*)24 }); (172, { line = (*Line*)71; col = (*Col*)52; endline = (*EndLine*)71; endcol = (*EndCol*)60 }); (513, { line = (*Line*)159; col = (*Col*)10; endline = (*EndLine*)159; endcol = (*EndCol*)14 }); (432, { line = (*Line*)125; col = (*Col*)22; endline = (*EndLine*)125; endcol = (*EndCol*)29 }); (468, { line = (*Line*)135; col = (*Col*)27; endline = (*EndLine*)135; endcol = (*EndCol*)33 }); (199, { line = (*Line*)73; col = (*Col*)14; endline = (*EndLine*)73; endcol = (*EndCol*)24 }); (208, { line = (*Line*)73; col = (*Col*)52; endline = (*EndLine*)73; endcol = (*EndCol*)62 }); (217, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)24 }); (683, { line = (*Line*)197; col = (*Col*)19; endline = (*EndLine*)197; endcol = (*EndCol*)21 }); (423, { line = (*Line*)122; col = (*Col*)13; endline = (*EndLine*)122; endcol = (*EndCol*)30 }); (495, { line = (*Line*)145; col = (*Col*)7; endline = (*EndLine*)145; endcol = (*EndCol*)15 }); (190, { line = (*Line*)72; col = (*Col*)52; endline = (*EndLine*)72; endcol = (*EndCol*)62 }); (504, { line = (*Line*)154; col = (*Col*)7; endline = (*EndLine*)154; endcol = (*EndCol*)7 }); (737, { line = (*Line*)215; col = (*Col*)13; endline = (*EndLine*)215; endcol = (*EndCol*)25 }); (396, { line = (*Line*)118; col = (*Col*)13; endline = (*EndLine*)118; endcol = (*EndCol*)20 }); (710, { line = (*Line*)210; col = (*Col*)36; endline = (*EndLine*)210; endcol = (*EndCol*)36 }); (746, { line = (*Line*)217; col = (*Col*)24; endline = (*EndLine*)217; endcol = (*EndCol*)27 }); (405, { line = (*Line*)119; col = (*Col*)32; endline = (*EndLine*)119; endcol = (*EndCol*)39 }); (486, { line = (*Line*)137; col = (*Col*)27; endline = (*EndLine*)137; endcol = (*EndCol*)33 }); (154, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)18 }); (360, { line = (*Line*)93; col = (*Col*)18; endline = (*EndLine*)93; endcol = (*EndCol*)18 }); (740, { line = (*Line*)216; col = (*Col*)13; endline = (*EndLine*)216; endcol = (*EndCol*)21 }); (426, { line = (*Line*)123; col = (*Col*)13; endline = (*EndLine*)123; endcol = (*EndCol*)19 }); (408, { line = (*Line*)119; col = (*Col*)43; endline = (*EndLine*)119; endcol = (*EndCol*)43 }); (300, { line = (*Line*)84; col = (*Col*)15; endline = (*EndLine*)84; endcol = (*EndCol*)15 }); (686, { line = (*Line*)197; col = (*Col*)24; endline = (*EndLine*)197; endcol = (*EndCol*)24 }); (623, { line = (*Line*)182; col = (*Col*)31; endline = (*EndLine*)182; endcol = (*EndCol*)31 }); (722, { line = (*Line*)212; col = (*Col*)20; endline = (*EndLine*)212; endcol = (*EndCol*)20 }); (381, { line = (*Line*)111; col = (*Col*)39; endline = (*EndLine*)111; endcol = (*EndCol*)43 }); (354, { line = (*Line*)91; col = (*Col*)64; endline = (*EndLine*)91; endcol = (*EndCol*)64 }); (471, { line = (*Line*)135; col = (*Col*)39; endline = (*EndLine*)135; endcol = (*EndCol*)47 }); (677, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)10 }); (336, { line = (*Line*)91; col = (*Col*)5; endline = (*EndLine*)91; endcol = (*EndCol*)13 }); (345, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)44 }); (641, { line = (*Line*)191; col = (*Col*)3; endline = (*EndLine*)191; endcol = (*EndCol*)5 }); (453, { line = (*Line*)133; col = (*Col*)21; endline = (*EndLine*)133; endcol = (*EndCol*)29 }); (462, { line = (*Line*)134; col = (*Col*)20; endline = (*EndLine*)134; endcol = (*EndCol*)20 }); (668, { line = (*Line*)194; col = (*Col*)13; endline = (*EndLine*)194; endcol = (*EndCol*)13 }); (363, { line = (*Line*)95; col = (*Col*)11; endline = (*EndLine*)95; endcol = (*EndCol*)15 }); (749, { line = (*Line*)222; col = (*Col*)18; endline = (*EndLine*)222; endcol = (*EndCol*)22 }); (417, { line = (*Line*)121; col = (*Col*)24; endline = (*EndLine*)121; endcol = (*EndCol*)31 }); (444, { line = (*Line*)132; col = (*Col*)16; endline = (*EndLine*)132; endcol = (*EndCol*)29 }); (309, { line = (*Line*)88; col = (*Col*)12; endline = (*EndLine*)88; endcol = (*EndCol*)12 }); (659, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)16 }); (318, { line = (*Line*)89; col = (*Col*)42; endline = (*EndLine*)89; endcol = (*EndCol*)42 }); (731, { line = (*Line*)214; col = (*Col*)26; endline = (*EndLine*)214; endcol = (*EndCol*)34 }); (327, { line = (*Line*)89; col = (*Col*)64; endline = (*EndLine*)89; endcol = (*EndCol*)64 }); (357, { line = (*Line*)93; col = (*Col*)14; endline = (*EndLine*)93; endcol = (*EndCol*)18 }); (97, { line = (*Line*)38; col = (*Col*)7; endline = (*EndLine*)38; endcol = (*EndCol*)7 }); (563, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)9 }); (653, { line = (*Line*)192; col = (*Col*)13; endline = (*EndLine*)192; endcol = (*EndCol*)13 }); (348, { line = (*Line*)91; col = (*Col*)44; endline = (*EndLine*)91; endcol = (*EndCol*)44 }); (734, { line = (*Line*)214; col = (*Col*)37; endline = (*EndLine*)214; endcol = (*EndCol*)49 }); (402, { line = (*Line*)119; col = (*Col*)21; endline = (*EndLine*)119; endcol = (*EndCol*)40 }); (294, { line = (*Line*)82; col = (*Col*)18; endline = (*EndLine*)82; endcol = (*EndCol*)18 }); (608, { line = (*Line*)182; col = (*Col*)8; endline = (*EndLine*)182; endcol = (*EndCol*)42 }); (707, { line = (*Line*)210; col = (*Col*)25; endline = (*EndLine*)210; endcol = (*EndCol*)33 }); (644, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)16 }); (303, { line = (*Line*)87; col = (*Col*)9; endline = (*EndLine*)87; endcol = (*EndCol*)9 }); (716, { line = (*Line*)211; col = (*Col*)10; endline = (*EndLine*)211; endcol = (*EndCol*)19 }); (725, { line = (*Line*)212; col = (*Col*)23; endline = (*EndLine*)212; endcol = (*EndCol*)31 }); (411, { line = (*Line*)120; col = (*Col*)13; endline = (*EndLine*)120; endcol = (*EndCol*)13 }); (276, { line = (*Line*)80; col = (*Col*)30; endline = (*EndLine*)80; endcol = (*EndCol*)30 }); (249, { line = (*Line*)77; col = (*Col*)17; endline = (*EndLine*)77; endcol = (*EndCol*)17 }); (590, { line = (*Line*)180; col = (*Col*)15; endline = (*EndLine*)180; endcol = (*EndCol*)15 }); (285, { line = (*Line*)80; col = (*Col*)54; endline = (*EndLine*)80; endcol = (*EndCol*)64 }); (258, { line = (*Line*)78; col = (*Col*)41; endline = (*EndLine*)78; endcol = (*EndCol*)41 }); (599, { line = (*Line*)180; col = (*Col*)35; endline = (*EndLine*)180; endcol = (*EndCol*)35 }); (671, { line = (*Line*)195; col = (*Col*)3; endline = (*EndLine*)195; endcol = (*EndCol*)5 }); (339, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)26 }); (366, { line = (*Line*)95; col = (*Col*)15; endline = (*EndLine*)95; endcol = (*EndCol*)15 }); (572, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)29 }); (240, { line = (*Line*)76; col = (*Col*)9; endline = (*EndLine*)76; endcol = (*EndCol*)14 }); (662, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)10 }); (321, { line = (*Line*)89; col = (*Col*)45; endline = (*EndLine*)89; endcol = (*EndCol*)53 }); (617, { line = (*Line*)182; col = (*Col*)22; endline = (*EndLine*)182; endcol = (*EndCol*)22 }); (689, { line = (*Line*)197; col = (*Col*)27; endline = (*EndLine*)197; endcol = (*EndCol*)29 }); (521, { line = (*Line*)160; col = (*Col*)10; endline = (*EndLine*)160; endcol = (*EndCol*)10 }); (557, { line = (*Line*)178; col = (*Col*)3; endline = (*EndLine*)178; endcol = (*EndCol*)3 }); (189, { line = (*Line*)72; col = (*Col*)52; endline = (*EndLine*)72; endcol = (*EndCol*)62 }); (530, { line = (*Line*)163; col = (*Col*)15; endline = (*EndLine*)163; endcol = (*EndCol*)15 }); (225, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)40 }); (180, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)24 }); (674, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)16 }); (342, { line = (*Line*)91; col = (*Col*)30; endline = (*EndLine*)91; endcol = (*EndCol*)30 }); (207, { line = (*Line*)73; col = (*Col*)42; endline = (*EndLine*)73; endcol = (*EndCol*)42 }); (216, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)28 }); (288, { line = (*Line*)80; col = (*Col*)64; endline = (*EndLine*)80; endcol = (*EndCol*)64 }); (324, { line = (*Line*)89; col = (*Col*)58; endline = (*EndLine*)89; endcol = (*EndCol*)58 }); (297, { line = (*Line*)84; col = (*Col*)11; endline = (*EndLine*)84; endcol = (*EndCol*)15 }); (638, { line = (*Line*)190; col = (*Col*)10; endline = (*EndLine*)190; endcol = (*EndCol*)10 }); (198, { line = (*Line*)73; col = (*Col*)14; endline = (*EndLine*)73; endcol = (*EndCol*)24 }); (270, { line = (*Line*)80; col = (*Col*)5; endline = (*EndLine*)80; endcol = (*EndCol*)13 }); (584, { line = (*Line*)180; col = (*Col*)8; endline = (*EndLine*)180; endcol = (*EndCol*)22 }); (611, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)11 }); (279, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)44 }); (593, { line = (*Line*)180; col = (*Col*)28; endline = (*EndLine*)180; endcol = (*EndCol*)41 }); (620, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)31 }); (351, { line = (*Line*)91; col = (*Col*)54; endline = (*EndLine*)91; endcol = (*EndCol*)64 }); (566, { line = (*Line*)178; col = (*Col*)21; endline = (*EndLine*)178; endcol = (*EndCol*)22 }); (261, { line = (*Line*)78; col = (*Col*)47; endline = (*EndLine*)78; endcol = (*EndCol*)47 }); (234, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)23 }); (575, { line = (*Line*)178; col = (*Col*)41; endline = (*EndLine*)178; endcol = (*EndCol*)41 }); (602, { line = (*Line*)181; col = (*Col*)13; endline = (*EndLine*)181; endcol = (*EndCol*)17 }); (647, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)10 }); (243, { line = (*Line*)76; col = (*Col*)14; endline = (*EndLine*)76; endcol = (*EndCol*)14 }); (656, { line = (*Line*)193; col = (*Col*)3; endline = (*EndLine*)193; endcol = (*EndCol*)5 }); (315, { line = (*Line*)89; col = (*Col*)32; endline = (*EndLine*)89; endcol = (*EndCol*)42 }); (282, { line = (*Line*)80; col = (*Col*)44; endline = (*EndLine*)80; endcol = (*EndCol*)44 }); (183, { line = (*Line*)72; col = (*Col*)24; endline = (*EndLine*)72; endcol = (*EndCol*)24 }); (587, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)11 }); (156, { line = (*Line*)70; col = (*Col*)24; endline = (*EndLine*)70; endcol = (*EndCol*)24 }); (255, { line = (*Line*)78; col = (*Col*)28; endline = (*EndLine*)78; endcol = (*EndCol*)36 }); (569, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)35 }); (596, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)31 }); (228, { line = (*Line*)74; col = (*Col*)52; endline = (*EndLine*)74; endcol = (*EndCol*)62 }); (578, { line = (*Line*)179; col = (*Col*)13; endline = (*EndLine*)179; endcol = (*EndCol*)13 }); (461, { line = (*Line*)134; col = (*Col*)20; endline = (*EndLine*)134; endcol = (*EndCol*)20 }); (470, { line = (*Line*)135; col = (*Col*)39; endline = (*EndLine*)135; endcol = (*EndCol*)59 }); (452, { line = (*Line*)133; col = (*Col*)21; endline = (*EndLine*)133; endcol = (*EndCol*)41 }); (479, { line = (*Line*)136; col = (*Col*)27; endline = (*EndLine*)136; endcol = (*EndCol*)35 }); (542, { line = (*Line*)169; col = (*Col*)11; endline = (*EndLine*)169; endcol = (*EndCol*)11 }); (210, { line = (*Line*)73; col = (*Col*)52; endline = (*EndLine*)73; endcol = (*EndCol*)60 }); (560, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)15 }); (219, { line = (*Line*)74; col = (*Col*)14; endline = (*EndLine*)74; endcol = (*EndCol*)22 }); (291, { line = (*Line*)82; col = (*Col*)14; endline = (*EndLine*)82; endcol = (*EndCol*)18 }); (165, { line = (*Line*)71; col = (*Col*)24; endline = (*EndLine*)71; endcol = (*EndCol*)24 }); (515, { line = (*Line*)159; col = (*Col*)10; endline = (*EndLine*)159; endcol = (*EndCol*)10 }); (237, { line = (*Line*)75; col = (*Col*)23; endline = (*EndLine*)75; endcol = (*EndCol*)23 }); (246, { line = (*Line*)77; col = (*Col*)12; endline = (*EndLine*)77; endcol = (*EndCol*)17 }); (524, { line = (*Line*)161; col = (*Col*)11; endline = (*EndLine*)161; endcol = (*EndCol*)11 }); (192, { line = (*Line*)72; col = (*Col*)62; endline = (*EndLine*)72; endcol = (*EndCol*)62 }); (533, { line = (*Line*)166; col = (*Col*)6; endline = (*EndLine*)166; endcol = (*EndCol*)6 }); (201, { line = (*Line*)73; col = (*Col*)24; endline = (*EndLine*)73; endcol = (*EndCol*)24 }); (605, { line = (*Line*)181; col = (*Col*)17; endline = (*EndLine*)181; endcol = (*EndCol*)17 }); (273, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)26 }); (614, { line = (*Line*)182; col = (*Col*)11; endline = (*EndLine*)182; endcol = (*EndCol*)11 }); (186, { line = (*Line*)72; col = (*Col*)32; endline = (*EndLine*)72; endcol = (*EndCol*)42 }); (213, { line = (*Line*)74; col = (*Col*)3; endline = (*EndLine*)74; endcol = (*EndCol*)47 }); (222, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)46 }); (437, { line = (*Line*)130; col = (*Col*)10; endline = (*EndLine*)130; endcol = (*EndCol*)27 }); (168, { line = (*Line*)71; col = (*Col*)28; endline = (*EndLine*)71; endcol = (*EndCol*)36 }); (177, { line = (*Line*)72; col = (*Col*)3; endline = (*EndLine*)72; endcol = (*EndCol*)29 }); (518, { line = (*Line*)160; col = (*Col*)6; endline = (*EndLine*)160; endcol = (*EndCol*)10 }); (715, { line = (*Line*)211; col = (*Col*)10; endline = (*EndLine*)211; endcol = (*EndCol*)19 }); (724, { line = (*Line*)212; col = (*Col*)23; endline = (*EndLine*)212; endcol = (*EndCol*)31 }); (733, { line = (*Line*)214; col = (*Col*)37; endline = (*EndLine*)214; endcol = (*EndCol*)49 }); (159, { line = (*Line*)71; col = (*Col*)3; endline = (*EndLine*)71; endcol = (*EndCol*)39 }); (473, { line = (*Line*)135; col = (*Col*)50; endline = (*EndLine*)135; endcol = (*EndCol*)58 }); (554, { line = (*Line*)177; col = (*Col*)10; endline = (*EndLine*)177; endcol = (*EndCol*)10 }); (105, { line = (*Line*)43; col = (*Col*)7; endline = (*EndLine*)43; endcol = (*EndCol*)7 }); (419, { line = (*Line*)121; col = (*Col*)37; endline = (*EndLine*)121; endcol = (*EndCol*)46 }); (446, { line = (*Line*)132; col = (*Col*)16; endline = (*EndLine*)132; endcol = (*EndCol*)24 }); (114, { line = (*Line*)48; col = (*Col*)12; endline = (*EndLine*)48; endcol = (*EndCol*)15 }); (428, { line = (*Line*)123; col = (*Col*)24; endline = (*EndLine*)123; endcol = (*EndCol*)31 }); (455, { line = (*Line*)133; col = (*Col*)32; endline = (*EndLine*)133; endcol = (*EndCol*)40 }); (123, { line = (*Line*)53; col = (*Col*)7; endline = (*EndLine*)53; endcol = (*EndCol*)7 }); (527, { line = (*Line*)163; col = (*Col*)11; endline = (*EndLine*)163; endcol = (*EndCol*)15 }); (195, { line = (*Line*)73; col = (*Col*)3; endline = (*EndLine*)73; endcol = (*EndCol*)43 }); (204, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)38 }); (742, { line = (*Line*)216; col = (*Col*)26; endline = (*EndLine*)216; endcol = (*EndCol*)34 }); (491, { line = (*Line*)139; col = (*Col*)19; endline = (*EndLine*)139; endcol = (*EndCol*)27 }); (231, { line = (*Line*)74; col = (*Col*)62; endline = (*EndLine*)74; endcol = (*EndCol*)62 }); (332, { line = (*Line*)90; col = (*Col*)12; endline = (*EndLine*)90; endcol = (*EndCol*)12 }); (745, { line = (*Line*)217; col = (*Col*)13; endline = (*EndLine*)217; endcol = (*EndCol*)19 }); (90, { line = (*Line*)33; col = (*Col*)12; endline = (*EndLine*)33; endcol = (*EndCol*)15 }); (404, { line = (*Line*)119; col = (*Col*)21; endline = (*EndLine*)119; endcol = (*EndCol*)29 }); (431, { line = (*Line*)125; col = (*Col*)22; endline = (*EndLine*)125; endcol = (*EndCol*)33 }); (646, { line = (*Line*)191; col = (*Col*)10; endline = (*EndLine*)191; endcol = (*EndCol*)12 }); (395, { line = (*Line*)118; col = (*Col*)13; endline = (*EndLine*)118; endcol = (*EndCol*)26 }); (682, { line = (*Line*)197; col = (*Col*)19; endline = (*EndLine*)197; endcol = (*EndCol*)21 }); (341, { line = (*Line*)91; col = (*Col*)26; endline = (*EndLine*)91; endcol = (*EndCol*)26 }); (691, { line = (*Line*)197; col = (*Col*)29; endline = (*EndLine*)197; endcol = (*EndCol*)29 }); (171, { line = (*Line*)71; col = (*Col*)52; endline = (*EndLine*)71; endcol = (*EndCol*)62 }); (377, { line = (*Line*)110; col = (*Col*)28; endline = (*EndLine*)110; endcol = (*EndCol*)29 }); (144, { line = (*Line*)67; col = (*Col*)22; endline = (*EndLine*)67; endcol = (*EndCol*)22 }); (485, { line = (*Line*)137; col = (*Col*)27; endline = (*EndLine*)137; endcol = (*EndCol*)33 }); (153, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)20 }); (467, { line = (*Line*)135; col = (*Col*)27; endline = (*EndLine*)135; endcol = (*EndCol*)33 }); (162, { line = (*Line*)71; col = (*Col*)14; endline = (*EndLine*)71; endcol = (*EndCol*)24 }); (359, { line = (*Line*)93; col = (*Col*)14; endline = (*EndLine*)93; endcol = (*EndCol*)14 }); (673, { line = (*Line*)195; col = (*Col*)5; endline = (*EndLine*)195; endcol = (*EndCol*)5 }); (709, { line = (*Line*)210; col = (*Col*)36; endline = (*EndLine*)210; endcol = (*EndCol*)36 }); (368, { line = (*Line*)101; col = (*Col*)7; endline = (*EndLine*)101; endcol = (*EndCol*)15 }); (135, { line = (*Line*)58; col = (*Col*)12; endline = (*EndLine*)58; endcol = (*EndCol*)15 }); (476, { line = (*Line*)136; col = (*Col*)16; endline = (*EndLine*)136; endcol = (*EndCol*)36 }); (350, { line = (*Line*)91; col = (*Col*)48; endline = (*EndLine*)91; endcol = (*EndCol*)48 }); (664, { line = (*Line*)193; col = (*Col*)16; endline = (*EndLine*)193; endcol = (*EndCol*)16 }); (323, { line = (*Line*)89; col = (*Col*)58; endline = (*EndLine*)89; endcol = (*EndCol*)58 }); (736, { line = (*Line*)215; col = (*Col*)13; endline = (*EndLine*)215; endcol = (*EndCol*)25 }); (362, { line = (*Line*)95; col = (*Col*)6; endline = (*EndLine*)95; endcol = (*EndCol*)6 }); (676, { line = (*Line*)195; col = (*Col*)10; endline = (*EndLine*)195; endcol = (*EndCol*)12 }); (272, { line = (*Line*)80; col = (*Col*)16; endline = (*EndLine*)80; endcol = (*EndCol*)26 }); (685, { line = (*Line*)197; col = (*Col*)21; endline = (*EndLine*)197; endcol = (*EndCol*)21 }); (344, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)48 }); (658, { line = (*Line*)193; col = (*Col*)5; endline = (*EndLine*)193; endcol = (*EndCol*)5 }); (317, { line = (*Line*)89; col = (*Col*)32; endline = (*EndLine*)89; endcol = (*EndCol*)40 }); (353, { line = (*Line*)91; col = (*Col*)54; endline = (*EndLine*)91; endcol = (*EndCol*)62 }); (434, { line = (*Line*)125; col = (*Col*)33; endline = (*EndLine*)125; endcol = (*EndCol*)33 }); (326, { line = (*Line*)89; col = (*Col*)61; endline = (*EndLine*)89; endcol = (*EndCol*)61 }); (299, { line = (*Line*)84; col = (*Col*)11; endline = (*EndLine*)84; endcol = (*EndCol*)11 }); (335, { line = (*Line*)91; col = (*Col*)5; endline = (*EndLine*)91; endcol = (*EndCol*)31 }); (649, { line = (*Line*)191; col = (*Col*)16; endline = (*EndLine*)191; endcol = (*EndCol*)16 }); (308, { line = (*Line*)88; col = (*Col*)12; endline = (*EndLine*)88; endcol = (*EndCol*)17 }); (721, { line = (*Line*)212; col = (*Col*)9; endline = (*EndLine*)212; endcol = (*EndCol*)17 }); (730, { line = (*Line*)214; col = (*Col*)15; endline = (*EndLine*)214; endcol = (*EndCol*)23 }); (416, { line = (*Line*)121; col = (*Col*)13; endline = (*EndLine*)121; endcol = (*EndCol*)21 }); (281, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)42 }); (595, { line = (*Line*)180; col = (*Col*)29; endline = (*EndLine*)180; endcol = (*EndCol*)31 }); (622, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)29 }); (290, { line = (*Line*)82; col = (*Col*)9; endline = (*EndLine*)82; endcol = (*EndCol*)9 }); (604, { line = (*Line*)181; col = (*Col*)13; endline = (*EndLine*)181; endcol = (*EndCol*)13 }); (712, { line = (*Line*)210; col = (*Col*)39; endline = (*EndLine*)210; endcol = (*EndCol*)48 }); (586, { line = (*Line*)180; col = (*Col*)9; endline = (*EndLine*)180; endcol = (*EndCol*)11 }); (667, { line = (*Line*)194; col = (*Col*)13; endline = (*EndLine*)194; endcol = (*EndCol*)13 }); (398, { line = (*Line*)118; col = (*Col*)25; endline = (*EndLine*)118; endcol = (*EndCol*)26 }); (748, { line = (*Line*)222; col = (*Col*)7; endline = (*EndLine*)222; endcol = (*EndCol*)13 }); (407, { line = (*Line*)119; col = (*Col*)43; endline = (*EndLine*)119; endcol = (*EndCol*)43 }); (613, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)9 }); (356, { line = (*Line*)93; col = (*Col*)9; endline = (*EndLine*)93; endcol = (*EndCol*)9 }); (562, { line = (*Line*)178; col = (*Col*)9; endline = (*EndLine*)178; endcol = (*EndCol*)11 }); (230, { line = (*Line*)74; col = (*Col*)52; endline = (*EndLine*)74; endcol = (*EndCol*)60 }); (257, { line = (*Line*)78; col = (*Col*)41; endline = (*EndLine*)78; endcol = (*EndCol*)41 }); (598, { line = (*Line*)180; col = (*Col*)31; endline = (*EndLine*)180; endcol = (*EndCol*)31 }); (679, { line = (*Line*)195; col = (*Col*)16; endline = (*EndLine*)195; endcol = (*EndCol*)16 }); (338, { line = (*Line*)91; col = (*Col*)16; endline = (*EndLine*)91; endcol = (*EndCol*)26 }); (688, { line = (*Line*)197; col = (*Col*)27; endline = (*EndLine*)197; endcol = (*EndCol*)29 }); (347, { line = (*Line*)91; col = (*Col*)34; endline = (*EndLine*)91; endcol = (*EndCol*)42 }); (553, { line = (*Line*)177; col = (*Col*)10; endline = (*EndLine*)177; endcol = (*EndCol*)10 }); (652, { line = (*Line*)192; col = (*Col*)13; endline = (*EndLine*)192; endcol = (*EndCol*)13 }); (248, { line = (*Line*)77; col = (*Col*)12; endline = (*EndLine*)77; endcol = (*EndCol*)12 }); (221, { line = (*Line*)74; col = (*Col*)28; endline = (*EndLine*)74; endcol = (*EndCol*)28 }); (589, { line = (*Line*)180; col = (*Col*)11; endline = (*EndLine*)180; endcol = (*EndCol*)11 }); (661, { line = (*Line*)193; col = (*Col*)10; endline = (*EndLine*)193; endcol = (*EndCol*)12 }); (320, { line = (*Line*)89; col = (*Col*)45; endline = (*EndLine*)89; endcol = (*EndCol*)55 }); (302, { line = (*Line*)87; col = (*Col*)9; endline = (*EndLine*)87; endcol = (*EndCol*)14 }); (643, { line = (*Line*)191; col = (*Col*)5; endline = (*EndLine*)191; endcol = (*EndCol*)5 }); (535, { line = (*Line*)166; col = (*Col*)10; endline = (*EndLine*)166; endcol = (*EndCol*)10 }); (203, { line = (*Line*)73; col = (*Col*)28; endline = (*EndLine*)73; endcol = (*EndCol*)38 }); (544, { line = (*Line*)169; col = (*Col*)15; endline = (*EndLine*)169; endcol = (*EndCol*)15 }); (275, { line = (*Line*)80; col = (*Col*)26; endline = (*EndLine*)80; endcol = (*EndCol*)26 }); (616, { line = (*Line*)182; col = (*Col*)21; endline = (*EndLine*)182; endcol = (*EndCol*)22 }); (311, { line = (*Line*)88; col = (*Col*)17; endline = (*EndLine*)88; endcol = (*EndCol*)17 }); (284, { line = (*Line*)80; col = (*Col*)48; endline = (*EndLine*)80; endcol = (*EndCol*)48 }); (625, { line = (*Line*)182; col = (*Col*)41; endline = (*EndLine*)182; endcol = (*EndCol*)42 }); (293, { line = (*Line*)82; col = (*Col*)14; endline = (*EndLine*)82; endcol = (*EndCol*)14 }); (365, { line = (*Line*)95; col = (*Col*)11; endline = (*EndLine*)95; endcol = (*EndCol*)11 }); (526, { line = (*Line*)163; col = (*Col*)6; endline = (*EndLine*)163; endcol = (*EndCol*)6 }); (571, { line = (*Line*)178; col = (*Col*)29; endline = (*EndLine*)178; endcol = (*EndCol*)31 }); (266, { line = (*Line*)79; col = (*Col*)12; endline = (*EndLine*)79; endcol = (*EndCol*)12 }); (580, { line = (*Line*)179; col = (*Col*)17; endline = (*EndLine*)179; endcol = (*EndCol*)17 }); (607, { line = (*Line*)182; col = (*Col*)3; endline = (*EndLine*)182; endcol = (*EndCol*)3 }); (628, { line = (*Line*)184; col = (*Col*)8; endline = (*EndLine*)184; endcol = (*EndCol*)11 }); (520, { line = (*Line*)160; col = (*Col*)6; endline = (*EndLine*)160; endcol = (*EndCol*)6 }); (179, { line = (*Line*)72; col = (*Col*)14; endline = (*EndLine*)72; endcol = (*EndCol*)28 }); (152, { line = (*Line*)70; col = (*Col*)10; endline = (*EndLine*)70; endcol = (*EndCol*)20 }); (493, { line = (*Line*)139; col = (*Col*)31; endline = (*EndLine*)139; endcol = (*EndCol*)31 }); (188, { line = (*Line*)72; col = (*Col*)42; endline = (*EndLine*)72; endcol = (*EndCol*)42 }); (592, { line = (*Line*)180; col = (*Col*)22; endline = (*EndLine*)180; endcol = (*EndCol*)22 }); (260, { line = (*Line*)78; col = (*Col*)44; endline = (*EndLine*)78; endcol = (*EndCol*)44 }); (269, { line = (*Line*)80; col = (*Col*)5; endline = (*EndLine*)80; endcol = (*EndCol*)31 }); (610, { line = (*Line*)182; col = (*Col*)9; endline = (*EndLine*)182; endcol = (*EndCol*)15 }); (170, { line = (*Line*)71; col = (*Col*)52; endline = (*EndLine*)71; endcol = (*EndCol*)62 }); (484, { line = (*Line*)137; col = (*Col*)27; endline = (*EndLine*)137; endcol = (*EndCol*)37 }); (215, { line = (*Line*)74; col = (*Col*)3; endline = (*EndLine*)74; endcol = (*EndCol*)11 }); (565, { line = (*Line*)178; col = (*Col*)15; endline = (*EndLine*)178; endcol = (*EndCol*)15 }); (466, { line = (*Line*)135; col = (*Col*)16; endline = (*EndLine*)135; endcol = (*EndCol*)24 }); (287, { line = (*Line*)80; col = (*Col*)54; endline = (*EndLine*)80; endcol = (*EndCol*)62 }); (161, { line = (*Line*)71; col = (*Col*)3; endline = (*EndLine*)71; endcol = (*EndCol*)11 }); (574, { line = (*Line*)178; col = (*Col*)35; endline = (*EndLine*)178; endcol = (*EndCol*)35 }); (242, { line = (*Line*)76; col = (*Col*)9; endline = (*EndLine*)76; endcol = (*EndCol*)9 }); (583, { line = (*Line*)180; col = (*Col*)8; endline = (*EndLine*)180; endcol = (*EndCol*)41 }); (529, { line = (*Line*)163; col = (*Col*)11; endline = (*EndLine*)163; endcol = (*EndCol*)11 }); (197, { line = (*Line*)73; col = (*Col*)3; endline = (*EndLine*)73; endcol = (*EndCol*)11 }); (224, { line = (*Line*)74; col = (*Col*)32; endline = (*EndLine*)74; endcol = (*EndCol*)42 }); (538, { line = (*Line*)167; col = (*Col*)11; endline = (*EndLine*)167; endcol = (*EndCol*)11 }); (296, { line = (*Line*)84; col = (*Col*)6; endline = (*EndLine*)84; endcol = (*EndCol*)6 }); (206, { line = (*Line*)73; col = (*Col*)38; endline = (*EndLine*)73; endcol = (*EndCol*)38 }); (233, { line = (*Line*)75; col = (*Col*)13; endline = (*EndLine*)75; endcol = (*EndCol*)27 }); (637, { line = (*Line*)190; col = (*Col*)10; endline = (*EndLine*)190; endcol = (*EndCol*)10 }); (305, { line = (*Line*)87; col = (*Col*)14; endline = (*EndLine*)87; endcol = (*EndCol*)14 }); (278, { line = (*Line*)80; col = (*Col*)34; endline = (*EndLine*)80; endcol = (*EndCol*)48 }); (619, { line = (*Line*)182; col = (*Col*)29; endline = (*EndLine*)182; endcol = (*EndCol*)35 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(83, ("R", "ada://parameter/Tetris_Functional-28:9/Move-138:14/R-138:49")); (86, ("Candidate", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Candidate+206:7")); (77, ("R", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/R-134:68")); (59, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Y-109:102")); (50, ("B", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/B-121:33")); (41, ("B", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/B-115:24")); (68, ("Has_Complete_Lines", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Has_Complete_Lines+111:7")); (53, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/X-107:60")); (62, ("Y", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/Y+66:7")); (8, ("Cur_Board", "ada://variable/Tetris_Functional-28:9/Cur_Board-55:4")); (17, ("Cur_Piece", "ada://variable/Tetris_Functional-28:9/Cur_Piece-76:4")); (44, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/R-115:70")); (80, ("R", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/R-136:61")); (71, ("R", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/R+114:7")); (74, ("R", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/R-124:54")); (56, ("Cur_Piece_S", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_S-109:37")); (47, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/R-117:45")); (14, ("D", "ada://component/Tetris_Functional-28:9/Piece-69:9/D-71:7")); (46, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Complete_Line-117:14/L-117:32")); (82, ("A", "ada://parameter/Tetris_Functional-28:9/Move-138:14/A-138:34")); (55, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/R-107:90")); (64, ("R", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/R+68:7")); (73, ("P", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/P-124:40")); (58, ("X", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/X-109:87")); (67, ("To_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/To_Line+110:7")); (85, ("Success", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/Success-140:37")); (49, ("R", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/R-119:42")); (13, ("S", "ada://component/Tetris_Functional-28:9/Piece-69:9/S-70:7")); (76, ("T", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/T-134:48")); (16, ("Y", "ada://component/Tetris_Functional-28:9/Piece-69:9/Y-73:7")); (79, ("A", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/A-136:46")); (88, ("Is_No_Overlap", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_No_Overlap+208:7")); (52, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Cur_Piece_D-107:33")); (43, ("X", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/X-115:54")); (70, ("From_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/From_Line+113:7")); (19, ("Cur_State", "ada://variable/Tetris_Functional-28:9/Cur_State-90:4")); (60, ("R", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/R-109:117")); (87, ("Is_Move_OK", "ada://variable/Tetris_Functional-28:9/Do_Action-140:14/Is_Move_OK+207:7")); (69, ("Del_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Del_Line+112:7")); (78, ("P", "ada://parameter/Tetris_Functional-28:9/Move_Is_Possible-136:14/P-136:32")); (63, ("X", "ada://variable/Tetris_Functional-28:9/Include_Piece_In_Board-142:14/X+67:7")); (54, ("Y", "ada://parameter/Tetris_Functional-28:9/Possible_I_Shapes-107:14/Y-107:75")); (72, ("B", "ada://parameter/Tetris_Functional-28:9/No_Overlap-124:14/B-124:26")); (81, ("P", "ada://parameter/Tetris_Functional-28:9/Move-138:14/P-138:20")); (57, ("Cur_Piece_D", "ada://parameter/Tetris_Functional-28:9/Possible_Three_Shapes-109:14/Cur_Piece_D-109:60")); (48, ("L", "ada://parameter/Tetris_Functional-28:9/Is_Empty_Line-119:14/L-119:29")); (84, ("A", "ada://parameter/Tetris_Functional-28:9/Do_Action-140:14/A-140:25")); (75, ("D", "ada://parameter/Tetris_Functional-28:9/Turn_Direction-134:14/D-134:30")); (66, ("Empty_Line", "ada://variable/Tetris_Functional-28:9/Delete_Complete_Lines-146:14/Empty_Line+108:7")); (15, ("X", "ada://component/Tetris_Functional-28:9/Piece-69:9/X-72:7")); (42, ("Y", "ada://parameter/Tetris_Functional-28:9/Is_Empty-115:14/Y-115:38")); (51, ("R", "ada://parameter/Tetris_Functional-28:9/No_Complete_Lines-121:14/R-121:47"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(26, ("Is_Empty", "ada://procedure_body/Tetris_Functional-28:9/Is_Empty-115:14")); (35, ("Move_Is_Possible", "ada://procedure/Tetris_Functional-28:9/Move_Is_Possible-136:14")); (29, ("No_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/No_Complete_Lines-121:14")); (38, ("Include_Piece_In_Board", "ada://procedure_body/Tetris_Functional-28:9/Include_Piece_In_Board-142:14")); (25, ("Possible_Three_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_Three_Shapes-109:14")); (34, ("Turn_Direction", "ada://procedure/Tetris_Functional-28:9/Turn_Direction-134:14")); (37, ("Do_Action", "ada://procedure_body/Tetris_Functional-28:9/Do_Action-140:14")); (28, ("Is_Empty_Line", "ada://procedure/Tetris_Functional-28:9/Is_Empty_Line-119:14")); (27, ("Is_Complete_Line", "ada://procedure/Tetris_Functional-28:9/Is_Complete_Line-117:14")); (36, ("Move", "ada://procedure/Tetris_Functional-28:9/Move-138:14")); (30, ("No_Overlap", "ada://procedure/Tetris_Functional-28:9/No_Overlap-124:14")); (39, ("Delete_Complete_Lines", "ada://procedure_body/Tetris_Functional-28:9/Delete_Complete_Lines-146:14")); (24, ("Possible_I_Shapes", "ada://procedure/Tetris_Functional-28:9/Possible_I_Shapes-107:14"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(40, ("Tetris_Functional", "ada://package_body/Tetris_Functional-28:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = [(23, ("Oriented_Three_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_Three_Shape-105:9")); (32, ("Move_Action", "ada://subtype/Tetris_Functional-28:9/Move_Action-131:12")); (11, ("Direction", "ada://ordinary_type/Tetris_Functional-28:9/Direction-67:9")); (2, ("Shape", "ada://subtype/Tetris_Functional-28:9/Shape-37:12")); (20, ("I_Delta", "ada://subtype/Tetris_Functional-28:9/I_Delta-102:12")); (5, ("Y_Coord", "ada://subtype/Tetris_Functional-28:9/Y_Coord-50:12")); (4, ("X_Coord", "ada://subtype/Tetris_Functional-28:9/X_Coord-49:12")); (31, ("Action", "ada://ordinary_type/Tetris_Functional-28:9/Action-129:9")); (22, ("Three_Delta", "ada://subtype/Tetris_Functional-28:9/Three_Delta-104:12")); (7, ("Board", "ada://ordinary_type/Tetris_Functional-28:9/Board-53:9")); (1, ("Cell", "ada://ordinary_type/Tetris_Functional-28:9/Cell-33:9")); (10, ("PY_Coord", "ada://subtype/Tetris_Functional-28:9/PY_Coord-64:12")); (9, ("PX_Coord", "ada://subtype/Tetris_Functional-28:9/PX_Coord-63:12")); (18, ("State", "ada://ordinary_type/Tetris_Functional-28:9/State-87:9")); (21, ("Oriented_I_Shape", "ada://ordinary_type/Tetris_Functional-28:9/Oriented_I_Shape-103:9")); (3, ("Three_Shape", "ada://subtype/Tetris_Functional-28:9/Three_Shape-41:12")); (12, ("Piece", "ada://ordinary_type/Tetris_Functional-28:9/Piece-69:9")); (33, ("Turn_Action", "ada://subtype/Tetris_Functional-28:9/Turn_Action-132:12")); (6, ("Line", "ada://ordinary_type/Tetris_Functional-28:9/Line-52:9"))]
})
}


