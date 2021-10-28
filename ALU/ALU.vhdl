library ieee;
use ieee.std_logic_1164.all;

entity alu_beh is
    generic(
        operand_width : integer:=4;
        sel_line : integer:=2
        );
    port (
        A: in std_logic_vector(operand_width-1 downto 0);
        B: in std_logic_vector(operand_width-1 downto 0);
        sel: in std_logic_vector(sel_line-1 downto 0);
        op: out std_logic_vector((operand_width*2)-1 downto 0)
    ) ;
end alu_beh;

architecture a1 of alu_beh is
    function add(A: in std_logic_vector(operand_width-1 downto 0); B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
            -- Declare "sum" and "carry" variable
            -- you can use aggregate to initialize the variables & signals as shown below
            --    variable variable_name : std_logic_vector(3 downto 0) := (others => '0');
				variable sum,carry : std_logic_vector(4 downto 0) := (others => '0');
				variable i: integer;
        begin 
            -- write logic for addition
            -- Hint: Use for loop
				
				addition: for i in 0 to 3 loop
					sum(i) := A(i) xor B(i) xor carry(i);
					carry(i+1) := (A(i) and B(i)) or (A(i) and carry(i)) or (B(i) and carry(i));
				end loop;
				sum(4) := carry(4);
            return sum;
    end add;

 
begin
alu : process( A, B, sel )
	variable xort:std_logic_vector(3 downto 0);
	variable i: integer;
begin
   -- complete VHDL code for various outputs of ALU based on select lines
   -- Hint: use if/else statement
   --
   -- add function usage :
   --   signal_name <= add(A,B)
   --   variable_name := add(A,B)
   --
   -- concatenate operator usage:
   --    "0000"&A 
	if (sel(1) = '0' and sel(0) = '0') then
		op <= A&B;
	elsif (sel(1) = '0' and sel(0) = '1') then
		op <= "000"&add(A,B);
	elsif (sel(1) = '1' and sel(0) = '0') then
		xor1: for i in 0 to 3 loop
			xort(i) := A(i) xor B(i);
		end loop;
		op <= "0000"&xort;
	else
		op <= "000"&add(A,A);
	end if;
end process ; -- alu
end a1 ; -- a1
 	