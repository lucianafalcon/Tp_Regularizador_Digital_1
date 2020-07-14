Library IEEE; 
use IEEE.std_logic_1164.all;
use work.all;

entity contador_tb is 
end;

architecture contador_tb_arq of contador_tb is
  
--traemos el contador que queremos probar y cambio entity (de donde lo copie) por component  
	 component contador is    
	   port(
		  clk: in std_logic;
		  rst: in std_logic;
		  ena: in std_logic;  
		  Q: out std_logic_vector(3 downto 0)   
	   );
	end component;  
   
--ahora tengo que poner las seniales que voy a necesitar
   signal clk_tb: std_logic := '0';   --notar que no hace falta poner tb solo lo hago ara aclarar que se generaron en este banco de pruebas
   signal rst_tb: std_logic := '1';
   signal ena_tb: std_logic := '1'; 
   signal Q_tb: std_logic_vector(3 downto 0);   
   
begin 

    clk_tb <= not clk_tb after 20 ns;   --va a crear una onda cuadrada de 40 ns de periodo
    rst_tb <= '0' after 200  ns;   --apenas arranco bajo el rst a cero, osea arranca reseteado y a los 200ns se va a liberar 
	  
	  
    DUT: contador  
	    port map(
		  clk   => clk_tb,
		  rst   => rst_tb,
		  ena   => ena_tb,
		  Q     => Q_tb
	   );
	
      	
end;

