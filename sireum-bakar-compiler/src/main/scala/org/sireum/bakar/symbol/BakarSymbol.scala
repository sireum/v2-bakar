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
import org.sireum.pilar.ast.GlobalVarDecl

object BakarSymbol {

  val INFO_GLOBAL = "BAKAR_GLOBAL_INFO"
  val INFO_PARAM = "BAKAR_PARAM_INFO"
  val INFO_PROCEDURE = "BAKAR_PROCEDURE_INFO"
  val INFO_PACKAGE = "BAKAR_PACKAGE_INFO"

  implicit def gd2gi(p: GlobalVarDecl): GlobalInfo =
    p.getPropertyOrElseUpdate(INFO_GLOBAL,
      new GlobalInfo {
        private var _parentUri: ResourceUri = null

        def parentUri = _parentUri
        def parentUri_=(o: ResourceUri) = _parentUri = o
      })

  trait GlobalInfo {
    def parentUri: ResourceUri
    def parentUri_=(o: ResourceUri)
  }

  implicit def pd2pi(p: ParamDecl): ParamInfo =
    p.getPropertyOrElseUpdate(INFO_PARAM,
      new ParamInfo {
        private var _paramMode: Mode = null
        def mode = _paramMode
        def mode_=(m: String) {
          this._paramMode = m match {
            case "AN_IN_MODE" | "A_DEFAULT_IN_MODE" => Mode.IN
            case "AN_OUT_MODE" => Mode.OUT
            case "AN_IN_OUT_MODE" => Mode.IN_OUT
          }
        }
      })

  trait ParamInfo {
    def mode: Mode
    def mode_=(m: String)
  }

  implicit def proc2procInfo(p: ProcedureDecl): ProcedureInfo =
    p.getPropertyOrElseUpdate(INFO_PROCEDURE,
      new ProcedureInfo {
        private var _contractCases: ISeq[Exp] = null
        private var _depends: IMap[ResourceUri, ISet[ResourceUri]] = null
        private var _globalsin: ISet[ResourceUri] = null
        private var _globalsout: ISet[ResourceUri] = null
        private var _globalsproof: ISet[ResourceUri] = null
        private var _isGhostFunction: java.lang.Boolean = null
        private var _parentUri: ResourceUri = null
        private var _pre: Exp = null
        private var _post: Exp = null
        private var _testCases: ISeq[TestCase] = null

        implicit def wrap[T](t: T) = if (t == null) None else Some(t)

        def contractCases = _contractCases
        def contractCases_=(o: ISeq[Exp]) = _contractCases = o

        def depends = _depends
        def depends_=(o: IMap[ResourceUri, ISet[ResourceUri]]) = _depends = o

        def globalsIn = _globalsin
        def globalsIn_=(o: ISet[ResourceUri]) = _globalsin = o

        def globalsOut = _globalsout
        def globalsOut_=(o: ISet[ResourceUri]) = _globalsout = o

        def globalsProof = _globalsproof
        def globalsProof_=(o: ISet[ResourceUri]) = _globalsproof = o

        def isGhostFunction = wrap(_isGhostFunction)
        def isGhostFunction_=(o: Boolean) = _isGhostFunction = o

        def parentUri = _parentUri
        def parentUri_=(o: ResourceUri) = _parentUri = o

        def pre = _pre
        def pre_=(o: Exp) = _pre = o

        def post = _post
        def post_=(o: Exp) = _post = o

        def testCases = _testCases
        def testCases_=(o: ISeq[TestCase]) = _testCases = o
      })

  trait ProcedureInfo {
    def contractCases: Option[ISeq[Exp]]
    def contractCases_=(o: ISeq[Exp])

    def depends: Option[IMap[ResourceUri, ISet[ResourceUri]]]
    def depends_=(o: IMap[ResourceUri, ISet[ResourceUri]])

    def globalsIn: Option[ISet[ResourceUri]]
    def globalsIn_=(o: ISet[ResourceUri])

    def globalsOut: Option[ISet[ResourceUri]]
    def globalsOut_=(o: ISet[ResourceUri])

    def globalsProof: Option[ISet[ResourceUri]]
    def globalsProof_=(o: ISet[ResourceUri])

    def isGhostFunction: Option[Boolean]
    def isGhostFunction_=(o: Boolean)

    def parentUri: Option[ResourceUri]
    def parentUri_=(o: ResourceUri)

    def pre: Option[Exp]
    def pre_=(o: Exp)

    def post: Option[Exp]
    def post_=(o: Exp)

    def testCases: Option[ISeq[TestCase]]
    def testCases_=(o: ISeq[TestCase])
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
        def sparkMode_=(o: Boolean) = _sparkMode = o

        def useClauses = _useClauses
        def useClauses_=(o: ISeq[NameExp]) = _useClauses = o

        def useTypeClauses = _useTypeClauses
        def useTypeClauses_=(o: ISeq[NameExp]) = _useTypeClauses = o

        def withClauses = _withClauses
        def withClauses_=(o: ISeq[NameExp]) = _withClauses = o
      })

  trait PackageInfo {
    def sparkMode: Option[Boolean]
    def sparkMode_=(o: Boolean)

    def useClauses: Option[ISeq[NameExp]]
    def useClauses_=(o: ISeq[NameExp])

    def useTypeClauses: Option[ISeq[NameExp]]
    def useTypeClauses_=(o: ISeq[NameExp])

    def withClauses: Option[ISeq[NameExp]]
    def withClauses_=(o: ISeq[NameExp])
  }
}
