package org.sireum.bakar.symbol

import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.util.ISet
import org.sireum.util.ResourceUri

object BakarSymbol {

  val INFO_PARAM = "BAKAR_PARAM_INFO"
  val INFO_PROCEDURE = "BAKAR_PROCEDURE_INFO"

  implicit def pd2pi(p : ParamDecl) : ParamInfo = {
    p.getPropertyOrElse(INFO_PARAM, {
      val pi = new ParamInfo {
        private var _paramMode : Mode = null
        def mode = _paramMode
        def mode(m : String) {
          this._paramMode = m match {
            case "AN_IN_MODE" | "A_DEFAULT_IN_MODE" => Mode.IN
            case "AN_OUT_MODE"                      => Mode.OUT
            case "AN_IN_OUT_MODE"                   => Mode.IN_OUT
          }
        }
      }
      p(INFO_PARAM) = pi
      pi
    })
  }

  implicit def proc2procInfo(p : ProcedureDecl) : ProcedureInfo = {
    p.getPropertyOrElse(INFO_PROCEDURE, {
      val pi = new ProcedureInfo {
        private var _globalsin : Option[ISet[ResourceUri]] = None
        private var _globalsout : Option[ISet[ResourceUri]] = None
        private var _globalsproof : Option[ISet[ResourceUri]] = None

        def globalsIn = _globalsin
        def globalsOut = _globalsout
        def globalsProof = _globalsproof

        def globalsIn(o : ISet[ResourceUri]) = _globalsin = Some(o)
        def globalsOut(o : ISet[ResourceUri]) = _globalsout = Some(o)
        def globalsProof(o : ISet[ResourceUri]) = _globalsproof = Some(o)
      }
      p(INFO_PROCEDURE) = pi
      pi
    })
  }

  trait ParamInfo {
    def mode : Mode
    def mode(m : String)
  }

  trait ProcedureInfo {
    def globalsIn : Option[ISet[ResourceUri]]
    def globalsIn(o : ISet[ResourceUri])

    def globalsOut : Option[ISet[ResourceUri]]
    def globalsOut(o : ISet[ResourceUri])

    def globalsProof : Option[ISet[ResourceUri]]
    def globalsProof(o : ISet[ResourceUri])
  }
}