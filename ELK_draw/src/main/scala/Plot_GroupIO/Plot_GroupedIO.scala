package Plot_GroupIO

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core.{Component, SpinalReport}

import java.io.{File, FileWriter}
import scala.collection.mutable.Set

class Edge {
  var source, target = ""
  var isBus = 0
}

class Node {
  var labelname = ""
  var inports: Set[String] = Set()
  var outports: Set[String] = Set()
  var children: Set[Node] = Set()
}


class PlotGroupedIO(rtl: SpinalReport[Component]) {
  val module = rtl.toplevel
  val fileName = rtl.toplevelName + "_All.html"
  val file = new File(fileName)
  val edges: Set[Edge] = Set()
  val pw = new FileWriter(file, true)
  val topNode = new Node

  def DealAllSignal: Unit = {
    topNode.labelname = rtl.toplevelName
    val toplevelIO = module.getGroupedIO(true)
    for (inOutPort <- toplevelIO) {
      val thisName = inOutPort.getName()
      if (inOutPort.flatten.head.isInput) topNode.inports.add(thisName)
      else topNode.outports.add(thisName)
    }
    val innerModules = module.children
    for (innerModule <- innerModules) {
      val newNode = new Node
      newNode.labelname = innerModule.getName()
      for (inOutPort <- innerModule.getGroupedIO(true)) {
        val thisName = inOutPort.getName()
        if (inOutPort.flatten.head.isInput) newNode.inports.add(thisName)
        else newNode.outports.add(thisName)
      }
      topNode.children.add(newNode)
    }


    val moduleAnalyze = new ModuleAnalyzer(module)
    val allInOuts = moduleAnalyze.getInputs ++ moduleAnalyze.getOutputs
    val allRegisters = moduleAnalyze.getRegisters
    val systemRegisters = moduleAnalyze.getNets(net => net.getComponent().getName() == "toplevel" && !allInOuts.contains(net) && !allRegisters.contains(net))
    for (toplevelRegister <- allRegisters) {
      val newNode = new Node
      newNode.labelname = toplevelRegister.getName()
      topNode.children.add(newNode)
    }
    val systemRegister = new Node
    systemRegister.labelname = "systemRegister"
    var needSR = false
    val allNets = allRegisters ++ moduleAnalyze.getPins(_ => true) ++ systemRegisters
    for (net <- allNets) {
      var sourceName = ""
      var inIsBus = 0
      var netIsOutput=false
      for (inOutPort <- toplevelIO)
        if (inOutPort.flatten.contains(net) && inOutPort.flatten.head.isOutput)
          netIsOutput = true
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



      val dataAnalyze = new DataAnalyzer(net)
      val fanOuts = dataAnalyze.getFanOut
      for (fanOut <- fanOuts) {
        var fanoutIsInput = false
        for (inOutPort <- toplevelIO)
          if (inOutPort.flatten.contains(fanOut) && inOutPort.flatten.head.isInput)
            fanoutIsInput = true
        var outIsBus = 0
        val newEdge = new Edge
        if (systemRegisters.contains(fanOut)) {
          needSR = true
          newEdge.target = "systemRegister"
        }
        else if (allRegisters.contains(fanOut)) {
          newEdge.target = fanOut.getName()
        }
        else if (!(net.getComponent().getName() != "toplevel" && fanOut.getComponent() == net.getComponent())) {
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
        var isContined = false
        for (thisEdge <- edges) {
          if (thisEdge.source == newEdge.source && thisEdge.target == newEdge.target)
            isContined = true
        }
        if (!netIsOutput && !fanoutIsInput && !isContined && newEdge.source != "" && newEdge.target != "")
          edges.add(newEdge)
      }
    }
    if (needSR) topNode.children.add(systemRegister)
  }


  def drawNodes(thisNode: Node): Unit = {
    pw.write("{id:\"" + thisNode.labelname + "\",\n")
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
      pw.write("{ source:\"" + edge.source + "\", target:\"" + edge.target + "\",bus: " + edge.isBus + " },\n")
    }
    pw.write("]\n")
  }

  def begindraw = {
    pw.write("<div id=\"Toplevel_GroupedIO\"></div>\n<h3>Toplevel_GroupedIO</h3><br><br>\n<script type=\"text/javascript\">\n\nvar mygraph = {\nchildren:[\n")
    DealAllSignal
    drawNodes(topNode)
    pw.write("],\n}\nhdelk.layout( mygraph, \"Toplevel_GroupedIO\" );\n</script>")
    pw.close()
  }

}
