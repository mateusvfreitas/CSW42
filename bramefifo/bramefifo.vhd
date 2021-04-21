Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY bramefifo is
	PORT(
		clk_50: in std_logic
	);
END ENTITY;

ARCHITECTURE Behavior of bramefifo is	
	COMPONENT fifo
		PORT
		(
			clock		: IN STD_LOGIC ;
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			rdreq		: IN STD_LOGIC ;
			wrreq		: IN STD_LOGIC ;
			almost_empty		: OUT STD_LOGIC ;
			almost_full		: OUT STD_LOGIC ;
			empty		: OUT STD_LOGIC ;
			full		: OUT STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			usedw		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT input_bram
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC;
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
		
	COMPONENT output_bram
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;


	COMPONENT write_state_machine
		PORT(
			clk_50: IN STD_LOGIC;
			queue_usedw: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
			address_to_read: OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
			wr_fifo_enable: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT read_state_machine
		PORT(
			clk_50: IN STD_LOGIC;
			fifo_empty: IN STD_LOGIC;
			address_to_write: OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
			output_ram_wren: OUT STD_LOGIC;
			rd_fifo_enable: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL queue_rdreq: STD_LOGIC;
	SIGNAL queue_wrreq: STD_LOGIC;
	SIGNAL queue_empty: STD_LOGIC;
	SIGNAL queue_q: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL queue_usedw: STD_LOGIC_VECTOR (8 DOWNTO 0);

	SIGNAL input_ram_address: STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL input_ram_q: STD_LOGIC_VECTOR (7 DOWNTO 0);

	SIGNAL output_ram_address: STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL output_ram_data: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL output_ram_wren: STD_LOGIC;
	SIGNAL output_ram_q: STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

queue: fifo PORT MAP (
	clock	=> clk_50,
	data => input_ram_q,
	rdreq	=> queue_rdreq,
	wrreq	=> queue_wrreq,
	almost_empty => open,
	almost_full => open,
	empty	=> queue_empty,
	full => open,
	q => queue_q,
	usedw	=> queue_usedw
);

input_ram: input_bram PORT MAP (
	address => input_ram_address,
	clock => clk_50,
	data => "00000000",
	wren => '0',
	q => input_ram_q
);

output_ram: output_bram PORT MAP (
	address => output_ram_address,
	clock => clk_50,
	data => queue_q,
	wren => output_ram_wren,
	q => output_ram_q
);

write_sm: write_state_machine PORT MAP (
	clk_50 => clk_50,
	address_to_read => input_ram_address,
	queue_usedw => queue_usedw,
	wr_fifo_enable => queue_wrreq
);


read_sm: read_state_machine PORT MAP (
	clk_50 => clk_50,
	fifo_empty => queue_empty,
	address_to_write => output_ram_address,
	output_ram_wren => output_ram_wren,
	rd_fifo_enable => queue_rdreq
);

PROCESS (clk_50)
	variable count: unsigned (9 DOWNTO 0) := "00" & x"00";
BEGIN
	if rising_edge(clk_50) then

		
	end if;
end PROCESS;

END ARCHITECTURE;


