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
import org.sireum.pipeline.gen.ModuleGenerator
import org.sireum.util._

class BakarTypeResolverModuleDef(val job : PipelineJob, info : PipelineJobModuleInfo) extends BakarTypeResolverModule {
  
  // type uri to type definition
  val typeMap = mmapEmpty[ResourceUri, Type]

  var proc = ivectorEmpty[ProcedureDecl]

  // collect the type definitions
  for (m <- this.models) {
    val v = Visitor.build {
      case o : ProcedureDecl =>
        proc :+= o
        false
      case o : RecordDecl =>
        assert(o ? URIS.TYPE_URI)
        assert(o ? URIS.TYPE_DEF)
        typeMap(o(URIS.TYPE_URI)) = o(URIS.TYPE_DEF)
        true
      case o : AttributeDecl =>
        assert(o ? URIS.REF_URI)
        assert(o ? URIS.TYPE_URI)
        
        // FIXME: type erasure
        typeMap(o(URIS.REF_URI)) = o(URIS.TYPE_URI).asInstanceOf[Type]
        false
      case o : TypeAliasDecl =>
        assert(o ? URIS.TYPE_DEF)
        assert(o ? URIS.TYPE_URI)
        typeMap(o(URIS.TYPE_URI)) = o(URIS.TYPE_DEF)
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
      assert(o ? URIS.TYPE_URI)

      val ouri : ResourceUri = o(URIS.TYPE_URI)
      assert(typeMap.contains(ouri))

      o(URIS.TYPE_DEF) = typeMap(ouri)
      true
    case o : AccessExp =>
      assert(o ? URIS.TYPE_URI)
      val auri : ResourceUri = o(URIS.TYPE_URI)

      assert(typeMap.contains(auri))

      o(URIS.TYPE_DEF) = typeMap(auri)

      true
    case o : Exp =>
      if (o ? URIS.TYPE_URI) {
        val auri : ResourceUri = o(URIS.TYPE_URI)
        assert(typeMap.contains(auri))
        o(URIS.TYPE_DEF) = typeMap(auri)
      }
      true
  }
  for (p <- proc) {
    v(p)
  }

  // build the refuri to typuri map for the type provider
  val refUri2typeUri = mmapEmpty[ResourceUri, ResourceUri]

  def addMapping(nuref : PilarAstNode, nutyp : PilarAstNode) {
    assert(nuref ? URIS.REF_URI)
    assert(nutyp ? URIS.REF_URI)
    val refUri : ResourceUri = nuref(URIS.REF_URI)
    val typUri : ResourceUri = nutyp(URIS.REF_URI)
    assert(!refUri2typeUri.contains(refUri))
    refUri2typeUri(refUri) = typUri
  }

  for (m <- this.models) {
    val v = Visitor.build {
      case o @ GlobalVarDecl(name, _, Some(NamedTypeSpec(nu, _))) =>
        addMapping(o, nu)
        false
      case o @ ParamDecl(Some(NamedTypeSpec(nu, _)), name, _) =>
        addMapping(o, nu)
        false
      case o @ LocalVarDecl(Some(NamedTypeSpec(nu, _)), name, _) =>
        addMapping(o, nu)
        false
      case GlobalVarDecl | ParamDecl | LocalVarDecl =>
        throw new RuntimeException("Not expecting ")

      case o @ NameExp(nu) =>
        import org.sireum.pilar.symbol.Symbol
        assert (o ? URIS.TYPE_URI)
        assert (nu.hasResourceInfo)
        false
    }
    v(m)
  }

  this.bakarRef2TypeUriMap = refUri2typeUri.toMap
}

case class BakarTypeResolver(
  title : String = "Bakar Type Resolver",

  @Input @Output models : ISeq[Model],

  @Output bakarRef2TypeUriMap : IMap[ResourceUri, ResourceUri])

object BakarTypeResolver {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarTypeResolver.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/typ"

    ModuleGenerator.run(opt)
  }
}