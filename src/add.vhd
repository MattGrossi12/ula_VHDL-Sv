library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------
--              Half-Adder               --
-------------------------------------------

entity half_adder is
    port (      
        a,b      : in  std_logic;
        s_o,cout : out std_logic
    );
end entity;

architecture half_adder of half_adder is
begin
    s_o     <= a xor b;
    cout    <= a and b;
end architecture;

-------------------------------------------
--              Full-Adder               --
-------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity full_adder is
    port (      
        a,b,cin  : in  std_logic;
        s_o,cout : out std_logic
    );
end entity;

architecture full_adder of full_adder is
begin
    s_o     <= a xor b xor cin;
    cout    <= (a and b) or ((a xor b) and cin);
end architecture;

-------------------------------------------
--             Adder-block               --
-------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity adder_block is

    generic (
            WIDTH : integer := 8;    
            T_WID : integer := (WIDTH-1)
        );

    port (      
        a,b      : in  std_logic_vector(T_WID downto 0);
        s_o      : out std_logic_vector(T_WID downto 0);
        cout     : out std_logic
    );
 end entity;

architecture adder_block of adder_block is 
signal carry_w : std_logic_vector(T_WID downto 0);

component full_adder is
    port (      
        a,b,cin  : in  std_logic;
        s_o,cout : out std_logic
    );
end component;

component half_adder is
    port (      
        a,b      : in  std_logic;
        s_o,cout : out std_logic
    );
end component;
begin
--Entity:
adder_a :half_adder
    port map(
        a        => a(0),
        b        => b(0),
        s_o      => s_o(0),
        cout 	 => carry_w(0)
    );

    gen_adder: for i in 1 to T_WID generate
        FA: full_adder
            port map(
                        a       => a(i),
                        b       => b(i),
                        cin     => carry_w(i-1),
                        s_o     => s_o(i),
                        cout    => carry_w(i)
                    );
    end generate gen_adder;

    cout <= carry_w(T_WID);

    end architecture;