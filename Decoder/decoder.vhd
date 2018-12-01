LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity decoder is
	port(	y: 		  in  std_logic_vector(14 downto 0); -- 14 = primeiro bit da mensagem(msb), 0 = ultimo bit(lsb) 4º bit de redundancia
			msgOut:    out std_logic_vector(10 downto 0)
			--test_input: out std_logic_vector(14 downto 0)
	);
end decoder;

architecture structural of decoder is

component xor_2 is
	port(	a: in 	std_logic;
			b: in 	std_logic;
			c:	out	std_logic);
end component;

component xnor_2 is
	port(	a: in 	std_logic;
			b: in 	std_logic;
			c:	out	std_logic);
end component;

component and_4 is
	port(	a1: in std_logic;
			a2: in std_logic;
			a3: in std_logic;
			a4: in std_logic;
			c: out std_logic);
end component;

-- parity check

signal s_xor_a: std_logic_vector(5 downto 0);
signal s_xnor_a: std_logic;

signal s_xor_b: std_logic_vector(5 downto 0);
signal s_xnor_b: std_logic;

signal s_xor_c: std_logic_vector(5 downto 0);
signal s_xnor_c: std_logic;

signal s_xor_d: std_logic_vector(5 downto 0);
signal s_xnor_d: std_logic;

signal s_and: std_logic_vector(10 downto 0);

begin
--																												 |-   4 parity bits	 -|
--general note: x0,    x1,    x2,    x3,    x4,    x5,   x6,   x7,   x8,   x9,  x10,  x11,  x12,  x13,  x14
--					y(14), y(13), y(12), y(11), y(10), y(9), y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1), y(0)

-- parity equation 1: x0 XOR x1 XOR x4 XOR x7 XOR x8 XOR x9 XOR x10 XOR x11
xor1_a: xor_2 	port map (y(14), y(13), s_xor_a(0)); 			
xor2_a: xor_2 	port map (s_xor_a(0), y(10), s_xor_a(1)); 	
xor3_a: xor_2 	port map (s_xor_a(1), y(7), s_xor_a(2)); 
xor4_a: xor_2 	port map (s_xor_a(2), y(6), s_xor_a(3)); 
xor5_a: xor_2 	port map (s_xor_a(3), y(5), s_xor_a(4)); 	
xor6_a: xor_2 	port map (s_xor_a(4), y(4), s_xor_a(5)); 
xnor_a: xnor_2 port map (s_xor_a(5), y(3), s_xnor_a); 
	
-- parity equation 2: x0 XOR x3 XOR x5 XOR x6 XOR x8 XOR x9 XOR x10 XOR x12
xor1_b: xor_2 	port map (y(14), y(11), s_xor_b(0)); 			
xor2_b: xor_2 	port map (s_xor_b(0), y(9), s_xor_b(1)); 	
xor3_b: xor_2 	port map (s_xor_b(1), y(8), s_xor_b(2)); 
xor4_b: xor_2 	port map (s_xor_b(2), y(6), s_xor_b(3)); 
xor5_b: xor_2 	port map (s_xor_b(3), y(5), s_xor_b(4)); 	
xor6_b: xor_2 	port map (s_xor_b(4), y(4), s_xor_b(5)); 
xnor_b: xnor_2 port map (s_xor_b(5), y(2), s_xnor_b);

-- parity equation 3: x2 XOR x4 XOR x5 XOR x6 XOR x7 XOR x9 XOR x10 XOR x13
xor1_c: xor_2 	port map (y(12), y(10), s_xor_c(0)); 			
xor2_c: xor_2 	port map (s_xor_c(0), y(9), s_xor_c(1)); 	
xor3_c: xor_2 	port map (s_xor_c(1), y(8), s_xor_c(2)); 
xor4_c: xor_2 	port map (s_xor_c(2), y(7), s_xor_c(3)); 
xor5_c: xor_2 	port map (s_xor_c(3), y(5), s_xor_c(4)); 	
xor6_c: xor_2 	port map (s_xor_c(4), y(4), s_xor_c(5)); 
xnor_c: xnor_2 port map (s_xor_c(5), y(1), s_xnor_c);

