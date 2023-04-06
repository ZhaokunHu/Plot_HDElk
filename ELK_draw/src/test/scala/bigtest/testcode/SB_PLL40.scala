package bigtest.testcode

import spinal.core._

case class SB_PLL40_CORE() extends BlackBox {
  val REFERENCECLK: Bool = in Bool()
  val PLLOUTCORE, LOCK = out Bool()
  val BYPASS = in Bits()
  val RESETB = in Bits()
  addGeneric("FEEDBACK_PATH", "SIMPLE")
  addGeneric("DELAY_ADJUSTMENT_MODE_FEEDBACK", "FIXED")
  addGeneric("DELAY_ADJUSTMENT_MODE_RELATIVE", "FIXED")
  addGeneric("PLLOUT_SELECT","GENCLK")
  addGeneric("FDA_FEEDBACK",B(15,4 bits))
  addGeneric("FDA_RELATIVE",B(15,4 bits))
  addGeneric("DIVR", B(0,4 bits))
  addGeneric("DIVQ", B(4,3 bits))
  addGeneric("DIVF", B(7,7 bits))
  
  addGeneric("FILTER_RANGE", B(5,3 bits))
  
  //addGeneric("BYPASS", B(0,1 bits))
  //addGeneric("RESETB", "RESET")
  //addGeneric("EXTFEEDBACK","()")
}
