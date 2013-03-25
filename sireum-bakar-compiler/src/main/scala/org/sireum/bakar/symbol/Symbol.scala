package org.sireum.bakar.symbol

import org.sireum.util._
import org.sireum.pilar.ast._

trait Type

trait SparkType extends Type {
  val id : String
}

/**
 * **************************************************************************
 * Constraint classes
 * **************************************************************************
 */

trait Constraint extends Type

case class IndexConstraint(
  val subTypes : ISeq[SparkTypeDecl]) extends Constraint

trait RangeConstraint extends Constraint

case class RangeAttributeReferenceConstraint extends RangeConstraint

case class SimpleRangeConstraint(
  val lower : Exp,
  val upper : Exp) extends RangeConstraint

/**
 * **************************************************************************
 * Type Declarations
 * **************************************************************************
 */

trait SparkTypeDecl extends SparkType {
  val uri : String
}

case class SubTypeDecl(
  val id : String,
  val uri : String,
  val parentUri : String,
  val cons : Option[Constraint]) extends SparkTypeDecl

trait TypeDecl extends SparkTypeDecl

case class FullTypeDecl(
  val id : String,
  val uri : String,
  val typeDef : TypeDef) extends TypeDecl

case class PrivateExtensionDecl(
  val id : String,
  val uri : String) extends TypeDecl

case class PrivateTypeDecl(
  val id : String,
  val uri : String,
  val isTagged : Boolean,
  val isLimited : Boolean,
  val fullDeclartionDefinition : TypeDef) extends TypeDecl

/**
 * **************************************************************************
 * Type Definitions
 * **************************************************************************
 */

trait TypeDef extends SparkType

case class AbstractTypeDef(
  val id : String) extends SparkType

trait CompositeTypeDef extends TypeDef

trait ArrayTypeDef extends CompositeTypeDef {
  val dim : Int
  val componentSubtype : ResourceUri
}

case class ConstrainedArrayDef(
  val id : String,
  val dim : Int,
  val componentSubtype : ResourceUri,
  val discreteSubtypes : ISeq[ResourceUri]) extends ArrayTypeDef

case class UnconstrainedArrayDef(
  val id : String,
  val dim : Int,
  val componentSubtype : ResourceUri,
  val indexSubtypes : ISeq[SparkTypeDecl]) extends ArrayTypeDef

trait RecordDef extends CompositeTypeDef {
  val isTagged : Boolean
}

case class NullRecordTypeDef(
  val id : String,
  val isTagged : Boolean) extends RecordDef

case class ComponentDef(
  val refUri : ResourceUri,
  val typeName : String,
  val typeUri : ResourceUri,
  val loc : Location)

case class RecordTypeDef(
  val id : String,
  val isTagged : Boolean,
  val components : IMap[String, ComponentDef]) extends RecordDef

trait ScalarTypeDef extends TypeDef

trait DiscreteTypeDef extends ScalarTypeDef

case class EnumerationTypeDef(
  val id : String,
  val elems : ISeq[String]) extends DiscreteTypeDef

trait IntegerTypeDef extends ScalarTypeDef

case class ModularTypeDef(
  val id : String,
  val modExp : Exp) extends IntegerTypeDef

case class SignedIntegerTypeDef(
  val id : String,
  val lowRangeExp : Exp,
  val highRangeExp : Exp) extends IntegerTypeDef

trait RealTypeDef extends ScalarTypeDef

// TODO : finish this