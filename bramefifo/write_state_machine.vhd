Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY write_state_machine is
	PORT(
		clk_50: IN STD_LOGIC;
		queue_usedw: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		address_to_read: OUT STD_LOGIC_VECTOR (9 DOWNTO 0) := "0000000000";
		wr_fifo_enable: OUT STD_LOGIC := '0'
	);
END ENTITY;

ARCHITECTURE Behavior of write_state_machine is	
	TYPE STATE_TYPE IS (reset, wr_fifo, wr_wait, finished);
	SIGNAL state: STATE_TYPE := reset;
	SIGNAL ram_read_delay: unsigned (1 DOWNTO 0) := "10";
	SIGNAL address: unsigned (9 downto 0) := "0000000000";
BEGIN

address_to_read <= std_logic_vector(address);

PROCESS (clk_50)
BEGIN
	if rising_edge(clk_50) then
		CASE state IS
			when reset =>
				state <= wr_wait;
				wr_fifo_enable <= '0';
				address <= "0000000000";
			when wr_fifo =>
				IF queue_usedw>"110000000" THEN
					state <= wr_wait;
				ELSE
					IF ram_read_delay="00" THEN
						ram_read_delay <= "10";
						address <= address + 1;
						wr_fifo_enable <= '1';
						IF address="1111111111" THEN
							state <= finished;
						END IF;
					ELSE
						wr_fifo_enable <= '0';
						ram_read_delay <= ram_read_delay - 1;
					END IF;
				END IF;
			when wr_wait =>
				wr_fifo_enable <= '0';
				IF queue_usedw<"100000000" THEN
					state <= wr_fifo;
					ram_read_delay <= "10";
				ELSE
					state <= wr_wait;
				END IF;
			when finished =>
				IF ram_read_delay < "10" THEN
					wr_fifo_enable <= '1';
					ram_read_delay <= ram_read_delay + 1;
				ELSE
					state <= finished;
					wr_fifo_enable <= '0';
					address <= "0000000000";
				END IF;
		END CASE;
	end if;
end PROCESS;

END ARCHITECTURE;


