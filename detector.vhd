library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity detector is   --detector
   port(
      input: in std_logic;
      clk: in std_logic;
      rst: in std_logic;
      ena: in std_logic;
      Q: out std_logic
   );
end;

architecture detector_arq of detector is  
   signal D0_aux, D1_aux: std_logic;   --declaro la senial
   signal Q0, Q1: std_logic;   --declaro la senial
   signal I_aux: std_logic;   --declaro la senial
begin

   I_aux <= input;
   D0_aux <= ((not Q0) and (not Q1) and I_aux);   --Funcion D0;
   D1_aux <= (I_aux and Q1) or (I_aux and Q0);     --Funcion D1;
  
	ffd_0: entity work.ffd   -- flip-flop 0
		port map(
		clk   =>   clk,   --es un clock global
		rst   =>   rst,   --es un reset global
		ena   =>   ena,   --es un habilitador global
		D     =>   D0_aux,
		Q     =>   Q0     --la salida de Q es Q0, un cable
		);
		
	ffd_1: entity work.ffd   -- flip-flop 1
	port map(
		clk   =>   clk,   --es un habilitador global
		rst   =>   rst,   --es un reset global
		ena   =>   ena,   --es un habilitador global
		D     =>   D1_aux,
		Q     =>   Q1      --la salida de Q es Q1, un cable
		);
		
		Q <= (not I_aux) and Q1;
		

end;

		
   
   
   
   
   