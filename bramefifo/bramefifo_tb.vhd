Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY bramefifo_tb is
END ENTITY;

ARCHITECTURE teste of bramefifo_tb IS
	COMPONENT bramefifo
		PORT(
			clk_50: in std_logic
		);
	END COMPONENT bramefifo;

	SIGNAL clk_50_tb: std_logic;
	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: bramefifo port map (
		clk_50 => clk_50_tb
	);

PROCESS
	BEGIN
		loop
			clk_50_tb <= '0';
			wait for clk_period/2;
			clk_50_tb <= '1';
			wait for clk_period/2;
		end loop;
END PROCESS;

END ARCHITECTURE;