library IEEE;
use IEEE.std_logic_1164.all;

entity adder_ff is
port(
a,b,cin : IN std_logic;
sum,carry : OUT std_logic);
end adder_ff;

architecture behavioral of adder_ff is
begin

sum <= (a xor b) xor cin;
carry <= (a and b) or (b and cin) or (cin and a);
end behavioral;