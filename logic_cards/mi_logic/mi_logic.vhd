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
-- CREATED		"Tue Oct 24 13:17:49 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mi_logic_ut IS 
	PORT
	(
		J1A :  IN  STD_LOGIC;
		J2A :  IN  STD_LOGIC;
		FF :  IN  STD_LOGIC;
		SF :  IN  STD_LOGIC;
		TEST :  IN  STD_LOGIC;
		RES :  IN  STD_LOGIC;
		ACK_l :  IN  STD_LOGIC;
		CLK_B_l :  IN  STD_LOGIC;
		CLK_A_l :  IN  STD_LOGIC;
		FC1 :  IN  STD_LOGIC;
		FC2 :  IN  STD_LOGIC;
		LMP1_l :  OUT  STD_LOGIC;
		LMP2_l :  OUT  STD_LOGIC;
		HORN1 :  OUT  STD_LOGIC;
		HORN2 :  OUT  STD_LOGIC;
		LMP1_l49 :  OUT  STD_LOGIC;
		LMP2_l50 :  OUT  STD_LOGIC;
		HORN3 :  OUT  STD_LOGIC;
		HORN4 :  OUT  STD_LOGIC
	);
END mi_logic_ut;

ARCHITECTURE bdf_type OF mi_logic_ut IS 

