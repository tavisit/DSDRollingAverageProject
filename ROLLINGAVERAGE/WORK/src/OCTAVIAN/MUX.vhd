---------------------------------------------------------------------------------------------------
--
-- Title       : MUX
-- Design      : Project
-- Author      : OctavianMatei
-- Company     : UT Cluj-Napoca
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX.vhd
-- Generated   : Sun Apr 12 15:47:48 2020
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
--{entity {MUX} architecture {MUX}}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This component is a 4 to 1 MUX with the option to choose between the 2, 4, 8, 16 number sums
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX is	
	PORT ( A: IN STD_LOGIC_VECTOR(8 downto 0);
	B : IN STD_LOGIC_VECTOR(9 downto 0);
	C : IN STD_LOGIC_VECTOR(10 downto 0);
	D : IN STD_LOGIC_VECTOR(11 downto 0);
	SELECTION_LENGTH: IN STD_LOGIC_VECTOR(2 downto 0);
	SUM : OUT STD_LOGIC_VECTOR(11 downto 0));
end MUX;

--}} End of automatically maintained section

architecture MUX of MUX is
begin
	PROCESS(SELECTION_LENGTH,A,B,C,D)
	Begin		
		if(SELECTION_LENGTH(2) = '0') then SUM <= "000000000000";
		else   
			CASE(SELECTION_LENGTH(1 downto 0)) is
				WHEN "00" => SUM <= "000"&A;
				WHEN "01" => SUM <=	"00"&B;
				WHEN "10" => SUM <=	"0"&C;
				WHEN "11" => SUM <=	D; 
				WHEN OTHERS => SUM <= "000000000000";
			END CASE;
		end if;
	end PROCESS;
	 -- enter your statements here --

end MUX;
