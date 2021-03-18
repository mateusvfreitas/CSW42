Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Counts to 10ms and sends an high output
-- clk_50: board clock
-- enable: enables the circuit
-- reset: resets the count
-- output: 1 every 10ms, 0 otherwise

ENTITY Counter10ms IS
	PORT(
		clk_50: in std_logic;
		enable: in std_logic;
		reset: in std_logic;
	   output: out std_logic := '0'
	);
END ENTITY;

ARCHITECTURE counter of Counter10ms IS
BEGIN
process (clk_50) IS
	VARIABLE clock_counter: INTEGER RANGE 0 TO 500000; -- 1/100 of board frequency
	begin
	if reset='1' then
		clock_counter := 0;
	elsif rising_edge(clk_50) and enable='1' then
		if (clock_counter = (500000-1)) then
			output <= '1';
			clock_counter := 0;
		else
			output <= '0';
			clock_counter := clock_counter + 1;
		end if;
	end if;
end process;
END ARCHITECTURE;
