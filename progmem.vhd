-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity progmem is
    Port ( 	rst : in  STD_LOGIC;
				clk : in  STD_LOGIC;
				PC : in  STD_LOGIC_VECTOR (15 downto 0);
				Instruction : inout  STD_LOGIC_VECTOR (15 downto 0);
				progmem_write : in  STD_LOGIC);
end progmem;

architecture progmem_a of progmem is
	type mem is array(0 to 255) of std_logic_vector(15 downto 0) ;
	signal mem_array : mem := (others => (others => '1'));
	
begin
	flash : process(clk, rst) is
	begin
		if(rst = '0') then instruction <= (others => 'Z'); end if;
		
		if(clk'event and clk = '1') then
			if(progmem_write = '0' ) then
				Instruction <= mem_array(	to_integer( unsigned(PC) ) );
			else
				Instruction <= (others => 'Z');
				mem_array(	to_integer(	unsigned(PC))	) <= Instruction ;
			end if;
			
		end if;
	end process flash;
end progmem_a;

