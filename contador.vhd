Library IEEE; 
use IEEE.std_logic_1164.all;
use work.all;

entity contador is 
   port(
      clk: in std_logic;
	  rst: in std_logic;
	  ena: in std_logic;  
	  Q: out std_logic_vector(3 downto 0)   --vector de salida  , puedo hacerlos individuales pero es mas paja qa, qb, qc,qd  
   );
end;

architecture contador_arq of contador is
   
   signal D0_aux, D1_aux, D2_aux, D3_aux: std_logic;   --declaro las seniales 
   signal Q0, Q1, Q2, Q3: std_logic;                   --cables 
   
begin 

     D3_aux  <=   (((not Q1) and (not Q0) and Q3) or (Q1 and Q2 and (not Q3)) or (Q1 and (not Q2) and Q3));   --funcion 
   	 D2_aux  <=   (((not Q0) and (not Q1) and Q2) or ((not Q0) and Q1 and (not Q2)));
	 D1_aux  <=   (((not Q0)) and (not Q1));
	 D0_aux  <=   (Q0 and (not Q1) and (not Q3));
	  
	  
   ffd_0: entity work.ffd  --lo que ahcemos ahora son instancias flip-flop 0
      port map( 
		   clk   =>   clk,   --es un clock global 		   
		   rst   =>   rst,   --tambien es un reset global  
		   ena   =>   ena,   --tambien es un habilitador global
		   D	 =>   D0_aux,
		   Q     =>   Q0    
		   );
	  
   fffd_1: entity work.ffd  --lo que ahcemos ahora son instancias flip-flop 1
      port map( 
		   clk   =>   clk,   --es un clock global 		   
		   rst   =>   rst,   --tambien es un reset global  
		   ena   =>   ena,   --tambien es un habilitador global
		   D	 =>   D1_aux,
		   Q     =>   Q1   
		   );
		   
   ffd_2: entity work.ffd --lo que ahcemos ahora son instancias flip-flop 2
      port map( 
		   clk   =>   clk,   --es un clock global 		   
		   rst   =>   rst,   --tambien es un reset global  
		   ena   =>   ena,   --tambien es un habilitador global
		   D	 =>   D2_aux,
		   Q     =>   Q2   
		   );

   ffd_3: entity work.ffd  --lo que ahcemos ahora son instancias flip-flop 3
      port map( 
		   clk   =>   clk,   --es un clock global 		   
		   rst   =>   rst,   --tambien es un reset global  
		   ena   =>   ena,   --tambien es un habilitador global
		   D	 =>   D3_aux,
		   Q     =>   Q3   
		  );
		   
   	  Q <= Q3 & Q2 & Q1 & Q0; --con este sentido de flecha: <= asignamos (con este sentido de flecha: => se conecta puerto con senial o puerto con puerto)	 
end;








		   
		   
		   
		   
		   
		   
		   
		   