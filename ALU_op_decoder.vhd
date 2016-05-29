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

entity ALU_op_decoder is
    Port (  coded_in : in  STD_LOGIC_VECTOR (4 downto 0);
           op_add : out  STD_LOGIC;
           op_sub : out  STD_LOGIC;
           op_and : out  STD_LOGIC;
           op_or : out  STD_LOGIC;
			  op_eor : out STD_Logic;
			  op_mov : out std_logic
			  );
end ALU_op_decoder;

architecture ALU_o_d_a of ALU_op_decoder is
begin
	
	op_and <= '1' when(coded_in(4 downto 0) = "01000" or coded_in(4 downto 2) = "111") else '0';
	op_eor <= '1' when coded_in(4 downto 0) = "01001" else '0';
	op_mov <= '1' when coded_in(4 downto 0) = "01011" else '0';
	op_or  <= '1' when(coded_in(4 downto 0) = "01010" or coded_in(4 downto 2) = "110")  	else '0';
	op_add <= '1' when coded_in(4 downto 0) = "00011" 	else '0' ;
	op_sub <= '1' when(coded_in(4 downto 0) = "00110" or coded_in(4 downto 2) = "101")	else '0' ;
end ALU_o_d_a;

