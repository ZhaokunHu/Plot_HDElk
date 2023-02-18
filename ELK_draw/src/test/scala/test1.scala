import NewPlot.Plot_ELK
import Old_plot._
import Simple_ELK.Plot_Simple_ELK
import spinal.core._
import spinal.lib._


case class RGB(channelWidth : Int) extends Bundle{
  val red   = UInt(channelWidth bit)
  val green = UInt(channelWidth bit)
  val blue  = UInt(channelWidth bit)

  def isBlack : Bool = red === 0 && green === 0 && blue === 0
}

class Top1 extends Component{
  val source = slave Stream(RGB(8))
  val sink   = master Stream(RGB(8))
  sink <-< source.throwWhen(source.payload.isBlack)
}

object Top1 {
  def main(args: Array[String]): Unit = {
    val drawELK = new Plot_ELK(SpinalVerilog(new Top1))
    drawELK.begindraw
    val drawELKBUS=new Plot_Simple_ELK(SpinalVerilog(new Top1))
    drawELKBUS.begindraw
    val letread = new ReadSystem(SpinalVerilog(new Top1))
    letread.beginread
  }
}
//    {
//      val dut =new Top1
//      val drawELK = new Plot_ELK(dut)
//      drawELK.begindraw
//      dut
//    }
//    )
//    val tryy = new Deal_Wires
//    tryy(rtl.toplevel)
//    val drawyed = new Plot_yEd(rtl.toplevel)
//    drawyed.begindraw

//
//    val letdraw = new Plot_UML(rtl.toplevel)
//    letdraw.begindraw


