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
-- CREATED		"Fri Oct 27 20:17:07 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY multiple_input_channel IS 
	PORT
	(
		no_nc :  IN  STD_LOGIC;
		phase_a_l :  IN  STD_LOGIC;
		fcin :  IN  STD_LOGIC;
		p :  OUT  STD_LOGIC
	);
END multiple_input_channel;

ARCHITECTURE bdf_type OF multiple_input_channel IS 

COMPONENT dff_4013
	PORT(set : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 d : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC;
		 q_bar : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT mux2_1
	PORT(in0 : IN STD_LOGIC;
		 in1 : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 op : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	CLK :  STD_LOGIC;
SIGNAL	GND :  STD_LOGIC;
SIGNAL	vcc :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;


BEGIN 



b2v_inst : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => SYNTHESIZED_WIRE_0,
		 clock => CLK,
		 q => SYNTHESIZED_WIRE_3,
		 q_bar => SYNTHESIZED_WIRE_6);


SYNTHESIZED_WIRE_2 <= NOT(CLK AND SYNTHESIZED_WIRE_11);


p <= NOT(SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3);



b2v_inst3 : dff_4013
PORT MAP(set => SYNTHESIZED_WIRE_12,
		 reset => GND,
		 d => SYNTHESIZED_WIRE_12,
		 clock => SYNTHESIZED_WIRE_6,
		 q_bar => SYNTHESIZED_WIRE_11);


SYNTHESIZED_WIRE_8 <= NOT(fcin);




b2v_inst5 : mux2_1
PORT MAP(in0 => GND,
		 in1 => vcc,
		 sel => no_nc,
		 op => SYNTHESIZED_WIRE_7);


SYNTHESIZED_WIRE_12 <= SYNTHESIZED_WIRE_7 XOR SYNTHESIZED_WIRE_8;


SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_12 OR SYNTHESIZED_WIRE_11;

CLK <= phase_a_l;

GND <= '0';
vcc <= '1';
END bdf_type;