package Simple_ELK

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core._

import java.io.{File, PrintWriter}
import scala.collection.mutable.Set

class Edge {
  var source, target = ""
  var isBus = 1
}

class Node {
  var labelname = ""
  var inports: Set[String] = Set()
  var outports: Set[String] = Set()
  var children: Set[Node] = Set()
  var incounter,outcounter=1
}
class Judgeconnect{
  var source, target = ""
}
class DeletedSignal {
  var signalname, familyname = ""
}

class Plot_Simple_ELK(rtl: SpinalReport[Component]) {
  val module = rtl.toplevel
  val fileName = rtl.toplevelName + "_Simple.html"
  val file = new File(fileName)
  val pw = new PrintWriter(file)
  val judegeBus:Set[String]=Set()
  val judegconnects:Set[Judgeconnect]=Set()
  val edges: Set[Edge] = Set()
  val topnode = new Node
  topnode.labelname = "toplevel"
  val register=new Node
  register.labelname="register"
  topnode.children.add(register)
  def dealwires: Unit ={
    val moduleanalyze = new ModuleAnalyzer(module)
    val allnets = moduleanalyze.getNets(_ => true)
    val allinputs = moduleanalyze.getInputs
    val alloutputs = moduleanalyze.getOutputs
    val allInnerCells=moduleanalyze.getCells(_.getName()!="toplevel")
    for(cell<-allInnerCells) {
      val newNode=new Node
      newNode.labelname=cell.getName()
      topnode.children.add(newNode)
    }
    for(net<-allnets){
      var thisfamilyname=net.getComponent().getName()
      if(thisfamilyname=="toplevel" && !allinputs.contains(net) && !alloutputs.contains(net))
        thisfamilyname="register"
      val dataAna=new DataAnalyzer(net)
      val fanouts=dataAna.getFanOut
      for(fanout<-fanouts){
        var fanoutFamilyName=fanout.getComponent().getName()
        if(fanoutFamilyName=="toplevel" && !alloutputs.contains(fanout))
          fanoutFamilyName="register"
        var contained=false
        if(thisfamilyname==fanoutFamilyName)
          contained=true
        for(judge<-judegconnects){
          if(thisfamilyname==judge.source)
            if(fanoutFamilyName==judge.target){
              contained=true
            }
        }
        if(!contained){
          val newJudge=new Judgeconnect
          newJudge.source=thisfamilyname
          newJudge.target=fanoutFamilyName
          judegconnects.add(newJudge)
          val newEdge=new Edge
          var sourcename,targetname=""
          if(thisfamilyname=="toplevel" && allinputs.contains(net)){
            sourcename="toplevel.input"+topnode.incounter
            topnode.inports.add("input"+topnode.incounter)
            topnode.incounter+=1
          }
          else{
            for(children<-topnode.children)
              if(children.labelname==thisfamilyname){
                sourcename=thisfamilyname+".dataout"+children.outcounter
                children.outports.add("dataout"+children.outcounter)
                children.outcounter+=1
              }
          }
          newEdge.source=sourcename
          if(fanoutFamilyName=="toplevel" && alloutputs.contains(fanout)){
            targetname="toplevel.output"+topnode.outcounter
            topnode.outports.add("output"+topnode.outcounter)
            topnode.outcounter+=1
          }
          else {
            for (children <- topnode.children)
              if (children.labelname == fanoutFamilyName) {
                targetname = fanoutFamilyName + ".datain" + children.incounter
                children.inports.add("datain" + children.incounter)
                children.incounter += 1
              }
          }
          newEdge.target=targetname
          edges.add(newEdge)
        }
      }
    }
  }
  if(register.outcounter==1 && register.incounter==1)
    topnode.children.remove(register)
  def drawnodes(thisnode: Simple_ELK.Node): Unit = {
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