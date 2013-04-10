package org.sireum.bakar.symbol

import org.sireum.pilar.eval.SymbolProvider
import org.sireum.util.ResourceUri
import org.sireum.pilar.ast._
import org.sireum.pilar.symbol.SymbolTable
import org.sireum.pilar.symbol.ProcedureSymbolTable
import org.sireum.util._
import org.sireum.pilar.symbol.SymbolTableData
import org.sireum.pilar.symbol.ProcedureSymbolTableData
import org.sireum.pilar.symbol.BodySymbolTableData
import org.sireum.bakar.compiler.module.URIS
import org.sireum.pilar.symbol.SymbolTableProducer
import org.sireum.pilar.symbol.ProcedureSymbolTableProducer
import org.sireum.core.module.PilarSymbolResolverModuleDef
import org.sireum.pilar.symbol.H
import org.sireum.pilar.state.State
import org.sireum.pilar.state.Value
import org.sireum.pilar.pretty.NodePrettyPrinter

object BakarSymbolTable {
  def apply(models : ISeq[Model],
            stpConstructor : Unit => SymbolTableProducer,
            parallel : Boolean) =
    buildSymbolTable(models, stpConstructor, parallel)

  implicit def getUri(p : PilarAstNode) = {
    assert(p ? URIS.REF_URI)
    p(URIS.REF_URI).asInstanceOf[ResourceUri]
  }

  def buildSymbolTable(models : ISeq[Model],
                       stpConstructor : Unit => SymbolTableProducer,
                       parallel : Boolean) = {
    val stp = stpConstructor()
    val bst = stp.asInstanceOf[BakarSymbolTable]
    val tables = stp.tables

    val v = Visitor.build({
      case t : TypeAliasDecl =>
        assert(!tables.typeAliasTable.contains(t))
        tables.typeAliasTable(t) = t
        false
      case r : RecordDecl =>
        assert(!tables.recordTable.contains(r))
        tables.recordTable(r) = r
        true
      case a : AttributeDecl =>
        assert(!tables.attributeTable.contains(a))
        tables.attributeTable(a) = a
        false
      case p : ProcedureDecl =>
        assert(p ? URIS.REF_URI)
        val uri = p(URIS.REF_URI).asInstanceOf[ResourceUri]

        assert(!tables.procedureTable.contains(uri))
        tables.procedureTable(uri) = uri +: mlistEmpty[ResourceUri]
        tables.procedureAbsTable(uri) = p

        val bpst = bst.procedureSymbolTableProducer(uri)
        val ptables = bpst.tables

        for (param <- p.params) {
          assert(param ? URIS.REF_URI)
          val puri = param(URIS.REF_URI).asInstanceOf[ResourceUri]
          ptables.params += puri
          assert(!ptables.localVarTable.contains(puri))
          ptables.localVarTable(puri) = param
        }

        p.body match {
          case im : ImplementedBody =>
            for (lv <- im.locals) {
              assert(!ptables.localVarTable.contains(lv))
              ptables.localVarTable(lv) = lv
            }

            val bstd = new BodySymbolTableData()
            var index = 0
            for (loc <- im.locations) {

              assert(loc.name.isDefined)
              val luri = loc.name.get.name
              assert(!bstd.locationTable.contains(luri))
              bstd.locationTable(luri) = loc

              loc match {
                case l : ActionLocation =>
                  l.action.commandDescriptorInfo(Some(luri), index, 0, 0)
                case l : JumpLocation =>
                  l.jump.commandDescriptorInfo(Some(luri), index, 0, 0)
                case l : EmptyLocation =>
                case _ =>
                  assert(false)
              }

              loc.index(index)
              index += 1
            }

            assert(
              im.locations.last match {
                case x @ JumpLocation(_, _, ReturnJump(_, _)) => true
                case x =>
                  Console.err.println("Invalid end location in %s: %s".format(p.name.name, x))
                  println(NodePrettyPrinter.print(p))
                  false
              }
            )
            ptables.bodyTables = Some(bstd)
          case _ =>
        }
        false
    })

    for (m <- models)
      v(m)

    bst
  }
}

class BakarSymbolTable extends SymbolTable with SymbolTableProducer {
  bst =>

  import PilarSymbolResolverModuleDef.ERROR_TAG_TYPE
  import PilarSymbolResolverModuleDef.WARNING_TAG_TYPE

  val tables = SymbolTableData()
  def toSymbolTable : BakarSymbolTable = this
  def procedureSymbolTableProducer(procedureAbsUri : ResourceUri) = {
    assert(tables.procedureAbsTable.contains(procedureAbsUri))
    pdMap.getOrElseUpdate(procedureAbsUri, new BakarProcedureSymbolTable(procedureAbsUri))
  }

  val tags = marrayEmpty[LocationTag]
  var hasErrors = false

