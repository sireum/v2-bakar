package org.sireum.test.bakar.symbol

import java.io.Writer
import org.junit.runner.RunWith
import org.sireum.bakar.compiler.module.BakarTranslatorModule
import org.sireum.bakar.compiler.module.URIS
import org.sireum.bakar.compiler.rewriter.BakarExpRewriterModule
import org.sireum.bakar.symbol.BakarSymbolResolverModule
import org.sireum.bakar.symbol.BakarSymbolResolverModule.ConsumerView.BakarSymbolResolverModuleConsumerView
import org.sireum.bakar.typ.BakarTypeResolverModule
import org.sireum.bakar.xml.module.Gnat2XMLWrapperModule
import org.sireum.bakar.xml.module.ParseGnat2XMLModule
import org.sireum.pilar.ast.ImplementedBody
import org.sireum.pilar.ast.LocalVarDecl
import org.sireum.pilar.ast.Model
import org.sireum.pilar.ast.NameExp
import org.sireum.pilar.ast.NameUser
import org.sireum.pilar.ast.PackageDecl
import org.sireum.pilar.ast.ParamDecl
import org.sireum.pilar.ast.ProcedureDecl
import org.sireum.pilar.symbol.Symbol.pp2r
import org.sireum.pipeline.PipelineConfiguration
import org.sireum.pipeline.PipelineJob
import org.sireum.pipeline.PipelineStage
import org.sireum.test.bakar.compiler.BakarTranslatorTest
import org.sireum.util.ISeq
import org.sireum.util.ImplicitLogging
import org.sireum.util.Visitor
import org.scalatest.junit.JUnitRunner
import org.sireum.bakar.compiler.module.PackageURIs
import org.sireum.pilar.ast.AssertAction
import org.sireum.pilar.ast.AssumeAction
import org.sireum.pilar.ast.CallExp
import org.sireum.util.VisitorFunction

@RunWith(classOf[JUnitRunner])
class BakarSymbolResolverTest extends BakarTranslatorTest {
  override def generateExpected = false
  override def pipeline = BakarSymbolResolverTest.pipeline
  override def outputSuffix = BakarSymbolResolverTest.outputSuffix
  override def writeTestString(job: PipelineJob, w: Writer) = BakarSymbolResolverTest.writeTestString(job, w)

  override def post(c: Configuration) = BakarSymbolResolverTest.validate(c.job.models)
}

object BakarSymbolResolverTest extends ImplicitLogging {

  def pipeline =
    PipelineConfiguration(
      "gnat2xml test pipeline",
      false,
      PipelineStage(
        "gnat2xml stage",
        false,
        Gnat2XMLWrapperModule),
      PipelineStage(
        "scalaxb stage",
        false,
        ParseGnat2XMLModule),
      PipelineStage(
        "translator stage",
        false,
        BakarTranslatorModule),
      PipelineStage(
        "type resolver stage",
        false,
        BakarTypeResolverModule),        
      PipelineStage(
        "exp rewriter stage",
        false,
        BakarExpRewriterModule),
      PipelineStage(
        "type resolver stage",
        false,
        BakarTypeResolverModule),
      PipelineStage(
        "symbol resolver stage",
        false,
        BakarSymbolResolverModule))

  def outputSuffix = "symbolresolver"

