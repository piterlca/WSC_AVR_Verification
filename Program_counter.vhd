-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_counter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  PC_relative : in  STD_LOGIC_VECTOR (15 downto 0);
           increment : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  cancel_decoding : out std_logic
			  );
end Program_counter;

architecture PC_a of Program_counter is
	signal PC : std_logic_vector(15 downto 0);
begin	
	counter: process(clk, rst) is
	begin
		if(rst = '0') then PC <= (others => '0');
		elsif(clk'event and clk = '1') then
			if (increment = '1' ) then 					PC <= PC + "0000000000000001"	+ PC_relative ; end if;
			if(PC_relative /= "000000000000000") then cancel_decoding <= '1';
				else cancel_decoding <= '0';
			end if;
		end if;
	end process counter;
	
	PC_out <= PC + PC_relative;
	
end PC_a;

