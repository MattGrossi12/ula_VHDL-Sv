library ieee;
use ieee.std_logic_1164.all;

entity bypass is
	generic(
    	WIDTH : integer := 8;
        T_WID : integer := (WIDTH-1)
    );
    
    port (
        a : in  std_logic(T_WID downto 0);
        y : out std_logic(T_WID downto 0)
    );
end entity;

architecture rtl bypass is
begin
    y <= a;
end architecture;