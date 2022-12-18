// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : ApbArbiter
// Git hash  : 64cdcb8e778794d71adc2d2caf7885f8274bca36

`timescale 1ns/1ps

module ApbArbiter (
  input               io_en,
  output reg [3:0]    io_masterOut_PADDR,
  output reg [0:0]    io_masterOut_PSEL,
  output reg          io_masterOut_PENABLE,
  input               io_masterOut_PREADY,
  output reg          io_masterOut_PWRITE,
  output reg [31:0]   io_masterOut_PWDATA,
  input      [31:0]   io_masterOut_PRDATA,
  input      [3:0]    io_slavesIn_0_PADDR,
  input      [0:0]    io_slavesIn_0_PSEL,
  input               io_slavesIn_0_PENABLE,
  output              io_slavesIn_0_PREADY,
  input               io_slavesIn_0_PWRITE,
  input      [31:0]   io_slavesIn_0_PWDATA,
  output     [31:0]   io_slavesIn_0_PRDATA,
  input      [3:0]    io_slavesIn_1_PADDR,
  input      [0:0]    io_slavesIn_1_PSEL,
  input               io_slavesIn_1_PENABLE,
  output              io_slavesIn_1_PREADY,
  input               io_slavesIn_1_PWRITE,
  input      [31:0]   io_slavesIn_1_PWDATA,
  output     [31:0]   io_slavesIn_1_PRDATA,
  input      [3:0]    io_slavesIn_2_PADDR,
  input      [0:0]    io_slavesIn_2_PSEL,
  input               io_slavesIn_2_PENABLE,
  output              io_slavesIn_2_PREADY,
  input               io_slavesIn_2_PWRITE,
  input      [31:0]   io_slavesIn_2_PWDATA,
  output     [31:0]   io_slavesIn_2_PRDATA,
  input      [3:0]    io_slavesIn_3_PADDR,
  input      [0:0]    io_slavesIn_3_PSEL,
  input               io_slavesIn_3_PENABLE,
  output              io_slavesIn_3_PREADY,
  input               io_slavesIn_3_PWRITE,
  input      [31:0]   io_slavesIn_3_PWDATA,
  output     [31:0]   io_slavesIn_3_PRDATA,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz__zz_select_2;
  wire       [7:0]    _zz__zz_select_2_1;
  wire       [3:0]    _zz__zz_select_2_2;
  reg        [3:0]    _zz_io_masterOut_PADDR;
  reg        [0:0]    _zz_io_masterOut_PSEL;
  reg                 _zz_io_masterOut_PENABLE;
  reg                 _zz_io_masterOut_PWRITE;
  reg        [31:0]   _zz_io_masterOut_PWDATA;
  reg        [3:0]    slaveRegVec_0_PADDR;
  reg        [0:0]    slaveRegVec_0_PSEL;
  reg                 slaveRegVec_0_PENABLE;
  reg                 slaveRegVec_0_PREADY;
  reg                 slaveRegVec_0_PWRITE;
  reg        [31:0]   slaveRegVec_0_PWDATA;
  reg        [31:0]   slaveRegVec_0_PRDATA;
  reg        [3:0]    slaveRegVec_1_PADDR;
  reg        [0:0]    slaveRegVec_1_PSEL;
  reg                 slaveRegVec_1_PENABLE;
  reg                 slaveRegVec_1_PREADY;
  reg                 slaveRegVec_1_PWRITE;
  reg        [31:0]   slaveRegVec_1_PWDATA;
  reg        [31:0]   slaveRegVec_1_PRDATA;
  reg        [3:0]    slaveRegVec_2_PADDR;
  reg        [0:0]    slaveRegVec_2_PSEL;
  reg                 slaveRegVec_2_PENABLE;
  reg                 slaveRegVec_2_PREADY;
  reg                 slaveRegVec_2_PWRITE;
  reg        [31:0]   slaveRegVec_2_PWDATA;
  reg        [31:0]   slaveRegVec_2_PRDATA;
  reg        [3:0]    slaveRegVec_3_PADDR;
  reg        [0:0]    slaveRegVec_3_PSEL;
  reg                 slaveRegVec_3_PENABLE;
  reg                 slaveRegVec_3_PREADY;
  reg                 slaveRegVec_3_PWRITE;
  reg        [31:0]   slaveRegVec_3_PWDATA;
  reg        [31:0]   slaveRegVec_3_PRDATA;
  wire                done;
  reg        [3:0]    apbReqBits;
  wire                when_apb33_l40;
  wire                when_apb33_l40_1;
  wire                when_apb33_l40_2;
  wire                when_apb33_l40_3;
  reg        [3:0]    priority_1;
  wire       [3:0]    _zz_select;
  wire       [7:0]    _zz_select_1;
  wire       [7:0]    _zz_select_2;
  wire       [3:0]    select_1;
  wire                _zz_selectIdx;
  wire                _zz_selectIdx_1;
  wire                _zz_selectIdx_2;
  wire       [1:0]    selectIdx;
  wire       [3:0]    _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                when_apb33_l53;

  assign _zz__zz_select_2 = (_zz_select_1 - _zz__zz_select_2_1);
  assign _zz__zz_select_2_2 = priority_1;
  assign _zz__zz_select_2_1 = {4'd0, _zz__zz_select_2_2};
  always @(*) begin
    case(selectIdx)
      2'b00 : begin
        _zz_io_masterOut_PADDR = slaveRegVec_0_PADDR;
        _zz_io_masterOut_PSEL = slaveRegVec_0_PSEL;
        _zz_io_masterOut_PENABLE = slaveRegVec_0_PENABLE;
        _zz_io_masterOut_PWRITE = slaveRegVec_0_PWRITE;
        _zz_io_masterOut_PWDATA = slaveRegVec_0_PWDATA;
      end
      2'b01 : begin
        _zz_io_masterOut_PADDR = slaveRegVec_1_PADDR;
        _zz_io_masterOut_PSEL = slaveRegVec_1_PSEL;
        _zz_io_masterOut_PENABLE = slaveRegVec_1_PENABLE;
        _zz_io_masterOut_PWRITE = slaveRegVec_1_PWRITE;
        _zz_io_masterOut_PWDATA = slaveRegVec_1_PWDATA;
      end
      2'b10 : begin
        _zz_io_masterOut_PADDR = slaveRegVec_2_PADDR;
        _zz_io_masterOut_PSEL = slaveRegVec_2_PSEL;
        _zz_io_masterOut_PENABLE = slaveRegVec_2_PENABLE;
        _zz_io_masterOut_PWRITE = slaveRegVec_2_PWRITE;
        _zz_io_masterOut_PWDATA = slaveRegVec_2_PWDATA;
      end
      default : begin
        _zz_io_masterOut_PADDR = slaveRegVec_3_PADDR;
        _zz_io_masterOut_PSEL = slaveRegVec_3_PSEL;
        _zz_io_masterOut_PENABLE = slaveRegVec_3_PENABLE;
        _zz_io_masterOut_PWRITE = slaveRegVec_3_PWRITE;
        _zz_io_masterOut_PWDATA = slaveRegVec_3_PWDATA;
      end
    endcase
  end

  always @(*) begin
    io_masterOut_PSEL = 1'b0;
    if(io_en) begin
      if(when_apb33_l53) begin
        io_masterOut_PSEL = _zz_io_masterOut_PSEL;
      end
    end
  end

  always @(*) begin
    io_masterOut_PENABLE = 1'b0;
    if(io_en) begin
      if(when_apb33_l53) begin
        io_masterOut_PENABLE = _zz_io_masterOut_PENABLE;
      end
    end
  end

  always @(*) begin
    io_masterOut_PADDR = 4'b0000;
    if(io_en) begin
      if(when_apb33_l53) begin
        io_masterOut_PADDR = _zz_io_masterOut_PADDR;
      end
    end
  end

  always @(*) begin
    io_masterOut_PWDATA = 32'h0;
    if(io_en) begin
      if(when_apb33_l53) begin
        io_masterOut_PWDATA = _zz_io_masterOut_PWDATA;
      end
    end
  end

  always @(*) begin
    io_masterOut_PWRITE = 1'b0;
    if(io_en) begin
      if(when_apb33_l53) begin
        io_masterOut_PWRITE = _zz_io_masterOut_PWRITE;
      end
    end
  end

  assign io_slavesIn_0_PREADY = slaveRegVec_0_PREADY;
  assign io_slavesIn_0_PRDATA = slaveRegVec_0_PRDATA;
  assign io_slavesIn_1_PREADY = slaveRegVec_1_PREADY;
  assign io_slavesIn_1_PRDATA = slaveRegVec_1_PRDATA;
  assign io_slavesIn_2_PREADY = slaveRegVec_2_PREADY;
  assign io_slavesIn_2_PRDATA = slaveRegVec_2_PRDATA;
  assign io_slavesIn_3_PREADY = slaveRegVec_3_PREADY;
  assign io_slavesIn_3_PRDATA = slaveRegVec_3_PRDATA;
  assign done = ((io_masterOut_PREADY && (io_masterOut_PSEL == 1'b1)) && io_masterOut_PENABLE);
  assign when_apb33_l40 = (((io_slavesIn_0_PSEL == 1'b1) && io_slavesIn_0_PENABLE) && (! io_slavesIn_0_PREADY));
  always @(*) begin
    if(when_apb33_l40) begin
      apbReqBits[0] = 1'b1;
    end else begin
      apbReqBits[0] = 1'b0;
    end
    if(when_apb33_l40_1) begin
      apbReqBits[1] = 1'b1;
    end else begin
      apbReqBits[1] = 1'b0;
    end
    if(when_apb33_l40_2) begin
      apbReqBits[2] = 1'b1;
    end else begin
      apbReqBits[2] = 1'b0;
    end
    if(when_apb33_l40_3) begin
      apbReqBits[3] = 1'b1;
    end else begin
      apbReqBits[3] = 1'b0;
    end
  end

  assign when_apb33_l40_1 = (((io_slavesIn_1_PSEL == 1'b1) && io_slavesIn_1_PENABLE) && (! io_slavesIn_1_PREADY));
  assign when_apb33_l40_2 = (((io_slavesIn_2_PSEL == 1'b1) && io_slavesIn_2_PENABLE) && (! io_slavesIn_2_PREADY));
  assign when_apb33_l40_3 = (((io_slavesIn_3_PSEL == 1'b1) && io_slavesIn_3_PENABLE) && (! io_slavesIn_3_PREADY));
  assign _zz_select = apbReqBits;
  assign _zz_select_1 = {_zz_select,_zz_select};
  assign _zz_select_2 = (_zz_select_1 & (~ _zz__zz_select_2));
  assign select_1 = (_zz_select_2[7 : 4] | _zz_select_2[3 : 0]);
  assign _zz_selectIdx = select_1[3];
  assign _zz_selectIdx_1 = (select_1[1] || _zz_selectIdx);
  assign _zz_selectIdx_2 = (select_1[2] || _zz_selectIdx);
  assign selectIdx = {_zz_selectIdx_2,_zz_selectIdx_1};
  assign _zz_1 = ({3'd0,1'b1} <<< selectIdx);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign _zz_4 = _zz_1[2];
  assign _zz_5 = _zz_1[3];
  assign when_apb33_l53 = (|select_1);
  always @(posedge clk) begin
    slaveRegVec_0_PREADY <= 1'b0;
    slaveRegVec_0_PRDATA <= 32'h0;
    slaveRegVec_0_PADDR <= io_slavesIn_0_PADDR;
    slaveRegVec_0_PSEL <= io_slavesIn_0_PSEL;
    slaveRegVec_0_PENABLE <= io_slavesIn_0_PENABLE;
    slaveRegVec_0_PWRITE <= io_slavesIn_0_PWRITE;
    slaveRegVec_0_PWDATA <= io_slavesIn_0_PWDATA;
    slaveRegVec_1_PREADY <= 1'b0;
    slaveRegVec_1_PRDATA <= 32'h0;
    slaveRegVec_1_PADDR <= io_slavesIn_1_PADDR;
    slaveRegVec_1_PSEL <= io_slavesIn_1_PSEL;
    slaveRegVec_1_PENABLE <= io_slavesIn_1_PENABLE;
    slaveRegVec_1_PWRITE <= io_slavesIn_1_PWRITE;
    slaveRegVec_1_PWDATA <= io_slavesIn_1_PWDATA;
    slaveRegVec_2_PREADY <= 1'b0;
    slaveRegVec_2_PRDATA <= 32'h0;
    slaveRegVec_2_PADDR <= io_slavesIn_2_PADDR;
    slaveRegVec_2_PSEL <= io_slavesIn_2_PSEL;
    slaveRegVec_2_PENABLE <= io_slavesIn_2_PENABLE;
    slaveRegVec_2_PWRITE <= io_slavesIn_2_PWRITE;
    slaveRegVec_2_PWDATA <= io_slavesIn_2_PWDATA;
    slaveRegVec_3_PREADY <= 1'b0;
    slaveRegVec_3_PRDATA <= 32'h0;
    slaveRegVec_3_PADDR <= io_slavesIn_3_PADDR;
    slaveRegVec_3_PSEL <= io_slavesIn_3_PSEL;
    slaveRegVec_3_PENABLE <= io_slavesIn_3_PENABLE;
    slaveRegVec_3_PWRITE <= io_slavesIn_3_PWRITE;
    slaveRegVec_3_PWDATA <= io_slavesIn_3_PWDATA;
    if(io_en) begin
      if(when_apb33_l53) begin
        if(_zz_2) begin
          slaveRegVec_0_PREADY <= io_masterOut_PREADY;
        end
        if(_zz_3) begin
          slaveRegVec_1_PREADY <= io_masterOut_PREADY;
        end
        if(_zz_4) begin
          slaveRegVec_2_PREADY <= io_masterOut_PREADY;
        end
        if(_zz_5) begin
          slaveRegVec_3_PREADY <= io_masterOut_PREADY;
        end
        if(_zz_2) begin
          slaveRegVec_0_PRDATA <= io_masterOut_PRDATA;
        end
        if(_zz_3) begin
          slaveRegVec_1_PRDATA <= io_masterOut_PRDATA;
        end
        if(_zz_4) begin
          slaveRegVec_2_PRDATA <= io_masterOut_PRDATA;
        end
        if(_zz_5) begin
          slaveRegVec_3_PRDATA <= io_masterOut_PRDATA;
        end
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      priority_1 <= 4'b0001;
    end else begin
      if(io_en) begin
        if(done) begin
          priority_1 <= {priority_1[2 : 0],priority_1[3 : 3]};
        end
      end
    end
  end


endmodule
