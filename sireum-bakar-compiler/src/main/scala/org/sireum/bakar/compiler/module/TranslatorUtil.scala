package org.sireum.bakar.compiler.module

import org.sireum.util.PropertyProvider

object BAKAR_KEYS {
  val LOOP_LABEL_KEY = "LOOP_LABEL"
}

object URIS {
  import java.net.URI
  import org.sireum.util.ResourceUri
  import org.sireum.pilar.ast.Exp

  val TYPE_MAP = "BAKAR_TYPE_MAP"
  val TYPE_DEF = "BAKAR_TYPE_DEF"
  val TYPE_URI = "BAKAR_TYPE_URI"
  val REF_URI = "BAKAR_REF_URI"

  val DUMMY_URI = "__DUMMY_URI__"

  val uriPrefixParameter = "ada://parameter/"
  val uriPrefixVariable = "ada://variable/"
    
  val uriPrefixExpressionFunction = "ada://expression_function/"
  val uriPrefixFunctionBody = "ada://function_body/"
  val uriPrefixFunctionSpec = "ada://function/"    
  val uriPrefixPackageBody = "ada://package_body/"
  val uriPrefixPackageSpec = "ada://package/"    
  val uriPrefixProcedureBody = "ada://procedure_body/"
  val uriPrefixProcedureSpec = "ada://procedure/"
    
  def addTypeUri[E <: PropertyProvider](e: E, uri: String) : E = {
    e(TYPE_URI) = uri
    e
  }
  
  def getTypeUri[E <: PropertyProvider](e: E) : ResourceUri = e(TYPE_URI)
  
  def addResourceUri[T <: org.sireum.pilar.symbol.Symbol](s: T, uri: String) = {

    val u = new URI(uri)
    val paths =
      if (u.getPath.startsWith("/"))
        u.getPath.split("/").drop(1)
      else
        u.getPath.split("/")

    s.uri(u.getScheme, u.getAuthority, paths.toList, uri)
    s
  }

  def isTypeUri(u: ResourceUri) =
    u.startsWith("ada://ordinary_type/") || u.startsWith("ada://subtype/") ||
    u.startsWith("ada://private_type/")

  def isUIFUri(u:ResourceUri) = u.startsWith(UIF.uifURIprefix)
    
  def isMethodUri(u: ResourceUri) =
    u.startsWith("ada://procedure") || u.startsWith("ada://function") ||
    u.startsWith("ada://expression_function")

  def isAdaMethodUri(u:ResourceUri) = isAdaMethodSpecUri(u) || isAdaMethodBodyUri(u)
  def isAdaMethodSpecUri(u:ResourceUri) = isAdaProcedureSpecUri(u) || isAdaFunctionSpecUri(u)
  def isAdaMethodBodyUri(u:ResourceUri) = isAdaProcedureBodyUri(u) || isAdaFunctionBodyUri(u)
    
  def isAdaProcedureUri(u:ResourceUri) = isAdaProcedureSpecUri(u) || isAdaProcedureBodyUri(u)
  def isAdaProcedureSpecUri(u:ResourceUri) = u.startsWith(uriPrefixProcedureSpec)     
  def isAdaProcedureBodyUri(u:ResourceUri) = u.startsWith(uriPrefixProcedureBody) 
    
  def isAdaFunctionUri(u:ResourceUri) = isAdaFunctionSpecUri(u) || isAdaFunctionBodyUri(u)
  def isAdaFunctionSpecUri(u:ResourceUri) = u.startsWith(uriPrefixFunctionSpec)    
  def isAdaFunctionBodyUri(u:ResourceUri) = u.startsWith(uriPrefixFunctionBody) || isAdaExpressionFunctionUri(u)
  def isAdaExpressionFunctionUri(u:ResourceUri) = u.startsWith(uriPrefixExpressionFunction)
  
  def isPackageUri(u: ResourceUri) = u.startsWith("ada://package")
  def isAdaPackageUri(u: ResourceUri) = isAdaPackageSpecUri(u) || isAdaPackageBodyUri(u)
  def isAdaPackageSpecUri(u: ResourceUri) = u.startsWith(uriPrefixPackageSpec)
  def isAdaPackageBodyUri(u: ResourceUri) = u.startsWith(uriPrefixPackageBody)  
}

object VariableURIs {
  val tempVarPrefix = "ada://variable__temp/"
}

object PackageURIs {
  import org.sireum.util.ResourceUri

  val standardPackageURI = "ada://package__default/standard"
  val anonymousPackageBodyURIprefix = "ada://package_body__anonymous/"
    
  val initBodyProcedureURIprefix = "ada://procedure_body__package_init/"
  val initSpecProcedureURIprefix = "ada://procedure__package_init/"
    
