import Old_plot._
import Plot_GroupIO.Plot_All
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

class Top6 extends Component {
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

object TopExample1{
  def main(args: Array[String]): Unit = {
    val Plott = new Plot_All(SpinalVerilog(new Top6))
    Plott

//    val drawInner=new Plot_Inner_Module(SpinalVerilog(new Top6))
//    drawInner.begindraww
//    val drawyed = new Plot_yEd(rtl.toplevel)
//    drawyed.begindraw
//    val letread = new ReadSystem(SpinalVerilog(new Top6))
//    letread.beginread
//    val letdraw = new Plot_UML(rtl.toplevel)
//    letdraw.begindraw
//    val drawELK = new Plot_ELK(rtl.toplevel)
//    drawELK.begindraw
//    val letread = new ReadSystem(SpinalVerilog(new Top6))
//    letread.beginread
  }
}
