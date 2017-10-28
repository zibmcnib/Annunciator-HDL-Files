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
-- CREATED		"Fri Oct 27 20:20:54 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mi_logic_channel IS 
	PORT
	(
		ack_l :  IN  STD_LOGIC;
		FF :  IN  STD_LOGIC;
		SF :  IN  STD_LOGIC;
		r :  IN  STD_LOGIC;
		phase_a_l :  IN  STD_LOGIC;
		phase_b_l :  IN  STD_LOGIC;
		alarm_l :  IN  STD_LOGIC;
		j :  IN  STD_LOGIC;
		lmp_l :  OUT  STD_LOGIC;
		horn1 :  OUT  STD_LOGIC;
		horn2 :  OUT  STD_LOGIC
	);
END mi_logic_channel;

ARCHITECTURE bdf_type OF mi_logic_channel IS 

COMPONENT mux2_1
	PORT(in0 : IN STD_LOGIC;
		 in1 : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 op : OUT STD_LOGIC
	);
END COMPONENT;

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

COMPONENT one_shot
	PORT(trigger : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 pulse : OUT STD_LOGIC
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

SIGNAL	a_clk :  STD_LOGIC;
SIGNAL	b_clk :  STD_LOGIC;
SIGNAL	ffout :  STD_LOGIC;
SIGNAL	gnd :  STD_LOGIC;
SIGNAL	h2 :  STD_LOGIC;
SIGNAL	mi_jumper :  STD_LOGIC;
SIGNAL	multiple_input_jumper :  STD_LOGIC;
SIGNAL	new_alarm :  STD_LOGIC;
SIGNAL	o1 :  STD_LOGIC;
SIGNAL	o2 :  STD_LOGIC;
SIGNAL	o3 :  STD_LOGIC;
SIGNAL	sel0 :  STD_LOGIC;
SIGNAL	sel1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 



b2v_inst : mux2_1
PORT MAP(in0 => gnd,
		 in1 => multiple_input_jumper,
		 sel => j,
		 op => mi_jumper);


b2v_inst1 : jkff_4027
PORT MAP(set => gnd,
		 reset => mi_jumper,
		 j => SYNTHESIZED_WIRE_0,
		 k => SYNTHESIZED_WIRE_1,
		 clock => b_clk,
		 q => sel1);


SYNTHESIZED_WIRE_11 <= NOT(ack_l);



a_clk <= NOT(phase_a_l);



b_clk <= NOT(phase_b_l);



horn1 <= NOT(SYNTHESIZED_WIRE_2);



lmp_l <= NOT(SYNTHESIZED_WIRE_3);



SYNTHESIZED_WIRE_7 <= NOT(o1 AND FF);


SYNTHESIZED_WIRE_5 <= NOT(o2 AND SF);


b2v_inst2 : dmux_4555
PORT MAP(a0 => sel0,
		 a1 => sel1,
		 out1 => o1,
		 out2 => o2,
		 out3 => o3);


SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_4 OR o3 OR ffout;


SYNTHESIZED_WIRE_4 <= NOT(SYNTHESIZED_WIRE_5);



b2v_inst26 : one_shot
PORT MAP(trigger => h2,
		 clock => a_clk,
		 pulse => horn2);


b2v_inst27 : one_shot
PORT MAP(trigger => o1,
		 clock => a_clk,
		 pulse => SYNTHESIZED_WIRE_2);


b2v_inst3 : dff_4013
PORT MAP(set => gnd,
		 reset => a_clk,
		 d => sel1,
		 clock => SYNTHESIZED_WIRE_12,
		 q_bar => h2);



ffout <= NOT(SYNTHESIZED_WIRE_7);



b2v_inst4 : dff_4013
PORT MAP(set => new_alarm,
		 reset => gnd,
		 d => gnd,
		 clock => SYNTHESIZED_WIRE_8,
		 q_bar => SYNTHESIZED_WIRE_12);


b2v_inst435 : jkff_4027
PORT MAP(set => multiple_input_jumper,
		 reset => gnd,
		 j => gnd,
		 k => SYNTHESIZED_WIRE_9,
		 clock => b_clk,
		 q => sel0);


b2v_inst5 : dff_4013
PORT MAP(set => gnd,
		 reset => gnd,
		 d => new_alarm,
		 clock => b_clk,
		 q => multiple_input_jumper);


SYNTHESIZED_WIRE_9 <= o3 AND SYNTHESIZED_WIRE_12;


SYNTHESIZED_WIRE_0 <= o1 AND SYNTHESIZED_WIRE_11;


SYNTHESIZED_WIRE_1 <= o2 AND r;


SYNTHESIZED_WIRE_8 <= NOT(a_clk);


new_alarm <= alarm_l;

gnd <= '0';
END bdf_type;