package dataanan
import dataanan._
import spinal.core._
import spinal.lib.tools._

import java.io._
import scala.collection.mutable
import scala.language._

class readsystem (module: Module) {
  def readfans(sets:mutable.LinkedHashSet[BaseType]): Unit ={
    import ModuleAnalyzer._
    while (!sets.isEmpty) {
      val fans = new DataAnalyzer(sets.head)
      val fanin = fans.getFanIn
      val fanout = fans.getFanOut
      println(sets.head+":\n")
      println("    扇入：" + fanin+ "\n")
      println("    扇出：" + fanout + "\n")
      sets.remove(sets.head)
    }
  }
  def beginread: Unit = {
    val anal = new ModuleAnalyzer(module)
    val file = new File("mygraph.dig")
    val pw = new PrintWriter(file)
    val tp = module.getClass.getSimpleName
    println("模块名:"+tp+"\n")
    val Ip = anal.getInputs
    println("输入:"+Ip+"\n")
    val Rg = anal.getRegisters
    println("寄存器："+Rg+"\n")
    val Op = anal.getOutputs
    println("输出："+Op+"\n")
    val Cl=anal.getClocks
    println("时钟："+Cl+"\n")
    pw.close()
    val Ce=anal.getCells(_=>true)
    println("cells："+Ce+"\n")
    val LibCe = anal.getCells(_ => true)
    println("Libcells：" + LibCe + "\n")
    val Ne=anal.getNets(_=>true)
    println("wires："+Ne+"\n")
    val Pi = anal.getPins(_ => true)
    println("Pins：" + Pi + "\n")
    readfans(Pi)
    val LibPi = anal.getLibPins(_ => true)
    readfans(LibPi)
    println("LibPins：" + LibPi + "\n")
    val Po = anal.getPorts(_ => true)
    println("Ports：" + Po + "\n")

  }
}
//getComponent