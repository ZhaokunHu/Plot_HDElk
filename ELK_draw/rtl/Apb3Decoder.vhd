-- Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
-- Component : Apb3Decoder
-- Git hash  : 88613335ef5deb11dabc4cce72b85cc1a5a9b29f

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is

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


entity Apb3Decoder is
  port(
    io_input_PADDR : in unsigned(15 downto 0);
    io_input_PSEL : in std_logic_vector(0 downto 0);
    io_input_PENABLE : in std_logic;
    io_input_PREADY : out std_logic;
    io_input_PWRITE : in std_logic;
    io_input_PWDATA : in std_logic_vector(31 downto 0);
    io_input_PRDATA : out std_logic_vector(31 downto 0);
    io_input_PSLVERROR : out std_logic;
    io_outputs_0_PADDR : out unsigned(15 downto 0);
    io_outputs_0_PSEL : out std_logic_vector(0 downto 0);
    io_outputs_0_PENABLE : out std_logic;
    io_outputs_0_PREADY : in std_logic;
    io_outputs_0_PWRITE : out std_logic;
    io_outputs_0_PWDATA : out std_logic_vector(31 downto 0);
    io_outputs_0_PRDATA : in std_logic_vector(31 downto 0);
    io_outputs_0_PSLVERROR : in std_logic;
    io_outputs_1_PADDR : out unsigned(15 downto 0);
    io_outputs_1_PSEL : out std_logic_vector(0 downto 0);
    io_outputs_1_PENABLE : out std_logic;
    io_outputs_1_PREADY : in std_logic;
    io_outputs_1_PWRITE : out std_logic;
    io_outputs_1_PWDATA : out std_logic_vector(31 downto 0);
    io_outputs_1_PRDATA : in std_logic_vector(31 downto 0);
    io_outputs_1_PSLVERROR : in std_logic;
    io_outputs_2_PADDR : out unsigned(15 downto 0);
    io_outputs_2_PSEL : out std_logic_vector(0 downto 0);
    io_outputs_2_PENABLE : out std_logic;
    io_outputs_2_PREADY : in std_logic;
    io_outputs_2_PWRITE : out std_logic;
    io_outputs_2_PWDATA : out std_logic_vector(31 downto 0);
    io_outputs_2_PRDATA : in std_logic_vector(31 downto 0);
    io_outputs_2_PSLVERROR : in std_logic;
    io_outputs_3_PADDR : out unsigned(15 downto 0);
    io_outputs_3_PSEL : out std_logic_vector(0 downto 0);
    io_outputs_3_PENABLE : out std_logic;
    io_outputs_3_PREADY : in std_logic;
    io_outputs_3_PWRITE : out std_logic;
    io_outputs_3_PWDATA : out std_logic_vector(31 downto 0);
    io_outputs_3_PRDATA : in std_logic_vector(31 downto 0);
    io_outputs_3_PSLVERROR : in std_logic
  );
end Apb3Decoder;

architecture arch of Apb3Decoder is
  signal zz_io_input_PREADY : std_logic;
  signal zz_io_input_PRDATA : std_logic_vector(31 downto 0);
  signal zz_io_input_PSLVERROR : std_logic;

  signal mappingHits_0 : std_logic;
  signal mappingHits_1 : std_logic;
  signal mappingHits_2 : std_logic;
  signal mappingHits_3 : std_logic;
  signal zz_mappingHitsIndex : std_logic;
  signal zz_mappingHitsIndex_1 : std_logic;
  signal mappingHitsIndex : unsigned(1 downto 0);
