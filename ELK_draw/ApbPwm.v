// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : ApbPwm
// Git hash  : 45eabadd02e7b5c0c91c2bc874aaa882a5db9494

`timescale 1ns/1ps

module ApbPwm (
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  input      [7:0]    io_apb_PADDR,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PREADY,
  output              io_pwm,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz_io_apb_PRDATA;
  wire       [31:0]   _zz_logic_dutyCycle;
  reg                 logic_enable;
  reg        [7:0]    logic_timer;
  reg        [7:0]    logic_dutyCycle;
  reg                 logic_output;
  wire                when_statemashine_l45;
  wire                when_statemashine_l48;
  wire                control_doWrite;

  assign _zz_io_apb_PRDATA = logic_dutyCycle;
  assign _zz_logic_dutyCycle = io_apb_PWDATA;
  assign when_statemashine_l45 = (logic_timer == 8'h0); // @[BaseType.scala 305:24]
  assign when_statemashine_l48 = (logic_timer == logic_dutyCycle); // @[BaseType.scala 305:24]
  assign io_pwm = logic_output; // @[statemashine.scala 51:12]
  assign control_doWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE); // @[BaseType.scala 305:24]
  always @(*) begin
    io_apb_PRDATA = 32'h0; // @[statemashine.scala 56:19]
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[0] = logic_enable; // @[statemashine.scala 60:26]
      end
      8'h04 : begin
        io_apb_PRDATA = {24'd0, _zz_io_apb_PRDATA}; // @[statemashine.scala 66:23]
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PREADY = 1'b1; // @[statemashine.scala 57:19]
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_enable <= 1'b0; // @[Data.scala 400:33]
      logic_timer <= 8'h0; // @[Data.scala 400:33]
      logic_output <= 1'b0; // @[Data.scala 400:33]
    end else begin
      if(logic_enable) begin
        logic_timer <= (logic_timer + 8'h01); // @[statemashine.scala 42:13]
      end
      if(when_statemashine_l45) begin
        logic_output <= 1'b1; // @[statemashine.scala 46:14]
      end
      if(when_statemashine_l48) begin
        logic_output <= 1'b0; // @[statemashine.scala 49:14]
      end
      case(io_apb_PADDR)
        8'h0 : begin
          if(control_doWrite) begin
            logic_enable <= io_apb_PWDATA[0]; // @[statemashine.scala 62:24]
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(io_apb_PADDR)
      8'h04 : begin
        if(control_doWrite) begin
          logic_dutyCycle <= _zz_logic_dutyCycle[7:0]; // @[statemashine.scala 68:27]
        end
      end
      default : begin
      end
    endcase
  end


endmodule
