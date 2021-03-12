Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY CounterUpToN_tb IS
END ENTITY;

ARCHITECTURE teste of CounterUpToN_tb IS
	COMPONENT CounterUpToN
		PORT(
			input: in unsigned(3 downto 0);
			output: out unsigned(6 downto 0)
		);
	END COMPONENT CounterUpToN;
	
	SIGNAL input_tb: unsigned(3 downto 0);
	SIGNAL output_tb: unsigned(6 downto 0);
	
BEGIN
	DUT: CounterUpToN port map (
		input => input_tb,
		output => output_tb
	);

PROCESS
	BEGIN
		for counter in 0 to 9 loop
			input_tb <= to_unsigned(counter, input_tb'length);
			WAIT for 50 ns;
		end loop;
END PROCESS;	

END ARCHITECTURE;