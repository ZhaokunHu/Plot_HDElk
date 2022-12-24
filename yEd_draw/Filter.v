// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : Filter
// Git hash  : 9cfa5c257bc427633cee1279e1d8f097a181cef0

`timescale 1ns/1ps

module Filter (
  input               din_valid,
  input      [31:0]   din_payload,
  output              dout_valid,
  output     [31:0]   dout_payload,
  input               flush,
  input               smp_clk,
  input               smp_reset,
  input               clk
);

  wire                u_fifo_in_io_push_ready;
  wire                u_fifo_in_io_pop_valid;
  wire       [31:0]   u_fifo_in_io_pop_payload;
  wire       [3:0]    u_fifo_in_io_pushOccupancy;
  wire       [3:0]    u_fifo_in_io_popOccupancy;
  wire                din_toStream_valid;
  wire                din_toStream_ready;
  wire       [31:0]   din_toStream_payload;

  StreamFifoCC u_fifo_in (
    .io_push_valid    (din_toStream_valid             ), //i
    .io_push_ready    (u_fifo_in_io_push_ready        ), //o
    .io_push_payload  (din_toStream_payload[31:0]     ), //i
    .io_pop_valid     (u_fifo_in_io_pop_valid         ), //o
    .io_pop_ready     (1'b1                           ), //i
    .io_pop_payload   (u_fifo_in_io_pop_payload[31:0] ), //o
    .io_pushOccupancy (u_fifo_in_io_pushOccupancy[3:0]), //o
    .io_popOccupancy  (u_fifo_in_io_popOccupancy[3:0] ), //o
    .smp_clk          (smp_clk                        ), //i
    .smp_reset        (smp_reset                      ), //i
    .clk              (clk                            )  //i
  );
  assign din_toStream_valid = din_valid;
  assign din_toStream_payload = din_payload;
  assign din_toStream_ready = u_fifo_in_io_push_ready;
  assign dout_valid = u_fifo_in_io_pop_valid;
  assign dout_payload = u_fifo_in_io_pop_payload;

endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  output     [3:0]    io_pushOccupancy,
  output     [3:0]    io_popOccupancy,
  input               smp_clk,
  input               smp_reset,
  input               clk
);

  reg        [31:0]   _zz_ram_port1;
  wire       [3:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_3_io_dataOut;
  wire       [3:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [3:0]    _zz_pushCC_pushPtrGray;
  wire       [2:0]    _zz_ram_port;
  wire       [3:0]    _zz_popCC_popPtrGray;
  wire       [2:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [2:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [3:0]    popToPushGray;
  wire       [3:0]    pushToPopGray;
  reg        [3:0]    pushCC_pushPtr;
  wire       [3:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [3:0]    pushCC_pushPtrGray;
  wire       [3:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  wire                smp_reset_syncronized;
  reg        [3:0]    popCC_popPtr;
  wire       [3:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [3:0]    popCC_popPtrGray;
  wire       [3:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [3:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  reg [31:0] ram [0:7];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[2:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[2:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge smp_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge clk) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  BufferCC_2 popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[3:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[3:0]), //o
    .smp_clk    (smp_clk                               ), //i
    .smp_reset  (smp_reset                             )  //i
  );
  BufferCC_1 bufferCC_3 (
    .io_dataIn  (1'b0                 ), //i
    .io_dataOut (bufferCC_3_io_dataOut), //o
    .clk        (clk                  ), //i
    .smp_reset  (smp_reset            )  //i
  );
  BufferCC pushToPopGray_buffercc (
    .io_dataIn             (pushToPopGray[3:0]                    ), //i
    .io_dataOut            (pushToPopGray_buffercc_io_dataOut[3:0]), //o
    .clk                   (clk                                   ), //i
    .smp_reset_syncronized (smp_reset_syncronized                 )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 4'b0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[3 : 2] == (~ pushCC_popPtrGray[3 : 2])) && (pushCC_pushPtrGray[1 : 0] == pushCC_popPtrGray[1 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = pushCC_popPtrGray[3];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}});
  assign smp_reset_syncronized = bufferCC_3_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 4'b0001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = popCC_pushPtrGray[3];
  assign io_popOccupancy = ({_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge smp_clk or posedge smp_reset) begin
    if(smp_reset) begin
      pushCC_pushPtr <= 4'b0000;
      pushCC_pushPtrGray <= 4'b0000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk or posedge smp_reset_syncronized) begin
    if(smp_reset_syncronized) begin
      popCC_popPtr <= 4'b0000;
      popCC_popPtrGray <= 4'b0000;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module BufferCC (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               clk,
  input               smp_reset_syncronized
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge smp_reset_syncronized) begin
    if(smp_reset_syncronized) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               smp_reset
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge smp_reset) begin
    if(smp_reset) begin
      buffers_0 <= 1'b1;
      buffers_1 <= 1'b1;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_2 (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               smp_clk,
  input               smp_reset
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge smp_clk or posedge smp_reset) begin
    if(smp_reset) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
