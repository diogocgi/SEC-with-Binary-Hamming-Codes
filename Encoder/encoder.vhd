LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity encoder is
	port(	clk: in std_logic;
			nRst: in std_logic;
			m: in std_logic;
			x: out std_logic;
			controlbits: out std_logic_vector(6 downto 0));
end encoder;
architecture Structural of encoder is

signal s_m, s_x, s_clk : std_logic;
signal s_axor1, s_axor2, s_axor3, s_axor4, s_bxor1, s_bxor2, s_bxor3, s_bxor4, s_cxor1, s_cxor2, s_cxor3, s_cxor4 : std_logic;
signal s_qff1, s_qff2, s_qff3, s_qff4 : std_logic;
signal s_counterout : std_logic_vector(3 downto 0);
--signal s_s : std_logic_vector(2 downto 0);
--signal s_c : std_logic_vector(3 downto 0);
signal s_rom : std_logic_vector(6 downto 0);
signal s_amux2,s_bmux2,s_cmux2: std_logic;

component and_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c: out std_logic);
end component;

component xor_2 is
	port(	a: in std_logic;
			b: in std_logic;
			c: out std_logic);
end component;

component Flip_flop_bundle is
	port(	clk: in std_logic;
			nSet, nRst: std_logic;
			sIn1, sIn2, sIn3, sIn4: in std_logic;
			output1, output2, output3, output4: out std_logic);
end component;

component counter_4bit is 
	port(	clk: in std_logic;
			nRst: in std_logic;
			counterout: out std_logic_vector(3 downto 0));
end component;

component rom is
	port ( a :  	in std_logic_vector(3 downto 0);
			 output: out std_logic_vector(6 downto 0)
	);
end component;

component control_unit is 
	port(	clk: 		in std_logic;
			rst_c:   in std_logic;
			mem_out:	out  std_logic_vector(6 downto 0)
	);
end component;

component mux4_1 is
	port ( a: 	in  std_logic;
			 b: 	in  std_logic;
			 c: 	in  std_logic;
			 d: 	in  std_logic;
			 s:	in  std_logic_vector(1 downto 0);
			 q: 	out std_logic);
end component;

component mux2_1 is
	port ( a: 	in  std_logic;
			 b: 	in std_logic;
			 s:	in  std_logic;
			 q: 	out std_logic);
end component;

begin
	CU: control_unit port map (s_clk, nRst, s_rom);
		
	and1: and_2 port map (s_m,s_rom(6),s_axor1);
	and2: and_2 port map (s_m,s_rom(5),s_axor2);
	and3: and_2 port map (s_m,s_rom(4),s_axor3);
	and4: and_2 port map (s_m,s_rom(3),s_axor4);
	
	xor1: xor_2 port map (s_axor1,s_bxor1,s_cxor1);
	xor2: xor_2 port map (s_axor2,s_bxor2,s_cxor2);
	xor3: xor_2 port map (s_axor3,s_bxor3,s_cxor3);
	xor4: xor_2 port map (s_axor4,s_bxor4,s_cxor4);

	ff1: Flip_flop_bundle port map (s_clk,'1',nRst,s_cxor1,s_cxor2,s_cxor3,s_cxor4,s_bxor1,s_bxor2,s_bxor3,s_bxor4);
	
	mux1: mux4_1 port map (s_cxor1,s_cxor2,s_cxor3,s_cxor4,s_rom(1) & s_rom(0),s_bmux2);
	
	mux2: mux2_1 port map (s_m,s_bmux2,s_rom(2),s_x);
	
	s_clk <= clk;
	s_m <= m;
	x <= s_x;
	controlbits <= s_rom(6) & s_rom(5) & s_rom(4) & s_rom(3) & s_rom(2) & s_rom(1) & s_rom(0);
	
end Structural;