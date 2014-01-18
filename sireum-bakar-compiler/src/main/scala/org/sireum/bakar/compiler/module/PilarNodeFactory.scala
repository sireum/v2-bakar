package org.sireum.bakar.compiler.module

import org.sireum.util._
import org.sireum.pilar.ast._
import org.sireum.pilar.symbol._
import org.sireum.bakar.symbol.SparkTypeDecl

object PilarNodeFactory {

  def buildCallExp(methodName: String, methodUri: ResourceUri, typeUri: ResourceUri, arg: Exp): CallExp = {
    val nu = URIS.addResourceUri(NameUser(methodName), methodUri)
    val ne = NameExp(nu)
    buildCallExp(ne, typeUri, arg)
  }

  def buildCallExp(ne: NameExp, typeUri: ResourceUri, arg: Exp): CallExp = {
    assert(ne.name ? Symbol.symbolPropKey)
    val ce = CallExp(ne, arg)
    if (typeUri != "null") URIS.addTypeUri(ce, typeUri)
    ce
  }

  def buildCallExp(te: TypeExp, typeUri: ResourceUri, arg: Exp): CallExp = {
    val ce = CallExp(te, arg)
    if (typeUri != "null") {
      URIS.addTypeUri(ce, typeUri)
      URIS.addTypeUri(te, typeUri)
    }
    ce
  }

  def buildGlobalVar(varName: String, varUri: ResourceUri,
    parentUri: ResourceUri, nts: NamedTypeSpec): GlobalVarDecl = {
    assert(nts ? URIS.TYPE_URI)
    assert(nts.name ? URIS.TYPE_URI)

    import org.sireum.bakar.symbol.BakarSymbol._
    val nd = URIS.addResourceUri(NameDefinition(varName), varUri)
    val gvd = GlobalVarDecl(nd, ivectorEmpty, Some(nts))
    gvd.parentUri = parentUri
    gvd
  }

  def buildLocalVar(varName: String, varUri: ResourceUri, ts: TypeSpec): LocalVarDecl = {
    val nd = URIS.addResourceUri(NameDefinition(varName), varUri)
    buildLocalVar(nd, ts)
  }

  def buildLocalVar(varND: NameDefinition, ts: TypeSpec): LocalVarDecl = {
    assert(varND ? Symbol.symbolPropKey)
    assert(ts ? URIS.TYPE_URI)
    assert(ts.asInstanceOf[NamedTypeSpec].name ? URIS.TYPE_URI)

    LocalVarDecl(Some(ts), varND, ivectorEmpty)
  }

  def buildLocalTempVar(typeName : String, typeUri : String, path : ISeq[String]) : (LocalVarDecl, NameExp) = {
    val name = path(path.size - 1)
    val uri = VariableURIs.tempVarPrefix + path.mkString("/")

    val nts = buildNamedTypeSpec(typeName, typeUri)
    val lvd = buildLocalVar(name, uri, nts)

    val ret = NameExp(URIS.addResourceUri(NameUser(name), uri))
    URIS.addTypeUri(ret, typeUri)
    (lvd, ret)    
  }

  def buildLocationLabel (label : String, uri:ResourceUri) : NameDefinition = {
    URIS.addResourceUri(NameDefinition(label), uri)
  }
  
  def buildNamedTypeSpec(td : SparkTypeDecl) : NamedTypeSpec = 
    buildNamedTypeSpec(td.id, td.uri)
  
  def buildNamedTypeSpec(typeName: String, typeUri: ResourceUri) : NamedTypeSpec = {
    assert(URIS.isTypeUri(typeUri))
    val nu = NameUser(typeName)
    URIS.addTypeUri(nu, typeUri)

    buildNamedTypeSpec(nu, typeUri)
  }

  def buildNamedTypeSpec(name : NameUser, typeUri: ResourceUri) : NamedTypeSpec = {
    assert(URIS.isTypeUri(URIS.getTypeUri(name)))
    
    val nts = NamedTypeSpec(name, ivectorEmpty)
    URIS.addTypeUri(nts, typeUri)
  }
    
  def buildParamDecl(paramName: String, paramUri: ResourceUri, ts: TypeSpec): ParamDecl = {
    val nd = URIS.addResourceUri(NameDefinition(paramName), paramUri)
    buildParamDecl(nd, ts)
  }

  def buildParamDecl(paramND: NameDefinition, ts: TypeSpec): ParamDecl = {
    assert(paramND ? Symbol.symbolPropKey)
    assert(ts ? URIS.TYPE_URI)
    assert(ts.asInstanceOf[NamedTypeSpec].name ? URIS.TYPE_URI)

    ParamDecl(Some(ts), paramND, ivectorEmpty)
  }

  def buildProcedureDecl(name: String, nameUri: ResourceUri, parentUri: ResourceUri,
    params: ISeq[ParamDecl], retType: Option[TypeSpec], body: Body): ProcedureDecl = {
    val nu = NameDefinition(name)
    URIS.addResourceUri(nu, nameUri)

    buildProcedureDecl(nu, parentUri, params, retType, body)
  }

  def buildProcedureDecl(name: NameDefinition, parentUri: ResourceUri,
    params: ISeq[ParamDecl], retType: Option[TypeSpec], body: Body): ProcedureDecl = {
    import org.sireum.bakar.symbol.BakarSymbol._
    assert(name ? Symbol.symbolPropKey)
    val pd = ProcedureDecl(name, ivectorEmpty, ivectorEmpty, params, retType, false, body)
    pd.parentUri = parentUri
    pd
  }
}