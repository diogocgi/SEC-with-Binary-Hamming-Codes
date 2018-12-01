LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity or_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c: out std_logic);
end or_2;
architecture structural of or_2 is
begin
	c <= a or b;
end structural;