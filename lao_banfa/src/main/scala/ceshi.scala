object ceshi{
  def main(args: Array[String]): Unit = {
    val set1 = Set("一", 1, 2, "er")
    val set2 = Set()
    println("set1.head ：" + set1.head)
    println("set1.tail：" + set1.tail)
    println("set1.isEmpty：" + set1.isEmpty)
    println("---------------")

    println("set2 :" + set2.isEmpty)
    println(set2.getClass.getName)
  }

}
