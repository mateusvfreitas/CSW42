LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY top_avalon IS
	PORT (
		clock : IN STD_LOGIC;
		resetn : IN STD_LOGIC;
		chipselect : IN STD_LOGIC;
		writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		write_en : IN STD_LOGIC;
		readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		add : IN STD_LOGIC;
		read_en : IN STD_LOGIC);
END top_avalon;

ARCHITECTURE Structure OF top_avalon IS

	COMPONENT reg32
		PORT (
			clock : IN STD_LOGIC;
			resetn : IN STD_LOGIC;
			WE : IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT bram
		PORT (
			address : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock : IN STD_LOGIC := '1';
			data : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			wren : IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL write_enable : STD_LOGIC;
	SIGNAL read_enable : STD_LOGIC;
	SIGNAL reg32_write_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg32_read_in : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg32_read_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL operation : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL address_counter : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL last_address_written : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL ram_address : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL ram_data : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"0000";
	SIGNAL ram_wren : STD_LOGIC := '0';
	SIGNAL ram_q : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN

	reg32_write : reg32
	PORT MAP(
		clock => clock,
		resetn => resetn,
		WE => write_enable,
		D => writedata,
		Q => reg32_write_out
	);

	reg32_read : reg32
	PORT MAP(
		clock => clock,
		resetn => resetn,
		WE => '1',
		D => reg32_read_in,
		Q => reg32_read_out
	);

	ram : bram
	PORT MAP(
		address => ram_address,
		clock => clock,
		data => ram_data,
		wren => ram_wren,
		q => ram_q
	);

	operation <= reg32_write_out(31 DOWNTO 30);
	write_enable <= write_en AND chipselect AND (NOT add);
	read_enable <= read_en AND chipselect AND (NOT add);
	readdata <= reg32_read_out WHEN read_enable = '1' ELSE
		(OTHERS => 'Z');

	-- LUT DE 8BITS POSICOES
	-- PALAVRAS DE 16BITS

	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF operation = "00" THEN
				ram_wren <= '0';
				ram_address <= address_counter;
				address_counter <= STD_LOGIC_VECTOR((unsigned(address_counter) + 1) mod unsigned(last_address_written));
				reg32_read_in <= x"0000" & ram_q;
			ELSIF operation = "01" THEN
			ELSIF operation = "10" THEN
				ram_address <= reg32_write_out(23 downto 16);
				last_address_written <= reg32_write_out(23 downto 16);
				ram_data <= reg32_write_out(15 downto 0);
				ram_wren <= '1';
				-- reg32_read_in <= x"00000000";
				--			ELSIF operation = "11" THEN
				--				reg32_read_in <= x"00004444";
			END IF;
		END IF;
	END PROCESS;

END Structure;