package plot

import analyzer.{DataAnalyzer, ModuleAnalyzer}

import java.io.{File, PrintWriter}
import spinal.core._

import scala.collection.mutable.Set
class Node {
  var color, shape, labelname, groupname = ""
}
class Group{
  var labelname,topcolor,belowcolor=""
  var children:Set[Group]=Set()
  var typee="folder"
  var isclosed=1
}
class Edge {
  var source, target = ""
}

class Plot_yEd (module: Module) {
  val file = new File("yEd.graphml")
  val pw = new PrintWriter(file)
  val toplevelgroup=new Group
  val judgegroupname:Set[String]=Set()
  toplevelgroup.topcolor = "#99ccff"
  toplevelgroup.belowcolor = "#caecff84"
  toplevelgroup.labelname = "toplevel"
  toplevelgroup.isclosed=0
  toplevelgroup.typee="group"
  val nodes: Set[Node] = Set()
  val edges: Set[Edge] = Set()
  def deal_wires(module: Module) = {
    val moduleanalyze = new ModuleAnalyzer(module)
    val allnets = moduleanalyze.getNets(_ => true)
    val allinputs = moduleanalyze.getInputs
    val alloutputs = moduleanalyze.getOutputs
    while (allnets.nonEmpty) {
      val thisnet = allnets.head
      val thisname = thisnet.getName()
      val thisgroup = thisnet.getComponent()
      val thisgroupname=thisgroup.getName()
      val thisnode = new Node
      if(thisgroupname!="toplevel"&& !judgegroupname.contains(thisgroupname)) {
        judgegroupname.add(thisgroupname)
        val newgroup = new Group
        newgroup.topcolor = "#00ccff"
        newgroup.belowcolor = "#00ffff"
        newgroup.labelname=thisgroupname
        toplevelgroup.children.add(newgroup)
      }
      if (thisname.contains("payload_")) {
        val solitname = thisname.split("payload_")
        thisnode.groupname = thisgroupname + "::" + solitname(0) + "payload"
        thisnode.labelname = solitname(1)
        val newgroup=new Group
        newgroup.topcolor="#ffff00"
        newgroup.belowcolor="#ffff00"
        newgroup.labelname=thisnode.groupname
        if(thisgroupname=="toplevel") {
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
        thisnode.shape = "ellipse"
      }
      else if (alloutputs.contains(thisnet)) {
        thisnode.color = "#ff00ff"
        thisnode.shape = "diamond"
      }
      else {
        thisnode.color = "#ffcc00"
        thisnode.shape = "rectangle"
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
  def drawnodes(thisgroup: Group): Unit ={
    pw.write("    <node id=\""+thisgroup.labelname+"\" yfiles.foldertype=\""+thisgroup.typee+"\">\n      <data key=\"d4\" xml:space=\"preserve\"/>\n      <data key=\"d5\"/>\n      <data key=\"d6\">\n        <y:ProxyAutoBoundsNode>\n          <y:Realizers active=\""+thisgroup.isclosed+"\">\n            <y:GroupNode>\n              <y:Geometry height=\"300\" width=\"300\" x=\"113.0\" y=\"217.0\"/>\n              <y:Fill color=\""+thisgroup.belowcolor+"\" transparent=\"false\"/>\n              <y:BorderStyle color=\"#666699\" type=\"dotted\" width=\"1.0\"/>\n              <y:NodeLabel alignment=\"right\" autoSizePolicy=\"node_width\" backgroundColor=\""+thisgroup.topcolor+"\" borderDistance=\"0.0\" fontFamily=\"Dialog\" fontSize=\"15\" fontStyle=\"plain\" hasLineColor=\"false\" height=\"22.37646484375\" horizontalTextPosition=\"center\" iconTextGap=\"4\" modelName=\"internal\" modelPosition=\"t\" textColor=\"#000000\" verticalTextPosition=\"bottom\" visible=\"true\" width=\"780.3333333333335\" x=\"0.0\" xml:space=\"preserve\" y=\"0.0\">"+thisgroup.labelname+"</y:NodeLabel>\n              <y:Shape type=\"roundrectangle\"/>\n              <y:State closed=\"false\" closedHeight=\"50.0\" closedWidth=\"50.0\" innerGraphDisplayEnabled=\"false\"/>\n              <y:Insets bottom=\"15\" bottomF=\"15.0\" left=\"15\" leftF=\"15.0\" right=\"15\" rightF=\"15.0\" top=\"15\" topF=\"15.0\"/>\n              <y:BorderInsets bottom=\"0\" bottomF=\"0.0\" left=\"0\" leftF=\"0.0\" right=\"0\" rightF=\"0.0\" top=\"0\" topF=\"0.0\"/>\n            </y:GroupNode>\n            <y:GroupNode>\n              <y:Geometry height=\"150.0\" width=\"150.0\" x=\"113.0\" y=\"217.0\"/>\n              <y:Fill color=\""+thisgroup.belowcolor+"\" transparent=\"false\"/>\n              <y:BorderStyle color=\"#666699\" type=\"dotted\" width=\"1.0\"/>\n              <y:NodeLabel alignment=\"right\" autoSizePolicy=\"node_width\" backgroundColor=\""+thisgroup.topcolor+"\" borderDistance=\"0.0\" fontFamily=\"Dialog\" fontSize=\"15\" fontStyle=\"plain\" hasLineColor=\"false\" height=\"22.37646484375\" horizontalTextPosition=\"center\" iconTextGap=\"4\" modelName=\"internal\" modelPosition=\"t\" textColor=\"#000000\" verticalTextPosition=\"bottom\" visible=\"true\" width=\"55.70166015625\" x=\"-2.850830078125\" xml:space=\"preserve\" y=\"0.0\">"+thisgroup.labelname+"</y:NodeLabel>\n              <y:Shape type=\"roundrectangle\"/>\n              <y:State closed=\"true\" closedHeight=\"150.0\" closedWidth=\"150.0\" innerGraphDisplayEnabled=\"false\"/>\n              <y:Insets bottom=\"15\" bottomF=\"15.0\" left=\"15\" leftF=\"15.0\" right=\"15\" rightF=\"15.0\" top=\"15\" topF=\"15.0\"/>\n              <y:BorderInsets bottom=\"0\" bottomF=\"0.0\" left=\"0\" leftF=\"0.0\" right=\"0\" rightF=\"0.0\" top=\"0\" topF=\"0.0\"/>\n            </y:GroupNode>\n          </y:Realizers>\n        </y:ProxyAutoBoundsNode>\n      </data>\n      <graph edgedefault=\"directed\" id=\""+thisgroup.labelname+":\">\n")
    val thisnodes=nodes.filter(_.groupname==thisgroup.labelname)
    for(element<-thisnodes) pw.write("        <node id=\""+element.groupname+"::"+element.labelname+"\">\n          <data key=\"d5\"/>\n          <data key=\"d6\">\n            <y:ShapeNode>\n              <y:Geometry height=\"70.0\" width=\"70.0\" x=\"120.5\" y=\"265.5302734375001\"/>\n              <y:Fill color=\""+element.color+"\" transparent=\"false\"/>\n              <y:BorderStyle color=\"#000000\" raised=\"false\" type=\"line\" width=\"1.0\"/>\n              <y:NodeLabel alignment=\"center\" autoSizePolicy=\"node_width\" configuration=\"CroppingLabel\" fontFamily=\"Dialog\" fontSize=\"12\" fontStyle=\"plain\" hasBackgroundColor=\"false\" hasLineColor=\"false\" height=\"18.701171875\" horizontalTextPosition=\"center\" iconTextGap=\"4\" modelName=\"custom\" textColor=\"#000000\" verticalTextPosition=\"bottom\" visible=\"true\" width=\"28.0\" x=\"1.0\" xml:space=\"preserve\" y=\"5.6494140625\">"+element.labelname+"<y:LabelModel><y:SmartNodeLabelModel distance=\"4.0\"/></y:LabelModel><y:ModelParameter><y:SmartNodeLabelModelParameter labelRatioX=\"0.0\" labelRatioY=\"0.0\" nodeRatioX=\"0.0\" nodeRatioY=\"0.0\" offsetX=\"0.0\" offsetY=\"0.0\" upX=\"0.0\" upY=\"-1.0\"/></y:ModelParameter></y:NodeLabel>\n              <y:Shape type=\""+element.shape+"\"/>\n            </y:ShapeNode>\n          </data>\n        </node>\n")
    for(element<-thisgroup.children)  drawnodes(element)
    pw.write("      </graph>\n    </node>\n")
  }
  def drawedges: Unit ={
    for(element<-edges){
      pw.write("    <edge id=\""+element.source+"::"+element.target+"\" source=\""+element.source+"\" target=\""+element.target+"\">\n      <data key=\"d10\">\n        <y:PolyLineEdge>\n          <y:Path sx=\"0.0\" sy=\"15.0\" tx=\"0.0\" ty=\"-15.0\"/>\n          <y:LineStyle color=\"#000000\" type=\"line\" width=\"1.0\"/>\n          <y:Arrows source=\"none\" target=\"standard\"/>\n          <y:BendStyle smoothed=\"false\"/>\n        </y:PolyLineEdge>\n      </data>\n    </edge>\n")
    }
  }
  def begindraw={
    pw.write("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\" xmlns:java=\"http://www.yworks.com/xml/yfiles-common/1.0/java\" xmlns:sys=\"http://www.yworks.com/xml/yfiles-common/markup/primitives/2.0\" xmlns:x=\"http://www.yworks.com/xml/yfiles-common/markup/2.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:y=\"http://www.yworks.com/xml/graphml\" xmlns:yed=\"http://www.yworks.com/xml/yed/3\" xsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns http://www.yworks.com/xml/schema/graphml/1.1/ygraphml.xsd\">\n  <!--Created by yEd 3.22-->\n  <key attr.name=\"Description\" attr.type=\"string\" for=\"graph\" id=\"d0\"/>\n  <key for=\"port\" id=\"d1\" yfiles.type=\"portgraphics\"/>\n  <key for=\"port\" id=\"d2\" yfiles.type=\"portgeometry\"/>\n  <key for=\"port\" id=\"d3\" yfiles.type=\"portuserdata\"/>\n  <key attr.name=\"url\" attr.type=\"string\" for=\"node\" id=\"d4\"/>\n  <key attr.name=\"description\" attr.type=\"string\" for=\"node\" id=\"d5\"/>\n  <key for=\"node\" id=\"d6\" yfiles.type=\"nodegraphics\"/>\n  <key for=\"graphml\" id=\"d7\" yfiles.type=\"resources\"/>\n  <key attr.name=\"url\" attr.type=\"string\" for=\"edge\" id=\"d8\"/>\n  <key attr.name=\"description\" attr.type=\"string\" for=\"edge\" id=\"d9\"/>\n  <key for=\"edge\" id=\"d10\" yfiles.type=\"edgegraphics\"/>\n  <graph edgedefault=\"directed\" id=\"G\">\n    <data key=\"d0\"/>\n")
    deal_wires(module)
    drawnodes(toplevelgroup)
    drawedges
    pw.write("  </graph>\n  <data key=\"d7\">\n    <y:Resources/>\n  </data>\n</graphml>")
    pw.close()
  }
}
