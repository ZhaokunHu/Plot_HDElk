import dataanan._
import spinal.core._
import spinal.lib._

class MyTry extends Component {
  val io = new Bundle {
    val a = in Bool()
    val b = out Bool()
  }
  io.b:=io.a
}
object MyTry {
  def main(args: Array[String]): Unit = {
    val rtl = SpinalVerilog(new MyTry)
    val letread = new readsystem(rtl.toplevel)
    letread.beginread
    val letdraw = new draw(rtl.toplevel)
    letdraw.begindraw
  }
}
