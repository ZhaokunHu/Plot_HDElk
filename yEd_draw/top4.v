// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : Top4
// Git hash  : 9f81f1a2e6130f636f7046ebec462dcd996728f8

`timescale 1ns/1ps

module Top4 (
  input      [7:0]    a,
  output     [7:0]    b
);


  assign b = (a + 8'h85);

endmodule
