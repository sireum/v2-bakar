

let AST_Tree = 
{
(* = = = declarations = = = *)
decls = (SeqDecl (1,
NullDecl (* Undefined Declarations ! *),
(ProcBodyDecl (2, 
  mkprocBodyDecl (
   3,
    (* = = = Procedure Name = = = *)
    ((*Q*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnum = 4; parameter_name = ((*X*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
  { parameter_astnum = 5; parameter_name = ((*Z*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }],
    (* = = = Object Declarations = = = *)
    [NullDecl],
    (* = = = Procedure Body = = = *)
    (Assign (6, (Identifier (7, ((*Z*) 4) )), (BinOp (8, Plus, (Name (9, (Identifier (10, ((*X*) 3) )))), (Literal (11, (Integer_Literal 2) )) ))))
  ))
)));
(* = = = main procedure = = = *)
main = 1
}


let Symbol_Table = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 3), (In, Integer)); (((*Z*) 4), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Q*) 1), (0, mkprocBodyDecl (
 3,
  (* = = = Procedure Name = = = *)
  ((*Q*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnum = 4; parameter_name = ((*X*) 3); parameter_subtype_mark = Integer; parameter_mode = In }; 
{ parameter_astnum = 5; parameter_name = ((*Z*) 4); parameter_subtype_mark = Integer; parameter_mode = Out }],
  (* = = = Object Declarations = = = *)
  [NullDecl],
  (* = = = Procedure Body = = = *)
  (Assign (6, (Identifier (7, ((*Z*) 4) )), (BinOp (8, Plus, (Name (9, (Identifier (10, ((*X*) 3) )))), (Literal (11, (Integer_Literal 2) )) ))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(8, Integer); (11, Integer); (7, Integer); (10, Integer); (9, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(8, { line = (*Line*)5; col = (*Col*)11; endline = (*EndLine*)5; endcol = (*EndCol*)15 }); (11, { line = (*Line*)5; col = (*Col*)15; endline = (*EndLine*)5; endcol = (*EndCol*)15 }); (7, { line = (*Line*)5; col = (*Col*)6; endline = (*EndLine*)5; endcol = (*EndCol*)6 }); (10, { line = (*Line*)5; col = (*Col*)11; endline = (*EndLine*)5; endcol = (*EndCol*)11 }); (9, { line = (*Line*)5; col = (*Col*)11; endline = (*EndLine*)5; endcol = (*EndCol*)11 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(4, ("Z", "ada://parameter/PackageDemo_A-1:9/Q-2:13/Z-2:30")); (3, ("X", "ada://parameter/PackageDemo_A-1:9/Q-2:13/X-2:15"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Q", "ada://procedure_body/PackageDemo_A-1:9/Q-2:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(2, ("PackageDemo_A", "ada://package_body/PackageDemo_A-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


let AST_TreeRT = 
{
(* = = = declarations = = = *)
declsRT = (SeqDeclRT (1,
NullDeclRT (* Undefined Declarations ! *),
(ProcBodyDeclRT (2, 
  mkprocBodyDeclRT (
   3,
    (* = = = Procedure Name = = = *)
    ((*Q*) 1),
    (* = = = Formal Parameters = = = *)
    [{ parameter_astnumRT = 4; parameter_nameRT = ((*X*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
  { parameter_astnumRT = 5; parameter_nameRT = ((*Z*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
    (* = = = Object Declarations = = = *)
    [NullDeclRT],
    (* = = = Procedure Body = = = *)
    (AssignRT (6, (IdentifierRT (7, ((*Z*) 4) , [])), (BinOpRT (8, Plus, (NameRT (9, (IdentifierRT (10, ((*X*) 3) , [])))), (LiteralRT (11, (Integer_Literal 2) , [], [])) , [OverflowCheck], []))))
  ))
)));
(* = = = main procedure = = = *)
mainRT = 1
}


let Symbol_TableRT = {
  (*///////////////////////////////////*)
  (* = = = (1) variable type map = = = *)
  (*///////////////////////////////////*)
  vars = [(((*X*) 3), (In, Integer)); (((*Z*) 4), (Out, Integer))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram declaration map = = = *)
  (*////////////////////////////////////////////*)
  procs = [(((*Q*) 1), (0, mkprocBodyDeclRT (
 3,
  (* = = = Procedure Name = = = *)
  ((*Q*) 1),
  (* = = = Formal Parameters = = = *)
  [{ parameter_astnumRT = 4; parameter_nameRT = ((*X*) 3); parameter_subtype_markRT = Integer; parameter_modeRT = In }; 
{ parameter_astnumRT = 5; parameter_nameRT = ((*Z*) 4); parameter_subtype_markRT = Integer; parameter_modeRT = Out }],
  (* = = = Object Declarations = = = *)
  [NullDeclRT],
  (* = = = Procedure Body = = = *)
  (AssignRT (6, (IdentifierRT (7, ((*Z*) 4) , [])), (BinOpRT (8, Plus, (NameRT (9, (IdentifierRT (10, ((*X*) 3) , [])))), (LiteralRT (11, (Integer_Literal 2) , [], [])) , [OverflowCheck], []))))
)))];
  (*//////////////////////////////////////*)
  (* = = = (3) type declaration map = = = *)
  (*//////////////////////////////////////*)
  types = [];
  (*/////////////////////////////////////*)
  (* = = = (4) expression type map = = = *)
  (*/////////////////////////////////////*)
  exps = [(8, Integer); (11, Integer); (7, Integer); (10, Integer); (9, Integer)];
  (*/////////////////////////////////////////////////*)
  (* = = = (5) ast node to source location map = = = *)
  (*/////////////////////////////////////////////////*)
  sloc = [(8, { line = (*Line*)5; col = (*Col*)11; endline = (*EndLine*)5; endcol = (*EndCol*)15 }); (11, { line = (*Line*)5; col = (*Col*)15; endline = (*EndLine*)5; endcol = (*EndCol*)15 }); (7, { line = (*Line*)5; col = (*Col*)6; endline = (*EndLine*)5; endcol = (*EndCol*)6 }); (10, { line = (*Line*)5; col = (*Col*)11; endline = (*EndLine*)5; endcol = (*EndCol*)11 }); (9, { line = (*Line*)5; col = (*Col*)11; endline = (*EndLine*)5; endcol = (*EndCol*)11 })];
  (* = = = (6) name id to a pair of (name string, unique name string) map = = = *)
  (*/////////////////////////////////////////////////*)
  names = ({
  (*///////////////////////////////////*)
  (* = = = (1) variable names map = = = *)
  (*///////////////////////////////////*)
  varNames = [(4, ("Z", "ada://parameter/PackageDemo_A-1:9/Q-2:13/Z-2:30")); (3, ("X", "ada://parameter/PackageDemo_A-1:9/Q-2:13/X-2:15"))];
  (*////////////////////////////////////////////*)
  (* = = = (2) subprogram names map = = = *)
  (*////////////////////////////////////////////*)
  procNames = [(1, ("Q", "ada://procedure_body/PackageDemo_A-1:9/Q-2:13"))];
  (*//////////////////////////////////////*)
  (* = = = (3) package names map = = = *)
  (*//////////////////////////////////////*)
  pkgNames = [(2, ("PackageDemo_A", "ada://package_body/PackageDemo_A-1:9"))];
  (*/////////////////////////////////////*)
  (* = = = (4) type names map = = = *)
  (*/////////////////////////////////////*)
  typeNames = []
})
}


