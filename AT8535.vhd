-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016
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

entity AT8535 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           port_A, port_B, port_C, port_D : inout  STD_LOGIC_VECTOR (7 downto 0);
			  progmem_write : in std_logic;
			  instruction_write : in std_logic_vector(15 downto 0)
			  );
end AT8535;

architecture at_A of AT8535 is

	component CPU is
		 Port ( CPU_rst : in  STD_LOGIC;
				  CPU_clk : in  STD_LOGIC;
				  PC_out : out std_logic_vector(15 downto 0);
				  instruction : in  STD_LOGIC_VECTOR(15 downto 0);
				  CPU_Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
				  CPU_Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
				  CPU_Write_Enable : inout std_logic);
	end component CPU;
	
	component progmem is
    Port ( 	rst : in  STD_LOGIC;
				clk : in  STD_LOGIC;
				PC : in  STD_LOGIC_VECTOR (15 downto 0);
				Instruction : inout  STD_LOGIC_VECTOR (15 downto 0);
				progmem_write : in  STD_LOGIC);
	end component progmem;



	component io_port is
	generic(Base_address : std_logic_vector := "0000000000111001");
    Port ( 	rst : in std_logic;
				clk : in std_logic;
				Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
				Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
				Write_enable : in std_logic;
				io_pins : inout  STD_LOGIC_VECTOR (7 downto 0));
	end component io_port;
	
	signal s_instruction, s_PC, s_PC_R , s_PC_W: std_logic_vector(15 downto 0) := (others => '0');
	signal Data_bus : std_logic_vector(7 downto 0);
	signal Address_bus : std_logic_vector(15 downto 0);
	signal Write_Enable : std_logic;
	
	constant PORT_A_MEM_OFFSET : std_logic_vector(15 downto 0) := "0000000000111001";
	constant PORT_B_MEM_OFFSET : std_logic_vector(15 downto 0) := "0000000000110110";
	constant PORT_C_MEM_OFFSET : std_logic_vector(15 downto 0) := "0000000000110011";
	constant PORT_D_MEM_OFFSET : std_logic_vector(15 downto 0) := "0000000000110000";
begin
	
	flash_programming : process(clk, rst) 
	begin
		if(clk'event and clk = '1' ) then
			if(progmem_write = '1') then			
				s_PC_W <= s_PC_W + "0000000000000001";
			else s_PC_W <= (others => '0'); 
			end if;
		end if;
	end process flash_programming;
	
	with progmem_write select
		s_instruction <= instruction_write when '1',
								(others => 'Z') when others;
	
	with progmem_write select
		s_PC <= s_PC_W when '1',
				 s_PC_R when others;
				
	AVR_Core : CPU port map(CPU_rst => rst,
									CPU_clk => clk,
									PC_out  => s_PC_R,
									instruction => s_instruction,
									CPU_data_bus => Data_bus,
									CPU_address_bus => Address_bus,
									CPU_Write_Enable => Write_Enable
									);
									
	flash : progmem port map(rst => rst, clk => clk, PC => s_PC, Instruction => s_instruction, progmem_write => progmem_write);

	io_PORT_A : io_port generic map(Base_address => PORT_A_MEM_OFFSET) 
																	port map(						rst => rst,
																										clk => clk,
																										Address_bus => Address_bus,
																										Data_bus => Data_bus,
																										Write_Enable => Write_enable,
																										io_pins => PORT_A);
																										
	io_PORT_B : io_port generic map(Base_address => PORT_B_MEM_OFFSET) 
																	port map(						rst => rst,
																										clk => clk,
																										Address_bus => Address_bus,
																										Data_bus => Data_bus,
																										Write_Enable => Write_enable,
																										io_pins => PORT_B);
																										
	io_PORT_C : io_port generic map(Base_address => PORT_C_MEM_OFFSET) 	
																	port map(						rst => rst,
																										clk => clk,
																										Address_bus => Address_bus,
																										Data_bus => Data_bus,
																										Write_Enable => Write_enable,
																										io_pins => PORT_C);
																										
	io_PORT_D : io_port generic map(Base_address => PORT_D_MEM_OFFSET)
																	port map(						rst => rst,
																										clk => clk,
																										Address_bus => Address_bus,
																										Data_bus => Data_bus,
																										Write_Enable => Write_enable,
																										io_pins => PORT_D);
end at_A;

