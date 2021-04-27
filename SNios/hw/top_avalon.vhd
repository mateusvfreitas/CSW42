LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

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
	SIGNAL gen_signal_enable : STD_LOGIC;
	SIGNAL reg32_write_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg32_read_in : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL reg32_read_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL operation, last_operation : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL cycles_to_generate, current_cycle : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL address_counter : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL last_address_written : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL ram_address, ram_write_address : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00";
	SIGNAL ram_data, ram_write_data : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"0000";
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
	ram_write_address <= reg32_write_out(23 DOWNTO 16);
	ram_write_data <= reg32_write_out(15 DOWNTO 0);
	gen_signal_enable <= reg32_write_out(0);
	cycles_to_generate <= reg32_write_out(7 DOWNTO 0);

		write_enable <= write_en AND chipselect AND (NOT add);
	read_enable <= read_en AND chipselect AND (NOT add);
	readdata <= reg32_read_out WHEN read_enable = '1' ELSE
		(OTHERS => 'Z');

	-- LUT DE 8BITS POSICOES
	-- PALAVRAS DE 16BITS

	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			last_operation <= operation;
			reg32_read_in <= x"0000" & ram_q;
			IF operation = "00" THEN
				ram_wren <= '0';
				ram_address <= address_counter;
				-- só incrementa o contador se o bit estiver setado
				IF gen_signal_enable = '1' THEN
					address_counter <= STD_LOGIC_VECTOR((unsigned(address_counter) + 1));
					-- volta o contador a zero ao chegar no ultimo endereço da ram
					IF STD_LOGIC_VECTOR((unsigned(address_counter) + 1)) = last_address_written THEN
						address_counter <= x"00";
						current_cycle <= STD_LOGIC_VECTOR((unsigned(current_cycle) + 1));
					END IF;
				END IF;
				ELSIF operation = "01" THEN
				ram_wren <= '0';
				ram_address <= address_counter;
				-- só incrementa o contador se o bit estiver setado
				IF current_cycle < cycles_to_generate THEN
					address_counter <= STD_LOGIC_VECTOR((unsigned(address_counter) + 1));
					-- volta o contador a zero ao chegar no ultimo endereço da ram
					IF STD_LOGIC_VECTOR((unsigned(address_counter) + 1)) = last_address_written THEN
						address_counter <= x"00";
						current_cycle <= STD_LOGIC_VECTOR((unsigned(current_cycle) + 1));
					END IF;
				END IF;
			ELSIF operation = "10" THEN
				ram_address <= ram_write_address;
				last_address_written <= ram_write_address;
				ram_data <= ram_write_data;
				ram_wren <= '1';
			END IF;
			IF last_operation /= operation THEN
				address_counter <= x"00";
				ram_address <= x"00";
				ram_wren <= '0';
				current_cycle <= x"00";
			END IF;
		END IF;
	END PROCESS;

END Structure;