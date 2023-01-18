package tests

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core._

import java.io.{File, PrintWriter}
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
  var edges: Set[Edge] = Set()
}

class JudgeType {
  var signalname, typename, conbinename, familyname = ""
}

class DeletedSignal {
  var signalname, familyname = ""
}

class Plot_ELK_BUS(rtl: SpinalReport[Component]) {
  val module = rtl.toplevel
  val fileName = rtl.toplevelName + "_BUS.html"
  val file = new File(fileName)
  val pw = new PrintWriter(file)
  val edges: Set[Edge] = Set()
  val judgement: Set[JudgeType] = Set()
  val allDeleted: Set[DeletedSignal] = Set()
  val topnode = new Node
  topnode.labelname = "toplevel"

  def dealwires = {
    val moduleanalyze = new ModuleAnalyzer(module)
    val allnets = moduleanalyze.getNets(_ => true)
    val allnets2 = moduleanalyze.getNets(_ => true)
    val allinputs = moduleanalyze.getInputs
    val alloutputs = moduleanalyze.getOutputs
    for (net <- allnets) {
      val thisname = net.getName()
      if (thisname.contains("_valid")) {
        val familyName = thisname.split("_valid")(0)
        val newJudge = new JudgeType
        var flowOrstream = 0
        for (othersnet <- allnets2) {
          if (othersnet.getName().contains(familyName)) {
            val othernameSplit = othersnet.getName().split(familyName)(1)
            val firstSplit = othernameSplit.split("_")(1)
            if (firstSplit == "payload" || firstSplit == "ready") {
              if (othersnet.getName().contains("_payload")) {
                val newdelete = new DeletedSignal
                newdelete.signalname = othersnet.getName()
                newdelete.familyname = familyName
                allDeleted.add(newdelete)
                allnets.remove(othersnet)
              }
              else if (othersnet.getName().contains("_ready")) {
                flowOrstream = 1
                val newdelete = new DeletedSignal
                newdelete.signalname = othersnet.getName()
                newdelete.familyname = familyName
                allDeleted.add(newdelete)
                allnets.remove(othersnet)
              }
            }
          }
        }
        newJudge.signalname = thisname
        newJudge.familyname = familyName
        if (flowOrstream == 1) newJudge.typename = "Stream"
        else newJudge.typename = "Flow"
        newJudge.conbinename = familyName + "_" + newJudge.typename
        judgement.add(newJudge)
      }
    }
    for (net <- allnets) {
      val thisgroupname = net.getComponent().getName()
      var thisname = net.getName()
      for (judge <- judgement) {
        if (judge.signalname == thisname) {
          thisname = judge.conbinename
        }
      }
      if (thisgroupname == "toplevel") {
        if (allinputs.contains(net)) topnode.inports.add(thisname)
        else if (alloutputs.contains(net)) topnode.outports.add(thisname)
        else {
          val newnode = new Node
          newnode.labelname = thisname
          topnode.children.add(newnode)
        }
      }
      else {
        var iscontained = 0
        val newnode = new Node
        newnode.labelname = thisname
        for (node <- topnode.children) {
          if (node.labelname == thisgroupname) iscontained = 1
        }
        if (iscontained == 0) {
          val newtopnode = new Node
          newtopnode.labelname = net.getComponent().getName()
          topnode.children.add(newtopnode)
        }
        for (node <- topnode.children) {
          if (node.labelname == thisgroupname) {
            val dataanalyze = new DataAnalyzer(net)
            val fanins = dataanalyze.getFanIn
            val fanouts = dataanalyze.getFanOut
            for (fanin <- fanins) {
              if (fanin.getComponent().getName() != thisgroupname) {
                node.inports.add(thisname)
              }
            }
            for (fanout <- fanouts) {
              if (fanout.getComponent().getName() != thisgroupname) {
                node.outports.add(thisname)
              }
            }
          }
        }
      }
      val dataana = new DataAnalyzer(net)
      val fanouts = dataana.getFanOut
      for (fanout <- fanouts) {
        var fanoutname = fanout.getName()
        val newedge = new Edge
        if (allnets.contains(fanout)) {
          var sourceisBus, targetisBus = 0
          for (judge <- judgement) {
            if (judge.signalname == net.getName())
              sourceisBus = 1
            if (judge.signalname == fanout.getName()) {
              fanoutname = judge.conbinename
              targetisBus = 1
            }
          }
          if (sourceisBus == 1 && targetisBus == 1) newedge.isBus = 1
        }
        else {
          for (signal <- allDeleted) {
            if (signal.signalname == fanout.getName()) {
              for (judge <- judgement) {
                if (judge.familyname == signal.familyname) {
                  fanoutname = judge.conbinename
                }
              }
            }
          }
        }
        newedge.source = thisname
        if (thisgroupname != "toplevel")
          newedge.source = thisgroupname + "." + newedge.source
        else if (allinputs.contains(net))
          newedge.source = "toplevel." + newedge.source
        newedge.target = fanoutname
        if (fanout.getComponent().getName() != "toplevel")
          newedge.target = fanout.getComponent().getName() + "." + newedge.target
        else if (alloutputs.contains(fanout))
          newedge.target = "toplevel." + newedge.target
        if (newedge.target != newedge.source)
          if (thisgroupname == "toplevel" || thisgroupname != fanout.getComponent().getName())
            edges.add(newedge)
      }
    }
  }

  def drawnodes(thisnode: Node): Unit = {
    pw.write("{id:\"" + thisnode.labelname + "\",\n")
    if (thisnode.inports.nonEmpty) {
      pw.write("inPorts: [")
      for (inport <- thisnode.inports) pw.write("\"" + inport + "\",")
      pw.write("],\n")
    }
    if (thisnode.outports.nonEmpty) {
      pw.write("outPorts: [")
      for (outport <- thisnode.outports) pw.write("\"" + outport + "\",")
      pw.write("],\n")
    }
    if (thisnode.children.nonEmpty) {
      pw.write("children: [\n")
      for (thischildren <- thisnode.children) drawnodes(thischildren)
      pw.write("],\n")
    }
    if (thisnode.labelname == "toplevel") drawedges
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
    pw.write("<div id=\"simple_diagram\"></div>\n\n<script src=\"/js/elk.bundled.js\"></script>\n<script src=\"/js/svg.min.js\"></script>\n<script src=\"/js/hdelk.js\"></script>\n\n<script type=\"text/javascript\">\n\nvar mygraph = {\nchildren:[\n")
    dealwires
    drawnodes(topnode)
    pw.write("],\n")
    pw.write("}\nhdelk.layout( mygraph, \"simple_diagram\" );\n</script>")
    pw.close()
  }
}

