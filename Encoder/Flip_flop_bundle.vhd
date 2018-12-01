LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Flip_flop_bundle is
	port(	clk: in std_logic;
			nSet, nRst: std_logic;
			sIn1, sIn2, sIn3, sIn4: in std_logic;
			output1, output2, output3, output4: out std_logic);
end Flip_flop_bundle;

architecture Structural of Flip_flop_bundle is
component flipFlopDSimul is
	port (clk, D: IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ: OUT STD_LOGIC);
end component;
signal s_nQ : std_logic;
begin
	ffD1: flipFlopDSimul port map (clk,sIn1,nSet,nRst,output1,s_nQ);
	ffD2: flipFlopDSimul port map (clk,sIn2,nSet,nRst,output2,s_nQ);
	ffD3: flipFlopDSimul port map (clk,sIn3,nSet,nRst,output3,s_nQ);
	ffD4: flipFlopDSimul port map (clk,sIn4,nSet,nRst,output4,s_nQ);
end structural;