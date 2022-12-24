// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : Adder
// Git hash  : 9cfa5c257bc427633cee1279e1d8f097a181cef0

`timescale 1ns/1ps

module Adder (
);

  wire                cellArray_0_io_a;
  wire                cellArray_0_io_b;
  wire                cellArray_0_io_cin;
  wire                cellArray_1_io_a;
  wire                cellArray_1_io_b;
  wire                cellArray_2_io_a;
  wire                cellArray_2_io_b;
  wire                cellArray_3_io_a;
  wire                cellArray_3_io_b;
  wire                cellArray_4_io_a;
  wire                cellArray_4_io_b;
  wire                cellArray_5_io_a;
  wire                cellArray_5_io_b;
  wire                cellArray_6_io_a;
  wire                cellArray_6_io_b;
  wire                cellArray_7_io_a;
  wire                cellArray_7_io_b;
  wire                cellArray_0_io_sum;
  wire                cellArray_0_io_cout;
  wire                cellArray_1_io_sum;
  wire                cellArray_1_io_cout;
  wire                cellArray_2_io_sum;
  wire                cellArray_2_io_cout;
  wire                cellArray_3_io_sum;
  wire                cellArray_3_io_cout;
  wire                cellArray_4_io_sum;
  wire                cellArray_4_io_cout;
  wire                cellArray_5_io_sum;
  wire                cellArray_5_io_cout;
  wire                cellArray_6_io_sum;
  wire                cellArray_6_io_cout;
  wire                cellArray_7_io_sum;
  wire                cellArray_7_io_cout;

  AdderCell_7 cellArray_0 (
    .io_a    (cellArray_0_io_a   ), //i
    .io_b    (cellArray_0_io_b   ), //i
    .io_cin  (cellArray_0_io_cin ), //i
    .io_sum  (cellArray_0_io_sum ), //o
    .io_cout (cellArray_0_io_cout)  //o
  );
  AdderCell_7 cellArray_1 (
    .io_a    (cellArray_1_io_a   ), //i
    .io_b    (cellArray_1_io_b   ), //i
    .io_cin  (cellArray_0_io_cout), //i
    .io_sum  (cellArray_1_io_sum ), //o
    .io_cout (cellArray_1_io_cout)  //o
  );
  AdderCell_7 cellArray_2 (
    .io_a    (cellArray_2_io_a   ), //i
    .io_b    (cellArray_2_io_b   ), //i
    .io_cin  (cellArray_1_io_cout), //i
    .io_sum  (cellArray_2_io_sum ), //o
    .io_cout (cellArray_2_io_cout)  //o
  );
  AdderCell_7 cellArray_3 (
    .io_a    (cellArray_3_io_a   ), //i
    .io_b    (cellArray_3_io_b   ), //i
    .io_cin  (cellArray_2_io_cout), //i
    .io_sum  (cellArray_3_io_sum ), //o
    .io_cout (cellArray_3_io_cout)  //o
  );
  AdderCell_7 cellArray_4 (
    .io_a    (cellArray_4_io_a   ), //i
    .io_b    (cellArray_4_io_b   ), //i
    .io_cin  (cellArray_3_io_cout), //i
    .io_sum  (cellArray_4_io_sum ), //o
    .io_cout (cellArray_4_io_cout)  //o
  );
  AdderCell_7 cellArray_5 (
    .io_a    (cellArray_5_io_a   ), //i
    .io_b    (cellArray_5_io_b   ), //i
    .io_cin  (cellArray_4_io_cout), //i
    .io_sum  (cellArray_5_io_sum ), //o
    .io_cout (cellArray_5_io_cout)  //o
  );
  AdderCell_7 cellArray_6 (
    .io_a    (cellArray_6_io_a   ), //i
    .io_b    (cellArray_6_io_b   ), //i
    .io_cin  (cellArray_5_io_cout), //i
    .io_sum  (cellArray_6_io_sum ), //o
    .io_cout (cellArray_6_io_cout)  //o
  );
  AdderCell_7 cellArray_7 (
    .io_a    (cellArray_7_io_a   ), //i
    .io_b    (cellArray_7_io_b   ), //i
    .io_cin  (cellArray_6_io_cout), //i
    .io_sum  (cellArray_7_io_sum ), //o
    .io_cout (cellArray_7_io_cout)  //o
  );

endmodule

//AdderCell_7 replaced by AdderCell_7

//AdderCell_7 replaced by AdderCell_7

//AdderCell_7 replaced by AdderCell_7

//AdderCell_7 replaced by AdderCell_7

//AdderCell_7 replaced by AdderCell_7

//AdderCell_7 replaced by AdderCell_7

//AdderCell_7 replaced by AdderCell_7

module AdderCell_7 (
  input               io_a,
  input               io_b,
  input               io_cin,
  output              io_sum,
  output              io_cout
);


  assign io_sum = ((io_a ^ io_b) ^ io_cin);
  assign io_cout = (((io_a && io_b) || (io_a && io_cin)) || (io_b && io_cin));

endmodule
