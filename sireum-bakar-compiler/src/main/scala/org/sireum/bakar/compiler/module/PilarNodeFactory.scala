package org.sireum.bakar.compiler.module

import org.sireum.util._
import org.sireum.pilar._
import org.sireum.pilar.ast._
import org.sireum.pilar.symbol._
import org.sireum.bakar.symbol.SparkTypeDecl

object PilarNodeFactory {

  def buildAssertAction(e: Exp, message: String) = {
    val _m = URIS.addTypeUri(LiteralExp(LiteralType.STRING, message, message), StandardURIs.stringURI)
    AssertAction(ivectorEmpty, e, Some(_m))
  }

  def buildBinaryExp(op : BinaryOp, lhs:Exp, rhs:Exp, typeUri:ResourceUri) : BinaryExp = {
    assert(URIS.isTypeUri(typeUri))
    URIS.addTypeUri(BinaryExp(op, lhs, rhs), typeUri)
  }
  
  def buildCallExp(methodName: String, methodUri: ResourceUri,
    typeUri: Option[ResourceUri], arg: Exp): CallExp = {
    val ne = buildNameExp(methodName, methodUri)
    buildCallExp(ne, typeUri, arg)
  }

  def buildCallExp(ne: NameExp, typeUri: Option[ResourceUri], arg: Exp): CallExp = {
    assert(ne.name ? Symbol.symbolPropKey)
    val ce = CallExp(ne, arg)
    if (typeUri.isDefined) {
      URIS.addTypeUri(ce, typeUri.get)
    }
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

  def buildLiteralExp(literalType: LiteralType, literal: Any, text: String,
    typeUri: ResourceUri) = {
    assert(URIS.isTypeUri(typeUri))
    URIS.addTypeUri(LiteralExp(literalType, literal, text), typeUri)
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

  def buildLocalTempVar(typeName: String, typeUri: ResourceUri, path: ISeq[String]): (LocalVarDecl, NameExp) = {
    val name = path(path.size - 1)
    val uri = VariableURIs.tempVarPrefix + path.mkString("/")

    val nts = buildNamedTypeSpec(typeName, typeUri)
    val lvd = buildLocalVar(name, uri, nts)

    val ret = buildNameExp(name, uri, Some(typeUri))
    (lvd, ret)
  }

  def buildLocationLabel(label: String, uri: ResourceUri): NameDefinition = {
    URIS.addResourceUri(NameDefinition(label), uri)
  }

  def buildNameExp(name: String, uri: ResourceUri): NameExp = buildNameExp(name, uri, None)

  def buildNameExp(name: String, uri: ResourceUri, typeUri: Option[ResourceUri]): NameExp = {
    val nu = URIS.addResourceUri(NameUser(name), uri)
    buildNameExp(nu, typeUri)
  }

  def buildNameExp(nu: NameUser, typeUri: Option[ResourceUri]): NameExp = {
    assert(nu ? Symbol.symbolPropKey)
    val ne = NameExp(nu)
    if (typeUri.isDefined) {
      assert(URIS.isTypeUri(typeUri.get))
      URIS.addTypeUri(ne, typeUri.get)
    }
    ne
  }

  def buildNamedTypeSpec(td: SparkTypeDecl): NamedTypeSpec =
    buildNamedTypeSpec(td.id, td.uri)

  def buildNamedTypeSpec(typeName: String, typeUri: ResourceUri): NamedTypeSpec = {
    assert(URIS.isTypeUri(typeUri))
    val nu = NameUser(typeName)
    URIS.addTypeUri(nu, typeUri)

    buildNamedTypeSpec(nu, typeUri)
  }

  def buildNamedTypeSpec(name: NameUser, typeUri: ResourceUri): NamedTypeSpec = {
    if(!(name ? URIS.TYPE_URI)){
      URIS.addTypeUri(name, typeUri)
    } else {
      assert(URIS.isTypeUri(URIS.getTypeUri(name)) && URIS.getTypeUri(name) == typeUri)
    }

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
  
  def buildTypeExp(typeName : String, typeUri : ResourceUri) : TypeExp = {
    val nu = URIS.addResourceUri(NameUser(typeName), typeUri)
    buildTypeExp(nu, typeUri)
  }
  
  def buildTypeExp(typeName : NameUser, typeUri : ResourceUri) : TypeExp = {
    assert(typeName ? Symbol.symbolPropKey)
    URIS.addTypeUri(typeName, typeUri)
    val ts = buildNamedTypeSpec(typeName, typeUri)
    URIS.addTypeUri(TypeExp(ts), typeUri)
  }
}