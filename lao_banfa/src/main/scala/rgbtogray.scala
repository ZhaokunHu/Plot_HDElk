import spinal.core._
import spinal.lib._
import dataanan._
class RgbToGray extends Component{
  val io = new Bundle{
    val clear = in Bool()
    val r,g,b = in UInt(8 bits)

    val wr = out Bool()
    val address = out UInt(16 bits)
    val data = out UInt(8 bits)
  }

  def coef(value : UInt,by : Float) : UInt = (value * U((255*by).toInt,8 bits) >> 8)
  val gray = RegNext(
    coef(io.r,0.3f) +
      coef(io.g,0.4f) +
      coef(io.b,0.3f)
  )

  val address = CounterFreeRun(stateCount = 1 << 16)
  io.address := address
  io.wr := True
  io.data := gray

  when(io.clear){
    gray := 0
    address.clear()
    io.wr := False
  }
}
object RgbToGray{
  def main(args:Array[String]){
    SpinalVerilog(new RgbToGray)
    val letread=new readsystem(new RgbToGray)
    letread.beginread
    val letdraw=new draw(new RgbToGray)
    letdraw.begindraw
  }
}