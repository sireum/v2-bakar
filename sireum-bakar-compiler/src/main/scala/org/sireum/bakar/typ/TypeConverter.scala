package org.sireum.bakar.typ

import org.sireum.util._
import org.sireum.bakar.symbol._
import org.sireum.pilar.eval.EvaluatorConfig._
import org.sireum.pilar.eval._
import org.sireum.pilar.state._
import org.sireum.pilar.symbol._
import org.sireum.pilar.ast._
import org.sireum.konkrit.extension._
import org.sireum.extension._
import org.sireum.util.math.SireumNumber
import org.sireum.bakar.util.UnexpectedError

object TypeConverter {

  class PilarSymbolProviderImpl[S <: State[S]](st : Option[SymbolTable])
      extends PilarSymbolProvider[S] {
    def initLocation(procUri : ResourceUri) : Option[ResourceUri] =
      st match {
        case Some(st) =>
          val pst = st.procedureSymbolTable(procUri)
          val ld = pst.location(0)
          ld.name.map { nd => nd.uri }
        case _ =>
          None
      }

    def location(s : S, nu : NameUser) : S =
      st match {
        case Some(st) =>
          val pst = st.procedureSymbolTable(s.callStack.head.procedure)
          val ld = pst.location(nu.uri)
          s.location(ld.name.map { nd => nd.uri }, ld.index)
        case _ =>
          s.location(Some(nu.name), 1)
      }

    def nextLocation(s : S) : S =
      st match {
        case Some(st) =>
          val pst = st.procedureSymbolTable(s.callStack.head.procedure)
          val ld = pst.location(s.callStack.head.locationIndex + 1)
          s.location(ld.name.map { nd => nd.uri }, ld.index)
        case _ =>
          s.location(Some("next"), 1)
      }

    def initStore(s : S, procUri : ResourceUri,
                  args : Value*) : State.Store =
      st match {
        case Some(st) =>
          val store : MMap[ResourceUri, Value] = mmapEmpty
          val pst = st.procedureSymbolTable(procUri)
          val params = pst.params
          val numOfParams = params.size
          assert(args.size == numOfParams)
          numOfParams match {
            case 0 =>
            case 1 =>
              store(params(0)) = args(0)
            case n =>
              for (i <- 0 until n)
                store(params(i)) = args(i)
          }
          store.toMap
        case _ =>
          imapEmpty
      }
  }

  final class TypeProviderImpl extends TypeProvider {
    def typeUri(symUri : ResourceUri) : ResourceUri = {
      val i = symUri.indexOf('_')
      val ext = if (i >= 0) symUri.substring(i + 1) else ""
      ext match {
        case "rec" | "arr" |
          "recrec" | "recarr" |
          "arrrec" | "arrarr" => ext
        case _ => IntegerExtension.Type
      }
    }

    def typeValue(typ : TypeSpec) = throw new UnexpectedError("Unhandled")
  }