  val constSpecDeclPrefixUri = "ada://constant_declaration/"
  val constBodyDeclPrefixUri = "ada://constant_declaration_body/"
  
  def isPackageAnonymous(u: ResourceUri) = u.startsWith(anonymousPackageBodyURIprefix)
  
  def isPackageInitProcedure(u: ResourceUri) = isPackageBodyInitProcedure(u) || isPackageSpecInitProcedure(u)
  def isPackageBodyInitProcedure(u: ResourceUri) = u.startsWith(initBodyProcedureURIprefix)
  def isPackageSpecInitProcedure(u: ResourceUri) = u.startsWith(initSpecProcedureURIprefix)
}

object UIF {
  val uifURIprefix = "ada://function__uif/"
}

object Attribute {
  val ATTRIBUTE_MAP = "ATTRIBUTE_MAP"
  val FIRST = "FIRST"
  val LAST = "LAST"

  val ATTRIBUTE_UIF_FIRST = "attribute__uif__first"
  val ATTRIBUTE_UIF_IMAGE = "attribute__uif__image"
  val ATTRIBUTE_UIF_LAST = "attribute__uif__last"
  val ATTRIBUTE_UIF_LENGTH = "attribute__uif__length"
  val ATTRIBUTE_UIF_LOOP_ENTRY = "attribute__uif__loop_entry"
  val ATTRIBUTE_UIF_MAX = "attribute__uif__max"
  val ATTRIBUTE_UIF_MIN = "attribute__uif__min"
  val ATTRIBUTE_UIF_OLD = "attribute__uif__old"
  val ATTRIBUTE_UIF_PRED = "attribute__uif__pred"
  val ATTRIBUTE_UIF_RESULT = "attribute__uif__result"
  val ATTRIBUTE_UIF_SUCC = "attribute__uif__succ"
  val ATTRIBUTE_UIF_UPDATE_EXP = "attribute__uif__update_exp"    
}

object BinaryOps {
  val MOD_OP = "MOD"
  val POWER_OP = "POWER"
  val STRING_CONCATENATE_OP = "STRING_CONCATENATE"
  val XOR_OP = "XOR"
}

object Proof {
  val PROOF_UIF_ASSERT = "proof__uif__assert"  
  val PROOF_UIF_ASSERT_AND_CUT = "proof__uif__assert_and_cut"
  val PROOF_UIF_ASSUME = "proof__uif__assume"  
  val PROOF_UIF_LOOP_INVARIANT = "proof__uif__loop_invariant"
  val PROOF_UIF_LOOP_VARIANT = "proof__uif__loop_variant"
  val PROOF_UIF_FOR_ALL = "proof__uif__for_all"
  val PROOF_UIF_FOR_ALL_REV = "proof__uif__for_all_rev"
  val PROOF_UIF_FOR_SOME = "proof__uif__for_some"
  val PROOF_UIF_FOR_SOME_REV = "proof__uif__for_some_rev"    
}

object StandardURIs {
  val universalIntURI = "ada://ordinary_type/universal_integer"
  val universalRealURI = "ada://ordinary_type/universal_real"

  val boolURI = "ada://ordinary_type/Standard-1:1/Boolean-1:1"
  val integerURI = "ada://ordinary_type/Standard-1:1/Integer-1:1"
  val naturalURI = "ada://subtype/Standard-1:1/Natural-1:1"
  val positiveURI = "ada://subtype/Standard-1:1/Positive-1:1"

  val floatURI = "ada://ordinary_type/Standard-1:1/Float-1:1"

  val charURI = "ada://ordinary_type/Standard-1:1/Character-1:1"
  val stringURI = "ada://ordinary_type/Standard-1:1/String-1:1"
}

object StandardTypeDefs {
  import org.sireum.util.ilistEmpty
  import org.sireum.util.ivectorEmpty
  import org.sireum.bakar.symbol.FullTypeDecl
  import org.sireum.bakar.symbol.SignedIntegerTypeDef
  import org.sireum.pilar.ast.NameDefinition
  import org.sireum.pilar.ast.NameUser
  import org.sireum.pilar.ast.NamedTypeSpec
  import org.sireum.pilar.ast.TypeAliasDecl
  import org.sireum.pilar.ast.TypeSpec

  private def createType(typName: String, baseType: String, typURI: String): TypeAliasDecl = {
    val pilarTypeDec = TypeAliasDecl(
      URIS.addResourceUri(NameDefinition(typName), typURI), ivectorEmpty,
      NamedTypeSpec(NameUser(baseType), ilistEmpty[TypeSpec]))

    val sparkTypeDec = FullTypeDecl(typName, typURI,
      SignedIntegerTypeDef(None, None))

    pilarTypeDec(URIS.TYPE_DEF) = sparkTypeDec
    pilarTypeDec(URIS.TYPE_URI) = typURI
    pilarTypeDec
  }

