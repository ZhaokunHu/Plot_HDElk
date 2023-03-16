-- Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
-- Component : UdpApp
-- Git hash  : fd6942bca278012e45517a5dc6d0f4d1063a1822

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type fsm_discoveringRspTx_fsms_0_enumDef is (BOOT,sendCmd);
  type fsm_discoveringRspTx_fsms_1_enumDef is (BOOT,sendHeader,sendMessage);
  type fsm_enumDef is (BOOT,idle,helloHeader,discoveringRspTx);

  function pkg_mux (sel : std_logic; one : fsm_discoveringRspTx_fsms_0_enumDef; zero : fsm_discoveringRspTx_fsms_0_enumDef) return fsm_discoveringRspTx_fsms_0_enumDef;
  function pkg_toStdLogicVector_native (value : fsm_discoveringRspTx_fsms_0_enumDef) return std_logic_vector;
  function pkg_tofsm_discoveringRspTx_fsms_0_enumDef_native (value : std_logic_vector(0 downto 0)) return fsm_discoveringRspTx_fsms_0_enumDef;
  function pkg_mux (sel : std_logic; one : fsm_discoveringRspTx_fsms_1_enumDef; zero : fsm_discoveringRspTx_fsms_1_enumDef) return fsm_discoveringRspTx_fsms_1_enumDef;
  function pkg_toStdLogicVector_native (value : fsm_discoveringRspTx_fsms_1_enumDef) return std_logic_vector;
  function pkg_tofsm_discoveringRspTx_fsms_1_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_discoveringRspTx_fsms_1_enumDef;
  function pkg_mux (sel : std_logic; one : fsm_enumDef; zero : fsm_enumDef) return fsm_enumDef;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector;
  function pkg_tofsm_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_enumDef;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : fsm_discoveringRspTx_fsms_0_enumDef; zero : fsm_discoveringRspTx_fsms_0_enumDef) return fsm_discoveringRspTx_fsms_0_enumDef is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tofsm_discoveringRspTx_fsms_0_enumDef_native (value : std_logic_vector(0 downto 0)) return fsm_discoveringRspTx_fsms_0_enumDef is
  begin
    case value is
      when "0" => return BOOT;
      when "1" => return sendCmd;
      when others => return BOOT;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_discoveringRspTx_fsms_0_enumDef) return std_logic_vector is
  begin
    case value is
      when BOOT => return "0";
      when sendCmd => return "1";
      when others => return "0";
    end case;
  end;
  function pkg_mux (sel : std_logic; one : fsm_discoveringRspTx_fsms_1_enumDef; zero : fsm_discoveringRspTx_fsms_1_enumDef) return fsm_discoveringRspTx_fsms_1_enumDef is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tofsm_discoveringRspTx_fsms_1_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_discoveringRspTx_fsms_1_enumDef is
  begin
    case value is
      when "00" => return BOOT;
      when "01" => return sendHeader;
      when "10" => return sendMessage;
      when others => return BOOT;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_discoveringRspTx_fsms_1_enumDef) return std_logic_vector is
  begin
    case value is
      when BOOT => return "00";
      when sendHeader => return "01";
      when sendMessage => return "10";
      when others => return "00";
    end case;
  end;
  function pkg_mux (sel : std_logic; one : fsm_enumDef; zero : fsm_enumDef) return fsm_enumDef is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_tofsm_enumDef_native (value : std_logic_vector(1 downto 0)) return fsm_enumDef is
  begin
    case value is
      when "00" => return BOOT;
      when "01" => return idle;
      when "10" => return helloHeader;
      when "11" => return discoveringRspTx;
      when others => return BOOT;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : fsm_enumDef) return std_logic_vector is
  begin
    case value is
      when BOOT => return "00";
      when idle => return "01";
      when helloHeader => return "10";
      when discoveringRspTx => return "11";
      when others => return "00";
    end case;
  end;
