LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity not_1 is
	port(	a: in std_logic;
			c: out std_logic);
end not_1;
architecture structural of not_1 is
begin
	c <= not a;
end structural;