  def writeTestString(job: PipelineJob, w: Writer) = {
    val st = job.symbolTable

    w.write("Spark Package Table\n")
    for ((k, vals) <- st.sparkPackageTable.toSeq.sortBy(_._1)) {
      w.write(s"  $k\n")
      if (vals.spec.isDefined) w.write(s"    SPEC: ${vals.spec.get.name.get.uri}\n")
      if (vals.body.isDefined) w.write(s"    BODY: ${vals.body.get.name.get.uri}\n")
    }
    w.write("\n")

    w.write("Const Table\n")
    for (k <- st.tables.constTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Const Element Table\n")
    for (k <- st.tables.constElementTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Enum Table\n")
    for (k <- st.tables.enumTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Enum Element Table\n")
    for (k <- st.tables.enumElementTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Global Var Table\n")
    for (k <- st.tables.globalVarTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Record Table\n")
    for (k <- st.tables.recordTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Attribute Table\n")
    for (k <- st.tables.attributeTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Type Alias Table\n")
    for (k <- st.tables.typeAliasTable.keys.toSeq.sortBy(f => f))
      w.write(s"  $k \n")
    w.write("\n")

    w.write("Procedure Table\n")
    for ((k, vals) <- st.tables.procedureTable.toSeq.sortBy(_._1)) {
      w.write(s"  $k \n")
      for (v <- vals.toSeq.sortBy(f => f)) {
        w.write(s"    $v \n")
      }
    }
    w.write("\n")

    w.write("Spark Method Table\n")
    for ((k, vals) <- st.sparkMethodTable.toSeq.sortBy(_._1)) {
      w.write(s"  $k \n")
      if (vals.spec.isDefined) w.write(s"    SPEC: ${vals.spec.get.name.uri} \n")
      if (vals.body.isDefined) w.write(s"    BODY: ${vals.body.get.name.uri} \n")
    }
    w.write("\n")

    w.write("Procedure Symbol Table\n")
    for (bst <- st.procedureSymbolTables.toSeq.sortBy(f => f.procedureUri)) {
      w.write(s"  ${bst.procedureUri} \n\n")

      w.write("    LocalVarTable\n")
      for (k <- bst.tables.localVarTable.keys.toSeq.sortBy(f => f))
        w.write(s"      $k \n")
      w.write("\n")

      w.write("    Params\n")
      for (k <- bst.tables.params.toSeq.sortBy(f => f))
        w.write(s"      $k \n")
      w.write("\n")

      w.write("    Loop Locations\n")
      for ((uri, label) <- bst.loopLocations)
        w.write(s"      $uri -> $label \n")
      w.write("\n")
    }
    w.write("\n")
  }

  def validate(models: ISeq[Model]): Boolean = {
    type BVisitor = Any => Boolean

    var currPackage: PackageDecl = null
    var currMethod: ProcedureDecl = null

    var inProof = false

    def impl(v: => BVisitor): VisitorFunction = {
      case i: PackageDecl =>
        currPackage = i
        true

      case i: ProcedureDecl =>
        currMethod = i

        assert(currPackage.elements.exists {
          case _i: ProcedureDecl => i.name.uri == _i.name.uri
          case _ => false
        })

        val pu = currPackage.name.get.uri
        val packUri = URIS.getPath(pu)
        val muri = URIS.getPath(i.name.uri)
        assert(muri.startsWith(packUri) || PackageURIs.isPackageAnonymous(pu))

        true

      case i: ParamDecl =>
        val mUri = URIS.getPath(currMethod.name.uri)
        val paramUri = URIS.getPath(i.name.uri)
        assert(paramUri.startsWith(mUri) || i.name.uri == URIS.DUMMY_URI)
        false

      case i: LocalVarDecl =>
        val mu = currMethod.name.uri
        val mUri = URIS.getPath(mu)
        val lUri = URIS.getPath(i.name.uri)
        assert(lUri.startsWith(mUri) || PackageURIs.isPackageInitProcedure(mu))

        false

      case NameExp(nu @ NameUser(x)) =>
        if (URIS.isParamUri(nu.uri)) {
          assert(currMethod.params.exists(p => p.name.uri == nu.uri) ||
            URIS.isAdaExpressionFunctionUri(currMethod.name.uri))
        }

        if (URIS.isLocalVarUri(nu.uri)) {
          val body = currMethod.body.asInstanceOf[ImplementedBody]
          assert(body.locals.exists(p => p.name.uri == nu.uri) ||
            (URIS.isLoopParamUri(nu.uri) && inProof))
        }

        if (URIS.isGlobalVarUri(nu.uri)) {

        }
        false
      case AssumeAction(_, CallExp(NameExp(nu), arg)) =>
        inProof = URIS.isUIFUri(nu.uri)
        v(arg)
        inProof = false
        false
      case AssertAction(_, CallExp(NameExp(nu), arg), _) =>
        inProof = URIS.isUIFUri(nu.uri)
        v(arg)
        inProof = false
        false
    }

    def theVisitor: BVisitor = b

    lazy val b = Visitor.build(impl(theVisitor))

    for (m <- models) b(m)

    true
  }
}