package Simple_ELK

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core.{Component, SpinalReport}

import java.io.{File, PrintWriter}
import scala.collection.mutable.Set

class Plot_Inner_Module(rtl: SpinalReport[Component]) {
  val module = rtl.toplevel
  val fileName = rtl.toplevelName + "_Inner.html"
  val file = new File(fileName)
  val pw = new PrintWriter(file)
  val Nodes:Set[Node]=Set()
  def dealInner: Unit ={
    val moduleanalyze = new ModuleAnalyzer(module)
    val allInnerCells=moduleanalyze.getCells(_.getName()!="toplevel")
    for(cell<-allInnerCells){
      val thisfamilyname=cell.getName()
      val thisNode=new Node
      thisNode.labelname=thisfamilyname
      val innerNets=moduleanalyze.getNets(_.getComponent().getName()==thisfamilyname)
      for(net<-innerNets){
        val dataAna=new DataAnalyzer(net)
        var isfanin,isfanout=false
        val fanins=dataAna.getFanIn
        val fanouts=dataAna.getFanOut
        for(fanin<-fanins){
          if(fanin.getComponent().getName()!=cell.getName())
            isfanin=true
        }
        for(fanout<-fanouts){
          if(fanout.getComponent().getName()!=cell.getName())
            isfanout=true
        }
        var thisname=net.getName()
        if(isfanin) {
          thisNode.inports.add(thisname)
          thisname=thisfamilyname+"."+thisname
        }
        else if(isfanout){
          thisNode.outports.add(thisname)
          thisname=thisfamilyname+"."+thisname
        }
        else{
          val newNode=new Node
          newNode.labelname=thisname
          thisNode.children.add(newNode)
        }
        for(fanout<-fanouts){
          if(fanout.getComponent().getName()==thisfamilyname){
            val nextfanouts=new DataAnalyzer(fanout).getFanOut
            var nextisfanout=false
            for(nextfanout<-nextfanouts)
              if(nextfanout.getComponent().getName()!=thisfamilyname)
                nextisfanout=true
            var targetname = fanout.getName()
            if (nextisfanout)  targetname=thisfamilyname+"."+targetname
            val newEdge = new Edge
            newEdge.isBus = 0
            newEdge.source = thisname
            newEdge.target=targetname
            thisNode.Edges.add(newEdge)
          }
        }
      }
      Nodes.add(thisNode)
    }
  }

  def drawinnerNode: Unit ={
    for(thisnode<-Nodes){
      pw.write("<div id=\""+thisnode.labelname+"\"></div>\n")
      pw.write("<script type=\"text/javascript\">\n\nvar mygraph = {\nchildren:[\n")
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
        for (thischildren <- thisnode.children) pw.write("{id:\"" + thischildren.labelname + "\"},\n")
        pw.write("],\n")
      }
      pw.write("edges:[\n")
      for (edge <- thisnode.Edges) {
        pw.write("{ source:\"" + edge.source + "\", target:\"" + edge.target + "\",bus: " + edge.isBus + " },\n")
      }
      pw.write("]\n")
      pw.write("}\n")
      pw.write("],\n")
      pw.write("}\nhdelk.layout( mygraph, \""+thisnode.labelname+"\" );\n</script>\n")
    }
  }

  def begindraww = {
    pw.write("<script src=\"/js/elk.bundled.js\"></script>\n<script src=\"/js/svg.min.js\"></script>\n<script src=\"/js/hdelk.js\"></script>\n\n")
    dealInner
    drawinnerNode
    pw.close()
  }
}
