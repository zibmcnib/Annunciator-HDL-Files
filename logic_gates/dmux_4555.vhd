-------------------------------------------------
-- 2:4 Decoder
-- by Patrick Gosack, 10/2017
--
-- decoding is an inverse process
-- of a multiplexing
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------
entity dmux_4555 is
port(	a0:	in  std_logic;
      a1:	in  std_logic;
      out0: out std_logic;
      out1: out std_logic;
      out2: out std_logic;
      out3: out std_logic
);
end dmux_4555;
-------------------------------------------------
architecture behv of dmux_4555 is
begin
process (a0, a1) is
begin
    -- process statement

    if 	 (a0 = '0' and a1 = '0') then
      out0 <= '0';
      out1 <= '0';
      out2 <= '0';
      out3 <= '1';
    elsif (a0 = '0' and a1 = '1') then
      out0 <= '0';
      out1 <= '0';
      out2 <= '1';
      out3 <= '0';
    elsif (a0 = '1' and a1 = '0') then
      out0 <= '0';
      out1 <= '1';
      out2 <= '0';
      out3 <= '0';
    else
      out0 <= '1';
      out1 <= '0';
      out2 <= '0';
      out3 <= '0';
    end if;
end process;
end behv;
--------------------------------------------------
