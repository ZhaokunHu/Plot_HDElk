// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : reg_1

`timescale 1ns/1ps

module reg_1 (
  input               clk,
  input               reset
);

  reg        [3:0]    reg1;
  reg        [3:0]    reg2;
  reg        [3:0]    reg3;
  wire                when_reg_l17;

  assign when_reg_l17 = (reg2 == 4'b0101);
  always @(posedge clk) begin
    reg2 <= (reg1 + 4'b0001);
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg3 <= 4'b0000;
    end else begin
      reg3 <= reg2;
      if(when_reg_l17) begin
        reg3 <= 4'b1111;
      end
    end
  end


endmodule