end pkg_enum;


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_not (value : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_not (value : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;
  function pkg_not (value : signed) return signed;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed;

  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned (value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : unsigned) return unsigned is
    variable ret : unsigned(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : signed; bitId : integer) return std_logic is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : signed) return signed is
    variable ret : signed(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;


  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    if size >= that'length then
      return "";
    else
      ret := shift_right(that,size);
      return ret(that'length-1-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    ret := shift_right(that,to_integer(size));
    return ret;
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;

  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed is
  begin
    return shift_left(resize(that,w),to_integer(size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed is
    variable ret : signed(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    alias ret : std_logic_vector(lit'length-1 downto 0) is lit;
  begin
    return std_logic_vector(ret);
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    alias ret : unsigned(lit'length-1 downto 0) is lit;
  begin
    return unsigned(ret);
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    alias ret : signed(lit'length-1 downto 0) is lit;
  begin
    return signed(ret);
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;

  function pkg_resize (that : unsigned; width : integer) return unsigned is
    variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
  function pkg_resize (that : signed; width : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
    variable ret : signed(width-1 downto 0);
  begin
    if temp'length = 0 then
       ret := (others => '0');
    elsif temp'length >= width then
       ret := temp(width-1 downto 0);
    else
       ret := resize(temp,width);
    end if;
    return ret;
  end pkg_resize;
end pkg_scala2hdl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity UdpApp is
  port(
    io_rx_cmd_valid : in std_logic;
    io_rx_cmd_ready : out std_logic;
    io_rx_cmd_payload_ip : in std_logic_vector(31 downto 0);
    io_rx_cmd_payload_srcPort : in std_logic_vector(15 downto 0);
    io_rx_cmd_payload_dstPort : in std_logic_vector(15 downto 0);
    io_rx_cmd_payload_length : in unsigned(15 downto 0);
    io_rx_data_valid : in std_logic;
    io_rx_data_ready : out std_logic;
    io_rx_data_payload_last : in std_logic;
    io_rx_data_payload_fragment : in std_logic_vector(7 downto 0);
    io_tx_cmd_valid : out std_logic;
    io_tx_cmd_ready : in std_logic;
    io_tx_cmd_payload_ip : out std_logic_vector(31 downto 0);
    io_tx_cmd_payload_srcPort : out std_logic_vector(15 downto 0);
    io_tx_cmd_payload_dstPort : out std_logic_vector(15 downto 0);
    io_tx_cmd_payload_length : out unsigned(15 downto 0);
    io_tx_data_valid : out std_logic;
    io_tx_data_ready : in std_logic;
    io_tx_data_payload_last : out std_logic;
    io_tx_data_payload_fragment : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end UdpApp;

architecture arch of UdpApp is
  signal io_tx_data_payload_last_read_buffer : std_logic;
  signal zz_io_tx_data_payload_fragment : std_logic_vector(7 downto 0);

  signal flushRx_active : std_logic;
  signal when_test13_l53 : std_logic;
  signal fsm_wantExit : std_logic;
  signal fsm_wantStart : std_logic;
  signal fsm_wantKill : std_logic;
  signal fsm_discoveringRspTx_fsms_0_wantExit : std_logic;
  signal fsm_discoveringRspTx_fsms_0_wantStart : std_logic;
  signal fsm_discoveringRspTx_fsms_0_wantKill : std_logic;
  signal fsm_discoveringRspTx_fsms_1_wantExit : std_logic;
  signal fsm_discoveringRspTx_fsms_1_wantStart : std_logic;
  signal fsm_discoveringRspTx_fsms_1_wantKill : std_logic;
  signal fsm_discoveringRspTx_fsms_1_sendMessage_counter : unsigned(2 downto 0);
  signal fsm_discoveringRspTx_fsms_0_stateReg : fsm_discoveringRspTx_fsms_0_enumDef;
  signal fsm_discoveringRspTx_fsms_0_stateNext : fsm_discoveringRspTx_fsms_0_enumDef;
  signal fsm_discoveringRspTx_fsms_1_stateReg : fsm_discoveringRspTx_fsms_1_enumDef;
  signal fsm_discoveringRspTx_fsms_1_stateNext : fsm_discoveringRspTx_fsms_1_enumDef;
  signal when_StateMachine_l253 : std_logic;
  signal fsm_stateReg : fsm_enumDef;
  signal fsm_stateNext : fsm_enumDef;
  signal when_test13_l65 : std_logic;
  signal when_State_l179 : std_logic;
  signal when_StateMachine_l253_1 : std_logic;
begin
  io_tx_data_payload_last <= io_tx_data_payload_last_read_buffer;
  process(fsm_discoveringRspTx_fsms_1_sendMessage_counter)
  begin
    case fsm_discoveringRspTx_fsms_1_sendMessage_counter is
      when "000" =>
        zz_io_tx_data_payload_fragment <= pkg_stdLogicVector("00110000");
      when "001" =>
        zz_io_tx_data_payload_fragment <= pkg_stdLogicVector("00110001");
      when "010" =>
        zz_io_tx_data_payload_fragment <= pkg_stdLogicVector("00110010");
      when "011" =>
        zz_io_tx_data_payload_fragment <= pkg_stdLogicVector("00110011");
      when "100" =>
        zz_io_tx_data_payload_fragment <= pkg_stdLogicVector("00110100");
      when others =>
        zz_io_tx_data_payload_fragment <= pkg_stdLogicVector("00110101");
    end case;
  end process;

  process(flushRx_active,when_test13_l53)
  begin
    io_rx_cmd_ready <= pkg_toStdLogic(false); --@[test13.scala 32:19]
    if flushRx_active = '1' then
      if when_test13_l53 = '1' then
        io_rx_cmd_ready <= pkg_toStdLogic(true); --@[test13.scala 54:25]
      end if;
    end if;
  end process;

  process(flushRx_active)
  begin
    io_rx_data_ready <= pkg_toStdLogic(false); --@[test13.scala 33:20]
    if flushRx_active = '1' then
      io_rx_data_ready <= pkg_toStdLogic(true); --@[test13.scala 52:24]
    end if;
  end process;

  process(fsm_discoveringRspTx_fsms_0_stateReg)
  begin
    io_tx_cmd_valid <= pkg_toStdLogic(false); --@[test13.scala 35:19]
    case fsm_discoveringRspTx_fsms_0_stateReg is
      when pkg_enum.sendCmd =>
        io_tx_cmd_valid <= pkg_toStdLogic(true); --@[test13.scala 111:25]
      when others =>
    end case;
  end process;

  io_tx_cmd_payload_ip <= io_rx_cmd_payload_ip; --@[test13.scala 36:16]
  io_tx_cmd_payload_srcPort <= io_rx_cmd_payload_dstPort; --@[test13.scala 37:21]
  io_tx_cmd_payload_dstPort <= io_rx_cmd_payload_srcPort; --@[test13.scala 38:21]
  io_tx_cmd_payload_length <= pkg_unsigned("0000000000000111"); --@[test13.scala 39:21]
  process(fsm_discoveringRspTx_fsms_1_stateReg)
  begin
    io_tx_data_valid <= pkg_toStdLogic(false); --@[test13.scala 41:23]
    case fsm_discoveringRspTx_fsms_1_stateReg is
      when pkg_enum.sendHeader =>
        io_tx_data_valid <= pkg_toStdLogic(true); --@[test13.scala 123:28]
      when pkg_enum.sendMessage =>
        io_tx_data_valid <= pkg_toStdLogic(true); --@[test13.scala 136:29]
      when others =>
    end case;
  end process;

  process(fsm_discoveringRspTx_fsms_1_stateReg,fsm_discoveringRspTx_fsms_1_sendMessage_counter)
  begin
    io_tx_data_payload_last_read_buffer <= pkg_toStdLogic(false); --@[test13.scala 42:19]
    case fsm_discoveringRspTx_fsms_1_stateReg is
      when pkg_enum.sendHeader =>
      when pkg_enum.sendMessage =>
        io_tx_data_payload_last_read_buffer <= pkg_toStdLogic(fsm_discoveringRspTx_fsms_1_sendMessage_counter = pkg_unsigned("101")); --@[test13.scala 138:25]
      when others =>
    end case;
  end process;

  process(fsm_discoveringRspTx_fsms_1_stateReg,zz_io_tx_data_payload_fragment)
  begin
    io_tx_data_payload_fragment <= pkg_stdLogicVector("00000000"); --@[test13.scala 43:23]
    case fsm_discoveringRspTx_fsms_1_stateReg is
      when pkg_enum.sendHeader =>
        io_tx_data_payload_fragment <= pkg_stdLogicVector("00100010"); --@[test13.scala 124:29]
      when pkg_enum.sendMessage =>
        io_tx_data_payload_fragment <= zz_io_tx_data_payload_fragment; --@[test13.scala 137:29]
      when others =>
    end case;
  end process;

  when_test13_l53 <= (io_rx_data_valid and io_rx_data_payload_last); --@[BaseType.scala 305:24]
  fsm_wantExit <= pkg_toStdLogic(false); --@[StateMachine.scala 151:28]
  process(fsm_stateReg)
  begin
    fsm_wantStart <= pkg_toStdLogic(false); --@[StateMachine.scala 152:19]
    case fsm_stateReg is
      when pkg_enum.idle =>
      when pkg_enum.helloHeader =>
      when pkg_enum.discoveringRspTx =>
      when others =>
        fsm_wantStart <= pkg_toStdLogic(true); --@[StateMachine.scala 362:15]
    end case;
  end process;

  fsm_wantKill <= pkg_toStdLogic(false); --@[StateMachine.scala 153:18]
  process(fsm_discoveringRspTx_fsms_0_stateReg,io_tx_cmd_ready)
  begin
    fsm_discoveringRspTx_fsms_0_wantExit <= pkg_toStdLogic(false); --@[StateMachine.scala 151:28]
    case fsm_discoveringRspTx_fsms_0_stateReg is
      when pkg_enum.sendCmd =>
        if io_tx_cmd_ready = '1' then
          fsm_discoveringRspTx_fsms_0_wantExit <= pkg_toStdLogic(true); --@[StateMachine.scala 366:14]
        end if;
      when others =>
    end case;
  end process;

  process(when_StateMachine_l253_1)
  begin
    fsm_discoveringRspTx_fsms_0_wantStart <= pkg_toStdLogic(false); --@[StateMachine.scala 152:19]
    if when_StateMachine_l253_1 = '1' then
      fsm_discoveringRspTx_fsms_0_wantStart <= pkg_toStdLogic(true); --@[StateMachine.scala 362:15]
    end if;
  end process;

  fsm_discoveringRspTx_fsms_0_wantKill <= pkg_toStdLogic(false); --@[StateMachine.scala 153:18]
  process(fsm_discoveringRspTx_fsms_1_stateReg,io_tx_data_ready,io_tx_data_payload_last_read_buffer)
  begin
    fsm_discoveringRspTx_fsms_1_wantExit <= pkg_toStdLogic(false); --@[StateMachine.scala 151:28]
    case fsm_discoveringRspTx_fsms_1_stateReg is
      when pkg_enum.sendHeader =>
      when pkg_enum.sendMessage =>
        if io_tx_data_ready = '1' then
          if io_tx_data_payload_last_read_buffer = '1' then
            fsm_discoveringRspTx_fsms_1_wantExit <= pkg_toStdLogic(true); --@[StateMachine.scala 366:14]
          end if;
        end if;
      when others =>
    end case;
  end process;

  process(when_StateMachine_l253_1)
  begin
    fsm_discoveringRspTx_fsms_1_wantStart <= pkg_toStdLogic(false); --@[StateMachine.scala 152:19]
    if when_StateMachine_l253_1 = '1' then
      fsm_discoveringRspTx_fsms_1_wantStart <= pkg_toStdLogic(true); --@[StateMachine.scala 362:15]
    end if;
  end process;

  fsm_discoveringRspTx_fsms_1_wantKill <= pkg_toStdLogic(false); --@[StateMachine.scala 153:18]
  process(fsm_discoveringRspTx_fsms_0_stateReg,io_tx_cmd_ready,fsm_discoveringRspTx_fsms_0_wantStart,fsm_discoveringRspTx_fsms_0_wantKill)
  begin
    fsm_discoveringRspTx_fsms_0_stateNext <= fsm_discoveringRspTx_fsms_0_stateReg; --@[StateMachine.scala 217:17]
    case fsm_discoveringRspTx_fsms_0_stateReg is
      when pkg_enum.sendCmd =>
        if io_tx_cmd_ready = '1' then
          fsm_discoveringRspTx_fsms_0_stateNext <= pkg_enum.BOOT; --@[Enum.scala 148:67]
        end if;
      when others =>
    end case;
    if fsm_discoveringRspTx_fsms_0_wantStart = '1' then
      fsm_discoveringRspTx_fsms_0_stateNext <= pkg_enum.sendCmd; --@[Enum.scala 148:67]
    end if;
    if fsm_discoveringRspTx_fsms_0_wantKill = '1' then
      fsm_discoveringRspTx_fsms_0_stateNext <= pkg_enum.BOOT; --@[Enum.scala 148:67]
    end if;
  end process;

  process(fsm_discoveringRspTx_fsms_1_stateReg,io_tx_data_ready,io_tx_data_payload_last_read_buffer,fsm_discoveringRspTx_fsms_1_wantStart,fsm_discoveringRspTx_fsms_1_wantKill)
  begin
    fsm_discoveringRspTx_fsms_1_stateNext <= fsm_discoveringRspTx_fsms_1_stateReg; --@[StateMachine.scala 217:17]
    case fsm_discoveringRspTx_fsms_1_stateReg is
      when pkg_enum.sendHeader =>
        if io_tx_data_ready = '1' then
          fsm_discoveringRspTx_fsms_1_stateNext <= pkg_enum.sendMessage; --@[Enum.scala 148:67]
        end if;
      when pkg_enum.sendMessage =>
        if io_tx_data_ready = '1' then
          if io_tx_data_payload_last_read_buffer = '1' then
            fsm_discoveringRspTx_fsms_1_stateNext <= pkg_enum.BOOT; --@[Enum.scala 148:67]
          end if;
        end if;
      when others =>
    end case;
    if fsm_discoveringRspTx_fsms_1_wantStart = '1' then
      fsm_discoveringRspTx_fsms_1_stateNext <= pkg_enum.sendHeader; --@[Enum.scala 148:67]
    end if;
    if fsm_discoveringRspTx_fsms_1_wantKill = '1' then
      fsm_discoveringRspTx_fsms_1_stateNext <= pkg_enum.BOOT; --@[Enum.scala 148:67]
    end if;
  end process;

  when_StateMachine_l253 <= ((not pkg_toStdLogic(fsm_discoveringRspTx_fsms_1_stateReg = pkg_enum.sendMessage)) and pkg_toStdLogic(fsm_discoveringRspTx_fsms_1_stateNext = pkg_enum.sendMessage)); --@[BaseType.scala 305:24]
  process(fsm_stateReg,when_test13_l65,io_rx_cmd_payload_dstPort,io_rx_data_valid,io_rx_data_payload_fragment,when_State_l179,fsm_wantStart,fsm_wantKill)
  begin
    fsm_stateNext <= fsm_stateReg; --@[StateMachine.scala 217:17]
    case fsm_stateReg is
      when pkg_enum.idle =>
        if when_test13_l65 = '1' then
          case io_rx_cmd_payload_dstPort is
            when "1001010001100000" =>
              fsm_stateNext <= pkg_enum.helloHeader; --@[Enum.scala 148:67]
            when others =>
          end case;
        end if;
      when pkg_enum.helloHeader =>
        if io_rx_data_valid = '1' then
          case io_rx_data_payload_fragment is
            when "00010001" =>
              fsm_stateNext <= pkg_enum.discoveringRspTx; --@[Enum.scala 148:67]
            when others =>
              fsm_stateNext <= pkg_enum.idle; --@[Enum.scala 148:67]
          end case;
        end if;
      when pkg_enum.discoveringRspTx =>
        if when_State_l179 = '1' then
          fsm_stateNext <= pkg_enum.idle; --@[Enum.scala 148:67]
        end if;
      when others =>
    end case;
    if fsm_wantStart = '1' then
      fsm_stateNext <= pkg_enum.idle; --@[Enum.scala 148:67]
    end if;
    if fsm_wantKill = '1' then
      fsm_stateNext <= pkg_enum.BOOT; --@[Enum.scala 148:67]
    end if;
  end process;

  when_test13_l65 <= (io_rx_cmd_valid and (not flushRx_active)); --@[BaseType.scala 305:24]
  when_State_l179 <= ((pkg_toStdLogic(fsm_discoveringRspTx_fsms_0_stateReg = pkg_enum.BOOT) or fsm_discoveringRspTx_fsms_0_wantExit) and (pkg_toStdLogic(fsm_discoveringRspTx_fsms_1_stateReg = pkg_enum.BOOT) or fsm_discoveringRspTx_fsms_1_wantExit)); --@[BaseType.scala 305:24]
  when_StateMachine_l253_1 <= ((not pkg_toStdLogic(fsm_stateReg = pkg_enum.discoveringRspTx)) and pkg_toStdLogic(fsm_stateNext = pkg_enum.discoveringRspTx)); --@[BaseType.scala 305:24]
  process(clk, reset)
  begin
    if reset = '1' then
      flushRx_active <= pkg_toStdLogic(false); --@[Data.scala 400:33]
      fsm_discoveringRspTx_fsms_0_stateReg <= pkg_enum.BOOT; --@[Data.scala 400:33]
      fsm_discoveringRspTx_fsms_1_stateReg <= pkg_enum.BOOT; --@[Data.scala 400:33]
      fsm_stateReg <= pkg_enum.BOOT; --@[Data.scala 400:33]
    elsif rising_edge(clk) then
      if flushRx_active = '1' then
        if when_test13_l53 = '1' then
          flushRx_active <= pkg_toStdLogic(false); --@[test13.scala 55:16]
        end if;
      end if;
      fsm_discoveringRspTx_fsms_0_stateReg <= fsm_discoveringRspTx_fsms_0_stateNext; --@[StateMachine.scala 212:14]
      fsm_discoveringRspTx_fsms_1_stateReg <= fsm_discoveringRspTx_fsms_1_stateNext; --@[StateMachine.scala 212:14]
      fsm_stateReg <= fsm_stateNext; --@[StateMachine.scala 212:14]
      case fsm_stateReg is
        when pkg_enum.idle =>
          if when_test13_l65 = '1' then
            case io_rx_cmd_payload_dstPort is
              when "1001010001100000" =>
              when others =>
                flushRx_active <= pkg_toStdLogic(true); --@[test13.scala 47:14]
            end case;
          end if;
        when pkg_enum.helloHeader =>
          if io_rx_data_valid = '1' then
            case io_rx_data_payload_fragment is
              when "00010001" =>
              when others =>
                flushRx_active <= pkg_toStdLogic(true); --@[test13.scala 47:14]
            end case;
          end if;
        when pkg_enum.discoveringRspTx =>
          if when_State_l179 = '1' then
            flushRx_active <= pkg_toStdLogic(true); --@[test13.scala 47:14]
          end if;
        when others =>
      end case;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      case fsm_discoveringRspTx_fsms_1_stateReg is
        when pkg_enum.sendHeader =>
        when pkg_enum.sendMessage =>
          if io_tx_data_ready = '1' then
            fsm_discoveringRspTx_fsms_1_sendMessage_counter <= (fsm_discoveringRspTx_fsms_1_sendMessage_counter + pkg_unsigned("001")); --@[test13.scala 140:19]
          end if;
        when others =>
      end case;
      if when_StateMachine_l253 = '1' then
        fsm_discoveringRspTx_fsms_1_sendMessage_counter <= pkg_unsigned("000"); --@[test13.scala 133:17]
      end if;
    end if;
  end process;

end arch;

