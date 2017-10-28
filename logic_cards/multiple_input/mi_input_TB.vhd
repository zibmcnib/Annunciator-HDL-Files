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
-- CREATED		"Fri Oct 27 20:16:40 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mi_input_TB IS 
	PORT
	(
		clock :  IN  STD_LOGIC;
		fc1 :  IN  STD_LOGIC;
		fc2 :  IN  STD_LOGIC;
		fc3 :  IN  STD_LOGIC;
		fc4 :  IN  STD_LOGIC;
		j1 :  IN  STD_LOGIC;
		j2 :  IN  STD_LOGIC;
		j3 :  IN  STD_LOGIC;
		j4 :  IN  STD_LOGIC;
		o1 :  OUT  STD_LOGIC;
		o2 :  OUT  STD_LOGIC;
		o3 :  OUT  STD_LOGIC;
		o4 :  OUT  STD_LOGIC
	);
END mi_input_TB;

ARCHITECTURE bdf_type OF mi_input_TB IS 

COMPONENT multiple_input
	PORT(phase_a_l : IN STD_LOGIC;
		 fcin1 : IN STD_LOGIC;
		 fcin2 : IN STD_LOGIC;
		 fcin3 : IN STD_LOGIC;
		 fcin4 : IN STD_LOGIC;
		 no_nc_jumper1 : IN STD_LOGIC;
		 no_nc_jumper2 : IN STD_LOGIC;
		 no_nc_jumper3 : IN STD_LOGIC;
		 no_nc_jumper4 : IN STD_LOGIC;
		 p01_l : OUT STD_LOGIC;
		 p02_l : OUT STD_LOGIC;
		 p03_l : OUT STD_LOGIC;
		 p04_l : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : multiple_input
PORT MAP(phase_a_l => clock,
		 fcin1 => fc1,
		 fcin2 => fc2,
		 fcin3 => fc3,
		 fcin4 => fc4,
		 no_nc_jumper1 => j1,
		 no_nc_jumper2 => j2,
		 no_nc_jumper3 => j3,
		 no_nc_jumper4 => j4,
		 p01_l => o1,
		 p02_l => o2,
		 p03_l => o3,
		 p04_l => o4);


END bdf_type;