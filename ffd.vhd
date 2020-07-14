library IEEE;
use IEEE.std_logic_1164.all;

entity ffd is
   port(
       clk: in std_logic;
	   rst: in std_logic;
	   ena: in std_logic;
	   D: in std_logic;
	   Q: out std_logic	   
   );
end;

architecture ffd_arq of ffd is 
begin    --cuerpo de arquitectura
                       -- el process solo lo puedo usar para regstros y ffs
   process(clk)   --este process va a ser disparado cuando cuando haya un flanco asendente o descendente de reloj 
   begin
   
      if rising_edge(clk) then     --es una funcion que verifica que hubo un elflanco asendente de reloj, como todos los circuitos sincronicos (falling_edge para flanco descendente)
	     if rst = '1' then         --entonces preguntamos  si el habilitador esta en '1' entonces
	     Q <= '0';                 --entonces a la salida se le asigna 0 (si fuera un registro seria un vector osea con n bits de 0, en vez de un solo '0')
      elsif ena = '1' then         --si el rst no esta en '1' entonces habilitamos el ena, entonces si el ena esta en '1'
	        Q <= D;                --entonces habilitamos a la salida la entrada, osea el estado anterior 
         end if; 
      end if;
   end process;	  
   
end;


