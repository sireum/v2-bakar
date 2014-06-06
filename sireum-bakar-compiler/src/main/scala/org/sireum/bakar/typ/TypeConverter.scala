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
    
    def typeValue(typ : TypeSpec) = throw new RuntimeException("Unhandled")
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
  
    def buildType(m: IMap[ResourceUri, Type], t: Type): org.sireum.kiasan.alpha.types.Type = {
      import org.sireum.kiasan.alpha.types._
      t match {
        case e : SignedIntegerTypeDef =>
          IntegerType
        case e : EnumerationTypeDef =>
          IntegerType
        case e : ArrayTypeDef =>
          val componentTypeUri = e.componentSubtype
          val indexTypeUri = 
            if (e.isInstanceOf[ConstrainedArrayDef])
              e.asInstanceOf[ConstrainedArrayDef].discreteSubtypes(0)
            else if (e.isInstanceOf[UnconstrainedArrayDef])
              e.asInstanceOf[UnconstrainedArrayDef].indexSubtypes(0)
            else
              throw new RuntimeException("Not handling")
          
          val componentTyp = m(componentTypeUri)
          val indexTyp = m(indexTypeUri)

          val componentType = buildType(m, componentTyp)
          ArrayType(SireumNumber(BigInt(0)), SireumNumber(BigInt(100)), componentType)

//          val state = null
//          val ee = newExpEvaluator(state)
          
          
//          if (state == null) 
//            (ee.evalExp(null.asInstanceOf[S], exp), expS, exp)
//          else
//            (ee.evalExp(state, exp), expS, exp)          
          
//          def evalExps[S <: State[S]](s: S, e: Exp) = {
//              if (s == null)  
//                ee.evalExp(null.asInstanceOf[S], e)
//              else
//                ee.evalExp(s, e)
//          }
//          
//          indexTyp match {
//              case o @ FullTypeDecl(id, uri, typeDef) => 
//                typeDef match {
//                  case sitd @ SignedIntegerTypeDef(le, he) =>
//                    ee.evalExp(state, le)
//                }
//              case SubTypeDecl(id, uri, puri, constraint) =>
//                  constraint match {
//                    case Some(SimpleRangeConstraint(le, he)) => 
//                      
//                    case None => 
//                      
//                    case x    => throw new RuntimeException("Not expecting " + x)  
//                  }
//            }

          
//      case o @ FullTypeDecl(id, uri, typeDef) =>
//        typeDef match {
//          case sitd @ SignedIntegerTypeDef(le, he) =>
//            val (s1, low) = le match {
//              case Some(lexpr) => evalExp(s, lexpr)
//              case None        => kee.freshKiasanValue(s, IntegerExtension.Type)
//            }
//            val (s2, high) = he match {
//              case Some(hexpr) => evalExp(s1, hexpr)
//              case None        => kee.freshKiasanValue(s1, IntegerExtension.Type)
//            }
//            val s3 = addPathCondition(s2, BinaryExp("<=", ValueExp(low), ValueExp(high)))
//
//            val s4 = s3.setAttribute(ruri, Attribute.FIRST, low)
//            val s5 = s4.setAttribute(ruri, Attribute.LAST, high)
//
//            (s5, low, high)
//        }
//      case SubTypeDecl(id, uri, puri, constraint) =>
//        val (s1, parentLowVal, parentHighVal) = getBounds(s, puri, c)
//
//        val (s2, lv, hv) = constraint match {
//          case Some(SimpleRangeConstraint(le, he)) =>
//            val (_s2, _lv) = evalExp(s1, le)
//            val (_s3, _hv) = evalExp(_s2, he)
//
//            // plv <= lv <= hv <= phv
//            val _s4 = addPathCondition(_s3, BinaryExp("<=", ValueExp(parentLowVal), ValueExp(_lv)))
//            val _s5 = addPathCondition(_s4, BinaryExp("<=", ValueExp(_lv), ValueExp(_hv)))
//            val _s6 = addPathCondition(_s5, BinaryExp("<=", ValueExp(_hv), ValueExp(parentHighVal)))
//
//            (_s6, _lv, _hv)
//          case None => (s1, parentLowVal, parentHighVal)
//          case x    => throw new RuntimeException("Not expecting " + x)
//        }
//
//        val s3 = s2.setAttribute(ruri, Attribute.FIRST, lv)
//        val s4 = s3.setAttribute(ruri, Attribute.LAST, hv)
//
//        (s4, lv, hv)
//      case o => throw new RuntimeException(s"Not handling type dec $o")
            
          
        case e: RecordDef =>
          assert(e.isInstanceOf[RecordTypeDef])
          var components: IMap[String, Type] = imapEmpty
          for(f <- e.asInstanceOf[RecordTypeDef].components) {
            val fieldName = f._1 
            val fieldTyp = m(f._2.typeUri)
            val fieldType = buildType(m, fieldTyp)
            components += (fieldName -> fieldType)
          }
          RecordType(components)
        case x =>
          //throw new RuntimeException("Not handling " + x)
          Console.err.println("Need to handle " + x)
          IntegerType
      }
    }
    
  def converter(m: IMap[ResourceUri, Type]): IMap[ResourceUri, org.sireum.kiasan.alpha.types.Type] = {
    var typeMap: IMap[ResourceUri, org.sireum.kiasan.alpha.types.Type] = imapEmpty
    m.foreach{ p =>
      p match {
        case (uri, t) =>
          val newType = buildType(m, SymbolUtil.getTypeDef(t, m))
          typeMap += (uri -> newType)
      }
    }
    typeMap
  }

}

