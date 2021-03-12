Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY Counter10ms_tb IS
END ENTITY;

ARCHITECTURE teste of Counter10ms_tb IS
	COMPONENT Counter10ms
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			output: out std_logic
		);
	END COMPONENT Counter10ms;
	
	SIGNAL clk_50_tb: std_logic;
	SIGNAL enable_tb: std_logic;
	SIGNAL reset_tb: std_logic;
	SIGNAL output_tb: std_logic;
	
	constant clk_period : time := 20 ns; -- 50 Mhz

BEGIN
	DUT: Counter10ms port map (
		clk_50 => clk_50_tb,
		enable => enable_tb,
		reset => reset_tb,
		output => output_tb
	);

PROCESS
	BEGIN
		enable_tb <= '1';
		loop
			wait for clk_period/2;
			clk_50_tb <= '0';
			wait for clk_period/2;
			clk_50_tb <= '1';
		end loop;
END PROCESS;	

END ARCHITECTURE;