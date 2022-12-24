package tests

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core._

import java.io.{File, PrintWriter}
import scala.collection.mutable.Set

class Node {
  var color, shape, labelname, groupname = ""
}
class Group{
  var labelname,topcolor,belowcolor=""
  var children:Set[Group]=Set()
}
class Edge {
  var source, target = ""
}

class Deal_Wires {
  val file = new File("yEd.graphml")
  val pw = new PrintWriter(file)
  val toplevelgroup = new Group
  val judgegroupname: Set[String] = Set()
  toplevelgroup.topcolor = "#99ccff"
  toplevelgroup.belowcolor = "#caecff84"
  toplevelgroup.labelname = "toplevel"
  val nodes: Set[Node] = Set()
  val edges: Set[Edge] = Set()

  def apply(module: Module) = {
    val moduleanalyze = new ModuleAnalyzer(module)
    val allnets = moduleanalyze.getNets(_ => true)
    val allinputs = moduleanalyze.getInputs
    val alloutputs = moduleanalyze.getOutputs
    while (allnets.nonEmpty) {
      val thisnet = allnets.head
      val thisname = thisnet.getName()
      val thisgroup = thisnet.getComponent()
      val thisgroupname = thisgroup.getName()
      val thisnode = new Node
      if (thisgroupname != "toplevel" && !judgegroupname.contains(thisgroupname)) {
        judgegroupname.add(thisgroupname)
        val newgroup = new Group
        newgroup.topcolor = ""
        newgroup.belowcolor = ""
        newgroup.labelname = thisgroupname
        toplevelgroup.children.add(newgroup)
      }
      if (thisname.contains("payload_")) {
        val solitname = thisname.split("payload_")
        thisnode.groupname = thisgroupname + "::" + solitname(0) + "payload"
        thisnode.labelname = solitname(1)
        val newgroup = new Group
        newgroup.topcolor = ""
        newgroup.belowcolor = ""
        newgroup.labelname = thisnode.groupname
        if (thisgroupname == "toplevel") {
          toplevelgroup.children.add(newgroup)
        }
        else {
          for (elements <- toplevelgroup.children) {
            if (thisnode.groupname == elements.labelname) {
              elements.children.add(newgroup)
            }
          }
        }
      }
      else {
        thisnode.groupname = thisgroupname
        thisnode.labelname = thisname
      }
      if (thisgroupname != "toplevel") {
        thisnode.groupname = "toplevel::" + thisnode.groupname
      }
      if (allinputs.contains(thisnet)) {
        thisnode.color = "#00ff00"
        thisnode.shape = "Ellipse"
      }
      else if (alloutputs.contains(thisnet)) {
        thisnode.color = "#ff00ff"
        thisnode.shape = "Diamond"
      }
      else {
        thisnode.color = "#ffcc00"
        thisnode.shape = "Rectangle"
      }
      val thisfanouts = new DataAnalyzer(thisnet).getFanOut
      while (thisfanouts.nonEmpty) {
        val thisfanout = thisfanouts.head
        val fanoutname = thisfanout.getName()
        val fanoutgroup = thisfanout.getComponent().getName()
        val thisedge = new Edge
        if (thisname != fanoutname || thisgroupname != fanoutgroup) {
          thisedge.source = thisnode.groupname + "::" + thisnode.labelname
          if (fanoutname.contains("payload_")) {
            val spiltfanoutname = fanoutname.split("payload_")
            thisedge.target = fanoutgroup + "::" + spiltfanoutname(0) + "payload" + "::" + spiltfanoutname(1)
          }
          else thisedge.target = fanoutgroup + "::" + fanoutname
          if (fanoutgroup != "toplevel") thisedge.target = "toplevel::" + thisedge.target
        }
        edges.add(thisedge)
        thisfanouts.remove(thisfanouts.head)
      }
      nodes.add(thisnode)
      allnets.remove(allnets.head)
    }
  }
}