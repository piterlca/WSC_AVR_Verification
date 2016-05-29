-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity io_port is
	generic(Base_address : std_logic_vector := "0000000000111001");
    Port ( 	rst : in std_logic;
				clk : in std_logic;
				Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
				Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
				Write_enable : in std_logic;
				io_pins : inout  STD_LOGIC_VECTOR (7 downto 0));
end io_port;

architecture iop_a of io_port is
	signal PORTX, PINX, DDRX : std_logic_vector(7 downto 0) := (others => '0');
	
		component pull_up is
    Port (  EN : in  STD_LOGIC;
				Q : out  STD_LOGIC);
		end component pull_up;
			
		component tri_state_buffer is
			Port ( D : in std_logic;
			EN : in  STD_LOGIC;
           Q : out  STD_LOGIC);
		end component tri_state_buffer;
		
begin
		iop: process(clk, rst) is
		begin
			if(clk'event and clk = '1') then
				case Address_bus is
					when (Base_address) =>
						if(Write_Enable = '0') then Data_bus <= PINX;	 end if;
					
					when (Base_address + "0000000000000001") =>
						if(Write_Enable = '1') then DDRX <= Data_bus;
						end if;
						
					when (Base_address + "0000000000000010") =>
						if(Write_Enable = '1') then PORTX <= Data_bus;
						end if;
					when others => Data_bus <= (others => 'Z'); Address_bus <= (others => 'Z');
				end case;
			end if;
		end process iop;	

		
		--PULL_UPS:
			--for I in 7 downto 0 generate
				--PORTX_PULLUP : pull_up port map( EN => PORTX(I), Q => io_pins(I));
			--end generate PULL_UPS;
		
		
		TRI_STATE_BUFFERS:
			for I in 7 downto 0 generate
				PORTX_TSB : tri_state_buffer port map(D => PORTX(I), EN => DDRX(I), Q => io_pins(I));
			end generate TRI_STATE_BUFFERS;
		
		PINX <= io_pins when DDRX = "00000000"; 
end iop_a;

