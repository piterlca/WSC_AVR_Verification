-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_8bit_CE is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Enable : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0)
			);
end reg_8bit_CE;

architecture reg_8bit_CE_a of reg_8bit_CE is

begin
	rejestr: process(clk,rst) is
	begin
		if(rst = '0') then Q <= (others => 'Z');
		elsif(clk'event and clk = '1') then

			if(Enable = '1') then 	Q <= D;
			else 							Q <= (others => 'Z');
					
			end if;
		end if;
	end process rejestr;

end reg_8bit_CE_a;

