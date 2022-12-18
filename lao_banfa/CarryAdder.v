// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : CarryAdder
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module CarryAdder (
  input      [7:0]    io_a,
  input      [7:0]    io_b,
  output reg [7:0]    io_result,
  input               clk,
  input               reset
);

  wire                ccc_io_clear;
  wire       [7:0]    ccc_io_value;
  wire                ccc_io_full;
  reg                 c_8;
  reg                 c_7;
  reg                 c_6;
  reg                 c_5;
  reg                 c_4;
  reg                 c_3;
  reg                 c_2;
  reg                 c_1;
  wire                c;
  wire                _zz_c_1;
  wire                _zz_c_1_1;
  wire                _zz_c_2;
  wire                _zz_c_2_1;
  wire                _zz_c_3;
  wire                _zz_c_3_1;
  wire                _zz_c_4;
  wire                _zz_c_4_1;
  wire                _zz_c_5;
  wire                _zz_c_5_1;
  wire                _zz_c_6;
  wire                _zz_c_6_1;
  wire                _zz_c_7;
  wire                _zz_c_7_1;
  wire                _zz_c_8;
  wire                _zz_c_8_1;

  Counter ccc (
    .io_clear (ccc_io_clear     ), //i
    .io_value (ccc_io_value[7:0]), //o
    .io_full  (ccc_io_full      ), //o
    .clk      (clk              ), //i
    .reset    (reset            )  //i
  );
  always @(*) begin
    c_8 = c_7;
    c_8 = (((_zz_c_8 && _zz_c_8_1) || (_zz_c_8 && c_7)) || (_zz_c_8_1 && c_7));
  end

  always @(*) begin
    c_7 = c_6;
    c_7 = (((_zz_c_7 && _zz_c_7_1) || (_zz_c_7 && c_6)) || (_zz_c_7_1 && c_6));
  end

  always @(*) begin
    c_6 = c_5;
    c_6 = (((_zz_c_6 && _zz_c_6_1) || (_zz_c_6 && c_5)) || (_zz_c_6_1 && c_5));
  end

  always @(*) begin
    c_5 = c_4;
    c_5 = (((_zz_c_5 && _zz_c_5_1) || (_zz_c_5 && c_4)) || (_zz_c_5_1 && c_4));
  end

  always @(*) begin
    c_4 = c_3;
    c_4 = (((_zz_c_4 && _zz_c_4_1) || (_zz_c_4 && c_3)) || (_zz_c_4_1 && c_3));
  end

  always @(*) begin
    c_3 = c_2;
    c_3 = (((_zz_c_3 && _zz_c_3_1) || (_zz_c_3 && c_2)) || (_zz_c_3_1 && c_2));
  end

  always @(*) begin
    c_2 = c_1;
    c_2 = (((_zz_c_2 && _zz_c_2_1) || (_zz_c_2 && c_1)) || (_zz_c_2_1 && c_1));
  end

  always @(*) begin
    c_1 = c;
    c_1 = (((_zz_c_1 && _zz_c_1_1) || (_zz_c_1 && c)) || (_zz_c_1_1 && c));
  end

  assign c = 1'b0;
  assign _zz_c_1 = io_a[0];
  assign _zz_c_1_1 = io_b[0];
  always @(*) begin
    io_result[0] = ((_zz_c_1 ^ _zz_c_1_1) ^ c);
    io_result[1] = ((_zz_c_2 ^ _zz_c_2_1) ^ c_1);
    io_result[2] = ((_zz_c_3 ^ _zz_c_3_1) ^ c_2);
    io_result[3] = ((_zz_c_4 ^ _zz_c_4_1) ^ c_3);
    io_result[4] = ((_zz_c_5 ^ _zz_c_5_1) ^ c_4);
    io_result[5] = ((_zz_c_6 ^ _zz_c_6_1) ^ c_5);
    io_result[6] = ((_zz_c_7 ^ _zz_c_7_1) ^ c_6);
    io_result[7] = ((_zz_c_8 ^ _zz_c_8_1) ^ c_7);
  end

  assign _zz_c_2 = io_a[1];
  assign _zz_c_2_1 = io_b[1];
  assign _zz_c_3 = io_a[2];
  assign _zz_c_3_1 = io_b[2];
  assign _zz_c_4 = io_a[3];
  assign _zz_c_4_1 = io_b[3];
  assign _zz_c_5 = io_a[4];
  assign _zz_c_5_1 = io_b[4];
  assign _zz_c_6 = io_a[5];
  assign _zz_c_6_1 = io_b[5];
  assign _zz_c_7 = io_a[6];
  assign _zz_c_7_1 = io_b[6];
  assign _zz_c_8 = io_a[7];
  assign _zz_c_8_1 = io_b[7];

endmodule

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
