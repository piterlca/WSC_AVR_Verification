--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:16:42 12/26/2015
-- Design Name:   
-- Module Name:   C:/Users/Piotr/workspace/vlsi/vlsi_mcu/reg_4x8_tb.vhd
-- Project Name:  vlsi_mcu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_4x8
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reg_4x8_tb IS
END reg_4x8_tb;
 
ARCHITECTURE behavior OF reg_4x8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_4x8
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         Addr1 : IN  std_logic_vector(1 downto 0);
         Addr2 : IN  std_logic_vector(1 downto 0);
         Data1 : INOUT  std_logic_vector(7 downto 0);
         Data2 : INOUT  std_logic_vector(7 downto 0);
         Write_Enable : IN  std_logic;
         Chip_Enable_D1 : IN  std_logic;
			Chip_Enable_D2 : IN std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal Addr1 : std_logic_vector(1 downto 0) := (others => '0');
   signal Addr2 : std_logic_vector(1 downto 0) := (others => '0');
   signal Write_Enable : std_logic := '0';
   signal Chip_Enable_D1 : std_logic := '0';
	signal Chip_Enable_D2 : std_logic := '0';

	--BiDirs
   signal Data1 : std_logic_vector(7 downto 0) := (others => 'Z');
   signal Data2 : std_logic_vector(7 downto 0) := (others => 'Z');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_4x8 PORT MAP (
          rst => rst,
          clk => clk,
          Addr1 => Addr1,
          Addr2 => Addr2,
          Data1 => Data1,
          Data2 => Data2,
          Write_Enable => Write_Enable,
          Chip_Enable => Chip_Enable
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		Chip_Enable_D1 <= '1';
		Chip_Enable_D2 <= '1';
		Addr1 <= "00";
		Addr2 <= "10";
		wait for 1.2*clk_period;
		
		rst <= '1';
		Write_Enable <= '1';
		Addr1 <= "00";
		Addr2 <= "10";
		Data1 <= "01010101";
		Data2 <= "11001100";
		wait for 1.5*clk_period;
		
		Write_Enable <= '0';
		Data1 <= (others => 'Z');
		Data2 <= (others => 'Z');
		wait for 1.5*clk_period;
		
		rst <= '0';
		wait for 1.5*clk_period;
		
		rst <= '1';
		Write_Enable <= '1';
		Address_bus <= "10";
		Data_bus <= "11111111";
		wait for 1.5*clk_period;
		
		Write_Enable <= '0';
		Data_bus <= (others => 'Z');
		wait for 1.5*clk_period;
  
		assert FALSE severity FAILURE;
   end process;

END;
