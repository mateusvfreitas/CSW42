library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador0 is
    Port ( INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           CONT0S : out  STD_LOGIC_VECTOR (3 downto 0));
end contador0;

architecture cont0 of contador0 is

begin

process(INPUT)
variable count : unsigned(3 downto 0) := "0000";
begin
    count := "0000";   -- inicializa variável count
    for i in 0 to 7 loop
        if(INPUT(i) = '0') then -- se o bit for 0...
            count := count + 1; -- incrementa a contagem
        end if;
    end loop;
    CONT0S <= std_logic_vector(count);    -- output recebe contagem
end process;

end cont0;