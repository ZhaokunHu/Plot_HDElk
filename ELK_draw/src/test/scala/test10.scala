import Plot_All.Plot_All
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.ahblite._
import spinal.lib.bus.amba3.apb._

class Top10(ahbConfig:AhbLite3Config, apbConfig:Apb3Config) extends Component{
  val ahb = slave(AhbLite3(ahbConfig))
  val apb = master(Apb3(apbConfig))
  val bridge = AhbLite3ToApb3Bridge(ahbConfig,apbConfig)
  ahb <> bridge.io.ahb
  apb <> bridge.io.apb
}
object Top10 {
  def main(args: Array[String]) {
    val Plott = new Plot_All(SpinalVerilog(new Top10(AhbLite3Config(16,32),Apb3Config(16,32))))
   Plott.plot_All
  }
}