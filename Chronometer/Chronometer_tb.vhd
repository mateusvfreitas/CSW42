Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY Chronometer_tb is
END ENTITY;

ARCHITECTURE Testbench of Chronometer_tb is
	COMPONENT Chronometer
		PORT(
			input: in unsigned(3 downto 0);
			output: out unsigned(6 downto 0)
		  );
	END COMPONENT;
		
	SIGNAL s_input: unsigned(3 downto 0);
	SIGNAL s_output: unsigned(6 downto 0);

BEGIN
	
	DUT: Chronometer port map (
		input => s_input,
		output => s_output
	);

	sim: PROCESS
	BEGIN
		s_input <= "0000";
		wait for 50 ns;
		s_input <= "0001";
		wait for 50 ns;
		s_input <= "0010";
		wait for 50 ns;
		s_input <= "0011";
		wait for 50 ns;
		s_input <= "0100";
		wait for 50 ns;
		s_input <= "0101";
		wait for 50 ns;
		s_input <= "0110";
		wait for 50 ns;
		s_input <= "0111";
		wait for 50 ns;
		s_input <= "1000";
		wait for 50 ns;
		s_input <= "1001";
		wait for 50 ns;
	END PROCESS sim;
END ARCHITECTURE;


