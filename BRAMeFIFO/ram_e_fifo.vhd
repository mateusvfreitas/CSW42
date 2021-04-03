Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY ram_e_fifo is
	PORT(
		clk_50: in std_logic
	);
END ENTITY;

ARCHITECTURE Behavior of ram_e_fifo is
	COMPONENT BRAM IS PORT (
			address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL address: std_lOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL data_in: std_lOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL wren: std_logic;
	SIGNAL data_out: std_lOGIC_VECTOR (7 DOWNTO 0);
	
BEGIN

bram1: BRAM PORT MAP(
		address => address,
		clock => clk_50,
		data => data_in,
		wren => wren,
		q => data_out
	);


PROCESS (clk_50)

BEGIN
	if rising_edge(clk_50) then
		
	end if;
	 
end PROCESS;

END ARCHITECTURE;


