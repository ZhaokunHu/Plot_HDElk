// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : Apb3Decoder
// Git hash  : fd6942bca278012e45517a5dc6d0f4d1063a1822

`timescale 1ns/1ps

module Apb3Decoder (
  input      [7:0]    io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [7:0]    io_input_PWDATA,
  output     [7:0]    io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [7:0]    io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [7:0]    io_outputs_0_PWDATA,
  input      [7:0]    io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR
);

  wire                mappingHits_0;

  assign io_outputs_0_PADDR = io_input_PADDR; // @[test11.scala 24:20]
  assign io_outputs_0_PENABLE = io_input_PENABLE; // @[test11.scala 25:20]
  assign io_outputs_0_PWRITE = io_input_PWRITE; // @[test11.scala 26:20]
  assign io_outputs_0_PWDATA = io_input_PWDATA; // @[test11.scala 27:20]
  assign mappingHits_0 = ((8'h40 <= io_input_PADDR) && (io_input_PADDR < 8'h80)); // @[BaseType.scala 305:24]
  assign io_outputs_0_PSEL[0] = (mappingHits_0 && io_input_PSEL[0]); // @[test11.scala 35:28]
  assign io_input_PREADY = io_outputs_0_PREADY; // @[test11.scala 38:19]
  assign io_input_PRDATA = io_outputs_0_PRDATA; // @[test11.scala 39:19]
  assign io_input_PSLVERROR = io_outputs_0_PSLVERROR; // @[test11.scala 40:50]

endmodule
