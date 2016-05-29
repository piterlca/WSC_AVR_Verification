----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:59 12/27/2015 
-- Design Name: 
-- Module Name:    gp_registerss - gpr_a 
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
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity volatile_memory is
	Generic(MEM_BASEADDR : std_logic_vector(15 downto 0) := "000000000000000";
				MEM_SIZE : integer range 0 to 255); 
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
           Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           Write_Enable : in  STD_LOGIC);
end volatile_memory;
--0060 base offset
architecture volatile_memory_a of volatile_memory is
	type mem is array(0 to MEM_SIZE-1) of std_logic_vector(7 downto 0);
	signal mem_array : mem;
begin
	ram : process(clk, rst) is
	begin
		if(rst = '0') then Address_bus <= (others => 'Z'); Data_bus <= (others => 'Z'); mem_array <= (others => "00000000");
		
		elsif(clk'event and clk = '1') then
			if(Write_Enable = '1' and Address_bus >= MEM_BASEADDR and Address_bus < MEM_BASEADDR + MEM_SIZE) then
				mem_array(	to_integer(	unsigned(Address_bus - MEM_BASEADDR))	) <= Data_bus;
			elsif(Address_bus >= MEM_BASEADDR and Address_bus < MEM_BASEADDR + MEM_SIZE) then
				Data_bus <= mem_array(	to_integer(	unsigned(Address_bus - MEM_BASEADDR)) );
			else Data_bus <= (others => 'Z');

			end if;
		end if;
	end process ram;
	
end volatile_memory_a;

