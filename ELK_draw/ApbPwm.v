// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : ApbPwm
// Git hash  : 455af6249756c6aebd0d4a62d1a2c4602c01d851

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
  assign when_statemashine_l45 = (logic_timer == 8'h0);
  assign when_statemashine_l48 = (logic_timer == logic_dutyCycle);
  assign io_pwm = logic_output;
  assign control_doWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[0] = logic_enable;
      end
      8'h04 : begin
        io_apb_PRDATA = {24'd0, _zz_io_apb_PRDATA};
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PREADY = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_enable <= 1'b0;
      logic_timer <= 8'h0;
      logic_output <= 1'b0;
    end else begin
      if(logic_enable) begin
        logic_timer <= (logic_timer + 8'h01);
      end
      if(when_statemashine_l45) begin
        logic_output <= 1'b1;
      end
      if(when_statemashine_l48) begin
        logic_output <= 1'b0;
      end
      case(io_apb_PADDR)
        8'h0 : begin
          if(control_doWrite) begin
            logic_enable <= io_apb_PWDATA[0];
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
          logic_dutyCycle <= _zz_logic_dutyCycle[7:0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule
