-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( operand1 : in  STD_LOGIC_VECTOR (7 downto 0);
           operand2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  result : out std_logic_vector(7 downto 0);
           op_and, op_or, op_add, op_sub, op_eor, op_mov: in std_logic;
			  zero, carry : out std_logic
);
end ALU;

architecture ALU_a of ALU is
	signal op1, op2, res : std_logic_vector(8 downto 0);
begin
		op1 <= operand1(7) & operand1;
		op2 <= operand2(7) & operand2;
				
		res <= op1 + op2 when op_add = '1' else
					 op1 - op2 when op_sub = '1' else
					 op1 and op2 when op_and = '1' else
					 op1 xor op2 when op_eor = '1' else
					 op2				when op_mov = '1' else
					 op1 or op2 when op_or = '1' else
					 op1;

		carry <= res(8);
		zero <= '1' when res = "000000000" else '0';

		result <= res(7 downto 0);
end architecture ALU_a;

