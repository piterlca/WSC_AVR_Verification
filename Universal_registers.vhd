----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:13 12/25/2015 
-- Design Name: 
-- Module Name:    Universal_registers - Universal_reg_a 
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
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Universal_registers is
    Port ( 
			  rst : in STD_LOGIC;
			  clk : in STD_LOGIC;
			  Write_Enable : in STD_LOGIC;
			  Add1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Add2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
           Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
           Data1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Data2 : out  STD_LOGIC_VECTOR (7 downto 0));
end Universal_registers;

architecture Universal_reg_a of Universal_registers is
	component reg_4x8 is
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
	end component reg_4x8;
	 
	 COMPONENT dec_1_to_8 is
    Port ( coded_in : in  STD_LOGIC_VECTOR (2 downto 0);
           decoded_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  Not_Enable	: in STD_LOGIC);
	end COMPONENT dec_1_to_8;
	 
	signal CE_decoded_D1 : std_logic_vector(7 downto 0);
	signal CE_decoded_D2 : std_logic_vector(7 downto 0);
	signal CE_decoded_syn: std_logic_vector(7 downto 0);

begin

	

	dec_D1 : dec_1_to_8 port map (coded_in => Add1(4 downto 2), decoded_out => CE_decoded_D1, Not_Enable => '0');
	dec_D2 : dec_1_to_8 port map (coded_in => Add1(4 downto 2), decoded_out => CE_decoded_D2, Not_Enable => '0');
	dec_syn: dec_1_to_8 port map (coded_in => Address_bus(4 downto 2), deco
	
	reg_0_3 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(0), Chip_Enable_D2 => CE_decoded_D2(0));
	reg_4_7 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(1), Chip_Enable_D2 => CE_decoded_D2(1));
	reg_8_11 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(2), Chip_Enable_D2 => CE_decoded_D2(2));
	reg_12_15 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(3), Chip_Enable_D2 => CE_decoded_D2(3));
	reg_16_19 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(4), Chip_Enable_D2 => CE_decoded_D2(4));
	reg_20_23 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(5), Chip_Enable_D2 => CE_decoded_D2(5));
	reg_24_27 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(6), Chip_Enable_D2 => CE_decoded_D2(6));
	reg_28_31 : reg_4x8 port map(rst => rst, clk => clk, Addr1 => Add1(1 downto 0), Addr2 => Add2(1 downto 0), Data1 => Data1, Data2 => Data2, Address_bus => Address_bus, Data_bus => Data_bus, Write_Enable => Write_Enable, Chip_Enable_D1 => CE_decoded_D1(7), Chip_Enable_D2 => CE_decoded_D2(7));

end Universal_reg_a;

