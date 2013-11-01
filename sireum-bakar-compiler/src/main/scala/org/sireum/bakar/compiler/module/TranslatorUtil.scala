package org.sireum.bakar.compiler.module

import collection.JavaConversions._
import org.sireum.bakar.xml._
import org.sireum.pilar.ast._
import org.sireum.util._
import org.sireum.bakar.symbol.FullTypeDecl
import org.sireum.bakar.symbol.SignedIntegerTypeDef
import java.net.URI

object BAKAR_KEYS {
  val PARAM_INFO = "BAKAR_PARAM_INFO"
}

object URIS {
  val TYPE_MAP = "BAKAR_TYPE_MAP"
  val TYPE_DEF = "BAKAR_TYPE_DEF"
  val TYPE_URI = "BAKAR_TYPE_URI"
  val REF_URI = "BAKAR_REF_URI"

  def addResourceUri[T <: org.sireum.pilar.symbol.Symbol](s : T, uri : String) = {
    import org.sireum.pilar.symbol.Symbol
    val u = new URI(uri)
    val paths =
      if (u.getPath.startsWith("/"))
        u.getPath.split("/").drop(1)
      else
        u.getPath.split("/")

    s.uri(u.getScheme, u.getAuthority, paths.toList, uri)
    s
  }
}

object Attribute {
  val ATTRIBUTE_MAP = "ATTRIBUTE_MAP"
  val FIRST = "FIRST"
  val LAST = "LAST"

  val ATTRIBUTE_UIF_FIRST = "attribute__uif__first"
  val ATTRIBUTE_UIF_LAST = "attribute__uif__last"

  val attributeURIprefix = "ada://procedure/__uif/"

}

object StandardURIs {
  val universalIntURI = "ada://ordinary_type/universal_integer".intern
  val universalRealURI = "ada://ordinary_type/universal_real".intern
  
  val boolURI = "ada://ordinary_type/Standard-1:1/Boolean-1:1".intern
  val integerURI = "ada://ordinary_type/Standard-1:1/Integer-1:1".intern
  val naturalURI = "ada://subtype/Standard-1:1/Natural-1:1".intern
  val positiveURI = "ada://subtype/Standard-1:1/Positive-1:1".intern

  val floatURI = "ada://ordinary_type/Standard-1:1/Float-1:1".intern
}

object StandardTypeDefs {
  def createType(typName : String, baseType : String, typURI : String) : TypeAliasDecl = {
    val tad = TypeAliasDecl(NameDefinition(typName), ivectorEmpty,
      NamedTypeSpec(NameUser(baseType), ilistEmpty[TypeSpec])
    )

    val istd = FullTypeDecl(typName, typURI,
      SignedIntegerTypeDef("myint", None, None))

    tad(URIS.TYPE_DEF) = istd
    tad(URIS.TYPE_URI) = typURI
    tad(URIS.REF_URI) = typURI
    tad
  }

  val UniversalInteger = createType("universal_integer", "Integer", StandardURIs.universalIntURI)
  val UniversalReal = createType("universal_real", "Float", StandardURIs.universalRealURI)
  
  val StandardBoolean = createType("standard::boolean", "Boolean", StandardURIs.boolURI)
  val StandardInteger = createType("standard::integer", "Integer", StandardURIs.integerURI)
  val StandardNatural = createType("standard::natural", "Integer", StandardURIs.naturalURI)
  val StandardPositive = createType("standard::positive", "Integer", StandardURIs.positiveURI)

  val StandardFloat = createType("standard::float", "Float", StandardURIs.floatURI)
}

object TranslatorUtil {

  def getTypeDeclarations(e : java.util.List[Base]) = {
    e.filter {
      case x : OrdinaryTypeDeclaration         => true
      case x : IncompleteTypeDeclaration       => true
      case x : PrivateTypeDeclaration          => true
      case x : SubtypeDeclaration              => true

      //case x : TaggedIncompleteTypeDeclaration => true
      //case x : FormalIncompleteTypeDeclaration => true
      //case x : FormalTypeDeclaration           => true

      // the following type declarations are not permitted in SPARK 2014
      case x : TaskTypeDeclaration             => false
      case x : ProtectedTypeDeclaration        => false
      case x : PrivateExtensionDeclaration     => false
      case _                                   => false
    }
  }

  def getConstantDeclarations(e : java.util.List[Base]) = {
    e.filter {
      case x : RealNumberDeclaration       => true
      case x : IntegerNumberDeclaration    => true
      case x : DeferredConstantDeclaration => true
      case x : ConstantDeclaration         => true
      case _                               => false
    }
  }

  def getGlobalDeclarations(el : java.util.List[Base]) = {
    for (e <- el if e.isInstanceOf[VariableDeclaration]) yield {
      e.asInstanceOf[VariableDeclaration]
    }
  }

  def getMethodDeclarations(e : java.util.List[Base]) = {
    e.filter {
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