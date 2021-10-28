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

entity MUX_4 is
  port (I: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			Y: out std_logic);
end entity MUX_4;
architecture Struct of MUX_4 is
  signal c,o1,o2: std_logic;
  COMPONENT MUX_2
    port (I1, I0, S: in std_logic; Y: out std_logic);
	END COMPONENT;
begin
  MUX1: MUX_2 port map(I1 => I(3), I0 => I(2), S => S(0), Y => o2);
  MUX2: MUX_2 port map(I1 => I(1), I0 => I(0), S => S(0), Y => o1);
  OUT_MUX: MUX_2 port map(I1 => o2, I0 => o1, S => S(1), Y => Y);
  
end Struct;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX is
  port (d,c,b,a: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			Y: out std_logic_vector(3 downto 0));
end entity MUX;
architecture Struct of MUX is
  COMPONENT MUX_4
    port (I: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			Y: out std_logic);
	END COMPONENT;
begin
  MUX1: MUX_4 port map(I(3) => d(3), I(2) => c(3), I(1) => b(3), I(0) => a(3),S => S, Y => Y(3));
  MUX2: MUX_4 port map(I(3) => d(2), I(2) => c(2), I(1) => b(2), I(0) => a(2),S => S, Y => Y(2));
  MUX3: MUX_4 port map(I(3) => d(1), I(2) => c(1), I(1) => b(1), I(0) => a(1),S => S, Y => Y(1));
  MUX4: MUX_4 port map(I(3) => d(0), I(2) => c(0), I(1) => b(0), I(0) => a(0),S => S, Y => Y(0));
  
end Struct;