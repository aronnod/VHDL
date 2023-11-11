LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab4 IS
    PORT (
        w0, w1, w2, w3 : IN STD_LOGIC;
        s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        f : OUT STD_LOGIC
    );
END lab4;

ARCHITECTURE Behavior OF lab4 IS
BEGIN
    WITH s SELECT
        f <= w0 WHEN "00",
             w1 WHEN "01",
             w2 WHEN "10",
             w3 WHEN OTHERS;
END Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE lab4_package IS
    COMPONENT lab4
        PORT (
            w0, w1, w2, w3 : IN STD_LOGIC;
            s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            f : OUT STD_LOGIC
        );
    END COMPONENT;
END lab4_package;

