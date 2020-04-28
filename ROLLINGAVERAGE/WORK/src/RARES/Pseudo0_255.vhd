 ---------------------------------------------------------------------------------------------------
--				 		
-- Title       : Pseudo0_255
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : Pseudo0_255.vhd
-- Generated   : Mon Apr 27 13:34:10 2020
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

entity Pseudo0_255 is
  port ( cout:out std_logic_vector (7 downto 0);
   		 enable, clk, reset :in  std_logic);                
end entity;

architecture PseudoRNG of Pseudo0_255 is
    signal count :std_logic_vector (7 downto 0) := "11101100";
    signal linear_feedback :std_logic;

begin
    linear_feedback <= not(count(5) xor count(3));
    process (clk, reset) begin
        if (reset = '1') then
            count <= "11101100";
        elsif (rising_edge(clk)) then
            if (enable = '1') then
                count <= (count(6) & count(5) & count(4) & count(3) 
                           & count(2) & count(1) & count(0) & 
                         linear_feedback);
            end if;
        end if;
    end process;
    cout <= count;
end PseudoRNG;