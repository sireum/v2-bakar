package org.sireum.bakar.symbol

import org.sireum.pilar.ast.ParamDecl

object BakarSymbol {

  val PARAM_INFO = "BAKAR_PARAM_INFO"

  implicit def pd2pi(p : ParamDecl) : ParamInfo = {
    p.getPropertyOrElse(PARAM_INFO, {
      val pi = new ParamInfo {
        var _paramMode : Mode = null
        def mode = _paramMode
        def mode(m : String) {
          this._paramMode = m match {
            case "AN_IN_MODE" | "A_DEFAULT_IN_MODE" => Mode.IN
            case "AN_OUT_MODE"                      => Mode.OUT
            case "AN_IN_OUT_MODE"                   => Mode.IN_OUT
          }
        }
      }
      p(PARAM_INFO) = pi
      pi
    })
  }

  trait ParamInfo {
    def mode : Mode
    def mode(m : String)
  }
}