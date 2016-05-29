

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.all;
USE ieee.std_logic_textio.all;
USE ieee.numeric_std.ALL;
 
ENTITY MCU_tb IS
END MCU_tb;
 
ARCHITECTURE behavior OF MCU_tb IS 
 
     COMPONENT AT8535
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         port_A, port_B, port_C, port_D : INOUT  std_logic_vector(7 downto 0);
         progmem_write : IN  std_logic;
         instruction_write : IN  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal progmem_write : std_logic := '0';
   signal s_instruction : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal port_A, port_B, port_C, port_D : std_logic_vector(7 downto 0) := (others => 'Z');

   -- Clock period definitions
   constant clk_period : time := 4 ns;
	
	-- variables
	shared variable request_read : boolean := FALSE;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AT8535 PORT MAP (
          rst => rst,
          clk => clk,
          port_A => port_A,
			 port_B => port_B,
			 port_C => port_C,
			 port_D => port_D,
          progmem_write => progmem_write,
          instruction_write => s_instruction
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
			file infile : text is in "vlsi.hex";
		variable inline : line;
		variable hexL : std_logic_vector(3 downto 0);
		variable hexH : std_logic_vector(3 downto 0);
		variable instr_count : integer;
		variable instruction : std_logic_vector(15 downto 0);
   begin		
		rst <= '0';
		request_read := TRUE;
		if(rst = '0' and request_read = TRUE) then
		
		progmem_write <= '1';
		readline(infile, inline);										-- some initial stuff. Unused.

			while(not endfile(infile)) loop
				readline(infile, inline);
				hread(inline, hexL); 									-- read colon
				hread(inline, hexH);										-- read byte count_LOW
				hread(inline, hexL);										-- read byte count_HIGH
				instr_count := to_integer(unsigned('0' & hexH & hexL(3 downto 1)));		
				for I in 0 to 5 loop
					hread(inline, hexL);									-- read address offset and record type. Unused now.
				end loop;
				
				for instruction_no in 1 to  instr_count loop
					hread(inline, hexH); 								-- read 4 hex digits (2 bytes) of instruction.
					hread(inline, hexL);
					instruction(7 downto 0) := hexH & hexL;		-- Big endian
					
					hread(inline, hexH); 								
					hread(inline, hexL);
					instruction(15 downto 8) := hexH & hexL;		
				
					s_instruction <= instruction;
					wait for 1*clk_period;
				end loop;

		
			end loop;
		end if;


					
		request_read := FALSE;
		progmem_write <= '0';
		rst <= '1';
		wait for 110*clk_period;
		port_D <= "11000011";
wait for 60*clk_period;

		assert FALSE severity FAILURE;
   end process;
	
END;
