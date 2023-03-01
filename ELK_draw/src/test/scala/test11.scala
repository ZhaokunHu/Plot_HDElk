import Old_plot._
import Plot_All.Plot_All
import spinal.core._
import spinal.lib._

class Counter(width : Int) extends Component{
  val io = new Bundle{
    val clear = in Bool()
    val value = out UInt(width bits)
  }
  val register = Reg(UInt(width bits)) init(0)
  register := register + 1
  when(io.clear){
    register := 0
  }
  io.value := register
}


object Top11 {
  def main(args: Array[String]) {
    val Plott = new Plot_All(SpinalVerilog(new Counter(4)))
    Plott.plot_All
  }
}
