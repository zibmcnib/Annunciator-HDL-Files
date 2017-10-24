library ieee;
use ieee.std_logic_1164.all;

entity mi_logicTB is
end mi_logicTB;

architecture behave of mi_logicTB is
	signal jumper1 : std_logic := '0';
	signal jumper2 : std_logic := '0';
	signal fast_fl : std_logic := '0';
	signal slow_fl : std_logic := '0';
	signal test    : std_logic := '0';
	signal reset   : std_logic := '0';
	signal ack_l   : std_logic := '0';
	signal clock_a : std_logic := '0';
	signal clock_b : std_logic := '0';
	signal alarm_1 : std_logic := '0';
	signal alarm_2 : std_logic := '0';
	signal lamp_1  : std_logic;
	signal lamp_2  : std_logic;
	signal horn_1  : std_logic;
	signal horn_2  : std_logic;

	component mi_logic is
		port (
		J1A :  IN  STD_LOGIC;
		J2A :  IN  STD_LOGIC;
		FF :  IN  STD_LOGIC;
		SF :  IN  STD_LOGIC;
		TEST :  IN  STD_LOGIC;
		RES :  IN  STD_LOGIC;
		ACK_l :  IN  STD_LOGIC;
		CLK_B_l :  IN  STD_LOGIC;
		CLK_A_l :  IN  STD_LOGIC;
		A2_l :  IN  STD_LOGIC;
		A1_l :  IN  STD_LOGIC;
		LMP1_l :  OUT  STD_LOGIC;
		LMP2_l :  OUT  STD_LOGIC;
		HORN1 :  OUT  STD_LOGIC;
		HORN2 :  OUT  STD_LOGIC);
	end component mi_logic;

begin

	mi_logic_INST : mi_logic
		port map (
		J1A => jumper1,
		J2A => jumper2,
		FF => fast_fl,
		SF => slow_fl,
		TEST => test,
		RES => reset,
		ACK_l => ack_l,
		CLK_B_l => clock_a,
		CLK_A_l => clock_b,
		A2_l => alarm_2,
		A1_l => alarm_1,
		LMP1_l => lamp_1,
		LMP2_l => lamp_2,
		HORN1 => horn_1,
		HORN2 => horn_2);

		CLOCKA_process : process
		BEGIN
			clock_a <= '1';
			wait for 3.75 ns;
			clock_a <= '0';
			wait for 1.25 ns;
		end process;

		CLOCKB_process : process
		BEGIN
			clock_b <= '0';
			wait for 1.25 ns;
			clock_b <= '1';
			wait for 3.75 ns;
		end process;

		FF_process : process
		BEGIN
			fast_fl <= '0';
			wait for 15 ns;
			fast_fl <= '1';
			wait for 15 ns;
		end process;

		SF_process : process
		BEGIN
			slow_fl <= '0';
			wait for 20 ns;
			slow_fl <= '1';
			wait for 20 ns;
		end process;

		ALARM1_process : process
		BEGIN
			alarm_1 <= '1';
			wait for 25 ns;
			alarm_2 <= '0';
			wait for 10 ns;
			alarm_2 <= '1';
			wait for 10 ns;
			alarm_2 <= '0';
			wait for 10 ns;
			alarm_2 <= '1';
			wait for 10 ns;
			alarm_2 <= '0';
			wait for 10 ns;
		end process;

		jumper1 <= '0';
		jumper2 <= '0';
		alarm_2 <= '1';

		process is
		BEGIN
			ack_l <= '0';
			reset <= '0';
			test <= '0';
			wait for 100 ns;
			ack_l <= '1';
			reset <= '0';
			test <= '0';
			wait for 100 ns;
			ack_l <= '0';
			reset <= '1';
			test <= '0';
			wait for 100 ns;
		end process;



end behave;
