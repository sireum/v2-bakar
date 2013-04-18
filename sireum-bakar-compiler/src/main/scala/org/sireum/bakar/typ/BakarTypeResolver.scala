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
        typeMap(o(URIS.REF_URI)) = o(URIS.TYPE_URI)
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
      assert(o.exp.isInstanceOf[NameExp])
      assert(o ? URIS.TYPE_URI)
      val ouri : ResourceUri = o(URIS.TYPE_URI)
      assert(typeMap.contains(ouri))

      o(URIS.TYPE_DEF) = typeMap(ouri)
      false
    case o : AccessExp =>
      assert(o.exp.isInstanceOf[NameExp])
      assert(o.attributeName ? URIS.TYPE_URI)

      val auri : ResourceUri = o.attributeName(URIS.TYPE_URI)

      assert(typeMap.contains(auri))

      o(URIS.TYPE_DEF) = typeMap(auri)

      false
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
  for (m <- this.models) {
    val v = Visitor.build {
      case o @ GlobalVarDecl(name, _, Some(NamedTypeSpec(nu, _))) =>
        assert (nu ? URIS.REF_URI)
        assert (o ? URIS.REF_URI)
        val typUri : ResourceUri = nu(URIS.REF_URI)
        val refUri : ResourceUri = o(URIS.REF_URI)
        refUri2typeUri(refUri) = typUri
        false
      case o @ ParamDecl(Some(NamedTypeSpec(nu, _)), name, _) =>
        assert (nu ? URIS.REF_URI)
        assert (o ? URIS.REF_URI)
        val typUri : ResourceUri = nu(URIS.REF_URI)
        val refUri : ResourceUri = o(URIS.REF_URI)
        refUri2typeUri(refUri) = typUri
        false
      case o @ LocalVarDecl(Some(NamedTypeSpec(nu, _)), name, _) =>
        assert (o ? URIS.REF_URI)
        assert (nu ? URIS.REF_URI)
        val refUri : ResourceUri = o(URIS.REF_URI)
        val typUri : ResourceUri = nu(URIS.REF_URI)
        refUri2typeUri(refUri) = typUri
        false
      case GlobalVarDecl | ParamDecl | LocalVarDecl =>
        throw new RuntimeException("Not expecting ")
    }
    v(m)
  }
  
  this.bakarRef2TypeUriMap = refUri2typeUri.toMap
}

case class BakarTypeResolver(
  title : String = "Bakar Type Resolver",

  @Input 
  @Output 
  models : ISeq[Model],
  
  @Output
  bakarRef2TypeUriMap : IMap[ResourceUri, ResourceUri]
  )

object BakarTypeResolver {
  def main(args : Array[String]) {
    val opt = PipelineMode()
    opt.classNames = Array(BakarTypeResolver.getClass.getName.dropRight(1))
    opt.dir = "./src/main/scala/org/sireum/bakar/typ"

    ModuleGenerator.run(opt)
  }
}