package org.sireum.bakar.compiler.module

object BAKAR_KEYS {
  val PARAM_INFO = "BAKAR_PARAM_INFO"
}

object URIS {
  import java.net.URI
  import org.sireum.util.ResourceUri

  val TYPE_MAP = "BAKAR_TYPE_MAP"
  val TYPE_DEF = "BAKAR_TYPE_DEF"
  val TYPE_URI = "BAKAR_TYPE_URI"
  val REF_URI = "BAKAR_REF_URI"
    
  val DUMMY_URI = "__DUMMY_URI__"

  def addResourceUri[T <: org.sireum.pilar.symbol.Symbol](s : T, uri : String) = {

    val u = new URI(uri)
    val paths =
      if (u.getPath.startsWith("/"))
        u.getPath.split("/").drop(1)
      else
        u.getPath.split("/")

    s.uri(u.getScheme, u.getAuthority, paths.toList, uri)
    s
  }
  
  def isTypeUri(u : ResourceUri) = 
    u.startsWith("ada://ordinary_type/") || u.startsWith("ada://subtype/")
  
  def isMethodUri(u : ResourceUri) = 
    u.startsWith("ada://procedure") || u.startsWith("ada://function")
}

object VariableURIs {
  val tempVarPrefix = "ada://variable__temp/"
}

object PackageURIs {
  import org.sireum.util.ResourceUri

  val standardPackageURI = "ada://package__default/standard"

  val initBodyProcedureURIprefix = "ada://procedure_body__package_init/"
  val initSpecProcedureURIprefix = "ada://procedure__package_init/"

  def isPackageInitProcedure(u : ResourceUri) = isPackageBodyInitProcedure(u) || isPackageSpecInitProcedure(u)
  def isPackageBodyInitProcedure(u : ResourceUri) = u.startsWith(initBodyProcedureURIprefix)
  def isPackageSpecInitProcedure(u : ResourceUri) = u.startsWith(initSpecProcedureURIprefix)
}

object UIF {
  val uifURIprefix = "ada://function__uif/"  
}

object Attribute {
  val ATTRIBUTE_MAP = "ATTRIBUTE_MAP"
  val FIRST = "FIRST"
  val LAST = "LAST"

  val ATTRIBUTE_UIF_ARRAY_UPDATE = "attribute__uif__array_update"
  val ATTRIBUTE_UIF_FIRST = "attribute__uif__first"
  val ATTRIBUTE_UIF_IMAGE = "attribute__uif__iamge"    
  val ATTRIBUTE_UIF_LAST = "attribute__uif__last"
  val ATTRIBUTE_UIF_LENGTH = "attribute__uif__length"    
  val ATTRIBUTE_UIF_LOOP_ENTRY = "attribute__uif__loop_entry"
  val ATTRIBUTE_UIF_MAX = "attribute__uif__max"        
  val ATTRIBUTE_UIF_MIN = "attribute__uif__min"    
  val ATTRIBUTE_UIF_OLD = "attribute__uif__old"
  val ATTRIBUTE_UIF_PRED = "attribute__uif__pred"
  val ATTRIBUTE_UIF_RESULT = "attribute__uif__result"
  val ATTRIBUTE_UIF_SUCC = "attribute__uif__succ"
}

object BinaryOps {
  val MOD_OP = "MOD"
  val POWER_OP = "POWER"
  val STRING_CONCATENATE_OP = "STRING_CONCATENATE"
  val XOR_OP = "XOR"
}

object Proof {
  val PROOF_UIF_ASSERT_AND_CUT = "proof__uif__assert_and_cut"  
  val PROOF_UIF_LOOP_INVARIANT = "proof__uif__loop_invariant"      
  val PROOF_UIF_LOOP_VARIANT = "proof__uif__loop_variant"      
  val PROOF_UIF_FOR_ALL = "proof__uif__for_all"  
  val PROOF_UIF_FOR_SOME = "proof__uif__for_some"
}


object StandardURIs {
  val universalIntURI = "ada://ordinary_type/universal_integer".intern
  val universalRealURI = "ada://ordinary_type/universal_real".intern

  val boolURI = "ada://ordinary_type/Standard-1:1/Boolean-1:1".intern
  val integerURI = "ada://ordinary_type/Standard-1:1/Integer-1:1".intern
  val naturalURI = "ada://subtype/Standard-1:1/Natural-1:1".intern
  val positiveURI = "ada://subtype/Standard-1:1/Positive-1:1".intern

  val floatURI = "ada://ordinary_type/Standard-1:1/Float-1:1".intern
  
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

  def createType(typName : String, baseType : String, typURI : String) : TypeAliasDecl = {
    val pilarTypeDec = TypeAliasDecl(NameDefinition(typName), ivectorEmpty,
      NamedTypeSpec(NameUser(baseType), ilistEmpty[TypeSpec])
    )

    val sparkTypeDec = FullTypeDecl(typName, typURI,
      SignedIntegerTypeDef(None, None))

    pilarTypeDec(URIS.TYPE_DEF) = sparkTypeDec
    pilarTypeDec(URIS.TYPE_URI) = typURI
    pilarTypeDec(URIS.REF_URI) = typURI
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

  def getTypeDeclarations(e : java.util.List[Base]) = {
    e.filter {
      case x : OrdinaryTypeDeclaration     => true
      case x : IncompleteTypeDeclaration   => true
      case x : PrivateTypeDeclaration      => true
      case x : SubtypeDeclaration          => true

      //case x : TaggedIncompleteTypeDeclaration => true
      //case x : FormalIncompleteTypeDeclaration => true
      //case x : FormalTypeDeclaration           => true

      // the following type declarations are not permitted in SPARK 2014
      case x : TaskTypeDeclaration         => false
      case x : ProtectedTypeDeclaration    => false
      case x : PrivateExtensionDeclaration => false
      case _                               => false
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

  def getVariableDeclarations(el : java.util.List[Base]) = 
    for (e <- el if e.isInstanceOf[VariableDeclaration]) yield 
      e.asInstanceOf[VariableDeclaration]

  def getMethodDeclarations(e : java.util.List[Base]) = {
    e.filter {
      case o : ExpressionFunctionDeclaration => true
      case o : FunctionBodyDeclaration     => true
      case o : FunctionDeclaration         => true
      case o : GenericProcedureDeclaration => true
      case o : NullProcedureDeclaration    => true      
      case o : ProcedureBodyDeclaration    => true
      case o : ProcedureDeclaration        => true
      case _                               => false
    }
  }
}