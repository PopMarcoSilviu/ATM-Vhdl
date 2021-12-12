-- Retragere
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--componente: Divizor

entity Retragere is
	port( CLK: in std_logic :='0';	
	ENABLE : in std_logic:='0';
	N5,N10,N20,N50,N100,N200: out std_logic_vector(9 downto 0); -- nr de bancnote inainte de retragere
	N5I,N10I,N20I,N50I,N100I,N200I: in std_logic_vector(9 downto 0); --nr de bancnote dupa retragere
	Suma_retrasa : in std_logic_vector(9 downto 0);
	Suma_in_contI: in std_logic_vector(9 downto 0);
	Suma_in_cont: out std_logic_vector (9 downto 0);
	EROARE: out std_logic:='0'
		  
	);
	
	
end Retragere;	  


architecture  RetragereArch of Retragere is

 component Divizor is	   
	generic	 (n: natural:=2);
	port(clock_in,reset: in std_logic;
	clock_out: out std_logic);
end component ;

 signal Clock_new: std_logic :='0';
 signal Clock_div: std_logic :='0';	
 
begin
	Clock_new<=CLK and ENABLE;
	Suma_in_cont<=Suma_in_contI-Suma_retrasa; 
	
Div: Divizor
generic	map (n=>100000000)
port map(clock_in=>Clock_new,clock_out=>Clock_div ,reset=>'0' );

process (Clock_div)
variable suma :std_logic_vector (9 downto 0):="0000000000";		 
variable C5,C10,C20,C50,C100,C200 :std_logic_vector(9 downto 0):="0000000000";	
variable ER : std_logic:='0';
begin
	
	while suma < Suma_retrasa loop
		
		if(suma_retrasa-suma>=200 and C200<N200I )	then 
			suma:=suma+"11001000" ;
			C200:=C200+'1';
			
		elsif (suma_retrasa-suma>=100 and C100<N100I) 	then 
			suma:=suma+"1100100";
			C200:=C200+'1';	
			
		elsif (suma_retrasa-suma>=50 and C50<N50I )	then 
			suma:=suma+"1100100" ;
			C50:=C50+'1'; 
			
		elsif (suma_retrasa-suma>=20 and C20<N20I)	then 
			   suma:=suma+"10100";
				C20:=C20+'1';	 
			
		elsif (suma_retrasa-suma>=10 and C10<N10I)	then 
			   suma:=suma+"1010";
			C10:=C10+'1';	 
			
		elsif (suma_retrasa-suma>=5 and C5<N5I )	then 
			   suma:=suma+"0101"  ;
			C5:=C5+'1';
		else 
			ER:='1'; 
		
		end if;
		
	end loop;	
	
	if(suma = Suma_retrasa and ER='0') then
		N5<=N5I-C5;
		N10<=N10I-C10;
		N20<=N20I-C20;
		N50<=N50I-C50;
		N100<=N100I-C100;
		N200<=N200I-C200;
		
	else
		EROARE<='1';
	end if;
	
end process;

end architecture ;