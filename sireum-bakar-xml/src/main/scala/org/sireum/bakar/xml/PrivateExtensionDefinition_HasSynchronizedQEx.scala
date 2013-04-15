package org.sireum.bakar.xml

import org.sireum.util._

object PrivateExtensionDefinition_HasSynchronizedQEx {
  def unapply(o : org.sireum.bakar.xml.PrivateExtensionDefinition.HasSynchronizedQ) = {
    Some(
      o.getHasSynchronized()
    )
  }
}