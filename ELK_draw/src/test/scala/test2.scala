import Old_plot._
import Plot_All.Plot_All
import spinal.core._
import spinal.lib._
class AdderCell extends Component {
  //Declaring all in/out in an io Bundle is probably a good practice
  val io = new Bundle {
    val a, b, cin = in Bool()
    val sum, cout = out Bool()
  }
  //Do some logic
  io.sum := io.a ^ io.b ^ io.cin
  io.cout := (io.a & io.b) | (io.a & io.cin) | (io.b & io.cin)
}
class Adder(width: Int) extends Component {

  //Create 2 AdderCell
  //  val cell0 = new AdderCell
  //  val cell1 = new AdderCell
  //  cell1.io.cin := cell0.io.cout   //Connect cout of cell0 to cin of cell1

  // Another example which create an array of ArrayCell
  val cellArray = Array.fill(width)(new AdderCell)
  for(b<-1 until width)
    cellArray(b).io.cin := cellArray(b-1).io.cout
  //Connect cout of cell(0) to cin of cell(1)
}
object Top2 {
  def main(args: Array[String]): Unit = {
    val rtl=SpinalVerilog(new Adder(3))
    val plot=new Plot_All(SpinalVerilog(new Adder(3)))
    plot.plot_All
//    val letread = new ReadSystem(SpinalVerilog(new Adder(3)))
//    letread.beginread
//    val test=new Deal_Wires
//    test(rtl.toplevel) /
//    val letread = new ReadSystem(rtl.toplevel)
//    letread.beginread
    val letdraw = new Plot_UML(rtl.toplevel)
    letdraw.begindraw

  }
}
