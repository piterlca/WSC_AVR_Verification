-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity branch_decoder is
    Port ( relative_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           SREG : in  STD_LOGIC_VECTOR (7 downto 0);
           branch_code : in  STD_LOGIC_VECTOR (4 downto 0);
           write_PC : in  STD_LOGIC;
           PC_to_adder : out  STD_LOGIC_VECTOR (15 downto 0) 
			  );
end branch_decoder;

architecture bd_a7 of branch_decoder is	
	signal execute_jmp : std_logic_vector(1 downto 0);

begin
	with execute_jmp select
		PC_to_adder <= relative_PC when "11",
					  (others => '0') when others;
							
	execute_jmp(1) <= write_PC;
	
	with branch_code select
		execute_jmp(0) <= SREG(1) 		when "00001", -- BREQ
								not SREG(1)	when "01001", -- BRNE
								'1'			when others;  -- RJMP
								
end bd_a7;

