Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity calc is   

port (
  Ai,Bi:  in std_logic_vector (7 downto 0);
  Ao,Bo: out std_logic_vector (7 downto 0)   

);
end entity;

architecture myImp of calc is 
begin


PROCESS (Ai,Bi) 
BEGIN
	IF Ai > Bi THEN
		Ao <= std_logic_vector(unsigned(Ai) - unsigned(Bi));
	ELSE 
		Ao <= Ai;
	END IF;
	Bo <= std_logic_vector(unsigned(Bi) srl 1);
END PROCESS;

end myImp;
