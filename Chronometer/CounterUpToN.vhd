Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Counts up to N and sends an high output
-- enable: enables the circuit
-- reset: resets the count
-- clock: board clock
-- upper_bound: the counter counts up to this value
-- output: 1 when it reaches upper_bound, 0 otherwise

ENTITY CounterUpToN IS
	PORT(
		enable: in std_logic;
		reset: in std_logic;
		clock: in std_logic;
		upper_bound: in unsigned(0 downto 7);
	   output: out std_logic
	);
END ENTITY;

ARCHITECTURE counter of CounterUpToN IS
BEGIN
END ARCHITECTURE;
