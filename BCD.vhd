library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity binToBCD is
	Port( Input: in std_logic_vector (9 downto 0);
		unitati: out std_logic_vector(3 downto 0);
		zeci :out std_logic_vector (3 downto 0);
		sute :out std_logic_vector (3 downto 0);
		mii: out std_logic_vector (3 downto 0) ) ;
	
end binToBCD;


architecture comport of binToBCD is

begin
	
	process (Input )
	
	variable temp: std_logic_vector (9 downto 0);
	variable calc : unsigned (15 downto 0);  -- variabila pentru shiftari si adunari
	begin
		
		calc:=(others=>'0')	; -- ne asiguram ca registrul pe care lucram este initializat
		temp:= Input;
		
		
		for i in 0 to 9 loop
		if(calc(3 downto 0)>4 ) then	 -- unitati
			calc(3 downto 0):= calc(3 downto 0) +3;
		end if;	   
		
		if(calc(7 downto 4)>4 ) then	 -- zeci
			calc(7 downto 4):= calc(7 downto 4) +3;
		end if;
		
		if(calc(11 downto 8)>4 ) then	 -- sute
			calc(11 downto 8):= calc(11 downto 8) +3;
		end if;	   
		
		-- miile nu pot trece de valoarea 1	 pt ca input e pe 10 biti
		
		calc:=calc(14 downto 0) & temp(9);   -- shiftam registrul calc la stanga cu 1 si adugam MSB din temp 
		
		temp:=temp(8 downto 0) &'0' ; -- shiftam temp
		
		end loop;
		
		unitati<= std_logic_vector(calc(3 downto 0));
		zeci<= std_logic_vector(calc(7 downto 4));
		sute<=std_logic_vector(calc(11 downto 8));
		mii<=std_logic_vector(calc(15 downto 12))	;
		
		
	end process;
end comport;
