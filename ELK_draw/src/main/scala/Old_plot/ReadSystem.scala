package Old_plot
import analyzer.ModuleAnalyzer
import spinal.core._

class ReadSystem(rtl: SpinalReport[Component]) extends App {
//  def readfans(sets:mutable.LinkedHashSet[BaseType]): Unit ={
//    while (!sets.isEmpty) {
//      val fans = new DataAnalyzer(sets.head)
//      println(sets.head + ":\n")
//      if(fans.getFanIn.nonEmpty){
//        val fanin = fans.getFanIn.head.getPartialName()
//        println("    扇入：" + fanin+ "\n")
//      }
//      if(fans.getFanOut.nonEmpty){
//        val fanout = fans.getFanOut.head.getPartialName()
//        println("    扇出：" + fanout + "\n")
//      }
//      sets.remove(sets.head)
//    }
//  }
  def beginread: Unit = {
    val module=rtl.toplevel
    val anal=new ModuleAnalyzer(module)
    val Ip = anal.getInputs
    println("输入:"+Ip+"\n")
    val Rg = anal.getRegisters
    println("寄存器："+Rg+"\n")
    val Op = anal.getOutputs
    println("输出："+Op+"\n")
    val Cl=anal.getClocks
    println("时钟："+Cl+"\n")
    val Ce=anal.getCells(_=>true)
    println("cells："+Ce+"\n")
    val LibCe = anal.getCells(_ => true)
    println("Libcells：" + LibCe + "\n")
    val Ne=anal.getNets(_=>true)
    println("wires："+Ne+"\n")
    val Pi = anal.getPins(_ => true)
    println("Pins：" + Pi + "\n")
//    readfans(Pi)
    val LibPi = anal.getLibPins(_ => true)
//    readfans(LibPi)
    println("LibPins：" + LibPi + "\n")
    val Po = anal.getPorts(_ => true)
    println("Ports：" + Po + "\n")

  }
}
