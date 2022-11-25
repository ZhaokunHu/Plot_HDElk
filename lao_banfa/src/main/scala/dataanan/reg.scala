package dataanan

import spinal.core._

import spinal.lib._

class reg extends Component {
  // UInt register of 4 bits
  val reg1 = Reg(UInt(4 bits))

  // Register that samples reg1 each cycle
  val reg2 = RegNext(reg1 + 1)

  // UInt register of 4 bits initialized with 0 when the reset occurs
  val reg3 = RegInit(U"0000")
  reg3 := reg2
  when(reg2 === 5) {
    reg3 := 0xF
  }

  // Register that samples reg3 when cond is True
}
 object reg{
   def main(args: Array[String]): Unit = {
     SpinalVerilog(new reg)
   }
 }