import Plot_All.Plot_All
import spinal.core._
import spinal.lib._

import scala.language.postfixOps

// 定义子模块1：带有输入输出的逻辑电路
class LogicCircuit extends Component {
  val io = new Bundle {
    val input = in Bool()
    val output = out Bool()
  }

  io.output := io.input & !io.input
}

// 定义子模块2：带有输入输出的计数器
class Counter extends Component {
  val io = new Bundle {
    val enable = in Bool()
    val count = out UInt(8 bits)
  }

  val reg = RegInit(U"8'h00")
  when (io.enable) {
    reg := reg + 1
  }
  io.count := reg
}

// 定义顶层模块，包含两个子模块的实例化和连接
class TopLevel extends Component {
  val io = new Bundle {
    val input = in Bool()
    val output = out UInt(8 bits)
  }

  val logicCircuit = new LogicCircuit
  val counter = new Counter

  logicCircuit.io.input := io.input
  counter.io.enable := logicCircuit.io.output
  io.output := counter.io.count
}

// 生成Verilog文件
object TopLevel {
  def main(args: Array[String]): Unit = {
    val plott=new Plot_All(SpinalConfig(targetDirectory = "rtl").generateVerilog(new TopLevel))
    plott.plot_All

  }
}