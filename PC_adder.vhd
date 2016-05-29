----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:43 01/10/2016 
-- Design Name: 
-- Module Name:    PC_adder - PCa_a 
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

entity PC_adder is
    Port ( PC_in : in  STD_LOGIC_VECTOR (15 downto 0);
           relative_in : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_out_to_flash : out  STD_LOGIC_VECTOR (15 downto 0));
end PC_adder;

architecture PCa_a of PC_adder is

begin
	PC_out_to_flash <= PC_in + relative_in;
end PCa_a;

