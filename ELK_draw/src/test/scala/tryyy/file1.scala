import analyzer.ModuleAnalyzer
import spinal.core._
import spinal.lib._




object Test extends OwnableRef {
  def main(args: Array[String]): Unit = {
    // 创建一个MyObject对象
    val mm = UartRxGenerics()
    val mmoo2=SpinalVerilog(UartCtrlRx(mm)).toplevel
    val apbc = ApbConfig(8, 32, 1)
    val timer = 8
    val mmoo=SpinalVerilog(ApbPwm(apbc, timer)).toplevel
    val mmoo3=SpinalVerilog(new Top1).toplevel
    val mmoo4=SpinalConfig(targetDirectory = "rtl").generateVhdl(UdpApp("012345")).toplevel



    val analyz=new ModuleAnalyzer(mmoo2).getNets(_=>true)
    for(sigg<-analyz){
      println(sigg+":"+sigg.getRefOwnersChain())
    }
    // true

    // 删除引用 myObj.subComp.removeRef(myObj)

    // 再次检查是否有任何引用 println(myObj.hasRefs()) // false }
  }
}