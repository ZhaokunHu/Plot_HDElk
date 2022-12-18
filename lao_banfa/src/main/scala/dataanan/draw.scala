package dataanan
import dataanan._
import spinal.core._
import spinal.lib._

import java.io._
import scala.collection.mutable.Set

class draw (module: Module) {
  val file = new File("mygraph.puml")
  val pw = new PrintWriter(file)
  val anal=new ModuleAnalyzer(module)
  val allmodule=Set(anal.getInputs.head.getComponent().getDisplayName())
  def begingwrite: Unit ={

    val test=anal.getNets(_=>true)
    while(!test.isEmpty) {
        if(!test.head.getComponent().getName().isEmpty)
          allmodule.add(test.head.getComponent().getName())
        test.remove(test.head)
      }
    while(!allmodule.isEmpty){
      val test2=anal.getPins(_=>true)
      println(test2)
      println("register:"+anal.getRegisters)
      pw.write("package ")
      pw.write(allmodule.head)
      pw.write("{\n")

      while(!test2.isEmpty){
        if(!test2.head.getName().isEmpty)
          if(test2.head.getComponent().getName()==allmodule.head) {
            pw.write("()"+test2.head.getName()+"\n")
          }
        test2.remove(test2.head)
      }
      pw.write("}\n")
      allmodule.remove(allmodule.head)
    }
  }
  def begindraw: Unit = {
    val anal = new ModuleAnalyzer(module)
    pw.write("@startuml\n")
    begingwrite
    val Op =anal.getPins(_=>true)
    while (!Op.isEmpty) {
      val fans = new DataAnalyzer(Op.head)
      val fanin = fans.getFanIn
      while (!fanin.isEmpty) {
        if (!fanin.head.getName().isEmpty&&(!Op.head.getName().isEmpty)&&(anal.getPins(_=>true).contains(fanin.head)))
          pw.write(fanin.head.getName()+"-->"+Op.head.getName()+"\n")
        fanin.remove(fanin.head)
      }
      Op.remove(Op.head)
    }
    pw.write("@enduml")
    pw.close()
  }
}