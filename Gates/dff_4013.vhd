
library ieee ;
use ieee.std_logic_1164.all;
use work.all;
---------------------------------------------
entity dff_4013 is
	port(	set, reset, d, clock:	in std_logic;
		   q, q_bar:	     			out std_logic);
end dff_4013;

architecture behavioral of dff_4013 is
begin
	process(clock, reset, set)
	begin
			if (reset = '1' and set = '1') then
				q <= '1';
				q_bar <= '1';
			elsif (reset = '1' and set = '0') then
				q <= '0';
				q_bar <= '1';
			elsif (reset = '0' and set = '1') then
				q <= '1';
				q_bar <= '0';
			elsif (rising_edge(clock)) then
				q <= d;
			   q_bar <= NOT d;
			end if;
	end process;
end behavioral;

----------------------------------------------

