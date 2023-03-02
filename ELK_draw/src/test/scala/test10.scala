import Old_plot.ReadSystem
import Plot_All.Plot_All
import spinal.core._
import spinal.lib._

import scala.collection.mutable


case class FunctionUnit() extends Component{
  val io = new Bundle{
    val cmd = slave  Flow(Bits(8 bits))
    val valueA = out Bits(8 bits)
    val valueB = out Bits(32 bits)
    val valueC = out Bits(48 bits)
  }

  val cmdHitsMap = mutable.HashMap[Int,Bool]()
  def cmdHit(key : Int) = cmdHitsMap.getOrElseUpdate(key,io.cmd.payload === key)

  def patternDetector(str : String) = new Area{
    val counter = Reg(UInt(log2Up(str.length) bits)) init(0)
    val hit = False
    when(io.cmd.valid){
      when(str.map(cmdHit(_)).read(counter)){
        when(counter === str.length-1){
          counter := 0
          hit := True
        } otherwise {
          counter := counter + 1
        }
      } otherwise {
        counter := 0
      }
    }
  }

  def valueLoader(start : Bool,that : Data) = new Area{
    require(widthOf(that) % widthOf(io.cmd.payload) == 0)
    val beatCount = widthOf(that)/widthOf(io.cmd.payload)
    val active    = RegInit(False) setWhen(start)
    val counter   = Counter(beatCount)
    val buffer    = Reg(Bits(widthOf(that) bits))
    when(active && io.cmd.valid){
      counter.increment()
      active.clearWhen(counter.willOverflowIfInc)
      buffer.subdivideIn(beatCount slices)(counter) := io.cmd.payload
    }
    that.assignFromBits(buffer)
  }

  val setA    = patternDetector("setValueA")
  val loadA   = valueLoader(setA.hit,io.valueA)

  val setB    = patternDetector("setValueB")
  val loadB   = valueLoader(setB.hit,io.valueB)

  val setC    = patternDetector("setValueC")
  val loadC   = valueLoader(setC.hit,io.valueC)
}



object Top99 {
  def main(args: Array[String]): Unit = {
    val Plott = new Plot_All(SpinalVerilog(FunctionUnit()))
    Plott.plot_All
    val letread = new ReadSystem(SpinalVerilog(FunctionUnit()))
    letread.beginread
  }
}