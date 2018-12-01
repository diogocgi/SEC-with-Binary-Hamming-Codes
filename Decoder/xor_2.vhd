LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity xor_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c:	out	std_logic);
end xor_2;
architecture structural of xor_2 is
begin
	c <= a xor b;
end structural;