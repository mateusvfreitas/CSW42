LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
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

	SIGNAL write_enable : STD_LOGIC;
	SIGNAL read_enable : STD_LOGIC;
	SIGNAL reg32_write_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg32_read_in : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg32_read_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL operation : STD_LOGIC_VECTOR(1 DOWNTO 0);

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

	operation <= reg32_write_out(31 DOWNTO 30);
	write_enable <= write_en AND chipselect AND (NOT add);
	read_enable <= read_en AND chipselect AND (NOT add);
	readdata <= reg32_read_out WHEN read_enable = '1' ELSE
		(OTHERS => 'Z');

	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF operation = "00" THEN
				reg32_read_in <= x"00001111";
			ELSIF operation = "01" THEN
				reg32_read_in <= x"00002222";
			ELSIF operation = "10" THEN
				reg32_read_in <= x"00000000";
			ELSIF operation = "11" THEN
				reg32_read_in <= x"00004444";
			END IF;
		END IF;
	END PROCESS;

END Structure;