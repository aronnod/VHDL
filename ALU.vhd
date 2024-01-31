Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
	port(
	Clock: in std_logic;
	A, B: in unsigned(7 downto 0);
	student_id: in unsigned(3 downto 0);
	OP: in unsigned(15 downto 0);
	Neg: out std_logic;
	R1: out unsigned(3 downto 0);
	R2: out unsigned(3 downto 0)
	);
end ALU;

architecture calculation of ALU is
	signal Reg1, Reg2, Result: unsigned(7 downto 0):=(others=>'0');
	signal Reg4: unsigned(7 downto 0);
	begin
		Reg1 <= A;
		Reg2 <= B;
	
	process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN
			
			case OP is
				when "0000000000000001" =>
				--Replace the odd bits of A with odd bits of B
					Reg4(0) <= Reg1(0);
					Reg4(1) <= Reg2(1);
					Reg4(2) <= Reg1(2);
					Reg4(3) <= Reg2(3);
					Reg4(4) <= Reg1(4);
					Reg4(5) <= Reg2(5);
					Reg4(6) <= Reg1(6);
					Reg4(7) <= Reg2(7);					

					
					Result <= Reg4;
					Neg <= '0';
					
				when "0000000000000010" =>
				--NOT(A AND B)
					Result <= (Reg2 NAND Reg1);
					Neg <= '0';
									
				when "0000000000000100" =>
				--(A + B) - 5
					Result <= (Reg1 + Reg2) - 5;
					Neg <= '0';
					
					
				when "0000000000001000" =>
				--2’s complement of B	
					Reg4(0) <= Reg2(7);
					Reg4(1) <= Reg2(6);
					Reg4(2) <= Reg2(5);
					Reg4(3) <= Reg2(4);
					Reg4(4) <= Reg2(3);
					Reg4(5) <= Reg2(2);
					Reg4(6) <= Reg2(1);
					Reg4(7) <= Reg2(0);		
					
								
					Result <= Reg4 + 1;
					Neg <= '0';
				
				when "0000000000010000" =>
				--Invert the even bits of B	
					
					Reg4(0) <= NOT Reg2(0);
					Reg4(1) <= Reg2(1);
					Reg4(2) <= NOT Reg2(2);
					Reg4(3) <= Reg2(3);
					Reg4(4) <= NOT Reg2(4);
					Reg4(5) <= Reg2(5);
					Reg4(6) <= NOT Reg2(6);
					Reg4(7) <= Reg2(7);	
					
					Result <= Reg4;
					Neg <= '0';
					
				
				when "0000000000100000" =>
				--Shift A to left by 2 bits, input bit = 1 (SHL)
					
					Reg4 <= shift_left(Reg1, 2);
					Reg4(1) <= '1';
					Reg4(0) <= '1';
					
					Result <= Reg4;
					Neg <= '0';
					
				when "0000000001000000" =>
				--NULL
					--Reg4(0) <= '0';
					--Reg4(1) <= '0';
					--Reg4(2) <= '0';
					--Reg4(3) <= '0';
					--Reg4(4) <= '0';
					--Reg4(5) <= '0';
					--Reg4(6) <= '0';
					--Reg4(7) <= '0';	
					Result <= (others => '0');
					Neg <= '0';
				
				when "0000000010000000" =>
				--Produce 2’s complement of A
					
					Reg4(0) <= Reg1(7);
					Reg4(1) <= Reg1(6);
					Reg4(2) <= Reg1(5);
					Reg4(3) <= Reg1(4);
					Reg4(4) <= Reg1(3);
					Reg4(5) <= Reg1(2);
					Reg4(6) <= Reg1(1);
					Reg4(7) <= Reg1(0);
					
					Result <= Reg4;
					Neg <= '0';
				
				when "0000000100000000" =>
				--Rotate B to right by 2 bits (ROR)
				
					Result <= (Reg2(1 downto 0) & Reg2(7 downto 2));
					Neg <= '0';
					
				when others =>
				-- Don't care do nothing
			
			end case;
		end if;
	end process;
	
	R1 <= Result(3 downto 0); -- Since the seven segment can only hold 4 bits 
	R2 <= Result(7 downto 4); -- at a time split the 8-bit into two 4-bits

end calculation;
				
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				