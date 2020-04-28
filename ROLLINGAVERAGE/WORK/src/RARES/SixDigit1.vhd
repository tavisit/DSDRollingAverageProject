 ---------------------------------------------------------------------------------------------------
--
-- Title       : SixDigit1
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : SixDigit1.vhd
-- Generated   : Mon Apr 27 13:40:34 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 0->1->3->6->5->2->0
--
---------------------------------------------------------------------------------------------------	

library ieee;
use ieee.std_logic_1164.all; 

entity SixDigit1 is
  port ( cout:out std_logic_vector (7 downto 0);
   		 enable, clk, reset :in  std_logic);
end entity;

architecture Seq of SixDigit1 is
    signal count :std_logic_vector (7 downto 0) := "00000000";
    signal linear_feedback :std_logic;

begin
    linear_feedback <= not(count(2) xor count(1));
    process (clk, reset) begin
        if (reset = '1') then
            count <= "00000000";
        elsif (rising_edge(clk)) then
			if (count = "00000010") then
				count <= "00000000";
            elsif (enable = '1') then
                count <= (count(7) & count(6) & count(5) & count(4) & count(3) & count(1) & count(0) & linear_feedback); 
            end if;
        end if;
    end process;
    cout <= count;
end Seq;