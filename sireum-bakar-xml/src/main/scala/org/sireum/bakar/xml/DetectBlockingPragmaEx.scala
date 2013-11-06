package org.sireum.bakar.xml

import org.sireum.util._

object DetectBlockingPragmaEx {
  def unapply(o : org.sireum.bakar.xml.DetectBlockingPragma) = {
    Some(
      o.getSloc(),
      o.getPragmaArgumentAssociationsQl(),
      o.getPragmaName(),
      o.getChecks()
    )
  }
}