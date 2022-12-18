import dataanan._
import spinal.core._
import spinal.lib._
class PLL extends BlackBox{
  val io = new Bundle{
    val clkIn    = in Bool()
    val clkOut   = out Bool()
    val isLocked = out Bool()
  }

  noIoPrefix()
}