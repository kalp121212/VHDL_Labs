 library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity MUX_2  is
  port (I1, I0, S: in std_logic; Y: out std_logic);
end entity MUX_2;
architecture Struct of MUX_2 is
  signal c,o1,o2: std_logic;
begin
  n1: INVERTER port map(A => S, Y => c);
  a1: AND_2 port map (A => I1, B => S, Y => o1);
  a2: AND_2 port map (A => I0, B => c, Y => o2); 
  or1: OR_2 port map(A => o1, B => o2, Y => Y);
  
end Struct;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX is
  port (I: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			Y: out std_logic);
end entity MUX;
architecture Struct of MUX is
  signal c,o1,o2: std_logic;
  COMPONENT MUX_2
    port (I1, I0, S: in std_logic; Y: out std_logic);
	END COMPONENT;
begin
  MUX1: MUX_2 port map(I1 => I(3), I0 => I(2), S => S(0), Y => o2);
  MUX2: MUX_2 port map(I1 => I(1), I0 => I(0), S => S(0), Y => o1);
  OUT_MUX: MUX_2 port map(I1 => o2, I0 => o1, S => S(1), Y => Y);
  
end Struct;