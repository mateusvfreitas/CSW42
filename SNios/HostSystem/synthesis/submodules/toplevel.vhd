-- CONTADOR 4 BITS COM CONTAGENS DE BITS 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- ENTITY
entity toplevel is
	port(
		clk			: in std_logic;
		rst			: in std_logic;
		write_en		: in std_logic;
		read_en		: in std_logic;
		write_bus	: in std_logic_vector (15 downto 0);
		read_bus		: out std_logic_vector (15 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture behav of toplevel is

	component count8bits is
		port(
			rst 		: in std_logic;
			clk 		: in std_logic;
			clr 		: in std_logic;
			en 		: in std_logic;
			L 			: in std_logic;
			J 			: in std_logic_vector (7 downto 0);
			updown	: in std_logic;
			Q 			: out std_logic_vector (7 downto 0)
		);
	end component;
	
	component countBits0 is
		port(
			D	: in std_logic_vector (7 downto 0);	-- Entrada
			Q	: out std_logic_vector (7 downto 0)	-- Saída
		);
	end component;

	component countBits1 is
		port(
			D	: in std_logic_vector (7 downto 0);	-- Entrada
			Q	: out std_logic_vector (7 downto 0)	-- Saída
		);
	end component;
	
	component register16bits is
		port(
			rst 		: in std_logic;
			clk 		: in std_logic;
			clr 		: in std_logic;
			en 		: in std_logic;
			D 			: in std_logic_vector (15 downto 0);
			Q 			: out std_logic_vector (15 downto 0)
		);
	end component;
	
	signal state_input, state_output : std_logic_vector (15 downto 0);
	signal Q_tmp, bits0_s, bits1_s : std_logic_vector (7 downto 0);
	signal enable_state : std_logic;
	
begin
	
	contador_interno: 
	count8bits port map (
		rst => rst,
		clk => clk,
		clr => '0',
		en => state_output(8),
		L => state_output(9),
		J => state_output(7 downto 0),
		updown => '0',
		Q => Q_tmp
	);
	
	contador_bits_0:
	countBits0 port map (
		D => Q_tmp,
		Q => bits0_s
	);
	
	contador_bits_1:
	countBits1 port map (
		D => Q_tmp,
		Q => bits1_s
	);
	
	state:
	register16bits port map (
		rst => '0',
		clk => clk,
		clr => '0',
		en => enable_state,
		D => state_input,
		Q => state_output
	);
	
	state_input <= write_bus when write_en = '1' else "ZZZZZZZZZZZZZZZZ";
	
	enable_state <= '1' when write_en = '1' and write_bus(15 downto 10) = "100000" else '0';
	
	read_bus <= bits1_s & bits0_s when read_en = '1' and write_bus(15 downto 13) = "011" else
					"00000000" & bits0_s when read_en = '1' and write_bus(15 downto 13) = "001" else
					"00000000" & bits1_s when read_en = '1' and write_bus(15 downto 13) = "010" else
					"ZZZZZZZZZZZZZZZZ";
	
end architecture;
