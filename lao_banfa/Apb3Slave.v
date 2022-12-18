// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : Apb3Slave
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module Apb3Slave (
  input      [3:0]    io_slaveBus_PADDR,
  input      [0:0]    io_slaveBus_PSEL,
  input               io_slaveBus_PENABLE,
  output              io_slaveBus_PREADY,
  input               io_slaveBus_PWRITE,
  input      [31:0]   io_slaveBus_PWDATA,
  output     [31:0]   io_slaveBus_PRDATA,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_mem_port1;
  wire                _zz_mem_port;
  wire                _zz_io_slaveBus_PRDATA;
  reg [31:0] mem [0:15];

  assign _zz_mem_port = (io_slaveBus_PSEL[0] && io_slaveBus_PWRITE);
  always @(posedge clk) begin
    if(_zz_mem_port) begin
      mem[io_slaveBus_PADDR] <= io_slaveBus_PWDATA;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_slaveBus_PRDATA) begin
      _zz_mem_port1 <= mem[io_slaveBus_PADDR];
    end
  end

  assign io_slaveBus_PREADY = 1'b1;
  assign _zz_io_slaveBus_PRDATA = (io_slaveBus_PSEL[0] && io_slaveBus_PENABLE);
  assign io_slaveBus_PRDATA = _zz_mem_port1;

endmodule
