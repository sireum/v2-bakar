package org.sireum.bakar.xml

import org.sireum.util._

object DefiniteAttributeEx {
  def unapply(o : org.sireum.bakar.xml.DefiniteAttribute) = {
    Some(
      o.getSloc(),
      o.getPrefixQ(),
      o.getAttributeDesignatorIdentifierQ(),
      o.getType(),
      o.getChecks()
    )
  }
}