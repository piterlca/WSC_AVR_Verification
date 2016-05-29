--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:36:36 12/27/2015
-- Design Name:   
-- Module Name:   C:/Users/Piotr/workspace/vlsi/vlsi_mcu/CPU_tb.vhd
-- Project Name:  vlsi_mcu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
 
ENTITY CPU_tb IS
END CPU_tb;
 
ARCHITECTURE behavior OF CPU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	component CPU is
		 Port ( CPU_rst : in  STD_LOGIC;
				  CPU_clk : in  STD_LOGIC;
				  PC_out : out std_logic_vector(15 downto 0);
				  instruction : in  STD_LOGIC_VECTOR(15 downto 0);
				  CPU_Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
				  CPU_Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
				  CPU_Write_Enable : inout std_logic);
	end component CPU;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal Data_bus : std_logic_vector(7 downto 0);
   signal Address_bus : std_logic_vector(15 downto 0);

 	--Outputs
   signal Write_Enable : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	type instr is array(0 to 5) of std_logic_vector(15 downto 0);
	shared variable instr_array : instr;
	
	shared variable request_read : boolean := FALSE;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          CPU_rst => rst,
          CPU_clk => clk,
          instruction => instruction,
          CPU_Data_bus => Data_bus,
          CPU_Address_bus => Address_bus,
          CPU_Write_Enable => Write_Enable
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
		wait for 1.2*clk_period;
		
		rst <= '1';
		instruction <= "1110101000001010"; --LDI R16, 0b10101010
		wait for 2*clk_period;
		
		
		instruction <= "1110000000010111"; --LDI R17, 0b00000111
		wait for 2*clk_period;
		
		instruction <= "1110000000110111"; --LDI R19, 0b00000111
		wait for 2*clk_period;
		
		instruction <= "0000111100000001";	--ADD R16, R17
		wait for 2*clk_period;
		
		instruction <= "1110000000010110"; --LDI R17, 0b00000110
		wait for 2*clk_period;
		
		instruction <= "0111110000011100";	--ANDI R17, 0b11001100
		wait for 2*clk_period;
		
		instruction <= (others => '1');
		wait for 6*clk_period;
		



		assert FALSE severity FAILURE;
   end process;


END;
