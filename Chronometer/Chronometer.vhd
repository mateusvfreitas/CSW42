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
			carry: out std_logic := '0';
			count: out unsigned(7 downto 0)
		);
	END COMPONENT;
	
	SIGNAL output10ms: std_logic;
	SIGNAL carry_digit4: std_logic;
	SIGNAL carry_digit3: std_logic;
	SIGNAL carry_digit2: std_logic;
	SIGNAL carry_digit1: std_logic;
	SIGNAL count_digit4: unsigned(7 downto 0);
	SIGNAL count_digit3: unsigned(7 downto 0);
	SIGNAL count_digit2: unsigned(7 downto 0);
	SIGNAL count_digit1: unsigned(7 downto 0);
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
	carry => carry_digit4,
	count => count_digit4
);

digit3: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => carry_digit4,
	reset => '0',
	upper_bound => x"0A", -- Count from 0 to 9
	carry => carry_digit3,
	count => count_digit3
);

digit2: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => carry_digit3,
	reset => '0',
	upper_bound => x"0A", -- Count from 0 to 9
	carry => carry_digit2,
	count => count_digit2
);

digit1: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => carry_digit2,
	reset => '0',
	upper_bound => x"06", -- Count from 0 to 5
	carry => carry_digit1,
	count => count_digit1
);

END ARCHITECTURE;


