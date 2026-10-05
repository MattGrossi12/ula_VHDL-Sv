library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
	generic(
    	WIDTH : integer := 8;
        T_WID : integer := (WIDTH-1)
    );
    
    port (
        a : in  std_logic(T_WID downto 0);
        b : in  std_logic(T_WID downto 0); 
        y : out std_logic(T_WID downto 0)
    );
end entity;

architecture rtl or_gate is
begin
    y <= a or b;
end architecture;