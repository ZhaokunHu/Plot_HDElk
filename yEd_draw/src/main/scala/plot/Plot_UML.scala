package plot
import spinal.core._

import java.io._
import scala.collection.mutable.Set

class Plot_UML(module: Module) {
  val file = new File("mygraph.puml")
  val pw = new PrintWriter(file)
  val anal=new ModuleAnalyzer(module)
  val allmodulename=Set(anal.getPins(_=>true).head.getComponent().getDisplayName())

  def dealString(mmm: String): String = {
    var zzz = mmm
    zzz = zzz.replace("[","")
    zzz=zzz.replace("]","")
    zzz=zzz.replace("$","")
    zzz
  }
  def writepackage: Unit ={
    val test=anal.getPins(_=>true)
    while(!test.isEmpty) {
        if(!test.head.getComponent().getDisplayName().isEmpty)
          allmodulename.add(test.head.getComponent().getDisplayName())
        test.remove(test.head)
      }
    while(!allmodulename.isEmpty){
      val test2=anal.getNets(_=>true)
      pw.write("rectangle "+dealString(allmodulename.head)+"{\n")
      while(!test2.isEmpty){
        if(!test2.head.getName().isEmpty)
          if(test2.head.getComponent().getDisplayName()==allmodulename.head) {
            pw.write("()"+dealString(allmodulename.head)+"_"+test2.head.getName()+"\n")
          }
        test2.remove(test2.head)
      }
      pw.write("}\n")
      allmodulename.remove(allmodulename.head)
    }
  }
  def begindraw: Unit = {
    val anal = new ModuleAnalyzer(module)
    pw.write("@startuml\nleft to right direction\n")
    writepackage
    val Op =anal.getNets(_=>true)
    while (!Op.isEmpty) {
      val fans = new DataAnalyzer(Op.head)
      val fanin = fans.getFanIn
      while (!fanin.isEmpty) {
        if(fanin.head.getName()!=Op.head.getName())
          pw.write(dealString(fanin.head.getComponent().getDisplayName())+"_"+fanin.head.getName()+"-->"+dealString(Op.head.getComponent().getDisplayName())+"_"+Op.head.getName()+"\n")
        fanin.remove(fanin.head)
      }
      Op.remove(Op.head)
    }
    pw.write("@enduml")
    pw.close()
  }
}