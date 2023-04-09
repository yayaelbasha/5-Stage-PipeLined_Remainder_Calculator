Library ieee;
use ieee.std_logic_1164.all;

entity bufferr1 is   

port (
  clk, arst, start: in std_logic;  
  Ai,Bi:  in std_logic_vector (7 downto 0);
  Ao,Bo: out std_logic_vector (7 downto 0);   
  Done: out std_logic
);
end entity;

architecture myImp of bufferr1 is 
begin


PROCESS(clk,arst)
 	BEGIN
	IF arst= '1' THEN 
		Ao<="00000000";
		Bo<="00000000";
	ELSIF rising_edge(clk) THEN 
		IF start = '1' THEN
		Ao<=Ai;
		Bo<=Bi;
		Done <= '1';
		END IF;
	ELSE
		Done <= '0';
	END IF;
END PROCESS;

end myImp;
