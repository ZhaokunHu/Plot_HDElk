// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : Timer
// Git hash  : fd6942bca278012e45517a5dc6d0f4d1063a1822

`timescale 1ns/1ps

module Timer (
  input               io_tick,
  input               io_clear,
  input      [7:0]    io_limit,
  output              io_full,
  output     [7:0]    io_value,
  input               clk,
  input               reset
);

  reg        [7:0]    counter;
  wire                when_test12_l19;

  assign when_test12_l19 = (io_tick && (! io_full)); // @[BaseType.scala 305:24]
  assign io_full = (counter == io_limit); // @[test12.scala 26:11]
  assign io_value = counter; // @[test12.scala 27:12]
  always @(posedge clk) begin
    if(when_test12_l19) begin
      counter <= (counter + 8'h01); // @[test12.scala 20:13]
    end
    if(io_clear) begin
      counter <= 8'h0; // @[test12.scala 23:13]
    end
  end


endmodule
