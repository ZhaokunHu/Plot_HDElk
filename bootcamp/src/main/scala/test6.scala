import dataanan._
import spinal.core._
import spinal.lib._

class PLL extends BlackBox{
  val io = new Bundle{
    val clkIn    = in Bool()
    val clkOut   = out Bool()
    val isLocked = out Bool()
  }
  noIoPrefix()
}
class TopLevel extends Component{
  val io = new Bundle {
    val aReset    = in Bool()
    val clk100Mhz = in Bool()
    val result    = out UInt(4 bits)
  }

  // 创建一个Area来管理所有时钟和复位
  val clkCtrl = new Area {
    //例化并驱动PLL
    val pll = new PLL
    pll.io.clkIn := io.clk100Mhz

    //建立新时钟域'core'
    val coreClockDomain = ClockDomain.internal(
      name = "core",
      frequency = FixedFrequency(200 MHz)  // 该频率要求可以被使用
    )                                      // 通过coreClockDomain用户来做某些计算

    //驱动coreClockDomain的时钟和复位
    coreClockDomain.clock := pll.io.clkOut
    coreClockDomain.reset := ResetCtrl.asyncAssertSyncDeassert(
      input = io.aReset || ! pll.io.isLocked,
      clockDomain = coreClockDomain
    )
  }

  //建立clkCtrl.coreClockDomain下的ClockingArea
  val core = new ClockingArea(clkCtrl.coreClockDomain){
    val counter = Reg(UInt(4 bits)) init(0)
    counter := counter + 1
    io.result := counter
  }
}
object TopLevel {
  def main(args: Array[String]) {
    val rtl=SpinalVerilog(new TopLevel)
    val letdo = new readsystem(rtl.toplevel)
    letdo.beginread
    val letdraw=new draw(rtl.toplevel)
    letdraw.begindraw
  }
}