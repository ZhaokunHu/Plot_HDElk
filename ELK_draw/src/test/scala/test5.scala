import Old_plot._
import Plot_GroupIO.Plot_All
import spinal.core._
import spinal.lib._
class Pll extends Component{
  val io = new Bundle {
    val clkIn = in Bool()
    val clkOut  = out Bool()
    val reset  = out Bool()
  }
  io.clkOut := io.clkIn
  io.reset  := False
}
class InternalClockWithPllExample extends Component {
  val io = new Bundle {
    val clk100M = in Bool()
    val aReset  = in Bool()
    val result  = out UInt (4 bits)
  }
  // myClockDomain.clock will be named myClockName_clk
  // myClockDomain.reset will be named myClockName_reset
  val myClockDomain = ClockDomain.internal("myClockName")

  // Instanciate a PLL (probably a BlackBox)
  val pll = new Pll()
  pll.io.clkIn := io.clk100M

  // Assign myClockDomain signals with something
  myClockDomain.clock := pll.io.clkOut
  myClockDomain.reset := io.aReset || !pll.io.reset

  // Do whatever you want with myClockDomain
  val myArea = new ClockingArea(myClockDomain){
    val myReg = Reg(UInt(4 bits)) init(7)
    myReg := myReg + 1

    io.result := myReg
  }
}

object Top5 {
  def main(args: Array[String]): Unit = {
    val rtl = SpinalVerilog(new InternalClockWithPllExample)
//    val drawyed = new Plot_yEd(rtl.toplevel)
//    drawyed.begindraw
//    val letread = new ReadSystem(SpinalVerilog(new InternalClockWithPllExample))
//    letread.beginread
//    val letdraw = new Plot_UML(rtl.toplevel)
//    letdraw.begindraw
//    val drawELK = new Plot_ELK(SpinalVerilog(new InternalClockWithPllExample))
//    drawELK.begindraw
//    val drawELKBUS = new Plot_Simple_ELK(SpinalVerilog(new InternalClockWithPllExample))
//    drawELKBUS.begindraw
val drawELK = new Plot_All(SpinalVerilog(new InternalClockWithPllExample))
    drawELK.plot_All
  }
}