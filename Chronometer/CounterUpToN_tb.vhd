Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY CounterUpToN_tb IS
END ENTITY;

ARCHITECTURE teste of CounterUpToN_tb IS
	COMPONENT CounterUpToN
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			upper_bound: in unsigned(7 downto 0);
			output: out std_logic := '0'
		);
	END COMPONENT CounterUpToN;

	SIGNAL clk_50_tb: std_logic;
	SIGNAL enable_tb: std_logic;
	SIGNAL reset_tb: std_logic;
	SIGNAL upper_bound_tb: unsigned(7 downto 0);
	SIGNAL output_tb: std_logic;

	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: CounterUpToN port map (
		clk_50 => clk_50_tb,
		enable => enable_tb,
		reset => reset_tb,
		upper_bound => upper_bound_tb,
		output => output_tb
	);

PROCESS
	BEGIN
		enable_tb <= '1';
		clk_50_tb <= '0';
		upper_bound_tb <= x"08"; -- counts up to 8
		loop
			wait for clk_period/2;
			clk_50_tb <= '0';
			wait for clk_period/2;
			clk_50_tb <= '1';
		end loop;
END PROCESS;

END ARCHITECTURE;
