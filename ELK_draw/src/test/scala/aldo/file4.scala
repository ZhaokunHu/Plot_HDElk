package aldo
import Plot_All.Plot_All
import spinal.core._
import spinal.lib._
case class RGB(channelWidth: Int) extends Bundle {
  val red = UInt(channelWidth bit)
  val green = UInt(channelWidth bit)
  val blue = UInt(channelWidth bit)
  def isBlack: Bool = red === 0 && green === 0 && blue === 0
}

class Example  extends Component {
  val source = slave Stream (RGB(8))
  val sink = master Stream (RGB(8))
  sink <-< source.throwWhen(source.payload.isBlack)
}

object Mytoplev{
  def ffIo[T <: Component](c: T): T = {
    def buf1[T <: Data](that: T) = KeepAttribute(RegNext(that)).addAttribute("DONT_TOUCH")

    def buf[T <: Data](that: T) = buf1(buf1(buf1(that)))

    c.rework {
      val ios = c.getAllIo.toList
      ios.foreach { io =>
        if (io.getName() == "clk") {
          //Do nothing
        } else if (io.isInput) {
          io.setAsDirectionLess().allowDirectionLessIo //allowDirectionLessIo is to disable the io Bundle linting
          io := buf(in(cloneOf(io).setName(io.getName() + "_wrap")))
        } else if (io.isOutput) {
          io.setAsDirectionLess().allowDirectionLessIo
          out(cloneOf(io).setName(io.getName() + "_wrap")) := buf(io)
        } else ???
      }
    }
    c
  }
  def main(args: Array[String]): Unit = {
    new Plot_All(SpinalVerilog(ffIo(new Example))).plot_All
  }
}