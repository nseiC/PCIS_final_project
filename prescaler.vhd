library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prescaler is
	port(
		clk,rst	:in std_logic;
		clkout	:out std_logic
	);
end entity;

architecture behavior of prescaler is
	
	constant MAX_PULSES 	:	integer	:= 250000;
	signal   count 		:	integer	:= 0;
	signal 	myout			:	std_logic:= '0';
	
	begin
	
		process(clk,rst)
		begin
			if rst = '1' then
				myout <= '0';
				count <= 0;
			elsif	clk'EVENT and clk = '0' then
				if count = MAX_PULSES then 
					count <= 0;
					myout <= not myout;
				else
					count <= count + 1;
				end if;
			end if;
		end process;
	clkout <= myout;
end architecture;