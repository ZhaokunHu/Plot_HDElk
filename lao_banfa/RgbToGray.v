// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : RgbToGray
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module RgbToGray (
  input               io_clear,
  input      [7:0]    io_r,
  input      [7:0]    io_g,
  input      [7:0]    io_b,
  output reg          io_wr,
  output     [15:0]   io_address,
  output     [7:0]    io_data,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz_gray;
  wire       [7:0]    _zz_gray_1;
  wire       [15:0]   _zz_gray_2;
  wire       [7:0]    _zz_gray_3;
  wire       [15:0]   _zz_gray_4;
  wire       [7:0]    _zz_gray_5;
  wire       [15:0]   _zz_gray_6;
  wire       [15:0]   _zz_address_valueNext;
  wire       [0:0]    _zz_address_valueNext_1;
  reg        [7:0]    gray;
  wire                address_willIncrement;
  reg                 address_willClear;
  reg        [15:0]   address_valueNext;
  reg        [15:0]   address_value;
  wire                address_willOverflowIfInc;
  wire                address_willOverflow;

  assign _zz_gray = (_zz_gray_1 + _zz_gray_3);
  assign _zz_gray_1 = (_zz_gray_2 >>> 8);
  assign _zz_gray_2 = (io_r * 8'h4c);
  assign _zz_gray_3 = (_zz_gray_4 >>> 8);
  assign _zz_gray_4 = (io_g * 8'h66);
  assign _zz_gray_5 = (_zz_gray_6 >>> 8);
  assign _zz_gray_6 = (io_b * 8'h4c);
  assign _zz_address_valueNext_1 = address_willIncrement;
  assign _zz_address_valueNext = {15'd0, _zz_address_valueNext_1};
  always @(*) begin
    address_willClear = 1'b0;
    if(io_clear) begin
      address_willClear = 1'b1;
    end
  end

  assign address_willOverflowIfInc = (address_value == 16'hffff);
  assign address_willOverflow = (address_willOverflowIfInc && address_willIncrement);
  always @(*) begin
    address_valueNext = (address_value + _zz_address_valueNext);
    if(address_willClear) begin
      address_valueNext = 16'h0;
    end
  end

  assign address_willIncrement = 1'b1;
  assign io_address = address_value;
  always @(*) begin
    io_wr = 1'b1;
    if(io_clear) begin
      io_wr = 1'b0;
    end
  end

  assign io_data = gray;
  always @(posedge clk) begin
    gray <= (_zz_gray + _zz_gray_5);
    if(io_clear) begin
      gray <= 8'h0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      address_value <= 16'h0;
    end else begin
      address_value <= address_valueNext;
    end
  end


endmodule
