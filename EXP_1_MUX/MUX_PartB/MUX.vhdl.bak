 library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity MUX  is
  port (I1, I0, S: in std_logic; Y: out std_logic);
end entity MUX;
architecture Struct of MUX is
  signal c,o1,o2: std_logic;
begin
  n1: INVERTER port map(A => S, Y => c);
  a1: AND_2 port map (A => I1, B => S, Y => o1);
  a2: AND_2 port map (A => I0, B => c, Y => o2); 
  or1: OR_2 port map(A => o1, B => o2, Y => Y);
  
end Struct;