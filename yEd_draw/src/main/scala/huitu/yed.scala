package huitu

import java.io.{File, PrintWriter}
import spinal.core._
class yed (module: Module) {
  def begindraw={
    val file = new File("yEd.graphml")
    val pw = new PrintWriter(file)
    pw.write("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\" xmlns:java=\"http://www.yworks.com/xml/yfiles-common/1.0/java\" xmlns:sys=\"http://www.yworks.com/xml/yfiles-common/markup/primitives/2.0\" xmlns:x=\"http://www.yworks.com/xml/yfiles-common/markup/2.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:y=\"http://www.yworks.com/xml/graphml\" xmlns:yed=\"http://www.yworks.com/xml/yed/3\" xsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns http://www.yworks.com/xml/schema/graphml/1.1/ygraphml.xsd\">\n  <!--Created by yEd 3.22-->\n  <key attr.name=\"Description\" attr.type=\"string\" for=\"graph\" id=\"d0\"/>\n  <key for=\"port\" id=\"d1\" yfiles.type=\"portgraphics\"/>\n  <key for=\"port\" id=\"d2\" yfiles.type=\"portgeometry\"/>\n  <key for=\"port\" id=\"d3\" yfiles.type=\"portuserdata\"/>\n  <key attr.name=\"url\" attr.type=\"string\" for=\"node\" id=\"d4\"/>\n  <key attr.name=\"description\" attr.type=\"string\" for=\"node\" id=\"d5\"/>\n  <key for=\"node\" id=\"d6\" yfiles.type=\"nodegraphics\"/>\n  <key for=\"graphml\" id=\"d7\" yfiles.type=\"resources\"/>\n  <key attr.name=\"url\" attr.type=\"string\" for=\"edge\" id=\"d8\"/>\n  <key attr.name=\"description\" attr.type=\"string\" for=\"edge\" id=\"d9\"/>\n  <key for=\"edge\" id=\"d10\" yfiles.type=\"edgegraphics\"/>\n  <graph edgedefault=\"directed\" id=\"G\">\n    <data key=\"d0\"/>\n")
    val moduleanalyze=new ModuleAnalyzer(module)
    val allnets=moduleanalyze.getNets(_=>true)
    var groupname=""
    var groupnum= -1
    var netsnum=0
    while(!allnets.isEmpty) {
        val thisnet=allnets.head
        if(groupname!=thisnet.getComponent().getName()){
          groupnum=groupnum+1
          netsnum=0
          if(groupnum>0) pw.write("      </graph>\n    </node>\n")
          groupname=thisnet.getComponent().getName()
          pw.write("<node id=\"n"+groupnum+"\" yfiles.foldertype=\"group\">\n      <data key=\"d4\" xml:space=\"preserve\"/>\n      <data key=\"d5\"/>\n      <data key=\"d6\">\n        <y:ProxyAutoBoundsNode>\n          <y:Realizers active=\"0\">\n            <y:GroupNode>\n              <y:Geometry height=\"356.0\" width=\"780.3333333333335\" x=\"113.0\" y=\"217.0\"/>\n              <y:Fill color=\"#CAECFF84\" transparent=\"false\"/>\n              <y:BorderStyle color=\"#666699\" type=\"dotted\" width=\"1.0\"/>\n              <y:NodeLabel alignment=\"right\" autoSizePolicy=\"node_width\" backgroundColor=\"#99CCFF\" borderDistance=\"0.0\" fontFamily=\"Dialog\" fontSize=\"15\" fontStyle=\"plain\" hasLineColor=\"false\" height=\"22.37646484375\" horizontalTextPosition=\"center\" iconTextGap=\"4\" modelName=\"internal\" modelPosition=\"t\" textColor=\"#000000\" verticalTextPosition=\"bottom\" visible=\"true\" width=\"780.3333333333335\" x=\"0.0\" xml:space=\"preserve\" y=\"0.0\">"+groupname+"</y:NodeLabel>\n              <y:Shape type=\"roundrectangle\"/>\n              <y:State closed=\"false\" closedHeight=\"50.0\" closedWidth=\"50.0\" innerGraphDisplayEnabled=\"false\"/>\n              <y:Insets bottom=\"15\" bottomF=\"15.0\" left=\"15\" leftF=\"15.0\" right=\"15\" rightF=\"15.0\" top=\"15\" topF=\"15.0\"/>\n              <y:BorderInsets bottom=\"0\" bottomF=\"0.0\" left=\"0\" leftF=\"0.0\" right=\"0\" rightF=\"0.0\" top=\"0\" topF=\"0.0\"/>\n            </y:GroupNode>\n            <y:GroupNode>\n              <y:Geometry height=\"50.0\" width=\"50.0\" x=\"113.0\" y=\"217.0\"/>\n              <y:Fill color=\"#CAECFF84\" transparent=\"false\"/>\n              <y:BorderStyle color=\"#666699\" type=\"dotted\" width=\"1.0\"/>\n              <y:NodeLabel alignment=\"right\" autoSizePolicy=\"node_width\" backgroundColor=\"#99CCFF\" borderDistance=\"0.0\" fontFamily=\"Dialog\" fontSize=\"15\" fontStyle=\"plain\" hasLineColor=\"false\" height=\"22.37646484375\" horizontalTextPosition=\"center\" iconTextGap=\"4\" modelName=\"internal\" modelPosition=\"t\" textColor=\"#000000\" verticalTextPosition=\"bottom\" visible=\"true\" width=\"55.70166015625\" x=\"-2.850830078125\" xml:space=\"preserve\" y=\"0.0\">"+groupname+"</y:NodeLabel>\n              <y:Shape type=\"roundrectangle\"/>\n              <y:State closed=\"true\" closedHeight=\"50.0\" closedWidth=\"50.0\" innerGraphDisplayEnabled=\"false\"/>\n              <y:Insets bottom=\"15\" bottomF=\"15.0\" left=\"15\" leftF=\"15.0\" right=\"15\" rightF=\"15.0\" top=\"15\" topF=\"15.0\"/>\n              <y:BorderInsets bottom=\"0\" bottomF=\"0.0\" left=\"0\" leftF=\"0.0\" right=\"0\" rightF=\"0.0\" top=\"0\" topF=\"0.0\"/>\n            </y:GroupNode>\n          </y:Realizers>\n        </y:ProxyAutoBoundsNode>\n      </data>\n      <graph edgedefault=\"directed\" id=\"n"+groupnum+":\">\n")
        }
        pw.write("<node id=\"n"+groupnum+"::n"+netsnum+"\">\n          <data key=\"d5\"/>\n          <data key=\"d6\">\n            <y:ShapeNode>\n              <y:Geometry height=\"30.0\" width=\"30.0\" x=\"120.5\" y=\"265.5302734375001\"/>\n              <y:Fill color=\"#FFCC00\" transparent=\"false\"/>\n              <y:BorderStyle color=\"#000000\" raised=\"false\" type=\"line\" width=\"1.0\"/>\n              <y:NodeLabel alignment=\"center\" autoSizePolicy=\"content\" fontFamily=\"Dialog\" fontSize=\"12\" fontStyle=\"plain\" hasBackgroundColor=\"false\" hasLineColor=\"false\" height=\"18.701171875\" horizontalTextPosition=\"center\" iconTextGap=\"4\" modelName=\"custom\" textColor=\"#000000\" verticalTextPosition=\"bottom\" visible=\"true\" width=\"28.0\" x=\"1.0\" xml:space=\"preserve\" y=\"5.6494140625\">"+thisnet.getName()+"<y:LabelModel><y:SmartNodeLabelModel distance=\"4.0\"/></y:LabelModel><y:ModelParameter><y:SmartNodeLabelModelParameter labelRatioX=\"0.0\" labelRatioY=\"0.0\" nodeRatioX=\"0.0\" nodeRatioY=\"0.0\" offsetX=\"0.0\" offsetY=\"0.0\" upX=\"0.0\" upY=\"-1.0\"/></y:ModelParameter></y:NodeLabel>\n              <y:Shape type=\"ellipse\"/>\n            </y:ShapeNode>\n          </data>\n        </node>\n")
        netsnum=netsnum+1
        allnets.remove(allnets.head)
    }
    pw.write("      </graph>\n    </node>\n</graph>\n  <data key=\"d7\">\n    <y:Resources/>\n  </data>\n</graphml>")
    pw.close()
  }
}
