library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity SUMATOR is

generic(n: natural :=10);
port(	A:	in std_logic_vector(n-1 downto 0);
	B:	in std_logic_vector(n-1 downto 0);
	CO:	out std_logic;
	sum:	out std_logic_vector(n-1 downto 0));

end SUMATOR;


architecture SUMATOR_ARCH of SUMATOR is

signal result: std_logic_vector(n downto 0);
 
begin					  

    result <= ('0' & A)+('0' & B);
    sum <= result(n-1 downto 0);
    CO <= result(n);

end SUMATOR_ARCH;

