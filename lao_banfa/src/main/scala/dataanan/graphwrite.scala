package dataanan

import com.sun.tools.javac.jvm.PoolConstant.LoadableConstant.String
import spinal.core.Module

import java.io._

class graphwriter (module: Module) {
  def graphwrite: Unit = {
    var cou=0
    val anal = new ModuleAnalyzer(module)
    val file = new File("mygraph.puml")
    val pw = new PrintWriter(file)
    pw.write("@startuml\n")
    val tp = module.getClass.getSimpleName
    pw.write("package ")
    pw.write(tp)
    pw.write("{\n")
    val Ip = anal.getInputs
    while (!Ip.isEmpty) {
      val fans = new DataAnalyzer(Ip.head)
      pw.write("()")
      pw.write(Ip.head.getName())
      pw.write("\n")
      val fan = fans.getFanIn
      while (!fan.isEmpty) {
        if (!fan.head.getName().isEmpty) {
          pw.write(fan.head.getName())
        }
        else {
          cou = cou + 1
          pw.write(fan.head.getClass.getSimpleName + cou)
        }
        pw.write("-->")
        pw.write(Ip.head.getName() + "\n")
        fan.remove(fan.head)
      }
      Ip.remove(Ip.head)
    }
    val Rg = anal.getRegisters
    println(Rg)
    while (!Rg.isEmpty) {
      pw.write("map ")
      if(!Rg.head.getName().isEmpty)pw.write(Rg.head.getName())
      else {
        cou = cou + 1
        pw.write(Rg.head.getClass.getSimpleName + cou)
      }
      pw.write("{\nD=>Q\nCLR=>\n}")
      val fans = new DataAnalyzer(Rg.head)
      val fan = fans.getFanIn
      println(fan)
      pw.write("\n")
      while (!fan.isEmpty) {
        if (!fan.head.getName().isEmpty) {
          pw.write(fan.head.getName())
        }
        else {
          cou=cou+1
          pw.write(fan.head.getClass.getSimpleName+cou)
        }
        pw.write("-->")
        if (!Rg.head.getName().isEmpty) pw.write(Rg.head.getName())
        else {
          cou = cou + 1
          pw.write(Rg.head.getClass.getSimpleName + cou)
        }
        pw.write("\n")
        fan.remove(fan.head)
      }
      Rg.remove(Rg.head)
    }
    val Op = anal.getOutputs
    while (!Op.isEmpty) {
      val fans = new DataAnalyzer(Op.head)
      pw.write("()")
      pw.write(Op.head.getName())
      pw.write("\n")
      val fan = fans.getFanIn
      println(fan)
      while (!fan.isEmpty) {
        if (!fan.head.getName().isEmpty) {
          pw.write(fan.head.getName())
        }
        else {
          cou = cou + 1
          pw.write(fan.head.getClass.getSimpleName + cou)
        }
        pw.write("-->")
        pw.write(Op.head.getName() + "\n")
        fan.remove(fan.head)
      }
      Op.remove(Op.head)
    }
    pw.write("\n}\n@enduml")
    pw.close()
  }
}