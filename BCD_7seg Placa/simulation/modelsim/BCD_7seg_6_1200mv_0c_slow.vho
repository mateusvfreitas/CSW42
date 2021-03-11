-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "03/07/2021 02:19:18"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BCD_7seg IS
    PORT (
	input : IN std_logic_vector(3 DOWNTO 0);
	output : OUT std_logic_vector(6 DOWNTO 0)
	);
END BCD_7seg;

-- Design Ports Information
-- output[0]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BCD_7seg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(6 DOWNTO 0);
SIGNAL \output[0]~output_o\ : std_logic;
SIGNAL \output[1]~output_o\ : std_logic;
SIGNAL \output[2]~output_o\ : std_logic;
SIGNAL \output[3]~output_o\ : std_logic;
SIGNAL \output[4]~output_o\ : std_logic;
SIGNAL \output[5]~output_o\ : std_logic;
SIGNAL \output[6]~output_o\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \output~0_combout\ : std_logic;
SIGNAL \output~1_combout\ : std_logic;
SIGNAL \output~2_combout\ : std_logic;
SIGNAL \output~3_combout\ : std_logic;
SIGNAL \output~4_combout\ : std_logic;
SIGNAL \output~5_combout\ : std_logic;
SIGNAL \output~6_combout\ : std_logic;
SIGNAL \ALT_INV_output~5_combout\ : std_logic;
SIGNAL \ALT_INV_output~3_combout\ : std_logic;

BEGIN

ww_input <= input;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_output~5_combout\ <= NOT \output~5_combout\;
\ALT_INV_output~3_combout\ <= NOT \output~3_combout\;

-- Location: IOOBUF_X0_Y10_N23
\output[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output~0_combout\,
	devoe => ww_devoe,
	o => \output[0]~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\output[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output~1_combout\,
	devoe => ww_devoe,
	o => \output[1]~output_o\);

-- Location: IOOBUF_X0_Y15_N9
\output[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output~2_combout\,
	devoe => ww_devoe,
	o => \output[2]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\output[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_output~3_combout\,
	devoe => ww_devoe,
	o => \output[3]~output_o\);

-- Location: IOOBUF_X0_Y15_N2
\output[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output~4_combout\,
	devoe => ww_devoe,
	o => \output[4]~output_o\);

-- Location: IOOBUF_X3_Y34_N2
\output[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_output~5_combout\,
	devoe => ww_devoe,
	o => \output[5]~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\output[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \output~6_combout\,
	devoe => ww_devoe,
	o => \output[6]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\input[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: IOIBUF_X53_Y17_N1
\input[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: IOIBUF_X53_Y17_N8
\input[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: IOIBUF_X0_Y12_N1
\input[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: LCCOMB_X1_Y12_N24
\output~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~0_combout\ = (\input[1]~input_o\ & (!\input[3]~input_o\ & ((!\input[0]~input_o\) # (!\input[2]~input_o\)))) # (!\input[1]~input_o\ & (\input[2]~input_o\ $ (((\input[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~0_combout\);

-- Location: LCCOMB_X1_Y12_N26
\output~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~1_combout\ = (\input[2]~input_o\ & (!\input[3]~input_o\ & ((!\input[0]~input_o\) # (!\input[1]~input_o\)))) # (!\input[2]~input_o\ & (!\input[1]~input_o\ & ((\input[3]~input_o\) # (!\input[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~1_combout\);

-- Location: LCCOMB_X1_Y12_N12
\output~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~2_combout\ = (!\input[0]~input_o\ & ((\input[1]~input_o\ & ((!\input[3]~input_o\))) # (!\input[1]~input_o\ & (!\input[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~2_combout\);

-- Location: LCCOMB_X1_Y12_N30
\output~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~3_combout\ = (\input[1]~input_o\ & ((\input[3]~input_o\) # ((\input[2]~input_o\ & \input[0]~input_o\)))) # (!\input[1]~input_o\ & (\input[2]~input_o\ $ (((\input[0]~input_o\ & !\input[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~3_combout\);

-- Location: LCCOMB_X1_Y12_N8
\output~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~4_combout\ = (\input[2]~input_o\ & (((!\input[3]~input_o\)))) # (!\input[2]~input_o\ & (((\input[0]~input_o\ & !\input[3]~input_o\)) # (!\input[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~4_combout\);

-- Location: LCCOMB_X1_Y12_N2
\output~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~5_combout\ = (\input[2]~input_o\ & ((\input[3]~input_o\) # (\input[1]~input_o\ $ (\input[0]~input_o\)))) # (!\input[2]~input_o\ & (\input[1]~input_o\ & ((\input[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~5_combout\);

-- Location: LCCOMB_X1_Y12_N4
\output~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \output~6_combout\ = (\input[1]~input_o\ & (((!\input[3]~input_o\)))) # (!\input[1]~input_o\ & (\input[2]~input_o\ $ (((\input[3]~input_o\) # (!\input[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[1]~input_o\,
	datab => \input[2]~input_o\,
	datac => \input[0]~input_o\,
	datad => \input[3]~input_o\,
	combout => \output~6_combout\);

ww_output(0) <= \output[0]~output_o\;

ww_output(1) <= \output[1]~output_o\;

ww_output(2) <= \output[2]~output_o\;

ww_output(3) <= \output[3]~output_o\;

ww_output(4) <= \output[4]~output_o\;

ww_output(5) <= \output[5]~output_o\;

ww_output(6) <= \output[6]~output_o\;
END structure;


