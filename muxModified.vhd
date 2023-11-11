LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY muxModified IS
    PORT (
        w0, w1, s : IN STD_LOGIC;
        f : OUT STD_LOGIC
    );
END muxModified;

ARCHITECTURE Behavior OF muxModified IS
BEGIN
    WITH s SELECT
        f <= w0 WHEN '0',
             w1 WHEN OTHERS;
END Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE muxModified_package IS
    COMPONENT muxModified
        PORT (
            w0, w1, s : IN STD_LOGIC;
            f : OUT STD_LOGIC
        );
    END COMPONENT;
END muxModified_package;

