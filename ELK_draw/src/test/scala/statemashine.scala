import Plot_All.Plot_All
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.ahblite._
import spinal.lib.bus.amba3.apb._

case class ApbConfig(addressWidth : Int,
                     dataWidth    : Int,
                     selWidth     : Int)

case class Apb(config: ApbConfig) extends Bundle with IMasterSlave {
  val PSEL       = Bits(config.selWidth bits)
  val PENABLE    = Bool()
  val PADDR      = UInt(config.addressWidth bit)
  val PWRITE     = Bool()
  val PWDATA     = Bits(config.dataWidth bit)
  val PRDATA     = Bits(config.dataWidth bit)
  val PREADY     = Bool()

  override def asMaster(): Unit = {
    out(PADDR,PSEL,PENABLE,PWRITE,PWDATA)
    in(PREADY,PRDATA)
  }
}

case class ApbPwm(apbConfig: ApbConfig,timerWidth : Int) extends Component{
  require(apbConfig.dataWidth == 32)
  require(apbConfig.selWidth == 1)

  val io = new Bundle{
    val apb = slave(Apb(apbConfig))
    val pwm = out Bool()
  }

  val logic = new Area {
    val enable    = Reg(Bool()) init(False)
    val timer     = Reg(UInt(timerWidth bits)) init(0)
    val dutyCycle = Reg(UInt(timerWidth bits))
    val output = Reg(Bool()) init(False)

    when(enable) {
      timer := timer + 1
    }

    when(timer === 0){
      output := True
    }
    when(timer === dutyCycle){
      output := False
    }
    io.pwm := output
  }

  val control = new Area{
    val doWrite = io.apb.PSEL(0) && io.apb.PENABLE && io.apb.PWRITE
    io.apb.PRDATA := 0
    io.apb.PREADY := True
    switch(io.apb.PADDR){
      is(0){
        io.apb.PRDATA(0) := logic.enable
        when(doWrite){
          logic.enable := io.apb.PWDATA(0)
        }
      }
      is(4){
        io.apb.PRDATA := logic.dutyCycle.asBits.resized
        when(doWrite){
          logic.dutyCycle := io.apb.PWDATA.asUInt.resized
        }
      }
    }
  }
}


object Top10 {
  def main(args: Array[String]) {
    val apbc=ApbConfig(8,32,1)
    val timer=8
    val Plott = new Plot_All(SpinalVerilog(ApbPwm(apbc,timer)))
   Plott.plot_All
  }
}