import spinal.core._
import spinal.lib._
object FindAllAddersManualy {
  class Toplevel extends Component{
    val a,b,c = in UInt(8 bits)
    val result = out(a + b + c)
  }

  import spinal.core.internals._

  class PrintBaseTypes(message : String) extends Phase{
    override def impl(pc: PhaseContext) = {
      println(message)

      recComponent(pc.topLevel)

      def recComponent(c: Component): Unit = {
        c.children.foreach(recComponent)
        c.dslBody.foreachStatements(recStatement)
      }

      def recStatement(s: Statement): Unit = {
        s.foreachExpression(recExpression)
        s match {
          case ts: TreeStatement => ts.foreachStatements(recStatement)
          case _ =>
        }
      }

      def recExpression(e: Expression): Unit = {
        e match {
          case op: Operator.BitVector.Add => println(s"Found ${op.left} + ${op.right}")
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

    //Add a early phase
    config.addTransformationPhase(new PrintBaseTypes("Early"))

    //Add a late phase
    config.phasesInserters += {phases =>
      phases.insert(phases.indexWhere(_.isInstanceOf[PhaseVerilog]), new PrintBaseTypes("Late"))
    }
//    config.generateVerilog(new Top1)
  }
}