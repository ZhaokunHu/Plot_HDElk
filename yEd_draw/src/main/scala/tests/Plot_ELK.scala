package tests

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import plot.{Edge, Group, Node}
import spinal.core._

import java.io.{File, PrintWriter}
import scala.collection.mutable.Set
class Edge {
  var source, target = ""
}

class Node {
  var labelname= ""
  var inports:Set[String]=Set()
  var outports:Set[String]=Set()
  var children: Set[Node] = Set()
  var edges:Set[Edge]=Set()
}



class Plot_ELK(module: Module) {
  val file = new File("ELK.html")
  val pw = new PrintWriter(file)
  val edges:Set[Edge]=Set()
  val topnode=new Node
  topnode.labelname="toplevel"
  def dealwires={
    val moduleanalyze=new ModuleAnalyzer(module)
    val allnets = moduleanalyze.getNets(_ => true)
    val allinputs=moduleanalyze.getInputs
    val alloutputs=moduleanalyze.getOutputs
    for(net<-allnets){
      val thisgroupname=net.getComponent().getName()
      if(thisgroupname=="toplevel"){
        if(allinputs.contains(net)) topnode.inports.add(net.getName())
        else if(alloutputs.contains(net)) topnode.outports.add(net.getName())
        else{
          val newnode=new Node
          newnode.labelname=net.getName()
          topnode.children.add(newnode)
        }
      }
      else{
        var iscontained=0
        val newnode=new Node
        newnode.labelname=net.getName()
        for(node<-topnode.children){
          if(node.labelname==thisgroupname)  iscontained=1
        }
        if(iscontained==0){
          val newtopnode = new Node
          newtopnode.labelname = net.getComponent().getName()
          topnode.children.add(newtopnode)
        }

        for(node<-topnode.children){
          if(node.labelname==thisgroupname){
            val dataanalyze=new DataAnalyzer(net)
            val fanins=dataanalyze.getFanIn
            val fanouts=dataanalyze.getFanOut
            for(fanin<-fanins){
              if(fanin.getComponent().getName()!=thisgroupname) {
                node.inports.add(net.getName())
              }
            }
            for(fanout<-fanouts){
              if(fanout.getComponent().getName()!=thisgroupname) {
                node.outports.add(net.getName())
              }
            }

          }
        }
      }
      val dataana=new DataAnalyzer(net)
      val fanouts=dataana.getFanOut
      for(fanout<-fanouts){
        val newedge=new Edge
        newedge.source=net.getName()
        if(thisgroupname!="toplevel")
          newedge.source=thisgroupname+"."+newedge.source
        else if(allinputs.contains(net))
          newedge.source="toplevel."+newedge.source
        newedge.target=fanout.getName()
        if(fanout.getComponent().getName()!="toplevel")
          newedge.target=fanout.getComponent().getName()+"."+newedge.target
        else if (alloutputs.contains(fanout))
          newedge.target = "toplevel." + newedge.target
        if(newedge.target!=newedge.source)
          if(thisgroupname=="toplevel" || thisgroupname!=fanout.getComponent().getName())
            edges.add(newedge)
      }
    }
  }

  def drawnodes(thisnode:Node): Unit = {
    pw.write("{id:\""+thisnode.labelname+"\",\n")
    if(thisnode.inports.nonEmpty){
      pw.write("inPorts: [")
      for(inport<-thisnode.inports) pw.write("\""+inport+"\",")
      pw.write("],\n")
    }
    if (thisnode.outports.nonEmpty) {
      pw.write("outPorts: [")
      for (outport <- thisnode.outports) pw.write("\"" + outport + "\",")
      pw.write("],\n")
    }
    if(thisnode.children.nonEmpty){
      pw.write("children: [\n")
      for(thischildren<-thisnode.children) drawnodes(thischildren)
      pw.write("],\n")
    }
    if(thisnode.labelname=="toplevel") drawedges
    pw.write("},\n")
  }
  def drawedges: Unit ={
    pw.write("edges:[\n")
    for(edge<-edges){
      pw.write("{ source:\""+edge.source+"\", target:\""+edge.target+"\" },\n")
    }
    pw.write("]\n")
  }
  def begindraw={
    pw.write("<div id=\"simple_diagram\"></div>\n\n<script src=\"/js/elk.bundled.js\"></script>\n<script src=\"/js/svg.min.js\"></script>\n<script src=\"/js/hdelk.js\"></script>\n\n<script type=\"text/javascript\">\n\nvar mygraph = {\nchildren:[\n")
    dealwires
    drawnodes(topnode)
    pw.write("],\n")
    pw.write("}\nhdelk.layout( mygraph, \"simple_diagram\" );\n</script>")
    pw.close()
  }
}
