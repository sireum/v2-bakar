package org.sireum.bakar.jago.util

import collection.JavaConversions._
import org.sireum.bakar.xml._
import org.sireum.util._
import org.sireum.option.ProgramTarget
import org.stringtemplate.v4.STGroupFile
import org.sireum.option.TypeTarget
import java.io.File
import java.io.FileWriter
import scala.util.matching.Regex

object URIS {
  // 
  val TYPE_URI = "BAKAR_TYPE_URI"
  val REF_URI = "BAKAR_REF_URI"
}

object StandardURIs {
  val boolURI = "ada://ordinary_type/Standard-1:1/Boolean-1:1"
}

object TranslatorUtil {
  val emptyAnnot = ivectorEmpty[String]

  def getTypeDeclarations(e : ElementList) = {
    e.getElements().filter {
      case x : OrdinaryTypeDeclaration => true
      case x : SubtypeDeclaration      => true
      case _                           => false
    }
  }

  def getConstantDeclarations(e : ElementList) = {
    e.getElements().filter {
      case x : RealNumberDeclaration       => true
      case x : IntegerNumberDeclaration    => true
      case x : DeferredConstantDeclaration => true
      case x : ConstantDeclaration         => true
      case _                               => false
    }
  }

  def getGlobalDeclarations(e : ElementList) = {
    e.getElements.filter {
      case x : VariableDeclaration => true
      case _                       => false
    }
  }

  def getMethodDeclarations(e : ElementList) = {
    e.getElements().filter {
      case o : ProcedureDeclaration        => true
      case o : ProcedureBodyDeclaration    => true
      case o : FunctionDeclaration         => true
      case o : FunctionBodyDeclaration     => true
      case o : GenericProcedureDeclaration => true
      case o : NullProcedureDeclaration    => true
      case _                               => false
    }
  }

  def getAbsolutePath(fileName : String) : String = {
//    val currentPath = new File(".").getAbsolutePath().replace(".", "")
//    val absolutePath =
//      if (fileName.startsWith("~"))
//        fileName.replace("~", System.getProperty("user.home"))
//      else if (fileName.startsWith("/"))
//        fileName
//      else
//        currentPath + fileName
    
    val absolutePath = new File(fileName).getAbsolutePath()
    absolutePath
  }

  def writeIntoOutFile(results : String, outFileName : String) {
    try {
      val absoluteOutputPath = getAbsolutePath(outFileName)
      val parentPath = (new File(absoluteOutputPath)).getParentFile()
      if (!parentPath.exists && !parentPath.mkdirs) {
        throw new RuntimeException("Could not create " + outFileName)
      }
      println("wrote into: " + absoluteOutputPath)
      val fwriter = new FileWriter(new File(absoluteOutputPath))
      fwriter.write(results)
      fwriter.close()
    } catch {
      case e : Throwable =>
        e.printStackTrace
        assert(false)
    }
  }

  def readFromSrcFile(srcFileName : String) : File = {
    try {
      val absoluteInputPath = getAbsolutePath(srcFileName)
      val srcFile = new File(absoluteInputPath)
      if (!srcFile.exists) {
        throw new RuntimeException("Could not open the file: " + srcFileName)
      }
      srcFile
    } catch {
      case e : Throwable =>
        e.printStackTrace
        assert(false)
        null
    }

  }

  def getReturnType(typeUri : String) : String = {
    val typ = typeUri.toLowerCase()
    typ match {
      case "integer" => "Integer"
      case "boolean" => "Boolean"
      case _ => ""
    }
  }
  
    def isNameExp(e: ExpressionClass) = {
    e match {
      case IdentifierEx(sloc, refName, ref, theType, checks) =>
        true
      case IndexedComponentEx(sloc, prefixQ, indexExpressionsQl, theType, checks) =>
        true
      case SelectedComponentEx(sloc, prefixQ, selectorQ, theType, checks) =>
        true
      case _ => false
    }
  }
  
  def generateStandardAst(target : String) = {
    // val regexp = """(Regexp1) (Regexp2)""", for object matched with regexp, 
    // the part matched by Regexp1 is called object.group(1), and 
    // the part matched by Regexp2 is called object.group(2); 
    // parenthesss "()" is used to separate the matched object into different groups
    // to match "(**...**)" using reluctant match "*?" instead of greedy one "*";
    val regexp = """(\(\*\*.*?\*\*\))|_xx|_XX""".r 
    regexp.replaceAllIn(target, matchedObj => "")
  }
  
  def generateAstWithChecks(target : String) = {
    // for a matched object, e.g. (**check**), group(1) is "(**", group(2) is "check", 
    // and group(3) is "**)";
    val regexp1 = """(\(\*\*)(.*?)(\*\*\))""".r 
    val regexp2 = """xx""".r
    val regexp3 = """_XX""".r
    var result = regexp1.replaceAllIn(target, matchedObj => matchedObj.group(2)) // remove run-time check flags from ast
    result = regexp2.replaceAllIn(result, matchedObj => "RT")
    regexp3.replaceAllIn(result, matchedObj => "RT")
  }    
}