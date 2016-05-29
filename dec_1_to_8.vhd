----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:14 12/26/2015 
-- Design Name: 
-- Module Name:    dec_1_to_8 - dec_a 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dec_1_to_8 is
    Port ( coded_in : in  STD_LOGIC_VECTOR (2 downto 0);
           decoded_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  Not_Enable	: in STD_LOGIC);
end dec_1_to_8;

architecture dec_a of dec_1_to_8 is
begin
		with coded_in select
			decoded_out <= "00000001" when "000",
								"00000010" when "001",
								"00000100" when "010",
								"00001000" when "011",
								"00010000" when "100",
								"00100000" when "101",
								"01000000" when "110",
								"10000000" when others;
end dec_a;

