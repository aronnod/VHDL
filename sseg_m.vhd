LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg_m IS
PORT (	bcd: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			neg: IN STD_LOGIC;
			leds: OUT STD_LOGIC_VECTOR(0 TO 6);
			leds2: OUT STD_LOGIC_VECTOR(0 TO 6)		);
	
END sseg_m;
	
ARCHITECTURE Behavior OF sseg_m IS
	BEGIN
	
		PROCESS(bcd)
		BEGIN
			CASE bcd IS
				WHEN "0000" => leds <= "0010101"; --Y
				WHEN "0001" => leds <= "0111011"; --N
				WHEN OTHERS => leds <= "-------";
				
			END CASE;
		END PROCESS;

		PROCESS (neg)
			BEGIN
				IF (neg = '1') THEN leds2 <= "0000001";
				ELSE leds2 <= "0000000";
				END IF;
		END PROCESS;
		
END Behavior;
