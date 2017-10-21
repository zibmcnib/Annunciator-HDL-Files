
library ieee ;
use ieee.std_logic_1164.all;
use work.all;
---------------------------------------------
entity jkff_4027 is
	port(	set, reset, j, k, clock:	in std_logic;
		   q :	 buffer std_logic := '0';
			q_bar: buffer std_logic := '1');
end jkff_4027;

architecture behavioral of jkff_4027 is
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

				if ((j = '1' and  q = '0') xor (q = '1' and k = '0')) then
					q <= '1';
					q_bar <= '0';
				elsif ((j = '0' and q = '0') xor (k = '1' and q = '1')) then
					q <= '0';
				  q_bar <= '1';
				end if;

			end if;
	end process;
end behavioral;
