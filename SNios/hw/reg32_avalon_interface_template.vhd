LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY reg32_avalon_interface IS
PORT ( 	avs_s0_address    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		avs_s0_read       : IN STD_LOGIC;
		avs_s0_readdata   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		avs_s0_write      : IN STD_LOGIC;
		clk               : IN STD_LOGIC;   
		reset             : IN STD_LOGIC;
		 chipselect : IN STD_LOGIC;
		 writedata  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--		 readdata1   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 avs_s0_waitrequest    : out std_logic
        );
END reg32_avalon_interface;

ARCHITECTURE Structure OF reg32_avalon_interface IS

COMPONENT reg32
PORT ( 		clock, resetn : IN STD_LOGIC;
				WE : IN STD_LOGIC;
				D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT contador8bit
PORT ( 
			  CLK : in  STD_LOGIC;
			  OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  cmd: in STD_LOGIC_VECTOR (31 downto 0)
		);
END COMPONENT;

signal write_enable : std_logic;
signal read_enable : std_logic;
signal readdata_internal,writedata_internal,SAIDA : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

write_enable <= write and chipselect;
read_enable <= read and chipselect;

--readdata <= x"12345678" when read_enable = '1' else (others => '0');
--readdata1 <= x"AAAA5555" when read_enable = '1' else (others => '0');
readdata_internal <= x"12345678" when add2 = '0' else x"AAAA5555"; 


	reg32_def : reg32
	port map (
		clock 	=> clock,
		resetn 	=> resetn,
      WE       => write_enable,
		D 			=> writedata_internal,
		Q 			=> open --readdata_internal
);

	cont8bit_def : contador8bit
	port map (
		CLK 	=> clock,
		OUTPUT	=> SAIDA,
      cmd      => readdata_internal
  );


process(clock)
	begin
	
	if rising_edge(clock) then
		if write_enable = '1' then
			writedata_internal <= writedata;
		--elsif read_enable = '1' then
	   --readdata <= SAIDA;
						
		end if;
	
	end if;
		
	end process;

END Structure;
