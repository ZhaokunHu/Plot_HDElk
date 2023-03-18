package Plot_GroupIO

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core.{Component, Data}

import java.io.{File, FileWriter}
import scala.collection.mutable
import scala.collection.mutable.Set
import scala.util.control._

class newGroupedIO(module:Component,toplevelName:String,moduleName:String) {
  val fileName = toplevelName + "_All.html"
  val file = new File(fileName)
  val edges: Set[Edge] = Set()
  val pw = new FileWriter(file, true)
  val topNode = new Node
  topNode.labelname = moduleName
  val clkMap = new mutable.HashMap[String, Int]
  var clkCounter = 0
  val containedNode: Set[String] = Set()
  def findParent(thisSon:Data):Data={
    var thisparent=thisSon
    while(thisparent.parent!=null&&thisparent.parent.getClass.getSimpleName!=""){
      thisparent=thisparent.parent
    }
    thisparent
  }
  //初始化一些数据
  def DealAllSignal: Unit = {

    val moduleAnalyze = new ModuleAnalyzer(module)
    val allClk = moduleAnalyze.getClocks
    for (thisClk <- allClk) {
      clkCounter += 1
      clkMap.put(thisClk.toString(), clkCounter + 1)
    }
    if(allClk.size>1) topNode.highlight=6
    else if(allClk.size==1) topNode.highlight=clkMap(allClk.head.toString())
    //生成clk的颜色映射
    val topInOuts = moduleAnalyze.getInputs ++ moduleAnalyze.getOutputs
    val allRegisters = moduleAnalyze.getRegisters
    val systemRegisters = moduleAnalyze.getNets(net => net.getComponent().getName() == module.getName() && !topInOuts.contains(net) && !allRegisters.contains(net))
    val allInOuts=moduleAnalyze.getPins(_ => true)

    //区分系统寄存器
    for(topInOut<-topInOuts){
      val thisparent=topInOut.parent
      if(thisparent!=null && thisparent.getClass.getSimpleName!=""){
        val rootparent=findParent(thisparent)
        if(rootparent.flatten.head.isInput)  topNode.inports.add(rootparent.getName())
        else  topNode.outports.add(rootparent.getName())
      }
      else{
        if(topInOut.isInput)  topNode.inports.add(topInOut.getName())
        else  topNode.outports.add(topInOut.getName())
      }
    }

    //添加顶层模块


    val innerModules = module.children
    for (innerModule <- innerModules) {
      val newNode = new Node
      newNode.labelname = innerModule.getName()
      val clks = new ModuleAnalyzer(innerModule).getClocks
      if (clks.size > 1) newNode.highlight = 1
      else if (clks.size == 1) newNode.highlight = clkMap(clks.head.toString())
      val innerModuleAna=new ModuleAnalyzer(innerModule)
      val innerInOuts=innerModuleAna.getInputs++innerModuleAna.getOutputs
      for(innerInOut<-innerInOuts){
        val thisparent=innerInOut.parent
        if (thisparent != null && thisparent.getClass.getSimpleName != "") {
          val rootparent = findParent(thisparent)
          if (rootparent.flatten.head.isInput) newNode.inports.add(rootparent.getName())
          else newNode.outports.add(rootparent.getName())
        }
        else {
          if (innerInOut.isInput) newNode.inports.add(innerInOut.getName())
          else newNode.outports.add(innerInOut.getName())
        }
      }
      topNode.children.add(newNode)
    }
    //添加内部子模块




    val everyRegisters = allRegisters ++ systemRegisters

    for (toplevelRegister <- everyRegisters) {
      val newNode = new Node
      if (toplevelRegister.parent != null&&toplevelRegister.parent.getClass.getSimpleName != "") {
        newNode.labelname = findParent(toplevelRegister.parent).getName()
      }
      else {
        newNode.labelname = toplevelRegister.getName()
      }
      if(clkMap.contains(toplevelRegister.clockDomain.toString()))
        newNode.highlight = clkMap(toplevelRegister.clockDomain.toString())
      if (!containedNode.contains(newNode.labelname)) {
        topNode.children.add(newNode)
        containedNode.add(newNode.labelname)
      }
    }
    //添加寄存器

    val allNets = everyRegisters ++ allInOuts
    for (net <- allNets) {
      var sourceName = ""
      var sonName=""
      var inIsBus = 0
      var netIsWrong = false
      if(allInOuts.contains(net)){
        val thisparent=net.parent
        if(thisparent!=null && thisparent.getClass.getSimpleName!=""){
          inIsBus=1
          val rootParent=findParent(thisparent)
          if(topInOuts.contains(net)){
            if(rootParent.flatten.head.isOutput)  netIsWrong=true
          }
          else{
            if(rootParent.flatten.head.isInput) netIsWrong=true
          }
          sonName=rootParent.getName()
        }
        else{
          if(topInOuts.contains(net)){
            if(net.isOutput)  netIsWrong=true
          }
          else{
            if(net.isInput)   netIsWrong=true
          }
          sonName=net.getName()
        }
      }
      else{
        val thisparent=net.parent
        if(thisparent!=null && thisparent.getClass.getSimpleName!=""){
          inIsBus=1
          val rootParent=findParent(thisparent)
          sonName=rootParent.getName()
        }
        else {
          sonName=net.getName()
        }
      }
 //得到net的子名

      if(allInOuts.contains(net)){
        if(topInOuts.contains(net)) {
          sourceName=moduleName+"."+sonName
        }
        else sourceName=net.getComponent().getName()+"."+sonName
      }
      else if(everyRegisters.contains(net)){
        sourceName=sonName
      }
      else netIsWrong=true
//得到起点名

      val dataAnalyze = new DataAnalyzer(net)
      val fanOuts = dataAnalyze.getFanOut
      val loop = new Breaks
      loop.breakable {
        for (fanOut <- fanOuts) {
          if (net.getComponent().getName() == module.getName() && fanOut.getComponent().getName() == module.getName() && net.isInput && fanOut.isOutput) {
            val newNode = new Node
            val newEdge = new Edge
            newNode.labelname=sonName
            if(inIsBus==1)  newEdge.label=findParent(net.parent).getClass.getSimpleName
            if(!containedNode.contains(sonName)&& !netIsWrong){
              topNode.children.add(newNode)
              containedNode.add(sonName)
            }
            newEdge.isBus=inIsBus
            newEdge.source = sourceName
            newEdge.target = sonName
            var isContined = false
            for (thisEdge <- edges) {
              if (thisEdge.source == newEdge.source && thisEdge.target == newEdge.target && thisEdge.label == newEdge.label)
                isContined = true
            }
            if(!netIsWrong && !isContined)
              edges.add(newEdge)
            sourceName = sonName
            loop.break()
          }
        }
      }
      //处理输入直连到输出的连接

      for (fanOut <- fanOuts) {
        val newEdge = new Edge
        var fanoutSonName=""
        var outIsBus = 0
        var fanoutIsWrong = false


        if (allInOuts.contains(fanOut)) {
          val thisparent = fanOut.parent
          if (thisparent != null && thisparent.getClass.getSimpleName != "") {
            outIsBus = 1
            val rootParent = findParent(thisparent)
            if (topInOuts.contains(fanOut)) {
              if (rootParent.flatten.head.isInput) fanoutIsWrong = true
            }
            else {
              if (rootParent.flatten.head.isOutput) fanoutIsWrong = true
            }
            fanoutSonName = rootParent.getName()
          }
          else {
            if (topInOuts.contains(fanOut)) {
              if (fanOut.isInput) fanoutIsWrong = true
            }
            else {
              if (fanOut.isOutput) fanoutIsWrong = true
            }
            fanoutSonName = fanOut.getName()
          }
        }
        else {
          println(sourceName+":"+fanOut)
          val thisparent = fanOut.parent
          if (thisparent != null && thisparent.getClass.getSimpleName != "") {
            outIsBus=1
            val rootParent = findParent(thisparent)
            fanoutSonName = rootParent.getName()
          }
          else{
            fanoutSonName = fanOut.getName()
          }
        }
//得到fanout的子名



        if (allInOuts.contains(fanOut)) {
          if (topInOuts.contains(fanOut)) {
            newEdge.target = moduleName + "." + fanoutSonName
          }
          else if(fanOut.getComponent() == net.getComponent())  fanoutIsWrong=true
          else newEdge.target  = fanOut.getComponent().getName() + "." + fanoutSonName
        }
        else if (everyRegisters.contains(fanOut)) {
          newEdge.target  = fanoutSonName
        }
        else fanoutIsWrong=true
//得到终点名

        if (clkMap.contains(net.getName())) newEdge.highlight = clkMap(net.getName())
        newEdge.source = sourceName

        newEdge.isBus = inIsBus & outIsBus
        if (newEdge.isBus == 1) {
          if(findParent(net.parent).getClass.getSimpleName==findParent(fanOut.parent).getClass.getSimpleName) newEdge.label=fanOut.parent.getClass.getSimpleName
          else newEdge.label=findParent(net.parent).getClass.getSimpleName+" to "+findParent(fanOut.parent).getClass.getSimpleName
        }
        else if(inIsBus==1){
          newEdge.label=fanOut.getName()
        }
        else if(outIsBus==1){
          newEdge.label=net.getName()
        }
        var isContined = false
        for (thisEdge <- edges) {
          if (thisEdge.source == newEdge.source && thisEdge.target == newEdge.target&&thisEdge.label==newEdge.label)
            isContined = true
        }
        if (!netIsWrong && !fanoutIsWrong && !isContined && newEdge.source != "" && newEdge.target != "")
          edges.add(newEdge)
      }
    }
  }
//设置并添加线
    def drawNodes(thisNode: Node): Unit = {
      pw.write("{id:\"" + thisNode.labelname + "\",\n")
      if (thisNode.highlight != 0)
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
        pw.write("{ source:\"" + edge.source + "\", target:\"" + edge.target + "\",bus: " + edge.isBus + ",")
        if (edge.label != "")
          pw.write("label:\"" + edge.label + "\",")
        if (edge.highlight != 0)
          pw.write(s"highlight:${edge.highlight}")
        pw.write(" },\n")
      }
      pw.write("]\n")
    }

    def drawKeys={
      pw.write("{id:\"ClockKeys\",\nchildren:[\n")
      for(element<-clkMap){
        pw.write("{id:\""+element._1+"\",highlight:"+element._2+"},\n")
      }
      pw.write("]\n}\n")
    }
    def begindraw = {

      pw.write("<div id=\"" + topNode.labelname + "\"></div>\n<h3>" + topNode.labelname + "</h3><br><br>\n<script type=\"text/javascript\">\n\nvar mygraph = {\nchildren:[\n")
      DealAllSignal
      drawNodes(topNode)
      if(clkMap.size>0)
        drawKeys
      pw.write("],\n}\nhdelk.layout( mygraph, \"" + topNode.labelname + "\" );\n</script>")
      pw.close()
    }

}