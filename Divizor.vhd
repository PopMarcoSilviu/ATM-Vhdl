library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity Divizor is	   
	generic	 (n: natural:=10);
	port(clock_in,reset: in std_logic;
	clock_out: out std_logic);
end Divizor;


architecture comportament_divizor of Divizor is
signal cnt:integer  range 1 to 1_000_000_000:=1;
signal clock_intermediar: std_logic :='0';
begin		 
	
	process(clock_in,reset)		 
	begin
	if(reset='1') then
		cnt<=1;
		clock_intermediar<='0';	  
		
	elsif (clock_in'event and clock_in='1') then
		cnt<=cnt+1;						   
		
	if (cnt=n) then
		clock_intermediar<=NOT clock_intermediar;
		cnt<=1;
	
	end if;
	end if;
	clock_out<=clock_intermediar;
	end process;
	
end comportament_divizor;