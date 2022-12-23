import plot.{Plot_UML, Plot_yEd, ReadSystem}
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
    val rtl = SpinalVerilog(new Top1)
    val drawyed = new Plot_yEd(rtl.toplevel)
    drawyed.begindraw
    val letread = new ReadSystem(rtl.toplevel)
    letread.beginread
    val letdraw = new Plot_UML(rtl.toplevel)
    letdraw.begindraw
  }
}
