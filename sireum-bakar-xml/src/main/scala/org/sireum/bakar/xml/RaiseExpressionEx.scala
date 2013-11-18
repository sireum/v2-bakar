package org.sireum.bakar.xml

import org.sireum.util._

object RaiseExpressionEx {
  def unapply(o : org.sireum.bakar.xml.RaiseExpression) = {
    Some(
      o.getSloc(),
      o.getRaisedExceptionQ(),
      o.getAssociatedMessageQ(),
      o.getType(),
      o.getChecks()
    )
  }
}