-------------------------------------------------
-- 2:4 Signal Decoder
-- by Patrick Gosack, 10/2017
--
-- decoding is an inverse process
-- of a multiplexing
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------
entity signal_dmux is
port(	a0:	in  std_logic;
      a1:	in  std_logic;
		SF: in  std_logic;
		FF: in  std_logic;
		steady: in  std_logic;
      out0:  out std_logic
);
end signal_dmux;
-------------------------------------------------
architecture behv of signal_dmux is
begin
process (a0, a1) is
begin
    -- process statement

    if 	 (a1 = '0' and a0 = '1') then
      out0 <= FF;
    elsif (a1 = '1' and a0 = '0') then
      out0 <= SF;
    else
      out0 <= steady;
    end if;
end process;
end behv;
--------------------------------------------------
