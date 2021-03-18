Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Counts up to N and sends an high output
-- clk_50: board clock
-- enable: enables the circuit
-- reset: resets the count
-- upper_bound: the counter counts up to this value
-- output: 1 when it reaches upper_bound, 0 otherwise

ENTITY CounterUpToN IS
	PORT(
		clk_50: in std_logic;
		enable: in std_logic := '0';
		reset: in std_logic := '0';
		upper_bound: in unsigned(7 downto 0);
	   carry: out std_logic := '0';
		count: out unsigned(7 downto 0)
	);
END ENTITY;

ARCHITECTURE counter of CounterUpToN IS
	signal counter: unsigned(7 downto 0) := x"00";
BEGIN
	count <= counter;
process (clk_50, enable, reset) IS
	begin
	if reset='1' then
		counter <= x"00";
		
	elsif rising_edge(clk_50) and enable = '1' then
		counter <= counter + 1;
		
		if (counter = (upper_bound-2)) then
			carry <= '1';
		elsif (counter = (upper_bound-1)) then
			counter <= x"00";
			carry <= '0';
		end if;

	end if;
end process;
END ARCHITECTURE;
