package org.sireum.bakar.xml

import org.sireum.util._

object SynchronizedEx {
  def unapply(o : org.sireum.bakar.xml.Synchronized) = {
    Some(
      o.getSloc(),
      o.getChecks()
    )
  }
}