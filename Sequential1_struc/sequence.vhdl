library ieee;
use ieee.std_logic_1164.all;
library work;
use work.flipflop.all; 

entity sequence_struct is
port (reset,clock: in std_logic;
y:out std_logic_vector(2 downto 0));
end entity sequence_struct;
architecture struct of sequence_struct is 
signal D2,D1,D0 :std_logic;
signal Q:std_logic_vector(2 downto 0);
begin
-- write the equations here
D2 <= Q(2) xnor (Q(1) xor Q(0));
D1 <= (Q(2) and (not Q(0))) or ((not Q(2)) and (not Q(1))); 
D0 <= ((not Q(2)) and Q(0)) or (Q(2) and Q(1));
y(2) <= Q(2);
y(1) <= Q(1);
y(0) <= Q(0);

-- Do the port mapping                          --asynchronous reset
--Q0
dff_0  : dff2 port map(D => D0, clk => clock, reset => reset, Q => Q(0));

--Q1
dff_1  : dff1 port map(D => D1, clk => clock, reset => reset, Q => Q(1));

--Q2
dff_2  : dff2 port map(D => D2, clk => clock, reset => reset, Q => Q(2));


end struct;