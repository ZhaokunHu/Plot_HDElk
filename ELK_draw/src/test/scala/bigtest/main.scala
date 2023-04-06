package bigtest

import Old_plot.ReadSystem
import Plot_GroupIO.Plot_All
import bigtest.keyboard._
import spinal.core._
import spinal.lib._
import spinal.lib.bus.avalon._
import spinal.lib.bus.regif._
import spinal.lib.com.uart._
//import spinal.lib.eda.altera._

object GenerateTop extends App {
  new Plot_All(new SpinalConfig(
    defaultClockDomainFrequency = FixedFrequency(50 MHz)
  ).generateVerilog(new TopLevel))

  /*val prj = new QuartusProject(
        "/home/devel/SpinalKeyboardtest/tmp/",
        //"F:/intelFPGA_lite/20.1/quartus/bin64/",
        "../")
  prj.compile()
  prj.program()*/
}

object GenerateIP extends App {
  new Plot_All(
  new SpinalConfig(
    defaultClockDomainFrequency = FixedFrequency(100 MHz)
  ).generateVerilog(new LedMatrix))
  val letread = new ReadSystem(new SpinalConfig(
    defaultClockDomainFrequency = FixedFrequency(100 MHz)
  ).generateVerilog(new LedMatrix))
  letread.beginread
}

object Test extends App {
  case class Top() extends Component {
    val a: Stream[Bits] =  Stream (Bits(8 bits))
    val b: Stream[Bits] =  Stream (Bits(8 bits))

    val t: Stream[Stream[Bits]] = a ~ b

  }

  new Plot_All(new SpinalConfig(
    defaultClockDomainFrequency = FixedFrequency(50 MHz)
  ).generateVerilog(Top()))

//  println(QuartusFlow(
//    quartusPath="F:/intelFPGA_lite/20.1/quartus/bin64/",
//    workspacePath="../tmp/prj/",
//    toplevelPath="../tmp/Top.sv",
//    family="Cyclone IV",
//    device="EP4CE6E22C8",
//    frequencyTarget = 50 MHz
//  ))
}

//    val a: Bits = in Bits(20 bits)
//    val b = Vec(master(Flow(Bool())), 20)
//    val d: Debounce = Debounce(200 us, 1 ms)
//
//    d.key_down := B(0)
//    a <> d.key_down(0, 20 bits)
//    (0 to 19).foreach(i => b(i) := d.keyStatus(i))
