package org.sireum.bakar.symbol

import org.sireum.pilar.ast.Exp
import org.sireum.pilar.ast.NameExp
import org.sireum.pilar.ast.PackageDecl
import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.util.IMap
import org.sireum.util.ISeq
import org.sireum.util.ISet
import org.sireum.util.ResourceUri
import org.sireum.util.ivector

object BakarSymbol {

  val INFO_PARAM = "BAKAR_PARAM_INFO"
  val INFO_PROCEDURE = "BAKAR_PROCEDURE_INFO"
  val INFO_PACKAGE = "BAKAR_PACKAGE_INFO"

  implicit def pd2pi(p: ParamDecl): ParamInfo =
    p.getPropertyOrElseUpdate(INFO_PARAM,
      new ParamInfo {
        private var _paramMode: Mode = null
        def mode = _paramMode
        def mode(m: String) {
          this._paramMode = m match {
            case "AN_IN_MODE" | "A_DEFAULT_IN_MODE" => Mode.IN
            case "AN_OUT_MODE" => Mode.OUT
            case "AN_IN_OUT_MODE" => Mode.IN_OUT
          }
        }
      })

  implicit def proc2procInfo(p: ProcedureDecl): ProcedureInfo =
    p.getPropertyOrElseUpdate(INFO_PROCEDURE,
      new ProcedureInfo {
        private var _contractCases: ISeq[Exp] = null
        private var _depends: IMap[ResourceUri, ISet[ResourceUri]] = null
        private var _globalsin: ISet[ResourceUri] = null
        private var _globalsout: ISet[ResourceUri] = null
        private var _globalsproof: ISet[ResourceUri] = null
        private var _isGhostFunction: java.lang.Boolean  = null
        private var _parentUri: ResourceUri = null
        private var _pre: Exp = null
        private var _post: Exp = null
        private var _testCases: ISeq[TestCase] = null

        implicit def wrap[T](t: T) = if (t == null) None else Some(t)

        def contractCases = _contractCases
        def contractCases(o: ISeq[Exp]) = _contractCases = o

        def depends = _depends
        def depends(o: IMap[ResourceUri, ISet[ResourceUri]]) = _depends = o

        def globalsIn = _globalsin
        def globalsIn(o: ISet[ResourceUri]) = _globalsin = o

        def globalsOut = _globalsout
        def globalsOut(o: ISet[ResourceUri]) = _globalsout = o

        def globalsProof = _globalsproof
        def globalsProof(o: ISet[ResourceUri]) = _globalsproof = o

        def isGhostFunction = wrap(_isGhostFunction)
        def isGhostFunction(o: Boolean) = _isGhostFunction = o

        def parentUri = _parentUri
        def parentUri(o: ResourceUri) = _parentUri = o
        
        def pre = _pre
        def pre(o: Exp) = _pre = o

        def post = _post
        def post(o: Exp) = _post = o

        def testCases = _testCases
        def testCases(o: ISeq[TestCase]) = _testCases = o
      })

  trait ParamInfo {
    def mode: Mode
    def mode(m: String)
  }

  trait ProcedureInfo {
    def contractCases: Option[ISeq[Exp]]
    def contractCases(o: ISeq[Exp])

    def depends: Option[IMap[ResourceUri, ISet[ResourceUri]]]
    def depends(o: IMap[ResourceUri, ISet[ResourceUri]])

    def globalsIn: Option[ISet[ResourceUri]]
    def globalsIn(o: ISet[ResourceUri])

    def globalsOut: Option[ISet[ResourceUri]]
    def globalsOut(o: ISet[ResourceUri])

    def globalsProof: Option[ISet[ResourceUri]]
    def globalsProof(o: ISet[ResourceUri])

    def isGhostFunction: Option[Boolean]
    def isGhostFunction(o: Boolean)

    def parentUri: Option[ResourceUri]
    def parentUri(o: ResourceUri)
    
    def pre: Option[Exp]
    def pre(o: Exp)

    def post: Option[Exp]
    def post(o: Exp)

    def testCases: Option[ISeq[TestCase]]
    def testCases(o: ISeq[TestCase])
  }

  case class TestCase(
    val name: String,
    val mode: TestCaseMode,
    val requires: Option[Exp],
    val ensures: Option[Exp])

  implicit def pack2packInfo(p: PackageDecl): PackageInfo =
    p.getPropertyOrElseUpdate(INFO_PACKAGE,
      new PackageInfo {
        private var _sparkMode: java.lang.Boolean = null
        private var _useClauses: ISeq[NameExp] = null
        private var _useTypeClauses: ISeq[NameExp] = null        
        private var _withClauses: ISeq[NameExp] = null

        implicit def wrap[T](t: T) = if (t == null) None else Some(t)

        def sparkMode = wrap(_sparkMode)
        def sparkMode(o: Boolean) = _sparkMode = o
        
        def useClauses = _useClauses
        def useClauses(o: ISeq[NameExp]) = _useClauses = o

        def useTypeClauses = _useTypeClauses
        def useTypeClauses(o: ISeq[NameExp]) = _useTypeClauses = o
        
        def withClauses = _withClauses
        def withClauses(o: ISeq[NameExp]) = _withClauses = o
      })

  trait PackageInfo {
    def sparkMode: Option[Boolean]
    def sparkMode(o: Boolean)
    
    def useClauses: Option[ISeq[NameExp]]
    def useClauses(o: ISeq[NameExp])

    def useTypeClauses: Option[ISeq[NameExp]]
    def useTypeClauses(o: ISeq[NameExp])

    def withClauses: Option[ISeq[NameExp]]
    def withClauses(o: ISeq[NameExp])
  }
}
