LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity nand_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c: out std_logic);
end nand_2;
architecture structural of nand_2 is
begin
	c <= a nand b;
end structural;