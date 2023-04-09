Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity modulo is   

port (
  clk, arst, start: in std_logic;  
  A:  in std_logic_vector (7 downto 0);
  B:  in std_logic_vector (3 downto 0);
  C: out std_logic_vector (3 downto 0);   
  Done, Err: out std_logic
);
end entity;

architecture myImp of modulo is
 
component bufferr1 is   

port (
  clk, arst, start: in std_logic;  
  Ai,Bi:  in std_logic_vector (7 downto 0);
  Ao,Bo: out std_logic_vector (7 downto 0);   
  Done: out std_logic
);
end component;

component calc is   

port (
  Ai,Bi:  in std_logic_vector (7 downto 0);
  Ao,Bo: out std_logic_vector (7 downto 0)  

);
end component;

TYPE buff_type IS ARRAY(0 TO 5) of std_logic_vector(7 DOWNTO 0);
TYPE calc_type IS ARRAY(0 TO 4) of std_logic_vector(7 DOWNTO 0);

signal starts: std_logic_vector (0 to 4);

signal Ab,Bb: buff_type;
signal Ac,Bc: calc_type;

begin
Ab(0)<= A;
Bb(0)<= B&"0000";
starts <= start&"1111";

Err <= '1' WHEN B < "1000" ELSE '0';


loop1: FOR i IN 0 TO 4 GENERATE
bx: bufferr1 PORT MAP(clk,arst,starts(i),Ab(i), Bb(i), Ac(i),Bc(i));
cx: calc PORT MAP(Ac(i),Bc(i),Ab(i+1), Bb(i+1));

END GENERATE;


C<=Ab(5)(3 downto 0);

end myImp;
