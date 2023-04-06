package bigtest.testcode

import spinal.core._

case class mainecho() extends BlackBox {
	val iClk: Bool = in Bool
	val iRX: Bool = in Bool
	val oTX: Bool = out Bool
	
}
