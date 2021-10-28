library ieee;
use ieee.std_logic_1164.all;

entity sequence_behavior is
port (reset,clock: in std_logic;
y:out std_logic_vector(2 downto 0));
end entity sequence_behavior; 

architecture behav  of sequence_behavior is
--state binary encoding
signal state:std_logic_vector(2 downto 0);
constant s_2:std_logic_vector(2 downto 0):="010";
--write the remaining constant declarations    
begin 
-- process for next state and output logic
reg_process: process(clock,reset)
begin
if(reset='1')then 
state<=s_2; -- write the reset state
elsif(clock'event and clock='1')then
case state is  
      --reset
      when s_2=>
     state<="000";
     -- write the remaining choices
		when "000"=>
		state<="110";
		when "110"=>
		state<="111";
		when "111"=>
		state<="001";
		when "001"=>
		state<="011";
		when "011"=>
		state<="101";
		when "101"=>
		state<="100";
		when "100"=>
		state<="010";
       --DEFAULT CASE
      when others=>
        state<=s_2;-- write the reset state
      end case; 
end if;
end process reg_process;
-- output logic concurrent statemet or one more process
y<=state;
end behav;
