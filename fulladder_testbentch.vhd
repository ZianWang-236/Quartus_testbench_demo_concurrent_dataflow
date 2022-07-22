library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder_testbentch is
end entity;

architecture dataflow of fulladder_testbentch is
component adder_ff is
port(
a,b,cin : in std_logic;
sum,carry : out std_logic);
end component;

signal aa,bb,cinn,summ,carryy : std_logic;

begin

uut : adder_ff port map(
a =>aa,
b =>bb,
cin => cinn,
sum =>summ,
carry => carryy);

aa <= '0', '1' after 80 ns;
bb <= '0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns;
cinn <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns,
       '0' after 120 ns, '1' after 140 ns;
		 
terminal:process
begin

wait for 10ns;
assert ((aa = '0') and (bb = '0') and (cinn = '0') and (summ = '0') and (carryy = '0'))
report "test failed for input combination 000" severity error;

wait for 20ns;
assert ((aa = '0') and (bb = '0') and (cinn = '1') and (summ = '1') and (carryy = '0'))
report "test failed for input combination 001" severity error;

wait for 20ns;
assert ((aa = '0') and (bb = '1') and (cinn = '0') and (summ = '1') and (carryy = '0'))
report "test failed for input combination 010" severity error;

wait for 20ns;
assert ((aa = '0') and (bb = '1') and (cinn = '1') and (summ = '0') and (carryy = '1'))
report "test failed for input combination 011" severity error;

wait for 20ns;
assert ((aa = '1') and (bb = '0') and (cinn = '0') and (summ = '1') and (carryy = '0'))
report "test failed for input combination 100" severity error;

wait for 20ns;
assert ((aa = '1') and (bb = '0') and (cinn = '1') and (summ = '0') and (carryy = '1'))
report "test failed for input combination 101" severity error;

wait for 20ns;
assert ((aa = '1') and (bb = '1') and (cinn = '0') and (summ = '0') and (carryy = '1'))
report "test failed for input combination 110" severity error;
wait;

end process;

end dataflow;