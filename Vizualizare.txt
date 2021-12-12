--Vizualizare	  

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Componente: divizor, afisor,BCD  

entity Vizualizare is
	port( CLK: IN std_logic:='0'; -- clockul placii 
	      Enable : IN std_logic:='0'; 
		  Suma_Cont: IN std_logic_vector (9 downto 0);
		  segment_out: out std_logic_vector(6 downto 0);
		  anozi_out: out std_logic_vector (3 downto 0)
		 	
	); 

end Vizualizare;	


architecture STRUCT_VIZ of Vizualizare is

component Divizor 	   
	generic	 (n: natural:=2);
	port(clock_in,reset: in std_logic;
	clock_out: out std_logic);
end component;

 component Afisor 
	port( unitati: in std_logic_vector (3 downto 0);  
		zeci: in std_logic_vector (3 downto 0);
		sute: in std_logic_vector (3 downto 0);
		mii: in std_logic_vector (3 downto 0); 
		 CLOCK_1KHz :in std_logic;
		 segment: out std_logic_vector (6 downto 0);	
		 anozi : out std_logic_vector(3 downto 0) );   -- anozii pt cele 4 afisoare

end component;	

component binToBCD 
	Port( Input: in std_logic_vector (9 downto 0);
		unitati: out std_logic_vector(3 downto 0);
		zeci :out std_logic_vector (3 downto 0);
		sute :out std_logic_vector (3 downto 0);
		mii: out std_logic_vector (3 downto 0) ) ;
	
end component;

signal CLK_1HZ :std_logic:='0';
signal CLK_1KZ: std_logic:='0';
signal Z,S,U,M: std_logic_vector(3 downto 0):="0000";	
begin

DIV1 : Divizor
	generic map(n=>100000000)  
	port map  (clock_in=>CLK,reset=>'0',clock_out=>CLK_1HZ) ;
DIV2: Divizor
	generic map(n=>10000)  
	port map  (clock_in=>CLK,reset=>'0',clock_out=>CLK_1KZ) ;

Conversion: binToBCD  
	port map(Input=>Suma_Cont,unitati=>U,zeci=>Z,sute=>S,mii=>M ) ;

Afisare: Afisor
	port map(unitati=>U,zeci=>Z,sute=>S,mii=>M,CLOCK_1KHz=>CLK_1KZ,segment=>segment_out, anozi=>anozi_out) ;
	

end STRUCT_VIZ;