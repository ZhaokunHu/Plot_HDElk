import Plot_All.Plot_All
import spinal.core._
import spinal.lib.Stream._
import spinal.lib._

case class FilterConfig(iqWidth: Int,
                        tapNumbers: Int = 33,
                        hwFreq: HertzNumber = 200 MHz,
                        sampleFreq: HertzNumber = 1.92 MHz)

case class IQ(width: Int) extends Bundle{
  val I,Q = SInt(width bits)
}

class Filter(fc: FilterConfig) extends Component{
  //val din   = slave Flow(IQ(fc.iqWidth))
  //val dout  = master Flow(IQ(fc.iqWidth))
  val din   = slave Flow(Bits(32 bits))
  val dout  = master Flow(Bits(32 bits))
  val flush = in Bool()

  val clockSMP = ClockDomain.external("smp")
  val clockHW = ClockDomain.external("hw")

  val u_fifo_in = StreamFifoCC(
    dataType = Bits(32 bits),
    depth = 8,
    pushClock = clockSMP,
    popClock = clockDomain
  )

  u_fifo_in.io.push << din.toStream
  dout << u_fifo_in.io.pop.toFlow

}

object Top4 {
  def main(args: Array[String]): Unit = {
    val fc=FilterConfig(8)
    val rtl = SpinalVerilog(new Filter(fc))
    val drawELK = new Plot_All(SpinalVerilog(new Filter(fc)))
    drawELK.plot_All
//    val letread = new ReadSystem(SpinalVerilog(new Filter(fc)))
//    letread.beginread
//    val drawyed = new Plot_yEd(rtl.toplevel)
//    drawyed.begindraw
//    val letread = new ReadSystem(rtl.toplevel)
//    letread.beginread
//    val letdraw = new Plot_UML(rtl.toplevel)
//    letdraw.begindraw
  }
}