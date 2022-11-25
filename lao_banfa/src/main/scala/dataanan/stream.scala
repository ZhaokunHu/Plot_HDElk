package dataanan

import spinal.core._
import spinal.lib._


case class MemoryWrite() extends Bundle{
  val address = UInt(8 bits)
  val data    = Bits(32 bits)
}

case class StreamUnit() extends Component{
  val io = new Bundle{
    val memWrite = slave  Flow(MemoryWrite())
    val cmdA     = slave  Stream(UInt(8 bits))
    val cmdB     = slave  Stream(Bits(32 bits))
    val rsp      = master Stream(Bits(32 bits))
  }

  val mem = Mem(Bits(32 bits),1 << 8)
  mem.write(
    enable = io.memWrite.valid,
    address = io.memWrite.address,
    data = io.memWrite.data
  )

  val memReadStream = mem.streamReadSync(io.cmdA)
  io.rsp << StreamJoin.arg(memReadStream,io.cmdB).translateWith(memReadStream.payload ^ io.cmdB.payload)

  //  //Alternative solution for the two precedents lines
  //  val memReadStream = io.cmdA.stage()
  //  val memReadData   = mem.readSync(
  //    enable  = io.cmdA.fire,
  //    address = io.cmdA.payload
  //  )
  //  io.rsp << StreamJoin.arg(memReadStream,io.cmdB).translateWith(memReadData ^ io.cmdB.payload)
}

object WriteFileExamp{
  def main(args:Array[String]){
    SpinalVerilog(new StreamUnit)
    val letdo=new graphwriter(new StreamUnit)
    letdo.graphwrite
  }
}