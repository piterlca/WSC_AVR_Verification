-- Autor:				Piotr Cielecki 
-- Tytu³ projektu:	Mikrokontroler ATMega8535
-- Termin zajêæ		Poniedzia³ek, 15.15
-- Data: 				24. stycznia 2016


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CPU is
    Port ( CPU_rst : in  STD_LOGIC;
           CPU_clk : in  STD_LOGIC;
			  PC_out : out std_logic_vector(15 downto 0);
           instruction : in  STD_LOGIC_VECTOR(15 downto 0);
           CPU_Data_bus : inout  STD_LOGIC_VECTOR (7 downto 0);
           CPU_Address_bus : inout  STD_LOGIC_VECTOR (15 downto 0);
			  CPU_Write_Enable : inout std_logic);
end CPU;

architecture CPU_a of CPU is

	component ALU is
    Port ( operand1 : in  STD_LOGIC_VECTOR (7 downto 0);
           operand2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  result : out std_logic_vector(7 downto 0);
           op_and, op_or, op_add, op_sub, op_eor, op_mov : in std_logic;
			  zero, carry : out std_logic
		);
	end component ALU;

	
	component gp_registerss is
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
	end component gp_registerss;
	
   component instruction_decoder is
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
			  cancel_decoding : in std_logic);
	end component instruction_decoder;
	
	component ALU_op_decoder is
    Port ( coded_in : in  STD_LOGIC_VECTOR (4 downto 0);
           op_add : out  STD_LOGIC;
           op_sub : out  STD_LOGIC;
           op_and : out  STD_LOGIC;
           op_or : out  STD_LOGIC;
			  op_eor : out STD_LOGIC;
			  op_mov : out std_logic
			  );
	end component ALU_op_decoder;
	
	component Program_counter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  PC_relative : in  STD_LOGIC_VECTOR (15 downto 0);
           increment : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  cancel_decoding : out std_logic
			  );
	end component Program_counter;
	
	component branch_decoder is
    Port ( relative_PC : in  STD_LOGIC_VECTOR (15 downto 0);
           SREG : in  STD_LOGIC_VECTOR (7 downto 0);
           branch_code : in  STD_LOGIC_VECTOR (4 downto 0);
           write_PC : in  STD_LOGIC;
           PC_to_adder : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
	end component branch_decoder;
	
	component mux_2x8 is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           Sel : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
	end component mux_2x8;
	
	component reg_8bit_CE is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Enable : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
	end component reg_8bit_CE;
	
	
	component reg_1x8 is
	generic(Nbit : integer := 8);
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR ((Nbit-1) downto 0);
			  Enable : in std_logic;
           Q : out  STD_LOGIC_VECTOR ((Nbit-1) downto 0));
	end component reg_1x8;
	
	component reg_1x1 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	end component reg_1x1;

	signal write_PC : std_logic;
	signal branch_code : std_logic_vector(4 downto 0);
	signal relative_PC : std_logic_vector(15 downto 0);
	signal PC_to_adder : std_logic_vector(15 downto 0);
	signal s_cancel_decoding : std_logic;
	signal immediate : std_logic_vector(7 downto 0);
	signal Immediate_not_Reg : std_logic;
	signal Enable_ALU : std_logic;
	signal ALU_coded_in : std_logic_vector(4 downto 0);
	signal ALU_add, ALU_sub, ALU_and, ALU_or, ALU_eor, ALU_mov : std_logic;
	signal ALU_zero, ALU_carry : std_logic;
	signal s_SREG : std_logic_vector(7 downto 0);
	signal Addr1_async : std_logic_vector(4 downto 0);
	signal Addr2_async : std_logic_vector(4 downto 0);
	signal Data1_async : std_logic_vector(7 downto 0);
	signal Data2_async : std_logic_vector(7 downto 0);
	signal ALU_arg2	 : std_logic_vector(7 downto 0);
	signal ALU_immediate: std_logic_vector(7 downto 0);
	signal ALU_result  : std_logic_vector(7 downto 0);
	--	signal status		 : std_logic_vector(7 downto 0);
	signal fetch_next_instr : std_logic;
	signal buffered_instr : std_logic_vector(15 downto 0);

	
begin

	Instr_reg : reg_1x8  generic map(Nbit => 16) port map(rst => CPU_rst, 
																			clk=> CPU_clk, D => instruction, 
																			Enable => '1', 
																			Q=> buffered_instr);
																			
	AVR_Idec : instruction_decoder port map(rst => CPU_rst, clk => CPU_clk, 
														instr_coded => Instruction, 
														ALU_Not_mem => Enable_ALU,
														Immediate_Not_reg => Immediate_Not_Reg,
														manipulate_PC => write_PC,
														reg1 =>Addr1_async,
														reg2 =>Addr2_async,
														ALU_decoder => ALU_coded_in,
														ALU_immediate => ALU_immediate,
														relative_PC => relative_PC,
														branch_code => branch_code,
														Address_bus => CPU_Address_bus,
														Data_bus => CPU_Data_bus,
														Write_Enable => CPU_Write_Enable,
														get_next_instr => fetch_next_instr,
														cancel_decoding => s_cancel_decoding
														);

	ALU_dec : ALU_op_decoder port map (coded_in => ALU_coded_in,
													op_add => ALU_add,
													op_sub => ALU_sub,
													op_or => ALU_or,
													op_and => ALU_and,
													op_eor => ALU_eor,
													op_mov => ALU_mov
													);


	AVR_gpreg : gp_registerss port map(Addr1 => Addr1_async, 
													Addr2 => Addr2_async, 
													Data1 => Data1_async, 
													Data2 => Data2_async,
													clk => CPU_clk, rst => CPU_rst,
													Data_bus => CPU_Data_bus,
													Address_bus => CPU_Address_bus,
													Write_Enable => CPU_Write_Enable,
													Not_Enable => not Enable_ALU
													);
																										
	ALU_mux : mux_2x8 port map(
										A => Data2_async, 
										B => ALU_immediate, 
										sel => immediate_not_reg, 
										Q => ALU_arg2
										);

	AVR_ALU : ALU port map(					operand1 => Data1_async, 
													operand2 => ALU_arg2,
													result => ALU_result,
													op_and => ALU_and,
													op_or => ALU_or,
													op_add => ALU_add,
													op_sub => ALU_sub,
													op_eor => ALU_eor,
													op_mov => ALU_mov,
													zero => ALU_zero,
													carry => ALU_carry
													);
	
	ALU_acc : reg_8bit_CE port map(		rst => CPU_rst, 
													clk => CPU_clk, 
													D => ALU_result, 
													Enable => Enable_ALU, 
													Q => CPU_Data_bus);

	prog_ctr: Program_counter port map(	rst => CPU_rst, 
													clk => CPU_clk, 
													PC_relative => PC_to_adder, 
													increment => fetch_next_instr, 
													PC_out => PC_out,
													cancel_decoding => s_cancel_decoding); 
	
	AVR_branch_decoder: branch_decoder port map(	relative_PC => relative_PC, 
																SREG => s_SREG, 
																branch_code => branch_code, 
																write_PC => write_PC, 
																PC_to_adder => PC_to_adder
																);
	
	SREG : reg_1x8 generic map(Nbit => 8) port map(	rst => CPU_rst, 
																	clk => CPU_clk, 
																	D => "000000" & ALU_zero & ALU_carry,
																	Enable => Enable_ALU,
																	Q => s_SREG);
																	

	CPU_Address_bus <= (others => 'H');
	CPU_Data_bus <= (others => 'H');
	CPU_Write_Enable <= 'L';
end CPU_a;

