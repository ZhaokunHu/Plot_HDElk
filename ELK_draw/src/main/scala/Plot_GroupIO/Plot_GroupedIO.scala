package Plot_GroupIO

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core.Component

import java.io.{File, FileWriter}
import scala.collection.mutable
import scala.collection.mutable.Set
import scala.util.control._
class Edge {
  var source, target,label = ""
  var isBus,highlight = 0
}

class Node {
  var labelname = ""
  var inports: Set[String] = Set()
  var outports: Set[String] = Set()
  var children: Set[Node] = Set()
  var highlight=0
}


class PlotGroupedIO(module:Component,toplevelName:String,moduleName:String) {
  val fileName = toplevelName + "_All.html"
  val file = new File(fileName)
  val edges: Set[Edge] = Set()
  val pw = new FileWriter(file, true)
  val topNode = new Node
  topNode.labelname = moduleName
  val clkMap=new mutable.HashMap[String,Int]
  var clkCounter=0
  //初始化一些数据
  def DealAllSignal: Unit = {

    val moduleAnalyze = new ModuleAnalyzer(module)
    val allClk = moduleAnalyze.getClocks
    for (thisClk <- allClk) {
      clkCounter += 1
      clkMap.put(thisClk.toString(), clkCounter + 1)
    }
//生成clk的颜色映射


    val toplevelIO = module.getGroupedIO(true)
    for (inOutPort <- toplevelIO) {
      val thisName = inOutPort.getName()
      if (inOutPort.flatten.head.isInput) topNode.inports.add(thisName)
      else topNode.outports.add(thisName)
    }
//添加顶层模块
    var allGroupedIO=toplevelIO
    val innerModules = module.children
    for (innerModule <- innerModules) {
      val newNode = new Node
      newNode.labelname = innerModule.getName()
      val clks=new ModuleAnalyzer(innerModule).getClocks
      if(clks.size>1) newNode.highlight=6
      else if(clks.size==1) newNode.highlight=clkMap(clks.head.toString())
      allGroupedIO=allGroupedIO++innerModule.getGroupedIO(true)
      for (inOutPort <- innerModule.getGroupedIO(true)) {
        val thisName = inOutPort.getName()
        if (inOutPort.flatten.head.isInput) newNode.inports.add(thisName)
        else newNode.outports.add(thisName)
      }
      topNode.children.add(newNode)
    }
    val innerGroupedIO=allGroupedIO.filter(thisIO=> !toplevelIO.contains(thisIO))
//添加内部子模块



    val allInOuts = moduleAnalyze.getInputs ++ moduleAnalyze.getOutputs
    val allRegisters = moduleAnalyze.getRegisters
    println(allRegisters)
    val systemRegisters = moduleAnalyze.getNets(net => net.getComponent().getName() == module.getName()&& !allInOuts.contains(net) && !allRegisters.contains(net))
    //区分系统寄存器


    for (toplevelRegister <- allRegisters) {
      val newNode = new Node
      newNode.labelname = toplevelRegister.getName()
      newNode.highlight=clkMap(toplevelRegister.clockDomain.toString())
      topNode.children.add(newNode)
    }
    //添加寄存器

    val systemRegister = new Node
    systemRegister.labelname = "systemRegister"
    var needSR = false
    //初始化系统寄存器



    val allNets = allRegisters ++ moduleAnalyze.getPins(_ => true) ++ systemRegisters

    for (net <- allNets) {
      var sourceName = ""
      var inIsBus = 0
      var netIsWrong=false
      for (inOutPort <- toplevelIO) {
        if (inOutPort.flatten.contains(net) && inOutPort.flatten.head.isOutput)
          netIsWrong = true
      }
      for(innerInOutPort<-innerGroupedIO){
        if(innerInOutPort.flatten.contains(net)&&innerInOutPort.flatten.head.isInput)
          netIsWrong = true
      }
      if (allInOuts.contains(net)) {
        for (inOutPort <- toplevelIO) {
          if (inOutPort.flatten.contains(net)) {
            sourceName = topNode.labelname + "." + inOutPort.getName()
            if (inOutPort.flatten.size > 1) inIsBus = 1
          }
        }
      }
      else if (allRegisters.contains(net)) {
        sourceName = net.getName()
      }
      else if (systemRegisters.contains(net)) {
        needSR = true
        sourceName = "systemRegister"
      }
      else {
        for (innerModule <- innerModules) {
          if (innerModule.getName() == net.getComponent().getName()) {
            val innerInOuts = innerModule.getGroupedIO(true)
            for (innerInOut <- innerInOuts) {
              if (innerInOut.flatten.contains(net)) {
                sourceName = innerModule.getName() + "." + innerInOut.getName()
                if (innerInOut.flatten.size > 1) inIsBus = 1
              }
            }
          }
        }
      }
//处理线起点


      val dataAnalyze = new DataAnalyzer(net)
      val fanOuts = dataAnalyze.getFanOut
//      println(net+":  "+net.parent+":"+allGroupedIO.contains(net.parent))
//      if(sourceName=="myArea_myReg")  println(fanOuts)
      val loop = new Breaks
      loop.breakable{
        for (fanOut <- fanOuts) {
          if (net.getComponent().getName() == module.getName() && fanOut.getComponent().getName() == module.getName() && net.isInput && fanOut.isOutput) {
            val newNode = new Node
            val newEdge = new Edge
            for (inOutPort <- toplevelIO) {
              if (inOutPort.flatten.contains(net)){
                newNode.labelname=inOutPort.getName()
                if(inOutPort.flatten.size>1)  newEdge.isBus=1
              }
            }
            topNode.children.add(newNode)
            newEdge.source = sourceName
            newEdge.target = newNode.labelname
            edges.add(newEdge)
            sourceName = newNode.labelname
            loop.break()
          }
        }
      }
//处理输入直连到输出的连接
      for (fanOut <- fanOuts) {

        val newEdge = new Edge
        if (clkMap.contains(net.getName())) newEdge.highlight = clkMap(net.getName())
        var fanoutIsWrong = false
        for (inOutPort <- toplevelIO)
          if (inOutPort.flatten.contains(fanOut) && inOutPort.flatten.head.isInput)
            fanoutIsWrong = true
        for (innerInOutPort <- innerGroupedIO) {
          if (innerInOutPort.flatten.contains(fanOut) && innerInOutPort.flatten.head.isOutput)
            fanoutIsWrong = true
        }
        var outIsBus = 0
        if (systemRegisters.contains(fanOut)) {
          needSR = true
          newEdge.target = "systemRegister"
        }
        else if (allRegisters.contains(fanOut)) {
          newEdge.target = fanOut.getName()
        }
        else if (!((net.getComponent().getName() !=module.getName()) && fanOut.getComponent() == net.getComponent())) {
          newEdge.source = sourceName
          if (allInOuts.contains(fanOut)) {
            for (inOutPort <- toplevelIO) {
              if (inOutPort.flatten.contains(fanOut)) {
                newEdge.target = topNode.labelname + "." + inOutPort.getName()
                if (inOutPort.flatten.size > 1) outIsBus = 1
              }
            }
          }
          else {
            for (innerModule <- innerModules) {
              if (innerModule.getName() == fanOut.getComponent().getName()) {
                val innerInOuts = innerModule.getGroupedIO(true)
                for (innerInOut <- innerInOuts) {
                  if (innerInOut.flatten.contains(fanOut)) {
                    newEdge.target = innerModule.getName() + "." + innerInOut.getName()
                    if (innerInOut.flatten.size > 1) outIsBus = 1
                  }
                }
              }
            }
          }
        }
        newEdge.source = sourceName
        newEdge.isBus = inIsBus & outIsBus
        if(newEdge.isBus==1){
          for(inOutPort <- allGroupedIO){
            if(inOutPort.flatten.contains(fanOut))
              newEdge.label=inOutPort.getClass.getSimpleName
          }
        }
        var isContined = false
        for (thisEdge <- edges) {
          if (thisEdge.source == newEdge.source && thisEdge.target == newEdge.target)
            isContined = true
        }
        if (!netIsWrong && !fanoutIsWrong && !isContined && newEdge.source != "" && newEdge.target != "")
          edges.add(newEdge)
      }
    }
    if (needSR) topNode.children.add(systemRegister)
  }


