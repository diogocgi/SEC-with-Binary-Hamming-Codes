library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2_1 is
	port ( a: 	in  std_logic;
			 b: 	in std_logic;
			 s:	in  std_logic;
			 q: 	out std_logic
	);
end Mux2_1;

architecture Structural of Mux2_1 is

component and_2 is
	port ( a: in std_logic;
			 b: in std_logic;
			 c: out std_logic
	);
end component;

component or_2 is
	port ( a: in std_logic;
			 b: in std_logic;
			 c: out std_logic 
	);
end component;

component not_1 is
	port ( a: in std_logic;
			 c: out std_logic
	);
end component;

signal sig1, sig2, sig3: std_logic;

begin

not1: not_1 port map (s, sig1); 				-- not s
and1: and_2 port map (a, sig1, sig2);  	-- a.(not s)
and2: and_2 port map (b, s, sig3); 			-- b.s
or1: or_2 	port map (sig2, sig3, q);		-- (a. (not s)) + (b.s)

end Structural;