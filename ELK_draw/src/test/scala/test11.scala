import Plot_All.Plot_All
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config}


case class Mapping(base : BigInt, range : BigInt){
  // Return true when the given UInt is in the mapping range
  // Very simple and unoptimised implementation
  def hit(address : UInt) : Bool = address >= base && address < base + range
}


case class Apb3Decoder(apbConfig : Apb3Config, outputsMapping : Seq[Mapping]) extends Component{
  require(apbConfig.selWidth == 1)

  val io = new Bundle{
    val input   = slave(Apb3(apbConfig))
    val outputs = Vec(master(Apb3(apbConfig)), outputsMapping.length)
  }

  for(output <- io.outputs) {
    output.PADDR   := io.input.PADDR
    output.PENABLE := io.input.PENABLE
    output.PWRITE  := io.input.PWRITE
    output.PWDATA  := io.input.PWDATA
  }

  //Address decoding
  val mappingHits = outputsMapping.map(_.hit(io.input.PADDR))
  val mappingHitsIndex = OHToUInt(mappingHits)

  for(i <- 0 until outputsMapping.length){
    io.outputs(i).PSEL.lsb := mappingHits(i) && io.input.PSEL.lsb
  }

  io.input.PREADY := io.outputs(mappingHitsIndex).PREADY
  io.input.PRDATA := io.outputs(mappingHitsIndex).PRDATA
  if(apbConfig.useSlaveError) io.input.PSLVERROR := io.outputs(mappingHitsIndex).PSLVERROR
}

object Top111 {
  def main(args: Array[String]): Unit = {
    val Plott = new Plot_All(SpinalConfig(targetDirectory = "rtl").generateVhdl(new Apb3Decoder(
      apbConfig = Apb3Config(
        addressWidth = 16,
        dataWidth = 32
      ),
      outputsMapping = List(
        Mapping(base = 0x0000, range = 0x1000),
        Mapping(base = 0x1000, range = 0x1000),
        Mapping(base = 0x4000, range = 0x2000),
        Mapping(base = 0x6000, range = 0x3000)
      )
    )))
    Plott.plot_All
//    val letread = new ReadSystem(SpinalVerilog(Apb3Decoder(apbccc,mapp)))
//    letread.beginread
  }
}