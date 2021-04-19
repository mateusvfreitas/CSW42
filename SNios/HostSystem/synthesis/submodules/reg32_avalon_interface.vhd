LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY reg32_avalon_interface IS
PORT ( clock, resetn : IN STD_LOGIC;
	   chipselect : IN  STD_LOGIC;
	   writedata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
       write_en      : IN  STD_LOGIC;
       readdata   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
   	   add        : IN STD_LOGIC;
       read_en       : IN STD_LOGIC );
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
			  CLK    : in  STD_LOGIC;
			  OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  cmd    : in STD_LOGIC_VECTOR (31 downto 0)
		);
END COMPONENT;

signal write_enable0, write_enable1 : std_logic;
signal read_enable0, read_enable1, read_enable_cnt, reg_n_cont : std_logic;
signal readdata_internal,writedata_internal, reg32_0, reg32_1, SAIDA : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN


--readdata <= x"12345678" when read_enable = '1' else (others => '0');
--readdata1 <= x"AAAA5555" when read_enable = '1' else (others => '0');
--readdata_internal <= x"12345678" when add2 = '0' else x"AAAA5555"; 

--readdata <= x"12345678" when read_enable = '1' else (others => '0');

write_enable0 <= write_en and chipselect  and (not add);
write_enable1 <= write_en and chipselect  and      add ;


	reg32_def0 : reg32
	port map (
		clock 	=> clock,
		resetn 	=> resetn,
		WE      => write_enable0,
		D 		=> writedata_internal,
		Q 		=> reg32_0   --readdata_internal
);

	reg32_def1 : reg32
	port map (
		clock 	=> clock,
		resetn 	=> resetn,
        WE      => write_enable1,
		D 		=> writedata_internal,
		Q 		=> reg32_1   --readdata_internal
);

	cont8bit_def : contador8bit
	port map (
		CLK 	 => clock,
		OUTPUT => SAIDA,
      cmd    => reg32_0
  );

reg_n_cont     <= reg32_0(0);
read_enable0    <= read_en and chipselect and (not add) and (not reg_n_cont);
read_enable1    <= read_en and chipselect and      add  and (not reg_n_cont);
read_enable_cnt <= read_en and chipselect and                    reg_n_cont ;
readdata <= reg32_0 when read_enable0    = '1' else 
            reg32_1 when read_enable1    = '1' else
				SAIDA   when read_enable_cnt = '1' else 
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
