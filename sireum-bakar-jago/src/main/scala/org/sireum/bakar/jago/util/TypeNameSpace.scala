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
      case Some("Coq") =>
        "nat"
      case Some("OCaml") => 
        "int" 
      case _ => 
        "int"
    }
  }
  val VarT = "ident";
  val ValT = "value";
  val Location = "location";
  
  val Type = "typ";
  val Uri = "uri";
  val Bool = "bool";
  val Constant = "constant"
  val Predicate = "predicate"
  val ExpressionT = "expr";
  val BinaryOpT = "binary_operation";
  val UnaryOpT = "unary_operation";
  val StatementListT = "stmt";
  
  val ModeT = "mode";
  val Defining_Identifier = "defining_ident";
  val ReturnType = "retT";
  val SubProgramAspectSpecs = "subprog_aspect_specs";
  val Parameter = "param";
  val ProcedureBodyT = "procedure_body";
  val FunctionBodyT = "function_body"; // "function" is a reserved key word in OCaml
  val SubProgramT = "subprogram";
  val PackageBodyAspectSpecs = "pkgbody_aspect_specs";
  val PackageBodyT = "package_body";
  val PackageDeclaration = "package_declaration";
  val CompilationUnit = "compilation_unit";
   
  val Assert = "assert"; // LoopInvariant
  val LoopInvariant = "loopInvariant";
  val Check = "check";
  val Pre = "pre";
  val Post = "post"
}

