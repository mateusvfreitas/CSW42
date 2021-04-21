-- CONTADOR 4 BITS COM CONTAGENS DE BITS 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- ENTITY
entity countBits0 is
	port(
		D	: in std_logic_vector (7 downto 0);	-- Entrada
		Q	: out std_logic_vector (7 downto 0)	-- Saída
	);
end entity;

-- ARCHITECTURE
architecture behav of countBits0 is

   signal Q_tmp: std_logic_vector (7 downto 0);
	
begin

	process (D)
		variable Y: unsigned(7 downto 0);
		variable I: integer range 0 to 8;
	begin
		I := 0;
		Y := "00000000";
		-- Contagem dos bits
		while (I <= 7) loop
			Y := Y +("0000000" & (not D(I)));
			I := I + 1;
		end loop;
		Q_tmp <= std_logic_vector(Y);
	end process;

Q <= Q_tmp;

end architecture;
