package bigtest.mylib

import Plot_GroupIO.Plot_All
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi._

class MasterTopLevel extends Component {

  val axiMasterConfig = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 4,
    useId = false,
    useRegion = false,
    useBurst = false,
    useLock = false,
    useCache = false,
    useSize = false,
    useQos = false,
    useLen = false,
    useLast = true,
    useResp = true,
    useProt = false,
    useStrb = true
  )

  val axiConfig = Axi4Config(
    addressWidth = 32,
    dataWidth = 32,
    idWidth = 4
  )

  val io = new Bundle {
    val m_axi = slave(Axi4(axiMasterConfig))
    val zqaxi = master(Axi4(axiConfig))
  }

  val ram = Axi4SharedOnChipRam(
    dataWidth = 32,
    byteCount = 4 kB,
    idWidth = 4     //Specify the AXI4 ID width.
  )

  val axiCrossbar = Axi4CrossbarFactory()

  axiCrossbar.addSlaves(
    ram.io.axi       -> (0x80000000L,   4 kB),
    io.zqaxi        -> (0x10000000L, 8 kB)
  )

  axiCrossbar.addConnections(
    io.m_axi       -> List(ram.io.axi, io.zqaxi)
  )

  axiCrossbar.addPipelining(ram.io.axi)((crossbar,ctrl) => {
    crossbar.sharedCmd.halfPipe()  >>  ctrl.sharedCmd
    crossbar.writeData            >/-> ctrl.writeData
    crossbar.writeRsp              <<  ctrl.writeRsp
    crossbar.readRsp               <<  ctrl.readRsp
  })

  axiCrossbar.build()

}


object MasterTopLevelVerilog {
  def main(args: Array[String]) {
    new Plot_All(SpinalVerilog(new MasterTopLevel))
  }
}

