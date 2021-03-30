Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY SinaisEVariaveis IS
	PORT(
		clk_50: in std_logic;
		input: in unsigned(2 downto 0);
		number_of_ones_for: out unsigned(1 downto 0):= "00";
		number_of_ones_while: out unsigned(1 downto 0):= "00";
		number_of_ones_casewhen: out unsigned(1 downto 0):= "00"
	);
END ENTITY;

ARCHITECTURE counter of SinaisEVariaveis IS
	signal bit0: std_logic := '0';
	signal bit1: std_logic := '0';
	signal bit2: std_logic := '0';
BEGIN
	number_of_ones_casewhen <= "11" WHEN bit0='1' and bit1='1' and bit2='1' ELSE
										"10" WHEN bit0='1' and bit1='1' ELSE
										"10" WHEN bit1='1' and bit2='1' ELSE
										"10" WHEN bit0='1' and bit2='1' ELSE
										"01" WHEN bit0='1' or bit1='1' or bit2='1' ELSE
										"00";
process (clk_50) IS
	variable count_for: unsigned(1 downto 0);
	variable count_while: unsigned(1 downto 0);
	variable I: integer range 0 to 3;
	begin
	if rising_edge(clk_50) then
	
		-- conta numero de 1s usando for
		count_for := "00";
		for I in 0 to 2 loop
			if (input(I) = '1') then
				count_for := count_for + 1;
			end if;
		end loop;
		number_of_ones_for <= count_for;
		
		-- conta numero de 1s usando while
		count_while := "00";
		I := 0;
		while (I <= 2) loop
			if (input(I) = '1') then
				count_while := count_while + 1;
			end if;
			I := I + 1;
		end loop;
		number_of_ones_while <= count_while;
		
		-- conta numero usando case when
		bit0 <= input(0);
		bit1 <= input(1);
		bit2 <= input(2);
		
	end if;
end process;
END ARCHITECTURE;
