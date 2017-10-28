-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Standard Edition"
-- CREATED		"Fri Oct 27 20:21:10 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mi_logic IS 
	PORT
	(
		phase_a_l :  IN  STD_LOGIC;
		phase_b_l :  IN  STD_LOGIC;
		FF :  IN  STD_LOGIC;
		SF :  IN  STD_LOGIC;
		j1a :  IN  STD_LOGIC;
		j2a :  IN  STD_LOGIC;
		ACK_l :  IN  STD_LOGIC;
		R :  IN  STD_LOGIC;
		A1_l :  IN  STD_LOGIC;
		A2_l :  IN  STD_LOGIC;
		LMP1_l :  OUT  STD_LOGIC;
		HORN1 :  OUT  STD_LOGIC;
		HORN2 :  OUT  STD_LOGIC;
		LMP2_l :  OUT  STD_LOGIC
	);
END mi_logic;

ARCHITECTURE bdf_type OF mi_logic IS 

COMPONENT mi_logic_channel
	PORT(FF : IN STD_LOGIC;
		 SF : IN STD_LOGIC;
		 ack_l : IN STD_LOGIC;
		 r : IN STD_LOGIC;
		 phase_a_l : IN STD_LOGIC;
		 phase_b_l : IN STD_LOGIC;
		 alarm_l : IN STD_LOGIC;
		 j : IN STD_LOGIC;
		 lmp_l : OUT STD_LOGIC;
		 horn1 : OUT STD_LOGIC;
		 horn2 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	a1 :  STD_LOGIC;
SIGNAL	a2 :  STD_LOGIC;
SIGNAL	ack :  STD_LOGIC;
SIGNAL	clock_a :  STD_LOGIC;
SIGNAL	clock_b :  STD_LOGIC;
SIGNAL	horn1_0 :  STD_LOGIC;
SIGNAL	horn1_1 :  STD_LOGIC;
SIGNAL	horn2_0 :  STD_LOGIC;
SIGNAL	horn2_1 :  STD_LOGIC;
SIGNAL	reset :  STD_LOGIC;


BEGIN 



b2v_inst : mi_logic_channel
PORT MAP(FF => FF,
		 SF => SF,
		 ack_l => ack,
		 r => reset,
		 phase_a_l => clock_a,
		 phase_b_l => clock_b,
		 alarm_l => a1,
		 j => j1a,
		 lmp_l => LMP1_l,
		 horn1 => horn1_0,
		 horn2 => horn2_0);


HORN1 <= NOT(horn1_1 AND horn1_0);


HORN2 <= NOT(horn2_1 AND horn2_0);


b2v_inst4 : mi_logic_channel
PORT MAP(FF => FF,
		 SF => SF,
		 ack_l => ack,
		 r => reset,
		 phase_a_l => clock_a,
		 phase_b_l => clock_b,
		 alarm_l => a2,
		 j => j2a,
		 lmp_l => LMP2_l,
		 horn1 => horn1_1,
		 horn2 => horn2_1);

ack <= ACK_l;
reset <= R;
clock_a <= phase_a_l;
clock_b <= phase_b_l;
a1 <= A1_l;
a2 <= A2_l;

END bdf_type;