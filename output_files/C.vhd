LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY C IS
  PORT (
    K : IN STD_LOGIC_VECTOR(0 DOWNTO 3);
    L : OUT STD_LOGIC_VECTOR(0 DOWNTO 3)
  );
END C;

ARCHITECTURE Behavior OF C IS
BEGIN
  PROCESS (K)
  BEGIN
    -- Assign a constant value '0' to L3
    L(3) <= '0'; -- L3
    -- Compute the values for L2, L1, and L0 based on K
    L(2) <= (NOT K(1) AND NOT K(0)); -- L2
    L(1) <= (K(3) OR (K(2) AND NOT K(1) AND NOT K(0))); -- L1
    L(0) <= ((K(1) AND K(0)) OR (NOT K(2) AND K(1)) OR (NOT K(3) AND NOT K(1) AND NOT K(0))); -- L0
  END PROCESS;
END Behavior;

