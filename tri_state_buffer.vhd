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

entity tri_state_buffer is
    Port ( D : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end tri_state_buffer;

architecture tsb_a of tri_state_buffer is

begin
	Q <= D when EN = '1' else 'Z';

end tsb_a;

