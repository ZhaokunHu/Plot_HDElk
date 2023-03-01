package trying

import spinal.core._

import scala.collection.mutable.Set
class trySet {
   val ss:Set[String]=Set("a","b","c","d")

}
class Node {
  var labelname = ""
  var inports: Set[String] = Set()
  var outports: Set[String] = Set()
  var children: Set[Node] = Set()
  var incounter,outcounter=1
}
class Edge {
  var source, target = ""
  var isBus = 1
}
object trySet{
  def main(args: Array[String]): Unit = {
    val edges: Set[Edge] = Set()
    val edgee1=new Edge
    edgee1.source="aa"
    edgee1.target="bb"
    edges.add(edgee1)
    edges.add(edgee1)
    val edgee2=new Edge
    edgee2.source="aa"
    edgee2.target="cc"
    edges.add(edgee2)
    println(edges.size)
  }
}