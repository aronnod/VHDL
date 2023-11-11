LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY lab3 IS
    PORT (
        Cin : IN STD_LOGIC;
        X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout, Overflow, neg : OUT STD_LOGIC
    );
END lab3;

ARCHITECTURE Behavior OF lab3 IS
    SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	PROCESS (Cin, X, Y)
		BEGIN
			IF Cin = '0' THEN
				Sum <= ('0' & X) + ('0' & Y);	

				
			ELSIF Cin = '1' THEN
				Sum <= ('0' & X) + (NOT('0' & Y) + 1);	
				
			END IF;
			S <= Sum(3 DOWNTO 0);
			neg <= Sum(3);
			Cout <= Sum(4);
			Overflow<= Sum(4) XOR X(3) XOR Y(3) XOR Sum(3);
			neg <= Sum(3);
			
	END PROCESS;
END Behavior;


