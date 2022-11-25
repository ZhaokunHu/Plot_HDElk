// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : Dut

`timescale 1ns/1ps

module Dut (
  input      [7:0]    io_a,
  input      [7:0]    io_b,
  input      [7:0]    io_c,
  output     [7:0]    io_result
);

  wire       [7:0]    _zz_io_result;

  assign _zz_io_result = (io_a + io_b);
  assign io_result = (_zz_io_result - io_c);

endmodule
