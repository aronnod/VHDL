Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU_3 is
	port(
	Clock: in std_logic;
	A, B: in unsigned(7 downto 0);
	student_id: in unsigned(3 downto 0);
	OP: in unsigned(15 downto 0);
	Neg: out std_logic;
	R1: out unsigned(3 downto 0);
	R2: out unsigned(3 downto 0)
	);
end ALU_3;

architecture calculation of ALU_3 is
	signal Result: unsigned(7 downto 0):=(others=>'0');

	begin
	
	process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN
			
			case OP is
				when "0000000000000001" =>
				--Student_id = 5, so greater
					
					Result <= (others => '0');
					Neg <= '0';
					
				when "0000000000000010" =>
				--Student_id = 0, so greater
					
					Result <= (others => '0');
					Neg <= '0';
									
				when "0000000000000100" =>
				--Student_id = 1, so greater
					
					Result <= (others => '0');
					Neg <= '0';
					
					
				when "0000000000001000" =>
				--Student_id = 1, so greater
					
					Result <= (others => '0');
					Neg <= '0';
				
				when "0000000000010000" =>
				--Student_id = 5, so greater
					
					Result <= (others => '0');
					Neg <= '0';
					
				
				when "0000000000100000" =>
				--Student_id = 9, so equal
					
					Result <= (others => '1');
					Neg <= '0';
					
				when "0000000001000000" =>
				--Student_id = 9, so equal
					
					Result <= (others => '1');
					Neg <= '0';
				
				when "0000000010000000" =>
				--Student_id = 9, so equal
					
					Result <= (others => '1');
					Neg <= '0';
				
				when "0000000100000000" =>
				--Student_id = 8, so greater
					
					Result <= (others => '0');
					Neg <= '0';
				
			
				when others =>
				-- Don't care do nothing
				Result <= "--------";
				Neg <= '0';
			
			end case;
		end if;
	end process;
	--Result(3 downto 0) <= student_id(3 downto 0);
	R1 <= Result(3 downto 0); 
	R2 <= "0000"; 

end calculation;
				
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				