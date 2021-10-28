 library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Full_Adder  is
  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end entity Full_Adder;
architecture Struct of Full_Adder is
  signal tC, tS, U, V: std_logic;
begin
  -- component instances
  ha: Half_Adder 
       port map (A => A, B => B, S => tS, C => tC);

  -- propagate carry.
  a1: AND_2 port map (A => tS, B => Cin, Y => V);
  o1: OR_2  port map (A => V, B => tC, Y => Cout);

  -- final sum.
  x1: XOR_2 port map (A => tS, B => Cin, Y => S);
end Struct;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Full_Adder_8  is
  port (A, B: in std_logic_vector(7 downto 0); Y: out std_logic_vector(8 downto 0));
end entity Full_Adder_8;
architecture Struct of Full_Adder_8 is
	component Full_Adder
	 port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component;
  signal C: std_logic_vector(6 downto 0);
begin
  -- component instances
  Full_Adder_0: Full_Adder port map(A => A(0),B => B(0),Cin => '0',S => Y(0),Cout => C(0));
  Full_Adder_1: Full_Adder port map(A => A(1),B => B(1),Cin => C(0),S => Y(1),Cout => C(1));
  Full_Adder_2: Full_Adder port map(A => A(2),B => B(2),Cin => C(1),S => Y(2),Cout => C(2));
  Full_Adder_3: Full_Adder port map(A => A(3),B => B(3),Cin => C(2),S => Y(3),Cout => C(3));
  Full_Adder_4: Full_Adder port map(A => A(4),B => B(4),Cin => C(3),S => Y(4),Cout => C(4));
  Full_Adder_5: Full_Adder port map(A => A(5),B => B(5),Cin => C(4),S => Y(5),Cout => C(5));
  Full_Adder_6: Full_Adder port map(A => A(6),B => B(6),Cin => C(5),S => Y(6),Cout => C(6));
  Full_Adder_7: Full_Adder port map(A => A(7),B => B(7),Cin => C(6),S => Y(7),Cout => Y(8));
  
end Struct;
