import plot._
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
    val rtl = SpinalVerilog(new Adder(8))
    val drawyed = new Plot_yEd(rtl.toplevel)
    drawyed.begindraw
    val letread = new ReadSystem(rtl.toplevel)
    letread.beginread
    val letdraw = new Plot_UML(rtl.toplevel)
    letdraw.begindraw
  }
}
