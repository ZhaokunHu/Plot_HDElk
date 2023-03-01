import Old_plot.ReadSystem
import Plot_All.Plot_All
import spinal.lib.bus.amba3.apb._
import spinal.core._
import spinal.lib._

class Top9 extends Component{
  val din  =  slave(Apb3(Apb3Config(16,32)))
  val do1  = master(Apb3(Apb3Config( 8,32)))
  val do2  = master(Apb3(Apb3Config(12,32)))
  val do3  = master(Apb3(Apb3Config(12,32)))
  val do4  = master(Apb3(Apb3Config( 2,32)))

  val mux = Apb3Decoder(master = din,
    slaves = List(do1 ->  (0x0000,  64 ),
      do2 ->  (0x1000,1 KiB),
      do3 ->  (0x2000,2 KiB),
      do4 ->  (0x3000,  32 )))
}
object Top9 {
  def main(args: Array[String]) {
    val Plott = new Plot_All(SpinalVerilog(new Top9))
    Plott.plot_All
    val letread = new ReadSystem(SpinalVerilog(new Top9))
    letread.beginread
  }
}
