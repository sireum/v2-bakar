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
  val universalIntURI = "ada://ordinary_type/universal_integer"
    
  val boolURI = "ada://ordinary_type/Standard-1:1/Boolean-1:1"
  val integerURI = "ada://ordinary_type/Standard-1:1/Integer-1:1"
  val naturalURI = "ada://subtype/Standard-1:1/Natural-1:1"
  val positiveURI = "ada://subtype/Standard-1:1/Positive-1:1"    
}

object StandardTypeDefs {
  def createType(typName : String, typURI : String) : TypeAliasDecl = {
    val tad = TypeAliasDecl(NameDefinition(typName),
      TranslatorUtil.emptyAnnot,
      NamedTypeSpec(NameUser("Integer"), ilistEmpty[TypeSpec])
    )

    val istd = FullTypeDecl(typName, typURI,
      SignedIntegerTypeDef("myint", None, None))
  
    tad(URIS.TYPE_DEF) = istd
    tad(URIS.TYPE_URI) = typURI
    tad(URIS.REF_URI) = typURI
    tad
  }
  
  val UniversalInteger = createType("universal_integer", StandardURIs.universalIntURI)
  
  val StandardBoolean = createType("standard::boolean", StandardURIs.boolURI)
  val StandardInteger = createType("standard::integer", StandardURIs.integerURI)
  val StandardNatural = createType("standard::natural", StandardURIs.naturalURI)  
  val StandardPositive = createType("standard::positive", StandardURIs.positiveURI)    
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