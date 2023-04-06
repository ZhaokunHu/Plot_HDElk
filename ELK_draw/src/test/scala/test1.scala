import Old_plot._
import Plot_GroupIO.Plot_All
import spinal.core._
import spinal.lib._

import scala.reflect.runtime.universe._


case class RGB(channelWidth: Int) extends Bundle {
  val red = UInt(channelWidth bit)
  val green = UInt(channelWidth bit)
  val blue = UInt(channelWidth bit)

  def isBlack: Bool = red === 0 && green === 0 && blue === 0
}

class Top1 extends Component {
  val source = slave Stream (RGB(8))
  val sink = master Stream (RGB(8))
  sink <-< source.throwWhen(source.payload.isBlack)

  // 在Top1类中定义一个方法，用于获取RGB bundle中的所有字段名和类型

}






object Top1 {
  def main(args: Array[String]): Unit = {
    //    println(reports.getRtlString())
    val drawELK = new Plot_All(SpinalVerilog(new Top1))
    drawELK
//    val letread = new ReadSystem(SpinalVerilog(new Top1))
//    letread.beginread
  }
}
//}
//}
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


