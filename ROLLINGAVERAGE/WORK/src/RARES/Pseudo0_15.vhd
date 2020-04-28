 ---------------------------------------------------------------------------------------------------
--
-- Title       : Pseudo0_15
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : Pseudo0_15.vhd
-- Generated   : Mon Apr 27 13:50:05 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------	
library ieee;
use ieee.std_logic_1164.all;

entity Pseudo0_15 is
  port ( cout:out std_logic_vector (7 downto 0);
   		 enable, clk, reset :in  std_logic);
end Pseudo0_15;

architecture PseudoRNG of Pseudo0_15 is
    signal count :std_logic_vector (7 downto 0) := "00001011";
    signal linear_feedback :std_logic;

begin
    linear_feedback <= not(count(2) xor count(1));
    process (clk, reset) begin
        if (reset = '1') then
            count <= "00001011";
        elsif (rising_edge(clk)) then
            if (enable = '1') then
                count <= (count(7) & count(6) & count(5) & count(4) & count(2) & count(1) & count(0) & linear_feedback);
            end if;
        end if;
    end process;
    cout <= count;
end PseudoRNG;