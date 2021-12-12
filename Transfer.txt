-- Transfer
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


-- Componente: Divizor, Sumator, Scazator
entity Transfer is
	port(CLK: in std_logic:='0'; --placa
		 ENABLE: in std_logic:='0';
	     ContMinus,ContPlus:in std_logic_vector (9 downto 0); -- ContMinus cel din care se transfera, ContPlus  cel in care se transfera, semnale copii ale cont-urilor
		 B5,B10,B20,B50,B100,B200: in std_logic;  -- butoane din dmux
		 STOP: in std_logic:='0';-- buton de oprire de la dmux
		 ContMinusNou,ContPlusNou:out std_logic_vector (9 downto 0):= "0000000000" -- conturile propriu-zise	 
		 
	   	  );
end Transfer;


architecture TransferArch of Transfer is  

component SUMATOR 

generic(n: natural :=10);
port(	A:	in std_logic_vector(n-1 downto 0);
	B:	in std_logic_vector(n-1 downto 0);
	CO:	out std_logic;
	sum:	out std_logic_vector(n-1 downto 0));

end component;

component scazator  
	port(
	a , b: in std_logic_vector(9 downto 0);
	rez : out std_logic_vector(9 downto 0)
	);
end component;

component Divizor 	   
	generic	 (n: natural:=2);
	port(clock_in,reset: in std_logic;
	clock_out: out std_logic);
end component;

signal new_CLK : std_logic:='0';
signal CLK_div : std_logic:='0';

begin
	
	new_CLK<=CLK and ENABLE;
	
DIV: Divizor
	generic map(n=>100000000) 
	port map(clock_in=>new_CLK, clock_out=>CLK_div,reset=>'0') ;  
	
	
	process(CLK_div) 

	begin
		if(CLK_div='1' and CLK_div'EVENT)then 
	
			if(B5='1') then
			ContMinusNou<= ContMinus-"101";
			ContPlusNou<=ContPlus +"101";
			end if;		 
			
			if(B10='1') then
			ContMinusNou<= ContMinus-"1010";
			ContPlusNou<=ContPlus +"1010";
			end if;	
			
			if(B20='1') then
			ContMinusNou<= ContMinus-"10100";
			ContPlusNou<=ContPlus +"10100";
			end if;	 
			
			if(B50='1') then
			ContMinusNou<= ContMinus-"110010";
			ContPlusNou<=ContPlus +"110010";
			end if;	  
			
			if(B100='1') then
			ContMinusNou<= ContMinus-"1100100";
			ContPlusNou<=ContPlus +"1100100";
			end if;	  
			
			if(B200='1') then
			ContMinusNou<= ContMinus-"11001000";
			ContPlusNou<=ContPlus +"11001000";
			end if;	
			
		 end if;
												
	
	end process;
	
end architecture ;



