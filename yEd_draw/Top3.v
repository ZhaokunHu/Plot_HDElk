// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : Top3
// Git hash  : 9f81f1a2e6130f636f7046ebec462dcd996728f8

`timescale 1ns/1ps

module Top3 (
  input               io_idata_valid,
  output              io_idata_ready,
  input      [7:0]    io_idata_payload,
  output              io_odata_valid,
  input               io_odata_ready,
  output     [7:0]    io_odata_payload
);

  wire                myBusFifo_1_io_push_ready;
  wire                myBusFifo_1_io_pop_valid;
  wire       [7:0]    myBusFifo_1_io_pop_payload;

  MyBusFifo myBusFifo_1 (
    .io_push_valid   (io_idata_valid                 ), //i
    .io_push_ready   (myBusFifo_1_io_push_ready      ), //o
    .io_push_payload (io_idata_payload[7:0]          ), //i
    .io_pop_valid    (myBusFifo_1_io_pop_valid       ), //o
    .io_pop_ready    (io_odata_ready                 ), //i
    .io_pop_payload  (myBusFifo_1_io_pop_payload[7:0])  //o
  );
  assign io_idata_ready = myBusFifo_1_io_push_ready;
  assign io_odata_valid = myBusFifo_1_io_pop_valid;
  assign io_odata_payload = myBusFifo_1_io_pop_payload;

endmodule

module MyBusFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload
);


  assign io_pop_valid = io_push_valid;
  assign io_push_ready = io_pop_ready;
  assign io_pop_payload = io_push_payload;

endmodule
