----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:23 12/26/2015 
-- Design Name: 
-- Module Name:    reg_4x8 - reg_4x8_a 
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

entity reg_4x8 is
    Port ( 
			  rst : in std_logic;
			  clk : in std_logic;
			  Addr1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Addr2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Data1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Data2 : out  STD_LOGIC_VECTOR (7 downto 0);
			  Address_bus : in STD_LOGIC_VECTOR(1 downto 0);
			  Data_bus : inout STD_LOGIC_VECTOR (7 downto 0);
           Write_Enable : in  STD_LOGIC;
           Chip_Enable_D1 : in  STD_LOGIC;
			  Chip_Enable_D2 : in STD_LOGIC);
end reg_4x8;

architecture reg_4x8_a of reg_4x8 is
	type mem_array is array(3 downto 0) of std_logic_vector(7 downto 0);
	signal mem : mem_array := ("ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ", "ZZZZZZZZ");
	
begin
	reg_data1: process(clk, rst) is
	begin
		if(rst = '0') then 	Data1 <= (others => 'Z');
		Data_bus <= (others => 'Z');
		elsif(clk'event and clk = '1' and Chip_Enable_D1 = '1') then
		
			if(Write_Enable = '0') then

				case Address_bus is
					when "00" 	=> Data_bus <= mem(0);
					when "01" 	=> Data_bus <= mem(1);
					when "10" 	=> Data_bus <= mem(2);
					when others => Data_bus <= mem(3);
				end case;
					
			else
				case Address_bus is
					when "00" 	=> mem(0) <= Data_bus;
					when "01"	=> mem(1) <= Data_bus;
					when "10"	=> mem(2) <= Data_bus;
					when others	=> mem(3) <= Data_bus;
				end case;
			
			end if;
		end if;
	end process reg_data1;			


	with Addr1 select
		Data1 <= mem(0)	when "00",
					mem(1)	when "01",
					mem(2)	when "10",
					mem(3)	when others;
					
	with Addr2 select
		Data2 <= mem(0)	when "00",
					mem(1)	when "01",
					mem(2)	when "10",
					mem(3)	when others;
	

end reg_4x8_a;

