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

  def buildSymbolTable(models: ISeq[Model],
    stpConstructor: Unit => SymbolTableProducer,
    parallel: Boolean) = {
    val stp = stpConstructor()
    val bst = stp.asInstanceOf[BakarSymbolTable]
    val tables = stp.tables
    val packageAbsTable = bst.packageAbsTable
    val packagesTable = bst.sparkPackageTable

    val v = Visitor.build({
      case a: AttributeDecl =>
        assert(!tables.attributeTable.contains(a.name.uri))
        tables.attributeTable(a.name.uri) = a
        false      
      case t: ConstDecl =>
        assert(!tables.constTable.contains(t.name.uri))
        tables.constTable(t.name.uri) = mlistEmpty += t
        for (k <- t.elements)
          tables.constElementTable(k.name.uri) = k
        false
      case t: EnumDecl =>
        assert(!tables.enumTable.contains(t.name.uri))
        tables.enumTable(t.name.uri) = mlistEmpty += t
        for(k <- t.elements)
          tables.enumElementTable(k.name.uri) = k
        false
      case a: GlobalVarDecl =>
        assert(!tables.globalVarTable.contains(a.name.uri))
        tables.globalVarTable(a.name.uri) = a
        false        
      case r: RecordDecl =>
        assert(!tables.recordTable.contains(r.name.uri))
        tables.recordTable(r.name.uri) = r
        true
      case t: TypeAliasDecl =>
        assert(!tables.typeAliasTable.contains(t.name.uri))
        tables.typeAliasTable(t.name.uri) = t
        false
      case p: PackageDecl =>
        val puri = p.name.get.uri

        assert(!packagesTable.contains(puri))
        assert(!packageAbsTable.contains(puri))

        val ptables = if (URIS.isAdaPackageSpecUri(puri)) {
          val bodyUri = puri.replace(URIS.uriPrefixPackageSpec, URIS.uriPrefixPackageBody)
          val x = packagesTable.getOrElse(bodyUri, new SparkPackage {})
          x.spec = Some(p)
          x
        } else if (URIS.isAdaPackageBodyUri(puri)) {
          val specUri = puri.replace(URIS.uriPrefixPackageBody, URIS.uriPrefixPackageSpec)
          val x = packagesTable.getOrElse(specUri, new SparkPackage {})
          x.body = Some(p)
          x
        } else {
          assert(puri.contains(PackageURIs.standardPackageURI) ||
            puri.contains(PackageURIs.anonymousPackageBodyURIprefix))
          val x = new SparkPackage {}
          x.body = Some(p)
          x
        }

        //ptables += puri
        packagesTable(puri) = ptables

        packageAbsTable(puri) = p
        true
      case p: ProcedureDecl =>
        val procUri = p.name.uri

        assert(!tables.procedureTable.contains(procUri))
        assert(!tables.procedureAbsTable.contains(procUri))

        val (procTables, sparkMethod) = if (URIS.isAdaMethodSpecUri(procUri)) {
          // ada://procedure/  or  ada://function/
          if (procUri.contains(URIS.uriPrefixFunctionSpec)) {
            // ada://function/
            import org.sireum.bakar.symbol.BakarSymbol._
            val parentUri = p.parentUri.get
            val sparkPack = packagesTable(parentUri) 

            // expression functions declared in the spec don't have the same 
            // mangled name as their body counterpart. For example,
            //   ada://expression_function/Arrays-1:9/Count_Odd+22:13 
            //   ada://function/Arrays-1:9/Count_Odd-30:13 
            // so try to find the function or expression_function in the package 
            // body

            def z(b: PackageDecl, origUri: ResourceUri) = {
              val proc = b.elements.find {
                case i: ProcedureDecl =>
                  i.name.name.toLowerCase == p.name.name.toLowerCase &&
                    i.name.uri != origUri
                case x => false
              }

              if (proc.isDefined) {
                if (tables.procedureTable.contains(proc.get.name.uri)) {
                  val x = tables.procedureTable(proc.get.name.uri)
                  val y = bst.sparkMethodTable(proc.get.name.uri)
                  Some((x, y))
                } else if (URIS.isExpressionFunctionUri(proc.get.name.uri)) {
                  // the companion to origUri is an expression function
                  // defined within the same package declaration.  We'll visit
                  // the function declaration first so just return an empty
                  // collection
                  Some((mlistEmpty[ResourceUri], new SparkMethod {}))
                } else
                  None
              } else
                None
            }

            if (sparkPack.body.isDefined) {
              z(sparkPack.body.get, procUri) match {
                case Some((x, y)) =>
                  y.spec = Some(p)
                  (x, y)
                case None =>
                  if (PackageURIs.isPackageAnonymous(sparkPack.body.get.name.get.uri)) {
                    val anonPacks = packagesTable.keys.filter(PackageURIs.isPackageAnonymous(_)).toSet - parentUri

                    var dkd: Option[(MBuffer[ResourceUri], SparkMethod)] = None
                    for (a <- anonPacks) if (dkd == None) {
                      val q = packagesTable(a)
                      dkd = z(q.body.get, procUri)
                    }
                    if (dkd.isDefined) {
                      val (x, y) = dkd.get
                      y.spec = Some(p)
                      (x,y)
                    }
                    else throw new RuntimeException()
                  } else if (sparkPack.spec.isDefined) {
                    z(sparkPack.spec.get, procUri) match {
                      case Some((x, y)) =>
                        y.spec = Some(p)
                        (x, y)
                      case None => throw new RuntimeException()
                    }
                  } else {
                    throw new RuntimeException()
                  }
              }
            } else {
              val x = new SparkMethod {}
              x.spec = Some(p)
              (mlistEmpty[ResourceUri], x)
            }
          } else { // ada://procedure/
            val bodyUri = procUri.replace(URIS.uriPrefixProcedureSpec, URIS.uriPrefixProcedureBody)
            val x = tables.procedureTable.getOrElse(bodyUri, mlistEmpty[ResourceUri])
            val sm = bst.sparkMethodTable.getOrElse(bodyUri, new SparkMethod {})
            sm.spec = Some(p)
            (x, sm)
          }
        } else if (URIS.isAdaMethodBodyUri(procUri)) {
          // ada://procedure_body  or  ada://function_body/  or  ada://expression_function/

          if (procUri.contains(URIS.uriPrefixProcedureBody)) { // ada://procedure_body
            val specUri = procUri.replace(URIS.uriPrefixProcedureBody, URIS.uriPrefixProcedureSpec)
            val a = tables.procedureTable.getOrElse(specUri, mlistEmpty[ResourceUri])
            val x = bst.sparkMethodTable.getOrElse(specUri, new SparkMethod {})
            x.body = Some(p)
            (a, x)
          } else if (procUri.contains(URIS.uriPrefixFunctionBody)) { // ada://function_body
            val specUri = procUri.replace(URIS.uriPrefixFunctionBody, URIS.uriPrefixFunctionSpec)
            val a = tables.procedureTable.getOrElse(specUri, mlistEmpty[ResourceUri])
            val x = bst.sparkMethodTable.getOrElse(specUri, new SparkMethod {})
            x.body = Some(p)
            (a, x)
          } else {
            // ada://expresion_function/
            // FIXME: see name mangling issue above

            // TODO: need to look w/in the current package, then in the
            // package spec (if avail), then in any anonymous packages
            val specUri = procUri.replace(URIS.uriPrefixExpressionFunction, URIS.uriPrefixFunctionSpec)

            if (bst.sparkMethodTable.contains(specUri)) {
              val a = tables.procedureTable(specUri)
              val x = bst.sparkMethodTable(specUri)
              x.body = Some(p)
              (a, x)
            } else {
              val a = mlistEmpty[ResourceUri]
              val x = new SparkMethod {}
              x.body = Some(p)
              (a, x)
            }
          }
        } else if (PackageURIs.isPackageInitProcedure(procUri)) {
          val x = new SparkMethod {}
          x.body = Some(p)
          (mlistEmpty[ResourceUri], x)
        } else {
          throw new RuntimeException("Unexpected: " + p)
        }

        bst.sparkMethodTable(procUri) = sparkMethod

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

trait SparkPackage {
  var spec: Option[PackageDecl] = None
  var body: Option[PackageDecl] = None
}

trait SparkMethod {
  var spec: Option[ProcedureDecl] = None
  var body: Option[ProcedureDecl] = None
}

class BakarSymbolTable extends SymbolTable with SymbolTableProducer {
  bst =>

  import PilarSymbolResolverModuleDef.ERROR_TAG_TYPE
  import PilarSymbolResolverModuleDef.WARNING_TAG_TYPE

  val packageAbsTable = mmapEmpty[ResourceUri, PackageDecl]
  val tables = SymbolTableData()

  val sparkPackageTable = mmapEmpty[ResourceUri, SparkPackage]
  val sparkMethodTable = mmapEmpty[ResourceUri, SparkMethod]

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

  def packages = sparkPackageTable.keys
  def packages(packageUri: ResourceUri) = sparkPackageTable(packageUri)

  def package_(packageUri: ResourceUri) = packageAbsTable(packageUri)

  def globalVars = tables.globalVarTable.keys
  def globalVar(globalUri: ResourceUri) = tables.globalVarTable(globalUri)

  def procedures = tables.procedureTable.keys
  def procedures(procedureUri: ResourceUri) = tables.procedureTable(procedureUri)

  def procedureSymbolTables = pdMap.values
  def procedureSymbolTable(procedureAbsUri: ResourceUri): BakarProcedureSymbolTable =
    procedureSymbolTableProducer(procedureAbsUri)

  /**
   * This is intended only for methods declared as a compilation unit (i.e. not
   * embedded in a package)
   */
  def getCompilationUnitMethod(methodName: String) : Option[SparkMethod] =
    packages.filter(PackageURIs.isPackageAnonymous(_)).collectFirst(u =>
      getSparkMethod(getPackageBody(u).get.name.get.name, methodName) match {
        case Some(p) => p
      })
    
  def getSparkMethod(packageName: String, methodName: String) : Option[SparkMethod] = {
    packageAbsTable.find(_._2.name.get.name.toLowerCase == packageName.toLowerCase) match {
      case Some((packUri, p)) =>
        // found the package, now try to find the method

        def findMethod(i: ISeq[PackageElement]) = {
          i.find {
            case i: ProcedureDecl => i.name.name.toLowerCase == methodName.toLowerCase
            case _ => false
          } match {
            case Some(proc) => getSparkMethod(proc.name.uri)
            case None => None
          }
        }

        val ret = if (getPackageBody(packUri).isDefined)
          findMethod(getPackageBody(packUri).get.elements)
        else None

        assert(ret.isDefined || getPackageSpec(packUri).isDefined)

        if (ret.isDefined) ret
        else findMethod(getPackageSpec(packUri).get.elements)
      case None => None
    }
  }
  
  def getSparkMethods = sparkMethodTable.values.toSet
  
  def getSparkMethod(methodUri: ResourceUri) = sparkMethodTable.get(methodUri)

  def getMethodSpec(methodUri: ResourceUri) =
    getSparkMethod(methodUri) match {
      case Some(m) => m.spec
      case _ => None
    }

  def getMethodBody(methodUri: ResourceUri) =
    getSparkMethod(methodUri) match {
      case Some(m) => m.body
      case _ => None
    }

  def getSparkPackages = sparkPackageTable.values.toSet
  
  def getSparkPackage(packageUri: ResourceUri) = sparkPackageTable.get(packageUri)

  def getPackageSpec(packageUri: ResourceUri) =
    getSparkPackage(packageUri) match {
      case Some(p) => p.spec
      case None => None
    }

  def getPackageBody(packageUri: ResourceUri) =
    getSparkPackage(packageUri) match {
      case Some(p) => p.body
      case None => None
    }

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