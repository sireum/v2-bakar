package org.sireum.bakar.compiler.module

import org.sireum.util._
import org.sireum.pilar.ast._
import org.sireum.pilar.symbol._

object PilarNodeBuilder {

  def buildNamedTypeSpec(typeName : String, typeUri : ResourceUri) = {
    assert(URIS.isTypeUri(typeUri))
    val nu = NameUser(typeName)
    URIS.addTypeUri(nu, typeUri)
    
    val nts = NamedTypeSpec(nu, ivectorEmpty)
    URIS.addTypeUri(nts, typeUri)
  }

  def buildLocalVar(varName : String, varUri : ResourceUri, nts : NamedTypeSpec) : LocalVarDecl = {
    val nd = URIS.addResourceUri(NameDefinition(varName), varUri)    
    LocalVarDecl(Some(nts), nd, ivectorEmpty)
  }

  def buildLocalVar(varND : NameDefinition, nts : NamedTypeSpec) : LocalVarDecl = {
    assert (varND ? Symbol.symbolPropKey)
    assert(nts ? URIS.TYPE_URI)
    assert(nts.name ? URIS.TYPE_URI)
    
    LocalVarDecl(Some(nts), varND, ivectorEmpty)
  }

  def buildGlobalVar(varName : String, varUri : ResourceUri, 
      parentUri : ResourceUri, nts : NamedTypeSpec) : GlobalVarDecl = {
    assert(nts ? URIS.TYPE_URI)
    assert(nts.name ? URIS.TYPE_URI)
    
    import org.sireum.bakar.symbol.BakarSymbol._
    val nd = URIS.addResourceUri(NameDefinition(varName), varUri)    
    val gvd = GlobalVarDecl(nd, ivectorEmpty, Some(nts))
    gvd.parentUri = parentUri
    gvd
  }
  
  def buildProcedureDecl(name : String, nameUri : ResourceUri, parentUri:ResourceUri,
      params : ISeq[ParamDecl], retType : Option[TypeSpec], body : Body) = {
    import org.sireum.bakar.symbol.BakarSymbol._    
    val nu = NameDefinition(name)
    URIS.addResourceUri(nu, nameUri)
    
    val pd = ProcedureDecl(nu, ivectorEmpty, ivectorEmpty, params, retType, false, body)
    pd.parentUri = parentUri
    pd
  }
}