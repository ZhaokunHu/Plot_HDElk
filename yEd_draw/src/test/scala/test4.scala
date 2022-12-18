import spinal.core._
import huitu._
class top4 extends Component {
  val io = new Bundle {
    val a = in Bool()
    val b = out Bool()
  }
  io.b:=io.a
}
object top4 {
  def main(args: Array[String]): Unit = {
    val rtl = SpinalVerilog(new top4)
    val lettry = new yEd(rtl.toplevel)
    lettry.begindraw
//    val letread = new readsystem(rtl.toplevel)
//    letread.beginread
//    val letdraw = new draw(rtl.toplevel)
//    letdraw.begindraw
  }
}
