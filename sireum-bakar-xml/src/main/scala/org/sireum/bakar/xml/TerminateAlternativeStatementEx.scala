package org.sireum.bakar.xml

import org.sireum.util._

object TerminateAlternativeStatementEx {
  def unapply(o : org.sireum.bakar.xml.TerminateAlternativeStatement) = {
    Some(
      o.getSloc()
    )
  }
}