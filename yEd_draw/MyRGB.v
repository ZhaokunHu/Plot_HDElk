// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : MyRGB
// Git hash  : 9f81f1a2e6130f636f7046ebec462dcd996728f8

`timescale 1ns/1ps

module MyRGB (
  input               source_valid,
  output              source_ready,
  input      [7:0]    source_payload_red,
  input      [7:0]    source_payload_green,
  input      [7:0]    source_payload_blue,
  output              sink_valid,
  input               sink_ready,
  output     [7:0]    sink_payload_red,
  output     [7:0]    sink_payload_green,
  output     [7:0]    sink_payload_blue,
  input               clk,
  input               reset
);

  wire                source_s2mPipe_valid;
  reg                 source_s2mPipe_ready;
  wire       [7:0]    source_s2mPipe_payload_red;
  wire       [7:0]    source_s2mPipe_payload_green;
  wire       [7:0]    source_s2mPipe_payload_blue;
  reg                 source_rValid;
  reg        [7:0]    source_rData_red;
  reg        [7:0]    source_rData_green;
  reg        [7:0]    source_rData_blue;
  wire                source_s2mPipe_m2sPipe_valid;
  wire                source_s2mPipe_m2sPipe_ready;
  wire       [7:0]    source_s2mPipe_m2sPipe_payload_red;
  wire       [7:0]    source_s2mPipe_m2sPipe_payload_green;
  wire       [7:0]    source_s2mPipe_m2sPipe_payload_blue;
  reg                 source_s2mPipe_rValid;
  reg        [7:0]    source_s2mPipe_rData_red;
  reg        [7:0]    source_s2mPipe_rData_green;
  reg        [7:0]    source_s2mPipe_rData_blue;
  wire                when_Stream_l368;

  assign source_ready = (! source_rValid);
  assign source_s2mPipe_valid = (source_valid || source_rValid);
  assign source_s2mPipe_payload_red = (source_rValid ? source_rData_red : source_payload_red);
  assign source_s2mPipe_payload_green = (source_rValid ? source_rData_green : source_payload_green);
  assign source_s2mPipe_payload_blue = (source_rValid ? source_rData_blue : source_payload_blue);
  always @(*) begin
    source_s2mPipe_ready = source_s2mPipe_m2sPipe_ready;
    if(when_Stream_l368) begin
      source_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l368 = (! source_s2mPipe_m2sPipe_valid);
  assign source_s2mPipe_m2sPipe_valid = source_s2mPipe_rValid;
  assign source_s2mPipe_m2sPipe_payload_red = source_s2mPipe_rData_red;
  assign source_s2mPipe_m2sPipe_payload_green = source_s2mPipe_rData_green;
  assign source_s2mPipe_m2sPipe_payload_blue = source_s2mPipe_rData_blue;
  assign sink_valid = source_s2mPipe_m2sPipe_valid;
  assign source_s2mPipe_m2sPipe_ready = sink_ready;
  assign sink_payload_red = source_s2mPipe_m2sPipe_payload_red;
  assign sink_payload_green = source_s2mPipe_m2sPipe_payload_green;
  assign sink_payload_blue = source_s2mPipe_m2sPipe_payload_blue;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      source_rValid <= 1'b0;
      source_s2mPipe_rValid <= 1'b0;
    end else begin
      if(source_valid) begin
        source_rValid <= 1'b1;
      end
      if(source_s2mPipe_ready) begin
        source_rValid <= 1'b0;
      end
      if(source_s2mPipe_ready) begin
        source_s2mPipe_rValid <= source_s2mPipe_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(source_ready) begin
      source_rData_red <= source_payload_red;
      source_rData_green <= source_payload_green;
      source_rData_blue <= source_payload_blue;
    end
    if(source_s2mPipe_ready) begin
      source_s2mPipe_rData_red <= source_s2mPipe_payload_red;
      source_s2mPipe_rData_green <= source_s2mPipe_payload_green;
      source_s2mPipe_rData_blue <= source_s2mPipe_payload_blue;
    end
  end


endmodule
