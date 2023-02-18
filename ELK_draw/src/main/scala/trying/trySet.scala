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
object trySet{
  def main(args: Array[String]): Unit = {
    val topnode = new Node
    topnode.labelname = "toplevel"
    val register = new Node
    register.labelname = "register"
    topnode.children.add(register)
    register.outcounter+=1
    println(topnode.children.head.outcounter)
//    val a="asd_dd"
//    val b="asd"
//    println(a==b)
//    val mm=new trySet
//    println(mm.ss.size)
//    println(mm.ss.head)
  }
}