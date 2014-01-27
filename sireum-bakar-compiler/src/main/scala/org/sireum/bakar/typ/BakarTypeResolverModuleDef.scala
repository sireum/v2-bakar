package org.sireum.bakar.typ

import org.sireum.bakar.compiler.module.URIS
import org.sireum.bakar.symbol.Type
import org.sireum.option.PipelineMode
import org.sireum.pilar.ast._
import org.sireum.pilar.ast.Model
import org.sireum.pipeline.Input
import org.sireum.pipeline.Output
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineJobModuleInfo
import org.sireum.util._
import org.sireum.bakar.symbol.TypeDecl

class BakarTypeResolverModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTypeResolverModule {
  
  // type uri to type definition
  val typeMap = mlinkedMapEmpty[ResourceUri, TypeDecl]

  var proc = ivectorEmpty[ProcedureDecl]

  // collect the type definitions
  for (m <- this.models) {
    val v = Visitor.build {
      case o : ProcedureDecl =>
        proc :+= o
        false
      case o : EnumDecl =>
        assert(URIS.hasTypeUri(o))
        assert(URIS.hasTypeDef(o))
        typeMap(URIS.getTypeUri(o)) = URIS.getTypeDef(o)
        true        
      case o : RecordDecl =>
        assert(URIS.hasTypeUri(o))
        assert(URIS.hasTypeDef(o))
        typeMap(URIS.getTypeUri(o)) = URIS.getTypeDef(o)
        true
      case o : AttributeDecl =>
        assert(URIS.hasTypeUri(o))
        //assert(o ? URIS.TYPE_DEF)
        
        val rf : ResourceUri = o.name.uri
        val tu : ResourceUri = URIS.getTypeUri(o)
        
        // FIXME: type erasure
        //typeMap(o(URIS.REF_URI)) = o(URIS.TYPE_URI).asInstanceOf[Type]
        false
      case o : TypeAliasDecl =>
        assert(URIS.hasTypeUri(o))
        assert(URIS.hasTypeDef(o))
        typeMap(URIS.getTypeUri(o)) = URIS.getTypeDef(o)
        false
    }
    v(m)
  }

  // attach the type to each exp
  val v = Visitor.build {
    case o : ProcedureDecl =>
      o(URIS.TYPE_MAP) = typeMap
      true
    case o : IndexingExp =>
      assert(URIS.hasTypeUri(o))

      val ouri : ResourceUri = URIS.getTypeUri(o)
      assert(typeMap.contains(ouri))

      URIS.addTypeDef(o, typeMap(ouri))
      true
    case o : AccessExp =>
      assert(URIS.hasTypeUri(o))
      val auri : ResourceUri = URIS.getTypeUri(o)

      assert(typeMap.contains(auri))

      URIS.addTypeDef(o, typeMap(auri))

      true
    case o : Exp =>
      if (URIS.hasTypeUri(o)) {
        val auri : ResourceUri = URIS.getTypeUri(o)
        if(auri != URIS.DUMMY_URI) {
          assert(typeMap.contains(auri))
          URIS.addTypeDef(o, typeMap(auri))
        }
      }
      true
  }
  for (p <- proc) {
    v(p)
  }

  // build the refuri to typuri map for the type provider
  val refUri2typeUri = mlinkedMapEmpty[ResourceUri, ResourceUri]

  for (m <- this.models) {
    val v = Visitor.build {
      case o @ GlobalVarDecl(name, _, Some(nts)) =>
        assert(name.name.contains("@@"))
        assert (name.uri.contains("@@"))
        refUri2typeUri(name.uri) = URIS.getTypeUri(nts)
        false
      case o @ ParamDecl(Some(nts), name, _) =>
        if(name.uri != URIS.DUMMY_URI)
          refUri2typeUri(name.uri) = URIS.getTypeUri(nts)
        false
      case o @ LocalVarDecl(Some(nts), name, _) =>
        refUri2typeUri(name.uri) = URIS.getTypeUri(nts)
        false      
      case o @ AccessExp(exp, nu) =>
        import org.sireum.pilar.symbol.Symbol
        assert (URIS.hasTypeUri(nu))

        val refUri : ResourceUri = nu.uri
        val typUri : ResourceUri = URIS.getTypeUri(nu)
        
        //assert(!refUri2typeUri.contains(refUri))
        refUri2typeUri(refUri) = typUri
        false

      // sanity checks
      case o @ NameExp(nu) =>
        import org.sireum.pilar.symbol.Symbol
        assert (nu.uri.startsWith("ada://procedure") || nu.uri.startsWith("ada://function") ||
            URIS.hasTypeUri(o))
        false
    }
    v(m)
  }

  this.bakarRef2TypeUriMap = refUri2typeUri.toMap
  
  this.bakarTypeUri2TypeMap = typeMap.toMap
}

case class BakarTypeResolver(
  title : String = "Bakar Type Resolver",

  @Input @Output models : ISeq[Model],

  @Output bakarRef2TypeUriMap : IMap[ResourceUri, ResourceUri],

  @Output bakarTypeUri2TypeMap : IMap[ResourceUri, TypeDecl])

object BakarTypeResolver {
  def main(args : Array[String]) {
    val sireum = System.getenv.get("SIREUM_HOME") + "/sireum"
    val destdir = "./src/main/scala/org/sireum/bakar/typ"    
    val cnames = Array(BakarTypeResolver.getClass.getName.dropRight(1))

    val args = List(sireum, "tools", "pipeline", "-d", destdir, cnames(0))

    val e = new Exec()
    // current sireum dist may not have the needed sireum classes so use 
    // eclipse's classpath instead
    e.env("CLASSPATH") = System.getProperty("java.class.path")

    println(e.run(10000, args, None, None))
  }
}