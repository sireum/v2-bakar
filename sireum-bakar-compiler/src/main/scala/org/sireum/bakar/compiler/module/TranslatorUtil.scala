package org.sireum.bakar.compiler.module

import collection.JavaConversions._
import org.sireum.bakar.xml._
import org.sireum.pilar.ast._
import org.sireum.util._
import org.sireum.bakar.symbol.FullTypeDecl
import org.sireum.bakar.symbol.SignedIntegerTypeDef

object URIS {
  val TYPE_MAP = "BAKAR_TYPE_MAP"
  val TYPE_DEF = "BAKAR_TYPE_DEF"
  val TYPE_URI = "BAKAR_TYPE_URI"
  val REF_URI = "BAKAR_REF_URI"
}

object StandardURIs {
  val boolURI = "ada://ordinary_type/Standard-1:1/Boolean-1:1"
  val integerURI = "ada://ordinary_type/Standard-1:1/Integer-1:1"
  //StandardInteger(URIS.TYPE_DEF) = ""

}

object StandardTypeDefs {

  val StandardInteger =
    TypeAliasDecl(NameDefinition("standard::integer"),
      TranslatorUtil.emptyAnnot,
      NamedTypeSpec(NameUser(""), ilistEmpty[TypeSpec])
    )

  val istd = FullTypeDecl("standard::integer", StandardURIs.integerURI,
    SignedIntegerTypeDef("myint", None, None))

  StandardInteger(URIS.TYPE_DEF) = istd
  StandardInteger(URIS.TYPE_URI) = StandardURIs.integerURI
  StandardInteger(URIS.REF_URI) = StandardURIs.integerURI
}

object TranslatorUtil {
  val emptyAnnot = ivectorEmpty[Annotation]

  def getTypeDeclarations(e : ElementList) = {
    e.getElements().filter {
      case x : OrdinaryTypeDeclaration         => true
      case x : IncompleteTypeDeclaration       => true
      case x : PrivateTypeDeclaration          => true
      case x : SubtypeDeclaration              => true
      case x : ProtectedTypeDeclaration        => true
      case x : TaggedIncompleteTypeDeclaration => true
      case x : FormalIncompleteTypeDeclaration => true
      case x : FormalTypeDeclaration           => true
      case _                                   => false
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
}