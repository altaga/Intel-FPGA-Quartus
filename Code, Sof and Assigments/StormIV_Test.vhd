library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity StormIV_Test is
    port (
        LED   :out std_logic_vector (7 downto 0);  -- Output of the counter
        clk    :in  std_logic;                      -- Input clock
		  enable : in std_logic;
		  BEEP : out std_logic
    );
end entity;

architecture Behavioral of StormIV_Test is
	signal count :std_logic_vector (7 downto 0);
	signal clk_counter : natural range 0 to 50000000 := 0;
	signal beeps : std_logic;

begin
	
	process(clk)
	begin
		if (enable = '1') then
			if rising_edge(clk) then 
				clk_counter <= clk_counter + 1; 
				if clk_counter >= 1000000 then 
				  count <= count + 1;
				  clk_counter <= 0;
				end if;
				beeps <='1';
				if count <= 254 then
					beeps <='0';
				end if; 
			end if; 
		end if;
	end process;
	
	LED <= count;
	BEEP <= beeps;
	
end Behavioral;