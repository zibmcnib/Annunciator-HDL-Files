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
-- CREATED		"Fri Oct 27 20:21:19 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY one_shot IS 
	PORT
	(
		trigger :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		pulse :  OUT  STD_LOGIC
	);
END one_shot;

ARCHITECTURE bdf_type OF one_shot IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	DFF_inst :  STD_LOGIC;
SIGNAL	DFF_inst1 :  STD_LOGIC;


BEGIN 
pulse <= DFF_inst1;
SYNTHESIZED_WIRE_1 <= '1';



PROCESS(trigger,SYNTHESIZED_WIRE_0)
BEGIN
IF (SYNTHESIZED_WIRE_0 = '0') THEN
	DFF_inst <= '0';
ELSIF (RISING_EDGE(trigger)) THEN
	DFF_inst <= SYNTHESIZED_WIRE_1;
END IF;
END PROCESS;


PROCESS(clock)
BEGIN
IF (RISING_EDGE(clock)) THEN
	DFF_inst1 <= DFF_inst;
END IF;
END PROCESS;



SYNTHESIZED_WIRE_0 <= NOT(DFF_inst1);



END bdf_type;