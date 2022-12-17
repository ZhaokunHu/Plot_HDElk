// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : Counter
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module Counter (
  input               io_clear,
  output     [7:0]    io_value,
  output              io_full,
  input               clk,
  input               reset
);

  wire       [8:0]    _zz_io_full;
  wire       [8:0]    _zz_io_full_1;
  wire       [8:0]    _zz_io_full_2;
  reg        [7:0]    counter_1;

  assign _zz_io_full = {1'd0, counter_1};
  assign _zz_io_full_1 = (_zz_io_full_2 - 9'h001);
  assign _zz_io_full_2 = ({8'd0,1'b1} <<< 8);
  assign io_value = counter_1;
  assign io_full = (_zz_io_full == _zz_io_full_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_1 <= 8'h0;
    end else begin
      counter_1 <= (counter_1 + 8'h01);
      if(io_clear) begin
        counter_1 <= 8'h0;
      end
    end
  end


endmodule
