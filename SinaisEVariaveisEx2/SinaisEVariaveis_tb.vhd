Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY SinaisEVariaveis_tb IS
END ENTITY;

ARCHITECTURE teste of SinaisEVariaveis_tb IS
	COMPONENT SinaisEVariaveis
		PORT(
			clk_50: in std_logic;
			input: in unsigned(2 downto 0);
			number_of_ones_for: out unsigned(1 downto 0);
			number_of_ones_while: out unsigned(1 downto 0);
			number_of_ones_casewhen: out unsigned(1 downto 0)
		);
	END COMPONENT SinaisEVariaveis;

	SIGNAL clk_50_tb: std_logic;
	SIGNAL input_tb: unsigned(2 downto 0):= "000";
	SIGNAL number_of_ones_for_tb: unsigned(1 downto 0);
	SIGNAL number_of_ones_while_tb: unsigned(1 downto 0);
	SIGNAL number_of_ones_casewhen_tb: unsigned(1 downto 0);

	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: SinaisEVariaveis port map (
		clk_50 => clk_50_tb,
		input => input_tb,
		number_of_ones_for => number_of_ones_for_tb,
		number_of_ones_while => number_of_ones_while_tb,
		number_of_ones_casewhen => number_of_ones_casewhen_tb
	);

PROCESS
	BEGIN
		loop
			clk_50_tb <= '0';
			wait for clk_period/2;
			clk_50_tb <= '1';
			wait for clk_period/2;
			input_tb <= input_tb + 1;
		end loop;
END PROCESS;

END ARCHITECTURE;
