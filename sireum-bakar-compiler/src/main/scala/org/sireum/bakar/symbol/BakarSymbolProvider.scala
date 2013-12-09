package org.sireum.bakar.symbol

import org.sireum.pilar.eval.SymbolProvider
import org.sireum.pilar.symbol.Symbol
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
import org.sireum.bakar.compiler.module.PackageURIs

object BakarSymbolTable {
  def apply(models: ISeq[Model],
    stpConstructor: Unit => SymbolTableProducer,
    parallel: Boolean) =
    buildSymbolTable(models, stpConstructor, parallel)

  implicit def getUri(p: PilarAstNode): ResourceUri = {
    assert(p ? URIS.REF_URI)
    p(URIS.REF_URI)
  }

  def buildSymbolTable(models: ISeq[Model],
    stpConstructor: Unit => SymbolTableProducer,
    parallel: Boolean) = {
    val stp = stpConstructor()
    val bst = stp.asInstanceOf[BakarSymbolTable]
    val tables = stp.tables
    val packageAbsTable = bst.packageAbsTable
    val packagesTable = bst.packagesTable

    val v = Visitor.build({
      case t: ConstDecl =>
        assert(!tables.constTable.contains(t.name.uri))
        tables.constTable(t.name.uri) = mlistEmpty += t
        for(k <- t.elements)
          tables.constElementTable(k.name.uri) = k
        false
      case t: TypeAliasDecl =>
        assert(!tables.typeAliasTable.contains(t))
        tables.typeAliasTable(t) = t
        false
      case r: RecordDecl =>
        assert(!tables.recordTable.contains(r))
        tables.recordTable(r) = r
        true
      case a: AttributeDecl =>
        assert(!tables.attributeTable.contains(a))
        tables.attributeTable(a) = a
        false
      case a: GlobalVarDecl =>
        val uri = a.name.uri
        assert(!tables.globalVarTable.contains(uri))
        tables.globalVarTable(uri) = a
        false
      case p: PackageDecl =>
        val puri = p.name.get.uri

        assert(!packagesTable.contains(puri))
        assert(!packageAbsTable.contains(puri))

        val ptables = if (URIS.isAdaPackageSpecUri(puri)) {
          val bodyUri = puri.replace(URIS.uriPrefixPackageSpec, URIS.uriPrefixPackageBody)
          packagesTable.getOrElse(bodyUri, mlistEmpty[ResourceUri])
        } else if (URIS.isAdaPackageBodyUri(puri)) {
          val specUri = puri.replace(URIS.uriPrefixPackageBody, URIS.uriPrefixPackageSpec)
          packagesTable.getOrElse(specUri, mlistEmpty[ResourceUri])
        } else {
          assert(puri.contains(PackageURIs.standardPackageURI) ||
            puri.contains(PackageURIs.anonymousPackageBodyURIprefix))
          mlistEmpty[ResourceUri]
        }

        ptables += puri
        packagesTable(puri) = ptables

        packageAbsTable(puri) = p
        true
      case p: ProcedureDecl =>
        val procUri = p.name.uri

        assert(!tables.procedureTable.contains(procUri))
        assert(!tables.procedureAbsTable.contains(procUri))

        val procTables = if (URIS.isAdaMethodSpecUri(procUri)) {
          // ada://procedure/  or  ada://function/
          if (procUri.contains(URIS.uriPrefixFunctionSpec)) { // ada://function/
            import org.sireum.bakar.symbol.BakarSymbol._
            val parentUri = p.parentUri.get
            val q = packagesTable(parentUri) - parentUri
            
            // expression functions declared in the spec don't have the same 
            // mangled name as their body conterpart. For example,
            //   ada://expression_function/Arrays-1:9/Count_Odd+22:13 
            //   ada://function/Arrays-1:9/Count_Odd-30:13 
            // so try to find the function in the package body
            if(q.size == 1) {
              val pp = packageAbsTable(q.head)
              val bodyProc = pp.elements.find {
                case i:ProcedureDecl => i.name.name == p.name.name
                case x => false
              }
              if(bodyProc.isDefined) tables.procedureTable(bodyProc.get.name.uri)
              else mlistEmpty[ResourceUri]
            } else {
              val bodyUri = procUri.replace(URIS.uriPrefixFunctionSpec, URIS.uriPrefixFunctionBody)
              tables.procedureTable.getOrElse(bodyUri, mlistEmpty)
            }
          } else { // ada://procedure/
            val bodyUri = procUri.replace(URIS.uriPrefixProcedureSpec, URIS.uriPrefixProcedureBody)
            tables.procedureTable.getOrElse(bodyUri, mlistEmpty[ResourceUri])
          }
        } else if (URIS.isAdaMethodBodyUri(procUri)) {
          // ada://procedure_body  or  ada://function_body/  or  ada://expression_function/
          val specUri =
            if (procUri.contains(URIS.uriPrefixProcedureBody)) // ada://procedure_body
              procUri.replace(URIS.uriPrefixProcedureBody, URIS.uriPrefixProcedureSpec)
            else if (procUri.contains(URIS.uriPrefixFunctionBody)) // ada://function_body
              procUri.replace(URIS.uriPrefixFunctionBody, URIS.uriPrefixFunctionSpec)
            else {
              // ada://expresion_function/
              // FIXME: see name mangling issue above
              procUri.replace(URIS.uriPrefixExpressionFunction, URIS.uriPrefixFunctionSpec)
            }
          tables.procedureTable.getOrElse(specUri, mlistEmpty[ResourceUri])
        } else if (PackageURIs.isPackageInitProcedure(procUri))
          mlistEmpty[ResourceUri]
        else {
          throw new RuntimeException("Unexpected: " + p)
        }
        
        procTables += procUri
        tables.procedureTable(procUri) = procTables

        tables.procedureAbsTable(procUri) = p

        val bpst = bst.procedureSymbolTableProducer(procUri)
        val ptables = bpst.tables

        for (param <- p.params) {
          val paramUri = param.name.uri
          ptables.params += paramUri
          if (ptables.localVarTable.contains(paramUri)) {
            // FIXME: gnat2xml Pro 7.2.0rc (20131028) repeats the first param
            // as the param profile (e.g. X, Y becomes X, X). 
            assert(p.propertyMap.contains("IS_EXPRESSION_FUNCTION"))
            assert(ptables.localVarTable(paramUri) == param)
          } else {
            assert(!ptables.localVarTable.contains(paramUri))
            ptables.localVarTable(paramUri) = param
          }
        }

        p.body match {
          case im: ImplementedBody =>
            for (lv <- im.locals) {
              val locUri = lv.name.uri
              assert(!ptables.localVarTable.contains(locUri))
              ptables.localVarTable(locUri) = lv
            }

            val bstd = new BodySymbolTableData()
            var index = 0
            for (loc <- im.locations) {
              val luri = loc.name.get.uri
              assert(!bstd.locationTable.contains(luri))
              bstd.locationTable(luri) = loc

              loc match {
                case l: ActionLocation =>
                  l.action.commandDescriptorInfo(Some(luri), index, 0, 0)
                case l: JumpLocation =>
                  l.jump.commandDescriptorInfo(Some(luri), index, 0, 0)
                case l: EmptyLocation =>
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
              })
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

  val packagesTable = mmapEmpty[ResourceUri, MBuffer[ResourceUri]]
  val packageAbsTable = mmapEmpty[ResourceUri, PackageDecl]
  val tables = SymbolTableData()

  def toSymbolTable: BakarSymbolTable = this
  def procedureSymbolTableProducer(procedureAbsUri: ResourceUri) = {
    assert(tables.procedureAbsTable.contains(procedureAbsUri))
    pdMap.getOrElseUpdate(procedureAbsUri, new BakarProcedureSymbolTable(procedureAbsUri))
  }

  val tags = marrayEmpty[LocationTag]
  var hasErrors = false

  def reportError(source: Option[FileResourceUri], line: Int,
    column: Int, message: String): Unit = {
    tags += Tag.toTag(source, line, column, message, ERROR_TAG_TYPE)
    hasErrors = true
  }

  def reportWarning(fileUri: Option[String], line: Int,
    column: Int, message: String): Unit =
    tags += Tag.toTag(fileUri, line, column, message, WARNING_TAG_TYPE)

  val pdMap = mmapEmpty[ResourceUri, BakarProcedureSymbolTable]

  def packages = packagesTable.keys
  def packages(packageUri: ResourceUri) = packagesTable(packageUri)

  def package_(packageUri: ResourceUri) = packageAbsTable(packageUri)

  def globalVars = tables.globalVarTable.keys
  def globalVar(globalUri: ResourceUri) = tables.globalVarTable(globalUri)

  def procedures = tables.procedureTable.keys
  def procedures(procedureUri: ResourceUri) = tables.procedureTable(procedureUri)

  def procedureSymbolTables = pdMap.values
  def procedureSymbolTable(procedureAbsUri: ResourceUri): BakarProcedureSymbolTable =
    procedureSymbolTableProducer(procedureAbsUri)

  class BakarProcedureSymbolTable(val procedureUri: ResourceUri)
    extends ProcedureSymbolTable with ProcedureSymbolTableProducer {
    val tables = ProcedureSymbolTableData()

    def symbolTable = bst
    def symbolTableProducer = bst
    def procedure = bst.tables.procedureAbsTable(procedureUri)
    def typeVars: ISeq[ResourceUri] = tables.typeVarTable.keys.toList

    def param(paramUri: ResourceUri): ParamDecl = tables.localVarTable(paramUri).asInstanceOf[ParamDecl]
    def params: ISeq[ResourceUri] = tables.params.toList
    def isParam(localUri: ResourceUri) = tables.params.contains(localUri)
    def nonParamLocals: Iterable[ResourceUri] = tables.localVarTable.keys.filterNot(isParam)

    def locals: Iterable[ResourceUri] = tables.localVarTable.keys
    def local(localUri: ResourceUri): LocalVarDecl = tables.localVarTable(localUri).asInstanceOf[LocalVarDecl]

    def locations =
      tables.bodyTables match {
        case Some(bt) => procedure.body.asInstanceOf[ImplementedBody].locations
        case _ => ivectorEmpty
      }
    def location(locationIndex: Int) = locations(locationIndex)
    def location(locationUri: ResourceUri) = tables.bodyTables.get.locationTable(locationUri)

    def typeVar(typeVarUri: ResourceUri): NameDefinition = tables.typeVarTable(typeVarUri)

    def catchClauses(locationIndex: Int): Iterable[CatchClause] =
      tables.bodyTables.get.catchTable.getOrElse(locationIndex,
        Array.empty[CatchClause]: Iterable[CatchClause])

  }
}

final case class TupleValue(values: ISeq[Value]) extends Value

class BakarSymbolProviderImpl[S <: State[S]](st: Option[SymbolTable]) extends SymbolProvider[S] {
  val bst = st.get.asInstanceOf[BakarSymbolTable]

  def isVar(e: NameExp): Boolean = {
    val uri = e.name.uri
    uri.startsWith("ada://variable") || uri.startsWith("ada://parameter") ||
      uri.startsWith("ada://loop_parameter") || H.isGlobalVar(uri)
  }

  def funUri(e: NameExp): Option[ResourceUri] = None

  def procedureUri(e: NameExp): Option[ResourceUri] = {
    val uri = e.name.uri

    if (uri.startsWith("ada://function") || uri.startsWith("ada://procedure"))
      Some(uri)
    else None
  }

  def initLocation(procUri: ResourceUri): Option[ResourceUri] = {
    val pst = bst.procedureSymbolTable(procUri)
    val ld = pst.location(0)
    Some(ld.name.get.name)
  }

  def location(s: S, nu: NameUser): S = {
    val pst = bst.procedureSymbolTable(s.callStack.head.procedure)
    val ld = pst.location(nu.uri)
    s.location(Some(ld.name.get.name), ld.index)
  }

  def nextLocation(s: S): S = {
    val pst = bst.procedureSymbolTable(s.callStack.head.procedure)
    val ld = pst.locations(s.callStack.head.locationIndex + 1)
    s.location(Some(ld.name.get.name), ld.index)
  }

  def initStore(s: S, procUri: ResourceUri, args: Value*): State.Store = {
    val store: MMap[ResourceUri, Value] = mmapEmpty
    val params = bst.procedureSymbolTable(procUri).params

    // TODO: perhaps only assign to OUT moded params??
    var i = 0;
    args.foreach {
      case a: TupleValue =>
        for (arg <- a.values) {
          store(params(i)) = arg
          i += 1
        }
      case a =>
        store(params(i)) = a
        i += 1
    }
    assert(i == params.size)
    store.toMap
  }

  def isFieldAccess(f: NameUser): Boolean = f.uri.startsWith("ada://component")
}