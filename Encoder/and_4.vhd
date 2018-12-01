LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity and_4 is
	port(	a1: in std_logic;
			a2: in std_logic;
			a3: in std_logic;
			a4: in std_logic;
			c: out std_logic);
end and_4;

architecture structural of and_4 is

component and_2 is
	port(	a: in 	std_logic;
			b: in 	std_logic;
			c:	out	std_logic);
end component;

signal s_and1, s_and2: std_logic;

begin

and1: and_2 port map (a1, a2, s_and1); 
and2: and_2 port map (a3, a4, s_and2); 
and3: and_2 port map (s_and1, s_and2, c);
	
end structural;