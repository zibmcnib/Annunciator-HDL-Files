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
-- CREATED		"Fri Oct 27 20:17:17 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY multiple_input IS 
	PORT
	(
		fcin1 :  IN  STD_LOGIC;
		fcin2 :  IN  STD_LOGIC;
		fcin3 :  IN  STD_LOGIC;
		fcin4 :  IN  STD_LOGIC;
		phase_a_l :  IN  STD_LOGIC;
		no_nc_jumper1 :  IN  STD_LOGIC;
		no_nc_jumper2 :  IN  STD_LOGIC;
		no_nc_jumper3 :  IN  STD_LOGIC;
		no_nc_jumper4 :  IN  STD_LOGIC;
		p01_l :  OUT  STD_LOGIC;
		p02_l :  OUT  STD_LOGIC;
		p03_l :  OUT  STD_LOGIC;
		p04_l :  OUT  STD_LOGIC
	);
END multiple_input;

ARCHITECTURE bdf_type OF multiple_input IS 

COMPONENT multiple_input_channel
	PORT(phase_a_l : IN STD_LOGIC;
		 no_nc : IN STD_LOGIC;
		 fcin : IN STD_LOGIC;
		 p : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	clk :  STD_LOGIC;
SIGNAL	fc1 :  STD_LOGIC;
SIGNAL	fc2 :  STD_LOGIC;
SIGNAL	fc3 :  STD_LOGIC;
SIGNAL	fc4 :  STD_LOGIC;
SIGNAL	j1 :  STD_LOGIC;
SIGNAL	j2 :  STD_LOGIC;
SIGNAL	j3 :  STD_LOGIC;
SIGNAL	j4 :  STD_LOGIC;


BEGIN 



b2v_inst : multiple_input_channel
PORT MAP(phase_a_l => clk,
		 no_nc => j1,
		 fcin => fc1,
		 p => p01_l);


b2v_inst1 : multiple_input_channel
PORT MAP(phase_a_l => clk,
		 no_nc => j2,
		 fcin => fc2,
		 p => p02_l);


b2v_inst2 : multiple_input_channel
PORT MAP(phase_a_l => clk,
		 no_nc => j3,
		 fcin => fc3,
		 p => p03_l);


b2v_inst3 : multiple_input_channel
PORT MAP(phase_a_l => clk,
		 no_nc => j4,
		 fcin => fc4,
		 p => p04_l);

clk <= phase_a_l;
j1 <= no_nc_jumper1;
fc1 <= fcin1;
j2 <= no_nc_jumper2;
fc2 <= fcin2;
j3 <= no_nc_jumper3;
fc3 <= fcin3;
j4 <= no_nc_jumper4;
fc4 <= fcin4;

END bdf_type;