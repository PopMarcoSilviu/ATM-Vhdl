library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Afisor is
	port( unitati: in std_logic_vector (3 downto 0);  
		zeci: in std_logic_vector (3 downto 0);
		sute: in std_logic_vector (3 downto 0);
		mii: in std_logic_vector (3 downto 0); 
		 CLOCK_1KHz :in std_logic;
		 segment: out std_logic_vector (6 downto 0);	
		 anozi : out std_logic_vector(3 downto 0) );   -- anozii pt cele 4 afisoare

end Afisor;


architecture comport of Afisor is
  
begin
	
	process(CLOCK_1KHz)
	variable cnt:integer range 0 to 3:=0;
	begin
		
		if(CLOCK_1KHz='1' and CLOCK_1KHz'event)	then
	
			if(cnt=0)	then 
				report "caz cifra 0";
		
				anozi<="1110";
					case unitati is
					    when "0000" => segment <= "0000001"; -- "0"     
					    when "0001" => segment <= "1001111"; -- "1" 
					    when "0010" => segment <= "0010010"; -- "2" 
					    when "0011" => segment <= "0000110"; -- "3" 
					    when "0100" => segment <= "1001100"; -- "4" 
					    when "0101" => segment <= "0100100"; -- "5" 
					    when "0110" => segment <= "0100000"; -- "6" 
					    when "0111" => segment <= "0001111"; -- "7" 
					    when "1000" => segment <= "0000000"; -- "8"     
					    when "1001" => segment <= "0000100"; -- "9" 
					 	when others => segment <= "1111111"; --gol
					  end case;
				
			elsif(cnt =1)	then
					report "caz cifra 1";
				anozi<="1101";	
					    case zeci is
					    when "0000" => segment <= "0000001"; -- "0"     
					    when "0001" => segment <= "1001111"; -- "1" 
					    when "0010" => segment <= "0010010"; -- "2" 
					    when "0011" => segment <= "0000110"; -- "3" 
					    when "0100" => segment <= "1001100"; -- "4" 
					    when "0101" => segment <= "0100100"; -- "5" 
					    when "0110" => segment <= "0100000"; -- "6" 
					    when "0111" => segment <= "0001111"; -- "7" 
					    when "1000" => segment <= "0000000"; -- "8"     
					    when "1001" => segment <= "0000100"; -- "9" 
					 	when others => segment <= "1111111"; --gol
					    end case;
				
			elsif(cnt=2)	then 
			report "caz cifra 2";
				anozi<="1011";	
						case sute is
					    when "0000" => segment <= "0000001"; -- "0"     
					    when "0001" => segment <= "1001111"; -- "1" 
					    when "0010" => segment <= "0010010"; -- "2" 
					    when "0011" => segment <= "0000110"; -- "3" 
					    when "0100" => segment <= "1001100"; -- "4" 
					    when "0101" => segment <= "0100100"; -- "5" 
					    when "0110" => segment <= "0100000"; -- "6" 
					    when "0111" => segment <= "0001111"; -- "7" 
					    when "1000" => segment <= "0000000"; -- "8"     
					    when "1001" => segment <= "0000100"; -- "9" 
					 	when others => segment <= "1111111"; --gol
					    end case;
				
			  else
				anozi<="0111";
				  report "caz cifra 3";
				case zeci is
					    when "0000" => segment <= "0000001"; -- "0"     
					    when "0001" => segment <= "1001111"; -- "1" 
					 	when others => segment <= "1111111"; --gol
					    end case;
			
			end if;
			
		 if(cnt= 3)then
		   cnt:=0;
	   	 else	
		   cnt:=cnt+1;
		 end if;
			
			
		end if;	
	   
	end process;

end comport;