Library ieee;
use ieee.std_logic_1164.all;

entity bufferrs is   

port (
  clk, arst, start: in std_logic;  
  Ai,Bi:  in std_logic_vector (7 downto 0);
  Ao,Bo: out std_logic_vector (7 downto 0)  

);
end entity;

architecture myImp of bufferrs is 
begin


PROCESS(clk,arst)
 	BEGIN
	IF arst= '1' THEN 
		Ao<="00000000";
		Bo<="00000000";
	ELSIF rising_edge(clk) THEN 
		Ao<=Ai;
		Bo<=Bi;
	END IF;
END PROCESS;

end myImp;