  final class EvaluatorConfigurationImpl[S <: State[S]](
      st : Option[SymbolTable],
      ev : Evaluator[S, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] with EvaluatorModule,
      sem : SemanticsExtensionModule[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]],
      exts : ExtensionCompanion*) extends EvaluatorConfiguration with EvaluatorHeapConfiguration {
    self =>
    type R = ISeq[(S, Value)]
    type C = ISeq[(S, Boolean)]
    type SR = ISeq[S]
    var _symbolProvider = new PilarSymbolProviderImpl[S](st)
    def symbolProvider[S] = _symbolProvider.asInstanceOf[SymbolProvider[S]]
    var typeProvider : TypeProvider = new TypeProviderImpl
    var elseGuardExpander : Option[ElseGuardExpander] = None
    var computeDisabledTransitions : Boolean = false
    var extensions : ISeq[ExtensionCompanion] = exts.toList
    val propertyMap = mmapEmpty[Property.Key, Any]
    def valueToV[V](v : Value) : V = v.asInstanceOf[V]
    def vToValue[V](v : V) : Value = v.asInstanceOf[Value]
    def evaluator[S, R, C, SR] = ev.asInstanceOf[Evaluator[S, R, C, SR]]
    var _semanticsExtension : SemanticsExtensionConsumer[S, Value, R, C, SR] = null
    def semanticsExtension[S, V, R, C, SR] =
      _semanticsExtension.asInstanceOf[SemanticsExtensionConsumer[S, V, R, C, SR]]
    def semanticsExtension_=[SS, VS, RS, CS, SRS](
      sec : SemanticsExtensionConsumer[SS, VS, RS, CS, SRS]) {
      _semanticsExtension = sec.asInstanceOf[SemanticsExtensionConsumer[S, Value, R, C, SR]]
    }
    def heapEvalConfig = this

    ev.initialize(this)
    sem.initialize(this)
  }

  def newEvaluator[S <: State[S]](
    st : Option[SymbolTable],
    extCompanions : ExtensionCompanion*) =
    new EvaluatorConfigurationImpl[S](st, new EvaluatorImpl,
      new SemanticsExtensionModule[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] {
        val sei = new SemanticsExtensionInitImpl[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] {}
        val miners = ivector(ExtensionMiner.mine[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] _)
      },
      extCompanions : _*).evaluator[S, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]].mainEvaluator

  def newEvaluator[S <: State[S]](
    extCompanions : ExtensionCompanion*) =
    new EvaluatorConfigurationImpl[S](None, new EvaluatorImpl,
      new SemanticsExtensionModule[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] {
        val sei = new SemanticsExtensionInitImpl[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] {}
        val miners = ivector(ExtensionMiner.mine[S, Value, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]] _)
      },
      extCompanions : _*).evaluator[S, ISeq[(S, Value)], ISeq[(S, Boolean)], ISeq[S]].mainEvaluator

  def newExpEvaluator[S <: State[S]](s : S) =
    newEvaluator(None,
      KonkritBooleanExtension,
      KonkritIntegerIExtension,
      KonkritIntIExtension,
      KonkritLongIExtension)

  //    val ee = newExpEvaluator(state)
  //    exp = expRewriter(eOpt.get)
  //    if (state == null)
  //      (ee.evalExp(null.asInstanceOf[S], exp), expS, exp)
  //    else
  //      (ee.evalExp(state, exp), expS, exp)        

  //    KiasanEvaluatorTestUtil  

  def buildType(m : IMap[ResourceUri, TypeDecl], t : TypeDecl) : org.sireum.kiasan.alpha.types.Type = {
    import org.sireum.kiasan.alpha.types._

    SymbolUtil.getTypeDef(t, m) match {
      case e : SignedIntegerTypeDef => IntegerType
      case e : EnumerationTypeDef   => IntegerType
      case e : ArrayTypeDef =>
        val componentTypeUri = e.componentSubtype
        val indexTypeUri =
          if (e.isInstanceOf[ConstrainedArrayDef])
            e.asInstanceOf[ConstrainedArrayDef].discreteSubtypes(0)
          else if (e.isInstanceOf[UnconstrainedArrayDef])
            e.asInstanceOf[UnconstrainedArrayDef].indexSubtypes(0)
          else
            throw new UnexpectedError("Not handling")
        ArrayType(SireumNumber(BigInt(0)), SireumNumber(BigInt(100)), componentTypeUri)
      case e : RecordDef =>
        assert(e.isInstanceOf[RecordTypeDef])
        var components = imapEmpty[ResourceUri, (ResourceUri, String)]
        for (f <- e.asInstanceOf[RecordTypeDef].components) {
          components += (f._2.refUri -> (f._2.typeUri, f._1))
        }
        RecordType(components)
      case x =>
        //throw new RuntimeException("Not handling " + x)
        Console.err.println("Need to handle " + x)
        IntegerType
    }
  }

  def converter(m : IMap[ResourceUri, TypeDecl]) : IMap[ResourceUri, org.sireum.kiasan.alpha.types.Type] = {
    var typeMap : IMap[ResourceUri, org.sireum.kiasan.alpha.types.Type] = imapEmpty
    m.foreach { p =>
      p match {
        case (uri, t) =>
          val newType = buildType(m, t)
          typeMap += (uri -> newType)
      }
    }
    typeMap
  }

}

