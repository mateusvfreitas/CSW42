Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Counts up to N and sends an high output
-- clk_50: board clock
-- enable: enables the circuit
-- reset: resets the count

ENTITY SinaisEVariaveis IS
	PORT(
		clk_50: in std_logic;
		enable: in std_logic := '0';
		reset: in std_logic := '0';
		output_signal: out unsigned(2 downto 0);
		output_variable: out unsigned(2 downto 0)
	);
END ENTITY;

ARCHITECTURE counter of SinaisEVariaveis IS
	signal counter_signal: unsigned(2 downto 0) := "000";
BEGIN
output_signal <= counter_signal;
process (clk_50, enable, reset) IS
	variable counter_variable: unsigned(2 downto 0) := "000";
	begin
	if reset='1' then
		counter_signal <= "000";
		counter_variable := "000";
	elsif rising_edge(clk_50) and enable = '1' then
		counter_signal <= counter_signal + 1;
		counter_variable := counter_variable + 1;
	end if;
	output_variable <= counter_variable;
end process;
END ARCHITECTURE;
