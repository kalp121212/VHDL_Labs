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
entity Multiplier  is
  port (A : in std_logic_vector(3 downto 0);B: in std_logic_vector(2 downto 0);
	M: out std_logic_vector(6 downto 0));
end entity Multiplier;
architecture Struct of Multiplier is
signal C:std_logic_vector(3 downto 0);
signal carry,car:std_logic_vector(2 downto 0);
signal t01,t10,t20,t11,t30,t21,t31,t02,t12,t22,t32:std_logic;
COMPONENT Full_Adder
    PORT ( A,B,Cin  : IN STD_LOGIC ;
            S, Cout     : OUT STD_LOGIC ) ;
END COMPONENT; 
begin
	and00: AND_2 port map(A => A(0), B => B(0), Y => M(0));
	and10: AND_2 port map(A => A(1), B => B(0), Y => t10);
	and01: AND_2 port map(A => A(0), B => B(1), Y => t01);
	and02: AND_2 port map(A => A(0), B => B(2), Y => t02);
	and11: AND_2 port map(A => A(1), B => B(1), Y => t11);
	and21: AND_2 port map(A => A(2), B => B(1), Y => t21);
	and31: AND_2 port map(A => A(3), B => B(1), Y => t31);
	and32: AND_2 port map(A => A(3), B => B(2), Y => t32);
	and22: AND_2 port map(A => A(2), B => B(2), Y => t22);
	and12: AND_2 port map(A => A(1), B => B(2), Y => t12);
	and30: AND_2 port map(A => A(3), B => B(0), Y => t30);
	and20: AND_2 port map(A => A(2), B => B(0), Y => t20);
	
	fa1: Full_Adder port map(A => t10, B => t01, Cin => '0', S => M(1), Cout => carry(0));	
	fa2: Full_Adder port map(A => t20, B => t11, Cin => carry(0), S => C(0), Cout => carry(1));
	fa3: Full_Adder port map(A => t30, B => t21, Cin => carry(1), S => C(1), Cout => carry(2));
	fa4: Full_Adder port map(A => '0', B => t31, Cin => carry(2), S => C(2), Cout => C(3));
	
	final_adder1: Full_Adder port map(A => t02, B => C(0), Cin => '0', S => M(2), Cout => car(0));
	final_adder2: Full_Adder port map(A => t12, B => C(1), Cin => car(0), S => M(3), Cout => car(1));
	final_adder3: Full_Adder port map(A => t22, B => C(2), Cin => car(1), S => M(4), Cout => car(2));
	final_adder4: Full_Adder port map(A => t32, B => C(3), Cin => car(2), S => M(5), Cout => M(6));
end Struct;