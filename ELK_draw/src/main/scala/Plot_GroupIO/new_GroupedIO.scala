package Plot_GroupIO

import analyzer.{DataAnalyzer, ModuleAnalyzer}
import spinal.core._

import scala.collection.mutable
//import spinal.lib.tools._

import spinal.core.{Component, SpinalReport}

import java.io.{File, FileWriter}
import scala.collection.mutable.Set
import scala.util.control._

class Edge {
  var source, target,label = ""
  var isBus,highlight = 0
}

class Node {
  var labelname,typeName= ""
  var inports: Set[String] = Set()
  var outports: Set[String] = Set()
  var children: Set[Node] = Set()
  var highlight=0
}
class newGroupedIO(module:Component,toplevelName:String,moduleName:String) extends OwnableRef{
  val builder = new StringBuilder()
  val edges: Set[Edge] = Set()
  val topNode = new Node
  topNode.labelname = moduleName
  if(module.isInstanceOf[BlackBox]) topNode.typeName="BlackBox"
  val clkMap = new mutable.HashMap[String, Int]
  val clkNamesMap=new mutable.HashMap[String, Int]
  var clkCounter = 1
  val containedNode: Set[String] = Set()

  def haveParent(thisSon: BaseType): Boolean = {
    var judge = false
    val parentList = thisSon.getRefOwnersChain()
    if (parentList.nonEmpty) {
      for (anyParent <- parentList) {
        if (anyParent.isInstanceOf[Data]) {
          val DataParent = anyParent.asInstanceOf[Data]
          if (DataParent.getClass.getSimpleName != "") {
            judge = true
          }
        }
      }
    }
    judge
  }

  def findParent(thisSon: BaseType): Data = {
    val parentList = thisSon.getRefOwnersChain()
    var returnParent = thisSon.parent
    val loop = new Breaks
    loop.breakable {
      for (anyParent <- parentList) {
        if (anyParent.isInstanceOf[Data]) {
          val DataParent = anyParent.asInstanceOf[Data]
          if (DataParent.getClass.getSimpleName != "") {
            if (DataParent.getName() != "") {
              returnParent = DataParent
              loop.break()
            }
            else {
              DataParent.setName("_zz_(" + DataParent.getClass.getSimpleName + ")")
              returnParent = DataParent
              loop.break()
            }
          }
        }
      }
    }
    returnParent
  }

  def haveRegParent(thisSon: BaseType): Boolean = {
    var judge = false
    val parentList = thisSon.getRefOwnersChain()
    if (parentList.nonEmpty && parentList.size > 1) {
      if (parentList.last.getClass.getSimpleName == "" && !parentList.last.isInstanceOf[Data]) {
        judge = true
      }
    }
    judge
  }

