package org.sireum.bakar.symbol

import org.sireum.util.ResourceUri

object SymbolUtil {

  def getTypeDef(t : Type, m : Map[ResourceUri, Type]) : TypeDef = {
    t match {
      case e : FullTypeDecl    => e.typeDef
      case e : SubTypeDecl     => getTypeDef(m(e.parentUri), m)
      case e : PrivateTypeDecl => e.fullDeclartionDefinition
      case td : TypeDef        => td
    }
  }

  def isComposite(uri : ResourceUri, m : Map[ResourceUri, Type]) : Boolean = {
    if (!m.contains(uri)) return false
    getTypeDef(m(uri), m) match {
      case e : CompositeTypeDef => true
      case _                => false
    }
  }
  
  def isScalar(uri : ResourceUri, m : Map[ResourceUri, Type]) : Boolean = {
    if (!m.contains(uri)) return false
    getTypeDef(m(uri), m) match {
      case e : ScalarTypeDef => true
      case _                => false
    }
  }
}