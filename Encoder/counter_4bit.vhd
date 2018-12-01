LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity counter_4bit is
	port(	clk: in std_logic;
			nRst: in std_logic;
			counterout: out std_logic_vector(3 downto 0));
end counter_4bit;
architecture structural of counter_4bit is

component flipFlopDSimul is
	port (clk, D: IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ: OUT STD_LOGIC);
end component;
signal s_Q1, S_Q2, S_Q3, S_Q4 : STD_LOGIC;
begin
	ffD1: flipFlopDSimul port map (clk,S_Q1,'1',nRst,counterout(0),s_Q1);
	ffD2: flipFlopDSimul port map (s_Q1,S_Q2,'1',nRst,counterout(1),S_Q2);
	ffD3: flipFlopDSimul port map (s_Q2,S_Q3,'1',nRst,counterout(2),S_Q3);
	ffD4: flipFlopDSimul port map (s_Q3,S_Q4,'1',nRst,counterout(3),S_Q4);
end structural;