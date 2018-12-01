LIBRARY storage;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopDSimul IS
  PORT (clk, D: IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ: OUT STD_LOGIC);
END flipFlopDSimul;

ARCHITECTURE behavior OF flipFlopDSimul IS
BEGIN
  PROCESS (clk, nSet, nRst)
  BEGIN
    IF (nRst = '0')
        THEN Q <= '0';
             nQ <= '1';
	 ELSIF (nSet = '0')
		  THEN Q <= '1';
				 nQ <= '0';
	 ELSIF (clk = '1') AND (clk'EVENT)
		  THEN Q <= D;
				 nQ <= NOT D;
    END IF;
  END PROCESS;
END behavior;