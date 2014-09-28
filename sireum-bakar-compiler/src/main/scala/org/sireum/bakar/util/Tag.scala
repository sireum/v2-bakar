package org.sireum.bakar.util

import org.sireum.util._
import org.sireum.util.Tag
import org.sireum.util.MarkerType
import org.sireum.util.MarkerTagSeverity
import org.sireum.util.MarkerTagPriority
import org.sireum.util.MarkerTagKind
import org.sireum.util.InfoTag

class UnexpectedError(msg : String, cause : Throwable)
    extends RuntimeException(msg, cause) {
  def this(msg : String) = this(msg, null)
  def this(cause : Throwable) = this(if (cause == null) null else cause.toString, cause)
  def this() = this(null, null)
}

object TagUtil {

  def genUnexpectedErrorTag(msg : String) : Tag = {
    InfoTag(MarkerType("ERROR", None, "Unexpected error",
      MarkerTagSeverity.Error, MarkerTagPriority.High,
      ilistEmpty[MarkerTagKind.Type]), Some(msg))    
  }
  
  def genUnexpectedErrorTag(e : Throwable) : Tag = {
    import scala.collection.JavaConversions._

    val message = if (e.isInstanceOf[UnexpectedError]) {
      val re = e.asInstanceOf[UnexpectedError]
      re.getMessage + "\n\n" + e.getStackTrace.toList.mkString("\n")
    } else
      e.getMessage + "\n\n" + e.getStackTrace.toList.mkString("\n")

    genUnexpectedErrorTag(message)
  }
}