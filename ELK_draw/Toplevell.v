// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : Toplevell
// Git hash  : f8f0ae76d9c5c6fb4e79db4156207e5eea57fab2

`timescale 1ns/1ps

module Toplevell (
  input      [7:0]    a,
  input      [7:0]    b,
  input      [7:0]    c,
  output     [7:0]    result,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz_result;
  reg        [1:0]    state;
  wire                when_file3_l13;
  wire                when_file3_l20;
  wire                when_file3_l27;

  assign _zz_result = (a + b);
  assign result = (_zz_result + c); // @[BaseType.scala 299:24]
  assign when_file3_l13 = (b < a); // @[BaseType.scala 305:24]
  assign when_file3_l20 = (c < a); // @[BaseType.scala 305:24]
  assign when_file3_l27 = (c < b); // @[BaseType.scala 305:24]
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 2'b00; // @[Data.scala 400:33]
    end else begin
      case(state)
        2'b00 : begin
          if(when_file3_l13) begin
            state <= 2'b01; // @[file3.scala 14:15]
          end else begin
            state <= 2'b10; // @[file3.scala 16:15]
          end
        end
        2'b01 : begin
          if(when_file3_l20) begin
            state <= 2'b10; // @[file3.scala 21:15]
          end else begin
            state <= 2'b00; // @[file3.scala 23:15]
          end
        end
        2'b10 : begin
          if(when_file3_l27) begin
            state <= 2'b00; // @[file3.scala 28:15]
          end else begin
            state <= 2'b01; // @[file3.scala 30:15]
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule
