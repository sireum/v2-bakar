package org.sireum.bakar.jago.util

import collection.JavaConversions._
import org.sireum.bakar.xml._
import org.sireum.util._
import org.sireum.option.ProgramTarget
import org.stringtemplate.v4.STGroupFile
import org.sireum.option.TypeTarget
import java.io.File
import java.io.FileWriter

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

  // - - - - - - - - - - -  - - - - - -  - - -  - - 
  def getAbsolutePath(fileName : String) : String = {
    // val fwriter = new FileWriter(new File(o.outFile, outFileName))
    // replace("/bin/", "/src/test/resources/")
    // val z1 = new File("./").getAbsoluteFile().toURI().toASCIIString()
    val currentPath = new File(".").getAbsolutePath().replace(".", "")
    val absolutePath =
      if (fileName.startsWith("~"))
        fileName.replace("~", System.getProperty("user.home"))
      else if (fileName.startsWith("/"))
        fileName
      else
        currentPath + fileName
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

  def readFromSrcFile(srcFileName : String): File = {
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

}