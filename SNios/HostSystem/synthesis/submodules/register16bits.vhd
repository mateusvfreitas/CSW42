library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- ENTITY
entity register16bits is
	port(
		rst 		: in std_logic;
		clk 		: in std_logic;
		clr 		: in std_logic;
		en 		: in std_logic;
		D 			: in std_logic_vector (15 downto 0);
		Q 			: out std_logic_vector (15 downto 0)
	);
end entity;

-- ARCHITECTURE
architecture behav of register16bits is

   signal Q_tmp: std_logic_vector (15 downto 0);
	
begin

	process (rst, clk)
	begin
	  if rst = '1' then
		 Q_tmp <= "0000000000000000";
	  elsif (clk'event and clk = '1') then
			if clr = '1' then
		    	Q_tmp <= "0000000000000000";
		 	elsif en = '1' then
			   Q_tmp <= D;
		 end if;
	  end if;
	end process;
	
   Q <= Q_tmp;

end architecture;
