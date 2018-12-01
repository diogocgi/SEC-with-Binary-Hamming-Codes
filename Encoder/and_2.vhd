LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity and_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c: out std_logic);
end and_2;
architecture structural of and_2 is
begin
	c <= a and b;
end structural;