COMPONENT jkff_4027
	PORT(set : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 j : IN STD_LOGIC;
		 k : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC;
		 q_bar : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT dmux_4555
	PORT(a0 : IN STD_LOGIC;
		 a1 : IN STD_LOGIC;
		 out0 : OUT STD_LOGIC;
		 out1 : OUT STD_LOGIC;
		 out2 : OUT STD_LOGIC;
		 out3 : OUT STD_LOGIC
	);
END COMPONENT;

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

COMPONENT signal_dmux
	PORT(a0 : IN STD_LOGIC;
		 a1 : IN STD_LOGIC;
		 SF : IN STD_LOGIC;
		 FF : IN STD_LOGIC;
		 steady : IN STD_LOGIC;
		 out0 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	1A :  STD_LOGIC;
SIGNAL	2A :  STD_LOGIC;
SIGNAL	A1 :  STD_LOGIC;
SIGNAL	A2 :  STD_LOGIC;
SIGNAL	ACK :  STD_LOGIC;
SIGNAL	CLK_A :  STD_LOGIC;
SIGNAL	CLK_B :  STD_LOGIC;
SIGNAL	FFQ0 :  STD_LOGIC;
SIGNAL	FFQ_1 :  STD_LOGIC;
SIGNAL	GND :  STD_LOGIC;
SIGNAL	HORN2_1 :  STD_LOGIC;
SIGNAL	HORN2_2 :  STD_LOGIC;
SIGNAL	HORN_ALTERA_SYNTHESIZED1 :  STD_LOGIC;
SIGNAL	HORN_ALTERA_SYNTHESIZED2 :  STD_LOGIC;
SIGNAL	INST20_1_INST24_1 :  STD_LOGIC;
SIGNAL	INST20_1_INST27_1 :  STD_LOGIC;
SIGNAL	INST20_2_INST25_1 :  STD_LOGIC;
SIGNAL	INST23_CLK_INST21_2 :  STD_LOGIC;
SIGNAL	INST34_OP_INST19_RES :  STD_LOGIC;
SIGNAL	INST5_1_INST3_1 :  STD_LOGIC;
SIGNAL	INST5_2_INST4_1 :  STD_LOGIC;
SIGNAL	INST5_3_INST2_1 :  STD_LOGIC;
SIGNAL	INST6_CLK_INST2_2 :  STD_LOGIC;
SIGNAL	INST9_OP_INST1_RES :  STD_LOGIC;
SIGNAL	LMP1 :  STD_LOGIC;
SIGNAL	LMP2 :  STD_LOGIC;
SIGNAL	S1 :  STD_LOGIC;
SIGNAL	S2 :  STD_LOGIC;
SIGNAL	sel0_1 :  STD_LOGIC;
SIGNAL	sel1_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 



b2v_inst : jkff_4027
PORT MAP(set => 1A,
		 reset => GND,
		 j => GND,
		 k => SYNTHESIZED_WIRE_0,
		 clock => CLK_B,
		 q => FFQ0);


b2v_inst1 : jkff_4027
PORT MAP(set => GND,
		 reset => INST9_OP_INST1_RES,
		 j => SYNTHESIZED_WIRE_1,
		 k => SYNTHESIZED_WIRE_2,
		 clock => CLK_B,
		 q => FFQ_1);



ACK <= NOT(ACK_l);



CLK_A <= NOT(CLK_A_l);



CLK_B <= NOT(CLK_B_l);



SYNTHESIZED_WIRE_11 <= NOT(CLK_A);



b2v_inst18 : jkff_4027
PORT MAP(set => 2A,
		 reset => GND,
		 j => GND,
		 k => SYNTHESIZED_WIRE_3,
		 clock => CLK_B,
		 q => sel0_1);


b2v_inst19 : jkff_4027
PORT MAP(set => GND,
		 reset => INST34_OP_INST19_RES,
		 j => SYNTHESIZED_WIRE_4,
		 k => SYNTHESIZED_WIRE_5,
		 clock => CLK_B,
		 q => sel1_1);


SYNTHESIZED_WIRE_0 <= INST5_3_INST2_1 AND INST6_CLK_INST2_2;


b2v_inst20 : dmux_4555
PORT MAP(a0 => sel0_1,
		 a1 => sel1_1,
		 out1 => INST20_1_INST24_1,
		 out2 => INST20_2_INST25_1,
		 out3 => INST20_1_INST27_1);


b2v_inst21 : dff_4013
PORT MAP(set => A2,
		 reset => GND,
		 d => GND,
		 clock => SYNTHESIZED_WIRE_6,
		 q_bar => INST23_CLK_INST21_2);


b2v_inst22 : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => A2,
		 clock => CLK_B,
		 q => 2A);


b2v_inst23 : dff_4013
PORT MAP(set => GND,
		 reset => CLK_A,
		 d => sel1_1,
		 clock => INST23_CLK_INST21_2,
		 q_bar => HORN2_2);


SYNTHESIZED_WIRE_4 <= INST20_1_INST24_1 AND ACK;


SYNTHESIZED_WIRE_5 <= INST20_2_INST25_1 AND RES;


SYNTHESIZED_WIRE_6 <= NOT(CLK_A);



SYNTHESIZED_WIRE_3 <= INST20_1_INST27_1 AND INST23_CLK_INST21_2;


SYNTHESIZED_WIRE_1 <= INST5_1_INST3_1 AND ACK;


SYNTHESIZED_WIRE_9 <= NOT(INST5_1_INST3_1);



SYNTHESIZED_WIRE_8 <= NOT(INST20_1_INST24_1);



b2v_inst34 : mux2_1
PORT MAP(in0 => GND,
		 in1 => 2A,
		 sel => S2,
		 op => INST34_OP_INST19_RES);


LMP1 <= NOT(SYNTHESIZED_WIRE_7);



HORN_ALTERA_SYNTHESIZED1 <= NOT(SYNTHESIZED_WIRE_8 AND SYNTHESIZED_WIRE_9);


HORN_ALTERA_SYNTHESIZED2 <= NOT(HORN2_2 AND HORN2_1);


LMP2 <= NOT(SYNTHESIZED_WIRE_10);



SYNTHESIZED_WIRE_2 <= INST5_2_INST4_1 AND RES;


b2v_inst45 : signal_dmux
PORT MAP(a0 => FFQ0,
		 a1 => FFQ_1,
		 SF => SF,
		 FF => FF,
		 steady => INST5_3_INST2_1,
		 out0 => SYNTHESIZED_WIRE_7);


b2v_inst47 : signal_dmux
PORT MAP(a0 => sel0_1,
		 a1 => sel1_1,
		 SF => SF,
		 FF => FF,
		 steady => INST20_1_INST27_1,
		 out0 => SYNTHESIZED_WIRE_10);


b2v_inst5 : dmux_4555
PORT MAP(a0 => FFQ0,
		 a1 => FFQ_1,
		 out1 => INST5_1_INST3_1,
		 out2 => INST5_2_INST4_1,
		 out3 => INST5_3_INST2_1);


b2v_inst6 : dff_4013
PORT MAP(set => GND,
		 reset => CLK_A,
		 d => FFQ_1,
		 clock => INST6_CLK_INST2_2,
		 q_bar => HORN2_1);


b2v_inst7 : dff_4013
PORT MAP(set => A1,
		 reset => GND,
		 d => GND,
		 clock => SYNTHESIZED_WIRE_11,
		 q_bar => INST6_CLK_INST2_2);


b2v_inst8 : dff_4013
PORT MAP(set => GND,
		 reset => GND,
		 d => A1,
		 clock => CLK_B,
		 q => 1A);


b2v_inst9 : mux2_1
PORT MAP(in0 => GND,
		 in1 => 1A,
		 sel => S1,
		 op => INST9_OP_INST1_RES);

LMP1_l <= LMP1;
A1 <= FC1;
S1 <= J1A;
LMP2_l <= LMP2;
A2 <= FC2;
S2 <= J2A;
HORN1 <= HORN_ALTERA_SYNTHESIZED1;
HORN2 <= HORN_ALTERA_SYNTHESIZED2;
LMP1_l49 <= LMP1;
LMP2_l50 <= LMP2;
HORN3 <= HORN_ALTERA_SYNTHESIZED1;
HORN4 <= HORN_ALTERA_SYNTHESIZED2;

GND <= '0';
END bdf_type;