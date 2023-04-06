// Generator : SpinalHDL v1.8.0b    git head : 761a30e521263983ddf14de3592f7a9f38bf0589
// Component : LedMatrix
// Git hash  : 455af6249756c6aebd0d4a62d1a2c4602c01d851

`timescale 1ns/1ps

module LedMatrix (
  output reg [34:0]   io_col,
  output     [5:0]    io_row,
  input               bus_write,
  input      [6:0]    bus_address,
  input      [31:0]   bus_writeData,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz_pwm_pwmCnt_valueNext;
  wire       [0:0]    _zz_pwm_pwmCnt_valueNext_1;
  wire                _zz_ledSta;
  wire       [0:0]    _zz_ledSta_1;
  wire       [64:0]   _zz_ledSta_2;
  wire                _zz_ledSta_3;
  wire       [0:0]    _zz_ledSta_4;
  wire       [56:0]   _zz_ledSta_5;
  wire                _zz_ledSta_6;
  wire       [0:0]    _zz_ledSta_7;
  wire       [48:0]   _zz_ledSta_8;
  wire                _zz_ledSta_9;
  wire       [0:0]    _zz_ledSta_10;
  wire       [40:0]   _zz_ledSta_11;
  wire                _zz_ledSta_12;
  wire       [0:0]    _zz_ledSta_13;
  wire       [32:0]   _zz_ledSta_14;
  wire                _zz_ledSta_15;
  wire       [0:0]    _zz_ledSta_16;
  wire       [24:0]   _zz_ledSta_17;
  wire                _zz_ledSta_18;
  wire       [0:0]    _zz_ledSta_19;
  wire       [16:0]   _zz_ledSta_20;
  wire                _zz_ledSta_21;
  wire       [0:0]    _zz_ledSta_22;
  wire       [8:0]    _zz_ledSta_23;
  wire                _zz_ledSta_24;
  wire       [0:0]    _zz_ledSta_25;
  wire       [0:0]    _zz_ledSta_26;
  wire       [2:0]    _zz_scanner_rowCnt_valueNext;
  wire       [0:0]    _zz_scanner_rowCnt_valueNext_1;
  wire       [5:0]    _zz_io_row;
  wire       [7:0]    regs_ice_0;
  wire       [7:0]    regs_ice_1;
  wire       [7:0]    regs_ice_2;
  wire       [7:0]    regs_ice_3;
  wire       [7:0]    regs_ice_4;
  wire       [7:0]    regs_ice_5;
  wire       [7:0]    regs_ice_6;
  wire       [7:0]    regs_ice_7;
  wire       [7:0]    regs_ice_8;
  wire       [7:0]    regs_ice_9;
  wire       [7:0]    regs_ice_10;
  wire       [7:0]    regs_ice_11;
  wire       [7:0]    regs_ice_12;
  wire       [7:0]    regs_ice_13;
  wire       [7:0]    regs_ice_14;
  wire       [7:0]    regs_ice_15;
  wire       [7:0]    regs_ice_16;
  wire       [7:0]    regs_ice_17;
  wire       [7:0]    regs_ice_18;
  wire       [7:0]    regs_ice_19;
  wire       [7:0]    regs_ice_20;
  wire       [7:0]    regs_ice_21;
  wire       [7:0]    regs_ice_22;
  wire       [7:0]    regs_ice_23;
  wire       [7:0]    regs_ice_24;
  wire       [7:0]    regs_ice_25;
  wire       [7:0]    regs_ice_26;
  wire       [7:0]    regs_ice_27;
  wire       [7:0]    regs_ice_28;
  wire       [7:0]    regs_ice_29;
  wire       [7:0]    regs_ice_30;
  wire       [7:0]    regs_ice_31;
  wire       [7:0]    regs_ice_32;
  wire       [7:0]    regs_ice_33;
  wire       [7:0]    regs_ice_34;
  wire       [7:0]    regs_ice_35;
  wire       [7:0]    regs_ice_36;
  wire       [7:0]    regs_ice_37;
  wire       [7:0]    regs_ice_38;
  wire       [7:0]    regs_ice_39;
  wire       [7:0]    regs_ice_40;
  wire       [7:0]    regs_ice_41;
  wire       [7:0]    regs_ice_42;
  wire       [7:0]    regs_ice_43;
  wire       [7:0]    regs_ice_44;
  wire       [7:0]    regs_ice_45;
  wire       [7:0]    regs_ice_46;
  wire       [7:0]    regs_ice_47;
  wire       [7:0]    regs_ice_48;
  wire       [7:0]    regs_ice_49;
  wire       [7:0]    regs_ice_50;
  wire       [7:0]    regs_ice_51;
  wire       [7:0]    regs_ice_52;
  wire       [7:0]    regs_ice_53;
  wire       [7:0]    regs_ice_54;
  wire       [7:0]    regs_ice_55;
  wire       [7:0]    regs_ice_56;
  wire       [7:0]    regs_ice_57;
  wire       [7:0]    regs_ice_58;
  wire       [7:0]    regs_ice_59;
  wire       [7:0]    regs_ice_60;
  wire       [7:0]    regs_ice_61;
  wire       [7:0]    regs_ice_62;
  wire       [7:0]    regs_ice_63;
  wire       [7:0]    regs_ice_64;
  wire       [7:0]    regs_ice_65;
  wire       [7:0]    regs_ice_66;
  wire       [7:0]    regs_ice_67;
  wire       [7:0]    regs_ice_68;
  wire       [7:0]    regs_ice_69;
  wire       [7:0]    regs_ice_70;
  wire       [7:0]    regs_ice_71;
  wire       [7:0]    regs_ice_72;
  wire       [15:0]   regs_fn;
  wire       [7:0]    regs_locks_0;
  wire       [7:0]    regs_locks_1;
  wire       [7:0]    regs_locks_2;
  wire       [23:0]   regs_rgb_0;
  wire       [23:0]   regs_rgb_1;
  wire       [23:0]   regs_rgb_2;
  wire       [23:0]   regs_rgb_3;
  wire       [23:0]   regs_rgb_4;
  wire       [23:0]   regs_rgb_5;
  wire       [23:0]   regs_rgb_6;
  wire       [23:0]   regs_rgb_7;
  wire       [23:0]   regs_rgb_8;
  wire       [23:0]   regs_rgb_9;
  wire       [23:0]   regs_rgb_10;
  wire       [23:0]   regs_rgb_11;
  wire       [23:0]   regs_rgb_12;
  wire       [23:0]   regs_rgb_13;
  wire       [23:0]   regs_rgb_14;
  wire       [23:0]   regs_rgb_15;
  wire       [23:0]   regs_rgb_16;
  wire       [23:0]   regs_rgb_17;
  wire       [23:0]   regs_rgb_18;
  wire       [23:0]   regs_rgb_19;
  wire       [23:0]   regs_rgb_20;
  wire       [23:0]   regs_rgb_21;
  wire       [23:0]   regs_rgb_22;
  wire       [23:0]   regs_rgb_23;
  wire       [23:0]   regs_rgb_24;
  wire       [23:0]   regs_rgb_25;
  wire       [23:0]   regs_rgb_26;
  wire       [23:0]   regs_rgb_27;
  wire       [23:0]   regs_rgb_28;
  wire       [23:0]   regs_rgb_29;
  wire                when_LedMatrix_l21;
  reg        [31:0]   _zz_regs_ice_0;
  wire                when_LedMatrix_l21_1;
  reg        [31:0]   _zz_regs_ice_1;
  wire                when_LedMatrix_l21_2;
  reg        [31:0]   _zz_regs_ice_2;
  wire                when_LedMatrix_l21_3;
  reg        [31:0]   _zz_regs_ice_3;
  wire                when_LedMatrix_l21_4;
  reg        [31:0]   _zz_regs_ice_4;
  wire                when_LedMatrix_l21_5;
  reg        [31:0]   _zz_regs_ice_5;
  wire                when_LedMatrix_l21_6;
  reg        [31:0]   _zz_regs_ice_6;
  wire                when_LedMatrix_l21_7;
  reg        [31:0]   _zz_regs_ice_7;
  wire                when_LedMatrix_l21_8;
  reg        [31:0]   _zz_regs_ice_8;
  wire                when_LedMatrix_l21_9;
  reg        [31:0]   _zz_regs_ice_9;
  wire                when_LedMatrix_l21_10;
  reg        [31:0]   _zz_regs_ice_10;
  wire                when_LedMatrix_l21_11;
  reg        [31:0]   _zz_regs_ice_11;
  wire                when_LedMatrix_l21_12;
  reg        [31:0]   _zz_regs_ice_12;
  wire                when_LedMatrix_l21_13;
  reg        [31:0]   _zz_regs_ice_13;
  wire                when_LedMatrix_l21_14;
  reg        [31:0]   _zz_regs_ice_14;
  wire                when_LedMatrix_l21_15;
  reg        [31:0]   _zz_regs_ice_15;
  wire                when_LedMatrix_l21_16;
  reg        [31:0]   _zz_regs_ice_16;
  wire                when_LedMatrix_l21_17;
  reg        [31:0]   _zz_regs_ice_17;
  wire                when_LedMatrix_l21_18;
  reg        [31:0]   _zz_regs_ice_18;
  wire                when_LedMatrix_l21_19;
  reg        [31:0]   _zz_regs_ice_19;
  wire                when_LedMatrix_l21_20;
  reg        [31:0]   _zz_regs_ice_20;
  wire                when_LedMatrix_l21_21;
  reg        [31:0]   _zz_regs_ice_21;
  wire                when_LedMatrix_l21_22;
  reg        [31:0]   _zz_regs_ice_22;
  wire                when_LedMatrix_l21_23;
  reg        [31:0]   _zz_regs_ice_23;
  wire                when_LedMatrix_l21_24;
  reg        [31:0]   _zz_regs_ice_24;
  wire                when_LedMatrix_l21_25;
  reg        [31:0]   _zz_regs_ice_25;
  wire                when_LedMatrix_l21_26;
  reg        [31:0]   _zz_regs_ice_26;
  wire                when_LedMatrix_l21_27;
  reg        [31:0]   _zz_regs_ice_27;
  wire                when_LedMatrix_l21_28;
  reg        [31:0]   _zz_regs_ice_28;
  wire                when_LedMatrix_l21_29;
  reg        [31:0]   _zz_regs_ice_29;
  wire                when_LedMatrix_l21_30;
  reg        [31:0]   _zz_regs_ice_30;
  wire                when_LedMatrix_l21_31;
  reg        [31:0]   _zz_regs_ice_31;
  wire                when_LedMatrix_l21_32;
  reg        [31:0]   _zz_regs_ice_32;
  wire                when_LedMatrix_l21_33;
  reg        [31:0]   _zz_regs_ice_33;
  wire                when_LedMatrix_l21_34;
  reg        [31:0]   _zz_regs_ice_34;
  wire                when_LedMatrix_l21_35;
  reg        [31:0]   _zz_regs_ice_35;
  wire                when_LedMatrix_l21_36;
  reg        [31:0]   _zz_regs_ice_36;
  wire                when_LedMatrix_l21_37;
  reg        [31:0]   _zz_regs_ice_37;
  wire                when_LedMatrix_l21_38;
  reg        [31:0]   _zz_regs_ice_38;
  wire                when_LedMatrix_l21_39;
  reg        [31:0]   _zz_regs_ice_39;
  wire                when_LedMatrix_l21_40;
  reg        [31:0]   _zz_regs_ice_40;
  wire                when_LedMatrix_l21_41;
  reg        [31:0]   _zz_regs_ice_41;
  wire                when_LedMatrix_l21_42;
  reg        [31:0]   _zz_regs_ice_42;
  wire                when_LedMatrix_l21_43;
  reg        [31:0]   _zz_regs_ice_43;
  wire                when_LedMatrix_l21_44;
  reg        [31:0]   _zz_regs_ice_44;
  wire                when_LedMatrix_l21_45;
  reg        [31:0]   _zz_regs_ice_45;
  wire                when_LedMatrix_l21_46;
  reg        [31:0]   _zz_regs_ice_46;
  wire                when_LedMatrix_l21_47;
  reg        [31:0]   _zz_regs_ice_47;
  wire                when_LedMatrix_l21_48;
  reg        [31:0]   _zz_regs_ice_48;
  wire                when_LedMatrix_l21_49;
  reg        [31:0]   _zz_regs_ice_49;
  wire                when_LedMatrix_l21_50;
  reg        [31:0]   _zz_regs_ice_50;
  wire                when_LedMatrix_l21_51;
  reg        [31:0]   _zz_regs_ice_51;
  wire                when_LedMatrix_l21_52;
  reg        [31:0]   _zz_regs_ice_52;
  wire                when_LedMatrix_l21_53;
  reg        [31:0]   _zz_regs_ice_53;
  wire                when_LedMatrix_l21_54;
  reg        [31:0]   _zz_regs_ice_54;
  wire                when_LedMatrix_l21_55;
  reg        [31:0]   _zz_regs_ice_55;
  wire                when_LedMatrix_l21_56;
  reg        [31:0]   _zz_regs_ice_56;
  wire                when_LedMatrix_l21_57;
  reg        [31:0]   _zz_regs_ice_57;
  wire                when_LedMatrix_l21_58;
  reg        [31:0]   _zz_regs_ice_58;
  wire                when_LedMatrix_l21_59;
  reg        [31:0]   _zz_regs_ice_59;
  wire                when_LedMatrix_l21_60;
  reg        [31:0]   _zz_regs_ice_60;
  wire                when_LedMatrix_l21_61;
  reg        [31:0]   _zz_regs_ice_61;
  wire                when_LedMatrix_l21_62;
  reg        [31:0]   _zz_regs_ice_62;
  wire                when_LedMatrix_l21_63;
  reg        [31:0]   _zz_regs_ice_63;
  wire                when_LedMatrix_l21_64;
  reg        [31:0]   _zz_regs_ice_64;
  wire                when_LedMatrix_l21_65;
  reg        [31:0]   _zz_regs_ice_65;
  wire                when_LedMatrix_l21_66;
  reg        [31:0]   _zz_regs_ice_66;
  wire                when_LedMatrix_l21_67;
  reg        [31:0]   _zz_regs_ice_67;
  wire                when_LedMatrix_l21_68;
  reg        [31:0]   _zz_regs_ice_68;
  wire                when_LedMatrix_l21_69;
  reg        [31:0]   _zz_regs_ice_69;
  wire                when_LedMatrix_l21_70;
  reg        [31:0]   _zz_regs_ice_70;
  wire                when_LedMatrix_l21_71;
  reg        [31:0]   _zz_regs_ice_71;
  wire                when_LedMatrix_l21_72;
  reg        [31:0]   _zz_regs_ice_72;
  wire                when_LedMatrix_l21_73;
  reg        [31:0]   _zz_regs_fn;
  wire                when_LedMatrix_l21_74;
  reg        [31:0]   _zz_regs_rgb_0;
  wire                when_LedMatrix_l21_75;
  reg        [31:0]   _zz_regs_rgb_1;
  wire                when_LedMatrix_l21_76;
  reg        [31:0]   _zz_regs_rgb_2;
  wire                when_LedMatrix_l21_77;
  reg        [31:0]   _zz_regs_rgb_3;
  wire                when_LedMatrix_l21_78;
  reg        [31:0]   _zz_regs_rgb_4;
  wire                when_LedMatrix_l21_79;
  reg        [31:0]   _zz_regs_rgb_5;
  wire                when_LedMatrix_l21_80;
  reg        [31:0]   _zz_regs_rgb_6;
  wire                when_LedMatrix_l21_81;
  reg        [31:0]   _zz_regs_rgb_7;
  wire                when_LedMatrix_l21_82;
  reg        [31:0]   _zz_regs_rgb_8;
  wire                when_LedMatrix_l21_83;
  reg        [31:0]   _zz_regs_rgb_9;
  wire                when_LedMatrix_l21_84;
  reg        [31:0]   _zz_regs_rgb_10;
  wire                when_LedMatrix_l21_85;
  reg        [31:0]   _zz_regs_rgb_11;
  wire                when_LedMatrix_l21_86;
  reg        [31:0]   _zz_regs_rgb_12;
  wire                when_LedMatrix_l21_87;
  reg        [31:0]   _zz_regs_rgb_13;
  wire                when_LedMatrix_l21_88;
  reg        [31:0]   _zz_regs_rgb_14;
  wire                when_LedMatrix_l21_89;
  reg        [31:0]   _zz_regs_rgb_15;
  wire                when_LedMatrix_l21_90;
  reg        [31:0]   _zz_regs_rgb_16;
  wire                when_LedMatrix_l21_91;
  reg        [31:0]   _zz_regs_rgb_17;
  wire                when_LedMatrix_l21_92;
  reg        [31:0]   _zz_regs_rgb_18;
  wire                when_LedMatrix_l21_93;
  reg        [31:0]   _zz_regs_rgb_19;
  wire                when_LedMatrix_l21_94;
  reg        [31:0]   _zz_regs_rgb_20;
  wire                when_LedMatrix_l21_95;
  reg        [31:0]   _zz_regs_rgb_21;
  wire                when_LedMatrix_l21_96;
  reg        [31:0]   _zz_regs_rgb_22;
  wire                when_LedMatrix_l21_97;
  reg        [31:0]   _zz_regs_rgb_23;
  wire                when_LedMatrix_l21_98;
  reg        [31:0]   _zz_regs_rgb_24;
  wire                when_LedMatrix_l21_99;
  reg        [31:0]   _zz_regs_rgb_25;
  wire                when_LedMatrix_l21_100;
  reg        [31:0]   _zz_regs_rgb_26;
  wire                when_LedMatrix_l21_101;
  reg        [31:0]   _zz_regs_rgb_27;
  wire                when_LedMatrix_l21_102;
  reg        [31:0]   _zz_regs_rgb_28;
  wire                when_LedMatrix_l21_103;
  reg        [31:0]   _zz_regs_rgb_29;
  wire                when_LedMatrix_l21_104;
  reg        [31:0]   _zz_regs_locks_0;
  wire                when_LedMatrix_l21_105;
  reg        [31:0]   _zz_regs_locks_1;
  wire                when_LedMatrix_l21_106;
  reg        [31:0]   _zz_regs_locks_2;
  reg        [167:0]  ledSta;
  reg        [12:0]   _zz_when_ClockDomain_l369;
  wire                when_ClockDomain_l369;
  reg                 when_ClockDomain_l369_regNext;
  wire                pwm_pwmCnt_willIncrement;
  wire                pwm_pwmCnt_willClear;
  reg        [7:0]    pwm_pwmCnt_valueNext;
  reg        [7:0]    pwm_pwmCnt_value;
  wire                pwm_pwmCnt_willOverflowIfInc;
  wire                pwm_pwmCnt_willOverflow;
  reg        [9:0]    _zz_when_ClockDomain_l369_1;
  wire                when_ClockDomain_l369_1;
  reg                 when_ClockDomain_l369_1_regNext;
  wire                scanner_rowCnt_willIncrement;
  wire                scanner_rowCnt_willClear;
  reg        [2:0]    scanner_rowCnt_valueNext;
  reg        [2:0]    scanner_rowCnt_value;
  wire                scanner_rowCnt_willOverflowIfInc;
  wire                scanner_rowCnt_willOverflow;

  assign _zz_pwm_pwmCnt_valueNext_1 = pwm_pwmCnt_willIncrement;
  assign _zz_pwm_pwmCnt_valueNext = {7'd0, _zz_pwm_pwmCnt_valueNext_1};
  assign _zz_scanner_rowCnt_valueNext_1 = scanner_rowCnt_willIncrement;
  assign _zz_scanner_rowCnt_valueNext = {2'd0, _zz_scanner_rowCnt_valueNext_1};
  assign _zz_io_row = (6'h01 <<< scanner_rowCnt_value);
  assign _zz_ledSta = (regs_ice_66 < pwm_pwmCnt_value);
  assign _zz_ledSta_1 = (regs_ice_65 < pwm_pwmCnt_value);
  assign _zz_ledSta_2 = {(regs_ice_64 < pwm_pwmCnt_value),{(regs_ice_63 < pwm_pwmCnt_value),{(regs_ice_62 < pwm_pwmCnt_value),{(regs_ice_61 < pwm_pwmCnt_value),{(regs_ice_60 < pwm_pwmCnt_value),{(regs_ice_59 < pwm_pwmCnt_value),{_zz_ledSta_3,{_zz_ledSta_4,_zz_ledSta_5}}}}}}}};
  assign _zz_ledSta_3 = (regs_ice_58 < pwm_pwmCnt_value);
  assign _zz_ledSta_4 = (regs_ice_57 < pwm_pwmCnt_value);
  assign _zz_ledSta_5 = {(regs_ice_56 < pwm_pwmCnt_value),{(regs_ice_55 < pwm_pwmCnt_value),{(regs_ice_54 < pwm_pwmCnt_value),{(regs_ice_53 < pwm_pwmCnt_value),{(regs_ice_52 < pwm_pwmCnt_value),{(regs_ice_51 < pwm_pwmCnt_value),{_zz_ledSta_6,{_zz_ledSta_7,_zz_ledSta_8}}}}}}}};
  assign _zz_ledSta_6 = (regs_ice_50 < pwm_pwmCnt_value);
  assign _zz_ledSta_7 = (regs_ice_49 < pwm_pwmCnt_value);
  assign _zz_ledSta_8 = {(regs_ice_48 < pwm_pwmCnt_value),{(regs_ice_47 < pwm_pwmCnt_value),{(regs_ice_46 < pwm_pwmCnt_value),{(regs_ice_45 < pwm_pwmCnt_value),{(regs_ice_44 < pwm_pwmCnt_value),{(regs_ice_43 < pwm_pwmCnt_value),{_zz_ledSta_9,{_zz_ledSta_10,_zz_ledSta_11}}}}}}}};
  assign _zz_ledSta_9 = (regs_ice_42 < pwm_pwmCnt_value);
  assign _zz_ledSta_10 = (regs_ice_41 < pwm_pwmCnt_value);
  assign _zz_ledSta_11 = {(regs_ice_40 < pwm_pwmCnt_value),{(regs_ice_39 < pwm_pwmCnt_value),{(regs_ice_38 < pwm_pwmCnt_value),{(regs_ice_37 < pwm_pwmCnt_value),{(regs_ice_36 < pwm_pwmCnt_value),{(regs_ice_35 < pwm_pwmCnt_value),{_zz_ledSta_12,{_zz_ledSta_13,_zz_ledSta_14}}}}}}}};
  assign _zz_ledSta_12 = (regs_ice_34 < pwm_pwmCnt_value);
  assign _zz_ledSta_13 = (regs_ice_33 < pwm_pwmCnt_value);
  assign _zz_ledSta_14 = {(regs_ice_32 < pwm_pwmCnt_value),{(regs_ice_31 < pwm_pwmCnt_value),{(regs_ice_30 < pwm_pwmCnt_value),{(regs_ice_29 < pwm_pwmCnt_value),{(regs_ice_28 < pwm_pwmCnt_value),{(regs_ice_27 < pwm_pwmCnt_value),{_zz_ledSta_15,{_zz_ledSta_16,_zz_ledSta_17}}}}}}}};
  assign _zz_ledSta_15 = (regs_ice_26 < pwm_pwmCnt_value);
  assign _zz_ledSta_16 = (regs_ice_25 < pwm_pwmCnt_value);
  assign _zz_ledSta_17 = {(regs_ice_24 < pwm_pwmCnt_value),{(regs_ice_23 < pwm_pwmCnt_value),{(regs_ice_22 < pwm_pwmCnt_value),{(regs_ice_21 < pwm_pwmCnt_value),{(regs_ice_20 < pwm_pwmCnt_value),{(regs_ice_19 < pwm_pwmCnt_value),{_zz_ledSta_18,{_zz_ledSta_19,_zz_ledSta_20}}}}}}}};
  assign _zz_ledSta_18 = (regs_ice_18 < pwm_pwmCnt_value);
  assign _zz_ledSta_19 = (regs_ice_17 < pwm_pwmCnt_value);
  assign _zz_ledSta_20 = {(regs_ice_16 < pwm_pwmCnt_value),{(regs_ice_15 < pwm_pwmCnt_value),{(regs_ice_14 < pwm_pwmCnt_value),{(regs_ice_13 < pwm_pwmCnt_value),{(regs_ice_12 < pwm_pwmCnt_value),{(regs_ice_11 < pwm_pwmCnt_value),{_zz_ledSta_21,{_zz_ledSta_22,_zz_ledSta_23}}}}}}}};
  assign _zz_ledSta_21 = (regs_ice_10 < pwm_pwmCnt_value);
  assign _zz_ledSta_22 = (regs_ice_9 < pwm_pwmCnt_value);
  assign _zz_ledSta_23 = {(regs_ice_8 < pwm_pwmCnt_value),{(regs_ice_7 < pwm_pwmCnt_value),{(regs_ice_6 < pwm_pwmCnt_value),{(regs_ice_5 < pwm_pwmCnt_value),{(regs_ice_4 < pwm_pwmCnt_value),{(regs_ice_3 < pwm_pwmCnt_value),{_zz_ledSta_24,{_zz_ledSta_25,_zz_ledSta_26}}}}}}}};
  assign _zz_ledSta_24 = (regs_ice_2 < pwm_pwmCnt_value);
  assign _zz_ledSta_25 = (regs_ice_1 < pwm_pwmCnt_value);
  assign _zz_ledSta_26 = (regs_ice_0 < pwm_pwmCnt_value);
  assign when_LedMatrix_l21 = (bus_write && (bus_address == 7'h0));
  assign regs_ice_0 = _zz_regs_ice_0[7:0];
  assign when_LedMatrix_l21_1 = (bus_write && (bus_address == 7'h01));
  assign regs_ice_1 = _zz_regs_ice_1[7:0];
  assign when_LedMatrix_l21_2 = (bus_write && (bus_address == 7'h02));
  assign regs_ice_2 = _zz_regs_ice_2[7:0];
  assign when_LedMatrix_l21_3 = (bus_write && (bus_address == 7'h03));
  assign regs_ice_3 = _zz_regs_ice_3[7:0];
  assign when_LedMatrix_l21_4 = (bus_write && (bus_address == 7'h04));
  assign regs_ice_4 = _zz_regs_ice_4[7:0];
  assign when_LedMatrix_l21_5 = (bus_write && (bus_address == 7'h05));
  assign regs_ice_5 = _zz_regs_ice_5[7:0];
  assign when_LedMatrix_l21_6 = (bus_write && (bus_address == 7'h06));
  assign regs_ice_6 = _zz_regs_ice_6[7:0];
  assign when_LedMatrix_l21_7 = (bus_write && (bus_address == 7'h07));
  assign regs_ice_7 = _zz_regs_ice_7[7:0];
  assign when_LedMatrix_l21_8 = (bus_write && (bus_address == 7'h08));
  assign regs_ice_8 = _zz_regs_ice_8[7:0];
  assign when_LedMatrix_l21_9 = (bus_write && (bus_address == 7'h09));
  assign regs_ice_9 = _zz_regs_ice_9[7:0];
  assign when_LedMatrix_l21_10 = (bus_write && (bus_address == 7'h0a));
  assign regs_ice_10 = _zz_regs_ice_10[7:0];
  assign when_LedMatrix_l21_11 = (bus_write && (bus_address == 7'h0b));
  assign regs_ice_11 = _zz_regs_ice_11[7:0];
  assign when_LedMatrix_l21_12 = (bus_write && (bus_address == 7'h0c));
  assign regs_ice_12 = _zz_regs_ice_12[7:0];
  assign when_LedMatrix_l21_13 = (bus_write && (bus_address == 7'h0d));
  assign regs_ice_13 = _zz_regs_ice_13[7:0];
  assign when_LedMatrix_l21_14 = (bus_write && (bus_address == 7'h0e));
  assign regs_ice_14 = _zz_regs_ice_14[7:0];
  assign when_LedMatrix_l21_15 = (bus_write && (bus_address == 7'h0f));
  assign regs_ice_15 = _zz_regs_ice_15[7:0];
  assign when_LedMatrix_l21_16 = (bus_write && (bus_address == 7'h10));
  assign regs_ice_16 = _zz_regs_ice_16[7:0];
  assign when_LedMatrix_l21_17 = (bus_write && (bus_address == 7'h11));
  assign regs_ice_17 = _zz_regs_ice_17[7:0];
  assign when_LedMatrix_l21_18 = (bus_write && (bus_address == 7'h12));
  assign regs_ice_18 = _zz_regs_ice_18[7:0];
  assign when_LedMatrix_l21_19 = (bus_write && (bus_address == 7'h13));
  assign regs_ice_19 = _zz_regs_ice_19[7:0];
  assign when_LedMatrix_l21_20 = (bus_write && (bus_address == 7'h14));
  assign regs_ice_20 = _zz_regs_ice_20[7:0];
  assign when_LedMatrix_l21_21 = (bus_write && (bus_address == 7'h15));
  assign regs_ice_21 = _zz_regs_ice_21[7:0];
  assign when_LedMatrix_l21_22 = (bus_write && (bus_address == 7'h16));
  assign regs_ice_22 = _zz_regs_ice_22[7:0];
  assign when_LedMatrix_l21_23 = (bus_write && (bus_address == 7'h17));
  assign regs_ice_23 = _zz_regs_ice_23[7:0];
  assign when_LedMatrix_l21_24 = (bus_write && (bus_address == 7'h18));
  assign regs_ice_24 = _zz_regs_ice_24[7:0];
  assign when_LedMatrix_l21_25 = (bus_write && (bus_address == 7'h19));
  assign regs_ice_25 = _zz_regs_ice_25[7:0];
  assign when_LedMatrix_l21_26 = (bus_write && (bus_address == 7'h1a));
  assign regs_ice_26 = _zz_regs_ice_26[7:0];
  assign when_LedMatrix_l21_27 = (bus_write && (bus_address == 7'h1b));
  assign regs_ice_27 = _zz_regs_ice_27[7:0];
  assign when_LedMatrix_l21_28 = (bus_write && (bus_address == 7'h1c));
  assign regs_ice_28 = _zz_regs_ice_28[7:0];
  assign when_LedMatrix_l21_29 = (bus_write && (bus_address == 7'h1d));
  assign regs_ice_29 = _zz_regs_ice_29[7:0];
  assign when_LedMatrix_l21_30 = (bus_write && (bus_address == 7'h1e));
  assign regs_ice_30 = _zz_regs_ice_30[7:0];
  assign when_LedMatrix_l21_31 = (bus_write && (bus_address == 7'h1f));
  assign regs_ice_31 = _zz_regs_ice_31[7:0];
  assign when_LedMatrix_l21_32 = (bus_write && (bus_address == 7'h20));
  assign regs_ice_32 = _zz_regs_ice_32[7:0];
  assign when_LedMatrix_l21_33 = (bus_write && (bus_address == 7'h21));
  assign regs_ice_33 = _zz_regs_ice_33[7:0];
  assign when_LedMatrix_l21_34 = (bus_write && (bus_address == 7'h22));
  assign regs_ice_34 = _zz_regs_ice_34[7:0];
  assign when_LedMatrix_l21_35 = (bus_write && (bus_address == 7'h23));
  assign regs_ice_35 = _zz_regs_ice_35[7:0];
  assign when_LedMatrix_l21_36 = (bus_write && (bus_address == 7'h24));
  assign regs_ice_36 = _zz_regs_ice_36[7:0];
  assign when_LedMatrix_l21_37 = (bus_write && (bus_address == 7'h25));
  assign regs_ice_37 = _zz_regs_ice_37[7:0];
  assign when_LedMatrix_l21_38 = (bus_write && (bus_address == 7'h26));
  assign regs_ice_38 = _zz_regs_ice_38[7:0];
  assign when_LedMatrix_l21_39 = (bus_write && (bus_address == 7'h27));
  assign regs_ice_39 = _zz_regs_ice_39[7:0];
  assign when_LedMatrix_l21_40 = (bus_write && (bus_address == 7'h28));
  assign regs_ice_40 = _zz_regs_ice_40[7:0];
  assign when_LedMatrix_l21_41 = (bus_write && (bus_address == 7'h29));
  assign regs_ice_41 = _zz_regs_ice_41[7:0];
  assign when_LedMatrix_l21_42 = (bus_write && (bus_address == 7'h2a));
  assign regs_ice_42 = _zz_regs_ice_42[7:0];
  assign when_LedMatrix_l21_43 = (bus_write && (bus_address == 7'h2b));
  assign regs_ice_43 = _zz_regs_ice_43[7:0];
  assign when_LedMatrix_l21_44 = (bus_write && (bus_address == 7'h2c));
  assign regs_ice_44 = _zz_regs_ice_44[7:0];
  assign when_LedMatrix_l21_45 = (bus_write && (bus_address == 7'h2d));
  assign regs_ice_45 = _zz_regs_ice_45[7:0];
  assign when_LedMatrix_l21_46 = (bus_write && (bus_address == 7'h2e));
  assign regs_ice_46 = _zz_regs_ice_46[7:0];
  assign when_LedMatrix_l21_47 = (bus_write && (bus_address == 7'h2f));
  assign regs_ice_47 = _zz_regs_ice_47[7:0];
  assign when_LedMatrix_l21_48 = (bus_write && (bus_address == 7'h30));
  assign regs_ice_48 = _zz_regs_ice_48[7:0];
  assign when_LedMatrix_l21_49 = (bus_write && (bus_address == 7'h31));
  assign regs_ice_49 = _zz_regs_ice_49[7:0];
  assign when_LedMatrix_l21_50 = (bus_write && (bus_address == 7'h32));
  assign regs_ice_50 = _zz_regs_ice_50[7:0];
  assign when_LedMatrix_l21_51 = (bus_write && (bus_address == 7'h33));
  assign regs_ice_51 = _zz_regs_ice_51[7:0];
  assign when_LedMatrix_l21_52 = (bus_write && (bus_address == 7'h34));
  assign regs_ice_52 = _zz_regs_ice_52[7:0];
  assign when_LedMatrix_l21_53 = (bus_write && (bus_address == 7'h35));
  assign regs_ice_53 = _zz_regs_ice_53[7:0];
  assign when_LedMatrix_l21_54 = (bus_write && (bus_address == 7'h36));
  assign regs_ice_54 = _zz_regs_ice_54[7:0];
  assign when_LedMatrix_l21_55 = (bus_write && (bus_address == 7'h37));
  assign regs_ice_55 = _zz_regs_ice_55[7:0];
  assign when_LedMatrix_l21_56 = (bus_write && (bus_address == 7'h38));
  assign regs_ice_56 = _zz_regs_ice_56[7:0];
  assign when_LedMatrix_l21_57 = (bus_write && (bus_address == 7'h39));
  assign regs_ice_57 = _zz_regs_ice_57[7:0];
  assign when_LedMatrix_l21_58 = (bus_write && (bus_address == 7'h3a));
  assign regs_ice_58 = _zz_regs_ice_58[7:0];
  assign when_LedMatrix_l21_59 = (bus_write && (bus_address == 7'h3b));
  assign regs_ice_59 = _zz_regs_ice_59[7:0];
  assign when_LedMatrix_l21_60 = (bus_write && (bus_address == 7'h3c));
  assign regs_ice_60 = _zz_regs_ice_60[7:0];
  assign when_LedMatrix_l21_61 = (bus_write && (bus_address == 7'h3d));
  assign regs_ice_61 = _zz_regs_ice_61[7:0];
  assign when_LedMatrix_l21_62 = (bus_write && (bus_address == 7'h3e));
  assign regs_ice_62 = _zz_regs_ice_62[7:0];
  assign when_LedMatrix_l21_63 = (bus_write && (bus_address == 7'h3f));
  assign regs_ice_63 = _zz_regs_ice_63[7:0];
  assign when_LedMatrix_l21_64 = (bus_write && (bus_address == 7'h40));
  assign regs_ice_64 = _zz_regs_ice_64[7:0];
  assign when_LedMatrix_l21_65 = (bus_write && (bus_address == 7'h41));
  assign regs_ice_65 = _zz_regs_ice_65[7:0];
  assign when_LedMatrix_l21_66 = (bus_write && (bus_address == 7'h42));
  assign regs_ice_66 = _zz_regs_ice_66[7:0];
  assign when_LedMatrix_l21_67 = (bus_write && (bus_address == 7'h43));
  assign regs_ice_67 = _zz_regs_ice_67[7:0];
  assign when_LedMatrix_l21_68 = (bus_write && (bus_address == 7'h44));
  assign regs_ice_68 = _zz_regs_ice_68[7:0];
  assign when_LedMatrix_l21_69 = (bus_write && (bus_address == 7'h45));
  assign regs_ice_69 = _zz_regs_ice_69[7:0];
  assign when_LedMatrix_l21_70 = (bus_write && (bus_address == 7'h46));
  assign regs_ice_70 = _zz_regs_ice_70[7:0];
  assign when_LedMatrix_l21_71 = (bus_write && (bus_address == 7'h47));
  assign regs_ice_71 = _zz_regs_ice_71[7:0];
  assign when_LedMatrix_l21_72 = (bus_write && (bus_address == 7'h48));
  assign regs_ice_72 = _zz_regs_ice_72[7:0];
  assign when_LedMatrix_l21_73 = (bus_write && (bus_address == 7'h49));
  assign regs_fn = _zz_regs_fn[15:0];
  assign when_LedMatrix_l21_74 = (bus_write && (bus_address == 7'h4a));
  assign regs_rgb_0 = _zz_regs_rgb_0[23:0];
  assign when_LedMatrix_l21_75 = (bus_write && (bus_address == 7'h4b));
  assign regs_rgb_1 = _zz_regs_rgb_1[23:0];
  assign when_LedMatrix_l21_76 = (bus_write && (bus_address == 7'h4c));
  assign regs_rgb_2 = _zz_regs_rgb_2[23:0];
  assign when_LedMatrix_l21_77 = (bus_write && (bus_address == 7'h4d));
  assign regs_rgb_3 = _zz_regs_rgb_3[23:0];
  assign when_LedMatrix_l21_78 = (bus_write && (bus_address == 7'h4e));
  assign regs_rgb_4 = _zz_regs_rgb_4[23:0];
  assign when_LedMatrix_l21_79 = (bus_write && (bus_address == 7'h4f));
  assign regs_rgb_5 = _zz_regs_rgb_5[23:0];
  assign when_LedMatrix_l21_80 = (bus_write && (bus_address == 7'h50));
  assign regs_rgb_6 = _zz_regs_rgb_6[23:0];
  assign when_LedMatrix_l21_81 = (bus_write && (bus_address == 7'h51));
  assign regs_rgb_7 = _zz_regs_rgb_7[23:0];
  assign when_LedMatrix_l21_82 = (bus_write && (bus_address == 7'h52));
  assign regs_rgb_8 = _zz_regs_rgb_8[23:0];
  assign when_LedMatrix_l21_83 = (bus_write && (bus_address == 7'h53));
  assign regs_rgb_9 = _zz_regs_rgb_9[23:0];
  assign when_LedMatrix_l21_84 = (bus_write && (bus_address == 7'h54));
  assign regs_rgb_10 = _zz_regs_rgb_10[23:0];
  assign when_LedMatrix_l21_85 = (bus_write && (bus_address == 7'h55));
  assign regs_rgb_11 = _zz_regs_rgb_11[23:0];
  assign when_LedMatrix_l21_86 = (bus_write && (bus_address == 7'h56));
  assign regs_rgb_12 = _zz_regs_rgb_12[23:0];
  assign when_LedMatrix_l21_87 = (bus_write && (bus_address == 7'h57));
  assign regs_rgb_13 = _zz_regs_rgb_13[23:0];
  assign when_LedMatrix_l21_88 = (bus_write && (bus_address == 7'h58));
  assign regs_rgb_14 = _zz_regs_rgb_14[23:0];
  assign when_LedMatrix_l21_89 = (bus_write && (bus_address == 7'h59));
  assign regs_rgb_15 = _zz_regs_rgb_15[23:0];
  assign when_LedMatrix_l21_90 = (bus_write && (bus_address == 7'h5a));
  assign regs_rgb_16 = _zz_regs_rgb_16[23:0];
  assign when_LedMatrix_l21_91 = (bus_write && (bus_address == 7'h5b));
  assign regs_rgb_17 = _zz_regs_rgb_17[23:0];
  assign when_LedMatrix_l21_92 = (bus_write && (bus_address == 7'h5c));
  assign regs_rgb_18 = _zz_regs_rgb_18[23:0];
  assign when_LedMatrix_l21_93 = (bus_write && (bus_address == 7'h5d));
  assign regs_rgb_19 = _zz_regs_rgb_19[23:0];
  assign when_LedMatrix_l21_94 = (bus_write && (bus_address == 7'h5e));
  assign regs_rgb_20 = _zz_regs_rgb_20[23:0];
  assign when_LedMatrix_l21_95 = (bus_write && (bus_address == 7'h5f));
  assign regs_rgb_21 = _zz_regs_rgb_21[23:0];
  assign when_LedMatrix_l21_96 = (bus_write && (bus_address == 7'h60));
  assign regs_rgb_22 = _zz_regs_rgb_22[23:0];
  assign when_LedMatrix_l21_97 = (bus_write && (bus_address == 7'h61));
  assign regs_rgb_23 = _zz_regs_rgb_23[23:0];
  assign when_LedMatrix_l21_98 = (bus_write && (bus_address == 7'h62));
  assign regs_rgb_24 = _zz_regs_rgb_24[23:0];
  assign when_LedMatrix_l21_99 = (bus_write && (bus_address == 7'h63));
  assign regs_rgb_25 = _zz_regs_rgb_25[23:0];
  assign when_LedMatrix_l21_100 = (bus_write && (bus_address == 7'h64));
  assign regs_rgb_26 = _zz_regs_rgb_26[23:0];
  assign when_LedMatrix_l21_101 = (bus_write && (bus_address == 7'h65));
  assign regs_rgb_27 = _zz_regs_rgb_27[23:0];
  assign when_LedMatrix_l21_102 = (bus_write && (bus_address == 7'h66));
  assign regs_rgb_28 = _zz_regs_rgb_28[23:0];
  assign when_LedMatrix_l21_103 = (bus_write && (bus_address == 7'h67));
  assign regs_rgb_29 = _zz_regs_rgb_29[23:0];
  assign when_LedMatrix_l21_104 = (bus_write && (bus_address == 7'h68));
  assign when_LedMatrix_l21_105 = (bus_write && (bus_address == 7'h69));
  assign when_LedMatrix_l21_106 = (bus_write && (bus_address == 7'h6a));
  assign regs_locks_0 = _zz_regs_locks_0[7:0];
  assign regs_locks_1 = _zz_regs_locks_1[7:0];
  assign regs_locks_2 = _zz_regs_locks_2[7:0];
  assign when_ClockDomain_l369 = (_zz_when_ClockDomain_l369 == 13'h1387);
  assign pwm_pwmCnt_willClear = 1'b0;
  assign pwm_pwmCnt_willOverflowIfInc = (pwm_pwmCnt_value == 8'hff);
  assign pwm_pwmCnt_willOverflow = (pwm_pwmCnt_willOverflowIfInc && pwm_pwmCnt_willIncrement);
  always @(*) begin
    pwm_pwmCnt_valueNext = (pwm_pwmCnt_value + _zz_pwm_pwmCnt_valueNext);
    if(pwm_pwmCnt_willClear) begin
      pwm_pwmCnt_valueNext = 8'h0;
    end
  end

  assign pwm_pwmCnt_willIncrement = 1'b1;
  always @(*) begin
    ledSta[72 : 0] = {(regs_ice_72 < pwm_pwmCnt_value),{(regs_ice_71 < pwm_pwmCnt_value),{(regs_ice_70 < pwm_pwmCnt_value),{(regs_ice_69 < pwm_pwmCnt_value),{(regs_ice_68 < pwm_pwmCnt_value),{(regs_ice_67 < pwm_pwmCnt_value),{_zz_ledSta,{_zz_ledSta_1,_zz_ledSta_2}}}}}}}};
    ledSta[74 : 73] = {(regs_fn[7 : 0] < pwm_pwmCnt_value),(regs_fn[15 : 8] < pwm_pwmCnt_value)};
    ledSta[77 : 75] = {(regs_rgb_0[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_0[15 : 8] < pwm_pwmCnt_value),(regs_rgb_0[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[80 : 78] = {(regs_rgb_1[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_1[15 : 8] < pwm_pwmCnt_value),(regs_rgb_1[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[83 : 81] = {(regs_rgb_2[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_2[15 : 8] < pwm_pwmCnt_value),(regs_rgb_2[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[86 : 84] = {(regs_rgb_3[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_3[15 : 8] < pwm_pwmCnt_value),(regs_rgb_3[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[89 : 87] = {(regs_rgb_4[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_4[15 : 8] < pwm_pwmCnt_value),(regs_rgb_4[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[92 : 90] = {(regs_rgb_5[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_5[15 : 8] < pwm_pwmCnt_value),(regs_rgb_5[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[95 : 93] = {(regs_rgb_6[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_6[15 : 8] < pwm_pwmCnt_value),(regs_rgb_6[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[98 : 96] = {(regs_rgb_7[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_7[15 : 8] < pwm_pwmCnt_value),(regs_rgb_7[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[101 : 99] = {(regs_rgb_8[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_8[15 : 8] < pwm_pwmCnt_value),(regs_rgb_8[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[104 : 102] = {(regs_rgb_9[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_9[15 : 8] < pwm_pwmCnt_value),(regs_rgb_9[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[107 : 105] = {(regs_rgb_10[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_10[15 : 8] < pwm_pwmCnt_value),(regs_rgb_10[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[110 : 108] = {(regs_rgb_11[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_11[15 : 8] < pwm_pwmCnt_value),(regs_rgb_11[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[113 : 111] = {(regs_rgb_12[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_12[15 : 8] < pwm_pwmCnt_value),(regs_rgb_12[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[116 : 114] = {(regs_rgb_13[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_13[15 : 8] < pwm_pwmCnt_value),(regs_rgb_13[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[119 : 117] = {(regs_rgb_14[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_14[15 : 8] < pwm_pwmCnt_value),(regs_rgb_14[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[122 : 120] = {(regs_rgb_15[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_15[15 : 8] < pwm_pwmCnt_value),(regs_rgb_15[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[125 : 123] = {(regs_rgb_16[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_16[15 : 8] < pwm_pwmCnt_value),(regs_rgb_16[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[128 : 126] = {(regs_rgb_17[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_17[15 : 8] < pwm_pwmCnt_value),(regs_rgb_17[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[131 : 129] = {(regs_rgb_18[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_18[15 : 8] < pwm_pwmCnt_value),(regs_rgb_18[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[134 : 132] = {(regs_rgb_19[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_19[15 : 8] < pwm_pwmCnt_value),(regs_rgb_19[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[137 : 135] = {(regs_rgb_20[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_20[15 : 8] < pwm_pwmCnt_value),(regs_rgb_20[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[140 : 138] = {(regs_rgb_21[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_21[15 : 8] < pwm_pwmCnt_value),(regs_rgb_21[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[143 : 141] = {(regs_rgb_22[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_22[15 : 8] < pwm_pwmCnt_value),(regs_rgb_22[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[146 : 144] = {(regs_rgb_23[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_23[15 : 8] < pwm_pwmCnt_value),(regs_rgb_23[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[149 : 147] = {(regs_rgb_24[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_24[15 : 8] < pwm_pwmCnt_value),(regs_rgb_24[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[152 : 150] = {(regs_rgb_25[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_25[15 : 8] < pwm_pwmCnt_value),(regs_rgb_25[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[155 : 153] = {(regs_rgb_26[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_26[15 : 8] < pwm_pwmCnt_value),(regs_rgb_26[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[158 : 156] = {(regs_rgb_27[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_27[15 : 8] < pwm_pwmCnt_value),(regs_rgb_27[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[161 : 159] = {(regs_rgb_28[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_28[15 : 8] < pwm_pwmCnt_value),(regs_rgb_28[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[164 : 162] = {(regs_rgb_29[7 : 0] < pwm_pwmCnt_value),{(regs_rgb_29[15 : 8] < pwm_pwmCnt_value),(regs_rgb_29[23 : 16] < pwm_pwmCnt_value)}};
    ledSta[167 : 165] = {(regs_locks_2 < pwm_pwmCnt_value),{(regs_locks_1 < pwm_pwmCnt_value),(regs_locks_0 < pwm_pwmCnt_value)}};
  end

  assign when_ClockDomain_l369_1 = (_zz_when_ClockDomain_l369_1 == 10'h340);
  assign scanner_rowCnt_willClear = 1'b0;
  assign scanner_rowCnt_willOverflowIfInc = (scanner_rowCnt_value == 3'b101);
  assign scanner_rowCnt_willOverflow = (scanner_rowCnt_willOverflowIfInc && scanner_rowCnt_willIncrement);
  always @(*) begin
    if(scanner_rowCnt_willOverflow) begin
      scanner_rowCnt_valueNext = 3'b000;
    end else begin
      scanner_rowCnt_valueNext = (scanner_rowCnt_value + _zz_scanner_rowCnt_valueNext);
    end
    if(scanner_rowCnt_willClear) begin
      scanner_rowCnt_valueNext = 3'b000;
    end
  end

  assign scanner_rowCnt_willIncrement = 1'b1;
  assign io_row = (~ _zz_io_row);
  always @(*) begin
    io_col = (~ 35'h0);
    case(scanner_rowCnt_value)
      3'b000 : begin
        io_col[0] = ledSta[0];
        io_col[13 : 2] = ledSta[12 : 1];
        io_col[22 : 14] = ledSta[83 : 75];
        io_col[28] = ledSta[165];
        io_col[31] = ledSta[166];
        io_col[34] = ledSta[167];
      end
      3'b001 : begin
        io_col[13 : 0] = ledSta[26 : 13];
        io_col[34 : 14] = ledSta[104 : 84];
      end
      3'b010 : begin
        io_col[13 : 0] = ledSta[40 : 27];
        io_col[34 : 14] = ledSta[125 : 105];
      end
      3'b011 : begin
        io_col[11 : 0] = ledSta[52 : 41];
        io_col[13] = ledSta[53];
        io_col[31 : 23] = ledSta[134 : 126];
      end
      3'b100 : begin
        io_col[10 : 0] = ledSta[64 : 54];
        io_col[13] = ledSta[65];
        io_col[19 : 17] = ledSta[137 : 135];
        io_col[31 : 23] = ledSta[146 : 138];
      end
      3'b101 : begin
        io_col[2 : 0] = ledSta[68 : 66];
        io_col[5] = ledSta[69];
        io_col[10 : 9] = ledSta[71 : 70];
        io_col[12 : 11] = ledSta[74 : 73];
        io_col[25 : 13] = {ledSta[158 : 147],ledSta[72]};
        io_col[34 : 29] = ledSta[164 : 159];
      end
      default : begin
      end
    endcase
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_regs_ice_0 <= 32'h0;
      _zz_regs_ice_1 <= 32'h0;
      _zz_regs_ice_2 <= 32'h0;
      _zz_regs_ice_3 <= 32'h0;
      _zz_regs_ice_4 <= 32'h0;
      _zz_regs_ice_5 <= 32'h0;
      _zz_regs_ice_6 <= 32'h0;
      _zz_regs_ice_7 <= 32'h0;
      _zz_regs_ice_8 <= 32'h0;
      _zz_regs_ice_9 <= 32'h0;
      _zz_regs_ice_10 <= 32'h0;
      _zz_regs_ice_11 <= 32'h0;
      _zz_regs_ice_12 <= 32'h0;
      _zz_regs_ice_13 <= 32'h0;
      _zz_regs_ice_14 <= 32'h0;
      _zz_regs_ice_15 <= 32'h0;
      _zz_regs_ice_16 <= 32'h0;
      _zz_regs_ice_17 <= 32'h0;
      _zz_regs_ice_18 <= 32'h0;
      _zz_regs_ice_19 <= 32'h0;
      _zz_regs_ice_20 <= 32'h0;
      _zz_regs_ice_21 <= 32'h0;
      _zz_regs_ice_22 <= 32'h0;
      _zz_regs_ice_23 <= 32'h0;
      _zz_regs_ice_24 <= 32'h0;
      _zz_regs_ice_25 <= 32'h0;
      _zz_regs_ice_26 <= 32'h0;
      _zz_regs_ice_27 <= 32'h0;
      _zz_regs_ice_28 <= 32'h0;
      _zz_regs_ice_29 <= 32'h0;
      _zz_regs_ice_30 <= 32'h0;
      _zz_regs_ice_31 <= 32'h0;
      _zz_regs_ice_32 <= 32'h0;
      _zz_regs_ice_33 <= 32'h0;
      _zz_regs_ice_34 <= 32'h0;
      _zz_regs_ice_35 <= 32'h0;
      _zz_regs_ice_36 <= 32'h0;
      _zz_regs_ice_37 <= 32'h0;
      _zz_regs_ice_38 <= 32'h0;
      _zz_regs_ice_39 <= 32'h0;
      _zz_regs_ice_40 <= 32'h0;
      _zz_regs_ice_41 <= 32'h0;
      _zz_regs_ice_42 <= 32'h0;
      _zz_regs_ice_43 <= 32'h0;
      _zz_regs_ice_44 <= 32'h0;
      _zz_regs_ice_45 <= 32'h0;
      _zz_regs_ice_46 <= 32'h0;
      _zz_regs_ice_47 <= 32'h0;
      _zz_regs_ice_48 <= 32'h0;
      _zz_regs_ice_49 <= 32'h0;
      _zz_regs_ice_50 <= 32'h0;
      _zz_regs_ice_51 <= 32'h0;
      _zz_regs_ice_52 <= 32'h0;
      _zz_regs_ice_53 <= 32'h0;
      _zz_regs_ice_54 <= 32'h0;
      _zz_regs_ice_55 <= 32'h0;
      _zz_regs_ice_56 <= 32'h0;
      _zz_regs_ice_57 <= 32'h0;
      _zz_regs_ice_58 <= 32'h0;
      _zz_regs_ice_59 <= 32'h0;
      _zz_regs_ice_60 <= 32'h0;
      _zz_regs_ice_61 <= 32'h0;
      _zz_regs_ice_62 <= 32'h0;
      _zz_regs_ice_63 <= 32'h0;
      _zz_regs_ice_64 <= 32'h0;
      _zz_regs_ice_65 <= 32'h0;
      _zz_regs_ice_66 <= 32'h0;
      _zz_regs_ice_67 <= 32'h0;
      _zz_regs_ice_68 <= 32'h0;
      _zz_regs_ice_69 <= 32'h0;
      _zz_regs_ice_70 <= 32'h0;
      _zz_regs_ice_71 <= 32'h0;
      _zz_regs_ice_72 <= 32'h0;
      _zz_regs_fn <= 32'h0;
      _zz_regs_rgb_0 <= 32'h0;
      _zz_regs_rgb_1 <= 32'h0;
      _zz_regs_rgb_2 <= 32'h0;
      _zz_regs_rgb_3 <= 32'h0;
      _zz_regs_rgb_4 <= 32'h0;
      _zz_regs_rgb_5 <= 32'h0;
      _zz_regs_rgb_6 <= 32'h0;
      _zz_regs_rgb_7 <= 32'h0;
      _zz_regs_rgb_8 <= 32'h0;
      _zz_regs_rgb_9 <= 32'h0;
      _zz_regs_rgb_10 <= 32'h0;
      _zz_regs_rgb_11 <= 32'h0;
      _zz_regs_rgb_12 <= 32'h0;
      _zz_regs_rgb_13 <= 32'h0;
      _zz_regs_rgb_14 <= 32'h0;
      _zz_regs_rgb_15 <= 32'h0;
      _zz_regs_rgb_16 <= 32'h0;
      _zz_regs_rgb_17 <= 32'h0;
      _zz_regs_rgb_18 <= 32'h0;
      _zz_regs_rgb_19 <= 32'h0;
      _zz_regs_rgb_20 <= 32'h0;
      _zz_regs_rgb_21 <= 32'h0;
      _zz_regs_rgb_22 <= 32'h0;
      _zz_regs_rgb_23 <= 32'h0;
      _zz_regs_rgb_24 <= 32'h0;
      _zz_regs_rgb_25 <= 32'h0;
      _zz_regs_rgb_26 <= 32'h0;
      _zz_regs_rgb_27 <= 32'h0;
      _zz_regs_rgb_28 <= 32'h0;
      _zz_regs_rgb_29 <= 32'h0;
      _zz_regs_locks_0 <= 32'h0;
      _zz_regs_locks_1 <= 32'h0;
      _zz_regs_locks_2 <= 32'h0;
      _zz_when_ClockDomain_l369 <= 13'h0;
      when_ClockDomain_l369_regNext <= 1'b0;
      _zz_when_ClockDomain_l369_1 <= 10'h0;
      when_ClockDomain_l369_1_regNext <= 1'b0;
    end else begin
      if(when_LedMatrix_l21) begin
        _zz_regs_ice_0 <= bus_writeData;
      end
      if(when_LedMatrix_l21_1) begin
        _zz_regs_ice_1 <= bus_writeData;
      end
      if(when_LedMatrix_l21_2) begin
        _zz_regs_ice_2 <= bus_writeData;
      end
      if(when_LedMatrix_l21_3) begin
        _zz_regs_ice_3 <= bus_writeData;
      end
      if(when_LedMatrix_l21_4) begin
        _zz_regs_ice_4 <= bus_writeData;
      end
      if(when_LedMatrix_l21_5) begin
        _zz_regs_ice_5 <= bus_writeData;
      end
      if(when_LedMatrix_l21_6) begin
        _zz_regs_ice_6 <= bus_writeData;
      end
      if(when_LedMatrix_l21_7) begin
        _zz_regs_ice_7 <= bus_writeData;
      end
      if(when_LedMatrix_l21_8) begin
        _zz_regs_ice_8 <= bus_writeData;
      end
      if(when_LedMatrix_l21_9) begin
        _zz_regs_ice_9 <= bus_writeData;
      end
      if(when_LedMatrix_l21_10) begin
        _zz_regs_ice_10 <= bus_writeData;
      end
      if(when_LedMatrix_l21_11) begin
        _zz_regs_ice_11 <= bus_writeData;
      end
      if(when_LedMatrix_l21_12) begin
        _zz_regs_ice_12 <= bus_writeData;
      end
      if(when_LedMatrix_l21_13) begin
        _zz_regs_ice_13 <= bus_writeData;
      end
      if(when_LedMatrix_l21_14) begin
        _zz_regs_ice_14 <= bus_writeData;
      end
      if(when_LedMatrix_l21_15) begin
        _zz_regs_ice_15 <= bus_writeData;
      end
      if(when_LedMatrix_l21_16) begin
        _zz_regs_ice_16 <= bus_writeData;
      end
      if(when_LedMatrix_l21_17) begin
        _zz_regs_ice_17 <= bus_writeData;
      end
      if(when_LedMatrix_l21_18) begin
        _zz_regs_ice_18 <= bus_writeData;
      end
      if(when_LedMatrix_l21_19) begin
        _zz_regs_ice_19 <= bus_writeData;
      end
      if(when_LedMatrix_l21_20) begin
        _zz_regs_ice_20 <= bus_writeData;
      end
      if(when_LedMatrix_l21_21) begin
        _zz_regs_ice_21 <= bus_writeData;
      end
      if(when_LedMatrix_l21_22) begin
        _zz_regs_ice_22 <= bus_writeData;
      end
      if(when_LedMatrix_l21_23) begin
        _zz_regs_ice_23 <= bus_writeData;
      end
      if(when_LedMatrix_l21_24) begin
        _zz_regs_ice_24 <= bus_writeData;
      end
      if(when_LedMatrix_l21_25) begin
        _zz_regs_ice_25 <= bus_writeData;
      end
      if(when_LedMatrix_l21_26) begin
        _zz_regs_ice_26 <= bus_writeData;
      end
      if(when_LedMatrix_l21_27) begin
        _zz_regs_ice_27 <= bus_writeData;
      end
      if(when_LedMatrix_l21_28) begin
        _zz_regs_ice_28 <= bus_writeData;
      end
      if(when_LedMatrix_l21_29) begin
        _zz_regs_ice_29 <= bus_writeData;
      end
      if(when_LedMatrix_l21_30) begin
        _zz_regs_ice_30 <= bus_writeData;
      end
      if(when_LedMatrix_l21_31) begin
        _zz_regs_ice_31 <= bus_writeData;
      end
      if(when_LedMatrix_l21_32) begin
        _zz_regs_ice_32 <= bus_writeData;
      end
      if(when_LedMatrix_l21_33) begin
        _zz_regs_ice_33 <= bus_writeData;
      end
      if(when_LedMatrix_l21_34) begin
        _zz_regs_ice_34 <= bus_writeData;
      end
      if(when_LedMatrix_l21_35) begin
        _zz_regs_ice_35 <= bus_writeData;
      end
      if(when_LedMatrix_l21_36) begin
        _zz_regs_ice_36 <= bus_writeData;
      end
      if(when_LedMatrix_l21_37) begin
        _zz_regs_ice_37 <= bus_writeData;
      end
      if(when_LedMatrix_l21_38) begin
        _zz_regs_ice_38 <= bus_writeData;
      end
      if(when_LedMatrix_l21_39) begin
        _zz_regs_ice_39 <= bus_writeData;
      end
      if(when_LedMatrix_l21_40) begin
        _zz_regs_ice_40 <= bus_writeData;
      end
      if(when_LedMatrix_l21_41) begin
        _zz_regs_ice_41 <= bus_writeData;
      end
      if(when_LedMatrix_l21_42) begin
        _zz_regs_ice_42 <= bus_writeData;
      end
      if(when_LedMatrix_l21_43) begin
        _zz_regs_ice_43 <= bus_writeData;
      end
      if(when_LedMatrix_l21_44) begin
        _zz_regs_ice_44 <= bus_writeData;
      end
      if(when_LedMatrix_l21_45) begin
        _zz_regs_ice_45 <= bus_writeData;
      end
      if(when_LedMatrix_l21_46) begin
        _zz_regs_ice_46 <= bus_writeData;
      end
      if(when_LedMatrix_l21_47) begin
        _zz_regs_ice_47 <= bus_writeData;
      end
      if(when_LedMatrix_l21_48) begin
        _zz_regs_ice_48 <= bus_writeData;
      end
      if(when_LedMatrix_l21_49) begin
        _zz_regs_ice_49 <= bus_writeData;
      end
      if(when_LedMatrix_l21_50) begin
        _zz_regs_ice_50 <= bus_writeData;
      end
      if(when_LedMatrix_l21_51) begin
        _zz_regs_ice_51 <= bus_writeData;
      end
      if(when_LedMatrix_l21_52) begin
        _zz_regs_ice_52 <= bus_writeData;
      end
      if(when_LedMatrix_l21_53) begin
        _zz_regs_ice_53 <= bus_writeData;
      end
      if(when_LedMatrix_l21_54) begin
        _zz_regs_ice_54 <= bus_writeData;
      end
      if(when_LedMatrix_l21_55) begin
        _zz_regs_ice_55 <= bus_writeData;
      end
      if(when_LedMatrix_l21_56) begin
        _zz_regs_ice_56 <= bus_writeData;
      end
      if(when_LedMatrix_l21_57) begin
        _zz_regs_ice_57 <= bus_writeData;
      end
      if(when_LedMatrix_l21_58) begin
        _zz_regs_ice_58 <= bus_writeData;
      end
      if(when_LedMatrix_l21_59) begin
        _zz_regs_ice_59 <= bus_writeData;
      end
      if(when_LedMatrix_l21_60) begin
        _zz_regs_ice_60 <= bus_writeData;
      end
      if(when_LedMatrix_l21_61) begin
        _zz_regs_ice_61 <= bus_writeData;
      end
      if(when_LedMatrix_l21_62) begin
        _zz_regs_ice_62 <= bus_writeData;
      end
      if(when_LedMatrix_l21_63) begin
        _zz_regs_ice_63 <= bus_writeData;
      end
      if(when_LedMatrix_l21_64) begin
        _zz_regs_ice_64 <= bus_writeData;
      end
      if(when_LedMatrix_l21_65) begin
        _zz_regs_ice_65 <= bus_writeData;
      end
      if(when_LedMatrix_l21_66) begin
        _zz_regs_ice_66 <= bus_writeData;
      end
      if(when_LedMatrix_l21_67) begin
        _zz_regs_ice_67 <= bus_writeData;
      end
      if(when_LedMatrix_l21_68) begin
        _zz_regs_ice_68 <= bus_writeData;
      end
      if(when_LedMatrix_l21_69) begin
        _zz_regs_ice_69 <= bus_writeData;
      end
      if(when_LedMatrix_l21_70) begin
        _zz_regs_ice_70 <= bus_writeData;
      end
      if(when_LedMatrix_l21_71) begin
        _zz_regs_ice_71 <= bus_writeData;
      end
      if(when_LedMatrix_l21_72) begin
        _zz_regs_ice_72 <= bus_writeData;
      end
      if(when_LedMatrix_l21_73) begin
        _zz_regs_fn <= bus_writeData;
      end
      if(when_LedMatrix_l21_74) begin
        _zz_regs_rgb_0 <= bus_writeData;
      end
      if(when_LedMatrix_l21_75) begin
        _zz_regs_rgb_1 <= bus_writeData;
      end
      if(when_LedMatrix_l21_76) begin
        _zz_regs_rgb_2 <= bus_writeData;
      end
      if(when_LedMatrix_l21_77) begin
        _zz_regs_rgb_3 <= bus_writeData;
      end
      if(when_LedMatrix_l21_78) begin
        _zz_regs_rgb_4 <= bus_writeData;
      end
      if(when_LedMatrix_l21_79) begin
        _zz_regs_rgb_5 <= bus_writeData;
      end
      if(when_LedMatrix_l21_80) begin
        _zz_regs_rgb_6 <= bus_writeData;
      end
      if(when_LedMatrix_l21_81) begin
        _zz_regs_rgb_7 <= bus_writeData;
      end
      if(when_LedMatrix_l21_82) begin
        _zz_regs_rgb_8 <= bus_writeData;
      end
      if(when_LedMatrix_l21_83) begin
        _zz_regs_rgb_9 <= bus_writeData;
      end
      if(when_LedMatrix_l21_84) begin
        _zz_regs_rgb_10 <= bus_writeData;
      end
      if(when_LedMatrix_l21_85) begin
        _zz_regs_rgb_11 <= bus_writeData;
      end
      if(when_LedMatrix_l21_86) begin
        _zz_regs_rgb_12 <= bus_writeData;
      end
      if(when_LedMatrix_l21_87) begin
        _zz_regs_rgb_13 <= bus_writeData;
      end
      if(when_LedMatrix_l21_88) begin
        _zz_regs_rgb_14 <= bus_writeData;
      end
      if(when_LedMatrix_l21_89) begin
        _zz_regs_rgb_15 <= bus_writeData;
      end
      if(when_LedMatrix_l21_90) begin
        _zz_regs_rgb_16 <= bus_writeData;
      end
      if(when_LedMatrix_l21_91) begin
        _zz_regs_rgb_17 <= bus_writeData;
      end
      if(when_LedMatrix_l21_92) begin
        _zz_regs_rgb_18 <= bus_writeData;
      end
      if(when_LedMatrix_l21_93) begin
        _zz_regs_rgb_19 <= bus_writeData;
      end
      if(when_LedMatrix_l21_94) begin
        _zz_regs_rgb_20 <= bus_writeData;
      end
      if(when_LedMatrix_l21_95) begin
        _zz_regs_rgb_21 <= bus_writeData;
      end
      if(when_LedMatrix_l21_96) begin
        _zz_regs_rgb_22 <= bus_writeData;
      end
      if(when_LedMatrix_l21_97) begin
        _zz_regs_rgb_23 <= bus_writeData;
      end
      if(when_LedMatrix_l21_98) begin
        _zz_regs_rgb_24 <= bus_writeData;
      end
      if(when_LedMatrix_l21_99) begin
        _zz_regs_rgb_25 <= bus_writeData;
      end
      if(when_LedMatrix_l21_100) begin
        _zz_regs_rgb_26 <= bus_writeData;
      end
      if(when_LedMatrix_l21_101) begin
        _zz_regs_rgb_27 <= bus_writeData;
      end
      if(when_LedMatrix_l21_102) begin
        _zz_regs_rgb_28 <= bus_writeData;
      end
      if(when_LedMatrix_l21_103) begin
        _zz_regs_rgb_29 <= bus_writeData;
      end
      if(when_LedMatrix_l21_104) begin
        _zz_regs_locks_0 <= bus_writeData;
      end
      if(when_LedMatrix_l21_105) begin
        _zz_regs_locks_1 <= bus_writeData;
      end
      if(when_LedMatrix_l21_106) begin
        _zz_regs_locks_2 <= bus_writeData;
      end
      _zz_when_ClockDomain_l369 <= (_zz_when_ClockDomain_l369 + 13'h0001);
      if(when_ClockDomain_l369) begin
        _zz_when_ClockDomain_l369 <= 13'h0;
      end
      when_ClockDomain_l369_regNext <= when_ClockDomain_l369;
      _zz_when_ClockDomain_l369_1 <= (_zz_when_ClockDomain_l369_1 + 10'h001);
      if(when_ClockDomain_l369_1) begin
        _zz_when_ClockDomain_l369_1 <= 10'h0;
      end
      when_ClockDomain_l369_1_regNext <= when_ClockDomain_l369_1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pwm_pwmCnt_value <= 8'h0;
    end else begin
      if(when_ClockDomain_l369_regNext) begin
        pwm_pwmCnt_value <= pwm_pwmCnt_valueNext;
      end
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      scanner_rowCnt_value <= 3'b000;
    end else begin
      if(when_ClockDomain_l369_1_regNext) begin
        scanner_rowCnt_value <= scanner_rowCnt_valueNext;
      end
    end
  end


endmodule
