package org.sireum.bakar.compiler.rewriter

import org.sireum.pilar.ast._
import org.sireum.util._
import org.sireum.bakar.compiler.module.URIS

object RewriteUtil {
  
  val SCHEME = "ada"
  val TEMP_VAR_TYPE = "variable_temp"
    
  def createTempVar(typeName : String, typeUri : String, path : ISeq[String]) : (LocalVarDecl, NameExp)= {
    import org.sireum.pilar.symbol.Symbol

    val name = path(path.size - 1)
    val uri = SCHEME + "://" + TEMP_VAR_TYPE + "/" + path.mkString("/")

    val nts = Some(NamedTypeSpec(URIS.addResourceUri(NameUser(typeName), typeUri), ilistEmpty[TypeSpec]))
    val lname = URIS.addResourceUri(NameDefinition(name), uri)
    val lvd = LocalVarDecl(nts, lname, ilistEmpty[Annotation])

    val ret = NameExp(URIS.addResourceUri(NameUser(name), uri))
    ret(URIS.TYPE_URI) = typeUri
    (lvd, ret)
  }
  
  def createLocationLabel(name : String) : NameDefinition = {
    import org.sireum.pilar.symbol.Symbol
    import java.net.URI

    val ret = NameDefinition(name)
    val uri = new URI(name)
    ret.uri(uri.getScheme, uri.getAuthority, uri.getPath().split("/").toList, name)
    
    ret
  }
}