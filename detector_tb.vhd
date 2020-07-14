Library IEEE; 
use IEEE.std_logic_1164.all;
use work.all;

entity detector_tb is 
end;

architecture detector_tb_arq of detector_tb is
  
--traemos el contador que queremos probar y cambio entity (de donde lo copie) por component  
component detector is   --detector
   port(
      input: in std_logic;
      clk: in std_logic;
      rst: in std_logic;
      ena: in std_logic;
      Q: out std_logic
   );
end component;
   
--ahora tengo que poner las seniales que voy a necesitar
   signal clk_tb:   std_logic := '0';   --notar que no hace falta poner tb solo lo hago ara aclarar que se generaron en este banco de pruebas
   signal rst_tb:   std_logic := '1';
   signal ena_tb:   std_logic := '1'; 
   signal Q_tb:     std_logic;   
   signal input_tb: std_logic := '0'; 
   
begin 

    clk_tb    <= not clk_tb after 10 ns;   --va a crear una onda cuadrada de 40 ns de periodo
    rst_tb    <= '0' after 1  ns;   --apenas arranco bajo el rst a cero, osea arranca reseteado y a los 200ns se va a liberar 
	input_tb  <= '1' after 5 ns, 
	'0' after 15 ns,
	'0' after 25 ns,
    '1' after 35 ns,
    '0' after 45 ns,  
	'1' after 55 ns,
	'1' after 65 ns,
	'0' after 75 ns,
	'1' after 85 ns,  
	'0' after 95 ns,
	'0' after 105 ns,
	'1' after 115 ns,
	'0' after 125 ns,  
	'1' after 135 ns,
	'1' after 145 ns,
	'0' after 150 ns;
	
	
	  
    DUT: detector  
	    port map(
		  clk   => clk_tb,
		  rst   => rst_tb,
		  ena   => ena_tb,
		  Q     => Q_tb,
		  input => input_tb
	   );
	
      	
end;

