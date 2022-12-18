import dataanan._
import spinal.core._
import spinal.lib._

class black {
  val c=Bool()
  val d=Bool()
}
class MyTry extends Component {
  val io = new Bundle {
    val a = in Bool()
    val b = out Bool()
  }
  val m=new black
  m.c:=io.a
  m.d:=m.c
  io.b:=m.d
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
