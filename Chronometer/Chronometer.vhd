Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


ENTITY Chronometer is
	PORT(
		clk_50: in std_logic;
		bcd_digit4_output: out unsigned(6 downto 0);
		bcd_digit3_output: out unsigned(6 downto 0);
		bcd_digit2_output: out unsigned(6 downto 0);
		bcd_digit1_output: out unsigned(6 downto 0);
		button_start_stop: in std_logic; -- 0 means pressed
		button_reset: in std_logic; -- 0 means pressed
		override_buttons_and_count: in std_logic := '0' -- this is used for tests
	);
	
END ENTITY;

ARCHITECTURE Behavior of Chronometer is
	COMPONENT Counter10ms
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			output: out std_logic := '0'
		);
	END COMPONENT;
	
	COMPONENT CounterUpToN
		PORT(
			clk_50: in std_logic;
			enable: in std_logic;
			reset: in std_logic;
			upper_bound: in unsigned(7 downto 0);
			carry: out std_logic := '0';
			count: out unsigned(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT BCD_7seg
		PORT(
			input: in unsigned(3 downto 0);
			output: out unsigned(6 downto 0)
		);
	END COMPONENT;
	
	SIGNAL output10ms: std_logic;
	SIGNAL carry_digit4: std_logic;
	SIGNAL carry_digit3: std_logic;
	SIGNAL carry_digit2: std_logic;
	SIGNAL carry_digit1: std_logic;
	SIGNAL count_digit4: unsigned(7 downto 0);
	SIGNAL count_digit3: unsigned(7 downto 0);
	SIGNAL count_digit2: unsigned(7 downto 0);
	SIGNAL count_digit1: unsigned(7 downto 0);
	SIGNAL enable_cont10ms: std_logic;
	SIGNAL enable_digit4: std_logic;
	SIGNAL enable_digit3: std_logic;
	SIGNAL enable_digit2: std_logic;
	SIGNAL enable_digit1: std_logic;
	SIGNAL enable_count_flag: std_logic := '0';
	SIGNAL reset: std_logic := '0';
	SIGNAL debounce_button: std_logic := '0';
	SIGNAL debounce_counter: integer range 0 to 50000000; 
	
BEGIN

enable_cont10ms <= override_buttons_and_count or enable_count_flag;
enable_digit4 <= output10ms;
enable_digit3 <= enable_digit4 and carry_digit4;
enable_digit2 <= enable_digit3 and carry_digit3;
enable_digit1 <= enable_digit2 and carry_digit2;

cont10ms: Counter10ms PORT MAP(
	clk_50 => clk_50,
	enable => enable_cont10ms,
	reset => reset,
	output => output10ms
);
	
digit4: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => enable_digit4,
	reset => reset,
	upper_bound => x"0A", -- Count from 0 to 9
	carry => carry_digit4,
	count => count_digit4
);

digit3: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => enable_digit3,
	reset => reset,
	upper_bound => x"0A", -- Count from 0 to 9
	carry => carry_digit3,
	count => count_digit3
);

digit2: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => enable_digit2,
	reset => reset,
	upper_bound => x"0A", -- Count from 0 to 9
	carry => carry_digit2,
	count => count_digit2
);

digit1: CounterUpToN PORT MAP(
	clk_50 => clk_50,
	enable => enable_digit1,
	reset => reset,
	upper_bound => x"06", -- Count from 0 to 5
	carry => carry_digit1,
	count => count_digit1
);

bcd_digit4: BCD_7seg PORT MAP(
	input => count_digit4 (3 downto 0),
	output => bcd_digit4_output
);

bcd_digit3: BCD_7seg PORT MAP(
	input => count_digit3 (3 downto 0),
	output => bcd_digit3_output
);

bcd_digit2: BCD_7seg PORT MAP(
	input => count_digit2 (3 downto 0),
	output => bcd_digit2_output
);

bcd_digit1: BCD_7seg PORT MAP(
	input => count_digit1 (3 downto 0),
	output => bcd_digit1_output
);

PROCESS (clk_50)
BEGIN
	if rising_edge(clk_50) then
		if button_start_stop='0' and debounce_button='0' then
			enable_count_flag <= not enable_count_flag;
			debounce_button <= '1';
			debounce_counter <= 0;
		elsif debounce_counter = 25000000 then -- 500ms
			debounce_counter <= 0;
			debounce_button <= '0';
		elsif debounce_button = '1' then
			debounce_counter <= debounce_counter + 1;
		end if;
		
		if button_reset='0' and enable_count_flag='0' then
			reset <= '1';
		else
			reset <= '0';
		end if;
	end if;
	 
end PROCESS;

END ARCHITECTURE;


