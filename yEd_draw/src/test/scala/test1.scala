import plot._
import spinal.core._
import spinal.lib._
import tests.Plot_ELK


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
    val rtl = SpinalVerilog(new Top1)
//    val tryy = new Deal_Wires
//    tryy(rtl.toplevel)
//    val drawyed = new Plot_yEd(rtl.toplevel)
//    drawyed.begindraw
    val drawELK=new Plot_ELK(rtl.toplevel)
    drawELK.begindraw
//    val letread = new ReadSystem(rtl.toplevel)
//    letread.beginread
//    val letdraw = new Plot_UML(rtl.toplevel)
//    letdraw.begindraw
  }
}