  def drawNodes(thisNode: Node): Unit = {
    pw.write("{id:\"" + thisNode.labelname + "\",\n")
    if(thisNode.highlight!=0)
      pw.write(s"highlight:${thisNode.highlight},\n")
    if (thisNode.inports.nonEmpty) {
      pw.write("inPorts: [")
      for (inport <- thisNode.inports) pw.write("\"" + inport + "\",")
      pw.write("],\n")
    }
    if (thisNode.outports.nonEmpty) {
      pw.write("outPorts: [")
      for (outport <- thisNode.outports) pw.write("\"" + outport + "\",")
      pw.write("],\n")
    }
    if (thisNode.children.nonEmpty) {
      pw.write("children: [\n")
      for (thischildren <- thisNode.children) drawNodes(thischildren)
      pw.write("],\n")
    }
    if (thisNode == topNode) drawedges
    pw.write("},\n")
  }

  def drawedges: Unit = {
    pw.write("edges:[\n")
    for (edge <- edges) {
      pw.write("{ source:\"" + edge.source + "\", target:\"" + edge.target + "\",bus: " + edge.isBus+",")
      if(edge.label!="")
        pw.write("label:\""+edge.label+"\",")
      if(edge.highlight!=0)
        pw.write(s"highlight:${edge.highlight}")
      pw.write(" },\n")
    }
    pw.write("]\n")
  }

  def begindraw = {

    pw.write("<div id=\""+topNode.labelname+"\"></div>\n<h3>"+topNode.labelname+"</h3><br><br>\n<script type=\"text/javascript\">\n\nvar mygraph = {\nchildren:[\n")
    DealAllSignal
    drawNodes(topNode)
    pw.write("],\n}\nhdelk.layout( mygraph, \""+topNode.labelname+"\" );\n</script>")
    pw.close()
  }

}
