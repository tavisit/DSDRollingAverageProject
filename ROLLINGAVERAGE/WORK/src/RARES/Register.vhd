---------------------------------------------------------------------------------------------------
--
-- Title       : Register
-- Design      : WORK
-- Author      : Man Rares
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : Register.vhd
-- Generated   : Mon Apr 27 13:52:59 2020
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

entity Reg is
	port ( Clk: in std_logic;
		   D: in std_logic_vector(7 downto 0);
		   Q: out std_logic_vector(7 downto 0));
end Reg;

architecture Reg of Reg is 
begin
	process (Clk) 
	begin
 		if rising_edge(Clk) then
 			Q <= D;
 		end if;
	end process;
end Reg; 