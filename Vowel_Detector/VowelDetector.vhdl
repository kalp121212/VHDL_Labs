 library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity Vowel_Detector  is
  port (X: in std_logic_vector(3 DOWNTO 0); Y: out std_logic);
end entity Vowel_Detector;
architecture Struct of Vowel_Detector is
  signal t,I: std_logic;
begin
	AND1: AND_2 port map(A => X(3), B => X(2), Y => t);
	XOR1: XOR_2 port map(A => t, B => X(1), Y => I);
	NOR1: NOR_2 port map(A => X(0), B => I, Y => Y);
end Struct;