Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY ram_e_fifo_tb is
END ENTITY;

ARCHITECTURE teste of ram_e_fifo_tb IS
	COMPONENT ram_e_fifo
		PORT(
			clk_50: in std_logic
		);
	END COMPONENT ram_e_fifo;

	SIGNAL clk_50_tb: std_logic;
	constant clk_period : time := 20 ns; -- 50 Mhz
	SIGNAL address_tb: std_lOGIC_VECTOR (9 DOWNTO 0) := "0000000011";
	SIGNAL data_in_tb: std_lOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL wren_tb: std_logic := '1';
	SIGNAL data_out_tb: std_lOGIC_VECTOR (7 DOWNTO 0);

BEGIN
	DUT: ram_e_fifo port map (
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