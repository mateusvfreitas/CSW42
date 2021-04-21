Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY read_state_machine is
	PORT(
		clk_50: IN STD_LOGIC;
		fifo_empty: IN STD_LOGIC;
		address_to_write: OUT STD_LOGIC_VECTOR (9 DOWNTO 0) := "0000000000";
		output_ram_wren: OUT STD_LOGIC;
		rd_fifo_enable: OUT STD_LOGIC := '0'
	);
END ENTITY;

ARCHITECTURE Behavior of read_state_machine is	
	TYPE STATE_TYPE IS (reset, rd_fifo, rd_wait);
	SIGNAL state: STATE_TYPE := reset;
	SIGNAL fifo_read_delay: unsigned (3 DOWNTO 0) := "0000";
	SIGNAL address: unsigned (9 downto 0) := "0000000000";
BEGIN

address_to_write <= std_logic_vector(address);
						
PROCESS (clk_50)
BEGIN
	if rising_edge(clk_50) then
		CASE state IS
			when reset =>
				state <= rd_wait;
				rd_fifo_enable <= '0';
				output_ram_wren <= '0';
				address <= "0000000000";
			when rd_fifo =>
				output_ram_wren <= '0';
				IF fifo_empty='1' THEN
					state <= rd_wait;
				ELSE
					IF fifo_read_delay="0000" THEN
						fifo_read_delay <= "1111";
						rd_fifo_enable <= '1';
					ELSE
						IF fifo_read_delay="1111" THEN -- dois clock depois de ler o valor, salva na ram
							output_ram_wren <= '1';
							address <= address + 1;
						END IF;
						rd_fifo_enable <= '0';
						fifo_read_delay <= fifo_read_delay - 1;
					END IF;
				END IF;
			when rd_wait =>
				IF fifo_empty='0' THEN
					state <= rd_fifo;
					fifo_read_delay <= "0000";
				ELSE
					state <= rd_wait;
				END IF;
		END CASE;
	end if;
end PROCESS;

END ARCHITECTURE;