  val UniversalInteger = createType("universal_integer", "universal_integer", StandardURIs.universalIntURI)
  val UniversalReal = createType("universal_real", "universal_real", StandardURIs.universalRealURI)

  val StandardBoolean = createType("Boolean", "Boolean", StandardURIs.boolURI)
  val StandardInteger = createType("Integer", "Integer", StandardURIs.integerURI)
  val StandardNatural = createType("Natural", "Integer", StandardURIs.naturalURI)
  val StandardPositive = createType("Positive", "Integer", StandardURIs.positiveURI)

  val StandardFloat = createType("Float", "Float", StandardURIs.floatURI)

  val StandardCharacter = createType("Character", "Character", StandardURIs.charURI)
  val StandardString = createType("String", "String", StandardURIs.stringURI)
}

object TranslatorUtil {
  import scala.collection.JavaConversions.asScalaBuffer
  import org.sireum.bakar.xml.Base
  import org.sireum.bakar.xml.ConstantDeclaration
  import org.sireum.bakar.xml.DeferredConstantDeclaration
  import org.sireum.bakar.xml.ExpressionFunctionDeclaration
  import org.sireum.bakar.xml.FunctionBodyDeclaration
  import org.sireum.bakar.xml.FunctionDeclaration
  import org.sireum.bakar.xml.GenericProcedureDeclaration
  import org.sireum.bakar.xml.IncompleteTypeDeclaration
  import org.sireum.bakar.xml.IntegerNumberDeclaration
  import org.sireum.bakar.xml.NullProcedureDeclaration
  import org.sireum.bakar.xml.OrdinaryTypeDeclaration
  import org.sireum.bakar.xml.PackageBodyDeclaration
  import org.sireum.bakar.xml.PackageDeclaration  
  import org.sireum.bakar.xml.PrivateExtensionDeclaration
  import org.sireum.bakar.xml.PrivateTypeDeclaration
  import org.sireum.bakar.xml.ProcedureBodyDeclaration
  import org.sireum.bakar.xml.ProcedureDeclaration
  import org.sireum.bakar.xml.ProtectedTypeDeclaration
  import org.sireum.bakar.xml.RealNumberDeclaration
  import org.sireum.bakar.xml.SubtypeDeclaration
  import org.sireum.bakar.xml.TaskTypeDeclaration
  import org.sireum.bakar.xml.VariableDeclaration
  import org.sireum.pilar.ast.NameDefinition
  import org.sireum.pilar.ast.NameUser
  import org.sireum.pilar.ast.NamedTypeSpec
  import org.sireum.pilar.ast.TypeAliasDecl
  import org.sireum.pilar.ast.TypeSpec

  def getTypeDeclarations(e: java.util.List[Base]) = {
    e.filter {
      case x: OrdinaryTypeDeclaration => true
      case x: IncompleteTypeDeclaration => true
      case x: PrivateTypeDeclaration => true
      case x: SubtypeDeclaration => true

      //case x : TaggedIncompleteTypeDeclaration => true
      //case x : FormalIncompleteTypeDeclaration => true
      //case x : FormalTypeDeclaration           => true

      // the following type declarations are not permitted in SPARK 2014
      case x: TaskTypeDeclaration => false
      case x: ProtectedTypeDeclaration => false
      case x: PrivateExtensionDeclaration => false
      case _ => false
    }
  }

  def getConstantDeclarations(e: java.util.List[Base]) = {
    e.filter {
      case x: RealNumberDeclaration => true
      case x: IntegerNumberDeclaration => true
      case x: DeferredConstantDeclaration => true
      case x: ConstantDeclaration => true
      case _ => false
    }
  }

  def getVariableDeclarations(el: java.util.List[Base]) =
    for (e <- el if e.isInstanceOf[VariableDeclaration]) yield e.asInstanceOf[VariableDeclaration]

  def getMethodDeclarations(e: java.util.List[Base]) = e.filter(isMethodDeclaration)

  def isPackageDeclaration(o: Base) =
    o match {
      case i: PackageBodyDeclaration => true
      case i: PackageDeclaration => true
      case _ => false
    }

  def isMethodDeclaration(o: Base) =
    o match {
      case i: ExpressionFunctionDeclaration => true
      case i: FunctionBodyDeclaration => true
      case i: FunctionDeclaration => true
      case i: GenericProcedureDeclaration => true
      case i: NullProcedureDeclaration => true
      case i: ProcedureBodyDeclaration => true
      case i: ProcedureDeclaration => true
      case _ => false
    }
}