Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY Chronometer_tb is
END ENTITY;

ARCHITECTURE teste of Chronometer_tb IS
	COMPONENT Chronometer
		PORT(clk_50: in std_logic);
	END COMPONENT Chronometer;

	SIGNAL clk_50_tb: std_logic;
	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: Chronometer port map (
		clk_50 => clk_50_tb
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