// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : ColorSumming
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module ColorSumming (
  input      [3:0]    io_sources_0_r,
  input      [3:0]    io_sources_0_g,
  input      [3:0]    io_sources_0_b,
  input      [3:0]    io_sources_1_r,
  input      [3:0]    io_sources_1_g,
  input      [3:0]    io_sources_1_b,
  input      [3:0]    io_sources_2_r,
  input      [3:0]    io_sources_2_g,
  input      [3:0]    io_sources_2_b,
  output     [3:0]    io_result_r,
  output     [3:0]    io_result_g,
  output     [3:0]    io_result_b
);

  reg        [3:0]    _zz_io_result_r;
  reg        [3:0]    _zz_io_result_g;
  reg        [3:0]    _zz_io_result_b;
  reg        [3:0]    _zz_io_result_r_1;
  reg        [3:0]    _zz_io_result_g_1;
  reg        [3:0]    _zz_io_result_b_1;
  reg        [3:0]    _zz_io_result_r_2;
  reg        [3:0]    _zz_io_result_g_2;
  reg        [3:0]    _zz_io_result_b_2;
  wire       [3:0]    sum_r;
  wire       [3:0]    sum_g;
  wire       [3:0]    sum_b;

  always @(*) begin
    _zz_io_result_r = _zz_io_result_r_1;
    _zz_io_result_r = (_zz_io_result_r_1 + io_sources_2_r);
  end

  always @(*) begin
    _zz_io_result_g = _zz_io_result_g_1;
    _zz_io_result_g = (_zz_io_result_g_1 + io_sources_2_g);
  end

  always @(*) begin
    _zz_io_result_b = _zz_io_result_b_1;
    _zz_io_result_b = (_zz_io_result_b_1 + io_sources_2_b);
  end

  always @(*) begin
    _zz_io_result_r_1 = _zz_io_result_r_2;
    _zz_io_result_r_1 = (_zz_io_result_r_2 + io_sources_1_r);
  end

  always @(*) begin
    _zz_io_result_g_1 = _zz_io_result_g_2;
    _zz_io_result_g_1 = (_zz_io_result_g_2 + io_sources_1_g);
  end

  always @(*) begin
    _zz_io_result_b_1 = _zz_io_result_b_2;
    _zz_io_result_b_1 = (_zz_io_result_b_2 + io_sources_1_b);
  end

  always @(*) begin
    _zz_io_result_r_2 = sum_r;
    _zz_io_result_r_2 = (sum_r + io_sources_0_r);
  end

  always @(*) begin
    _zz_io_result_g_2 = sum_g;
    _zz_io_result_g_2 = (sum_g + io_sources_0_g);
  end

  always @(*) begin
    _zz_io_result_b_2 = sum_b;
    _zz_io_result_b_2 = (sum_b + io_sources_0_b);
  end

  assign sum_r = 4'b0000;
  assign sum_g = 4'b0000;
  assign sum_b = 4'b0000;
  assign io_result_r = _zz_io_result_r;
  assign io_result_g = _zz_io_result_g;
  assign io_result_b = _zz_io_result_b;

endmodule
