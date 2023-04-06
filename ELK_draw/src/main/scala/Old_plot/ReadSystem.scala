package Old_plot
import spinal.core._
import spinal.core.internals._
import spinal.lib.tools.ModuleAnalyzer

import scala.util.control.Breaks


class ReadSystem(rtl: SpinalReport[Component]) extends App {

  def beginread: Unit = {

    val module=rtl.toplevel
    def haveParent(thisSon:BaseType):Boolean={
      var judge=false
      val parentList = thisSon.getRefOwnersChain()
      if(parentList.nonEmpty){
        for (anyParent <- parentList){
          if(anyParent.isInstanceOf[Data]) {
            val DataParent = anyParent.asInstanceOf[Data]
            if ( DataParent.getClass.getSimpleName != "") {
              judge=true
            }
          }
//          else if(anyParent.isInstanceOf[InitAssignmentStatement]||anyParent.isInstanceOf[InitialAssignmentStatement])
//            println("found!!!")
        }
      }
      judge
    }
    def haveRegParent(thisSon:BaseType):Boolean={
      var judge = false
      val parentList = thisSon.getRefOwnersChain()
      if(parentList.nonEmpty&& parentList.size>1){
        if(parentList.last.getClass.getSimpleName==""&& !parentList.last.isInstanceOf[Data]){
          judge=true
        }

      }
      judge
    }
    def findRegParent(thisSon: BaseType): String ={
      val anyParent = thisSon.getRefOwnersChain().last
      val parentName=anyParent.toString.split("/").last
      parentName
    }
//          else{
////            println("wrongg:::"+anyParent.getClass)
//          }
//          else if (anyParent.isInstanceOf[BaseType]) {
//            println("!!!!!1found:" + anyParent)
//          }
//          else if (anyParent.isInstanceOf[MemPortStatement]) {
//            println("!!!!!1found:" + anyParent)
//          }
//          else if (anyParent.isInstanceOf[BaseType]) {
//            println("!!!!!1found:" + anyParent)
//          }
//          else if (anyParent.isInstanceOf[AssignmentExpression]) {
//            println("!!!!!1found:" + anyParent)
//          }
//          else {
////            println("!!!!!1found:" +anyParent.toString)
//          }

    def findParent2(thisSon: BaseType): Data = {
      val parentList = thisSon.getRefOwnersChain()
      var returnParent = thisSon.parent
      val loop = new Breaks
      loop.breakable {
        for (anyParent <- parentList) {
          if (anyParent.isInstanceOf[Data]){
            val DataParent = anyParent.asInstanceOf[Data]
            if (DataParent.getClass.getSimpleName != "") {
              if (DataParent.getName() != "") {
                returnParent = DataParent
                loop.break()
              }
              else {
                DataParent.setName("_zz_(" + DataParent.getClass.getSimpleName + ")")
                returnParent = DataParent
                loop.break()
              }
            }
          }
        }
      }
      returnParent
    }
//    println(mmIO)
//  }
//    println(s"GroupIO"+groupIO+"\n")
//    for(element<-groupIO){
//      println(element+":")
//      println(element.flatten+"\n")
////      val dataana=new DataAnalyzer(element.flatten)
//    }
    val anal=new ModuleAnalyzer(module)
//    val Ip = anal.getInputs
//  for(iji<-Ip){
//    println(iji)
//    println(iji.flatten)
//  }

//    val Op = anal.getOutputs
//    println("输出："+Op+"\n")
//    val Cl=anal.getClocks
//    println("时钟："+Cl+"\n")
//    val Ce=anal.getCells(_=>true)
//    println("cells："+Ce+"\n")
//    val LibCe = anal.getCells(_ => true)
//    println("Libcells：" + LibCe + "\n")
    val Ne=anal.getNets(_=>true)
    for(wire<-Ne){
      if(haveParent(wire)) {
        println(wire+":"+findParent2(wire))
      }
      else if(haveRegParent(wire)){
        println(wire+":"+findRegParent(wire))
      }
      //      else {
////        println(wire+"   praent:"+wire.parent)
//      }
    }
//    val Pi = anal.getPins(_ => true)
//    println("Pins：" + Pi + "\n")
//  val allNets=anal.getRegisters++anal.getPins(_=>true)
//  println(allNets)
////    readfans(Pi)
//    val LibPi = anal.getLibPins(_ => true)
////    readfans(LibPi)
//    println("LibPins：" + LibPi + "\n")
//    val Po = anal.getPorts(_ => true)
//    println("Ports：" + Po + "\n")

  }
}
