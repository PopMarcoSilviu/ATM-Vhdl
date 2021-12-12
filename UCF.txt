## Clock signal
#NET "enter"   LOC = "E3"	| IOSTANDARD = "LVCMOS33";					
#NET "enter" TNM_NET = sys_clk_pin;


## 7 segment display
#NET "segment<6>"             LOC=T10 | IOSTANDARD=LVCMOS33; 
#NET "segment<5>"             LOC=R10 | IOSTANDARD=LVCMOS33; 
#NET "segment<4>"             LOC=K16 | IOSTANDARD=LVCMOS33; 
#NET "segment<3>"             LOC=K13 | IOSTANDARD=LVCMOS33; 
#NET "segment<2>"             LOC=P15 | IOSTANDARD=LVCMOS33; 
#NET "segment<1>"             LOC=T11 | IOSTANDARD=LVCMOS33; 
#NET "segment<0>"             LOC=L18 | IOSTANDARD=LVCMOS33;

#NET "anozi<0>"          LOC=J17 | IOSTANDARD=LVCMOS33; 
#NET "anozi<1>"          LOC=J18 | IOSTANDARD=LVCMOS33; 
#NET "anozi<2>"          LOC=T9 | IOSTANDARD=LVCMOS33; 
#NET "anozi<3>"          LOC=J14 | IOSTANDARD=LVCMOS33;

## Stop
#NET "stop"         LOC=V10 | IOSTANDARD=LVCMOS33; 

## Alegere Operatie

#NET "pas"         LOC=U12 | IOSTANDARD=LVCMOS33;
#NET "op"      LOC=U11 | IOSTANDARD=LVCMOS33;

## Numar card/pin
#NET "nr_card_pin<0>"          LOC=J15 | IOSTANDARD=LVCMOS33; 
#NET "nr_card_pin<1>"          LOC=L16 | IOSTANDARD=LVCMOS33; 
#NET "nr_card_pin<2>"          LOC=M13 | IOSTANDARD=LVCMOS33; 
#NET "nr_card_pin<3>"          LOC=R15 | IOSTANDARD=LVCMOS33; 


## Eroare
#NET "eroare"         LOC=H17 | IOSTANDARD=LVCMOS33;

## Bancnote

#NET "b5"           LOC=N17 | IOSTANDARD=LVCMOS33; 
#NET "b10"           LOC=P18 | IOSTANDARD=LVCMOS33; 
#NET "b20"           LOC=P17 | IOSTANDARD=LVCMOS33;
#NET "b50"           LOC=M17 | IOSTANDARD=LVCMOS33; 
#NET "b100"           LOC=M18 | IOSTANDARD=LVCMOS33;

## Cont transfer
#NET "cont_transfer<0>"          LOC=J15 | IOSTANDARD=LVCMOS33; 
#NET "cont_transfer<1>"          LOC=L16 | IOSTANDARD=LVCMOS33;
#NET "cont_transfer<2>"          LOC=M13 | IOSTANDARD=LVCMOS33; 
#NET "cont_transfer<3>"          LOC=R15 | IOSTANDARD=LVCMOS33; 

##Suma retragere
#NET "suma_retrasa<0>"          LOC=R17 | IOSTANDARD=LVCMOS33; 
#NET "suma_retrasa<1>"          LOC=T18 | IOSTANDARD=LVCMOS33; 
#NET "suma_retrasa<2>"          LOC=U18 | IOSTANDARD=LVCMOS33; 
#NET "suma_retrasa<3>"          LOC=R13 | IOSTANDARD=LVCMOS33;
#NET "suma_retrasa<4>"          LOC=T8 | IOSTANDARD=LVCMOS18; 
#NET "suma_retrasa<5>"          LOC=U8 | IOSTANDARD=LVCMOS18; 
#NET "suma_retrasa<6>"         LOC=R16 | IOSTANDARD=LVCMOS33;
#NET "suma_retrasa<7>"         LOC=T13 | IOSTANDARD=LVCMOS33;
#NET "suma_retrasa<8>"         LOC=H6 | IOSTANDARD=LVCMOS33;
#NET "suma_retrasa<9>"         LOC=U12 | IOSTANDARD=LVCMOS33;