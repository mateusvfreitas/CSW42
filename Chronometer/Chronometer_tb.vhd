Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY Chronometer_tb is
END ENTITY;

ARCHITECTURE teste of Chronometer_tb IS
	COMPONENT Chronometer
		PORT(
			clk_50: in std_logic;
			bcd_digit4_output: out unsigned(6 downto 0);
			bcd_digit3_output: out unsigned(6 downto 0);
			bcd_digit2_output: out unsigned(6 downto 0);
			bcd_digit1_output: out unsigned(6 downto 0)
		);
	END COMPONENT Chronometer;

	SIGNAL clk_50_tb: std_logic;
	SIGNAL bcd_digit4_output_tb: unsigned(6 downto 0);
	SIGNAL bcd_digit3_output_tb: unsigned(6 downto 0);
	SIGNAL bcd_digit2_output_tb: unsigned(6 downto 0);
	SIGNAL bcd_digit1_output_tb: unsigned(6 downto 0);
	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: Chronometer port map (
		clk_50 => clk_50_tb,
		bcd_digit4_output => bcd_digit4_output_tb,
		bcd_digit3_output => bcd_digit3_output_tb,
		bcd_digit2_output => bcd_digit2_output_tb,
		bcd_digit1_output => bcd_digit1_output_tb
	);

PROCESS
	BEGIN
		clk_50_tb <= '0';
		loop
			wait for clk_period/2;
			clk_50_tb <= '0';
			wait for clk_period/2;
			clk_50_tb <= '1';
		end loop;
END PROCESS;

END ARCHITECTURE;