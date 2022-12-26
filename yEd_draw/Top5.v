// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : Top5
// Git hash  : 14e6ea1ddf77883e47ad947389d210a3a69534ca

`timescale 1ns/1ps

module Top5 (
  input               myclk,
  input               myrst
);

  wire       [7:0]    u_sub0_a;
  wire       [7:0]    u_sub0_b;

  SUB u_sub0 (
    .a     (u_sub0_a[7:0]), //i
    .b     (u_sub0_b[7:0]), //o
    .myclk (myclk        ), //i
    .myrst (myrst        )  //i
  );

endmodule

module SUB (
  input      [7:0]    a,
  output reg [7:0]    b,
  input               myclk,
  input               myrst
);


  always @(posedge myclk or negedge myrst) begin
    if(!myrst) begin
      b <= 8'h0;
    end else begin
      b <= a;
    end
  end


endmodule
