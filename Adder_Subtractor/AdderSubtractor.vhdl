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
entity Adder_Subtractor is 
	port (A,B: in std_logic_vector (3 downto 0);
	M: in std_logic ;
	S: out std_logic_vector (3 downto 0);
	Cout: out std_logic );
end entity Adder_Subtractor;
architecture Struct of Adder_Subtractor is
	signal v: std_logic_vector (3 downto 0);
	signal c: std_logic_vector (1 to 3);
	COMPONENT Full_Adder
    PORT ( A,B,Cin  : IN STD_LOGIC ;
            S, Cout     : OUT STD_LOGIC ) ;
	END COMPONENT; 
begin
	xor3: XOR_2 port map(A => M,B => B(3), Y => v(3));
	xor2: XOR_2 port map(A => M,B => B(2), Y => v(2));
	xor1: XOR_2 port map(A => M,B => B(1), Y => v(1));
	xor0: XOR_2 port map(A => M,B => B(0), Y => v(0));

	fulladder0: Full_Adder port map(A => A(0),B => v(0),Cin => M,S => S(0),Cout => C(1));
	fulladder1: Full_Adder port map(A => A(1),B => v(1),Cin => c(1),S => S(1),Cout => C(2));
	fulladder2: Full_Adder port map(A => A(2),B => v(2),Cin => c(2),S => S(2),Cout => C(3));
	fulladder3: Full_Adder port map(A => A(3),B => v(3),Cin => c(3),S => S(3),Cout => Cout);
end Struct;
 	