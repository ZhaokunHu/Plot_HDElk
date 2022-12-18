// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : TopLevel
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module TopLevel (
  input               io_aReset,
  input               io_clk100Mhz,
  output     [3:0]    io_result
);

  wire                clkCtrl_pll_clkOut;
  wire                clkCtrl_pll_isLocked;
  wire                bufferCC_1_io_dataOut;
  wire                core_clk;
  wire                core_reset;
  wire                _zz_1;
  reg        [3:0]    core_counter;

  PLL clkCtrl_pll (
    .clkIn    (io_clk100Mhz        ), //i
    .clkOut   (clkCtrl_pll_clkOut  ), //o
    .isLocked (clkCtrl_pll_isLocked)  //o
  );
  BufferCC bufferCC_1 (
    .io_dataIn  (1'b0                 ), //i
    .io_dataOut (bufferCC_1_io_dataOut), //o
    .core_clk   (core_clk             ), //i
    ._zz_1      (_zz_1                )  //i
  );
  assign core_clk = clkCtrl_pll_clkOut;
  assign _zz_1 = (io_aReset || (! clkCtrl_pll_isLocked));
  assign core_reset = bufferCC_1_io_dataOut;
  assign io_result = core_counter;
  always @(posedge core_clk or posedge core_reset) begin
    if(core_reset) begin
      core_counter <= 4'b0000;
    end else begin
      core_counter <= (core_counter + 4'b0001);
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               core_clk,
  input               _zz_1
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge core_clk or posedge _zz_1) begin
    if(_zz_1) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
