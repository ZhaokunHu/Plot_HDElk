// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : MemorySumming
// Git hash  : fd6942bca278012e45517a5dc6d0f4d1063a1822

`timescale 1ns/1ps

module MemorySumming (
  input               io_wr_en,
  input      [7:0]    io_wr_addr,
  input      [15:0]   io_wr_data,
  input               io_sum_start,
  output reg          io_sum_done,
  output     [15:0]   io_sum_value,
  input               io_wr_clk,
  input               io_sum_clk,
  input               io_sum_reset
);

  wire       [15:0]   ram_io_rd_data;
  reg        [7:0]    sumArea_counter;
  reg                 sumArea_active;
  wire                when_test12_l64;
  wire                when_test12_l69;
  reg                 sumArea_readDataValid;
  reg        [15:0]   sumArea_sum;
  reg                 sumArea_readDataValid_regNext;
  wire                when_test12_l83;

  Ram_1w_1r_2c #(
    .addressWidth(8),
    .wordWidth(16)
  ) ram (
    .io_wr_clk  (io_wr_clk           ), //i
    .io_wr_en   (io_wr_en            ), //i
    .io_wr_addr (io_wr_addr[7:0]     ), //i
    .io_wr_data (io_wr_data[15:0]    ), //i
    .io_rd_clk  (io_sum_clk          ), //i
    .io_rd_en   (sumArea_active      ), //i
    .io_rd_addr (sumArea_counter[7:0]), //i
    .io_rd_data (ram_io_rd_data[15:0])  //o
  );
  assign when_test12_l64 = (! sumArea_active); // @[BaseType.scala 299:24]
  assign when_test12_l69 = (sumArea_counter == 8'hff); // @[BaseType.scala 305:24]
  always @(*) begin
    io_sum_done = 1'b0; // @[test12.scala 82:17]
    if(when_test12_l83) begin
      io_sum_done = 1'b1; // @[test12.scala 84:19]
    end
  end

  assign when_test12_l83 = ((! sumArea_readDataValid) && sumArea_readDataValid_regNext); // @[BaseType.scala 305:24]
  assign io_sum_value = sumArea_sum; // @[test12.scala 88:16]
  always @(posedge io_sum_clk or posedge io_sum_reset) begin
    if(io_sum_reset) begin
      sumArea_active <= 1'b0; // @[Data.scala 400:33]
      sumArea_readDataValid <= 1'b0; // @[Data.scala 400:33]
      sumArea_readDataValid_regNext <= 1'b0; // @[Data.scala 400:33]
    end else begin
      if(when_test12_l64) begin
        sumArea_active <= io_sum_start; // @[test12.scala 65:14]
      end else begin
        if(when_test12_l69) begin
          sumArea_active <= 1'b0; // @[test12.scala 70:16]
        end
      end
      sumArea_readDataValid <= sumArea_active; // @[Reg.scala 39:30]
      sumArea_readDataValid_regNext <= sumArea_readDataValid; // @[Reg.scala 39:30]
    end
  end

  always @(posedge io_sum_clk) begin
    if(when_test12_l64) begin
      sumArea_counter <= 8'h0; // @[test12.scala 66:15]
    end else begin
      sumArea_counter <= (sumArea_counter + 8'h01); // @[test12.scala 68:15]
    end
    if(sumArea_readDataValid) begin
      sumArea_sum <= (sumArea_sum + ram_io_rd_data); // @[test12.scala 77:11]
    end else begin
      sumArea_sum <= 16'h0; // @[test12.scala 79:11]
    end
  end


endmodule
