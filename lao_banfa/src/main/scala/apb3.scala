import spinal.core._
import spinal.lib._   // 使用IMasterSlave需要调用lib库
import dataanan._
import scala.math._

class Apb3Slave extends Component{
  case class APB3Config(addressWidth: Int,
                        dataWidth: Int,
                        selWidth : Int,
                        useSlaveError : Boolean) // APB3总线的参数配置


  case class APB3 (val config: APB3Config) extends Bundle with IMasterSlave {
    val PADDR      = UInt(config.addressWidth bits)
    val PSEL       = Bits(config.selWidth bits)
    val PENABLE    = Bool
    val PREADY     = Bool
    val PWRITE     = Bool
    val PWDATA     = Bits(config.dataWidth bits)
    val PRDATA     = Bits(config.dataWidth bits)
    val PSLVERROR  = if(config.useSlaveError) Bool() else null   // 只有当配置中的useSlaveError为真时才生成该端口

    override def asMaster() : Unit = {
      out(PADDR,PSEL,PENABLE,PWRITE,PWDATA)
      in(PREADY,PRDATA)

      if(config.useSlaveError) in(PSLVERROR)
    }
    // 使用asMaster的好处在于，asSlave直接就默认是Master端口的反面



  }

  val apbConfig = APB3Config(addressWidth = 4,dataWidth = 32,selWidth = 1,useSlaveError = false) // 用户配置参数
  val io = new Bundle{
    val slaveBus = slave(APB3(apbConfig)) // 定义总线的slave端
    //val masterBus = master(APB3(apbConfig))// 定义总线的master端，不知道为何，用asMater定义，无法使用io.masterBus.PADDR表述
  }


  io.slaveBus.PREADY := True
  val num        = pow(2, io.slaveBus.config.addressWidth)
  val mem        = Mem(Bits(io.slaveBus.config.dataWidth bits), num.toInt)
  mem.write(
    enable  = io.slaveBus.PSEL(0) && io.slaveBus.PWRITE,
    address = io.slaveBus.PADDR,
    data    = io.slaveBus.PWDATA
  )
  io.slaveBus.PRDATA := mem.readSync(
    enable  = io.slaveBus.PSEL(0) && io.slaveBus.PENABLE,
    address = io.slaveBus.PADDR
  )

}
object Apb3SlaveInst {
  def main(args: Array[String]) {
    SpinalVerilog(new Apb3Slave)
    val letdo = new readsystem(new Apb3Slave)
    letdo.beginread
    val letdraw = new draw(new Apb3Slave)
    letdraw.begindraw
  }
}