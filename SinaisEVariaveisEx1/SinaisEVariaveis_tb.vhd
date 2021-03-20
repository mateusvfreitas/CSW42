Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY SinaisEVariaveis_tb IS
END ENTITY;

ARCHITECTURE teste of SinaisEVariaveis_tb IS
	COMPONENT SinaisEVariaveis
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			output_signal: out unsigned(2 downto 0);
			output_variable: out unsigned(2 downto 0)
		);
	END COMPONENT SinaisEVariaveis;

	SIGNAL clk_50_tb: std_logic;
	SIGNAL enable_tb: std_logic;
	SIGNAL reset_tb: std_logic;
	SIGNAL output_signal_tb: unsigned(2 downto 0);
	SIGNAL output_variable_tb: unsigned(2 downto 0);

	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: SinaisEVariaveis port map (
		clk_50 => clk_50_tb,
		enable => enable_tb,
		reset => reset_tb,
		output_signal => output_signal_tb,
		output_variable => output_variable_tb
	);

PROCESS
	BEGIN
		enable_tb <= '1';
		loop
			clk_50_tb <= '0';
			wait for clk_period/2;
			clk_50_tb <= '1';
			wait for clk_period/2;
		end loop;
END PROCESS;

END ARCHITECTURE;
