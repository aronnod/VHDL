LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec2to4 IS
    PORT (
        w : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        En : IN STD_LOGIC;
        y : OUT STD_LOGIC_VECTOR(0 TO 3)
    );
END dec2to4;

ARCHITECTURE Behavior OF dec2to4 IS
    SIGNAL Enw : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    Enw <= En & w;
    
    PROCESS (Enw)
	 BEGIN
    IF Enw = "100" THEN
        y <= "1000";
    ELSIF Enw = "101" THEN
        y <= "0100";
    ELSIF Enw = "110" THEN
        y <= "0010";
    ELSIF Enw = "111" THEN
        y <= "0001";
    ELSE
        y <= "0000";
    END IF;
END PROCESS;

END Behavior;
