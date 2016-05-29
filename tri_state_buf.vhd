----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:10 12/25/2015 
-- Design Name: 
-- Module Name:    tri_state_buf - tri_state_buf_a 
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

entity tri_state_buf is
	port(	
			x : in std_logic_vector(7 downto 0); 
			Enable : in std_logic;
			y : out std_logic_vector(7 downto 0)
		);
end entity tri_state_buf;

architecture tri_state_buf_a of tri_state_buf is

begin
	y <= x when Enable = '1' else (others => 'Z');
end tri_state_buf_a;

