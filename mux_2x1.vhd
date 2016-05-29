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

entity mux_2x8 is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           Sel : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
end mux_2x8;

architecture mux_a of mux_2x8 is

begin
	Q <= A when Sel = '0' else B;
end mux_a;

