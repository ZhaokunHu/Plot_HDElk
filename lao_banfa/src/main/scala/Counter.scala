import dataanan._
import spinal.core._

import java.io._
case class Counter(width: Int) extends Component{
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

object Counter {
  def main(args:Array[String]){
    SpinalVerilog(new Counter(8))
    val letread=new readsystem(Counter(8))
    letread.beginread
    val letdraw=new draw(Counter(8))
    letdraw.begindraw
  }
}