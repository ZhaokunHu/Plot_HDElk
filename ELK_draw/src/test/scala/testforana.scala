import analyzer.DataAnalyzer.toAnalyzer
import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core._

import scala.collection.mutable
import analyzer.{DataAnalyzer, ModuleAnalyzer}

case class TestModule() extends Module {
  val io = new Bundle {
    val a = in Bits (3 bit)
    val b = out Bits (3 bit)
  }

  val a0 = io.a(0)
  val a1 = RegNext(io.a(1))
  val a2_1 = RegNext(io.a(2))
  val a2 = RegNext(a2_1)

  io.b := (a2, a1, a0).asBits
}

object Top9{
  def main(args: Array[String]): Unit = {
    val rtl = SpinalVerilog(TestModule())
    val allSignals=new ModuleAnalyzer(rtl.toplevel).getNets(_=>true)
    for(signal<-allSignals)
    {
      println("signal"+signal+":\n")
      println("    fanouts:"+signal.getFanOut+"\n")
      println("    fanins:"+signal.getFanIn+"\n")
    }
    println(rtl.toplevel.getGroupedIO(true))
  }
}