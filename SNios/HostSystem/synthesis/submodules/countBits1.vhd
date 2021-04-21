-- CONTADOR 4 BITS COM CONTAGENS DE BITS 1

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- ENTITY
entity countBits1 is
	port(
		D		: in std_logic_vector (7 downto 0);	-- Entrada
		Q 		: out std_logic_vector (7 downto 0) 	-- Saida
	);
end entity;

-- ARCHITECTURE
architecture behav of countBits1 is

   signal Q_tmp: std_logic_vector (7 downto 0);

begin

	process (D)
		variable Y: unsigned(7 downto 0);
		variable I: integer range 0 to 8;
	begin
		Y := "00000000";
		-- Contagem dos bits
		for I in 0 to 7 loop
			Y := Y + ("0000000" & D(I));
		end loop;
		Q_tmp <= std_logic_vector(Y);
	end process;

Q <= Q_tmp;

end architecture;
