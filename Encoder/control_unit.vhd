LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity control_unit is
	port(	clk: 		in std_logic;
			rst_c:   in std_logic;
			mem_out:	out  std_logic_vector(6 downto 0)
	);
end control_unit;

architecture structural of control_unit is

component counter_4bit is
	port(	clk: in std_logic;
			nRst: in std_logic;
			counterout: out std_logic_vector(3 downto 0));
end component;

component rom is
port ( a :  	in std_logic_vector(3 downto 0);
		 output: out std_logic_vector(6 downto 0)
		 --c:	out  std_logic_vector(3 downto 0);
		 --s:	out  std_logic_vector(2 downto 0)
	);
end component;

signal s_counterOut: std_logic_vector(3 downto 0);

begin

counter: counter_4bit port map (clk, rst_c, s_counterOut); 			
rom1: 	rom port map (s_counterOut, mem_out); 
	
end structural;