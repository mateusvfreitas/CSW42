Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY BCD_7seg_tb IS
END ENTITY;

ARCHITECTURE teste of BCD_7seg_tb IS
	COMPONENT BCD_7seg
		PORT(
			input: in unsigned(3 downto 0);
			output: out unsigned(6 downto 0)
		);
	END COMPONENT BCD_7seg;
	
	SIGNAL input_tb: unsigned(3 downto 0);
	SIGNAL output_tb: unsigned(6 downto 0);
	
BEGIN
	DUT: BCD_7seg port map (
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