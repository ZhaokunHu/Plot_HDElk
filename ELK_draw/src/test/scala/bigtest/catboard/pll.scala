package bigtest.catboard

import spinal.core._

case class pll() extends BlackBox {
  val REFERENCECLK: Bool = in Bool()
  val PLLOUTCORE, LOCK = out Bool()
  val BYPASS = in Bits()
  val RESETB = in Bits()
  addGeneric("FEEDBACK_PATH", "SIMPLE")
  addGeneric("DIVR", B(2,4 bits))
  addGeneric("DIVF", B(22,7 bits))
  addGeneric("DIVQ", B(6,3 bits))
  addGeneric("BYPASS", B(0,1 bits))
  addGeneric("RESETB", "RESET")
  addGeneric("EXTFEEDBACK","()")
}
