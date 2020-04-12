---------------------------------------------------------------------------------------------------
--
-- Title       : ShiftRegister
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : ShiftRegister.vhd
-- Generated   : Sun Apr 12 14:33:48 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ShiftRegister} architecture {ShiftRegister}}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This component is a shift register which will eliminate the additional binary digits of the sum, obtaining the average
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegister is
	port(
	D: in STD_LOGIC_vector(11 downto 0);
	Length : IN STD_LOGIC_VECTOR (2 downto 0);
	     clock, RESET: in STD_LOGIC;
		 q: inout STD_LOGIC_vector(11 downto 0));
end ShiftRegister;		 

architecture ShiftRegister of ShiftRegister is
begin

	-- SHIFT REGISTER
	process(clock,RESET) 
	begin
		if(RESET = '1')then 
			q <= "000000000000";
		elsif (clock'event and clock = '1') then
			if(Length(2) = '0') then 
				q<=q;
			else
   				CASE(Length(1 downto 0)) is
				   when "00" =>	q <= "0"    & D (11 downto 1); 
				   when "01" =>	q <= "00"   & D (11 downto 2);
				   when "10" =>	q <= "000"  & D (11 downto 3);
				   when "11" =>	q <= "0000" & D (11 downto 4);	   
				   when others => q<=D;
				end case;	
			end if;
		end if;
	end process;	
end architecture ShiftRegister;
