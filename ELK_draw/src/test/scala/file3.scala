import spinal.core._
import spinal.lib.LatencyAnalysis

class Toplevell extends Component {
  val a, b, c = in UInt (8 bits)
  val result = out(a + b + c)

  // State machine
  val state = Reg(UInt(2 bits)) init (0)
  switch(state) {
    is(0) {
      when(a > b) {
        state := 1
      } otherwise {
        state := 2
      }
    }
    is(1) {
      when(a > c) {
        state := 2
      } otherwise {
        state := 0
      }
    }
    is(2) {
      when(b > c) {
        state := 0
      } otherwise {
        state := 1
      }
    }
  }
}
object FindAllStateMachines {


  import spinal.core.internals._

  class PrintBaseTypes(message: String) extends Phase {
    override def impl(pc: PhaseContext) = {
//      println(message)

      recComponent(pc.topLevel)

      def recComponent(c: Component): Unit = {
        c.children.foreach(recComponent)
        c.dslBody.foreachStatements(recStatement)
      }

      def recStatement(s: Statement): Unit = {
        s match {
//          case w: WhenStatement => println(s"Found a when statement with condition ${w.cond}")
//          case element: StatementDoubleLinkedContainerElement[_, _] => println(s"Found a StatementDoubleLinkedContainerElement with condition $element")
//          case container: StatementDoubleLinkedContainer[_, _] => println(s"Found a StatementDoubleLinkedContainer  with condition $container")
//          case statement: LeafStatement => println(s"Found a LeafStatement  with condition $statement")
          case ts: TreeStatement => ts.foreachStatements(recStatement)
          case _ =>
        }
        s.foreachExpression(recExpression)
      }

      def recExpression(e: Expression): Unit = {
        println(e+":"+LatencyAnalysis.impl(e,e))
        e match {
//          case op: Operator.BitVector.Add => println(s"Found ${op.left} + ${op.right}")
//          case op: Operator.BitVector.Sub => println(s"Found ${op.left} - ${op.right}")
//          case op: Operator.BitVector.Mul => println(s"Found ${op.left} * ${op.right}")
//          case op: Operator.BitVector.Div => println(s"Found ${op.left} / ${op.right}")
//          case op: Operator.BitVector.Mod => println(s"Found ${op.left} % ${op.right}")
//          case op: Operator.BitVector.Xor => println(s"Found ${op.left} ^ ${op.right}")
//          case op: Operator.BitVector.Or => println(s"Found ${op.left} | ${op.right}")
//          case op: Operator.BitVector.And => println(s"Found ${op.left} & ${op.right}")
//          case ref: BaseType => println(s"Found a reference ${ref.getName()}")
          case _ =>
        }
        e.foreachExpression(recExpression)
      }

    }
    override def hasNetlistImpact = false

    override def toString = s"${super.toString} - $message"
  }

  def main(args: Array[String]): Unit = {
    val config = SpinalConfig()
    val mm = UartRxGenerics()

    val apbc = ApbConfig(8, 32, 1)
    val timer = 8
    //    val mmoo2 = SpinalVerilog(UartCtrlRx(mm)).toplevel
//    val mmoo = SpinalVerilog(ApbPwm(apbc, timer)).toplevel
//    val mmoo3 = SpinalVerilog(new TopExample2).toplevel
//    val mmoo4 = SpinalConfig(targetDirectory = "rtl").generateVhdl(UdpApp("012345")).toplevel
//    //Add a early phase
//    config.addTransformationPhase(new PrintBaseTypes("Early"))

    //Add a late phase
    config.phasesInserters += {phases =>
      phases.insert(phases.indexWhere(_.isInstanceOf[PhaseVerilog]), new PrintBaseTypes("Late"))
    }
    config.generateVerilog(new ApbPwm(apbc, timer))
  }
}