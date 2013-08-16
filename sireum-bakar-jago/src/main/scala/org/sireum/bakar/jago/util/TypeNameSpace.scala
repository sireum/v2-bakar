package org.sireum.bakar.jago.util
 
import org.sireum.bakar.jago.typ
import org.sireum.option.TypeTarget

/**
 * Notice: "type", "or" are keyword in OCaml, so the generated language
 *         should use other names;
 */

object TypeNameSpace {
  val ProgramTransTemplate_Coq = "Program_In_Coq.stg"
  val ProgramTransTemplate_OCaml = "Program_In_Ocaml.stg"
  val TypeTransTemplate_Coq = "Type_In_Coq.stg"
  val TypeTransTemplate_OCaml = "Type_In_Ocaml.stg"
  val CoqFileName = "SPARKSyntaxInCoq"
  val OCamlFileName = "SPARKSyntaxInOCaml"
  
  def Integer(option: TypeTarget.Type) = {
    option match {
      case TypeTarget.Coq =>
        "Z"
      case TypeTarget.Ocaml => 
        "int"
    }
  }
  
  val AstNum = "astnum"
  val IdNum = "idnum"
  val ProcNum = "procnum"
  val PkgNum = "pkgnum"
  val TypeNum = "typenum"
  val AspectNum = "aspectnum"
  val TypeUri = "typeuri"
  val TypeTable = "type_table"
  
  val Type = "type"
  val Bool = "bool"
  val String = "string"
  val Literal = "literal"
  val Predicate = "predicate"
  val Expression = "expression"
  val BinaryOp = "binary_operator"
  val UnaryOp = "unary_operator"
  val Statement = "statement"
  
  val ModeT = "mode"
  val ObjectDeclaration = "object_declaration"
  val GlobalVariableDeclaration = "global_declaration"
  val AspectSpecification = "aspect_specification"
  val ParameterSpecification = "parameter_specification"
  val ProcedureBody = "procedure_body"
  val FunctionBody = "function_body" // "function" is a reserved key word in OCaml
  val SubProgram = "subprogram"
  val PackageBodyDecl = "package_body"
  val PackageDeclaration = "package_declaration"
  val UnitDeclaration = "library_unit_declaration"
  val CompilationUnit = "compilation_unit"
   
  val Assert = "assert" // LoopInvariant
  val LoopInvariant = "loopInvariant"
  val Check = "check"
  val Pre = "pre"
  val Post = "post"
}

