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

entity instruction_decoder is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           instr_coded : in  STD_LOGIC_VECTOR (15 downto 0);
           ALU_Not_mem : out  STD_LOGIC;
			  Immediate_Not_reg : out std_logic;
			  manipulate_PC : out std_logic;
           reg1 : out  STD_LOGIC_VECTOR (4 downto 0);
           reg2 : out  STD_LOGIC_VECTOR (4 downto 0);
			  alu_decoder : out std_logic_vector(4 downto 0);
			  ALU_immediate:out std_logic_vector(7 downto 0);		
			  relative_PC: out std_logic_vector(15 downto 0);
			  branch_code : out std_logic_vector(4 downto 0);
			  Address_bus : out std_logic_vector(15 downto 0);
			  Data_bus : out std_logic_vector(7 downto 0);
			  Write_Enable : out std_logic;
			  get_next_instr : out std_logic;
			  cancel_decoding : in std_logic
			  );
end instruction_decoder;

architecture Idec_a of instruction_decoder is

	type STATE is (IDLE, ALU_INSTR, DMA, IO_IN, IO_OUT, BRANCH, RJMP, PUSH, POP,  MEM_WRITEBACK);
	-- Stany dekodera :
	--		IDLE - bezczynnoœæ - oczekiwanie na instrukcjê
	--		DMA - Bezpoœrednie adresowanie pamiêci, argument adresowany natychmiastowo
	--		ALU_INSTR - 
	signal idec_state, last_state  : STATE := IDLE;
	
	signal Add_for_Addbus_p1 	: std_logic_vector(15 downto 0);
	signal Data_for_Dbus_p1  	: std_logic_vector(7 downto 0);
	signal last_instr_p1		 	: std_logic_vector(15 downto 0) ;
	signal sign_pad_RJMP : std_logic_vector(3 downto 0);
	signal sign_pad_BRANCH : std_logic_vector(8 downto 0);
	
	constant STACK_POINTER_ADDRESS : std_logic_vector(15 downto 0) := "0000000001011110";

begin

	-- Opisy przejœæ stanów dekodera instrukcji --
	idec_auto: process(clk, rst) is

	begin
		if(rst = '0' or cancel_decoding = '1') then idec_state <= IDLE;
		elsif(clk'event and clk = '1') then
			last_state <= idec_state;
			
			case idec_state is
				when IDLE | MEM_WRITEBACK	=>		if(instr_coded = "000000000000000" or instr_coded = last_instr_p1) 	
													then 	idec_state <= IDLE;
												elsif(instr_coded(15) = '0') 					
													then 	idec_state <= ALU_INSTR;
												elsif(instr_coded(15 downto 12) = "1111" 	)
													then 	idec_state <= BRANCH;
												elsif(instr_coded(15 downto 12) = "1100") 
													then idec_state <= RJMP;
												elsif(instr_coded(15 downto 11) = "10110") 
													then idec_state <= IO_IN;
												elsif(instr_coded(15 downto 11) = "10111") 
													then idec_state <= IO_OUT;
												else															
													idec_state <= DMA;
												end if;
												
												
				when others  		 => 	idec_state <= MEM_WRITEBACK;
			
			end case;
			last_instr_p1 <= instr_coded;
		end if;
	end process idec_auto;
	
	-- Zachowanie wyjœæ dekodera --
	
	
	reg1 <= 	instr_coded(8 downto 4) 											when idec_state = ALU_INSTR and instr_coded(14) = '0' else
				'1' & instr_coded(7 downto 4)										when idec_state = ALU_INSTR; 	
	
	reg2 <= instr_coded(9) & instr_coded(3 downto 0)						when idec_state = ALU_INSTR; 	
	
	ALU_Immediate <= instr_coded(11 downto 8) & instr_coded(3 downto 0)when idec_state = ALU_INSTR;
	
	Immediate_not_reg <= instr_coded(14) 		 								when idec_state = ALU_INSTR;
	
	ALU_Not_mem <= not instr_coded(15) 											when idec_state = ALU_INSTR	 else '0';
	
	ALU_decoder <= instr_coded(14 downto 10)									when idec_state = ALU_INSTR;
	
	Add_for_Addbus_p1 <= "000000000001" & instr_coded(7 downto 4)		when idec_state = ALU_INSTR and instr_coded(14) = '1' else 
								"00000000000"  & instr_coded(8 downto 4)		when idec_state = ALU_INSTR else
								"000000000001" & instr_coded(7 downto 4)		when idec_state = DMA		 else
								"00000000000"  &  instr_coded(8 downto 4) 	when idec_state = IO_IN		 else
								"0000000000"   & instr_coded(10 downto 9) & instr_coded(3 downto 0) + "000000000100000"
																							when idec_state = IO_OUT; 
								
	Data_for_DBus_p1 <= instr_coded(11 downto 8) & instr_coded(3 downto 0) when idec_state = DMA;
		
	Address_bus <= Add_for_Addbus_p1 when idec_state = MEM_WRITEBACK else 
					"00000000000"  &  instr_coded(8 downto 4) 	
							when idec_state = IO_OUT			else
					"0000000000"   & instr_coded(10 downto 9) & instr_coded(3 downto 0) + "000000000100000"
							when idec_state = IO_IN				else
					"00000000000" & instr_coded(8 downto 4) 		
						when idec_state = PUSH					else
					(others => 'Z');
					
	Data_bus 	<= Data_for_Dbus_p1 when idec_state = MEM_WRITEBACK  and last_state = DMA else (others => 'Z');
	
	Write_enable <= '1' when idec_state = MEM_WRITEBACK and (last_state /= RJMP and last_state /= BRANCH) else '0';
	
	
	sign_pad_RJMP <= "0000" when instr_coded(11) = '0' and idec_state = RJMP else "1111" when idec_state = RJMP;
	
	sign_pad_BRANCH <= "111111111" when instr_coded(9) = '1' and idec_state = BRANCH else "000000000" when idec_state = BRANCH;
	
	manipulate_PC <= '1' when idec_state = BRANCH or idec_state = RJMP else '0';
	
	relative_PC <= sign_pad_RJMP & instr_coded(11 downto 0) when idec_state = RJMP else
						sign_pad_BRANCH & instr_coded(9 downto 3) when idec_state = BRANCH;
	
	branch_code <= instr_coded(11 downto 10) & instr_coded(2 downto 0);
	
	get_next_instr <= '0' when idec_state = MEM_WRITEBACK or idec_state = IDLE else '1';
	
end Idec_a;