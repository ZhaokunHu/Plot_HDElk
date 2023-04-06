// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : UartCtrlRx
// Git hash  : 455af6249756c6aebd0d4a62d1a2c4602c01d851

`timescale 1ns/1ps

module UartCtrlRx (
  input               io_rxd,
  input               io_samplingTick,
  output reg          io_read_valid,
  output     [7:0]    io_read_payload,
  input               clk,
  input               reset
);
  localparam UartCtrlRxState_IDLE = 2'd0;
  localparam UartCtrlRxState_START = 2'd1;
  localparam UartCtrlRxState_DATA = 2'd2;
  localparam UartCtrlRxState_STOP = 2'd3;

  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire                sampler_samples_0;
  wire                sampler_samples_1;
  wire                sampler_samples_2;
  wire                sampler_samples_3;
  wire                sampler_samples_4;
  reg                 _zz_sampler_samples_0;
  reg                 _zz_sampler_samples_0_1;
  reg                 _zz_sampler_samples_1;
  reg                 _zz_sampler_samples_2;
  reg                 _zz_sampler_samples_3;
  reg                 _zz_sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_recenter;
  reg                 bitTimer_tick;
  wire                when_statemashine2_l50;
  reg        [2:0]    bitCounter_value;
  reg                 bitCounter_clear;
  reg        [1:0]    stateMachine_state;
  reg        [7:0]    stateMachine_buffer;
  wire                when_statemashine2_l83;
  wire                when_statemashine2_l97;
  `ifndef SYNTHESIS
  reg [39:0] stateMachine_state_string;
  `endif


  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  `ifndef SYNTHESIS
  always @(*) begin
    case(stateMachine_state)
      UartCtrlRxState_IDLE : stateMachine_state_string = "IDLE ";
      UartCtrlRxState_START : stateMachine_state_string = "START";
      UartCtrlRxState_DATA : stateMachine_state_string = "DATA ";
      UartCtrlRxState_STOP : stateMachine_state_string = "STOP ";
      default : stateMachine_state_string = "?????";
    endcase
  end
  `endif

  assign sampler_samples_0 = _zz_sampler_samples_0_1;
  assign sampler_samples_1 = _zz_sampler_samples_1;
  assign sampler_samples_2 = _zz_sampler_samples_2;
  assign sampler_samples_3 = _zz_sampler_samples_3;
  assign sampler_samples_4 = _zz_sampler_samples_4;
  always @(*) begin
    bitTimer_recenter = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
        if(when_statemashine2_l83) begin
          bitTimer_recenter = 1'b1;
        end
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_statemashine2_l50) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_statemashine2_l50 = (bitTimer_counter == 3'b000);
  always @(*) begin
    bitCounter_clear = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
        if(bitTimer_tick) begin
          bitCounter_clear = 1'b1;
        end
      end
      UartCtrlRxState_DATA : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_read_valid = 1'b0;
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
      end
      default : begin
        if(bitTimer_tick) begin
          io_read_valid = 1'b1;
        end
      end
    endcase
  end

  assign when_statemashine2_l83 = (sampler_tick && (! sampler_value));
  assign when_statemashine2_l97 = (bitCounter_value == 3'b111);
  assign io_read_payload = stateMachine_buffer;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_sampler_samples_0 <= 1'b1;
      _zz_sampler_samples_0_1 <= 1'b1;
      _zz_sampler_samples_1 <= 1'b1;
      _zz_sampler_samples_2 <= 1'b1;
      _zz_sampler_samples_3 <= 1'b1;
      _zz_sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      stateMachine_state <= UartCtrlRxState_IDLE;
    end else begin
      if(io_samplingTick) begin
        _zz_sampler_samples_0 <= io_rxd;
      end
      if(io_samplingTick) begin
        _zz_sampler_samples_0_1 <= _zz_sampler_samples_0;
      end
      if(io_samplingTick) begin
        _zz_sampler_samples_1 <= _zz_sampler_samples_0_1;
      end
      if(io_samplingTick) begin
        _zz_sampler_samples_2 <= _zz_sampler_samples_1;
      end
      if(io_samplingTick) begin
        _zz_sampler_samples_3 <= _zz_sampler_samples_2;
      end
      if(io_samplingTick) begin
        _zz_sampler_samples_4 <= _zz_sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      case(stateMachine_state)
        UartCtrlRxState_IDLE : begin
          if(when_statemashine2_l83) begin
            stateMachine_state <= UartCtrlRxState_START;
          end
        end
        UartCtrlRxState_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_DATA;
          end
        end
        UartCtrlRxState_DATA : begin
          if(bitTimer_tick) begin
            if(when_statemashine2_l97) begin
              stateMachine_state <= UartCtrlRxState_STOP;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            stateMachine_state <= UartCtrlRxState_IDLE;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_recenter) begin
      bitTimer_counter <= 3'b010;
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitCounter_clear) begin
      bitCounter_value <= 3'b000;
    end
    case(stateMachine_state)
      UartCtrlRxState_IDLE : begin
      end
      UartCtrlRxState_START : begin
      end
      UartCtrlRxState_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_buffer[bitCounter_value] <= sampler_value;
        end
      end
      default : begin
      end
    endcase
  end


endmodule
