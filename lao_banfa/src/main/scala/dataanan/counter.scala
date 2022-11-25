package dataanan

import spinal.core._

case class Counter(width: Int) extends Component {
  val io = new Bundle {
    val clear    = in  Bool()
    val value    = out UInt(width bits)
    val full     = out Bool()
  }

  val counter = Reg(UInt(width bits)) init(0)
  counter := counter + 1
  when(io.clear) {
    counter := 0
  }

  io.value := counter
  io.full  := counter === (U"1" << width) - 1 //counter.maxValue //U(counter.range -> true)
}

object WriteFileExample {
  def main(args:Array[String]){
    SpinalVerilog(new Counter(8))
    val letdo=new graphwriter(new Counter(8))
    letdo.graphwrite
  }
}