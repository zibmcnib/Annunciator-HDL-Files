-------------------------------------------------
-- 2:1 Mux
-- by Patrick Gosack, 10/2017
-------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------
entity mux2_1 is
port(	in0:	in  std_logic;
      in1:	in  std_logic;
		sel:  in  std_logic;
      op: out std_logic
);
end mux2_1;
-------------------------------------------------
architecture behv of mux2_1 is
begin
process (sel) is
begin
    if (sel = '0') then
      op <= in0;
    else
      op <= in1;
    end if;
end process;
end behv;
--------------------------------------------------
