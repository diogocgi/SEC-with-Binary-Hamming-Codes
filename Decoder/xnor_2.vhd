LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity xnor_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c:	out	std_logic);
end xnor_2;
architecture structural of xnor_2 is
begin
	c <= not (a xor b);
end structural;