// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : TopLevel
// Git hash  : f8f0ae76d9c5c6fb4e79db4156207e5eea57fab2

`timescale 1ns/1ps

module TopLevel (
  input               io_input,
  output     [7:0]    io_output,
  input               clk,
  input               reset
);

  wire                logicCircuit_1_io_output;
  wire       [7:0]    counter_1_io_count;

  LogicCircuit logicCircuit_1 (
    .io_input  (io_input                ), //i
    .io_output (logicCircuit_1_io_output)  //o
  );
  Counter counter_1 (
    .io_enable (logicCircuit_1_io_output), //i
    .io_count  (counter_1_io_count[7:0] ), //o
    .clk       (clk                     ), //i
    .reset     (reset                   )  //i
  );
  assign io_output = counter_1_io_count;

endmodule

module Counter (
  input               io_enable,
  output     [7:0]    io_count,
  input               clk,
  input               reset
);

  reg        [7:0]    reg_1;

  assign io_count = reg_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_1 <= 8'h0;
    end else begin
      if(io_enable) begin
        reg_1 <= (reg_1 + 8'h01);
      end
    end
  end


endmodule

module LogicCircuit (
  input               io_input,
  output              io_output
);


  assign io_output = (io_input && (! io_input));

endmodule
