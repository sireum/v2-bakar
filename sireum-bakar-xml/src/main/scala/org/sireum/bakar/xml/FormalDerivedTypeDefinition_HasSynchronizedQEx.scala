package org.sireum.bakar.xml

import org.sireum.util._

object FormalDerivedTypeDefinition_HasSynchronizedQEx {
  def unapply(o : org.sireum.bakar.xml.FormalDerivedTypeDefinition.HasSynchronizedQ) = {
    Some(
      o.getHasSynchronized()
    )
  }
}