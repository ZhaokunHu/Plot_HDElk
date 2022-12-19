import huitu._
import spinal.core._
import spinal.lib._


class MYSub0(cd: ClockDomain) extends Component {
  val io = new Bundle{
    val ai = in UInt(8 bits)
    val ao = out UInt(8 bits)
  }
  io.ao := RegNext(io.ai) init(0)
}

class MYSub1(cd: ClockDomain) extends Component {
  val io = new Bundle{
    val ai = in UInt(8 bits)
    val ao = out UInt(8 bits)
    val a2 = out UInt(8 bits)
  }
  io.ao := RegNext(io.ai) init(0)
  val cd2 = ClockDomain.external("adc")
  //alow another clockDomain not confict to default clockdomain
  val area = new ClockingArea(cd2){
    val tmp = RegNext(io.ai) init(0)
    val tmp2 = tmp + (RegNext(io.ai) init(0))
  }
  io.a2 := area.tmp2
}

class Top00 extends Component {
  val io = new Bundle{
    val a = in UInt(8 bits)
    val b0 = out UInt(8 bits)
    val b1 = out UInt(8 bits)
    val b2 = out UInt(8 bits)
  }
  val cd0 = ClockDomain.external("cp")
  val cd1 = ClockDomain.external("ap")

  val u_sub0 = cd0(new MYSub0(cd0)) // set u_sub0's default clockDomain with cd0
  val u_sub1 = cd1(new MYSub1(cd1)) // it allow anoter clockDomain in ther module

  u_sub0.io.ai := io.a
  u_sub1.io.ai := io.a

  io.b0 := u_sub0.io.ao
  io.b1 := u_sub1.io.ao
  io.b2 := u_sub1.io.a2

  val tmp = RegNext(io.a) init(0)
}

object Top6{
  def main(args: Array[String]): Unit = {
    val rtl=SpinalVerilog(new Top00)
    val letread = new readsystem(rtl.toplevel)
    letread.beginread
    val letdraw = new draw(rtl.toplevel)
    letdraw.begindraw
    val lettry = new yEd(rtl.toplevel)
    lettry.begindraw
  }
}
