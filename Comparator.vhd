library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity COMPARATOR is
	generic	 (n: natural:=10);
	port (A: in std_logic_vector(n-1 downto 0);
	      B: in std_logic_vector (n-1 downto 0);
		  EQUAL :out std_logic :='0';
		  GREATER: out std_logic:='0' ); -- 1 cand A>B 
	
end entity ;			  

architecture COMPARATOR_ARCH  of COMPARATOR is	     

begin
	EQUAL <= '1' when (A=B) else '0'; 	  
	 GREATER <= '1' when (A>B) else '0';
	
	
end COMPARATOR_ARCH;