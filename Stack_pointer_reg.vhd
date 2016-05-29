----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:03:48 01/20/2016 
-- Design Name: 
-- Module Name:    Stack_pointer_reg - SPR_a 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
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

entity Stack_pointer_reg is
	Generic(SP_address : std_logic_vector(15 downto 0));
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Write_Enable : in  STD_LOGIC;
           Data_bus : in  STD_LOGIC_VECTOR (7 downto 0);
			  Address_bus : inout std_logic_vector(15 downto 0);
			  SP_increment : in std_logic;
			  SP_decrement : in std_logic
			  );
end Stack_pointer_reg;

architecture SPR_a of Stack_pointer_reg is
	signal Stack_Pointer: std_logic_vector(15 downto 0) := "0000000001100001";

begin
	SP: process(clk,rst) is
	begin
		--if(rst = '0') then Stack_Pointer <= (others => '0');
		
		if(clk'event and clk = '1') then
			if SP_increment = '1' then 
				Address_bus <= Stack_pointer;	
				Stack_Pointer <= Stack_Pointer + "0000000000000001";
			elsif(SP_decrement = '1') then 
				Stack_Pointer <= Stack_pointer - "0000000000000001";
				Address_bus <= Stack_pointer;
				
			else Address_bus <= (others => 'Z');
			end if;
			
			
		end if;
	end process SP;

end SPR_a;

