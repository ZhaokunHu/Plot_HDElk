// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : Top6
// Git hash  : 9f81f1a2e6130f636f7046ebec462dcd996728f8

`timescale 1ns/1ps

module Top6 (
  input      [7:0]    io_a,
  output     [7:0]    io_b0,
  output     [7:0]    io_b1,
  output     [7:0]    io_b2,
  input               clk,
  input               reset,
  input               cp_clk,
  input               cp_reset,
  input               ap_clk,
  input               ap_reset,
  input               adc_clk,
  input               adc_reset
);

  wire       [7:0]    u_sub0_io_ao;
  wire       [7:0]    u_sub1_io_ao;
  wire       [7:0]    u_sub1_io_a2;
  reg        [7:0]    tmp;

  MYSub0 u_sub0 (
    .io_ai    (io_a[7:0]        ), //i
    .io_ao    (u_sub0_io_ao[7:0]), //o
    .cp_clk   (cp_clk           ), //i
    .cp_reset (cp_reset         )  //i
  );
  MYSub1 u_sub1 (
    .io_ai     (io_a[7:0]        ), //i
    .io_ao     (u_sub1_io_ao[7:0]), //o
    .io_a2     (u_sub1_io_a2[7:0]), //o
    .ap_clk    (ap_clk           ), //i
    .ap_reset  (ap_reset         ), //i
    .adc_clk   (adc_clk          ), //i
    .adc_reset (adc_reset        )  //i
  );
  assign io_b0 = u_sub0_io_ao;
  assign io_b1 = u_sub1_io_ao;
  assign io_b2 = u_sub1_io_a2;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      tmp <= 8'h0;
    end else begin
      tmp <= io_a;
    end
  end


endmodule

module MYSub1 (
  input      [7:0]    io_ai,
  output     [7:0]    io_ao,
  output     [7:0]    io_a2,
  input               ap_clk,
  input               ap_reset,
  input               adc_clk,
  input               adc_reset
);

  reg        [7:0]    io_ai_regNext;
  reg        [7:0]    area_tmp;
  reg        [7:0]    io_ai_regNext_1;
  wire       [7:0]    area_tmp2;

  assign io_ao = io_ai_regNext;
  assign area_tmp2 = (area_tmp + io_ai_regNext_1);
  assign io_a2 = area_tmp2;
  always @(posedge ap_clk or posedge ap_reset) begin
    if(ap_reset) begin
      io_ai_regNext <= 8'h0;
    end else begin
      io_ai_regNext <= io_ai;
    end
  end

  always @(posedge adc_clk or posedge adc_reset) begin
    if(adc_reset) begin
      area_tmp <= 8'h0;
      io_ai_regNext_1 <= 8'h0;
    end else begin
      area_tmp <= io_ai;
      io_ai_regNext_1 <= io_ai;
    end
  end


endmodule

module MYSub0 (
  input      [7:0]    io_ai,
  output     [7:0]    io_ao,
  input               cp_clk,
  input               cp_reset
);

  reg        [7:0]    io_ai_regNext;

  assign io_ao = io_ai_regNext;
  always @(posedge cp_clk or posedge cp_reset) begin
    if(cp_reset) begin
      io_ai_regNext <= 8'h0;
    end else begin
      io_ai_regNext <= io_ai;
    end
  end


endmodule
