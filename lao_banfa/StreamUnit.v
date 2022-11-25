// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : StreamUnit

`timescale 1ns/1ps

module StreamUnit (
  input               io_memWrite_valid,
  input      [7:0]    io_memWrite_payload_address,
  input      [31:0]   io_memWrite_payload_data,
  input               io_cmdA_valid,
  output              io_cmdA_ready,
  input      [7:0]    io_cmdA_payload,
  input               io_cmdB_valid,
  output              io_cmdB_ready,
  input      [31:0]   io_cmdB_payload,
  output              io_rsp_valid,
  input               io_rsp_ready,
  output     [31:0]   io_rsp_payload,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_mem_port1;
  wire                memReadStream_valid;
  wire                memReadStream_ready;
  wire       [31:0]   memReadStream_payload;
  reg                 _zz_memReadStream_valid;
  wire                memReadStream_isFree;
  wire                _zz_io_cmdB_ready;
  wire                _zz_io_cmdB_ready_1;
  reg [31:0] mem [0:255];

  always @(posedge clk) begin
    if(io_memWrite_valid) begin
      mem[io_memWrite_payload_address] <= io_memWrite_payload_data;
    end
  end

  always @(posedge clk) begin
    if(io_cmdA_ready) begin
      _zz_mem_port1 <= mem[io_cmdA_payload];
    end
  end

  assign memReadStream_isFree = ((! memReadStream_valid) || memReadStream_ready);
  assign io_cmdA_ready = memReadStream_isFree;
  assign memReadStream_valid = _zz_memReadStream_valid;
  assign memReadStream_payload = _zz_mem_port1;
  assign _zz_io_cmdB_ready_1 = (_zz_io_cmdB_ready && io_rsp_ready);
  assign _zz_io_cmdB_ready = (memReadStream_valid && io_cmdB_valid);
  assign memReadStream_ready = _zz_io_cmdB_ready_1;
  assign io_cmdB_ready = _zz_io_cmdB_ready_1;
  assign io_rsp_valid = _zz_io_cmdB_ready;
  assign io_rsp_payload = (memReadStream_payload ^ io_cmdB_payload);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_memReadStream_valid <= 1'b0;
    end else begin
      if(memReadStream_ready) begin
        _zz_memReadStream_valid <= 1'b0;
      end
      if(io_cmdA_ready) begin
        _zz_memReadStream_valid <= io_cmdA_valid;
      end
    end
  end


endmodule
