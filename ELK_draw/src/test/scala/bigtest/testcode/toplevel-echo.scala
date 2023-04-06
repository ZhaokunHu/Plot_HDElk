package bigtest.testcode

import spinal.core._
/*
`ifdef	VERILATOR
	assign	s_clk = i_clk;
`else
	wire	clk_40mhz, pll_locked;
	SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
		.DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
		.PLLOUT_SELECT("GENCLK"),
		.FDA_FEEDBACK(4'b1111),
		.FDA_RELATIVE(4'b1111),
		.DIVR(4'b0100),		// DIVR =  4
		.DIVQ(7'b0011111),		// DIVQ =  31
		.DIVF(3'b100),		// DIVF =  4
		.FILTER_RANGE(3'b010)	// FILTER_RANGE = 2
	) plli (
		.REFERENCECLK     (i_clk        ),
		.PLLOUTCORE     (clk_40mhz    ),
		.LOCK           (pll_locked  ),
		.BYPASS         (1'b0         ),
		.RESETB         (1'b1         )
	);
       	//SB_GB global_buffer(clk_40mhz, s_clk);
	assign	s_clk = clk_40mhz;
`endif

  SB_PLL40_CORE #(
    .FEEDBACK_PATH("SIMPLE"),
    .DIVR(4'b0010),
    .DIVF(7'h16),
    .DIVQ(3'b110),
    .FILTER_RANGE(3'b010) 
  ) plli (
    .REFERENCECLK    (io_CLK_100       ), //i
    .PLLOUTCORE      (plli_PLLOUTCORE  ), //o
    .LOCK            (plli_LOCK        ), //o
    .BYPASS          (_zz_1            ), //i
    .RESETB          (_zz_2            )  //i
  );
  assign _zz_1 = 1'b0;
  assign _zz_2 = 1'b1;
*/
class toplevel_echo() extends Component {
  val io = new Bundle() {
  val CLK_100 = in Bool()
  val uartRX = in Bool()
  val uartTX = out Bool()
  
  }
  val plli: SB_PLL40_CORE = new SB_PLL40_CORE()
  plli.REFERENCECLK <> io.CLK_100
  plli.BYPASS <> B(0,1 bit)
  plli.RESETB <> B(1,1 bit)
  
  val mainecho = new mainecho()
  mainecho.iClk <> plli.PLLOUTCORE
  mainecho.iRX <> io.uartRX
  mainecho.oTX <> io.uartTX  
}
//Generate the toplevel-echo Verilog
object toplevel_echoVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new toplevel_echo)
  }
}