  def findRegParent(thisSon: BaseType): String = {
    val anyParent = thisSon.getRefOwnersChain().last
    val parentName = anyParent.toString.split("/").last
    parentName
  }


//    def findParent(thisSon:Data):Data={
//    var thisparent=thisSon
//    while(thisparent.parent!=null&&thisparent.parent.getClass.getSimpleName!=""){
//      thisparent=thisparent.parent
//    }
//    thisparent
//  }
  //初始化一些数据
  def DealAllSignal: Unit = {

    val moduleAnalyze = new ModuleAnalyzer(module)
    val allClk = moduleAnalyze.getClocks

    for (thisClk <- allClk) {
      if(!clkMap.contains(thisClk.clock.getName())){
        clkCounter += 1
        clkNamesMap.put(thisClk.clock.getName(), clkCounter)
        clkMap.put(thisClk.clock.getName(), clkCounter)
        if(thisClk.reset!=null)
          clkMap.put(thisClk.reset.getName(), clkCounter)
        if(thisClk.softReset!=null)
          clkMap.put(thisClk.softReset.getName(), clkCounter)
      }
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
      if(haveParent(topInOut)) {
        val rootparent = findParent(topInOut)
        if(rootparent.flatten.head.isInput)  topNode.inports.add(rootparent.getName())
        else if(rootparent.flatten.head.isOutput)  topNode.outports.add(rootparent.getName())
        else{
          if(topInOut.isInput)  topNode.inports.add(rootparent.getName())
          else  topNode.outports.add(rootparent.getName())
        }
      }
      else{
        if (topInOut.isInput) topNode.inports.add(topInOut.getName())
        else topNode.outports.add(topInOut.getName())
      }
    }
    //添加顶层模块及其输入输出端口


    val innerModules = module.children
    for (innerModule <- innerModules) {
      val newNode = new Node
      newNode.labelname = innerModule.getName()
      if (innerModule.isInstanceOf[BlackBox]) newNode.typeName="BlackBox"
      val clks = new ModuleAnalyzer(innerModule).getClocks
      if (clks.nonEmpty) newNode.highlight = clkMap(clks.head.toString())
      val innerModuleAna=new ModuleAnalyzer(innerModule)
      val innerInOuts=innerModuleAna.getInputs++innerModuleAna.getOutputs
      for(innerInOut<-innerInOuts){
        if(haveParent(innerInOut)){
          val rootparent = findParent(innerInOut)
          if (rootparent.flatten.head.isInput) newNode.inports.add(rootparent.getName())
          else if(rootparent.flatten.head.isOutput) newNode.outports.add(rootparent.getName())
          else{
            if(innerInOut.isInput)  newNode.inports.add(rootparent.getName())
            else newNode.outports.add(rootparent.getName())
          }
        }
        else {
          if (innerInOut.isInput) newNode.inports.add(innerInOut.getName())
          else newNode.outports.add(innerInOut.getName())
        }
      }
      topNode.children.add(newNode)
    }
    //添加内部子模块及其输入输出端口




    val everyRegisters = allRegisters ++ systemRegisters
    for (toplevelRegister <- everyRegisters) {
      val newNode = new Node
      if (haveParent(toplevelRegister)) {
        newNode.labelname = findParent(toplevelRegister).getName()
      }
      else if(haveRegParent(toplevelRegister)){
        newNode.labelname=findRegParent(toplevelRegister)
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
    //添加顶层模块的寄存器

    val allNets = everyRegisters ++ allInOuts
    for (net <- allNets) {
      var sourceName = ""
      var sonName=""
      var inIsBus = 0
      var netIsWrong = false
      if(allInOuts.contains(net)){
        if(haveParent(net)){
          if(!clkMap.contains(net.getName()))
            inIsBus=1
          val rootParent=findParent(net)
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
        if(haveParent(net)){
          inIsBus=1
          sonName=findParent(net).getName()
        }
        else if(haveRegParent(net)){
          sonName=findRegParent(net)
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
            newNode.highlight=topNode.highlight
            if(inIsBus==1)  newEdge.label=findParent(net).getClass.getSimpleName
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
          if (haveParent(fanOut)) {
            outIsBus = 1
            val rootParent = findParent(fanOut)
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
          if (haveParent(fanOut)) {
            outIsBus=1
            fanoutSonName = findParent(fanOut).getName()
          }
          else if(haveRegParent(fanOut)){
            fanoutSonName=findRegParent(fanOut)
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


        if(clkMap.contains(net.getName()))  newEdge.highlight = clkMap(net.getName())
        else if (clkMap.contains(net.clockDomain.toString())) newEdge.highlight = clkMap(net.clockDomain.toString())
        newEdge.source = sourceName
        newEdge.isBus = inIsBus & outIsBus
        if (newEdge.isBus == 1) {
          if(findParent(net).getClass.getSimpleName==findParent(fanOut).getClass.getSimpleName) newEdge.label=findParent(fanOut).getClass.getSimpleName
          else newEdge.label=findParent(net).getClass.getSimpleName+" to "+findParent(fanOut).getClass.getSimpleName
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
      builder ++=s"""{id:"${thisNode.labelname}",\n"""
      if(thisNode.typeName!="") builder ++=s"""type:"${thisNode.typeName}",\n"""
      if (thisNode.highlight != 0) builder ++=s"""highlight:${thisNode.highlight},\n"""
      if (thisNode.inports.nonEmpty) {
        builder ++=s"""inPorts: ["""
        for (inport <- thisNode.inports) builder ++=s""""$inport","""
        builder ++=s"""],\n"""
      }
      if (thisNode.outports.nonEmpty) {
        builder ++= s"""outPorts: ["""
        for (outport <- thisNode.outports) builder ++= s""""$outport","""
        builder ++= s"""],\n"""
      }
      if (thisNode.children.nonEmpty) {
        builder ++= s"""children: [\n"""
        for (thischildren <- thisNode.children) drawNodes(thischildren)
        builder ++= s"""],\n"""
      }
      if (thisNode == topNode) drawedges
      builder ++= s"""},\n"""
    }

    def drawedges: Unit = {
      builder ++= s"""edges:[\n"""
      for (edge <- edges) {
        builder ++= s"""{ source:"${edge.source}",target:"${edge.target}",bus:${edge.isBus},"""
        if (edge.label != "")
          builder ++= s"""label:"${edge.label}","""
        if (edge.highlight != 0)
          builder ++= s"""highlight:${edge.highlight}"""
        builder ++= s"""},\n"""
      }
      builder ++= s"""]\n"""
    }

    def drawClockDomains={
      builder ++= s"""{id:"ClockDomains",\nchildren:[\n"""
      for(element<-clkNamesMap){
        builder ++= s"""{id:"${element._1}",highlight:${element._2}},\n"""
      }
      builder ++= s"""]\n}\n"""
    }
    def begindraw = {
      builder ++=
        s"""
           |<div id="${topNode.labelname}"></div>
           |<h3>${topNode.labelname}</h3><br><br><br><br>
           |<script type="text/javascript">
           |
           |var mygraph = {
           |children:[
           |""".stripMargin
      DealAllSignal
      drawNodes(topNode)
      if(clkMap.nonEmpty)
        drawClockDomains
      builder ++= s"""],\n}\nhdelk.layout( mygraph,"${topNode.labelname}");\n</script>\n"""
      val fileName = toplevelName + "_All.html"
      val file = new File(fileName)
      val pw = new FileWriter(file, true)
      pw.write(builder.toString())
      pw.close()
    }
}

class Plot_All(rtl: SpinalReport[Component]) {
  def apply: Unit ={
    val module=rtl.toplevel
    val fileName = rtl.toplevelName + "_All.html"
    val file = new File(fileName)
    val pw = new FileWriter(file)
    val builder = new StringBuilder()
    builder ++=
      s"""<!DOCTYPE html>
         |<html>
         |<head>
         |    <meta charset="UTF-8">
         |    <title>RTL连接图</title>
         |    <style>
         |.buttons-container {
         | display: flex;
         | justify-content: center;
         | margin-top:30px;
         |}
         |
         |.buttons-container button {
         | background-color: #4CAF50;
         | color: white;
         | border: none;
         | padding:10px20px;
         | margin:010px;
         | cursor: pointer;
         | border-radius:5px;
         |}
         |
         |.image-container {
         | margin-top:50px;
         | text-align: center;
         |}
         |
         |.image-container h2 {
         | margin:0;
         |}
         |.center-title {
         |  text-align: center;
         |  font-size:24px;
         |  font-weight: bold;
         |  margin-top:20px;
         | margin-bottom: 20px;
         |}
         |.goTop {
         |	width: 50px;
         |	height: 50px;
         |	background-color: aquamarine;
         |	font-size: 20px;
         |	text-align: center;
         |	line-height: 25px;
         |	color: azure;
         |	position: fixed;
         |	bottom: 50px;
         |	right: 50px;
         |	display: none;
         |}
         |    </style>
         |</head>
         |<body>
         |<buttion class="goTop" id="gotop">Go Top</buttion>
         |<script>
         |	var goTop=document.getElementById("gotop")
         |	    window.onscroll=function(){
         |		var jhlheight=document.documentElement.scrollTop||document.body.scrollTop
         |		if(jhlheight>=300){
         |		goTop.style.display="block"
         |		}else{
         |		goTop.style.display="none"
         |   }
         |	}
         |	  goTop.onclick=function(){
         |		window.scrollTo({
         |			top:0,
         |			behavior:"smooth"
         |		})
         |	}
         |</script>
         |<script src="/js/elk.bundled.js"></script>
         |<script src="/js/svg.min.js"></script>
         |<script src="/js/hdelk.js"></script>
         |
         |<h1 class="center-title">choose diagrams</h1>
         |<div class="buttons-container">
         |<a href="#${rtl.toplevelName}"><button>${rtl.toplevelName}</button></a>&nbsp;
         |""".stripMargin

    val allInnerCells = module.children
    for (cell <- allInnerCells) {
      builder ++= s"""<a href="#${cell.getName()}"><button>${cell.getName()}</button></a>&nbsp;\n"""
    }
    builder ++=s"""</div><br><br><br><br>\n"""
    pw.write(builder.toString())
    pw.close()
    new newGroupedIO(module, rtl.toplevelName, rtl.toplevelName).begindraw
    for(inner<-module.children)
      new newGroupedIO(inner,rtl.toplevelName,inner.getName()).begindraw
    //      new Plot_Inner_Module(rtl).begindraww
    val pa = new FileWriter(file, true)
    pa.write("</body></html>")
    pa.close()
  }
}
