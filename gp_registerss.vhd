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

entity gp_registerss is
    Port ( Addr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Addr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Data1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Data2 : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
           Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           Write_Enable : in  STD_LOGIC;
           Not_Enable : in  STD_LOGIC);
end gp_registerss;

architecture gpr_a of gp_registerss is
	type mem is array(0 to 31) of std_logic_vector(7 downto 0);
	signal mem_array : mem;
begin
			Data1 <= mem_array(	to_integer(	unsigned(	Addr1(4 downto 0)	) 	)	);
			Data2 <= mem_array(	to_integer(	unsigned(	Addr2(4 downto 0)	)	)	);

	regs : process(clk, rst) is
	begin
		if(rst = '0') then Address_bus <= (others => 'Z'); Data_bus <= (others => 'Z'); mem_array <= (others => "00000000");
		Data_bus <= (others => 'Z'); Address_bus <= (others => 'Z');
		elsif(clk'event and clk = '1') then
			if(Write_Enable = '1' and Address_bus(15 downto 5) = "00000000000") then
				mem_array(	to_integer(	unsigned(Address_bus(4 downto 0)))	) <= Data_bus;
			elsif(Address_bus(15 downto 5) = ("00000000000")) then
				Data_bus <= mem_array(	to_integer(	unsigned(Address_bus(4 downto 0))) );
			else Data_bus <= (others => 'Z');

			end if;
		end if;
	end process regs;
	
end gpr_a;