  def reportError(source : Option[FileResourceUri], line : Int,
                  column : Int, message : String) : Unit = {
    tags += Tag.toTag(source, line, column, message, ERROR_TAG_TYPE)
    hasErrors = true
  }

  def reportWarning(fileUri : Option[String], line : Int,
                    column : Int, message : String) : Unit =
    tags += Tag.toTag(fileUri, line, column, message, WARNING_TAG_TYPE)

  val pdMap = mmapEmpty[ResourceUri, BakarProcedureSymbolTable]

  def globalVars = tables.globalVarTable.keys
  def globalVar(globalUri : ResourceUri) = tables.globalVarTable(globalUri)

  def procedures = tables.procedureTable.keys
  def procedures(procedureUri : ResourceUri) = tables.procedureTable(procedureUri)

  def procedureSymbolTables = pdMap.values
  def procedureSymbolTable(procedureAbsUri : ResourceUri) : BakarProcedureSymbolTable =
    procedureSymbolTableProducer(procedureAbsUri)

  class BakarProcedureSymbolTable(val procedureUri : ResourceUri)
      extends ProcedureSymbolTable with ProcedureSymbolTableProducer {
    val tables = ProcedureSymbolTableData()

    def symbolTable = bst
    def symbolTableProducer = bst
    def procedure = bst.tables.procedureAbsTable(procedureUri)
    def typeVars : ISeq[ResourceUri] = tables.typeVarTable.keys.toList

    def param(paramUri : ResourceUri) : ParamDecl = tables.localVarTable(paramUri).asInstanceOf[ParamDecl]
    def params : ISeq[ResourceUri] = tables.params.toList
    def isParam(localUri : ResourceUri) = tables.params.contains(localUri)
    def nonParamLocals : Iterable[ResourceUri] = tables.localVarTable.keys.filterNot(isParam)

    def locals : Iterable[ResourceUri] = tables.localVarTable.keys
    def local(localUri : ResourceUri) : LocalVarDecl = tables.localVarTable(localUri).asInstanceOf[LocalVarDecl]

    def locations =
      tables.bodyTables match {
        case Some(bt) => procedure.body.asInstanceOf[ImplementedBody].locations
        case _        => ivectorEmpty
      }
    def location(locationIndex : Int) = locations(locationIndex)
    def location(locationUri : ResourceUri) = tables.bodyTables.get.locationTable(locationUri)

    def typeVar(typeVarUri : ResourceUri) : NameDefinition = tables.typeVarTable(typeVarUri)

    def catchClauses(locationIndex : Int) : Iterable[CatchClause] =
      tables.bodyTables.get.catchTable.getOrElse(locationIndex,
        Array.empty[CatchClause] : Iterable[CatchClause])

  }
}

class BakarSymbolProviderImpl[S <: State[S]](st : Option[SymbolTable]) extends SymbolProvider[S] {
  val bst = st.get.asInstanceOf[BakarSymbolTable]

  def isVar(e : NameExp) : Boolean = {
    val name = e.name
    name ? URIS.REF_URI && (name(URIS.REF_URI).asInstanceOf[String].contains("local"))
  }

  def procedureUri(e : NameExp) : Option[ResourceUri] = {
    val name = e.name
    if (name ? URIS.REF_URI && name(URIS.REF_URI).asInstanceOf[String].contains("proc"))
      Some(name(URIS.REF_URI).asInstanceOf[String])
    else
      None
  }

  def initLocation(procUri : ResourceUri) : Option[ResourceUri] = {
    val pst = bst.procedureSymbolTable(procUri)
    val ld = pst.location(0)
    //ld.name.map { nd => nd.uri }
    Some(ld.name.get.name)
  }

  def location(s : S, nu : NameUser) : S = {
    val pst = bst.procedureSymbolTable(s.callStack.head.procedure)
    //val ld = pst.location(nu.uri)
    val ld = pst.location(nu.name)
    s.location(Some(ld.name.get.name), ld.index)
  }

  def nextLocation(s : S) : S = {
    val pst = bst.procedureSymbolTable(s.callStack.head.procedure)
    val ld = pst.locations(s.callStack.head.locationIndex + 1)
    s.location(Some(ld.name.get.name), ld.index)
  }

  def initStore(s : S, procUri : ResourceUri, args : Value*) : State.Store = {
    val store : MMap[ResourceUri, Value] = mmapEmpty
    val pst = bst.procedureSymbolTable(procUri)
    val params = pst.params
    val numOfParams = params.size
    assert(args.size == numOfParams)
    for (i <- 0 until numOfParams)
      store(params(i)) = args(i)
    store.toMap
  }

  def isFieldAccess(f : NameUser) : Boolean = false
  def funUri(e : NameExp) : Option[ResourceUri] = None
}