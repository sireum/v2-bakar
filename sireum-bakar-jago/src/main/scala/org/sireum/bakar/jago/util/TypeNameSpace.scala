package org.sireum.bakar.jago.util

import org.sireum.bakar.jago.xml.XMLSchemaTranslator

object TypeNameSpace {
  val ProgramTransTemplate_Coq = "ProgramTrans_xml2coq.stg";
  val ProgramTransTemplate_OCaml = "ProgramTrans_xml2ocaml.stg";
  val TypeTransTemplate_Coq = "TypeTrans_xml2coq.stg";
  val TypeTransTemplate_OCaml = "TypeTrans_xml2ocaml.stg";
  val CoqFileName = "SPARKSyntaxInCoq";
  val OCamlFileName = "SPARKSyntaxInOCaml";
  
  def Integer(option: Option[String]) = {
    option match {
      case Some("coq") =>
        "nat"
      case Some("ocaml") => 
        "int" 
      case _ => 
        "int"
    }
  }

//  val ValT = "value";
//  val Location = "location";
  
  val AstNum = "astnum";
  val IdNum = "idnum";
  val ProcNum = "procnum";
  val PkgNum = "pkgnum";
  val TypeNum = "typenum";
  val AspectNum = "aspectnum";
  val TypeUri = "typeuri";
  val TypeTable = "type_table";
  
  val Type = "typ";
  val Bool = "bool";
  val String = "string";
  val Constant = "constant"
  val Predicate = "predicate"
  val Expression = "expr";
  val BinaryOp = "binary_operation";
  val UnaryOp = "unary_operation";
  val StatementList = "stmt";
  
  val ModeT = "mode";
  val LocalVariableDeclaration = "local_declaration";
  val GlobalVariableDeclaration = "global_declaration";
  val AspectSpecification = "aspect_specification";
  val ParameterSpecification = "param_specification";
  val ProcedureBody = "procedure_body";
  val FunctionBody = "function_body"; // "function" is a reserved key word in OCaml
  val SubProgram = "subprogram";
  val PackageBodyDecl = "package_body";
  val PackageDeclaration = "package_declaration";
  val UnitDeclaration = "unit_declaration";
  val CompilationUnit = "compilation_unit";
   
  val Assert = "assert"; // LoopInvariant
  val LoopInvariant = "loopInvariant";
  val Check = "check";
  val Pre = "pre";
  val Post = "post"
}

