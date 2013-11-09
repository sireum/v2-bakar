package org.sireum.bakar.symbol

import org.sireum.pilar.ast.Exp
import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.util.IMap
import org.sireum.util.ISet
import org.sireum.util.ResourceUri

object BakarSymbol {

  val INFO_PARAM = "BAKAR_PARAM_INFO"
  val INFO_PROCEDURE = "BAKAR_PROCEDURE_INFO"

  implicit def pd2pi(p : ParamDecl) : ParamInfo =
    p.getPropertyOrElseUpdate(INFO_PARAM,
      new ParamInfo {
        private var _paramMode : Mode = null
        def mode = _paramMode
        def mode(m : String) {
          this._paramMode = m match {
            case "AN_IN_MODE" | "A_DEFAULT_IN_MODE" => Mode.IN
            case "AN_OUT_MODE"                      => Mode.OUT
            case "AN_IN_OUT_MODE"                   => Mode.IN_OUT
          }
        }
      })

  implicit def proc2procInfo(p : ProcedureDecl) : ProcedureInfo =
    p.getPropertyOrElseUpdate(INFO_PROCEDURE,
      new ProcedureInfo {
        private var _depends : IMap[ResourceUri, ISet[ResourceUri]] = null
        private var _globalsin : ISet[ResourceUri] = null
        private var _globalsout : ISet[ResourceUri] = null
        private var _globalsproof : ISet[ResourceUri] = null
        private var _pre : Exp = null
        private var _post : Exp = null

        def wrap[T](t : T) = if (t == null) None else Some(t)

        def depends = wrap(_depends)
        def depends(o : IMap[ResourceUri, ISet[ResourceUri]]) = _depends = o

        def globalsIn = wrap(_globalsin)
        def globalsIn(o : ISet[ResourceUri]) = _globalsin = o
        
        def globalsOut = wrap(_globalsout)
        def globalsOut(o : ISet[ResourceUri]) = _globalsout = o
        
        def globalsProof = wrap(_globalsproof)
        def globalsProof(o : ISet[ResourceUri]) = _globalsproof = o

        def pre = wrap(_pre)
        def pre(o : Exp) = _pre = o
        
        def post = wrap(_post)
        def post(o : Exp) = _post = o
      })

  trait ParamInfo {
    def mode : Mode
    def mode(m : String)
  }

  trait ProcedureInfo {
    def depends : Option[IMap[ResourceUri, ISet[ResourceUri]]]
    def depends(o : IMap[ResourceUri, ISet[ResourceUri]])

    def globalsIn : Option[ISet[ResourceUri]]
    def globalsIn(o : ISet[ResourceUri])

    def globalsOut : Option[ISet[ResourceUri]]
    def globalsOut(o : ISet[ResourceUri])

    def globalsProof : Option[ISet[ResourceUri]]
    def globalsProof(o : ISet[ResourceUri])

    def pre : Option[Exp]
    def pre(o : Exp)

    def post : Option[Exp]
    def post(o : Exp)
  }
}