-- parity equation 4: x1 XOR x2 XOR x3 XOR x6 XOR x7 XOR x8 XOR x10 XOR x14
xor1_d: xor_2 	port map (y(13), y(12), s_xor_d(0)); 			
xor2_d: xor_2 	port map (s_xor_d(0), y(11), s_xor_d(1)); 	
xor3_d: xor_2 	port map (s_xor_d(1), y(8), s_xor_d(2)); 
xor4_d: xor_2 	port map (s_xor_d(2), y(7), s_xor_d(3)); 
xor5_d: xor_2 	port map (s_xor_d(3), y(6), s_xor_d(4)); 	
xor6_d: xor_2 	port map (s_xor_d(4), y(4), s_xor_d(5)); 
xnor_d: xnor_2 port map (s_xor_d(5), y(0), s_xnor_d);
	
-- H matrix
-- 1st column
and1: 	and_4 port map (not s_xnor_a, not s_xnor_b, s_xnor_c, s_xnor_d, s_and(0)); 	
-- 2nd column
and2: 	and_4 port map (not s_xnor_a, s_xnor_b, s_xnor_c, not s_xnor_d, s_and(1)); 	
-- 3rd column
and3: 	and_4 port map (s_xnor_a, s_xnor_b, not s_xnor_c, not s_xnor_d, s_and(2));
-- 4th column	
and4: 	and_4 port map (s_xnor_a, not s_xnor_b, s_xnor_c, not s_xnor_d, s_and(3)); 	
-- 5th column	
and5: 	and_4 port map (not s_xnor_a, s_xnor_b, not s_xnor_c, s_xnor_d, s_and(4));
-- 6th column	 	
and6: 	and_4 port map (s_xnor_a, not s_xnor_b, not s_xnor_c, s_xnor_d, s_and(5)); 	
-- 7th column	 	
and7: 	and_4 port map (s_xnor_a, not s_xnor_b, not s_xnor_c, not s_xnor_d, s_and(6)); 	
-- 8th column	
and8: 	and_4 port map (not s_xnor_a, s_xnor_b, not s_xnor_c, not s_xnor_d, s_and(7)); 	
-- 8th column	
and9:		and_4 port map (not s_xnor_a, not s_xnor_b, s_xnor_c, not s_xnor_d, s_and(8));
-- 9th column	 		
and10: 	and_4 port map (not s_xnor_a, not s_xnor_b, not s_xnor_c, s_xnor_d, s_and(9));
-- 10th column	 	
and11: 	and_4 port map (not s_xnor_a, not s_xnor_b, not s_xnor_c, not s_xnor_d, s_and(10)); 		

-- 1-bit error correction
xor_last1: 	xor_2 port map (y(14), s_and(0), msgOut(10));
xor_last2: 	xor_2 port map (y(13), s_and(1), msgOut(9));
xor_last3: 	xor_2 port map (y(12), s_and(2), msgOut(8));
xor_last4: 	xor_2 port map (y(11), s_and(3), msgOut(7));
xor_last5: 	xor_2 port map (y(10), s_and(4), msgOut(6));
xor_last6: 	xor_2 port map (y(9), s_and(5), msgOut(5));
xor_last7: 	xor_2 port map (y(8), s_and(6), msgOut(4));
xor_last8: 	xor_2 port map (y(7), s_and(7), msgOut(3));
xor_last9: 	xor_2 port map (y(6), s_and(8), msgOut(2));
xor_last10: xor_2 port map (y(5), s_and(9), msgOut(1));
xor_last11: xor_2 port map (y(4), s_and(10), msgOut(0));
	
	--test_input <= y(14) & y(13 downto 0);
	
end structural;