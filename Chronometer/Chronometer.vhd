Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY Chronometer is
	PORT(clk_50: in std_logic);
END ENTITY;

ARCHITECTURE Behavior of Chronometer is
	COMPONENT Counter10ms
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			output: out std_logic := '0'
		);
	END COMPONENT;
	
	COMPONENT CounterUpToN
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			upper_bound: in unsigned(7 downto 0);
			output: out std_logic := '0'
		);
	END COMPONENT;
	
	SIGNAL output10ms: std_logic := '0';
	SIGNAL output_digit4: std_logic := '0';
	SIGNAL output_digit3: std_logic := '0';
	SIGNAL output_digit2: std_logic := '0';
	SIGNAL output_digit1: std_logic := '0';
BEGIN

cont10ms: Counter10ms PORT MAP(
	clk_50 => clk_50,
	enable => '1',
	reset => '0',
	output => output10ms
);
	
digit4: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => output10ms,
	reset => '0',
	upper_bound => x"0A", -- Count from 0 to 9
	output => output_digit3
);

END ARCHITECTURE;


