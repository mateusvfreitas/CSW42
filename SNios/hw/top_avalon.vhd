LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY top_avalon IS
PORT ( clock, resetn : IN STD_LOGIC;
	   chipselect : IN  STD_LOGIC;
	   writedata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      write_en      : IN  STD_LOGIC;
      readdata   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
   	add        : IN STD_LOGIC;
      read_en       : IN STD_LOGIC );
END top_avalon;

ARCHITECTURE Structure OF top_avalon IS

COMPONENT reg32
PORT ( 		clock, resetn : IN STD_LOGIC;
				WE : IN STD_LOGIC;
				D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

signal write_enable0, write_enable1 : std_logic;
signal read_enable0, read_enable1 : std_logic;
signal reg32_read0_out, reg32_read1_out : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

write_enable0 <= write_en and chipselect  and (not add);
write_enable1 <= write_en and chipselect  and      add ;


	reg32_read0 : reg32
	port map (
		clock 	=> clock,
		resetn 	=> resetn,
		WE      => write_enable0,
		D 		=> writedata,
		Q 		=> reg32_read0_out
	);

	reg32_read1 : reg32
	port map (
		clock 	=> clock,
		resetn 	=> resetn,
		WE      => write_enable1,
		D 		=> writedata,
		Q 		=> reg32_read1_out
	);

read_enable0    <= read_en and chipselect and (not add);
read_enable1    <= read_en and chipselect and      add;
readdata <= reg32_read0_out when read_enable0    = '1' else 
            reg32_read1_out when read_enable1    = '1' else
		                                   (others => 'Z');


-- process(clock)
	-- begin
	
	-- if rising_edge(clock) then
		-- if write_enable0 = '1' then
			-- writedata_internal <= writedata;
		-- --elsif read_enable = '1' then
	   -- --readdata <= SAIDA;
						
		-- end if;
	
	-- end if;
		
	-- end process;

END Structure;
