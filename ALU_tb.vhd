--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:10 12/28/2015
-- Design Name:   
-- Module Name:   C:/Users/Piotr/workspace/vlsi/vlsi_mcu/alu_tb.vhd
-- Project Name:  vlsi_mcu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         operand1 : IN  std_logic_vector(7 downto 0);
         operand2 : IN  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(7 downto 0);
         op_and : IN  std_logic;
         op_or : IN  std_logic;
         op_add : IN  std_logic;
         op_sub : IN  std_logic;
         status_in : IN  std_logic_vector(7 downto 0);
         status_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand1 : std_logic_vector(7 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(7 downto 0) := (others => '0');
   signal op_and : std_logic := '0';
   signal op_or : std_logic := '0';
   signal op_add : std_logic := '0';
   signal op_sub : std_logic := '0';
   signal status_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal status_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          operand1 => operand1,
          operand2 => operand2,
          result => result,
          op_and => op_and,
          op_or => op_or,
          op_add => op_add,
          op_sub => op_sub,
          status_in => status_in,
          status_out => status_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
	operand1 <= "00000001";
	operand2 <= "00000001";
	wait for 1 ns;
	
	op_or <= '1';
	wait for 1 ns;
	
	op_or <= '0';
	op_sub <= '1';
	wait for 1 ns;
	
	assert FALSE severity FAILURE;

   end process;

END;
