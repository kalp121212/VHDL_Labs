-- A DUT entity is used to wrap your design.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(17 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
   component MUX is
     port (d,c,b,a: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			Y: out std_logic_vector(3 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: MUX 
			port map (
					d(3) => input_vector(17),
					d(2) => input_vector(16),
					d(1) => input_vector(15),
					d(0) => input_vector(14),
					
					c(3) => input_vector(13),
					c(2) => input_vector(12),
					c(1) => input_vector(11),
					c(0) => input_vector(10),
					
					b(3) => input_vector(9),
					b(2) => input_vector(8),
					b(1) => input_vector(7),
					b(0) => input_vector(6),
					
					a(3) => input_vector(5),
					a(2) => input_vector(4),
					a(1) => input_vector(3),
					a(0) => input_vector(2),
					
					S(1) => input_vector(1),
					S(0) => input_vector(0),
                              
					Y => output_vector);

end DutWrap;