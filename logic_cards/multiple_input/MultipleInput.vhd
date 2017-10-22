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
-- VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
-- CREATED		"Fri Oct 20 18:20:48 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY MultipleInput IS 
	PORT
	(
		CLOCK :  IN  STD_LOGIC;
		FCIN1 :  IN  STD_LOGIC;
		FCIN2 :  IN  STD_LOGIC;
		FCIN3 :  IN  STD_LOGIC;
		FCIN4 :  IN  STD_LOGIC;
		P1 :  OUT  STD_LOGIC;
		P2 :  OUT  STD_LOGIC;
		P3 :  OUT  STD_LOGIC;
		P0 :  OUT  STD_LOGIC
	);
END MultipleInput;

ARCHITECTURE bdf_type OF MultipleInput IS 

COMPONENT dff_4013
	PORT(set : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 d : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC;
		 q_bar : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	CLK :  STD_LOGIC;
SIGNAL	GND :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;


BEGIN 



b2v_inst : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => SYNTHESIZED_WIRE_0,
		 clock => CLK,
		 q => SYNTHESIZED_WIRE_4,
		 q_bar => SYNTHESIZED_WIRE_18);


SYNTHESIZED_WIRE_21 <= FCIN3 OR SYNTHESIZED_WIRE_24;


SYNTHESIZED_WIRE_3 <= NOT(CLK AND SYNTHESIZED_WIRE_25);


P0 <= NOT(SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4);


SYNTHESIZED_WIRE_6 <= NOT(CLK AND SYNTHESIZED_WIRE_26);


P1 <= NOT(SYNTHESIZED_WIRE_6 AND SYNTHESIZED_WIRE_7);


SYNTHESIZED_WIRE_9 <= NOT(CLK AND SYNTHESIZED_WIRE_24);


P2 <= NOT(SYNTHESIZED_WIRE_9 AND SYNTHESIZED_WIRE_10);


b2v_inst17 : dff_4013
PORT MAP(set => FCIN3,
		 reset => GND,
		 d => FCIN3,
		 clock => SYNTHESIZED_WIRE_11,
		 q_bar => SYNTHESIZED_WIRE_24);


SYNTHESIZED_WIRE_17 <= FCIN4 OR SYNTHESIZED_WIRE_27;


SYNTHESIZED_WIRE_14 <= NOT(CLK AND SYNTHESIZED_WIRE_27);



P3 <= NOT(SYNTHESIZED_WIRE_14 AND SYNTHESIZED_WIRE_15);


b2v_inst21 : dff_4013
PORT MAP(set => FCIN4,
		 reset => GND,
		 d => FCIN4,
		 clock => SYNTHESIZED_WIRE_16,
		 q_bar => SYNTHESIZED_WIRE_27);


b2v_inst22 : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => SYNTHESIZED_WIRE_17,
		 clock => CLK,
		 q => SYNTHESIZED_WIRE_15,
		 q_bar => SYNTHESIZED_WIRE_16);


b2v_inst3 : dff_4013
PORT MAP(set => FCIN1,
		 reset => GND,
		 d => FCIN1,
		 clock => SYNTHESIZED_WIRE_18,
		 q_bar => SYNTHESIZED_WIRE_25);


b2v_inst4 : dff_4013
PORT MAP(set => FCIN2,
		 reset => GND,
		 d => FCIN2,
		 clock => SYNTHESIZED_WIRE_19,
		 q_bar => SYNTHESIZED_WIRE_26);


b2v_inst5 : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => SYNTHESIZED_WIRE_20,
		 clock => CLK,
		 q => SYNTHESIZED_WIRE_7,
		 q_bar => SYNTHESIZED_WIRE_19);


b2v_inst6 : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => SYNTHESIZED_WIRE_21,
		 clock => CLK,
		 q => SYNTHESIZED_WIRE_10,
		 q_bar => SYNTHESIZED_WIRE_11);


SYNTHESIZED_WIRE_0 <= FCIN1 OR SYNTHESIZED_WIRE_25;


SYNTHESIZED_WIRE_20 <= FCIN2 OR SYNTHESIZED_WIRE_26;

CLK <= CLOCK;

GND <= '0';
END bdf_type;