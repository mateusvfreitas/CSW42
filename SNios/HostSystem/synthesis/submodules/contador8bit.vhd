library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity contador8bit is
    Port ( CLK : in  STD_LOGIC;
		   OUTPUT : out  STD_LOGIC_VECTOR (31 downto 0);
		   cmd: in STD_LOGIC_VECTOR (31 downto 0)
		  );
			  
end contador8bit;
 
 
architecture contador of contador8bit is

signal RESULT0,RESULT1: STD_LOGIC_VECTOR(3 downto 0);
signal LD: STD_LOGIC;
signal EN: STD_LOGIC;
signal LOAD: STD_LOGIC_VECTOR(7 downto 0);

component contador0 is
port (
INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
CONT0S : out  STD_LOGIC_VECTOR (3 downto 0)
	  );

end component;

component contador1 is
port (
INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
CONT1S : out  STD_LOGIC_VECTOR (3 downto 0)
);
end component;
 
begin

EN <= cmd(6);
LD <= cmd(7);


cont0: contador0
port map (
INPUT => LOAD,
CONT0s => RESULT0
);

cont1: contador1
port map (
INPUT => LOAD,
CONT1s => RESULT1
);

 
count_process: process(CLK)
 begin
  if rising_edge(CLK) then
		if EN = '1' then
			 if LD = '1' then
				LOAD <= cmd (15 downto 8);
			end if;
		end if;
  end if;
  
    	
 end process;
 
 OUTPUT(31 downto 8) <= "000000000000000000000000";
 OUTPUT(7 downto 4) <= RESULT1;
 OUTPUT(3 downto 0) <= RESULT0;
 
 
end architecture;