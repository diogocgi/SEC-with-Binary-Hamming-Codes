library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1 is
	port ( a: 	in  std_logic;
			 b: 	in  std_logic;
			 c: 	in  std_logic;
			 d: 	in  std_logic;
			 s:	in  std_logic_vector(1 downto 0);
			 q: 	out std_logic
	);
end Mux4_1;

architecture Structural of Mux4_1 is

component mux2_1 is
	port ( a: 	in  std_logic;
			 b: 	in  std_logic;
			 s:	in  std_logic;
			 q: 	out std_logic
	);
end component;

signal sig1, sig2: std_logic;

begin

mux1: mux2_1 port map (a, b, s(0), sig1); 				-- mux2_1(a, b, s0)
mux2: mux2_1 port map (c, d, s(0), sig2); 				-- mux2_1(c, d, s0)
mux3: mux2_1 port map (sig1, sig2, s(1), q);				-- mux2_1(mux1, mux2, s1)

end Structural;