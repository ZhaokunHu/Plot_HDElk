package trying

import spinal.core._

import scala.collection.mutable
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
    val map3 = new mutable.HashMap[String, String];
    map3.put("name", "jike")
    map3.put("city", "hangzhou")
    map3.put("city", "hangzho")
    println(map3.size)
    println(map3.contains(null))
  }
}