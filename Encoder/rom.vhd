library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
	port ( a :  	in std_logic_vector(3 downto 0);
			 output: out std_logic_vector(6 downto 0)
	);
end rom;

architecture Behavioral of rom is

-- little endian, lsb na posicao menor (0)
subtype ROM_WORD is STD_LOGIC_VECTOR (6 downto 0);

type ROM_TABLE is array (15 downto 0) of ROM_WORD;

signal address : integer;
signal my_array : ROM_TABLE;

begin

	process (address, my_array)
	begin
	address <= to_integer(unsigned(a));
	-- (0) (1) (2) (3) (4) (5) (6)
	-- c1, c2, c3, c4, s0, s1, s2
	--my_array <= ("1100000", 
	--				 "1001000", 
	--				 "0011000",
	--				 "0101000", 
	--				 "1010000", 
	--				 "0110000", 
	--				 "0111000",
	--				 "1011000",
	--				 "1101000",
	--				 "1110000",
	--				 "1111000",
	--				 "0000100",
	--				 "0000101",
	--				 "0000110",
	--				 "0000111",
	--				 "0000000");
	my_array <= (	"0000000",	
						"0000111", 
						"0000110",
						"0000101",
						"0000100",
						"1111000",
						"1110000", 
						"1101000",
						"1011000",
						"0111000",
						"0110000", 
						"1010000", 
						"0101000",
						"0011000", 
						"1001000", 
						"1100000");
	output <= my_array(address);
	
	end process;

end Behavioral;