begin
  process(mappingHitsIndex,io_outputs_0_PREADY,io_outputs_0_PRDATA,io_outputs_0_PSLVERROR,io_outputs_1_PREADY,io_outputs_1_PRDATA,io_outputs_1_PSLVERROR,io_outputs_2_PREADY,io_outputs_2_PRDATA,io_outputs_2_PSLVERROR,io_outputs_3_PREADY,io_outputs_3_PRDATA,io_outputs_3_PSLVERROR)
  begin
    case mappingHitsIndex is
      when "00" =>
        zz_io_input_PREADY <= io_outputs_0_PREADY;
        zz_io_input_PRDATA <= io_outputs_0_PRDATA;
        zz_io_input_PSLVERROR <= io_outputs_0_PSLVERROR;
      when "01" =>
        zz_io_input_PREADY <= io_outputs_1_PREADY;
        zz_io_input_PRDATA <= io_outputs_1_PRDATA;
        zz_io_input_PSLVERROR <= io_outputs_1_PSLVERROR;
      when "10" =>
        zz_io_input_PREADY <= io_outputs_2_PREADY;
        zz_io_input_PRDATA <= io_outputs_2_PRDATA;
        zz_io_input_PSLVERROR <= io_outputs_2_PSLVERROR;
      when others =>
        zz_io_input_PREADY <= io_outputs_3_PREADY;
        zz_io_input_PRDATA <= io_outputs_3_PRDATA;
        zz_io_input_PSLVERROR <= io_outputs_3_PSLVERROR;
    end case;
  end process;

  io_outputs_0_PADDR <= io_input_PADDR; --@[test11.scala 23:20]
  io_outputs_0_PENABLE <= io_input_PENABLE; --@[test11.scala 24:20]
  io_outputs_0_PWRITE <= io_input_PWRITE; --@[test11.scala 25:20]
  io_outputs_0_PWDATA <= io_input_PWDATA; --@[test11.scala 26:20]
  io_outputs_1_PADDR <= io_input_PADDR; --@[test11.scala 23:20]
  io_outputs_1_PENABLE <= io_input_PENABLE; --@[test11.scala 24:20]
  io_outputs_1_PWRITE <= io_input_PWRITE; --@[test11.scala 25:20]
  io_outputs_1_PWDATA <= io_input_PWDATA; --@[test11.scala 26:20]
  io_outputs_2_PADDR <= io_input_PADDR; --@[test11.scala 23:20]
  io_outputs_2_PENABLE <= io_input_PENABLE; --@[test11.scala 24:20]
  io_outputs_2_PWRITE <= io_input_PWRITE; --@[test11.scala 25:20]
  io_outputs_2_PWDATA <= io_input_PWDATA; --@[test11.scala 26:20]
  io_outputs_3_PADDR <= io_input_PADDR; --@[test11.scala 23:20]
  io_outputs_3_PENABLE <= io_input_PENABLE; --@[test11.scala 24:20]
  io_outputs_3_PWRITE <= io_input_PWRITE; --@[test11.scala 25:20]
  io_outputs_3_PWDATA <= io_input_PWDATA; --@[test11.scala 26:20]
  mappingHits_0 <= (pkg_toStdLogic(pkg_unsigned("0000000000000000") <= io_input_PADDR) and pkg_toStdLogic(io_input_PADDR < pkg_unsigned("0001000000000000"))); --@[BaseType.scala 305:24]
  mappingHits_1 <= (pkg_toStdLogic(pkg_unsigned("0001000000000000") <= io_input_PADDR) and pkg_toStdLogic(io_input_PADDR < pkg_unsigned("0010000000000000"))); --@[BaseType.scala 305:24]
  mappingHits_2 <= (pkg_toStdLogic(pkg_unsigned("0100000000000000") <= io_input_PADDR) and pkg_toStdLogic(io_input_PADDR < pkg_unsigned("0110000000000000"))); --@[BaseType.scala 305:24]
  mappingHits_3 <= (pkg_toStdLogic(pkg_unsigned("0110000000000000") <= io_input_PADDR) and pkg_toStdLogic(io_input_PADDR < pkg_unsigned("1001000000000000"))); --@[BaseType.scala 305:24]
  zz_mappingHitsIndex <= (mappingHits_1 or mappingHits_3); --@[BaseType.scala 305:24]
  zz_mappingHitsIndex_1 <= (mappingHits_2 or mappingHits_3); --@[BaseType.scala 305:24]
  mappingHitsIndex <= unsigned(pkg_cat(pkg_toStdLogicVector(zz_mappingHitsIndex_1),pkg_toStdLogicVector(zz_mappingHitsIndex))); --@[BaseType.scala 318:22]
  io_outputs_0_PSEL(0) <= (mappingHits_0 and pkg_extract(io_input_PSEL,0)); --@[test11.scala 34:28]
  io_outputs_1_PSEL(0) <= (mappingHits_1 and pkg_extract(io_input_PSEL,0)); --@[test11.scala 34:28]
  io_outputs_2_PSEL(0) <= (mappingHits_2 and pkg_extract(io_input_PSEL,0)); --@[test11.scala 34:28]
  io_outputs_3_PSEL(0) <= (mappingHits_3 and pkg_extract(io_input_PSEL,0)); --@[test11.scala 34:28]
  io_input_PREADY <= zz_io_input_PREADY; --@[test11.scala 37:19]
  io_input_PRDATA <= zz_io_input_PRDATA; --@[test11.scala 38:19]
  io_input_PSLVERROR <= zz_io_input_PSLVERROR; --@[test11.scala 39:50]
end arch;

