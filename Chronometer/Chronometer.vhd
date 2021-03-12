Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY Chronometer is
	PORT(
		input: in unsigned(3 downto 0);
		output: out unsigned(6 downto 0)
	  );
END ENTITY;

ARCHITECTURE Behavior of Chronometer is
BEGIN
	output <= "1111110" WHEN input = "0000" ELSE
				 "0110000" WHEN input = "0001" ELSE
				 "1101101" WHEN input = "0010" ELSE
				 "1111001" WHEN input = "0011" ELSE
				 "0110011" WHEN input = "0100" ELSE
				 "1011011" WHEN input = "0101" ELSE
				 "1011111" WHEN input = "0110" ELSE
				 "1110000" WHEN input = "0111" ELSE
				 "1111111" WHEN input = "1000" ELSE
				 "1111011" WHEN input = "1001" ELSE
				 "0000000";
END ARCHITECTURE;


